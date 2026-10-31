# Favorkeeper

A World of Warcraft addon that shows your reputations as bars in a small, movable
window: one bar per faction, with the **level** (standing 1–8, renown level or
friendship rank, e.g. *Level 6/8*) and the **percentage** towards the next one.
The bars are grouped exactly like Blizzard's reputation panel groups them —
expansion, then sub-group — and every group folds.

Inspired by [Reputation Bars](https://www.curseforge.com/wow/addons/reputation-bars),
built in the style of [Tallymaster](https://github.com/lasse-tech/tallymaster).

Runs on **Midnight** (retail), **Mists Classic** and **Classic Era** from one folder.
Folder name and in-game title are both **Favorkeeper**.

## Installation
Download the zip of the latest release from
[GitHub releases](https://github.com/lasse-tech/favorkeeper/releases) and unpack it
into `World of Warcraft/<client>/Interface/AddOns` (`_retail_`, `_classic_` or
`_classic_era_`). The folder carries all three TOCs, so the same zip works in every
client.

## Features
- **Reputation bars** — standing color, faction name on the left, *Level n/n · pp %*
  on the right. The right-hand text can also show the standing name or the raw
  values instead of the level.
- **Bar look** — pick the fill texture (Blizzard, Classic, Smooth, Flat) and the bar
  height (12, 16, 20 or 24 px) in the options.
- **Every reputation type** — classic standings (Hated … Exalted), renown
  (Dragonflight and later), friendships (rank n/n) and paragon (the bar runs on
  the paragon cycle once the faction is capped; a ready reward is marked).
- **Grouped like the reputation panel** — top-level headers (expansions, *Guild*,
  *Other* …) and their sub-groups, in Blizzard's order. Groups fold. Turn grouping
  off for one alphabetical list.
- **Compendium** — every faction carries a short entry saying *where* its reputation
  comes from: dailies, weeklies, world quests, turn-ins, raids, events, and the catch
  at the end (a cap, a gate, a one-off). **Ctrl-click** any bar to open it; the first
  lines also ride along in the bar's tooltip. 207 factions from Classic to Midnight,
  English and German.
- **Learns while you play** — every reputation gain the client announces is filed
  under the quest it came from, or the zone you were in, and listed in the compendium
  under *Seen while playing*. Shared by every character on the account.
- **Open right now** — on retail the compendium also lists the world quests currently
  up that pay into this faction.
- **Faction list** — a searchable window with every faction the character knows,
  in the same grouping, each shown with its bar. Tick a faction to put it on screen.
- **Leaves the reputation panel alone** — reading collapsed groups means expanding
  them for a moment; Favorkeeper collapses them again right after.
- **Optional auto-tracking** — add a faction as soon as you gain reputation with it
  (off by default).
- **Tooltip** — standing, progress, points to the next level, paragon, account-wide
  and at-war state, the faction's description.
- **ElvUI-skinnable**, minimap button (LibDBIcon), key bindings, English and German.
- **No Ace3** — like Tallymaster, everything runs directly on the Blizzard API; only
  the minimap button pulls in `LibStub`, `CallbackHandler-1.0`, `LibDataBroker-1.1`
  and `LibDBIcon-1.0`.

## Usage
- `/favor` — open the faction list and pick factions
- `/favor show` — show or hide the bar window
- `/favor config` — options (Game Menu → Options → AddOns → Favorkeeper)
- Bar window: **click** opens the faction list, **Shift-click** hides the window,
  **right-click** opens the options, **drag** moves it (unless locked).
- Bar: **Ctrl-click** opens the compendium, **Shift-click** removes it,
  **right-click** opens the options.
- Minimap button: **click** faction list, **Shift-click** bar window,
  **right-click** options.
- Key bindings for the bar window and the faction list under Key Bindings →
  Favorkeeper.

Tracked factions, folded groups and the group cache are stored **per character**;
the options and the window position per profile; what the addon learned about
reputation sources per **account**, since that does not differ per character.

### Adding to the compendium
`Data/Compendium.lua` holds the English entries, `Data/Compendium_deDE.lua` the
German ones — same factions, same order, line for line. An entry is two to five
short lines, each tagged with how often that source can be used
(`unlock`, `quest`, `daily`, `weekly`, `world`, `turnin`, `kill`, `dungeon`,
`raid`, `event`, `craft`), plus an optional note for the catch. `make lint` fails
when the two files drift apart or a line grows too long for a tooltip.

## Flavor support

| | Midnight | Mists Classic | Classic Era |
|---|---|---|---|
| Standings, Blizzard grouping | yes | yes | yes |
| Friendships | yes | yes (Tillers & co.) | no such system |
| Renown | yes | no such system | no such system |
| Paragon | yes | no such system | no such system |
| Account-wide flag | yes | no | no |

Every flavor difference lives in `Core/Compat.lua`. Retail reads the faction list
through `C_Reputation` (tables), Classic through the older globals (tuples).

## Building and installing
`Makefile` (GNU make) and `Makefile.bat` (plain Windows batch) expose the same
targets. The WoW folder is found through `WOW_RETAIL_ADDON_FOLDER`, `WOW_DIR` or
auto-detection; pick another client with `FLAVOR=_classic_` (Mists) or
`FLAVOR=_classic_era_` (Vanilla).

| target | what it does |
|---|---|
| `lint` | `check` + `check-tocs` + `check-compendium` + `luacheck`; **any warning fails** |
| `check` | syntax-check every Lua file |
| `check-tocs` | the three flavor TOCs may differ only in `## Interface:`, and every listed file must exist |
| `check-compendium` | the compendium data: known tags, readable line lengths, and the German file line for line with the English one |
| `luacheck` | static analysis with `.luacheckrc` |
| `test` | run `tests/*.lua` headless in [wow-ui-sim](https://github.com/Osso/wow-ui-sim) (`Makefile` only) |
| `fetch-libs` / `libs` | download the embedded libraries from `.pkgmeta` / report which are missing; `install`, `debug`, `stage`, `dist` and `test` fetch missing ones on their own |
| `debug` | link the working copy into the client (symlinks, junctions on Windows): edit, `/reload`, done |
| `install` | copy the addon into the client (release layout) |
| `uninstall` | remove it; SavedVariables are kept |
| `stage` | `dist/<expansion>/Favorkeeper` per flavor, each with only its own TOC |
| `dist` | `dist/Favorkeeper-<version>.zip` |
| `deploy` | prints the release steps — an addon is released by tag, not deployed |
| `release` | prints the commands that tag `v<version>` and push it |
| `public` | builds the public export of `HEAD` into `dist/public` and lists its files (`Makefile` only) |
| `github` | exports `TAG` to GitHub as one commit and tag; `DRY_RUN=1` pushes nothing (`Makefile` only, run by CI) |
| `clean` / `distclean` | drop build output / also empty `Libs/` |
| `purge` | uninstall **and** delete SavedVariables; needs `CONFIRM=yes` |

```
export WOW_RETAIL_ADDON_FOLDER="/path/to/World of Warcraft/_retail_/Interface/AddOns"
make debug        # or: make install
```

Releases: `make deploy` prints the steps.

## Source layout
```
Core/      Addon (lifecycle/events/slash), Compat (retail/Classic API differences),
           Database, Factions (scan, grouping, bar values, auto-track),
           Compendium (registry for the data), Learned (what gains were seen),
           WorldQuests (which are up right now), Core (init)
Data/      Compendium.lua (the entries), Compendium_deDE.lua (their translation)
UI/        Bars (bar widget, text, tooltip), Tracker (bar window),
           FactionList (picker), Compendium (the compendium window), Options
Skin/      ElvUI integration
Locales/   Locale (runtime), enUS, deDE
design/    spec, release notes, icon source (not shipped, not on GitHub)
tools/     check-compendium.lua, run by `make lint` (not shipped)
tests/     wow-ui-sim tests (not shipped, not on GitHub)
```

## Support

[Buy me a coffee](https://buymeacoffee.com/gossardla)

## Licence and credits

© 2026 lasse tech, Lars Gossard — <lars@lasse-tech.de>

MIT — see [LICENSE](LICENSE).

Embedded libraries, each under its own licence:
[LibStub](https://www.wowace.com/projects/libstub),
[CallbackHandler-1.0](https://www.wowace.com/projects/callbackhandler),
[LibDataBroker-1.1](https://github.com/tekkub/libdatabroker-1-1) and
[LibDBIcon-1.0](https://www.wowace.com/projects/libdbicon-1-0). They are not vendored
here; `make fetch-libs` and the CI packager both pull them from [.pkgmeta](.pkgmeta).
