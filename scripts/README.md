# Optional launch helpers

Read each script before running it. They do not download BI or DLLs, migrate cameras, bypass dialogs, configure networking or impose memory limits.

| Helper | Purpose |
| --- | --- |
| `prepare-prefix.sh [prefix]` | Create a separate win64 prefix; leave an existing win64 prefix unchanged and refuse win32. |
| `launch-blue-iris.sh [prefix]` | Launch installed BI 6 with native IPHLPAPI/VC/MFC overrides and a private local log. |

The default prefix is `~/.local/share/blueiris6-wine`. The default application folder is `drive_c/Program Files/Blue Iris` under that prefix. Set `BLUEIRIS_APP_DIR` to your actual full Linux directory if it differs.

Logs go to `~/.local/state/blueiris6-wine/blueiris.log`, or the equivalent location beneath `XDG_STATE_HOME`. The previous log is rotated above 5 MiB. Logs may contain private information; keep them local.

These helpers use Bash, Wine, Wineboot, ripgrep and standard Linux utilities. Launch from your graphical session. The script is a foreground launcher, not a reboot/autostart service or a headless-display solution.
