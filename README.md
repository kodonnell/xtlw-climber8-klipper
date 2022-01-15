# Klipper stack for the XTLW Climber8

This is mostly:

- Klipper + Fluidd in Docker as per [prind](https://github.com/mkuf/prind)
- Config for the XTLW Climber8 (an entry-level IDEX printer). Most of this will apply to any IDEX, and include goodies like a better IDEX display (supporting multiple heads, multiple fans, etc.)
- Designed for Cura.

## Using it

```sh
docker-compose --profile fluidd up -d # spin it up
docker-compose --profile fluidd down # and down
```

See [prind](https://github.com/mkuf/prind) for more detail (e.g. flashing MCU, other frontends, etc.)

## IDEX calibration

Print `./prints/idex_offset_calibration/idex_y_offset_calibration.gcode`. You'll the lines when you print it, but for reference (since I don't have the STLs just the gcode), the left min/max `Y` is 46/174, and right extruder min/max is 45.2/174.8 - therefore every step the difference between left and right is 0.04mm. So if we align at e.g. the +15th, this means the right extruder is 15x0.04 = 0.6mm too low, so our offset should be +0.6 over what we currently have.

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

- Get Cura config in. Add M73 progress to it by default.
- Calibration docs - copy across from that PR.
- Add duplicate/mirror mode from the PR.
- Copy machine limits across from cura to klipper.
- Do heaters auto-disable if they are active for too long doing nothing?
- How do we load/unload filament?
- Why do I sometimes need to restart the stack? Debug that.
- Need more cooling - slow down on small parts?
- Hardware:
  - Stiffen? And straighten.
  - More part cooling fans?
  - Purge bucket and silicon/wire brush?
