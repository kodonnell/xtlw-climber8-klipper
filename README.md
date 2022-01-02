# Klipper stack for the XTLW Climber8

This is mostly:

- Klipper + Fluidd in Docker as per [prind](https://github.com/mkuf/prind)
- Config for the XTLW Climber8 (an entry-level IDEX printer). Most of this will apply to any IDEX, and include goodies like:
  - A better IDEX display (supporting multiple heads, multiple fans, etc.)
  - IDEX parking including retracting and reducing temperature while parked.
- Designed for SuperSlicer.

## Using it

```sh
docker-compose --profile fluidd up -d # spin it up
docker-compose --profile fluidd down # and down
```

See [prind](https://github.com/mkuf/prind) for more detail (e.g. flashing MCU, other frontends, etc.)

## Slicing tips

- I don't use a prime tower - the one in SuperSlicer isn't optimal and is designed more for a single hotend with multiple filaments.
- For now I use a draft shield as it helps with any oozing, and acts as a purge layer. Make it two layers wide so both get purged.

## Todo

- Add z-hop back.
- Why are fans turning off?
- Do the purge line at ever layer?
- Menu (see [here](https://github.com/Klipper3d/klipper/blob/master/klippy/extras/display/menu.cfg):
  - Make temps work for multiple extruders e.g. heat pla all.
  - Allowing moving of either extruder.
- Copy machine limits across from cura ... mine are too conservative now? Both in klipper and in superslicer.
- Add SuperSlicer config inc. the STL for the plate. Is there a dockerised SuperSlicer?
- Can we auto-disable if heaters are active for too long doing nothing?
- Fix how we can't change extruder at z=0 (I think it goes for z=-0.003 for some reason which is OOB).
- How do we load/unload filament?
- Better oozing/purging control:
  - I think the best is probably a purge block and silicon/wire brush. 
  - https://forum.prusaprinters.org/forum/prusaslicer/prusaslicer-post-processing-plugin-for-duet-rrf3-tool-changing-systems/ might be useful - proper purge tower and temperatures etc.
- NB: cura seems to support IDEX a lot better ... maybe back to Cura?
- Why do I sometimes need to restart the stack? Debug that.