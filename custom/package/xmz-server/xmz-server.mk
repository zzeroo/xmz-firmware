################################################################################
#
# xmz-server
#
################################################################################

# XMZ_SERVER_VERSION = master
XMZ_SERVER_VERSION = 39b8203b73cb3b98b70e85ea3e8072bf4ac6f61f
XMZ_SERVER_SITE = $(call github,zzeroo,xmz-server,$(XMZ_SERVER_VERSION))
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
	$(foreach u,$(shell find $(@D)/$(XMZ_SERVER_BIN_DIR)/ -maxdepth 1 -executable -type f -printf "%f\n"),\
	$(INSTALL) -D -m 0755 $(@D)/$(XMZ_SERVER_BIN_DIR)/$(u) $(TARGET_DIR)/usr/bin/$(u)$(sep))
endef

$(eval $(generic-package))
