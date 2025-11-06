# DW Presence Sensor (dw-ps-01)

**Manufacturer:** Darren’s Workshop  
**Model:** dw-ps-01 (v2)  
**Firmware:** ESPHome-based IoT Presence Sensor  
**MCU:** ESP32-S3-WROOM-1 N16R8

---

## 🌟 Overview

The **DW Presence Sensor** combines multiple sensing technologies to detect occupancy, motion, and ambient light for smart home automation.  
It is designed for easy integration with **Home Assistant** via **ESPHome**, and supports one-click firmware updates directly from your browser.

### 🧩 Features
- **LD2410C mmWave Radar** (UART TX=GPIO17, RX=GPIO18, OUT=GPIO4)
- **AS312 PIR Presence Sensor** (GPIO5)
- **VEML7700 Ambient Light Sensor** (I²C SCL=GPIO8, SDA=GPIO9)
- Built-in **Web Server**, **OTA Updates**, and **Home Assistant API**
- Automatic **update check** from GitHub Releases
- Can run its own fallback Wi-Fi AP if credentials are not configured

---

## ⚡ Flash Firmware (One-Click Web Installer)

You can flash the latest firmware directly in your browser using the official ESP Web Tools interface.

👉 **Open the DW Presence Sensor Web Installer:**  
https://darrens-workshop.github.io/dw-ps-01/

**Requirements:**
- A Chromium-based browser (Chrome, Edge, or Brave)
- USB connection to the board
- Select the correct serial port when prompted

After flashing, the sensor will start its own Wi-Fi network for easy setup.

---

## 📶 Wi-Fi Setup (First Boot)

When first powered after flashing, the device will start a **Wi-Fi access point**:

    SSID: DW Presence Sensor Fallback AP
    Password: setup1234

1. Connect to this network from your phone or laptop.  
2. A setup page will open automatically — enter your **home Wi-Fi name and password**.  
3. Click **Save**, and the sensor will reboot and connect to your Wi-Fi network.

> ⚙️ You do **not** need to edit or reflash any files.  
> Wi-Fi credentials are saved internally and will stay stored through future firmware updates.

---

## 🏡 Integration with Home Assistant

Once the device is connected to your Wi-Fi, Home Assistant will automatically discover it.

1. In Home Assistant, go to  
   **Settings → Devices & Services → + Add Integration → ESPHome**
2. Enter the device’s hostname (shown in ESPHome logs or on the web UI)
3. Done! Home Assistant will add all sensors automatically:
   - Motion (LD2410 OUT & AS312)
   - Presence (moving/still targets)
   - Ambient light (lux)
   - Wi-Fi signal strength
   - Uptime
   - Update availability indicator

> 🧠 Note:  
> If you didn’t enable API encryption in the firmware, no password is required.  
> If you enabled encryption (advanced users), Home Assistant will ask for the API key once during setup.

---

## 🔄 Firmware Updates

The DW Presence Sensor checks GitHub Releases automatically for new firmware versions.  
If an update is available, a binary sensor in Home Assistant will show **Update Available**.

You can then:
- Reflash via the web installer: https://darrens-workshop.github.io/dw-ps-01/  
- Or use ESPHome’s **OTA (over-the-air)** update directly from Home Assistant

Wi-Fi credentials and configuration are preserved automatically during updates.

---

## 🧱 Hardware

| Component     | Function   | GPIO |
|---------------|------------|------|
| LD2410C TX    | UART TX    | 17   |
| LD2410C RX    | UART RX    | 18   |
| LD2410 OUT    | Digital OUT| 4    |
| AS312 OUT     | Digital OUT| 5    |
| VEML7700 SCL  | I²C SCL    | 8    |
| VEML7700 SDA  | I²C SDA    | 9    |

Board ID: `dw-ps-01-v2`  
MCU: `ESP32-S3-WROOM-1 N16R8`

---

## 🧰 Developer Notes

### Repository Structure

    dw-ps-01/
    ├─ esphome/
    │  └─ dw-ps-01-example.yaml         # Example config for ESPHome users
    ├─ packages/
    │  ├─ dw-ps-01-core.yaml            # Board-specific definitions
    │  ├─ dw-ps-01-sensors.yaml         # Sensor setup (mmWave, PIR, light)
    │  ├─ dw-ps-01-network.yaml         # Wi-Fi, API, OTA, web server
    │  └─ dw-ps-01-meta.yaml            # Project info, build/version
    ├─ docs/
    │  ├─ index.html                    # Web installer page
    │  ├─ manifest.json                 # Updated automatically on release
    │  └─ .nojekyll                     # Disables Jekyll for GitHub Pages
    └─ .github/workflows/
       ├─ release.yml                   # Builds & releases firmware binaries
       └─ pages-manifest.yml            # Auto-updates manifest on release

### Build Locally (optional)

To compile the firmware manually:

    pip install esphome
    esphome compile esphome/dw-ps-01-example.yaml

Binaries will appear under:

    .esphome/build/dw-ps-01/.pioenvs/dw-ps-01/

---

## ⚙️ For Advanced Users

If you want to customize the firmware (for example, to pre-configure Wi-Fi or enable encrypted API access):

1. Clone this repository.  
2. Open `esphome/dw-ps-01-example.yaml`.  
3. Uncomment and edit the following lines in the **Substitutions** section:

       # wifi_ssid: !secret dw_ps_wifi_ssid
       # wifi_password: !secret dw_ps_wifi_password
       # api_key: !secret dw_ps_api_key

4. Then open `packages/dw-ps-01-network.yaml` and **uncomment** the corresponding lines:

       wifi:
         ssid: ${wifi_ssid}
         password: ${wifi_password}
         ap:
           ssid: "${friendly_name} Fallback AP"
           password: "setup1234"

       api:
         encryption:
           key: ${api_key}

5. In your `secrets.yaml`, define your real credentials:

       dw_ps_wifi_ssid: "YourWiFiNetwork"
       dw_ps_wifi_password: "YourWiFiPassword"
       dw_ps_api_key: "your-home-assistant-api-key"

6. Compile and flash your customized firmware:

       esphome run esphome/dw-ps-01-example.yaml

> 🧠 Tip:  
> - The API key is optional. Leave it commented if you prefer simple, local pairing.  
> - Wi-Fi credentials are stored in the device’s flash memory and persist through updates.

---

## 🧩 Releases

Each tagged release automatically builds the firmware and updates the online installer.

Generated files include:
- `dw-ps-01.factory-<version>.bin` (for fresh flashing)
- `dw-ps-01-ota-<version>.bin` (for OTA upgrades)
- `docs/manifest.json` (auto-updated for the installer)

View all firmware releases:  
https://github.com/darrens-workshop/dw-ps-01/releases

---

## 🛠️ Support & Contributions

Found a bug or have a feature request?  
Open an issue or pull request:  
https://github.com/darrens-workshop/dw-ps-01/issues

---

© 2025 **Darren’s Workshop** — All rights reserved.
