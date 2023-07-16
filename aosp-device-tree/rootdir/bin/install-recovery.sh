#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:83886080:bc8698bda0e3269d01fa9bd0bfd60bf79e6e9b8e; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:100663296:b251e2af443b5d0ad9c128e7a0451543e120895b \
          --target EMMC:/dev/block/by-name/recovery:83886080:bc8698bda0e3269d01fa9bd0bfd60bf79e6e9b8e && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
