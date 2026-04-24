Return-Path: <linux-leds+bounces-7842-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OfjFzdw62nCMwAAu9opvQ
	(envelope-from <linux-leds+bounces-7842-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 15:29:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE89045F085
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 15:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23D0D30067AB
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 13:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB313D75C2;
	Fri, 24 Apr 2026 13:29:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7F3D6CB6
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037352; cv=none; b=UF6q1A3YGCf8O5hWieybROvVRP8VAOlhUuJ7eTItR1C69MVgfv3p1DRkYFjR1OBHxAuy6AWjFxzkYMwC+SQSlM7Es5ZKu2Fx+AS4+hEhIrEzNb6xPsq9D0WQLfqNe0hz0TZJynxgBx6F/HvjQvt3v+TP6lVZUofBfiyC7yWl/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037352; c=relaxed/simple;
	bh=GcRZENehk2a3yZ0JR/OSNL562tv5I5eFJcCGaKtBRrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sBEbNTYlSv8jW9dzo7OKQrojMGSaU9ZWhvpGBAEnPDnzs2Dq1F05wQc2Ox+4KXSzrBg4aPyUJGz3ff1vX4U/6F7HCh6tjTziJOii5i0GR7B2SNm/jcKVP/zL3Xdn+gN/FstEW1MVNn+Xy8M8ce/MIb50EUpBoeP/HEj6soO56/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wGGaX-0002aI-Ge; Fri, 24 Apr 2026 15:28:57 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Apr 2026 15:28:56 +0200
Subject: [PATCH v9] leds: add support for TI LP5860 LED driver chip
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIABdw62kC/3XSzU7DMAwH8FeZeibI+XTCifdAHNLE3SKhtmpLN
 TT13fEmoAea499SfrZi35qZpkJz83K6NROtZS5DzyE8nZp0if2ZRMmcGwXKgpJBrE5II5ZhLEk
 sRXyM1jsQnbLR+NaphKHht+NEXbk+3Ld3zpcyL8P09Wizynv1R1RQEVcpQBjl0bQ5oZX6daT+/
 LlMQ1+uz5maO7uqnbKMVCjFFCpKyXfRxIyHlN6pIGWN0kzpAKg9dSGjPKTMHyUBsEYZpoJDtB5
 caB0cUnanpKz+lWXKtojYhhAD2EPK/VKOF1mdiqvCmojOZd4nqEMKd0pD7SZWZKqVlF1y0WCiQ
 8rvlAFdozxTJBWSB/Jo4z9q27ZvxVVn4cwCAAA=
X-Change-ID: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: EE89045F085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7842-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add support for the Texas Instruments LP5860 LED driver chip
via SPI interfaces.

The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
short and open detection of the individual channel select lines.

It can be connected to SPI or I2C bus. For now add support for SPI only.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v9:
- disable chip on error
- use dev_err_probe in whole probe sequence
- fail on missing reg property -> binding specifies this as mandatory
- fix double free in lp5860_iterate_subleds if reg property is missing
- Link to v8: https://patch.msgid.link/20260403-v6-14-topic-ti-lp5860-v8-1-e127e80e875a@pengutronix.de

Changes in v8:
- Kconfig fix help text
- move header back to local folder
- remove unused gpio.h
- fix define used to check invalid dot usage
- fix led_brightness usage as boolean
- rename variable name led -> lp
- split subled iteration to function
- fail subled on missing color property
- set mc_brightness once after subleds are parsed
- rename *_OFFSET to *_SHIFT
- document uncommon regmap setup
- use dev_err_probe instead of dev_err to handle deferred probing
- Link to v7: https://lore.kernel.org/r/20260309-v6-14-topic-ti-lp5860-v7-1-b1ed6c6a47ce@pengutronix.de

Changes in v7:
- s/spi/SPI/
- rebase to current leds-for-next (v7.0-rc1)

Changes since v6:
- fix compilation as module
- remove unnecessary select on FW_LOADER
- Link to v6: https://lore.kernel.org/r/20251201-v6-14-topic-ti-lp5860-v6-0-be9a21218157@pengutronix.de

Changes since v5:
- Kconfig depends -> select
- change some function/variable names
- change line breaks (80char -> 100char)
- call led_init_default_state_get once
- rename index variable i -> led_index
- don't fail on missing dt-properties
- remove sysfs_create_group residue from v5
- Link to v5: https://lore.kernel.org/r/20251110-v6-14-topic-ti-lp5860-v5-0-5b777b99a905@pengutronix.de

Changes since v4:
- remove global_brightness code and sysfs ABI
- rebase to v6.18-rc1
- Link to v4: https://lore.kernel.org/r/20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de

Changes since v3:
- move to drivers/leds/rgb
- fix some upper/lowercase
- use ATTRIBUTE_GROUPS macro
- unwrap some lines
- Link to v3: https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de

Changes since v2:
- fix c-styling errors
- rename functions/defines/variables
- split out ABI documentation
- rename [rgb]_current* to [rgb]_global_brightness*
- rework multi-led probing
- Link to v2: https://lore.kernel.org/r/20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de

Changes since v1:
- add open and short detection
- add ABI documentation
- fix devicetree binding (maxItems/minItems)
- fix commit message to imperative mood
- minor cleanup
- Link to v1: https://lore.kernel.org/r/20250220-v6-14-topic-ti-lp5860-v1-0-42874bdc7513@pengutronix.de
---
 drivers/leds/rgb/Kconfig            |  25 ++++
 drivers/leds/rgb/Makefile           |   2 +
 drivers/leds/rgb/leds-lp5860-core.c | 231 +++++++++++++++++++++++++++++++
 drivers/leds/rgb/leds-lp5860-spi.c  |  92 +++++++++++++
 drivers/leds/rgb/leds-lp5860.h      | 267 ++++++++++++++++++++++++++++++++++++
 5 files changed, 617 insertions(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 28ef4c487367c..9a4ba6531cf87 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -39,6 +39,31 @@ config LEDS_LP5812
 
 	  If unsure, say N.
 
+config LEDS_LP5860_CORE
+	tristate "Core Driver for TI LP5860"
+	depends on LEDS_CLASS
+	depends on OF
+	select REGMAP
+	help
+	  This option supports common operations for LP5860 devices.
+	  The LP5860 is a LED matrix driver with 18 constant current
+	  sinks and 11 scan switches for 198 LED dots. Each dot can be
+	  controlled individually and supports 8/16-bit PWM dimming.
+	  The chip supports individual LED open and short detection.
+
+	  The device can be used with SPI or I2C bus.
+
+config LEDS_LP5860_SPI
+	tristate "LED Support for TI LP5860 SPI LED driver chip"
+	depends on SPI
+	select LEDS_LP5860_CORE
+	help
+	  If you say yes here you get support for the Texas Instruments
+	  LP5860 LED driver for SPI bus connections.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-lp5860-spi.
+
 config LEDS_NCP5623
 	tristate "LED support for NCP5623"
 	depends on I2C
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index be45991f63f50..f3b365ea082d1 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -3,6 +3,8 @@
 obj-$(CONFIG_LEDS_GROUP_MULTICOLOR)	+= leds-group-multicolor.o
 obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
 obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
+obj-$(CONFIG_LEDS_LP5860_CORE)		+= leds-lp5860-core.o
+obj-$(CONFIG_LEDS_LP5860_SPI)		+= leds-lp5860-spi.o
 obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
new file mode 100644
index 0000000000000..648bf168f94bf
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Pengutronix
+ *
+ * Author: Steffen Trumtrar <kernel@pengutronix.de>
+ */
+
+#include <linux/led-class-multicolor.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "leds-lp5860.h"
+
+static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
+{
+	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
+}
+
+static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
+{
+	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
+	unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
+
+	if (dot > LP5860_MAX_LED)
+		return -EINVAL;
+
+	return regmap_update_bits(led->chip->regmap,
+				  LP5860_REG_DOT_ONOFF_START + offset, mask,
+				  enable ? LP5860_DOT_ALL_ON : LP5860_DOT_ALL_OFF);
+}
+
+static int lp5860_set_mc_brightness(struct led_classdev *cdev,
+				    enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct lp5860_led *led = mcled_cdev_to_led(mc_cdev);
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	for (int i = 0; i < led->mc_cdev.num_colors; i++) {
+		unsigned int channel = mc_cdev->subled_info[i].channel;
+		unsigned int led_brightness = mc_cdev->subled_info[i].brightness;
+		int ret;
+
+		ret = lp5860_set_dot_onoff(led, channel, !!led_brightness);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(led->chip->regmap,
+				   LP5860_REG_PWM_BRI_START + channel, led_brightness);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int lp5860_chip_enable(struct lp5860 *lp, bool enable)
+{
+	return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);
+}
+
+static int lp5860_led_init(struct lp5860_led *led, struct fwnode_handle *fwnode,
+			   unsigned int channel)
+{
+	enum led_default_state default_state;
+	unsigned int brightness;
+	int ret;
+
+	ret = regmap_read(led->chip->regmap, LP5860_REG_PWM_BRI_START + channel, &brightness);
+	if (ret)
+		return ret;
+
+	default_state = led_init_default_state_get(fwnode);
+
+	switch (default_state) {
+	case LEDS_DEFSTATE_ON:
+		led->brightness = LP5860_MAX_BRIGHTNESS;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		led->brightness = min(brightness, LP5860_MAX_BRIGHTNESS);
+		break;
+	default:
+		led->brightness = 0;
+		break;
+	}
+
+	return 0;
+}
+
+static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *init_data)
+{
+	struct fwnode_handle *led_node = NULL;
+	struct fwnode_handle *multi_led = init_data->fwnode;
+	int subled = 0;
+
+	fwnode_for_each_child_node(multi_led, led_node) {
+		u32 channel;
+		u32 color_index;
+		int ret;
+
+		ret = fwnode_property_read_u32(led_node, "color", &color_index);
+		if (ret) {
+			dev_err_probe(led->chip->dev, ret,
+				      "%pfwP: Cannot read 'color' property. Skipping.\n", led_node);
+			fwnode_handle_put(led_node);
+			return ret;
+		}
+
+		ret = fwnode_property_read_u32(led_node, "reg", &channel);
+		if (ret < 0 || channel > LP5860_MAX_LED) {
+			dev_err_probe(led->chip->dev, ret,
+				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
+			fwnode_handle_put(led_node);
+			return ret;
+		}
+
+		led->mc_cdev.subled_info[subled].color_index = color_index;
+		led->mc_cdev.subled_info[subled].channel = channel;
+		ret = lp5860_led_init(led, init_data->fwnode, channel);
+		if (ret) {
+			dev_err_probe(led->chip->dev, ret,
+				      "%pfwP: Failed to init LED\n", led_node);
+			fwnode_handle_put(led_node);
+			return ret;
+		}
+
+		subled++;
+	}
+
+	return 0;
+}
+
+static int lp5860_init_dt(struct lp5860 *lp)
+{
+	struct led_init_data init_data = {};
+	struct led_classdev *led_cdev;
+	struct mc_subled *mc_led_info;
+	struct lp5860_led *led;
+	int led_index = 0;
+	int chan;
+	int ret;
+
+	device_for_each_child_node_scoped(lp->dev, multi_led) {
+		led = &lp->leds[led_index];
+
+		init_data.fwnode = multi_led;
+
+		/* Count the number of channels in this multi_led */
+		chan = fwnode_get_child_node_count(multi_led);
+		if (!chan || chan > LP5860_MAX_LED_CHANNELS)
+			return -EINVAL;
+
+		led->mc_cdev.num_colors = chan;
+
+		mc_led_info = devm_kcalloc(lp->dev, chan, sizeof(*mc_led_info), GFP_KERNEL);
+		if (!mc_led_info)
+			return -ENOMEM;
+
+		led->chip = lp;
+		led->mc_cdev.subled_info = mc_led_info;
+		led_cdev = &led->mc_cdev.led_cdev;
+		led_cdev->max_brightness = LP5860_MAX_BRIGHTNESS;
+		led_cdev->brightness_set_blocking = lp5860_set_mc_brightness;
+
+		ret = lp5860_iterate_subleds(led, &init_data);
+		if (ret)
+			continue;
+
+		ret = lp5860_set_mc_brightness(&led->mc_cdev.led_cdev, led->brightness);
+		if (ret) {
+			dev_err_probe(lp->dev, ret, "%pfwP: Failed to set Multi-Color brightness\n",
+				      multi_led);
+			return ret;
+		}
+
+		ret = devm_led_classdev_multicolor_register_ext(lp->dev, &led->mc_cdev, &init_data);
+		if (ret) {
+			dev_err_probe(lp->dev, ret, "%pfwP: Failed to register Multi-Color LEDs\n",
+				      multi_led);
+			return ret;
+		}
+		led_index++;
+	}
+
+	return 0;
+}
+
+int lp5860_device_init(struct device *dev)
+{
+	struct lp5860 *lp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = lp5860_chip_enable(lp, LP5860_CHIP_ENABLE);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set to 8-bit PWM data without VSYNC.
+	 * Data is sent out for display instantly after received.
+	 */
+	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
+				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
+	if (ret)
+		goto err_disable;
+
+	ret = lp5860_init_dt(lp);
+	if (ret)
+		goto err_disable;
+
+	return 0;
+
+err_disable:
+	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp5860_device_init);
+
+void lp5860_device_remove(struct device *dev)
+{
+	struct lp5860 *lp = dev_get_drvdata(dev);
+
+	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
+}
+EXPORT_SYMBOL_GPL(lp5860_device_remove);
+
+MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("TI LP5860 RGB LED core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
new file mode 100644
index 0000000000000..51d20188a44b1
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Pengutronix
+ *
+ * Author: Steffen Trumtrar <kernel@pengutronix.de>
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include "leds-lp5860.h"
+
+#define LP5860_SPI_WRITE_FLAG BIT(13)
+
+/*
+ * The lp5860 uses a rather uncommon SPI data format: The R/W flag is on BIT(5) in the two address
+ * bytes; BIT(4) to BIT(0) are don't care. Therefore it has 10 bits for the address and 6 bits for
+ * padding the address. The address bytes are sent MSB first. Matching the cores registers to regmap
+ * results in write_flag_mask being BIT(13).
+ */
+static const struct regmap_config lp5860_regmap_config = {
+	.name = "lp5860",
+	.reg_bits = 10,
+	.pad_bits = 6,
+	.val_bits = 8,
+	.write_flag_mask = LP5860_SPI_WRITE_FLAG,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = LP5860_MAX_REG,
+};
+
+static int lp5860_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct lp5860 *lp5860;
+	unsigned int multi_leds;
+
+	multi_leds = device_get_child_node_count(dev);
+	if (!multi_leds) {
+		dev_err(dev, "LEDs are not defined in Device Tree!");
+		return -ENODEV;
+	}
+
+	if (multi_leds > LP5860_MAX_LED) {
+		dev_err(dev, "Too many LEDs specified.\n");
+		return -EINVAL;
+	}
+
+	lp5860 = devm_kzalloc(dev, struct_size(lp5860, leds, multi_leds),
+			      GFP_KERNEL);
+	if (!lp5860)
+		return -ENOMEM;
+
+	lp5860->regmap = devm_regmap_init_spi(spi, &lp5860_regmap_config);
+	if (IS_ERR(lp5860->regmap))
+		return dev_err_probe(&spi->dev, PTR_ERR(lp5860->regmap),
+				     "Failed to initialise Regmap.\n");
+
+	lp5860->dev = dev;
+
+	spi_set_drvdata(spi, lp5860);
+
+	return lp5860_device_init(dev);
+}
+
+static void lp5860_remove(struct spi_device *spi)
+{
+	lp5860_device_remove(&spi->dev);
+}
+
+static const struct of_device_id lp5860_of_match[] = {
+	{ .compatible = "ti,lp5860" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lp5860_of_match);
+
+static struct spi_driver lp5860_driver = {
+	.driver = {
+		.name = "lp5860-spi",
+		.of_match_table = lp5860_of_match,
+	},
+	.probe	= lp5860_probe,
+	.remove = lp5860_remove,
+};
+module_spi_driver(lp5860_driver);
+
+MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
+MODULE_DESCRIPTION("TI LP5860 RGB LED SPI driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5860.h b/drivers/leds/rgb/leds-lp5860.h
new file mode 100644
index 0000000000000..7677aa6808166
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5860.h
@@ -0,0 +1,267 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Pengutronix
+ *
+ * Author: Steffen Trumtrar <kernel@pengutronix.de>
+ */
+
+#ifndef _DRIVERS_LEDS_RGB_LP5860_H
+#define _DRIVERS_LEDS_RGB_LP5860_H
+
+#include <linux/led-class-multicolor.h>
+#include <linux/regmap.h>
+
+#define LP5860_REG_CHIP_EN		0x00
+#define LP5860_REG_DEV_INITIAL		0x01
+#define LP5860_REG_DEV_CONFIG1		0x02
+#define LP5860_REG_DEV_CONFIG2		0x03
+#define LP5860_REG_DEV_CONFIG3		0x04
+#define LP5860_REG_GLOBAL_BRI		0x05
+#define LP5860_REG_GROUP0_BRI		0x06
+#define LP5860_REG_GROUP1_BRI		0x07
+#define LP5860_REG_GROUP2_BRI		0x08
+#define LP5860_REG_R_CURRENT_SET	0x09
+#define LP5860_REG_G_CURRENT_SET	0x0A
+#define LP5860_REG_B_CURRENT_SET	0x0B
+#define LP5860_REG_GRP_SEL_START	0x0C
+#define LP5860_REG_DOT_ONOFF_START	0x43
+#define LP5860_REG_DOT_ONOFF_MAX	0x63
+#define LP5860_REG_FAULT_STATE		0x64
+#define LP5860_REG_DOT_LOD_START	0x65
+#define LP5860_REG_DOT_LSD_START	0x86
+#define LP5860_REG_LOD_CLEAR		0xA7
+#define LP5860_REG_LSD_CLEAR		0xA8
+#define LP5860_REG_RESET		0xA9
+#define LP5860_REG_DC_START		0x0100
+#define LP5860_REG_PWM_BRI_START	0x0200
+#define LP5860_MAX_REG			0x038B
+
+/* Register chip_enable value */
+#define LP5860_CHIP_SHIFT		0
+#define LP5860_CHIP_MASK		BIT(0)
+#define LP5860_CHIP_DISABLE		false
+#define LP5860_CHIP_ENABLE		true
+
+/* Register dev_initial value */
+#define LP5860_MAX_LINE_SHIFT		3
+#define LP5860_MAX_LINE_MASK		GENMASK(6, 3)
+#define LP5860_MAX_LINE_11		0x0B
+#define LP5860_MAX_LINE_10		0x0A
+#define LP5860_MAX_LINE_9		0x09
+#define LP5860_MAX_LINE_8		0x08
+#define LP5860_MAX_LINE_7		0x07
+#define LP5860_MAX_LINE_6		0x06
+#define LP5860_MAX_LINE_5		0x05
+#define LP5860_MAX_LINE_4		0x04
+#define LP5860_MAX_LINE_3		0x03
+#define LP5860_MAX_LINE_2		0x02
+#define LP5860_MAX_LINE_1		0x01
+
+#define LP5860_MODE_SHIFT		1
+#define LP5860_MODE_MASK		GENMASK(2, 1)
+#define LP5860_MODE_3_1			0x03
+#define LP5860_MODE_3			0x02
+#define LP5860_MODE_2			0x01
+#define LP5860_MODE_1			0x00
+
+#define LP5860_PWM_FREQUENCY_SHIFT	0
+#define LP5860_PWM_FREQUENCY_MASK	BIT(0)
+#define LP5860_PWM_FREQUENCY_62_5K	0x01
+#define LP5860_PWM_FREQUENCY_125K	0x00
+
+/* Register dev_config1 value */
+#define LP5860_SW_BLK_SHIFT		3
+#define LP5860_SW_BLK_MASK		BIT(3)
+#define LP5860_SW_BLK_05US		0x01
+#define LP5860_SW_BLK_1US		0x00
+
+#define LP5860_PWM_SCALE_MODE_SHIFT	2
+#define LP5860_PWM_SCALE_MODE_MASK	BIT(2)
+#define LP5860_PWM_SCALE_EXPONENTIAL	0x01
+#define LP5860_PWM_SCALE_LINEAR		0x00
+
+#define LP5860_PWM_PHASESHIFT_SHIFT	1
+#define LP5860_PWM_PHASESHIFT_MASK	BIT(1)
+#define LP5860_PWM_PHASESHIFT_ON	0x01
+#define LP5860_PWM_PHASESHIFT_OFF	0x00
+
+#define LP5860_CS_ON_SHIFT_SHIFT	0
+#define LP5860_CS_ON_SHIFT_MASK		BIT(0)
+#define LP5860_CS_DELAY_ON		0x01
+#define LP5860_CS_DELAY_OFF		0x00
+
+/* Register dev_config2 value */
+#define LP5860_COMP_GROUP3_SHIFT	6
+#define LP5860_COMP_GROUP3_MASK		GENMASK(7, 6)
+#define LP5860_COMP_GROUP3_3CLOCK	0x03
+#define LP5860_COMP_GROUP3_2CLOCK	0x02
+#define LP5860_COMP_GROUP3_1CLOCK	0x01
+#define LP5860_COMP_GROUP3_OFF		0x00
+
+#define LP5860_COMP_GROUP2_SHIFT	4
+#define LP5860_COMP_GROUP2_MASK		GENMASK(5, 4)
+#define LP5860_COMP_GROUP2_3CLOCK	0x03
+#define LP5860_COMP_GROUP2_2CLOCK	0x02
+#define LP5860_COMP_GROUP2_1CLOCK	0x01
+#define LP5860_COMP_GROUP2_OFF		0x00
+
+#define LP5860_COMP_GROUP1_SHIFT	2
+#define LP5860_COMP_GROUP1_MASK		GENMASK(3, 2)
+#define LP5860_COMP_GROUP1_3CLOCK	0x03
+#define LP5860_COMP_GROUP1_2CLOCK	0x02
+#define LP5860_COMP_GROUP1_1CLOCK	0x01
+#define LP5860_COMP_GROUP1_OFF		0x00
+
+#define LP5860_LOD_REMOVAL_SHIFT	1
+#define LP5860_LOD_REMOVAL_MASK		BIT(1)
+#define LP5860_LOD_REMOVAL_EN		0x01
+#define LP5860_LOD_REMOVAL_OFF		0x00
+
+#define LP5860_LSD_REMOVAL_SHIFT	0
+#define LP5860_LSD_REMOVAL_MASK		BIT(0)
+#define LP5860_LSD_REMOVAL_EN		0x01
+#define LP5860_LSD_REMOVAL_OFF		0x00
+
+/* Register dev_config3 value */
+#define LP5860_DOWN_DEGHOST_SHIFT	6
+#define LP5860_DOWN_DEGHOST_MASK	GENMASK(7, 6)
+#define LP5860_DOWN_DEGHOST_STRONG	0x03
+#define LP5860_DOWN_DEGHOST_MEDIUM	0x02
+#define LP5860_DOWN_DEGHOST_WEAK	0x01
+#define LP5860_DOWN_DEGHOST_OFF		0x00
+
+#define LP5860_UP_DEGHOST_SHIFT	4
+#define LP5860_UP_DEGHOST_MASK		GENMASK(5, 4)
+#define LP5860_UP_DEGHOST_GND		0x03
+#define LP5860_UP_DEGHOST_3		0x02
+#define LP5860_UP_DEGHOST_2_5		0x01
+#define LP5860_UP_DEGHOST_2		0x00
+
+#define LP5860_MAXIMUM_CURRENT_SHIFT	1
+#define LP5860_MAXIMUM_CURRENT_MASK	GENMASK(3, 1)
+#define LP5860_MAXIMUM_CURRENT_50	0x07
+#define LP5860_MAXIMUM_CURRENT_40	0x06
+#define LP5860_MAXIMUM_CURRENT_30	0x05
+#define LP5860_MAXIMUM_CURRENT_20	0x04
+#define LP5860_MAXIMUM_CURRENT_15	0x03
+#define LP5860_MAXIMUM_CURRENT_10	0x02
+#define LP5860_MAXIMUM_CURRENT_5	0x01
+#define LP5860_MAXIMUM_CURRENT_3	0x00
+
+#define LP5860_UP_DEGHOST_ENABLE_SHIFT	0
+#define LP5860_UP_DEGHOST_ENABLE_MASK	BIT(0)
+#define LP5860_UP_DEGHOST_ENABLE_EN	0x01
+#define LP5860_UP_DEGHOST_ENABLE_OFF	0x00
+
+/* Register PWM */
+#define LP5860_PWM_GLOBAL_MAX		0xff
+#define LP5860_PWM_GROUP_MAX		0xff
+
+/* Register CC group select */
+#define LP5860_CC_GROUP_MASK		GENMASK(7, 0)
+#define LP5860_CC_GROUP_MAX		0x7F
+
+/* Register dot group select */
+#define LP5860_DOT_0_SHIFT		0
+#define LP5860_DOT_1_SHIFT		2
+#define LP5860_DOT_2_SHIFT		4
+#define LP5860_DOT_3_SHIFT		6
+
+#define LP5860_DOT_GROUP3		0x03
+#define LP5860_DOT_GROUP2		0x02
+#define LP5860_DOT_GROUP1		0x01
+#define LP5860_DOT_GROUP_NONE		0x00
+
+#define LP5860_DOT_ALL_ON		0xff
+#define LP5860_DOT_ALL_OFF		0x0
+#define LP5860_PWM_DOT_MAX		0xff
+/* Dot onoff value */
+#define LP5860_DOT_CS0_SHIFT		0
+#define LP5860_DOT_CS1_SHIFT		1
+#define LP5860_DOT_CS2_SHIFT		2
+#define LP5860_DOT_CS3_SHIFT		3
+#define LP5860_DOT_CS4_SHIFT		4
+#define LP5860_DOT_CS5_SHIFT		5
+#define LP5860_DOT_CS6_SHIFT		6
+#define LP5860_DOT_CS7_SHIFT		7
+
+#define LP5860_DOT_CS_ON		0x01
+#define LP5860_DOT_CS_OFF		0x00
+
+/* Dot lod value */
+#define LP5860_DOT_LOD0_SHIFT		0
+#define LP5860_DOT_LOD1_SHIFT		1
+#define LP5860_DOT_LOD2_SHIFT		2
+#define LP5860_DOT_LOD3_SHIFT		3
+#define LP5860_DOT_LOD4_SHIFT		4
+#define LP5860_DOT_LOD5_SHIFT		5
+#define LP5860_DOT_LOD6_SHIFT		6
+#define LP5860_DOT_LOD7_SHIFT		7
+
+#define LP5860_DOT_LOD_ON		0x01
+#define LP5860_DOT_LOD_OFF		0x00
+
+/* dot lsd value */
+#define LP5860_DOT_LSD0_SHIFT		0
+#define LP5860_DOT_LSD1_SHIFT		1
+#define LP5860_DOT_LSD2_SHIFT		2
+#define LP5860_DOT_LSD3_SHIFT		3
+#define LP5860_DOT_LSD4_SHIFT		4
+#define LP5860_DOT_LSD5_SHIFT		5
+#define LP5860_DOT_LSD6_SHIFT		6
+#define LP5860_DOT_LSD7_SHIFT		7
+
+#define LP5860_DOT_LSD_ON		0x01
+#define LP5860_DOT_LSD_OFF		0x00
+
+/* Register lod state */
+#define LP5860_GLOBAL_LOD_SHIFT	1
+#define LP5860_GLOBAL_LOD_STATE		BIT(1)
+#define LP5860_GLOBAL_LSD_SHIFT	0
+#define LP5860_GLOBAL_LSD_STATE		BIT(0)
+
+#define LP5860_FAULT_STATE_ON		0x01
+#define LP5860_FAULT_STATE_OFF		0x00
+
+#define LP5860_GLOBAL_LOD_CLEAR		0x00
+#define LP5860_GLOBAL_LSD_CLEAR		0x00
+
+
+#define LP5860_LOD_CLEAR_EN		0xff
+#define LP5860_LSD_CLEAR_EN		0xff
+#define LP5860_RESET_EN			0xff
+
+#define LP5860_MAX_BRIGHTNESS		255
+#define LP5860_REG_R_PWM		0x0
+#define LP5860_REG_G_PWM		0x1
+#define LP5860_REG_B_PWM		0x2
+
+#define LP5860_MAX_LED_CONSTANT		18
+#define LP5860_MAX_LED_SCAN		11
+#define LP5860_MAX_LED			(LP5860_MAX_LED_CONSTANT * LP5860_MAX_LED_SCAN)
+
+#define LP5860_MAX_DOT_ONOFF_GROUP_NUM	8
+
+/*
+ * Theoretically, there is no max channel per LED,
+ * limit this to a reasonable value for RGBW LEDs
+ */
+#define LP5860_MAX_LED_CHANNELS		4
+
+struct lp5860_led {
+	struct lp5860 *chip;
+	struct led_classdev_mc mc_cdev;
+	u8 brightness;
+};
+
+struct lp5860 {
+	struct device *dev;
+	struct regmap *regmap;
+
+	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
+};
+
+int lp5860_device_init(struct device *dev);
+void lp5860_device_remove(struct device *dev);
+
+#endif /* _DRIVERS_LEDS_RGB_LP5860_H */

---
base-commit: 54d4d240c99f2df63b8a60d1f6f5427197fda708
change-id: 20250219-v6-14-topic-ti-lp5860-f25a48b62c79

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


