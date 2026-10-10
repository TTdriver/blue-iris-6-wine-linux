# Blue Iris 6 x64 on Linux with Wine

This is how I got **Blue Iris 6.1.3.10, 64-bit**, running on **Zorin OS 18.1 with Wine 10.0**. I am sharing the startup workaround and a generic installation starting point.

**Try this at your own risk.** This is a personal project that worked in my setup, with no support or reliability guarantee. These instructions help you launch BI and verify a basic recording. Further configuration and ongoing operation are your responsibility.

## Pick your starting point

| Section | What it is for |
| --- | --- |
| [Human setup guide](docs/HUMAN-GUIDE.md) | Prepare Wine, install the dependencies and get BI 6 recording. |
| [Copy-paste AI prompt](docs/AI-PROMPT.md) | Give your own AI assistant the same generic setup task. |
| [Tested setup](docs/TESTED-SETUP.md) | See the versions and results behind the guide. |
| [Troubleshooting](docs/TROUBLESHOOTING.md) | Check startup, architecture, video and desktop-session problems. |
| [Launch helpers](scripts/README.md) | Use optional prefix and launch scripts. |

## The startup workaround

The working launch uses a complete matching native Microsoft x64 VC/MFC runtime and an app-local native Windows `iphlpapi.dll`, with native Wine overrides. The IPHLPAPI DLL came from my own authorized 64-bit Windows installation. It is not distributed here.

The executable was not patched, and no diagnostic shim or licensing bypass is required. Normal installer and Demo dialogs still need to be handled.

## What worked here

Ten cameras produced full-resolution decodable clips: five at 3840×2160 (HEVC) and five at 2560×1920 (H.264). Main streams were paired with substreams to reduce decoding/display load. This was a short functional test; one feed showed intermittent recording, and overnight reliability is not established. These results do not mean every BI feature works under Wine.

The final test has no imposed BI memory or swap ceiling. Earlier artificial memory thresholds throttled recording. Size your machine for your own workload rather than copying a test cap.

No installers, DLLs, license keys, camera exports, credentials or footage are included. Keep your own settings private. A clean installation from beginning to end has not been repeated using the generalized guide.

For the older 32-bit approach, see the separate [BI 5 repository](https://github.com/TTdriver/blue-iris-wine-linux).

Independent community documentation, not affiliated with Blue Iris, Microsoft or Wine. Original code and documentation use the [MIT license](LICENSE); vendor software retains its own terms.
