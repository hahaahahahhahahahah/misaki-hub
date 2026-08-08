<div align="center">

# misaki

### a script hub for Prison Life

<br>

```lua
loadstring(game:HttpGet("https://github.com/hahaahahahhahahahah/misaki-hub/raw/main/loader.lua", true))()
```

<br>

**compatible with most modern executors**

</div>

<br>

---

<br>

## supported games

| game | place ids | status |
| --- | --- | --- |
| Prison Life | `155615604` / `135564683255158` | ✅ active |

<br>

## features

### combat

| feature | description |
| --- | --- |
| no fire rate | removes the fire rate delay on every gun |
| no spread | zeroes out bullet spread on every gun |
| force auto fire | forces all guns to fire automatically |
| silent aim | hooks raycast to redirect bullets to the closest target |
| triggerbot | auto-fires when a valid target is inside the fov circle (ranged only) |
| hit sounds | custom sound on hit — rust / minecraft orb, volume control, gun mute |
| kill sounds | custom sound on kill — independent selection and volume |

- event-driven gun mods — apply instantly on equip, revert cleanly on disable
- silent aim — fov circle & tracer with custom colors, radius, bone selection (head / humanoidrootpart), wall check, death check, forcefield check, team & inmate type filters, friend check + player whitelist

### movement

| feature | description |
| --- | --- |
| noclip | walk through walls and objects |
| infinite jump | jump mid-air without limits |

### visuals

| feature | description |
| --- | --- |
| name esp | floating names with team color, inmate status prefixes, forcefield prefix, outline |
| box esp | 2d bounding boxes with team color, outline |
| esp filters | team & inmate type filters, player whitelist (hide or highlight green) |

both esp types instantly hide on player death.

### world

| feature | description |
| --- | --- |
| remove doors | removes all doors from the map — reversible |

### misc

| feature | description |
| --- | --- |
| ping warning | notification when ping exceeds 300ms (30s cooldown) |
| remove jump cooldown | disables the anti-jump cooldown script |
| always backpack | backpack stays enabled while crouching or tased |
| anti invisible | stops the invisibility animation, highlights invisible players |
| anti tase | counteracts taser stuns and restores your real speed |
| arrest aura | auto-arrests nearby criminals — radius, 3d circle, target line, whitelist |
| fist aura | auto-punches nearby players — radius, filters, 3d circle, target line, whitelist |
| anti riot shield | removes riot shield parts from every player's character |

### blatant

| feature | description |
| --- | --- |
| ragebot | fully automated combat — acquires targets, aims and fires with no input |
| weapon management | auto-switch when empty, auto-reload when the magazine runs dry |

full wall check (respects server-side removed doors), death check, forcefield check, team & inmate type filters, friend check + player whitelist.

### players

| feature | description |
| --- | --- |
| teleportation | teleport to any selected player |
| live stats | real-time fps & ping watermark |

<br>

## compatibility

| executor | score | price |
| --- | --- | --- |
| volt | 98% | 6$/wk |
| seliware | 100% | 10$/mo |
| potASSium | 100% | 20$/lf |
| madium | null | free |

- centralized render loop — a single `RenderStepped` connection with a cached callback system
- table-driven loader — assets downloaded with error handling and failure notifications
- automatic executor capability validation with a clean bail-out if something is missing

<br>

---

<br>

<div align="center">

**built by kamil**

</div>
