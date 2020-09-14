################################################################################
#
# xmz-config
#
################################################################################

XMZ_CONFIG_VERSION = 0.2.0
XMZ_CONFIG_SITE = ../custom/package/xmz-config
XMZ_CONFIG_SITE_METHOD = local
XMZ_CONFIG_LICENSE = GPL-2.0+
XMZ_CONFIG_LICENSE_FILES = COPYING

XMZ_CONFIG_DEPENDENCIES = wpa_supplicant

ifeq ($(XMZ_CONFIG_WLAN),y)
define XMZ_CONFIG_INSTALL_TARGET_CMDS
		$(INSTALL) -D -m 0644 $(@D)/wpa_supplicant.conf \
				$(TARGET_DIR)/etc/wpa_supplicant/wpa_supplicant-wlan0.conf

		$(INSTALL) -D -m 0644 $(@D)/25-wireless.network \
				$(TARGET_DIR)/etc/systemd/network/25-wireless.network

		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
		ln -sf /usr/lib/systemd/system/wpa_supplicant@wlan0.service \
				$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service
endef
else
endif
$(eval $(generic-package))
