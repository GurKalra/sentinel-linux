# Sentinel Linux

> **Predict. Protect. Recover.** > An intelligent, CLI-first system guardian that predicts update breakages, protects dependencies, and recovers Linux environments.

![Python Version](https://img.shields.io/badge/python-3.10%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-Active_Development-orange)
![FOSS Hack 2026](https://img.shields.io/badge/FOSS_Hack-2026-purple)

---

## The Problem: Linux Instability Anxiety
Every Linux user knows the anxiety of running `sudo apt upgrade`. Updates silently break kernel modules, NVIDIA driver versions mismatch, and Secure Boot complicates everything. Linux fails predictably, but no one checks the engine before hitting the gas.

## The Solution: An Intelligence Layer
Sentinel Linux is a proactive system guardian. It isn't just a reaction script; it is an intelligence layer that interprets the complex relationships between kernel version shifts, hardware security states, and driver dependencies *before* your system breaks.

## Core Features (In Development)
* **Surgical Prediction (`sentinel predict`):** Simulates incoming updates, parses the exact kernel version, and cross-references it against current `dkms` dependencies and `mokutil` Secure Boot states. Catches exact collisions with zero false positives.
* **Pattern Interpretation (`sentinel diagnose`):** Uses an extensible, JSON-based schema to parse `journalctl` boot errors and match them to specific, actionable terminal commands.

---

## Installation & Setup
Sentinel is built entirely on native open-source binaries with zero proprietary APIs.

**1. Clone the repository**
```bash
git clone https://github.com/GurKalra/sentinel-linux.git
cd sentinel-linux
```
***for ssh**
```bash
git clone git@github.com:GurKalra/sentinel-linux.git
cd sentinel-linux
```

**2. Create a virtual enviroment**
```bash
python3 -m venv .venv
source .venv/bin/activate
```

**3. Install the CLI locally.**
```bash
pip install -e .
```

---

## Usage
Once installed, Sentinel acts as a native Linux command.

* To see the help menu and avaliable commands:
```bash
sentinel --help
```
* To run a system update simulatoin and risk analysis:
```bash
sentinel predict
```
* To diagnose critical system logs from the current boot:
```bash
sentinel diagnose
```
---

## FOSSHack 2026 Roadmap
This project is actively being built for FOSS Hack 2026.
* [x] Phase 0: CLI Scaffolding and Environment Setup
* [ ] Phase 1: Predict Engine (Subprocess integration with apt)
* [ ] Phase 2: Collision Logic (DKMS and Secure Boot cross-referencing)
* [ ] Phase 3: Diagnose Engine & Extensible Rules Schema
* [ ] Phase 4: Terminal UI Polish (using Rich)

---

## License
This project is open-source and available under the **MIT License**. You are free to copy, modify, and distribute this software, as long as the original copyright and license notice are included. 

See the [LICENSE](LICENSE) file for more details.
