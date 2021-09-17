include balena-image.inc

BALENA_BOOT_PARTITION_FILES_append = " \
	grub.cfg_internal:/EFI/BOOT/grub.cfg \
	grub.cfg_internal:/grub/grub.cfg \
	"

IMAGE_INSTALL_append_genericx86-64-ext =" \
    linux-firmware                        \
"

IMAGE_ROOTFS_SIZE_genericx86-64-ext = "1024000"

IMAGE_INSTALL_append_odyssey-x86 =" \
    linux-firmware                        \
"

IMAGE_ROOTFS_SIZE_odyssey-x86 = "1024000"
