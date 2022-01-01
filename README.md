# Klipper stack for the XTLW Climber8

This is mostly:

- Klipper + Fluidd in Docker as per [prind](https://github.com/mkuf/prind)
- Config for the XTLW Climber8 (an entry-level IDEX printer). To be honest, most of this will apply to any IDEX, and include goodies like a better IDEX display, etc.
- Designed for SuperSlicer.

## Using it

```sh
docker-compose --profile fluidd up -d # spin it up
docker-compose --profile fluidd down # and down
```

See [prind](https://github.com/mkuf/prind) for more detail (e.g. flashing MCU, other frontends, etc.)

## Todo

- LCD: make temps work for multiple extruders e.g. heat pla all.
- Add retraction to park
- Copy machine limits across from cura ... mine are too conservative now? Both in klipper and in superslicer.
- Add SuperSlicer config inc. the STL for the plate. Is there a dockerised SuperSlicer?
- Can we auto-disable if heaters are active for too long doing nothing?
- Fix how we can't change extruder at z=0 (I think it goes for z=-0.003 for some reason which is OOB).
- Load/unload filament macros.
- Display - check this out for goodies https://github.com/Klipper3d/klipper/blob/master/klippy/extras/display/menu.cfg
- LCD for live changing offsets?
- Sort out our approach to oozing/purging. 
  - I think the best is probably a purge block and silicon/wire brush. 
  - Ensure we change the temps as needed - don't want to keep them too hot and cook if they're not being used.
  - https://forum.prusaprinters.org/forum/prusaslicer/prusaslicer-post-processing-plugin-for-duet-rrf3-tool-changing-systems/ might be useful - proper purge tower and temperatures etc.
- NB: cura seems to support IDEX a lot better ... maybe back to Cura?
- Why do I sometimes need to restart the stack? Debug that.
- Cancelling sometimes doesn't work. Check that out.
- Get pause/resume working nicely ... the current ones are just the defaults.
- Check we pause on filament runout?
- Printer calibration:
  - Extrusion multiplier.
  - Pressure advance.