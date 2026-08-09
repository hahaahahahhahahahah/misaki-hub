<div align="center">

# Misaki

**a script hub for Prison Life and +1 OP Ninja** — clean, fast, event-driven.

<br/>

<img src="assets/images/logo.png" width="160" alt="misaki logo"/>

<br/>

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](#)
[![Roblox](https://img.shields.io/badge/Roblox-000000?style=for-the-badge&logo=roblox&logoColor=white)](#)
[![Prison Life](https://img.shields.io/badge/Prison%20Life-Supported-a78bfa?style=for-the-badge)](#)
[![OP Ninja](https://img.shields.io/badge/OP%20Ninja-Supported-a78bfa?style=for-the-badge)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-8b5cf6?style=for-the-badge)](#)
[![Version](https://img.shields.io/badge/version-7.0.0-a78bfa?style=for-the-badge)](#)

<br/>

```lua
loadstring(game:HttpGet("https://github.com/hahaahahahhahahahah/misaki-hub/raw/main/loader.lua", true))()
```

<br/>

</div>

---

## Table of Contents

- [Quick Start](#quick-start)
- [Supported Games](#supported-games)
- [Features](#features)
  - [Prison Life](#prison-life)
  - [OP Ninja](#op-ninja)
- [System](#system)
- [Disclaimer](#disclaimer)

<br/>

## Quick Start

1. Copy the loadstring above.
2. Paste it into your executor and run it.
3. The loader downloads everything automatically (library, assets, game script) and opens the UI.

The menu keybind is **Right Control** by default.

<br/>

## Supported Games

| Game | Place IDs |
| --- | --- |
| Prison Life | `155615604` / `135564683255158` |
| +1 OP NINJA | `4225025295` |

<br/>

## Features

### Prison Life

#### Combat

| Feature | Description |
| --- | --- |
| no fire rate | removes the fire rate delay on every gun |
| no spread | zeroes out bullet spread on every gun |
| force auto fire | forces all guns to fire automatically |
| silent aim | hooks raycast to redirect bullets to the closest target |
| triggerbot | auto-fires when a valid target is inside the fov circle (ranged only) |
| hit sounds | custom sound on hit — rust / minecraft orb, volume control, gun mute |
| kill sounds | custom sound on kill — independent selection and volume |

**silent aim** — fov circle & tracer with custom colors, configurable radius, bone selection (head / humanoidrootpart), wall check (respects removed doors server-side), death check, forcefield check, team & inmate type filters, friend check + player whitelist.

> **note:** gun mods are event-driven — they apply instantly on equip and revert cleanly on disable.

<br/>

#### Movement & Visuals

| Feature | Description |
| --- | --- |
| noclip | walk through walls and objects |
| infinite jump | jump mid-air without limits |
| name esp | floating names with team color, inmate status prefixes, forcefield prefix, outline |
| box esp | 2d bounding boxes with team color, outline |
| esp filters | team & inmate type filters, player whitelist (hide or highlight) |

> both esp types instantly hide on player death.

<br/>

#### Sounds & World

| Feature | Description |
| --- | --- |
| hit sounds | custom sound on hit — rust / minecraft orb, volume, gun mute, preview |
| kill sounds | custom sound on kill — independent sound & volume, preview |
| remove doors | removes all doors from the map — reversible |

<br/>

#### Misc

| Feature | Description |
| --- | --- |
| ping warning | notification when ping exceeds 300ms (30s cooldown) |
| remove jump cooldown | disables the anti-jump cooldown script |
| always backpack | backpack stays enabled while crouching or tased |
| anti invisible | stops the invisibility animation, highlights invisible players |
| anti tase | counteracts taser stuns and restores your real speed |
| anti riot shield | removes riot shield parts from every player's character |

<br/>

#### Auras & Blatant

| Feature | Description |
| --- | --- |
| arrest aura | auto-arrests nearby criminals — radius, 3d circle, target line, whitelist |
| fist aura | auto-punches nearby players — radius, filters, 3d circle, target line, whitelist |
| ragebot | fully automated combat — acquires targets, aims and fires with no input |
| weapon management | auto-switch when empty, auto-reload when the magazine runs dry |

full wall check (respects server-side removed doors), death check, forcefield check, team & inmate type filters, friend check + player whitelist.

<br/>

#### Utility

| Feature | Description |
| --- | --- |
| teleportation | teleport to any selected player |
| live stats | real-time fps & ping watermark |

<br/>

### OP Ninja

#### Combat

| Feature | Description |
| --- | --- |
| auto train | swings your equipped sword automatically |
| auto upgrade | game-native upgrade loop: realm → class → shuriken → sword, no gamepass needed |
| upgrade status | live label showing the active mode (native / timer / direct) and current levels |

<br/>

#### Player

| Feature | Description |
| --- | --- |
| walkspeed x2 | sets your walkspeed to 100, restored to 16 on disable |
| infinite jump | jump while in the air |
| safezone | glass platform high in the sky with keep-in — stay safe while afk |

<br/>

#### Misc

| Feature | Description |
| --- | --- |
| anti afk | prevents the idle kick |
| auto balloon boost | clicks ad balloons for 5-minute boosts, auto-launches watch ads |

<br/>

## System

- **centralized render loop** — a single `RenderStepped` connection with a cached callback system instead of individual connections per feature
- **table-driven loader** — assets and folders declared as tables, downloaded with error handling and failure notifications
- **resilient loader** — FNV-1a integrity verification on library and game (per-place game hashes), graceful failure handling (warnings + notifications instead of silent aborts)
- **automatic updates** — the loader checks `VERSION.txt` on every run and self-updates when a new version is pushed (no need to re-paste the loadstring)
- **event-driven hooks** — all gun modifications apply and revert through hook restoration, no leftovers

<br/>

## Disclaimer

This project is for **educational purposes only**. Use at your own risk. We are not affiliated with Roblox Corporation, Prison Life or OP Ninja. Exploiting Roblox games may violate the Roblox Terms of Service — your account, your responsibility.

<br/>

---

<div align="center">

<sub>misaki — a script hub for Prison Life & +1 OP Ninja</sub>

</div>
