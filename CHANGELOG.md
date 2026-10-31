# Changelog

All notable changes to Favorkeeper are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2026-10-31

### Added
- Donate link in the addon list (`X-Donate`)

## [0.1.0] - 2026-10-31

### Added
- Bar window with one reputation bar per tracked faction: standing color, name,
  *Level n/n* and the percentage towards the next level. The right-hand text can
  show the standing name or the raw values instead.
- Bar look in the options: fill texture (Blizzard, Classic, Smooth, Flat) and bar
  height (12/16/20/24 px). The texture applies to the faction list as well.
- Standings, renown, friendships and paragon. Capped factions with paragon show
  the running paragon cycle and mark a reward that is ready.
- Grouping like Blizzard's reputation panel: top-level headers and sub-groups in
  Blizzard's order, foldable. Can be switched off for one alphabetical list.
- Faction list: every faction the character knows, grouped the same way, with
  search. Ticking a faction adds its bar.
- Collapsed reputation-panel headers are expanded only for the scan and collapsed
  again right after.
- Optional auto-tracking of factions you gain reputation with (off by default).
- Compendium: a short entry per faction saying where its reputation comes from,
  for 207 factions from Classic to Midnight, in English and German. Ctrl-click a
  bar for the window; the first lines also appear in the bar's tooltip (can be
  switched off).
- The addon learns as you play: every reputation gain the client announces is
  filed under the quest it came from or the zone you were in, kept per account
  and listed in the compendium under "Seen while playing".
- On retail the compendium also lists the world quests currently up that reward
  the faction.
- `make check-compendium` (part of `lint`) verifies the compendium data and that
  the German file matches the English one line for line.

### Fixed
- The first Shift- or Ctrl-click after a `/reload` did nothing. The client does
  not hand the keyboard state to a freshly loaded UI, so `IsShiftKeyDown()` and
  `IsControlKeyDown()` answered "not held" while the key was down, and the click
  fell through every branch. The modifier keys are tracked from
  `MODIFIER_STATE_CHANGED` as well now; the API keeps the first word, so a
  release the client swallowed cannot leave a key stuck as pressed.
- `/favor clicks` prints what each click saw, to tell a click that never arrived
  apart from one that arrived without its modifier.
- Options panel with About block, minimap button, key bindings, ElvUI skin,
  English and German.
- One folder for Midnight, Mists Classic and Classic Era (three TOCs).
- `make install`, `debug`, `stage`, `dist` and `test` fetch the embedded libraries
  when any is missing, instead of installing a copy that raises one Lua warning per
  missing library (`embeds.xml: Error loading ... LibStub.lua`).
- `make lint` runs `luacheck` next to the syntax and TOC checks; any warning
  fails. `make debug` links the working copy into the client.
