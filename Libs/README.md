# Libs/

These libraries are **not** vendored in the repo. They are pulled automatically by
the BigWigs/CurseForge packager from [`.pkgmeta`](../.pkgmeta) at release time.

Favorkeeper does **not** use Ace3. Everything Ace3 used to provide (addon lifecycle,
events, chat commands, saved variables, localization, options panel, list window) is
implemented directly against the Blizzard API. The remaining libraries exist only
because `LibDBIcon-1.0` needs them for the minimap button.

`make install`, `make debug`, `make stage`, `make dist` and `make test` fetch them
on their own when any library `embeds.xml` lists is missing (`make fetch-libs`
does it explicitly; it needs `svn`, and `git` for LibDataBroker-1.1). Without
them the client reports one Lua warning per missing file in `embeds.xml`.

The resulting layout:

```
Libs/
  LibStub/LibStub.lua
  CallbackHandler-1.0/CallbackHandler-1.0.xml
  LibDataBroker-1.1/LibDataBroker-1.1.lua
  LibDBIcon-1.0/LibDBIcon-1.0.lua
```

`LibElvUIPlugin-1.0` is not embedded; ElvUI registers it itself, and without it
the ElvUI skin falls back to a direct call.
