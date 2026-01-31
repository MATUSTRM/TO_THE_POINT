# Slow Motion Plugin for Godot 4.x

A Godot plugin to automatically manage temporary slow motion effects

----

Applies temporary slow motion globally (by gradually changing `Engine.time_scale`), with smooth slowing down and speeding up ramps. 

Ramps and overall duration are controlled using time from the OS, so they are not affected by the slowing itself, giving you guaranteed easy control on the duration and speed of the slow motion effect.

This plugin will _also_ slow down shaders, so VFX using the `TIME` builtin playing alongside will also follow neatly.
(There is currently no way to add exceptions for certain shaders to escape the slow motion. Sorry about that - it's an engine limitation.)

----

## Usage

Install and activate plugin (might need to reload the project as well).

For the simplest case, just call 

```gdscript
SlowMotion.slow_motion(duration, speed)
```

from anywhere, where `duration` is in seconds, and `speed` is the time scale between `0.001` and  `1.0`.

This will slow the whole game down to the given speed, including a slow down ramp (in this case for 20% of the time), and a speed up ramp (in this case for 40% of the time) sustaining the slow speed for the remaining time (in this case 40%) in the middle. The duration given is for the overall effect, including the ramps.

Example, for a 3 second slow motion, reaching `time_scale=0.1` at its lowest:

```gdscript
SlowMotion.slow_motion(3.0, 0.1)
```

### Custom Ramp Times

You can provide your own ramp times:

```gdscript
SlowMotion.slow_motion(duration, speed, ramp_slowing_down, ramp_speeding_up)
```

The example below causes the same effect as the previous one (since it uses the default values of 0.2 for slow down and 0.4 for speed up):

```gdscript
SlowMotion.slow_motion(3.0, 0.1, 0.2, 0.4)
```

### Overlapping Effects

It might happen (it _will_ happen in any action game) that a slow motion effect triggers while another one was still playing. You can decide what happens by setting the `overlap_mode` property from the autoload, before calling the next effects:

```gdscript
SlowMotion.overlap_mode = <one of SlowMotion.OverlapModes>
```

Example:

```gdscript
SlowMotion.overlap_mode = SlowMotion.OverlapModes.REPLACE_IF_SLOWER_USE_LONGEST_DURATION
```
Available options are:

| Value | Behaviour |
| :---: | :--- |
| `IGNORE_NEW_EFFECT` | (Default) Ignores any new effects while a previous is running |
| `REPLACE_IF_SLOWER_USE_OLD_DURATION` | If the new request is for a slower motion, slow down further to the new speed, but keep the current duration |
| `REPLACE_IF_SLOWER_USE_NEW_DURATION` | If the new request is for a slower motion, discard the previous and enter the new, using duration from the new one |
| `REPLACE_IF_SLOWER_USE_LONGEST_DURATION` | If the new request is for a slower motion, discard the previous and enter the new, and calculate a duration so the effect ends to match the one which would end latest |
| `REPLACE_IF_SLOWER_ADD_DURATION` | Use the slowest speed, and add the new requested duration extending the time the previous effect would already last |
| `REPLACE_IF_LONGER_USE_NEW_SPEED` | If the new request would end later than the current one, regardless of speed, discard the previous and enter the new, with new speed |
| `REPLACE_IF_LONGER_KEEP_SLOWEST_SPEED` | If the new request would end later than the current one, regardless of speed, discard the previous and enter the new but use the slowest motion speed of the two |
| `REPLACE_IF_SLOWER_OR_LONGER_USE_STRONGEST_VALUES` | If the new request is for a slower motion or longer duration, use the slowest speed and calculate a duration so the effect ends to match the one which would end latest |


If you want to change the behaviour only for one specific case, you can add an extra argument to the end of the call:

```gdscript
SlowMotion.slow_motion(duration, speed, ramp_slowing_down, ramp_speeding_up, custom_overlap_rule)
```

Example (has the same effect as first one, since it still uses same as default values):

```gdscript
SlowMotion.slow_motion(3.0, 0.1, 0.2, 0.4, SlowMotion.OverlapModes.IGNORE_NEW_EFFECT)
```

----

## Demo Scene

The plugin comes with a demo scene file, showing how to control other nodes using slow motion data (example with graphical representations of speed and values), as well as showing how to also control an `AudioStreamPlayer`'s speed to match the slow motion.