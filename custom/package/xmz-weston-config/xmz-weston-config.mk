################################################################################
#
# xmz_weston_config
#
################################################################################

XMZ_WESTON_CONFIG_VERSION = 0.2.0
XMZ_WESTON_CONFIG_SITE = ../custom/package/xmz-weston-config
XMZ_WESTON_CONFIG_SITE_METHOD = local
XMZ_WESTON_CONFIG_LICENSE = GPL-2.0+
XMZ_WESTON_CONFIG_LICENSE_FILES = COPYING

XMZ_WESTON_CONFIG_DEPENDENCIES = weston systemd

ifeq ($(BR2_PACKAGE_XMZ_WESTON_CONFIG_WALLPAPER_ZZEROO),y)
# wallpaper zzeroo system
XMZ_WESTON_CONFIG_WALLPAPER_NAME = wallpaper-desktop-zzeroo-systems.png
else
# wallpaper RA-GAS
XMZ_WESTON_CONFIG_WALLPAPER_NAME = wallpaper-desktop-ra-gas.png
endif

define XMZ_WESTON_CONFIG_INSTALL_TARGET_CMDS
		# weston configuration
		$(INSTALL) -D -m 0644 $(@D)/weston.ini \
				$(TARGET_DIR)/etc/xdg/weston/weston.ini

		$(INSTALL) -D -m 0644 $(@D)/$(XMZ_WESTON_CONFIG_WALLPAPER_NAME) \
				$(TARGET_DIR)/usr/share/backgrounds/weston-desktop.png

		$(INSTALL) -D -m 0644 $(@D)/disable_mousepointer.rules \
				$(TARGET_DIR)/etc/udev/rules.d/disable_mousepointer.rules
endef

$(eval $(generic-package))
