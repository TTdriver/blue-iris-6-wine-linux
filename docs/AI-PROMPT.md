# Copy-paste prompt for your AI assistant

Use this task brief with an assistant that can operate your terminal or guide you manually. Fill in your own environment details privately. It is not a shell script.

```text
Help me get Blue Iris 6 x64 running on Linux using this personal guide:
https://github.com/TTdriver/blue-iris-6-wine-linux
Read README.md, docs/HUMAN-GUIDE.md, docs/TESTED-SETUP.md and scripts/README.md.

My Linux version: [fill in]
My RAM and free disk space: [fill in]
My Wine version and existing prefixes: [fill in]
My legitimate BI installer/update and Microsoft runtime: [private local paths]
My authorized x64 Windows source for IPHLPAPI: [private local location]
My camera model and RTSP stream: [fill in privately]

The reference is Zorin OS 18.1, Wine 10.0 and BI 6.1.3.10 x64. Preserve my
existing recorder and create a separate win64 prefix. Install my legitimate
BI package and use the complete matching native x64 VC/MFC runtime; the tested
set was 14.51.36247. The successful launch used app-local runtime DLLs plus
System32/iphlpapi.dll from my own authorized x64 Windows installation, with
the documented native Wine overrides. Do not mix architectures or use random
DLL downloads. Do not patch BI or bypass licensing/evaluation.

Get BI to open and let me dismiss its normal Demo dialog if needed. Configure
ONE camera first, with measured stream dimensions and private credentials.
Start with a substream and hardware acceleration off. Verify live video, a
growing recording and playback of a completed clip on local test storage.
If I want main-stream quality, configure the main and substream in their
respective fields; verify the recorded resolution rather than the grid view.
Do not apply the BI 5 substream-only registry helper to a BI 6 dual-stream setup.

Back up settings and stop the relevant prefix before offline edits. Keep
credentials, exports, logs, recordings and vendor files private. Do not change
my production recorder, camera settings, NAS or firewall without instructions.
Do not add artificial BI memory or swap limits as part of this recipe.
Keep the graphical desktop session alive; a systemd wrapper does not remove
BI's need for a display. Ask only for information needed to perform the setup,
not project feedback.

Finish with my working launch command, private prefix/log locations and the
basic recording result. Stop there. Further configuration and operation are
my responsibility. This is used at my own risk, with no support or reliability
guarantee. Report actual blockers rather than claiming a universal recipe.
```
