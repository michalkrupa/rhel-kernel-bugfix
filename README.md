# README: ACPI MADT Override Fix for MiTAC PH12LI (Intel i7-4770TE)

## NOTICE
[Update] This issue is resolved upon applying [D7340A06 BIOS update](https://github.com/michalkrupa/rhel-kernel-bugfix/blob/main/D7340A06.zip), but may affect older systems with similar architectures.

## 🛠️ Problem Summary

Systems based on the MiTAC PH12LI motherboard with Intel i7-4770TE CPUs exhibit a firmware bug in the ACPI MADT (APIC) table. When Hyper-Threading (HT) is enabled in BIOS:

- The BIOS only exposes 4 LAPIC entries (for physical cores) in the MADT.
- However, the SSDT/DSDT tables define 8 logical CPUs (CPU0–CPU7).
- This inconsistency causes Linux (RHEL 9) to boot with:
  - Missing logical CPUs
  - Unstable or frozen IRQs
  - Kernel hangs when using HT

This archive contains a workaround using an ACPI MADT override.

---

## ✅ What’s Included

- `apic.aml`: Fixed ACPI MADT (APIC) table, exposing all 8 logical CPUs
- `apic.dsl`: Original editable source of the override (disassembled format)
- `README.txt`: This file

---

## 🔧 Installation Instructions

### 1. Copy the `apic.aml` file
```bash
sudo mkdir -p /etc/acpi_override
sudo cp apic.aml /etc/acpi_override/apic.aml
```

### 2. Rebuild the initramfs (RHEL/CentOS)
```bash
sudo dracut -f --add "acpi" /boot/initramfs-$(uname -r).img $(uname -r)
```

### 3. Apply required GRUB kernel parameters
```bash
sudo grubby --update-kernel=ALL --args="acpi_apic_instance=1 acpi_override"
```

### 4. Reboot the system
```bash
sudo reboot
```

### 5. Confirm the override was applied
```bash
dmesg | grep -i 'apic\|override'
lscpu
```

Look for:
- `ACPI: Overriding APIC table via initrd`
- 8 logical CPUs (`lscpu` shows `CPU(s): 8`)

---

## 🧪 Verification

After reboot, run:

```bash
lscpu
cat /proc/interrupts
dmesg | grep -i acpi
```

You should see 8 CPUs and no interrupt or LAPIC errors.

---

## 🛑 Reverting the Change

To undo:
```bash
sudo rm /etc/acpi_override/apic.aml
sudo dracut -f
sudo grubby --update-kernel=ALL --remove-args="acpi_apic_instance=1 acpi_override"
```

Then reboot normally.

---

## 📝 Submission

This fix has been submitted to:

- https://bugzilla.redhat.com (Product: RHEL 9, Component: kernel)
- MiTAC support for firmware patch consideration
- [Public Inbox](https://public-inbox.org/meta/1040359549.145146.1747727540641@mail.yahoo.com/T/#u)

Bug Summary:
> MiTAC PH12LI firmware exposes incomplete MADT APIC table with HT enabled; fixed via custom ACPI override.

---

## ⚠️ Disclaimer
* CPU burst may cause system instability depending on voltage controls. To avert this issue, ensure that CPU frequency is reduced by 10% - for this particular system, this can be accomlished via:

``` bash
echo 3210000 | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
sudo vim /etc/systemd/system/cpu-freq-max.service
sudo chmod 644 /etc/systemd/system/cpu-freq-max.service
sudo ln -s /etc/systemd/system/cpu-freq-max.service /etc/systemd/system/multi-user.target.wants/
```

Contents of `cpu-freq-max.service`:

```
[Unit]
Description=Set CPU Maximum Frequency
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'echo 3210000 > /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

It is also recommended to set governor powercontrols to `ondemand`:

```
sudo vim /etc/systemd/system/cpu-governor.service
sudo chmod 644 /etc/systemd/system/cpu-governor.service
sudo ln -s /etc/systemd/system/cpu-governor.service /etc/systemd/system/multi-user.target.wants/
```

`cpu-governor.service` contents:

```
[Unit]
Description=Set CPU Governor to ondemand
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'echo ondemand > /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
Use at your own risk. This override patches a BIOS-level defect from userspace. It's intended for debugging and restoring expected CPU layout on Linux systems. Always keep a backup initramfs and test in a controlled environment.

### Contributor Notes
Completion of this project could not be done without help from the [ChatGPT Platform](ChatGPT.com)

