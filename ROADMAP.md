# 🚀 DW-PS-01 – Phase 2 Development Roadmap

**Project:** Darren’s Workshop – dw-ps-01 (v2)  
**Firmware:** ESPHome IoT Presence Sensor  
**Current Release:** v1.0.0  
**Next Target Release:** v1.1.0 (Feature Update)

---

## 🧭 Overview

Phase 2 focuses on enhancing intelligence, configurability, and polish of the DW Presence Sensor.  
The goal is to evolve from a working prototype into a refined, production-ready device with advanced sensing logic and diagnostics.

All planned features below can be developed incrementally and merged via small, well-scoped pull requests.

---

## ✅ Core Goals

| Category | Focus | Summary |
|-----------|-------|---------|
| 🧠 mmWave Tuning | More control over LD2410C radar | Adjustable sensitivity, gate zones, and motion filters |
| 👁️ Presence Logic | Smarter occupancy detection | Combine mmWave + PIR for true presence detection |
| 💡 Ambient Light | Improve VEML7700 usability | Auto-gain, “brightness level” abstraction |
| 📡 Diagnostics | Device & network insights | Add temperature, memory, and build metadata |
| 🔄 Updates | Easier OTA & version awareness | Manual “check for update” button + version comparison |
| 🌐 UX | Improved local UI | Serve web dashboard & JSON endpoint |
| ⚙️ Hardware | Power & sleep optimization | Optional light sleep & power profiling |

---

## 🧠 mmWave (LD2410C) Enhancements
- [ ] [Expose configurable radar parameters (sensitivity, detection gates)](https://github.com/darrens-workshop/dw-ps-01/issues/33)
- [ ] [Service to enter/exit LD2410 config mode from HA](https://github.com/darrens-workshop/dw-ps-01/issues/34)
- [ ] [Optional filtering for short false positives](https://github.com/darrens-workshop/dw-ps-01/issues/35)
- [ ] [Detailed logging of moving vs still targets](https://github.com/darrens-workshop/dw-ps-01/issues/36)
- [ ] [Explore “confidence” metric as custom sensor](https://github.com/darrens-workshop/dw-ps-01/issues/37)

---

## 👁️ Combined Presence Logic
- [ ] [Template binary sensor for “True Presence” (LD2410 OR AS312)](https://github.com/darrens-workshop/dw-ps-01/issues/38)
- [ ] [Delay off-timer for PIR to prevent flicker](https://github.com/darrens-workshop/dw-ps-01/issues/39)
- [ ] [Linger time for mmWave presence](https://github.com/darrens-workshop/dw-ps-01/issues/40)
- [ ] [Adjustable presence timeout (HA number entity)](https://github.com/darrens-workshop/dw-ps-01/issues/41)

---

## 💡 Ambient Light Improvements
- [ ] [Auto gain/integration for VEML7700](https://github.com/darrens-workshop/dw-ps-01/issues/42)
- [ ] [“Brightness level” sensor (dark / dim / bright)](https://github.com/darrens-workshop/dw-ps-01/issues/43)
- [ ] [Optional “auto-light trigger” template output](https://github.com/darrens-workshop/dw-ps-01/issues/44)

---

## 📡 Diagnostics & Metadata
- [ ] [ESP temperature sensor](https://github.com/darrens-workshop/dw-ps-01/issues/45)
- [ ] [Free memory sensor](https://github.com/darrens-workshop/dw-ps-01/issues/46)
- [ ] [Text sensors: firmware version / build date / release tag](https://github.com/darrens-workshop/dw-ps-01/issues/47)
- [ ] [Board Info text combining model + firmware + build info](https://github.com/darrens-workshop/dw-ps-01/issues/48)

---

## 🔄 Update Handling
- [ ] [“Check for Updates” button](https://github.com/darrens-workshop/dw-ps-01/issues/67)
- [ ] [Semantic version comparison](https://github.com/darrens-workshop/dw-ps-01/issues/66)
- [ ] [Optional HA persistent notification when updates available](https://github.com/darrens-workshop/dw-ps-01/issues/51)
- [ ] [Auto-update flag (off by default, experimental)](https://github.com/darrens-workshop/dw-ps-01/issues/52)

---

## 🌐 Local Web Dashboard
- [ ] [Web dashboard (root route) showing live readings](https://github.com/darrens-workshop/dw-ps-01/issues/53)
- [ ] [Show firmware version, uptime, Wi-Fi strength](https://github.com/darrens-workshop/dw-ps-01/issues/54)
- [ ] [/status.json endpoint for diagnostics](https://github.com/darrens-workshop/dw-ps-01/issues/55)

---

## ⚙️ Hardware / Power
- [ ] [Measure idle power draw + document targets](https://github.com/darrens-workshop/dw-ps-01/issues/56)
- [ ] [Light sleep when idle](https://github.com/darrens-workshop/dw-ps-01/issues/65)
- [ ] [Document startup current and timing behavior](https://github.com/darrens-workshop/dw-ps-01/issues/59)

---

## 🧱 Development Workflow

1. Each feature or improvement should have its own branch:

       feature/short-description

   Example: feature/mmwave-tuning or feature/combined-presence

2. Each PR should link to the corresponding issue (created below) and this roadmap.
3. After merge and verification on hardware, update this document and bump firmware where applicable:
   - packages/dw-ps-01-core.yaml (fw_version)
   - Release tag (e.g., v1.1.0)
   - docs/manifest.json will auto-update via workflow upon release

---

## 🏁 Target for Next Release (v1.1.0)
- [ ] Working “True Presence” logic (combined sensors)
- [ ] LD2410 tuning service + adjustable parameters
- [ ] Web dashboard prototype
- [ ] Improved diagnostics (board info, firmware version)
- [ ] Optional HA update check button

