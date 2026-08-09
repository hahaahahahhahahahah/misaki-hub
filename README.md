<div align="center">

# 🌿 misaki

**a script hub for Prison Life** — clean, fast, event-driven.

<br/>

<img src="assets/images/logo.png" width="160" alt="misaki logo"/>

<br/>

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](#)
[![Roblox](https://img.shields.io/badge/Roblox-000000?style=for-the-badge&logo=roblox&logoColor=white)](#)
[![Prison Life](https://img.shields.io/badge/Prison%20Life-Supported-82a68f?style=for-the-badge)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-4ea94b?style=for-the-badge)](#)
[![Version](https://img.shields.io/badge/version-2.0.0-82a68f?style=for-the-badge)](#)

<br/>

```lua
loadstring(game:HttpGet("https://github.com/hahaahahahhahahahah/misaki-hub/raw/main/loader.lua", true))()
```

**compatible with most modern executors**

<br/>

</div>

---

## 📑 Table of Contents

- [Quick Start](#quick-start)
- [Supported Games](#supported-games)
- [Features](#features)
  - [Combat](#combat)
  - [Movement & Visuals](#movement--visuals)
  - [Sounds & World](#sounds--world)
  - [Misc](#misc)
  - [Auras & Blatant](#auras--blatant)
  - [Utility](#utility)
- [System](#system)
- [Compatibility](#compatibility)
- [Disclaimer](#disclaimer)
- [Credits](#credits)

<br/>

## ⚡ Quick Start

1. Copy the loadstring above.
2. Paste it into your executor and run it.
3. The loader downloads everything automatically (library, assets, game script) and opens the UI.

The menu keybind is **Right Control** by default.

<br/>

## 🎮 Supported Games

| Game | Place IDs | Status |
| --- | --- | --- |
| Prison Life | `155615604` / `135564683255158` | ✅ active |

<br/>

## ✨ Features

### Combat

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

### Movement & Visuals

| Feature | Description |
| --- | --- |
| noclip | walk through walls and objects |
| infinite jump | jump mid-air without limits |
| name esp | floating names with team color, inmate status prefixes, forcefield prefix, outline |
| box esp | 2d bounding boxes with team color, outline |
| esp filters | team & inmate type filters, player whitelist (hide or highlight green) |

> both esp types instantly hide on player death.

<br/>

### Sounds & World

| Feature | Description |
| --- | --- |
| hit sounds | custom sound on hit — rust / minecraft orb, volume, gun mute, preview |
| kill sounds | custom sound on kill — independent sound & volume, preview |
| remove doors | removes all doors from the map — reversible |

<br/>

### Misc

| Feature | Description |
| --- | --- |
| ping warning | notification when ping exceeds 300ms (30s cooldown) |
| remove jump cooldown | disables the anti-jump cooldown script |
| always backpack | backpack stays enabled while crouching or tased |
| anti invisible | stops the invisibility animation, highlights invisible players |
| anti tase | counteracts taser stuns and restores your real speed |
| anti riot shield | removes riot shield parts from every player's character |

<br/>

### Auras & Blatant

| Feature | Description |
| --- | --- |
| arrest aura | auto-arrests nearby criminals — radius, 3d circle, target line, whitelist |
| fist aura | auto-punches nearby players — radius, filters, 3d circle, target line, whitelist |
| ragebot | fully automated combat — acquires targets, aims and fires with no input |
| weapon management | auto-switch when empty, auto-reload when the magazine runs dry |

full wall check (respects server-side removed doors), death check, forcefield check, team & inmate type filters, friend check + player whitelist.

<br/>

### Utility

| Feature | Description |
| --- | --- |
| teleportation | teleport to any selected player |
| live stats | real-time fps & ping watermark |

<br/>

## ⚙️ System

- **centralized render loop** — a single `RenderStepped` connection with a cached callback system instead of individual connections per feature
- **table-driven loader** — assets and folders declared as tables, downloaded with error handling and failure notifications
- **executor capability validation** — checks for critical functions at startup, notifies and bails cleanly if the executor is incompatible
- **event-driven hooks** — all gun modifications apply and revert through hook restoration, no leftovers

<br/>

## 💻 Compatibility

| Executor | Score | Price |
| --- | --- | --- |
| volt | 98% | 6$/wk |
| seliware | 100% | 10$/mo |
| potASSium | 100% | 20$/lf |
| madium | null | free |

<br/>

## 📜 Disclaimer

This project is for **educational purposes only**. Use at your own risk. We are not affiliated with Roblox Corporation or Prison Life. Exploiting Roblox games may violate the Roblox Terms of Service — your account, your responsibility.

<br/>

## 👤 Credits

built by **kamil** — 🌿

<br/>

---

<div align="center">

<sub>misaki — a script hub for Prison Life</sub>

</div>
