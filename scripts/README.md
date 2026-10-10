# Optional installation and launch helpers

Read each script before running it. Obtain and install your own legitimate BI packages and dependencies using [the human guide](../docs/HUMAN-GUIDE.md).

| Helper | Purpose |
| --- | --- |
| `prepare-prefix.sh [prefix]` | Create a separate `win64` prefix; leave an existing matching prefix unchanged and refuse the other architecture. |
| `launch-blue-iris.sh [prefix]` | Launch the installed BI 6 application with the native IPHLPAPI/VC/MFC overrides, saving a private local log. |

The default prefix is `~/.local/share/blueiris6-wine`. The application folder is `drive_c/Program Files/Blue Iris` under that prefix.

Set `BLUEIRIS_APP_DIR` to the full Linux application directory if your BI 6 installation uses a different folder.

Logs go to `~/.local/state/blueiris6-wine/blueiris.log`, or beneath `XDG_STATE_HOME` if set. The previous log is rotated above 5 MiB. Keep logs local.

These helpers use Bash, Wine, Wineboot, ripgrep and standard Linux utilities. Launch from your graphical session. They do not download vendor files or provide autostart or headless operation.
