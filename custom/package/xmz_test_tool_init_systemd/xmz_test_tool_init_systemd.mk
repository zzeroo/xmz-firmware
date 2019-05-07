################################################################################
#
# xmz_test_tool_init_systemd
#
################################################################################

XMZ_TEST_TOOL_INIT_SYSTEMD_VERSION = 0.1.0
XMZ_TEST_TOOL_INIT_SYSTEMD_SITE = ../custom/package/xmz_test_tool_init_systemd
XMZ_TEST_TOOL_INIT_SYSTEMD_SITE_METHOD = local
XMZ_TEST_TOOL_INIT_SYSTEMD_LICENSE = GPL-2.0+
XMZ_TEST_TOOL_INIT_SYSTEMD_LICENSE_FILES = COPYING

XMZ_TEST_TOOL_INIT_SYSTEMD_DEPENDENCIES = weston systemd xmz_test_tool


define XMZ_TEST_TOOL_INIT_SYSTEMD_INSTALL_INIT_SYSTEMD
		$(INSTALL) -D -m 0755 $(@D)/xmz-test-tool.service \
				$(TARGET_DIR)/usr/lib/systemd/system/xmz-test-tool.service
		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
		ln -sf /usr/lib/systemd/system/xmz-test-tool.service \
				$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/xmz-test-tool.service
endef


$(eval $(generic-package))
