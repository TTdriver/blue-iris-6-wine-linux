# Install Blue Iris 6 yourself

Use this if you are doing the setup yourself. For an AI-assisted setup, use [AI-PROMPT.md](AI-PROMPT.md). This is a generic starting point drawn from a working personal setup, not an unattended installer. Try it at your own risk, with no support or reliability guarantee.

## 1. Prepare a Linux desktop and Wine

The working installation used Zorin OS 18.1 and Wine 10.0. Start from a graphical Linux desktop and check your versions:

```bash
cat /etc/os-release
wine --version
```

Use your distribution's Wine installation instructions. You need Wine, its 32-bit support for installers, and ripgrep for the helper scripts. On Ubuntu/Zorin, the package commands used were:

```bash
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install wine wine64 wine32:i386 p7zip-full ripgrep
wine --version
```

Package names and the available Wine version can differ on other distributions. Run the remaining commands from the root of this repository.

Create a separate 64-bit prefix:

```bash
bash scripts/prepare-prefix.sh "$HOME/.local/share/blueiris6-wine"
```

Use a new directory; do not reuse a win32 prefix or overwrite an existing installation.

## 2. Install your legitimate BI 6 package

Obtain the BI installer and update from [Blue Iris](https://blueirissoftware.com/). The build used here was 6.1.3.10 x64. A current download may contain a different version.

```bash
export WINEPREFIX="$HOME/.local/share/blueiris6-wine"
wine /your/private/path/BlueIrisInstaller.exe
```

Use your actual filename. Complete the installer normally. The working application directory was `C:\Program Files\Blue Iris`. An installer finishing is not proof that the main application will launch. The tested prefix was a clone of a full BI installation assembled during troubleshooting; a fresh end-to-end installation of this generalized recipe is not yet verified.

## 3. Supply the matching x64 VC/MFC runtime

Use Microsoft's legitimate x64 Visual C++ runtime. The tested app-local set was **14.51.36247**. Keep a matching set together rather than mixing releases. The launch overrides cover:

```text
mfc140.dll                 mfc140u.dll
msvcp140.dll               msvcp140_1.dll
msvcp140_2.dll             msvcp140_atomic_wait.dll
msvcp140_codecvt_ids.dll   vcruntime140.dll
vcruntime140_1.dll         vcruntime140_threads.dll
concrt140.dll              vcamp140.dll
vcomp140.dll               vccorlib140.dll
```

Install the legitimate x64 redistributable in the prefix. The proven run used native copies of this matching set beside `BlueIris.exe`; installing a runtime package alone was not the final tested workaround. Obtain matching files from your own authorized installation or the legitimate package. Do not use arbitrary DLL download sites. A missing or mismatched file should be resolved before assuming another runner will fix startup.

## 4. Add your own native IPHLPAPI DLL

From your own authorized 64-bit Windows installation, obtain:

```text
C:\Windows\System32\iphlpapi.dll
```

On 64-bit Windows, System32 contains the 64-bit DLL. SysWOW64 contains the 32-bit version and is wrong for this test. Copy your private x64 file beside `BlueIris.exe` in the Wine installation. Use remains subject to the vendor's terms; this repository does not supply that file.

## 5. Launch BI 6

```bash
bash scripts/launch-blue-iris.sh "$HOME/.local/share/blueiris6-wine"
```

The helper selects the native IPHLPAPI and VC/MFC implementations, changes into the app directory and runs BI. See [scripts/README.md](../scripts/README.md) for path overrides and logs.

Handle the normal evaluation Demo dialog yourself if it appears. Do not bypass licensing or assume that a service wrapper dismisses it.

Confirm that the main application opens. **That completes this guide.** Further application setup is your responsibility.

Keep the graphical desktop session open while BI runs. See [startup troubleshooting](TROUBLESHOOTING.md) if the program does not open. These helpers launch a desktop application; unattended or headless operation is outside this installation guide.
