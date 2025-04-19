# 🐧 Raspberry Pi 4 Internal Monitoring with Telegraf + InfluxDB

This repo contains a ready-to-use package for monitoring a Raspberry Pi 4 using Telegraf. Metrics include:

- CPU, Memory, Disk, Network
- GPIO input
- Wi-Fi signal strength
- Package count
- SD card file count
- Power throttling
- Systemd service status
- OS update availability
- TCP/UDP stats via `nstat`

---

## 📦 What's Inside

- `telegraf.conf`: Cleaned-up config file
- `*.sh` scripts: Used to collect advanced metrics
- `read_gpio18.py`: Python-based GPIO reader

---

## ✅ How to Use on Another Pi

1. Copy the package to your target Pi:
   ```bash
   scp telegraf_rpi4_package.tar.gz pi@otherpi:~
   ```

2. SSH into the target Pi and extract:
   ```bash
   tar -xzvf telegraf_rpi4_package.tar.gz
   ```

3. Move the files:
   ```bash
   sudo mv telegraf.conf /etc/telegraf/
   sudo mv *.sh *.py /usr/local/bin/
   sudo chmod +x /usr/local/bin/*.sh /usr/local/bin/*.py
   ```

4. Allow Telegraf to run GPIO script:
   ```bash
   sudo visudo
   # Add this line:
   telegraf ALL=(ALL) NOPASSWD: /usr/local/bin/read_gpio18.py
   ```

5. Restart Telegraf:
   ```bash
   sudo systemctl restart telegraf
   ```

---

## 📄 License

This repository is open-sourced under the [MIT License](LICENSE).

It is a personal integration project based on ideas and guidance from:
- ChatGPT (OpenAI)
- The Udemy course by Sean Bradley: *Grafana – The Complete Guide*

No source code from external tools or courses was directly copied.
