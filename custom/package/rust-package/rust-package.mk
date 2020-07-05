################################################################################
#
# rust-package
#
################################################################################

RUST_PACKAGE_SITE_METHOD = git
RUST_PACKAGE_VERSION = d6a130aea823ddbfea75fb695b5abd8e03a1cc7d
RUST_PACKAGE_SITE = https://github.com/zzeroo/hello-world-rs.git
RUST_PACKAGE_LICENSE = GPL-2.0+
RUST_PACKAGE_LICENSE_FILES = COPYING

RUST_PACKAGE_DEPENDENCIES = host-cargo libgtk3

RUST_PACKAGE_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo PKG_CONFIG_ALLOW_CROSS=1 CROSS_COMPILE="$(TARGET_CROSS)"
RUST_PACKAGE_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)

RUST_PACKAGE_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RUST_PACKAGE_CARGO_MODE)

RUST_PACKAGE_CARGO_OPTS = \
 --$(RUST_PACKAGE_CARGO_MODE) \
   --target=$(RUSTC_TARGET_NAME) \
   --manifest-path=$(@D)/Cargo.toml

define RUST_PACKAGE_BUILD_CMDS
   $(TARGET_MAKE_ENV) $(RUST_PACKAGE_CARGO_ENV) \
           cargo build $(RUST_PACKAGE_CARGO_OPTS)
endef

define RUST_PACKAGE_INSTALL_TARGET_CMDS
	$(foreach u,$(shell find $(@D)/$(RUST_PACKAGE_BIN_DIR)/ -maxdepth 1 -executable -type f -printf "%f\n"),\
	$(INSTALL) -D -m 0755 $(@D)/$(RUST_PACKAGE_BIN_DIR)/$(u) $(TARGET_DIR)/usr/bin/$(u)$(sep))
endef

$(eval $(generic-package))
