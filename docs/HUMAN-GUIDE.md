# Human setup guide

Use this if you are doing the setup yourself. For an AI-assisted setup, use [AI-PROMPT.md](AI-PROMPT.md). This is a generic starting point drawn from a working personal setup, not an unattended installer. Try it at your own risk, with no support or reliability guarantee.

## 1. Prepare a Linux desktop and Wine

The reference system was Zorin OS 18.1, Wine 10.0, 8 GB guest RAM and a 64 GB disk. Check the resources actually visible inside Linux:

```bash
cat /etc/os-release
wine --version
free -h
df -h /
```

Use your distribution's Wine installation instructions. On the tested Ubuntu/Zorin family, the package tools used were Wine, wine64, wine32:i386, p7zip-full, ripgrep and Python 3. Some installers need Wine's 32-bit support even though BI itself is x64. Other distributions are not proven equivalents.

Create a separate 64-bit prefix:

```bash
bash scripts/prepare-prefix.sh "$HOME/.local/share/blueiris6-wine"
```

Do not reuse a win32 prefix or overwrite your existing recorder.

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

The helper selects the native IPHLPAPI and VC/MFC implementations, changes into the app directory and runs BI. It adds no memory or swap limit. See [scripts/README.md](../scripts/README.md) for path overrides and logs.

Handle the normal evaluation Demo dialog yourself if it appears. Do not bypass licensing or assume that a service wrapper dismisses it.

## 6. Get one camera recording

Use BI's camera settings to add one camera with your own private credentials. Confirm the Linux machine can reach its RTSP stream. Start with a measured low-resolution stream and hardware acceleration disabled. Use local recording storage with a modest retention setting and confirm:

1. Live video appears.
2. A new recording grows.
3. A completed clip plays back.

Imported settings can keep stale resolution metadata. Check that the configured dimensions match the selected stream. Do not edit registry files while BI or that prefix's Wine server is running.

That is the finish line for this guide. Further camera, storage, service, alert and performance configuration is up to you.

## Optional: keep full-resolution recordings

In BI's network-video settings, configure the camera's main stream and its separate substream in their respective fields. The installed BI manual describes using the main stream for recording and the substream for lower-cost decoding, motion analysis and group display. The tested cameras used `/h264Preview_01_main` and `/h264Preview_01_sub`; other camera models use different paths.

Select continuous recording into BVR and verify that the resulting clip actually contains main-stream resolution. Do not confuse a low-resolution grid preview with the recorded resolution. Test one camera first. BI 5's substream-only registry normalization script should not be applied blindly here: in a dual-stream setup the main and substream dimensions intentionally differ.

## Desktop lifetime matters

Keep the graphical session hosting BI alive. In the observed run, ending that session broke the X connection and stopped BI. Running through systemd does not make a GUI application independent of its display. Reboot startup, headless operation and unattended evaluation-dialog handling are outside this guide.
