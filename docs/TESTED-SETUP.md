# Tested installation

This page identifies the installation that opened successfully. It contains only installation details.

| Component | Working installation |
| --- | --- |
| Linux desktop | Zorin OS 18.1, Ubuntu Noble base |
| Wine | 10.0 |
| Prefix architecture | `win64` |
| Blue Iris | 6.1.3.10, x64 / AMD64 |
| Application directory | `C:\Program Files\Blue Iris` |
| Native VC/MFC runtime | Matching x64 app-local files, version 14.51.36247 |
| Additional native dependency | x64 `iphlpapi.dll` from an authorized Windows installation |

The working launcher loads native IPHLPAPI and VC/MFC DLLs before Wine's built-in implementations. The full list and installation steps are in [HUMAN-GUIDE.md](HUMAN-GUIDE.md). No application binary patch or diagnostic shim is part of this installation.

## File identification

These hashes identify the local files used. They do not mean that every later BI build or Windows DLL will behave the same way.

| File | SHA-256 |
| --- | --- |
| BI 6.1.3.10 x64 executable | `73cedf8957c384973882b4616670173beb0424899c98acca4405a93aaad82f6a` |
| Native x64 IPHLPAPI DLL, 220528 bytes | `8521026d021cc5193a7cd7c0256bd14c7ab39738d22c019e6d544b37deee12c0` |

The working prefix was a clone of a full BI installation assembled during troubleshooting. The generalized fresh-install recipe has not been reproduced end to end. Installing the Visual C++ redistributable alone was not verified as sufficient: the working installation also used the matching app-local DLL set.

No vendor installers or DLLs are redistributed here. Obtain them legitimately. Other distributions, Wine builds, runtime sets and BI versions may behave differently.
