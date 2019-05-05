################################################################################
#
# xmz_weston_init_systemd
#
################################################################################

XMZ_WESTON_INIT_SYSTEMD_VERSION = 0.1.0
XMZ_WESTON_INIT_SYSTEMD_SITE = ../custom/package/xmz_weston_init_systemd
XMZ_WESTON_INIT_SYSTEMD_SITE_METHOD = local
XMZ_WESTON_INIT_SYSTEMD_LICENSE = GPL-2.0+
XMZ_WESTON_INIT_SYSTEMD_LICENSE_FILES = COPYING
# XMZ_WESTON_INIT_SYSTEMD_INSTALL_STAGING = YES

XMZ_WESTON_INIT_SYSTEMD_DEPENDENCIES = weston systemd


define XMZ_WESTON_INIT_SYSTEMD_INSTALL_INIT_SYSTEMD
		$(INSTALL) -D -m 0755 $(@D)/weston.service \
				$(TARGET_DIR)/usr/lib/systemd/system/weston.service
		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
		ln -sf /usr/lib/systemd/system/weston.service \
				$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/weston.service
endef

$(eval $(generic-package))
