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

## IDEX calibration

Print `./prints/idex_offset_calibration/idex_y_offset_calibration.gcode`. You'll the lines when you print it, but for reference (since I don't have the STLs just the gcode), the left min/max `Y` is 46/174, and right extruder min/max is 45.2/174.8 - therefore every step the difference between left and right is 0.04mm. So if we align at e.g. the +15th, this means the right extruder is 15x0.04 = 0.6mm too low, so our offset should be +0.6 over what we currently have.

## Slicing tips

- I don't use a prime tower - the one in SuperSlicer isn't optimal and is designed more for a single hotend with multiple filaments.
- For now I use a draft shield as it helps with any oozing, and acts as a purge layer. Make it two layers wide so both get purged.
- Use z-hopping and retract on tool changes (which triggers the z-hopping).

## Slicer vs Klipper?

Our slicer (SuperSlicer) can do a bunch of stuff that Klipper can - e.g. managing tool changes nicely, adding x/y offsets, etc. Klipper is nice as it gives me complete control and doesn't need hacking around to make work - and means we can easily change slicers. SuperSlicer is nice as less burden on me to develop, and maybe does nice stuff for free that would be hard for me to implement? (Example?). For now we'll go with using Klipper for the tool change stuff for two reasons:

- I'll be wanting to be add my own wipe brush etc. - and while I could add that to the tool change code in SuperSlicer, easier to integrate it into Klipper so it's the same regardless of slicer.
- IDEX is not that popular (less popular than dual filament extruders?). Point is, there's unlikely to be a heap of dev going into slicers for IDEX, and what is there will be inconsistent across slicers etc. Better for us to do it.

## Todo

- Get multiple SS profiles.
- Calibration docs - copy across from that PR.
- Copy machine limits across from cura ... mine are too conservative now? Both in klipper and in superslicer.
- Add SuperSlicer config inc. the STL for the plate. Is there a dockerised SuperSlicer?
- Can we auto-disable if heaters are active for too long doing nothing?
- How do we load/unload filament?
- Better oozing/purging control:
  - I think the best is probably a purge block and silicon/wire brush. 
  - https://forum.prusaprinters.org/forum/prusaslicer/prusaslicer-post-processing-plugin-for-duet-rrf3-tool-changing-systems/ might be useful - proper purge tower and temperatures etc.
- NB: cura seems to support IDEX a lot better ... maybe back to Cura? Seems to have better print quality, and we've seen it do supports much better than SS/PS.
- Why do I sometimes need to restart the stack? Debug that.