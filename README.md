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

## Slicing tips/comments

- Retraction distance is only 1mm which is low for bowden - but this is because we're using klipper and pressure advance. If you're not, you may need to tune it a lot higher. Note that for eSun PLA+, printing at 190 seems to reduce stringing a lot, even though that's "too low". Maybe it's wet filament, or maybe our temperature readings are too low.
- Dual mode:
  - Use a purge tower. You'll need it.
  - Using a draft shield can help minimise cross-contamination. I haven't tested this, but turning off z-hop may help ensure the nozzle wipes the draft shield.
  - That said, ensure you're z-hopping on retraction. This also z-hops on tool change. Should test this, and the above point, more.
  - A brim is a good idea, in case the nozzles knock the prints around a bit.

## Slicer vs Klipper?

Originally I thought I'd use Klipper to do most things, as then I could easily change slicers etc. However, it meant quite a lot of dev and figuring stuff out myself, and it wasn't really worth it. Maybe later if/when I add a purge bucket and wipe area I might go back to Klipper doing it all, but for now, Cura. Things will stay in Klipper if they're machine/configuration specific (e.g. offsets) - I want to be able to reprint the same gcode later even if I've retuned the machine (which wouldn't work if e.g. the offsets were in Cura's gcode). 

I'm probably not going to be entirely consistent on this, as it's fun learning new things. 

## Recovering after a power loss / docker update / etc.

Open the klippy.log, and find the last line like

```
Stats 420126.9: gcodein=0  mcu: mcu_awake=0.010 mcu_task_avg=0.000014 mcu_task_stddev=0.000021 bytes_write=23883555 bytes_read=4441273 bytes_retransmit=9 bytes_invalid=0 send_seq=430513 receive_seq=430513 retransmit_seq=2 srtt=0.001 rttvar=0.000 rto=0.025 ready_bytes=15 stalled_bytes=0 freq=168003933 heater_bed: target=60 temp=59.2 pwm=0.000 sd_pos=7250818 sysload=1.14 cputime=454.045 memavail=7759512 print_time=22546.079 buffer_time=2.121 print_stall=0 extruder: target=210 temp=209.3 pwm=0.640 extruder1: target=0 temp=22.2 pwm=0.000
```

Grab the value of `sd_pos` e.g. `23883555` in this example. This is approximately the position in gcode where klipper got up to. To find the line that is, you can do something like the below:

```python
sd_pos = 23883555
with open('<gcode-file>.gcode') as f:
    gcode = f.read()
print("approximately last printed line: {gcode[:sd_pos].count('\n')}")
```

Then, go delete everything before that line, excluding the machine start-up etc. If the line above was e.g. 

```
G1 X89.735 Y101.928 E3687.54304
```

Then, since we're using absolute extruder varlues, ensure you start the extruder from here e.g. insert a

```
G92 E3687.54304
```

## Todo

- https://github.com/5axes/Calibration-Shapes/wiki
- Mirror base from kid's room?
- Make def's like creality e.g.
  - https://github.com/Ultimaker/Cura/blob/main/resources/definitions/creality_base.def.json
  - (variants) https://github.com/Ultimaker/Cura/blob/main/resources/variants/creality_base_0.4.inst.cfg

### Later

- Klipper support for duplicate/mirror mode?
- Display:
  - Screensaver if not printing? I think we'll need to add a new printer variable such as the time, then select full screen glyphs that way.
- Hardware:
  - Stiffen? And straighten.
  - More part cooling fans?
  - Purge bucket and silicon/wire brush?