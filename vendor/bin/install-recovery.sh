#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:16c4b3fbad6a1be982214d6aead117ddad526eb6; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:6e04117e8420ef91733e1994aa8cbb3363814313 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:16c4b3fbad6a1be982214d6aead117ddad526eb6 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
