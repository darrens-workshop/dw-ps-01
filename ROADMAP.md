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
| 🧩 Expansion | Future flexibility | Optional sensors and LED indicators |

---

## 🧠 mmWave (LD2410C) Enhancements
- [ ] [Expose configurable radar parameters (sensitivity, detection gates)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-mmwave-params)
- [ ] [Service to enter/exit LD2410 config mode from HA](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-mmwave-config-service)
- [ ] [Optional filtering for short false positives](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-mmwave-false-positives)
- [ ] [Detailed logging of moving vs still targets](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-mmwave-logging)
- [ ] [Explore “confidence” metric as custom sensor](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-mmwave-confidence)

---

## 👁️ Combined Presence Logic
- [ ] [Template binary sensor for “True Presence” (LD2410 OR AS312)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-true-presence)
- [ ] [Delay off-timer for PIR to prevent flicker](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-pir-delay-off)
- [ ] [Linger time for mmWave presence](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-mmwave-linger)
- [ ] [Adjustable presence timeout (HA number entity)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-presence-timeout-number)

---

## 💡 Ambient Light Improvements
- [ ] [Auto gain/integration for VEML7700](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-veml7700-auto-gain)
- [ ] [“Brightness level” sensor (dark / dim / bright)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-brightness-level)
- [ ] [Optional “auto-light trigger” template output](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-auto-light-trigger)

---

## 📡 Diagnostics & Metadata
- [ ] [ESP temperature sensor](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-esp-temp)
- [ ] [Free memory sensor](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-free-mem)
- [ ] [Text sensors: firmware version / build date / release tag](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-version-text-sensors)
- [ ] [Board Info text combining model + firmware + build info](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-board-info)

---

## 🔄 Update Handling
- [ ] [“Check for Updates” button (manual GitHub check)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-update-button)
- [ ] [Semantic version comparison (vX.Y.Z)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-semver-compare)
- [ ] [Optional HA persistent notification when updates available](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-ha-persistent-notice)
- [ ] [Auto-update flag (off by default, experimental)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-auto-update-flag)

---

## 🌐 Local Web Dashboard
- [ ] [Web dashboard (root route) showing live readings](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-web-dashboard)
- [ ] [Show firmware version, uptime, Wi-Fi strength](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-web-dashboard-stats)
- [ ] [/status.json endpoint for diagnostics](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-status-json)

---

## ⚙️ Hardware / Power
- [ ] [Measure idle power draw + document targets](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-power-measure)
- [ ] [Light sleep when idle (optional)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-light-sleep)
- [ ] [Deep sleep template for future battery variant](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-deep-sleep)
- [ ] [Document startup current and timing behavior](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-startup-current)

---

## 🧩 Expansion & Future Ideas
- [ ] [Optional BME280 (temp/humidity/pressure)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-bme280)
- [ ] [Optional SGP30/SGP40 (air quality)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-sgpxx)
- [ ] [RGB status LED (booting, connected, update available)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-rgb-led)
- [ ] [Long-press safe-mode / Wi-Fi reset combo](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-longpress-reset)
- [ ] [Device self-test mode (on boot button hold)](https://github.com/darrens-workshop/dw-ps-01/issues/NEW_issue-self-test)

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

