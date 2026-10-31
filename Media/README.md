# Media/

The addon icon lives here as `Favorkeeper.tga` (64x64, 32-bit uncompressed). It is
used by the `## IconTexture` line in the TOCs (in-game AddOn list) and by the
minimap button (`ICON` in `Core/Core.lua`).

The source artwork is [`design/icons/favorkeeper.svg`](../design/icons/favorkeeper.svg).

## Rebuilding it

WoW reads BLP and 32-bit TGA, not SVG or PNG, and wants power-of-two dimensions:

    rsvg-convert -w 64 -h 64 design/icons/favorkeeper.svg -o icon.png
    convert icon.png -type TrueColorAlpha -compress None Media/Favorkeeper.tga

The paths in the TOCs and in `Core/Core.lua` are given without an extension, so a
`Favorkeeper.blp` would work as well.
