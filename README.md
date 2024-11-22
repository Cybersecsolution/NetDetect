# **NetDetect Installation and Usage Guide**

NetDetect is a powerful diagnostic tool for real-time network path visualization and analysis. Below is the updated step-by-step guide for installing, configuring, and using NetDetect.

---

## **Prerequisites**
Before using NetDetect, ensure you have the following:
- A Linux-based operating system.
- Sudo privileges.

---

## **Step 1: Installation**
### **1. Install Required Dependencies**
Run the following command to install the necessary dependencies:
```bash
sudo apt update && sudo apt install jq curl mtr -y
```

### **2. Download the Script**
Move to your desired directory and download the script:
```bash
cd ~
wget -O mtr-netdetect.sh https://raw.githubusercontent.com/Cybersecsolution/NetDetect/refs/heads/main/mtr-netdetect.sh
```

### **3. Make the Script Executable**
Provide execute permissions to the script:
```bash
chmod +x mtr-netdetect.sh
```

---

## **Step 2: Running the Script**
### **1. Navigate to the Script Directory**
Move to the directory where the script is located:
```bash
cd /path/to/script
```

### **2. Run the Script**
Use the following command to execute NetDetect:
```bash
sudo ./mtr-netdetect.sh google.com
```
Replace `google.com` with any domain or IP address you want to analyze.

### **3. Add Your API Key**
The script requires your ProxyCheck API key to function. You can set your API key in the script by editing the `api_key` variable:
```bash
nano mtr-netdetect.sh
```

---

## **Step 3: Optional Global Installation**
If you'd like to run NetDetect from anywhere:
1. Move the script to `/usr/local/bin`:
   ```bash
   sudo mv mtr-netdetect.sh /usr/local/bin/
   ```
2. Run the script globally:
   ```bash
   mtr-netdetect.sh google.com
   ```

---

## **Step 4: Stopping the Script**
To stop the script, press:
```text
Ctrl + C
```
This will cleanly exit and reset the terminal.

---

## **How to Use NetDetect**
1. Execute the script:
   ```bash
   ./mtr-netdetect.sh <domain_or_ip>
   ```
2. View the network path with details such as:
   - **Hops**: Number of network hops.
   - **Loss%**: Packet loss percentage.
   - **Latency Stats**: Last, Average, Best, Worst, and Standard Deviation.
   - **Geolocation**: Country, State, and City.
   - **Proxy/VPN Detection**: Indicates if the hop uses a proxy or VPN.
   - **ASN**: Autonomous System Number.
   - **Risk Score**: Threat risk score.

---

## **Troubleshooting**
### **Error: Command Not Found**
- Ensure you're in the correct directory where `mtr-netdetect.sh` is located.
- Use the absolute path:
  ```bash
  /path/to/mtr-netdetect.sh google.com
  ```

### **Permission Denied**
- Add executable permissions:
  ```bash
  chmod +x mtr-netdetect.sh
  ```

### **Dependencies Missing**
- Ensure `jq`, `curl`, and `mtr` are installed:
  ```bash
  sudo apt install jq curl mtr -y
  ```

### **API Key Issues**
- Verify that your ProxyCheck API key is correct and entered in the `api_key` variable of the script.

---

## **Credits**
- **Developer**: Sergio Marquina

