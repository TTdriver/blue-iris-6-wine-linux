# Tested setup

Use this page to judge how closely your environment matches the one behind the guide.

| Component | Observed value |
| --- | --- |
| Linux | Zorin OS 18.1, Ubuntu Noble base |
| Wine | Host Wine 10.0 |
| BI | 6.1.3.10, AMD64/x64 |
| VM | 8 GB RAM, 64 GB disk |
| VC/MFC runtime | Complete matching native x64 14.51.36247 set, app-local |
| Startup workaround | App-local native x64 Windows IPHLPAPI with native overrides |
| Camera test | Ten main+sub stream pairs; five 3840×2160 HEVC, five 2560×1920 H.264 |
| Verification | Each camera produced a clip with 100 decoded full-resolution frames and changing image content |
| Frame-rate check | One completed 4K main-stream clip contained about 25 FPS; all-camera Windows/Linux rate parity was not established |
| Final imposed BI limits | No memory or swap ceiling |

The exact failing IPHLPAPI export or behavior has not been identified. Native thread/exception probes passed both Wine and Windows; no diagnostic shim is required by the working launcher. Bottles, Proton/UMU and Lutris runner attempts failed before this workaround and were not retested with it.

The tested BI executable SHA-256 was `73cedf8957c384973882b4616670173beb0424899c98acca4405a93aaad82f6a`.
The private native IPHLPAPI file was AMD64, 220,528 bytes, SHA-256 `8521026d021cc5193a7cd7c0256bd14c7ab39738d22c019e6d544b37deee12c0`. These hashes identify the tested files; the files are not included.

An earlier live-camera enlargement ended in SIGKILL with no established cause. A retry stayed open. During the larger test, artificial memory thresholds caused heavy throttling and recording stalls; all imposed BI memory/swap limits were later removed. One camera feed showed intermittent recording even though a separate RTSP probe succeeded. These observations are not a production-reliability guarantee.

A substream run lasted about two hours before its desktop session ended and broke the X connection. Full-resolution verification was a shorter test. Fresh installation from beginning to end, overnight full-resolution operation, reboot recovery, headless operation, hardware acceleration, alerts, PTZ and every other BI feature remain unverified.
