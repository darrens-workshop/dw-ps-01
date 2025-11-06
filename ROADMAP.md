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
- [ ] [Expose configurable radar parameters (sensitivity, detection gates)](#issue-mmwave-params)
- [ ] [Service to enter/exit LD2410 config mode from HA](#issue-mmwave-config-service)
- [ ] [Optional filtering for short false positives](#issue-mmwave-false-positives)
- [ ] [Detailed logging of moving vs still targets](#issue-mmwave-logging)
- [ ] [Explore “confidence” metric as custom sensor](#issue-mmwave-confidence)

---

## 👁️ Combined Presence Logic
- [ ] [Template binary sensor for “True Presence” (LD2410 OR AS312)](#issue-true-presence)
- [ ] [Delay off-timer for PIR to prevent flicker](#issue-pir-delay-off)
- [ ] [Linger time for mmWave presence](#issue-mmwave-linger)
- [ ] [Adjustable presence timeout (HA number entity)](#issue-presence-timeout-number)

---

## 💡 Ambient Light Improvements
- [ ] [Auto gain/integration for VEML7700](#issue-veml7700-auto-gain)
- [ ] [“Brightness level” sensor (dark / dim / bright)](#issue-brightness-level)
- [ ] [Optional “auto-light trigger” template output](#issue-auto-light-trigger)

---

## 📡 Diagnostics & Metadata
- [ ] [ESP temperature sensor](#issue-esp-temp)
- [ ] [Free memory sensor](#issue-free-mem)
- [ ] [Text sensors: firmware version / build date / release tag](#issue-version-text-sensors)
- [ ] [Board Info text combining model + firmware + build info](#issue-board-info)

---

## 🔄 Update Handling
- [ ] [“Check for Updates” button (manual GitHub check)](#issue-update-button)
- [ ] [Semantic version comparison (vX.Y.Z)](#issue-semver-compare)
- [ ] [Optional HA persistent notification when updates available](#issue-ha-persistent-notice)
- [ ] [Auto-update flag (off by default, experimental)](#issue-auto-update-flag)

---

## 🌐 Local Web Dashboard
- [ ] [Web dashboard (root route) showing live readings](#issue-web-dashboard)
- [ ] [Show firmware version, uptime, Wi-Fi strength](#issue-web-dashboard-stats)
- [ ] [/status.json endpoint for diagnostics](#issue-status-json)

---

## ⚙️ Hardware / Power
- [ ] [Measure idle power draw + document targets](#issue-power-measure)
- [ ] [Light sleep when idle (optional)](#issue-light-sleep)
- [ ] [Deep sleep template for future battery variant](#issue-deep-sleep)
- [ ] [Document startup current and timing behavior](#issue-startup-current)

---

## 🧩 Expansion & Future Ideas
- [ ] [Optional BME280 (temp/humidity/pressure)](#issue-bme280)
- [ ] [Optional SGP30/SGP40 (air quality)](#issue-sgpxx)
- [ ] [RGB status LED (booting, connected, update available)](#issue-rgb-led)
- [ ] [Long-press safe-mode / Wi-Fi reset combo](#issue-longpress-reset)
- [ ] [Device self-test mode (on boot button hold)](#issue-self-test)

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

---

## 🔗 Issue Link Anchors

These anchors will be replaced with live issue links by the bootstrap script:

- #issue-mmwave-params
- #issue-mmwave-config-service
- #issue-mmwave-false-positives
- #issue-mmwave-logging
- #issue-mmwave-confidence
- #issue-true-presence
- #issue-pir-delay-off
- #issue-mmwave-linger
- #issue-presence-timeout-number
- #issue-veml7700-auto-gain
- #issue-brightness-level
- #issue-auto-light-trigger
- #issue-esp-temp
- #issue-free-mem
- #issue-version-text-sensors
- #issue-board-info
- #issue-update-button
- #issue-semver-compare
- #issue-ha-persistent-notice
- #issue-auto-update-flag
- #issue-web-dashboard
- #issue-web-dashboard-stats
- #issue-status-json
- #issue-power-measure
- #issue-light-sleep
- #issue-deep-sleep
- #issue-startup-current
- #issue-bme280
- #issue-sgpxx
- #issue-rgb-led
- #issue-longpress-reset
- #issue-self-test
