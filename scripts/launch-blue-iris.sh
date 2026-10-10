#!/usr/bin/env bash
set -euo pipefail
export WINEPREFIX="$(realpath -m -- "${1:-${HOME}/.local/share/blueiris6-wine}")"
export WINEDEBUG=-all
export WINEDLLOVERRIDES='iphlpapi,mfc140,mfc140u,msvcp140,msvcp140_1,msvcp140_2,msvcp140_atomic_wait,msvcp140_codecvt_ids,vcruntime140,vcruntime140_1,vcruntime140_threads,concrt140,vcamp140,vcomp140,vccorlib140=n,b'
[[ -f "$WINEPREFIX/system.reg" ]] && rg -q '^#arch=win64$' "$WINEPREFIX/system.reg" || { echo 'Select an existing win64 prefix.' >&2; exit 1; }
APP_DIR="${BLUEIRIS_APP_DIR:-$WINEPREFIX/drive_c/Program Files/Blue Iris}"
[[ -f "$APP_DIR/BlueIris.exe" ]] || { echo 'Blue Iris 6 was not found in the selected prefix.' >&2; exit 1; }
[[ -f "$APP_DIR/iphlpapi.dll" ]] || { echo 'Add your own native x64 iphlpapi.dll beside BlueIris.exe; see docs/HUMAN-GUIDE.md.' >&2; exit 1; }
STATE_DIR="${XDG_STATE_HOME:-${HOME}/.local/state}/blueiris6-wine"
mkdir -p -- "$STATE_DIR"
chmod 700 "$STATE_DIR"
LOG="$STATE_DIR/blueiris.log"
if [[ -f "$LOG" && $(stat -c %s -- "$LOG") -gt 5242880 ]]; then
    mv -- "$LOG" "$LOG.previous"
fi
umask 077
cd -- "$APP_DIR"
exec wine ./BlueIris.exe >> "$LOG" 2>&1
