################################################################################
#
# resize-rootfs
#
################################################################################

RESIZE_ROOTFS_VERSION = 0.1.0
RESIZE_ROOTFS_SITE = ../custom/package/resize-rootfs
RESIZE_ROOTFS_SITE_METHOD = local
RESIZE_ROOTFS_LICENSE = GPL-2.0+
RESIZE_ROOTFS_LICENSE_FILES = COPYING

RESIZE_ROOTFS_DEPENDENCIES = systemd e2fsprogs parted util-linux parted udev

define RESIZE_ROOTFS_INSTALL_INIT_SYSTEMD
		$(INSTALL) -D -m 0755 $(@D)/resize-rootfs.sh $(TARGET_DIR)/sbin/resize-rootfs.sh
		$(INSTALL) -D -m 0755 $(@D)/resize-rootfs.service \
				$(TARGET_DIR)/usr/lib/systemd/system/resize-rootfs.service
		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
		ln -sf /usr/lib/systemd/system/resize-rootfs.service \
				$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/resize-rootfs.service
endef

$(eval $(generic-package))
