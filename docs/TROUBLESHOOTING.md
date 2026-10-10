# Troubleshooting the first launch

This page covers getting BI open and a basic recording working. Ongoing operation is outside the scope of this personal guide.

| Symptom | First checks |
| --- | --- |
| BI exits before its UI | Confirm win64 prefix, x64 BI executable, complete matching native VC/MFC files, x64 app-local IPHLPAPI, and the launch overrides. |
| Missing DLL message | Resolve the named legitimate dependency and architecture; do not mix random DLL versions. |
| Demo dialog blocks startup | Dismiss the normal evaluation dialog; this guide does not bypass it. |
| Camera has no video | Check the actual RTSP path, authentication and reachability from Linux. An open TCP port is not proof of a working stream. |
| Wrong resolution or large startup allocation | Check measured stream sizes and stale imported metadata. Main and substream dimensions intentionally differ in dual-stream mode. |
| Full-resolution recording uses too much CPU | Add the camera's separate substream for decoding/group display; verify the main stream still records. Start with acceleration disabled. |
| Recording stalls under a service wrapper | Check artificial cgroup memory thresholds as well as available RAM and disk. The final reference run imposed no BI memory/swap cap. |
| BI stops when you leave the desktop | Check whether the hosting graphical session ended. A broken X connection stops the GUI application. |
| A clip exists but may not contain useful video | Play a completed clip and check recorded resolution and changing video. A header-only file is not recording success. |

Logs from the helper are local and private. Do not publish raw logs, camera exports, license data or footage. Preserve your existing working recorder while trying this setup.
