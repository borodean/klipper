import { readFile, writeFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

class Config {
  constructor(source, includeComments = true) {
    this.sections = [];
    let currSection;
    let currProp;

    for (const line of source.split(/\r?\n/)) {
      const { indent, content, comment } = line.match(
        /^(?<indent> *)(?<content>.*?)(?:\s*#\s*(?<comment>.*?))?\s*$/,
      ).groups;

      if (indent.length > 0) {
        currProp.value.push(line);
        continue;
      }

      ({ currSection, currProp } = this._parseLine(
        content,
        currSection,
        currProp,
        { comment },
      ));

      if (content || !includeComments || !comment) {
        continue;
      }

      ({ currSection, currProp } = this._parseLine(
        comment,
        currSection,
        currProp,
        { disabled: true },
      ));
    }
  }

  copyProps(sourceSection, targetSection, matcher = /.*/) {
    const source = this.sections.find(
      (section) => section.name === sourceSection,
    );
    let target = this.sections.find(
      (section) => section.name === targetSection,
    );

    if (!target) {
      const sourceIndex = this.sections.indexOf(source);
      target = { name: targetSection, props: [] };
      this.sections.splice(sourceIndex + 1, 0, target);
    }

    for (const prop of source.props) {
      if (!matcher.test(prop.name)) {
        continue;
      }

      target.props.push(prop);
    }

    return this;
  }

  mergeSections() {
    const sections = {};
    for (const section of this.sections) {
      if (!sections[section.name]) {
        sections[section.name] = { ...section, props: [] };
      }

      sections[section.name].props.push(...section.props);
    }

    this.sections = Object.values(sections);

    return this;
  }

  normalizeKeys() {
    for (const section of this.sections) {
      for (const prop of section.props) {
        let match;
        if (
          (match = prop.name.match(/^initial_(?<color>BLUE|GREEN|RED|WHITE)$/i))
        ) {
          prop.name = `initial_${match.groups.color.toUpperCase()}`;
        } else if ((match = prop.name.match(/^driver_(?<register>.+)$/i))) {
          prop.name = `driver_${match.groups.register.toUpperCase()}`;
        } else if (/^pid_Kd$/i.test(prop.name)) {
          prop.name = "pid_Kd";
        } else if (/^pid_Ki$/i.test(prop.name)) {
          prop.name = "pid_Ki";
        } else if (/^pid_Kp$/i.test(prop.name)) {
          prop.name = "pid_Kp";
        } else if (/^rtd_use_50Hz_filter$/i.test(prop.name)) {
          prop.name = "rtd_use_50Hz_filter";
        } else if (/^tc_use_50Hz_filter$/i.test(prop.name)) {
          prop.name = "tc_use_50Hz_filter";
        } else {
          prop.name = prop.name.toLowerCase();
        }
      }
    }

    return this;
  }

  normalizeValues() {
    for (const section of this.sections) {
      for (const prop of section.props) {
        if (!prop.value[0]) {
          continue;
        }

        if (["true", "false"].includes(prop.value[0])) {
          prop.value[0] = capitalize(prop.value[0]);
          continue;
        }

        const number = Number(prop.value[0]);
        if (!Number.isNaN(number)) {
          prop.value[0] = number.toString();
        }
      }
    }

    return this;
  }

  validate(reference) {
    for (const section of this.sections) {
      if (section.name.startsWith("include ")) {
        continue;
      }

      let refSectionName = this._getStandardSectionName(section);

      const refSection = reference.sections.find(
        (refSection) => refSection.name === refSectionName,
      );

      if (!refSection) {
        console.warn("Unknown section: %s", section.name);
        continue;
      }

      for (const prop of section.props) {
        let refPropName = this._getStandardPropName(section, prop);

        const refProp = refSection.props.find(
          (refProp) => refProp.name === refPropName,
        );

        if (!refProp) {
          console.warn("Unknown property: %s.%s", section.name, prop.name);
          continue;
        }

        if (refProp.value.join("\n") === prop.value.join("\n")) {
          console.log("Using default value for %s.%s", section.name, prop.name);
        }
      }
    }

    return this;
  }

  sortSections(reference) {
    this.sections.sort((a, b) => {
      const refNameA = this._getStandardSectionName(a);
      const refNameB = this._getStandardSectionName(b);

      return (
        reference.sections.findIndex((section) => section.name === refNameA) -
        reference.sections.findIndex((section) => section.name === refNameB)
      );
    });

    return this;
  }

  sortProps(reference) {
    this.sections.forEach((section) => {
      section.props.sort((a, b) => {
        const refSectionName = this._getStandardSectionName(section);
        const refSection = reference.sections.find(
          (refSection) => refSection.name === refSectionName,
        );

        if (!refSection) {
          return 0;
        }

        const refNameA = this._getStandardPropName(refSection, a);
        const refNameB = this._getStandardPropName(refSection, b);

        return (
          refSection.props.findIndex((prop) => prop.name === refNameA) -
          refSection.props.findIndex((prop) => prop.name === refNameB)
        );
      });
    });

    return this;
  }

  toString() {
    return (
      this.sections
        .map(({ name, comment, disabled, props }) => {
          const prefix = `${disabled ? "# " : ""}[${name}]${
            comment ? ` # ${comment}` : ""
          }`;

          return [
            prefix,
            ...props.map(({ name, comment, disabled, value }) => {
              const prefix = disabled ? `# ${name}:` : `${name}:`;
              const postfix = comment ? ` # ${comment}` : "";

              if (value.length === 0) {
                return `${prefix}${postfix}`;
              }

              if (value.length === 1) {
                return `${prefix} ${value[0]}${postfix}`;
              }

              return `${prefix}${postfix}\n${value.join("\n")}`;
            }),
          ]
            .filter(Boolean)
            .join("\n");
        })
        .join("\n\n") + "\n"
    );
  }

  _getStandardSectionName(section) {
    if (section.name.startsWith("board_pins")) {
      return "board_pins my_aliases";
    }
    if (section.name.startsWith("delayed_gcode")) {
      return "delayed_gcode my_delayed_gcode";
    }
    if (section.name.startsWith("filament_switch_sensor")) {
      return "filament_switch_sensor my_sensor";
    }
    if (section.name.startsWith("gcode_macro")) {
      return "gcode_macro my_cmd";
    }
    if (section.name.startsWith("heater_fan")) {
      return "heater_fan heatbreak_cooling_fan";
    }
    if (section.name.startsWith("mcu")) {
      return "mcu";
    }
    if (section.name.startsWith("output_pin")) {
      return "output_pin my_pin";
    }
    if (section.name.startsWith("static_digital_output")) {
      return "static_digital_output my_output_pins";
    }
    if (section.name.startsWith("temperature_fan")) {
      return "temperature_fan my_temp_fan";
    }
    if (section.name.startsWith("temperature_sensor")) {
      return "temperature_sensor my_sensor";
    }
    if (section.name.startsWith("verify_heater")) {
      return "verify_heater heater_config_name";
    }
    return section.name;
  }

  _getStandardPropName(section, prop) {
    if (
      section.name.startsWith("gcode_macro ") &&
      prop.name.startsWith("variable_")
    ) {
      return "variable_<name>";
    }
    if (section.name === "bed_screws") {
      if (/^screw\d$/.test(prop.name)) {
        return "screw2";
      }
      if (/^screw\d_name$/.test(prop.name)) {
        return "screw2_name";
      }
    }
    return prop.name;
  }

  _parseLine(part, currSection, currProp, { comment, disabled = false } = {}) {
    let match;

    if ((match = part.match(/^\[(?<name>[^\]]+)\].*$/))) {
      currSection = { name: match.groups.name, comment, disabled, props: [] };
      this.sections.push(currSection);
    } else if (
      currSection &&
      (match = part.match(/^(?<name>[^:=]+?)\s*[:=]\s*(?<value>.*?)$/))
    ) {
      currProp = {
        name: match.groups.name,
        comment,
        disabled,
        value: match.groups.value ? [match.groups.value] : [],
      };
      currSection.props.push(currProp);
    }

    return { currSection, currProp };
  }
}

function capitalize(text) {
  return text[0].toUpperCase() + text.slice(1);
}

const reference = new Config(
  await readFile(
    resolve(dirname(fileURLToPath(import.meta.url)), "standard.cfg"),
    "utf8",
  ),
  false,
)
  .normalizeKeys()
  .normalizeValues()
  .mergeSections()
  .copyProps("extruder", "heater_bed", /^pid_K[pid]$/)
  .copyProps("stepper_x", "stepper_y")
  .copyProps("stepper_x", "stepper_z")
  .copyProps("tmc2130 stepper_x", "tmc2130 stepper_y")
  .copyProps("tmc2130 stepper_x", "tmc2130 stepper_z")
  .copyProps("tmc2208 stepper_x", "tmc2208 stepper_y")
  .copyProps("tmc2208 stepper_x", "tmc2208 stepper_z")
  .copyProps("tmc2209 stepper_x", "tmc2209 stepper_y")
  .copyProps("tmc2209 stepper_x", "tmc2209 stepper_z")
  .copyProps("tmc2209 stepper_x", "tmc2209 stepper_a")
  .copyProps("tmc2209 stepper_x", "tmc2209 stepper_b")
  .copyProps("tmc2209 stepper_x", "tmc2209 stepper_c");

for (const fn of process.argv.slice(2)) {
  const config = new Config(await readFile(fn, "utf8"))
    .normalizeKeys()
    .normalizeValues()
    .mergeSections()
    .validate(reference)
    .sortSections(reference)
    .sortProps(reference);

  await writeFile(fn, config.toString(), "utf8");
}
