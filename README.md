Here’s the **complete `README.md`** file with all details included:

---

```markdown
# NetDetect

NetDetect is a powerful network diagnostic tool that provides real-time visualization of network paths and includes geolocation data for enhanced analysis. This script is based on MTR and integrates data from ProxyCheck.io for detailed insights.

---

## Features

- **Real-Time Analysis:** Displays network paths, packet loss, and latency.
- **Geolocation Data:** Shows countries, states, and cities for each hop.
- **Proxy Detection:** Identifies VPNs and proxies in the network path.
- **Customizable:** Easily modify the script to suit your needs.

---

## Prerequisites

Before installing NetDetect, ensure the following:

- A Linux-based operating system.
- `sudo` privileges.
- Installed dependencies: `curl`, `jq`, and `mtr`.

---

## Installation

Follow the steps below to install and run NetDetect:

### **Step 1: Install Required Packages**
Install the necessary dependencies for the script to work:
```bash
sudo apt update
sudo apt install curl jq mtr -y
```

### **Step 2: Download the Script**
Download the `mtr-netdetect.sh` script directly using `wget`:
```bash
wget https://raw.githubusercontent.com/Cybersecsolution/NetDetect/refs/heads/main/mtr-netdetect.sh -O mtr-netdetect.sh
```

### **Step 3: Make the Script Executable**
Change the permissions to allow execution of the script:
```bash
chmod +x mtr-netdetect.sh
```

### **Step 4: Run NetDetect**
Run the script to start network diagnostics:
```bash
sudo ./mtr-netdetect.sh <hostname>
```

Replace `<hostname>` with a target like `google.com` or an IP address.

---

## Usage

### Example:
To analyze the network path to `google.com`:
```bash
sudo ./mtr-netdetect.sh google.com
```

This will display:
- Network hops to `google.com`.
- Geolocation data for each hop.
- Proxy and risk information.

### Example Output:
```
=======================================================================================================================
                                   Welcome to NetDetect
                                Developer: cybersecuritysolution
                                Date: 11/22/2024
=======================================================================================================================
Hops  | Host                 | Loss%   | Sent  | Last    | Avg     | Best    | Wrst    | StDev   | Country        | State      | City         | VPN | ASN       | Risk
-----------------------------------------------------------------------------------------------------------------------
1.--- | 209.74.64.1          | 0.0%    | 5     | 14.3    | 20.9    | 13.3    | 42.9    | 12.6    | United States | Virginia   | Ashburn      | yes | AS22612   | 66
2.--- | 199.193.7.169        | 0.0%    | 5     | 0.5     | 0.5     | 0.5     | 0.6     | 0.1     | United States | Arizona    | Phoenix      | yes | AS22612   | 66
...
```

---

## Troubleshooting

### 1. **404 Error When Downloading the Script**
- Ensure the file URL is correct:
  ```plaintext
  https://raw.githubusercontent.com/Cybersecsolution/NetDetect/refs/heads/main/mtr-netdetect.sh
  ```
- Verify your internet connection.
- Use the `telnet` command to confirm GitHub is reachable:
  ```bash
  telnet github.com 443
  ```
  If this fails, your server might be blocking GitHub.

### 2. **Permission Denied When Running the Script**
- Ensure the script is executable:
  ```bash
  chmod +x mtr-netdetect.sh
  ```

### 3. **Dependencies Not Found**
- Reinstall the required packages:
  ```bash
  sudo apt install curl jq mtr -y
  ```

---

## Repository Setup Guide

### **Step 1: Create the Repository**
1. Go to [GitHub](https://github.com).
2. Create a new repository named `NetDetect`.
3. Set the repository to **Public**.
4. Click `Create Repository`.

### **Step 2: Add the Script**
1. Navigate to the repository.
2. Click `Add file` > `Upload files`.
3. Drag and drop the `mtr-netdetect.sh` script.
4. Add a commit message like `"Add mtr-netdetect.sh script"`.
5. Click `Commit changes`.

### **Step 3: Verify the Raw URL**
1. Go to the script in your repository.
2. Click `Raw` to get the URL.
3. Test the URL by downloading the file:
   ```bash
   wget https://raw.githubusercontent.com/Cybersecsolution/NetDetect/refs/heads/main/mtr-netdetect.sh -O mtr-netdetect.sh
   ```

---

## Notes

- This project uses the [ProxyCheck.io](https://proxycheck.io) API for geolocation and proxy detection. Ensure your API key is set correctly in the script.
- Feel free to contribute to the repository by submitting pull requests or issues.

---

## License

This project is open-source and available under the [MIT License](LICENSE).

---

## Support

If you encounter issues, feel free to open an issue in the [GitHub repository](https://github.com/Cybersecsolution/NetDetect).

```

---

This `README.md` contains everything required for setup, usage, troubleshooting, and repository management. Let me know if you need further refinements!
