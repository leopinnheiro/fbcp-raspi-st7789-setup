# Raspberry Pi ST7789 Display Setup (fbcp-ili9341 Installer)

This project provides a fully automated, modular installer that configures a Raspberry Pi to drive SPI TFT displays (ST7789, 320×240) using a custom build of **fbcp-ili9341**, including:

- Automatic SPI configuration  
- Automatic installation of fbcp-ili9341 (with your custom fork)
- Legacy FKMS video stack activation (required for DispmanX)
- Systemd service installation
- Interactive pin configuration
- Clean modular scripts

---

## ✅ Supported Raspberry Pi Models

| Model | Supported | Notes |
|-------|-----------|-------|
| **Raspberry Pi Zero 2 W** | ✔ Yes | Fully tested |
| Raspberry Pi Zero W (original) | ✔ Yes | Slower, but works |
| Raspberry Pi 3 / 4 | ✔ Yes | Must use Bullseye (Legacy/with FKMS) |
| Raspberry Pi 5 | ❌ No | DispmanX removed — fbcp-ili9341 cannot run |

---

## 🛑 Important: Required Operating System

This installer **requires Raspberry Pi OS Bullseye**, because:

- Bullseye still includes **DispmanX**, needed by fbcp-ili9341  
- Bookworm (2023+) removed DispmanX completely  

### ✔ Download Raspberry Pi OS Bullseye Lite (Recommended)

You can download the correct OS image here:

**Raspberry Pi OS Bullseye Lite (armhf) – 2023-05-03**  
https://downloads.raspberrypi.com/raspios_lite_armhf/images/raspios_lite_armhf-2023-05-03/

This is the version used during testing and guarantees full compatibility with:

- Raspberry Pi Zero 2 W  
- fkms (legacy video layer)  
- fbcp-ili9341  
- ST7789 SPI displays  

### ✔ Supported OS:
- Raspberry Pi OS **Bullseye**  
- Raspberry Pi OS **Legacy** Bullseye  
- Raspberry Pi OS **Legacy** Buster

### ❌ NOT Supported:
- Raspberry Pi OS **Bookworm**
- Any distro without **vc4-fkms-v3d**

---

## 🧪 Tested Hardware

This installer has been **fully tested** on:

- **Raspberry Pi Zero 2 W**
- 2.0" and 2.2" SPI displays (ST7789 – 240×320 rotated to 320×240)
- Custom fork of fbcp-ili9341 (with 320×240 patches)
- SPI running at 62–125 MHz (clock divisors 4–2)

---

## 🚀 Usage

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y git

git clone https://github.com/leopinnheiro/fbcp-raspi-st7789-setup.git
cd fbcp-raspi-st7789-setup

chmod +x setup_display.sh
sudo ./setup_display.sh
```

The script will:

1. Install system dependencies

2. Activate SPI

3. Enable legacy FKMS video stack

4. Clone and build leopinnheiro fbcp-ili9341 fork

5. Install a systemd service

6. Ask if you want to reboot

After reboot, the ST7789 display will automatically start mirroring the framebuffer.

## ⚠️ Notes

- The installer does not overwrite your /boot/config.txt, it only appends safe entries.

- You are free to edit pin assignments, rotation and SPI speed during setup.

- The scripts are modular and can be reused in other automation systems.