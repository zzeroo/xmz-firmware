################################################################################
#
# xmz_weston_config
#
################################################################################

XMZ_WESTON_CONFIG_VERSION = 0.1.0
XMZ_WESTON_CONFIG_SITE = ../custom/package/xmz_weston_config
XMZ_WESTON_CONFIG_SITE_METHOD = local
XMZ_WESTON_CONFIG_LICENSE = GPL-2.0+
XMZ_WESTON_CONFIG_LICENSE_FILES = COPYING

XMZ_WESTON_CONFIG_DEPENDENCIES = weston systemd


define XMZ_WESTON_CONFIG_INSTALL_TARGET_CMDS
		# weston configuration
		$(INSTALL) -D -m 0644 $(@D)/weston.ini \
				$(TARGET_DIR)/etc/xdg/weston/weston.ini
		# wallpaper RA-GAS
		$(INSTALL) -D -m 0644 $(@D)/wallpaper-desktop-ra-gas.png \
				$(TARGET_DIR)/usr/share/backgrounds/ra-gas/wallpaper-desktop-ra-gas.png
		# disable mouse pointer
		$(INSTALL) -D -m 0644 $(@D)/disable_mousepointer.rules \
				$(TARGET_DIR)/etc/udev/rules.d/disable_mousepointer.rules
endef

$(eval $(generic-package))
