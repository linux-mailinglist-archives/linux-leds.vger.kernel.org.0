Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B64381E35
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhEPKzP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFF1961186;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=AuVERok4KX/jUZLx1XW8gvHPzx66bBgJiH+lfN+zUjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o+qnwtEIjAN3CQZ0zNfGDlATQbKB7j/tblhszC4zS6OafNz2ZgkgOG7xALdptk6N7
         iNpJHxuL6bhwUBds6+CFwqhKvIlMcuq2xZ8Y7PWPXpoSBPAVWVQcn5f7oP8EKxYOv0
         UDkCdFZF/Nnq2JWsVHNPrQaElCwoISYEq5kbJYo5I1+djuFQDtE0ERhEKxBMpAi7p7
         gSfmbztMgTVtgr5vhxlTVe11erO5yqo0LYZmgg+j4PwiZc+MNvj8tEB3mmEoIeQV/f
         8Emrb+QXHkn++VAA+nbqsULfQyHTTyOdY3kLuHHaa986SuaVCVsuTjZbX+Ltmf94z/
         fl8s5P+GPDOOw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s80-LI; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 01/17] staging: add support for NUC WMI LEDs
Date:   Sun, 16 May 2021 12:53:29 +0200
Message-Id: <7cec257fcc6e5789e5620495674e442a727a766f.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Some Intel Next Unit of Computing (NUC) machines have
software-configured LEDs that can be used to display a
variety of events:

	- Power State
	- HDD Activity
	- Ethernet
	- WiFi
	- Power Limit

They can even be controlled directly via software, without
any hardware-specific indicator connected into them.

Some devices have mono-colored LEDs, but the more advanced
ones have RGB leds that can show any color.

Different color and 4 blink states can be programmed for
thee system states:

	- powered on (S0);
	- S3;
	- Standby.

The NUC BIOSes allow to partially set them for S0, but doesn't
provide any control for the other states, nor does allow
changing the blinking logic.

They all use a WMI interface using GUID:
	8C5DA44C-CDC3-46b3-8619-4E26D34390B7

But there are 3 different revisions of the spec, all using
the same GUID, but two different APIs:

- the original one, for NUC6 and to NUCi7:
	- https://www.intel.com/content/www/us/en/support/articles/000023426/intel-nuc/intel-nuc-kits.html

- a new one, starting with NUCi8, with two revisions:
	- https://raw.githubusercontent.com/nomego/intel_nuc_led/master/specs/INTEL_WMI_LED_0.64.pdf
	- https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf

There are some OOT drivers for them, but they use procfs
and use a messy interface to setup it. Also, there are
different drivers with the same name, each with support
for each NUC family.

Let's start a new driver from scratch, using the x86 platform
WMI core and the LED class.

This initial version is compatible with NUCi8 and above, and it
was tested with a Hades Canyon NUC (NUC8i7HNK).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS                       |   6 +
 drivers/staging/Kconfig           |   2 +
 drivers/staging/Makefile          |   1 +
 drivers/staging/nuc-led/Kconfig   |  11 +
 drivers/staging/nuc-led/Makefile  |   3 +
 drivers/staging/nuc-led/TODO      |   6 +
 drivers/staging/nuc-led/nuc-wmi.c | 489 ++++++++++++++++++++++++++++++
 7 files changed, 518 insertions(+)
 create mode 100644 drivers/staging/nuc-led/Kconfig
 create mode 100644 drivers/staging/nuc-led/Makefile
 create mode 100644 drivers/staging/nuc-led/TODO
 create mode 100644 drivers/staging/nuc-led/nuc-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..50d181e1d745 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13063,6 +13063,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/aia21/ntfs.git
 F:	Documentation/filesystems/ntfs.rst
 F:	fs/ntfs/
 
+NUC LED DRIVER
+M:      Mauro Carvalho Chehab <mchehab@kernel.org>
+L:      devel@driverdev.osuosl.org
+S:      Maintained
+F:      drivers/staging/nuc-led
+
 NUBUS SUBSYSTEM
 M:	Finn Thain <fthain@telegraphics.com.au>
 L:	linux-m68k@lists.linux-m68k.org
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index b7ae5bdc4eb5..d1a8e3e08d00 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -84,6 +84,8 @@ source "drivers/staging/greybus/Kconfig"
 
 source "drivers/staging/vc04_services/Kconfig"
 
+source "drivers/staging/nuc-led/Kconfig"
+
 source "drivers/staging/pi433/Kconfig"
 
 source "drivers/staging/mt7621-pci/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 075c979bfe7c..de937f947edb 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_UNISYSSPAR)	+= unisys/
 obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clocking-wizard/
 obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_MOST)		+= most/
+obj-$(CONFIG_LEDS_NUC_WMI)	+= nuc-led/
 obj-$(CONFIG_KS7010)		+= ks7010/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
diff --git a/drivers/staging/nuc-led/Kconfig b/drivers/staging/nuc-led/Kconfig
new file mode 100644
index 000000000000..0f870f45bf44
--- /dev/null
+++ b/drivers/staging/nuc-led/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config LEDS_NUC_WMI
+	tristate "Intel NUC WMI support for LEDs"
+	depends on LEDS_CLASS
+	depends on ACPI_WMI
+	help
+	  Enable this to support the Intel NUC WMI support for
+	  LEDs, starting from NUCi8 and upper devices.
+
+	  To compile this driver as a module, choose M here.
diff --git a/drivers/staging/nuc-led/Makefile b/drivers/staging/nuc-led/Makefile
new file mode 100644
index 000000000000..abba9e305fa1
--- /dev/null
+++ b/drivers/staging/nuc-led/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_LEDS_NUC_WMI)		+= nuc-wmi.o
diff --git a/drivers/staging/nuc-led/TODO b/drivers/staging/nuc-led/TODO
new file mode 100644
index 000000000000..d5296d7186a7
--- /dev/null
+++ b/drivers/staging/nuc-led/TODO
@@ -0,0 +1,6 @@
+- Add support for 6th gen NUCs, like Skull Canyon
+- Improve LED core support to avoid it to try to manage the
+  LED brightness directly;
+- Test it with 8th gen NUCs;
+- Add more functionality to the driver;
+- Stabilize and document its sysfs interface.
diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
new file mode 100644
index 000000000000..15d956ad8556
--- /dev/null
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Intel NUC WMI Control WMI Driver
+ *
+ * Currently, it implements only the LED support
+ *
+ * Copyright(c) 2021 Mauro Carvalho Chehab
+ *
+ * Inspired on WMI from https://github.com/nomego/intel_nuc_led
+ *
+ * It follows this spec:
+ *	https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/wmi.h>
+
+#define NUC_LED_WMI_GUID	"8C5DA44C-CDC3-46B3-8619-4E26D34390B7"
+
+#define MAX_LEDS		7
+#define NUM_INPUT_ARGS		4
+#define NUM_OUTPUT_ARGS		3
+
+enum led_cmds {
+	LED_QUERY			= 0x03,
+	LED_NEW_GET_STATUS		= 0x04,
+	LED_SET_INDICATOR		= 0x05,
+	LED_SET_VALUE			= 0x06,
+	LED_NOTIFICATION		= 0x07,
+	LED_SWITCH_TYPE			= 0x08,
+};
+
+enum led_query_subcmd {
+	LED_QUERY_LIST_ALL		= 0x00,
+	LED_QUERY_COLOR_TYPE		= 0x01,
+	LED_QUERY_INDICATOR_OPTIONS	= 0x02,
+	LED_QUERY_CONTROL_ITEMS		= 0x03,
+};
+
+enum led_new_get_subcmd {
+	LED_NEW_GET_CURRENT_INDICATOR	= 0x00,
+	LED_NEW_GET_CONTROL_ITEM	= 0x01,
+};
+
+/* LED color indicator */
+#define LED_BLUE_AMBER		BIT(0)
+#define LED_BLUE_WHITE		BIT(1)
+#define LED_RGB			BIT(2)
+#define	LED_SINGLE_COLOR	BIT(3)
+
+/* LED indicator options */
+#define LED_IND_POWER_STATE	BIT(0)
+#define LED_IND_HDD_ACTIVITY	BIT(1)
+#define LED_IND_ETHERNET	BIT(2)
+#define LED_IND_WIFI		BIT(3)
+#define LED_IND_SOFTWARE	BIT(4)
+#define LED_IND_POWER_LIMIT	BIT(5)
+#define LED_IND_DISABLE		BIT(6)
+
+static const char * const led_names[] = {
+	"nuc::power",
+	"nuc::hdd",
+	"nuc::skull",
+	"nuc::eyes",
+	"nuc::front1",
+	"nuc::front2",
+	"nuc::front3",
+};
+
+struct nuc_nmi_led {
+	struct led_classdev cdev;
+	struct device *dev;
+	u8 id;
+	u8 indicator;
+	u32 color_type;
+	u32 avail_indicators;
+	u32 control_items;
+};
+
+struct nuc_wmi {
+	struct nuc_nmi_led led[MAX_LEDS * 3];	/* Worse case: RGB LEDs */
+	int num_leds;
+
+	/* Avoid concurrent access to WMI */
+	struct mutex wmi_lock;
+};
+
+static int nuc_nmi_led_error(u8 error_code)
+{
+	switch (error_code) {
+	case 0:
+		return 0;
+	case 0xe1:	/* Function not support */
+		return -ENOENT;
+	case 0xe2:	/* Undefined device */
+		return -ENODEV;
+	case 0xe3:	/* EC no respond */
+		return -EIO;
+	case 0xe4:	/* Invalid Parameter */
+		return -EINVAL;
+	case 0xef:	/* Unexpected error */
+		return -EFAULT;
+
+	/* Revision 1.0 Errors */
+	case 0xe5:	/* Node busy */
+		return -EBUSY;
+	case 0xe6:	/* Destination device is disabled or unavailable */
+		return -EACCES;
+	case 0xe7:	/* Invalid CEC Opcode */
+		return -ENOENT;
+	case 0xe8:	/* Data Buffer size is not enough */
+		return -ENOSPC;
+
+	default:	/* Reserved */
+		return -EPROTO;
+	}
+}
+
+static int nuc_nmi_cmd(struct device *dev,
+		       u8 cmd,
+		       u8 input_args[NUM_INPUT_ARGS],
+		       u8 output_args[NUM_OUTPUT_ARGS])
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct nuc_wmi *priv = dev_get_drvdata(dev);
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+	int size, ret;
+	u8 *p;
+
+	input.length = NUM_INPUT_ARGS;
+	input.pointer = input_args;
+
+	mutex_lock(&priv->wmi_lock);
+	status = wmi_evaluate_method(NUC_LED_WMI_GUID, 0, cmd,
+				     &input, &output);
+	mutex_unlock(&priv->wmi_lock);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(dev, "cmd %02x (%*ph): ACPI failure: %d\n",
+			 cmd, (int)input.length, input_args, ret);
+		return status;
+	}
+
+	obj = output.pointer;
+	if (!obj) {
+		dev_warn(dev, "cmd %02x (%*ph): no output\n",
+			 cmd, (int)input.length, input_args);
+		return -EINVAL;
+	}
+
+	if (obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length < NUM_OUTPUT_ARGS + 1) {
+			ret = -EINVAL;
+			goto err;
+		}
+		p = (u8 *)obj->buffer.pointer;
+	} else if (obj->type == ACPI_TYPE_INTEGER) {
+		p = (u8 *)&obj->integer.value;
+	} else {
+		return -EINVAL;
+	}
+
+	ret = nuc_nmi_led_error(p[0]);
+	if (ret) {
+		dev_warn(dev, "cmd %02x (%*ph): WMI error code: %02x\n",
+			 cmd, (int)input.length, input_args, p[0]);
+		goto err;
+	}
+
+	size = NUM_OUTPUT_ARGS + 1;
+
+	if (output_args) {
+		memcpy(output_args, p + 1, NUM_OUTPUT_ARGS);
+
+		dev_info(dev, "cmd %02x (%*ph), return: %*ph\n",
+			 cmd, (int)input.length, input_args, NUM_OUTPUT_ARGS, output_args);
+	} else {
+		dev_info(dev, "cmd %02x (%*ph)\n",
+			 cmd, (int)input.length, input_args);
+	}
+
+err:
+	kfree(obj);
+	return ret;
+}
+
+static int nuc_wmi_query_leds(struct device *dev)
+{
+	struct nuc_wmi *priv = dev_get_drvdata(dev);
+	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	int i, id, ret;
+	u8 leds;
+
+	/*
+	 * List all LED types support in the platform
+	 *
+	 * Should work with both NUC8iXXX and NUC10iXXX
+	 *
+	 * FIXME: Should add a fallback code for it to work with older NUCs,
+	 * as LED_QUERY returns an error on older devices like Skull Canyon.
+	 */
+	cmd = LED_QUERY;
+	input[0] = LED_QUERY_LIST_ALL;
+	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	if (ret) {
+		dev_warn(dev, "error %d while listing all LEDs\n", ret);
+		return ret;
+	}
+
+	leds = output[0];
+	if (!leds) {
+		dev_warn(dev, "No LEDs found\n");
+		return -ENODEV;
+	}
+
+	for (id = 0; id < MAX_LEDS; id++) {
+		struct nuc_nmi_led *led = &priv->led[priv->num_leds];
+
+		if (!(leds & BIT(id)))
+			continue;
+
+		led->id = id;
+
+		cmd = LED_QUERY;
+		input[0] = LED_QUERY_COLOR_TYPE;
+		input[1] = id;
+		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		if (ret) {
+			dev_warn(dev, "error %d on led %i\n", ret, i);
+			return ret;
+		}
+
+		led->color_type = output[0]      |
+				  output[1] << 8 |
+				  output[2] << 16;
+
+		cmd = LED_NEW_GET_STATUS;
+		input[0] = LED_NEW_GET_CURRENT_INDICATOR;
+		input[1] = i;
+		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		if (ret) {
+			dev_warn(dev, "error %d on led %i\n", ret, i);
+			return ret;
+		}
+
+		led->indicator = output[0];
+
+		cmd = LED_QUERY;
+		input[0] = LED_QUERY_INDICATOR_OPTIONS;
+		input[1] = i;
+		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		if (ret) {
+			dev_warn(dev, "error %d on led %i\n", ret, i);
+			return ret;
+		}
+
+		led->avail_indicators = output[0]      |
+					output[1] << 8 |
+					output[2] << 16;
+
+		cmd = LED_QUERY;
+		input[0] = LED_QUERY_CONTROL_ITEMS;
+		input[1] = i;
+		input[2] = led->indicator;
+		ret = nuc_nmi_cmd(dev, cmd, input, output);
+		if (ret) {
+			dev_warn(dev, "error %d on led %i\n", ret, i);
+			return ret;
+		}
+
+		led->control_items = output[0]      |
+				     output[1] << 8 |
+				     output[2] << 16;
+
+		dev_dbg(dev, "%s: id: %02x, color type: %06x, indicator: %06x, control items: %06x\n",
+			led_names[led->id], led->id,
+			led->color_type, led->indicator, led->control_items);
+
+		priv->num_leds++;
+	}
+
+	return 0;
+}
+
+/*
+ * LED show/store routines
+ */
+
+#define LED_ATTR_RW(_name) \
+	DEVICE_ATTR(_name, 0644, show_##_name, store_##_name)
+
+static const char * const led_indicators[] = {
+	"Power State",
+	"HDD Activity",
+	"Ethernet",
+	"WiFi",
+	"Software",
+	"Power Limit",
+	"Disable"
+};
+
+static ssize_t show_indicator(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	int size = PAGE_SIZE;
+	char *p = buf;
+	int i, n;
+
+	for (i = 0; i < fls(led->avail_indicators); i++) {
+		if (!(led->avail_indicators & BIT(i)))
+			continue;
+		if (i == led->indicator)
+			n = scnprintf(p, size, "[%s]  ", led_indicators[i]);
+		else
+			n = scnprintf(p, size, "%s  ", led_indicators[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+}
+
+static ssize_t store_indicator(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	const char *tmp;
+	int ret, i;
+
+	tmp = strsep((char **)&buf, "\n");
+
+	for (i = 0; i < fls(led->avail_indicators); i++) {
+		if (!(led->avail_indicators & BIT(i)))
+			continue;
+
+		if (!strcasecmp(tmp, led_indicators[i])) {
+			cmd = LED_SET_INDICATOR;
+			input[0] = led->id;
+			input[1] = i;
+
+			dev_dbg(dev, "set led %s indicator to %s\n",
+				cdev->name, led_indicators[i]);
+
+			ret = nuc_nmi_cmd(dev, cmd, input, NULL);
+			if (ret)
+				return ret;
+
+			led->indicator = i;
+
+			return len;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static LED_ATTR_RW(indicator);
+
+/*
+ * Attributes for multicolor LEDs
+ */
+
+static struct attribute *nuc_wmi_multicolor_led_attr[] = {
+	&dev_attr_indicator.attr,
+	NULL,
+};
+
+static const struct attribute_group nuc_wmi_led_attribute_group = {
+	.attrs		= nuc_wmi_multicolor_led_attr,
+};
+
+static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
+	&nuc_wmi_led_attribute_group,
+	NULL
+};
+
+static int nuc_wmi_led_register(struct device *dev, struct nuc_nmi_led *led)
+{
+	led->cdev.name = led_names[led->id];
+
+	led->dev = dev;
+	led->cdev.groups = nuc_wmi_led_attribute_groups;
+
+	/*
+	 * It can't let the classdev to manage the brightness due to several
+	 * reasons:
+	 *
+	 * 1) classdev has some internal logic to manage the brightness,
+	 *    at set_brightness_delayed(), which starts disabling the LEDs;
+	 *    While this makes sense on most cases, here, it would appear
+	 *    that the NUC was powered off, which is not what happens;
+	 * 2) classdev unconditionally tries to set brightness for all
+	 *    leds, including the ones that were software-disabled or
+	 *    disabled disabled via BIOS menu;
+	 * 3) There are 3 types of brightness values for each LED, depending
+	 *    on the CPU power state: S0, S3 and S5.
+	 *
+	 * So, the best seems to export everything via sysfs attributes
+	 * directly. This would require some further changes at the
+	 * LED class, though, or we would need to create our own LED
+	 * class, which seems wrong.
+	 */
+
+	return devm_led_classdev_register(dev, &led->cdev);
+}
+
+static int nuc_wmi_leds_setup(struct device *dev)
+{
+	struct nuc_wmi *priv = dev_get_drvdata(dev);
+	int ret, i;
+
+	ret = nuc_wmi_query_leds(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < priv->num_leds; i++) {
+		ret = nuc_wmi_led_register(dev, &priv->led[i]);
+		if (ret) {
+			dev_err(dev, "Failed to register led %d: %s\n",
+				i, led_names[priv->led[i].id]);
+			while (--i >= 0)
+				devm_led_classdev_unregister(dev, &priv->led[i].cdev);
+
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int nuc_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct device *dev = &wdev->dev;
+	struct nuc_wmi *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	mutex_init(&priv->wmi_lock);
+
+	dev_set_drvdata(dev, priv);
+
+	ret = nuc_wmi_leds_setup(dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "NUC WMI driver initialized.\n");
+	return 0;
+}
+
+static void nuc_wmi_remove(struct wmi_device *wdev)
+{
+	struct device *dev = &wdev->dev;
+
+	dev_info(dev, "NUC WMI driver removed.\n");
+}
+
+static const struct wmi_device_id nuc_wmi_descriptor_id_table[] = {
+	{ .guid_string = NUC_LED_WMI_GUID },
+	{ },
+};
+
+static struct wmi_driver nuc_wmi_driver = {
+	.driver = {
+		.name = "nuc-wmi",
+	},
+	.probe = nuc_wmi_probe,
+	.remove = nuc_wmi_remove,
+	.id_table = nuc_wmi_descriptor_id_table,
+};
+
+module_wmi_driver(nuc_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, nuc_wmi_descriptor_id_table);
+MODULE_AUTHOR("Mauro Carvalho Chehab <mchehab+huawei@kernel.org>");
+MODULE_DESCRIPTION("Intel NUC WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1

