

---

# **NetDetect Installation and Usage Guide**

NetDetect is a diagnostic tool for real-time network path visualization and analysis. This guide provides step-by-step instructions for installing, configuring, and using NetDetect.

---

## **Prerequisites**
Ensure you meet the following requirements:
- A Linux-based operating system.
- Sudo privileges.

---

## **Step 1: Installation**

### **1. Install Required Dependencies**
Run this command to install the necessary dependencies:
```bash
sudo apt update && sudo apt install jq curl mtr -y
```

### **2. Download the Script**
Navigate to your desired directory and download the script:
```bash
cd ~
wget -O mtr-netdetect.sh https://raw.githubusercontent.com/Cybersecsolution/NetDetect/refs/heads/main/mtr-netdetect.sh
```

### **3. Make the Script Executable**
Provide executable permissions:
```bash
chmod +x mtr-netdetect.sh
```

---

## **Step 2: Running the Script**
Run NetDetect with the following command:
```bash
sudo ./mtr-netdetect.sh google.com
```
Replace `google.com` with the domain or IP address you wish to analyze.

---

## **Step 3: Optional Global Installation**
To run NetDetect from any directory:
1. Move the script to `/usr/local/bin`:
   ```bash
   sudo mv mtr-netdetect.sh /usr/local/bin/
   ```
2. Execute it globally:
   ```bash
   mtr-netdetect.sh google.com
   ```

---

## **Step 4: Stopping the Script**
To stop the script, press:
```text
Ctrl + C
```
This will cleanly terminate the script and reset the terminal.

---

## **How to Use NetDetect**
### **Execution**
Run the script:
```bash
./mtr-netdetect.sh <domain_or_ip>
```

### **Output Details**
The script provides information such as:
- **Hops**: Number of network hops.
- **Loss%**: Packet loss percentage.
- **Latency Stats**: Last, Average, Best, Worst, and Standard Deviation.
- **Geolocation**: Country, State, and City.
- **Proxy/VPN Detection**: Identifies if the hop uses a proxy or VPN.
- **ASN**: Autonomous System Number.
- **Risk Score**: Threat risk score for each hop.

---

## **Troubleshooting**

### **Error: Command Not Found**
- Verify you’re in the correct directory:
  ```bash
  cd /path/to/mtr-netdetect.sh
  ```
- Alternatively, use the absolute path:
  ```bash
  /path/to/mtr-netdetect.sh google.com
  ```

### **Permission Denied**
- Ensure the script has executable permissions:
  ```bash
  chmod +x mtr-netdetect.sh
  ```

### **Missing Dependencies**
- Reinstall the required dependencies:
  ```bash
  sudo apt install jq curl mtr -y
  ```

### **API Key Issues**
- Check and update the `api_key` variable in the script with your ProxyCheck API key.

---

## **Credits**
- **Developer**: Sergio Marquina

--- 

This version is concise, professional, and easy to follow. Let me know if you need further adjustments!
