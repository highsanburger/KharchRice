## Restore Windows Entry in GRUB
```bash
mount /dev/nvme0n1p1 /mnt/windows-efi
grub-mkconfig -o /boot/grub/grub.cfg

