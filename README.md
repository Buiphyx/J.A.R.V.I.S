# J.A.R.V.I.S
**Quick navigation:**
[Introduction](#introduction) | [Inspiration](#inspiration) | [Features](#features) | [Installation and Usage](#installation-and-usage) | [Author](#author)

---

## Introduction

JARVIS is a simple Bash CLI tool that bundles common Linux system checks—like IP address, hostname, uptime, disk space, and memory—into easy-to-run options. It automatically logs your activity to `~/logs/bashlogs.log` and shows the help menu whenever an option is missing or unrecognized.

---

## Inspiration

I saw the idea for this project on the internet and rebuilt it as a Bash practice project. I enhanced the main idea with extra functions.

---

## Features

| Option | What it does |
|---|---|
| `help` | Shows the help menu |
| `ip` | Shows this machine's IP address |
| `hostname` | Shows this machine's hostname |
| `uptime` | Shows how long the machine has been running, and since when |
| `datetime` | Shows the current date and time (Cairo timezone) |
| `replacewords` | Replaces a word inside a file, with an optional backup |
| `diskcheck` | Shows disk usage in a readable format |
| `memcheck` | Shows RAM and swap usage |

Every time you run an option, the tool writes a line to a log file with the date, your username, and the option you used.

---

## Installation and Usage

**Requirements:** Linux (or WSL on Windows), Bash, and Git.

**1. Clone the repository**
```bash
git clone https://github.com/Buiphyx/J.A.R.V.I.S.git
cd J.A.R.V.I.S
```

**2. Make the script executable**
```bash
chmod +x J.A.R.V.I.S.sh
```

**3. Run it**
```bash
./J.A.R.V.I.S.sh help
./J.A.R.V.I.S.sh ip
./J.A.R.V.I.S.sh diskcheck
./J.A.R.V.I.S.sh memcheck
```
For example, `./J.A.R.V.I.S.sh help` shows all the available options.

**4. Check the log**
```bash
cat ~/logs/bashlogs.log
```
The `logs` folder is created automatically the first time you run the script.

> **Note:** `replacewords` edits a file in place. Choose `Y` when it asks about a backup if you want to keep the original.

---

## Author

**[Abdelrahman Mohamed]**
GitHub: [@Buiphyx](https://github.com/Buiphyx)
