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

## **Step 4: Optional Global Installation**
To make `paping` accessible globally:
1. Move the compiled binary to `/usr/local/bin`:
   ```bash
   sudo cp ./bin/i386-paping /usr/local/bin/paping
   ```
2. Run `paping` from anywhere:
   ```bash
   paping www.google.com -p 80 -c 4
   ```

---

## **Troubleshooting**

### **Error: Command Not Found**
- Ensure you’re running the command from the correct directory:
  ```bash
  cd /path/to/paping/bin
  ```
- Alternatively, use the absolute path to the binary:
  ```bash
  /path/to/bin/i386-paping www.google.com -p 80 -c 4
  ```

### **Permission Denied**
- Ensure the binary has executable permissions:
  ```bash
  chmod +x ./bin/i386-paping
  ```

### **Missing Dependencies**
- Reinstall the required dependencies:
  ```bash
  sudo apt install build-essential g++ g++-multilib libssl-dev
  ```

---

## **Credits**
- **Repository**: [koolhazz/paping](https://github.com/koolhazz/paping)

--- 
```
