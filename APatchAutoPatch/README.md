# APatch Auto Patch Tool

# **NOTICE: This repository has been moved to [new repository](https://github.com/nya-main/APatchAutoPatchTool)**

**The repository is EOL.**

---

This script will:

- Obtain the current boot image of your phone.
- Download the latest KernelPatch and magiskboot from GitHub Release.
- Patch the extracted boot image.
- Flash the patched image.

---

## Usage

- Open Termux

- Prepare

```bash
cd ${HOME}
curl -LO https://github.com/nya-main/Small-Tools/raw/main/APatchAutoPatch/AAP.sh
chmod +x AAP.sh
```

*After this, You can directly run AAP.sh after command tsu is executed.*

- Run

Usage:
```
APatch Auto Patch Tool
Written by nya
Version: 0.1.1
Current WORKDIR: ${WORKDIR}

-h, -v,                 print the usage and version.

-i [BOOT IMAGE PATH],   dpecify a boot image path.
-n,                     do not install the patched boot image, save the image in /storage/emulated/0/patched_boot.img.
-s "STRING",            specify a superkey. Use STRING as superkey.
```

Example:

```bash
# Before you run this script, grant root permission
tsu

# Directly run
./AAP.sh 

# Specify a boot **IMAGE** path (NOT BOOT PARTITION PATH)
./AAP.sh -i /sdcard/Download/boot_a.img
```

---

## TODO

- [x] User-specified boot image path.

---

If you encounter any issues, please submit a issue on github or provide feedback to me:[Telegram](https://t.me/nya_main)
