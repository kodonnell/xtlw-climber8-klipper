# Klipper stack for the XTLW Climber8

This is mostly:

- Klipper + Fluidd in Docker as per [prind](https://github.com/mkuf/prind)
- Config for the XTLW Climber8 (an entry-level IDEX printer). Most of this will apply to any IDEX, and include goodies like a better IDEX display (supporting multiple heads, multiple fans, etc.)
- Designed for Cura.

## Using it

### Running

```sh
docker-compose down && docker-compose up -d
```

### Flashing MCU

```
alias make_klipper="docker compose -f docker-compose.extra.make.yaml run --rm make"
make_klipper menuconfig # If you need to create a new config at config/firmware.config
make_klipper
make_klipper flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f407xx_24003F000647333137383034-if00 NOSUDO=true
```

See [prind](https://github.com/mkuf/prind) for more detail (e.g. flashing MCU, other frontends, etc.)

## Configuring printer

### Begin

https://github.com/AndrewEllis93/Print-Tuning-Guide/blob/1ff2312115deff7bcfe34d700056dd36facee3c1/articles/before_we_begin.md

### Level bed

See LCD. Motion -> Level Corners. Move through each four corners leveling with a sheet of paper. Use T0.

### T1 offset

Calibrate first layer with paper trick, this time changing extruder 1 Z offset to adjust height. (Move back and forward - I don't think it moves if you just change it.)

### Calibrate e-steps - T0 and T1

https://docs.vorondesign.com/build/startup/#extruder-calibration-e-steps

### First layer T0 & T1

https://github.com/AndrewEllis93/Print-Tuning-Guide/blob/1ff2312115deff7bcfe34d700056dd36facee3c1/articles/first_layer_squish.md

Use STL `./prints/first-layer/first-layer-patch-0.25mm.stl` and slice with initial layer height = 0.25mm and width = 120%. Use can use `./prints/first-layer/first-layer-patch-0.25mm-120%-*.gcode` which are already sliced with these parameters.

### Pressure advance

Print `./prints/pressure-advance/*` and pick the best, then set it in `./config/macros/start_stop.cfg`

### Extrusion multiplier

Print at 2% intervals first. Open `./prints/configuration/extrusion-multiplier/pressure-advance-0.94-1.06-x-0.02_t0.3mf` first which has all the settings and per-cube flow settings. Or just use the pre-sliced `./prints/configuration/extrusion-multiplier/pressure-advance-0.94-1.06-x-0.02_t0.gcode`.

See https://github.com/AndrewEllis93/Print-Tuning-Guide/blob/main/articles/extrusion_multiplier.md#examples to decide what's "best".

### Input shaping

https://www.klipper3d.org/Resonance_Compensation.html

Follow the above, and use `./prints/configuration/input-shaping/ringing-tower-t0.gcode` (or the 3MF which has the settings already).

### IDEX calibration

Print `./prints/idex_offset_calibration/idex_y_offset_calibration.gcode`. You'll the lines when you print it, but for reference (since I don't have the STLs just the gcode), the left min/max `Y` is 46/174, and right extruder min/max is 45.2/174.8 - therefore every step the difference between left and right is 0.04mm. So if we align at e.g. the +15th, this means the right extruder is 15x0.04 = 0.6mm too low, so our offset should be +0.6 over what we currently have.

## Copying settings to Cura

- Install Cura and find home directory `Help -> Show Configuration Folder`. This is likely to be e.g. `~/.local/share/cura/<version>`.
- Delete this.
- Replace with symlink to `./cura`
- Now open Cura again, and `Add printer` and add the `XTLW 3D` ones nears the bottom.
- You can add the relevant plugins to each printer instance, or just add this after `group_id = ...` in the `[metadata]` section:
  ```txt
  post_processing_scripts = [DisplayProgressOnLCD]\\\ntime_remaining = True\\\ntime_remaining_method = m73\\\nupdate_frequency = 15\\\npercentage = True\\\n\\\n
    [SearchAndReplace]\\\nsearch = ;Generated with Cura_SteamEngine .*\nT[01]\\\nreplace = ; KO: custom Search and Replace post-processing plugin in Cura to remove Cura's activation of extruder before start gcode\\\nis_regex = True\\\n\\\n
    [SearchAndReplace]\\\nsearch = ;LAYER_COUNT:(.*)\\\nreplace = ;LAYER_COUNT:\1\nSET_PRINT_STATS_INFO TOTAL_LAYER=\1\\\nis_regex = True\\\n\\\n
    [SearchAndReplace]\\\nsearch = ;LAYER:(.*)\\\nreplace = ;LAYER:\1\nSET_PRINT_STATS_INFO CURRENT_LAYER=\1\\\nis_regex = True\\\n\\\n
  ```

## Slicing tips (Cura)

- Use the Climber8 config provided to you (see [here](https://github.com/MrRandomStranger/XTLW-Climber-8) if you missed it). Specifically:
  - Make sure you're retracting including on tool change.
  - Use a purge tower. You'll need it.
  - Ensure you're z-hopping on retraction. This also z-hops on tool change.
  - Set your temperatures for tool changes accordingly.

## Slicer vs Klipper?

Originally I thought I'd use Klipper to do most things, as then I could easily change slicers etc. However, it meant quite a lot of dev and figuring stuff out myself, and it wasn't really worth it. Maybe later if/when I add a purge bucket and wipe area I might go back to Klipper doing it all, but for now, Cura. Things will stay in Klipper if they're machine/configuration specific (e.g. offsets) - I want to be able to reprint the same gcode later even if I've retuned the machine (which wouldn't work if e.g. the offsets were in Cura's gcode). 

I'm probably not going to be entirely consistent on this, as it's fun learning new things. 

## Todo

- Mirror base from kid's room?
- Make def's like creality e.g.
  - https://github.com/Ultimaker/Cura/blob/main/resources/definitions/creality_base.def.json
  - (variants) https://github.com/Ultimaker/Cura/blob/main/resources/variants/creality_base_0.4.inst.cfg

### Later

- Klipper support for duplicate/mirror mode?
- Settings:
  - Use faster travel - less oozing/stringing. Maybe a bit more retraction on travel?
- Display:
  - Screensaver if not printing? I think we'll need to add a new printer variable such as the time, then select full screen glyphs that way.
- Hardware:
  - Stiffen? And straighten.
  - More part cooling fans?
  - Purge bucket and silicon/wire brush?