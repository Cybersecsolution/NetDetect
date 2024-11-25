# **Paping Installation and Usage Guide**

Paping is a network utility for testing TCP connectivity to a specific hostname or IP address. This guide provides step-by-step instructions for installing, compiling, and using Paping on Ubuntu.

---

## **Prerequisites**
Ensure you meet the following requirements:
- A Linux-based operating system.
- Sudo privileges.
- Basic familiarity with terminal commands.

---

## **Step 1: Installation**

### **1. Clone the Repository**
Download the `paping` source code from GitHub:
```bash
git clone https://github.com/koolhazz/paping.git
```

Navigate to the cloned directory:
```bash
cd paping
```

### **2. Update the System**
Run the following command to update your package list:
```bash
sudo apt update
```

### **3. Install Required Dependencies**
Install the necessary tools and libraries:
```bash
sudo apt install build-essential g++ g++-multilib libssl-dev
```

### **4. Create the Output Directory**
Set up the directory to store the compiled binary:
```bash
mkdir -p ./bin
```

---

## **Step 2: Compile the Code**
Build the project using `make`:
```bash
make
```

---

## **Step 3: Running Paping**

### **1. Execute the Binary**
Run `paping` using the compiled binary. Replace `www.google.com` with your target hostname or IP address, and `80` with the desired port:
```bash
./bin/i386-paping www.google.com -p 80 -c 4
```

### **2. Command Explanation**
- **`www.google.com`**: The target hostname.
- **`-p 80`**: Specifies the port number (80 for HTTP).
- **`-c 4`**: Sets the number of connection attempts (4 in this example).

---
```
