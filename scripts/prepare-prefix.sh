#!/usr/bin/env bash
set -euo pipefail
command -v wine >/dev/null || { echo 'Install Wine with 64-bit support first; see docs/HUMAN-GUIDE.md.' >&2; exit 1; }
export WINEPREFIX="$(realpath -m -- "${1:-${HOME}/.local/share/blueiris6-wine}")"
if [[ -f "$WINEPREFIX/system.reg" ]]; then
    rg -q '^#arch=win64$' "$WINEPREFIX/system.reg" || { echo 'Existing prefix is not win64; choose a new directory.' >&2; exit 1; }
    echo 'Existing 64-bit prefix found; leaving it unchanged.'
    exit 0
fi
export WINEARCH=win64
export WINEDEBUG=-all
umask 077
wineboot -u
echo 'Created a 64-bit prefix. Install your legitimately obtained Blue Iris package next.'
