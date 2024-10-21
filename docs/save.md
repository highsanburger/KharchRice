## Restore Grub after windows update 
```bash
    mount /dev/nvme0n1p5 /mnt
    mount /dev/nvme0n1p4 /mnt/boot
    arch-chroot /mnt
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
    grub-mkconfig -o /boot/grub/grub.cfg
```

## Restore Windows Entry in GRUB
```bash
mount /dev/nvme0n1p1 /mnt/windows-efi
grub-mkconfig -o /boot/grub/grub.cfg

