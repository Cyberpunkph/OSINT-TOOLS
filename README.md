# 🚀 RUBY OSINT TOOLKIT v4.0

<p align="center">
  <img src="assets/banner.png" alt="RUBY OSINT TOOLKIT v4 Banner">
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/Cyberpunkph/OSINT-TOOLS
?style=for-the-badge">
  <img src="https://img.shields.io/github/forks/Cyberpunkph/OSINT-TOOLS
?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/Cyberpunkph/OSINT-TOOLS
?style=for-the-badge">
  <img src="https://img.shields.io/github/license/Cyberpunkph/OSINT-TOOLS
?style=for-the-badge">
</p>

<p align="center">
  <b>⚡ Advanced OSINT Toolkit for Username, Domain, and Network Intelligence</b>
</p>

---

## 🧠 Features

* 🔍 **Username OSINT (Smart Detection Engine)**
* 🌐 **TOR / Proxy Support (Anonymous Scanning)**
* ⚡ **Concurrent Scanning (Fast & Efficient)**
* 📊 **HTML Report Dashboard**
* 📁 **Multiple Output Formats (JSON, TXT, HTML)**
* 🧩 **Modular Architecture (Expandable)**

---

## 📸 Preview

<p align="center">
  <img src="https://via.placeholder.com/700x400/020617/22c55e?text=OSINT+Preview">
</p>

---

## 🛠️ Installation

```bash
git clone https://github.com/Cyberpunkph/OSINT-TOOLS
.git
cd YOUR_REPO
bundle install
```

---

## 🚀 Usage

### 🔍 Username Scan

```bash
ruby main.rb -n johndoe
```

🌐 Domain OSINT

```bash
ruby main.rb -d example.com
```

📡 IP Lookup

```bash
ruby main.rb -i 8.8.8.8
```

📧 Email Scraping

```bash
ruby main.rb -u https://example.com
```

🧠 FULL COMBO (🔥)

```bash
ruby main.rb -n johndoe -d example.com -i 8.8.8.8
```

---

## 📂 Project Structure

```
ruby-osint-toolkit/
│
├── main.rb
├── config/
├── modules/
├── utils/
├── output/
└── Gemfile
```

---

## 📊 Output

After scanning, results are saved in:

```
output/
├── report.json
├── report.txt
└── report.html
```

---

## ⚙️ Configuration

Edit:

```
config/sites.json
```

Add new platforms easily:

```json
{
  "name": "GitHub",
  "url": "https://github.com/{username}",
  "errorType": "status_code"
}
```

---

## 🧠 Detection Engine

Supports:

* ✅ Status Code Detection
* ✅ Content-Based Detection
* ✅ Regex Matching
* ✅ Redirect Handling

---

## ⚠️ Disclaimer

This tool is for **educational and ethical OSINT purposes only**.

Do NOT use this tool for:

* Unauthorized tracking
* Harassment
* Illegal investigations

---

## 👨‍💻 Author

**CyberpunkPH**

---

## ⭐ Support

If you like this project:

* ⭐ Star the repo
* 🍴 Fork it
* 🧠 Contribute

---

## 🔥 Roadmap (v5)

* 🧠 AI Username Correlation
* 🌐 100+ Site Database
* 📡 Breach / Dark Web Integration
* 🖥️ Web Dashboard UI

---

<p align="center">
  ⚡ Built for Hackers, Investigators & Cybersecurity Enthusiasts ⚡
</p>
