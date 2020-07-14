################################################################################
#
# xmz-test-tool
#
################################################################################

XMZ_TEST_TOOL_VERSION = 14c259d6d515a60d14746d05a6431cf8df19e1e9
XMZ_TEST_TOOL_SITE = git://github.com/Kliemann-Service-GmbH/xmz-test-tool.git
XMZ_TEST_TOOL_LICENSE = GPL-2.0+
XMZ_TEST_TOOL_LICENSE_FILES = COPYING

XMZ_TEST_TOOL_DEPENDENCIES = host-cargo libgtk3

XMZ_TEST_TOOL_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo PKG_CONFIG_ALLOW_CROSS=1
XMZ_TEST_TOOL_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)

XMZ_TEST_TOOL_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(XMZ_TEST_TOOL_CARGO_MODE)

XMZ_TEST_TOOL_CARGO_OPTS = \
 --$(XMZ_TEST_TOOL_CARGO_MODE) \
   --target=$(RUSTC_TARGET_NAME) \
   --manifest-path=$(@D)/Cargo.toml

define XMZ_TEST_TOOL_BUILD_CMDS
   $(TARGET_MAKE_ENV) $(XMZ_TEST_TOOL_CARGO_ENV) \
           cargo build $(XMZ_TEST_TOOL_CARGO_OPTS)
endef

define XMZ_TEST_TOOL_INSTALL_TARGET_CMDS
   $(INSTALL) -D -m 0644 $(@D)/$(XMZ_TEST_TOOL_BIN_DIR)/xmz-test-tool \
           $(TARGET_DIR)/usr/bin/xmz-test-tool
endef

$(eval $(generic-package))
