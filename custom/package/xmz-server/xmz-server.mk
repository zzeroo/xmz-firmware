################################################################################
#
# xmz-server
#
################################################################################

# XMZ_SERVER_VERSION = master
XMZ_SERVER_VERSION = development
XMZ_SERVER_SITE = git://github.com/zzeroo/xmz-server.git
XMZ_SERVER_LICENSE = GPL-2.0+
XMZ_SERVER_LICENSE_FILES = COPYING

# XMZ_SERVER_DEPENDENCIES = host-cargo libgtk3

XMZ_SERVER_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo PKG_CONFIG_ALLOW_CROSS=1
XMZ_SERVER_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)

XMZ_SERVER_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(XMZ_SERVER_CARGO_MODE)

XMZ_SERVER_CARGO_OPTS = \
 --$(XMZ_SERVER_CARGO_MODE) \
   --target=$(RUSTC_TARGET_NAME) \
   --manifest-path=$(@D)/Cargo.toml

define XMZ_SERVER_BUILD_CMDS
   $(TARGET_MAKE_ENV) $(XMZ_SERVER_CARGO_ENV) \
           cargo build $(XMZ_SERVER_CARGO_OPTS)
endef

define XMZ_SERVER_INSTALL_TARGET_CMDS
   $(INSTALL) -D -m 0755 $(@D)/$(XMZ_SERVER_BIN_DIR)/xmz-server \
           $(TARGET_DIR)/usr/bin/xmz-server
endef

$(eval $(generic-package))
