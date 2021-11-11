Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4C744CEF0
	for <lists+linux-leds@lfdr.de>; Thu, 11 Nov 2021 02:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbhKKBiZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Nov 2021 20:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbhKKBiN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Nov 2021 20:38:13 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84823C06120B;
        Wed, 10 Nov 2021 17:35:22 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o29so3746232wms.2;
        Wed, 10 Nov 2021 17:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K4HOllgHGEKudLuYaDiy4RLs4krfBedi+jzCb6bmaOw=;
        b=lxYlNBahq89zCw1Nv0ZN/YTpM7xbbqellNDT8/3TDEfXLsKAyE7Eu/26RQpR6Q/+JS
         SyN/zwFoPLSfvIC7K8ew2OSXwnfbfROiZ68NDh+sOXABeEJaJklRQnHv/GMz7zyLIziM
         U2G/s4HBigeNsY39q4pPQ9lQOsDgisxdQySJh6a9Lttc7f7jLrz9C0eCYHZiGPKy/iMX
         F8p5usG5EOaWqmNIn/PI/12dY4FyKwzQQomzQK0yQsoorbHgkWRZCZI+EpLnKGh8VopW
         lIUsZrIo03lHFvzy9YQpPBlQf8BHJiURUeLBWlJIEQyxSvO+bP8wtn2Q5Da17XlttTBs
         DKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4HOllgHGEKudLuYaDiy4RLs4krfBedi+jzCb6bmaOw=;
        b=Ysw/7MKQA0hXbJVg9RVLqAntgotNSaN9eQnqaBQ2xFP03ANRExo5jwGAcQ4TdnnxHo
         SW602G+jTOK2AGadnpuP9phXRs63libTU4NoEDYRVaSIr5VObs9stB1z3XO/LihCNfAq
         iCRCUqckPSLNz7KskQ/Ev1Nu8wJbgeF6lHThmIHi395Sdy7wZ6Oe2PSVabmeFC99C/Z7
         y+rcGPGb/na5KsYyuR+4MrJEgViYdl1PO2j+FMlmxtFtvuUSk4w9wBLroNutmIne6juR
         S17q1h68vnB2mWuSWY2r2gpzAKrBNMMM218rUWPni008a7tsWHsu4pdEjuw/MkU2DJLf
         6YbA==
X-Gm-Message-State: AOAM532qi3Vc/F1pwR+Sdmxu5yoKZbRswTt93APP5n6FvlEGDR7nrS3y
        Ae47y1OmU9BRFs8vACrBA92GXxL9/og=
X-Google-Smtp-Source: ABdhPJzR4sxVkjuY8o4RH2Udvu7m52QdTh+mIc7ldYR2gTiDktE+RPwAYzrIZf5G0AoyLD5a+GvfOg==
X-Received: by 2002:a05:600c:2205:: with SMTP id z5mr4181646wml.40.1636594520895;
        Wed, 10 Nov 2021 17:35:20 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it. [93.42.71.246])
        by smtp.googlemail.com with ESMTPSA id d8sm1369989wrm.76.2021.11.10.17.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 17:35:20 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [RFC PATCH v4 7/8] net: dsa: qca8k: add LEDs support
Date:   Thu, 11 Nov 2021 02:34:59 +0100
Message-Id: <20211111013500.13882-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211111013500.13882-1-ansuelsmth@gmail.com>
References: <20211111013500.13882-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add LEDs support for qca8k Switch Family. This will provide the LEDs
hardware API to permit the PHY LED to support hardware mode.
Each port have at least 3 LEDs and they can HW blink, set on/off or
follow blink modes configured with the LED in hardware mode..
This adds support for 2 hardware trigger netdev and
hardware-phy-activity.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/net/dsa/Kconfig      |   9 +
 drivers/net/dsa/Makefile     |   1 +
 drivers/net/dsa/qca8k-leds.c | 423 +++++++++++++++++++++++++++++++++++
 drivers/net/dsa/qca8k.c      |   8 +-
 drivers/net/dsa/qca8k.h      |  65 ++++++
 5 files changed, 504 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/dsa/qca8k-leds.c

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index 7b1457a6e327..9f4bae5cc43d 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -67,6 +67,15 @@ config NET_DSA_QCA8K
 	  This enables support for the Qualcomm Atheros QCA8K Ethernet
 	  switch chips.
 
+config NET_DSA_QCA8K_LEDS_SUPPORT
+	tristate "Qualcomm Atheros QCA8K Ethernet switch family LEDs support"
+	select NET_DSA_QCA8K
+	select LEDS_OFFLOAD_TRIGGERS
+	help
+	  This enables support for LEDs present on the Qualcomm Atheros
+	  QCA8K Ethernet switch chips. This require the LEDs offload
+	  triggers support as it can run in offload mode.
+
 config NET_DSA_REALTEK_SMI
 	tristate "Realtek SMI Ethernet switch family support"
 	select NET_DSA_TAG_RTL4_A
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index 8da1569a34e6..fb1e7d0cf126 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_NET_DSA_LANTIQ_GSWIP) += lantiq_gswip.o
 obj-$(CONFIG_NET_DSA_MT7530)	+= mt7530.o
 obj-$(CONFIG_NET_DSA_MV88E6060) += mv88e6060.o
 obj-$(CONFIG_NET_DSA_QCA8K)	+= qca8k.o
+obj-$(CONFIG_NET_DSA_QCA8K_LEDS_SUPPORT) += qca8k-leds.o
 obj-$(CONFIG_NET_DSA_REALTEK_SMI) += realtek-smi.o
 realtek-smi-objs		:= realtek-smi-core.o rtl8366.o rtl8366rb.o rtl8365mb.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303) += lan9303-core.o
diff --git a/drivers/net/dsa/qca8k-leds.c b/drivers/net/dsa/qca8k-leds.c
new file mode 100644
index 000000000000..729e55dedc9d
--- /dev/null
+++ b/drivers/net/dsa/qca8k-leds.c
@@ -0,0 +1,423 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <net/dsa.h>
+
+#include "qca8k.h"
+
+static int
+qca8k_get_enable_led_reg(int port_num, int led_num, struct qca8k_led_pattern_en *reg_info)
+{
+	int shift;
+
+	switch (port_num) {
+	case 0:
+		reg_info->reg = QCA8K_LED_CTRL_REG(led_num);
+		reg_info->shift = 14;
+		break;
+	case 1:
+	case 2:
+	case 3:
+		reg_info->reg = QCA8K_LED_CTRL_REG(3);
+		shift = 2 * led_num + (6 * (port_num - 1));
+
+		reg_info->shift = 8 + shift;
+
+		break;
+	case 4:
+		reg_info->reg = QCA8K_LED_CTRL_REG(led_num);
+		reg_info->shift = 30;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+qca8k_get_control_led_reg(int port_num, int led_num, struct qca8k_led_pattern_en *reg_info)
+{
+	reg_info->reg = QCA8K_LED_CTRL_REG(led_num);
+
+	/* 6 total control rule:
+	 * 3 control rules for phy0-3 that applies to all their leds
+	 * 3 control rules for phy4
+	 */
+	if (port_num == 4)
+		reg_info->shift = 16;
+	else
+		reg_info->shift = 0;
+
+	return 0;
+}
+
+static void
+qca8k_check_rules(unsigned long *mode, u32 *offload_trigger,
+		  int trigger_bit, int blink_mode, bool read)
+{
+	if (read) {
+		if (*offload_trigger & blink_mode)
+			set_bit(trigger_bit, mode);
+	} else {
+		if (test_bit(trigger_bit, mode))
+			*offload_trigger |= blink_mode;
+	}
+}
+
+static int
+qca8k_parse_trigger_hardware_phy_activity(struct led_classdev *ldev, u32 *offload_trigger,
+					  u32 *mask, bool read)
+{
+	struct hardware_phy_activity_data *trigger_data = led_get_trigger_data(ldev);
+	unsigned long rules = trigger_data->mode;
+
+	/* Parse rule to hardware phy activity trigger */
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_BLINK_TX,
+			  QCA8K_LED_TX_BLINK_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_BLINK_RX,
+			  QCA8K_LED_RX_BLINK_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_LINK_10M,
+			  QCA8K_LED_LINK_10M_EN_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_LINK_100M,
+			  QCA8K_LED_LINK_100M_EN_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_LINK_1000M,
+			  QCA8K_LED_LINK_1000M_EN_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_HALF_DUPLEX,
+			  QCA8K_LED_HALF_DUPLEX_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_FULL_DUPLEX,
+			  QCA8K_LED_FULL_DUPLEX_MASK, false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_PHY_ACTIVITY_OPTION_LINKUP_OVER,
+			  QCA8K_LED_LINKUP_OVER_MASK, false);
+
+	if (!*offload_trigger)
+		return -EOPNOTSUPP;
+
+	*mask = *offload_trigger;
+
+	return 0;
+}
+
+static int
+qca8k_parse_trigger_netdev(struct led_classdev *ldev, u32 *offload_trigger,
+			   u32 *mask, bool read)
+{
+	struct led_netdev_data *trigger_data = led_get_trigger_data(ldev);
+	unsigned long rules = trigger_data->mode;
+
+	/* Parse rule to netdev trigger */
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_NETDEV_TX, QCA8K_LED_TX_BLINK_MASK,
+			  false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_NETDEV_RX, QCA8K_LED_RX_BLINK_MASK,
+			  false);
+	qca8k_check_rules(&rules, offload_trigger, TRIGGER_NETDEV_LINK,
+			  QCA8K_LED_LINK_10M_EN_MASK | QCA8K_LED_LINK_100M_EN_MASK |
+			      QCA8K_LED_LINK_1000M_EN_MASK,
+			  false);
+
+	if (!*offload_trigger)
+		return -EOPNOTSUPP;
+
+	*mask = *offload_trigger;
+
+	return 0;
+}
+
+static int
+qca8k_parse_trigger(struct led_classdev *ldev, u32 *offload_trigger, u32 *mask,
+		    bool read)
+{
+	struct led_trigger *trigger = ldev->trigger;
+	int ret;
+
+	if (strcmp(trigger->name, "hardware-phy-activity") &&
+	    strcmp(trigger->name, "netdev"))
+		return -EINVAL;
+
+	if (!strcmp(trigger->name, "hardware-phy-activity"))
+		ret = qca8k_parse_trigger_hardware_phy_activity(ldev, offload_trigger, mask, read);
+
+	if (!strcmp(trigger->name, "netdev"))
+		ret = qca8k_parse_trigger_netdev(ldev, offload_trigger, mask, read);
+
+	return ret;
+}
+
+static int
+qca8k_cled_blink_set(struct led_classdev *ldev,
+		     unsigned long *delay_on,
+		     unsigned long *delay_off)
+{
+	struct qca8k_led *led = container_of(ldev, struct qca8k_led, cdev);
+	struct qca8k_led_pattern_en reg_info;
+	struct qca8k_priv *priv = led->priv;
+	u32 offload_trigger = 0, mask;
+	int ret;
+
+	/* With no trigger selected, use the blink 4hz mode */
+	if (!ldev->trigger) {
+		if (*delay_on == 0 && *delay_off == 0) {
+			*delay_on = 125;
+			*delay_off = 125;
+		}
+
+		if (*delay_on != 125 || *delay_off != 125) {
+			/* The hardware only supports blinking at 4Hz. Fall back
+			 * to software implementation in other cases.
+			 */
+			return -EINVAL;
+		}
+
+		qca8k_get_enable_led_reg(led->port_num, led->led_num, &reg_info);
+
+		return qca8k_rmw(priv, reg_info.reg,
+				 GENMASK(1, 0) << reg_info.shift,
+				 QCA8K_LED_ALWAYS_BLINK_4HZ << reg_info.shift);
+	}
+
+	/* Check trigger compatibility
+	 * With these trigger blink_set will configure the LED pattern reg
+	 */
+	ret = qca8k_parse_trigger(ldev, &offload_trigger, &mask, false);
+	if (ret)
+		return ret;
+
+	qca8k_get_control_led_reg(led->port_num, led->led_num, &reg_info);
+
+	/* Set 4hz by default */
+	if (*delay_on == 0 && *delay_off == 0)
+		offload_trigger |= QCA8K_LED_BLINK_4HZ;
+
+	if (*delay_on == 250 || *delay_off == 250)
+		offload_trigger |= QCA8K_LED_BLINK_2HZ;
+
+	if (*delay_on == 125 || *delay_off == 125)
+		offload_trigger |= QCA8K_LED_BLINK_4HZ;
+
+	if (*delay_on == 62 || *delay_off == 62)
+		offload_trigger |= QCA8K_LED_BLINK_8HZ;
+
+	return qca8k_rmw(priv, reg_info.reg,
+			 mask << reg_info.shift,
+			 offload_trigger << reg_info.shift);
+}
+
+static void
+qca8k_led_brightness_set(struct qca8k_led *led,
+			 enum led_brightness b)
+{
+	struct qca8k_led_pattern_en reg_info;
+	struct qca8k_priv *priv = led->priv;
+	u32 val = QCA8K_LED_ALWAYS_OFF;
+
+	qca8k_get_enable_led_reg(led->port_num, led->led_num, &reg_info);
+
+	if (b)
+		val = QCA8K_LED_ALWAYS_ON;
+
+	qca8k_rmw(priv, reg_info.reg,
+		  GENMASK(1, 0) << reg_info.shift,
+		  val << reg_info.shift);
+}
+
+static void
+qca8k_cled_brightness_set(struct led_classdev *ldev,
+			  enum led_brightness b)
+{
+	struct qca8k_led *led = container_of(ldev, struct qca8k_led, cdev);
+
+	return qca8k_led_brightness_set(led, b);
+}
+
+static enum led_brightness
+qca8k_led_brightness_get(struct qca8k_led *led)
+{
+	struct qca8k_led_pattern_en reg_info;
+	struct qca8k_priv *priv = led->priv;
+	u32 val;
+	int ret;
+
+	qca8k_get_enable_led_reg(led->port_num, led->led_num, &reg_info);
+
+	ret = qca8k_read(priv, reg_info.reg, &val);
+	if (ret)
+		return 0;
+
+	val >>= reg_info.shift;
+	val &= GENMASK(1, 0);
+
+	return val > 0 ? 1 : 0;
+}
+
+static enum led_brightness
+qca8k_cled_brightness_get(struct led_classdev *ldev)
+{
+	struct qca8k_led *led = container_of(ldev, struct qca8k_led, cdev);
+
+	return qca8k_led_brightness_get(led);
+}
+
+static int
+qca8k_cled_hw_control(struct led_classdev *ldev, bool enable)
+{
+	struct qca8k_led *led = container_of(ldev, struct qca8k_led, cdev);
+	struct qca8k_led_pattern_en reg_info;
+	struct qca8k_priv *priv = led->priv;
+	u32 val = QCA8K_LED_ALWAYS_OFF;
+
+	qca8k_get_enable_led_reg(led->port_num, led->led_num, &reg_info);
+
+	if (enable)
+		val = QCA8K_LED_RULE_CONTROLLED;
+
+	return qca8k_rmw(priv, reg_info.reg,
+			 GENMASK(1, 0) << reg_info.shift,
+			 val << reg_info.shift);
+}
+
+static int
+qca8k_cled_hw_control_start(struct led_classdev *led_cdev)
+{
+	return qca8k_cled_hw_control(led_cdev, true);
+}
+
+static int
+qca8k_cled_hw_control_stop(struct led_classdev *led_cdev)
+{
+	return qca8k_cled_hw_control(led_cdev, false);
+}
+
+static bool
+qca8k_cled_hw_control_status(struct led_classdev *ldev)
+{
+	struct qca8k_led *led = container_of(ldev, struct qca8k_led, cdev);
+
+	struct qca8k_led_pattern_en reg_info;
+	struct qca8k_priv *priv = led->priv;
+	u32 val;
+
+	qca8k_get_enable_led_reg(led->port_num, led->led_num, &reg_info);
+
+	qca8k_read(priv, reg_info.reg, &val);
+
+	val >>= reg_info.shift;
+	val &= GENMASK(1, 0);
+
+	return val == QCA8K_LED_RULE_CONTROLLED;
+}
+
+static int
+qca8k_parse_port_leds(struct qca8k_priv *priv, struct fwnode_handle *port, int port_num)
+{
+	struct fwnode_handle *led = NULL, *leds = NULL;
+	struct qca8k_led_pattern_en reg_info;
+	struct led_init_data init_data = { };
+	struct qca8k_led *port_led;
+	int led_num, port_index;
+	const char *state;
+	int ret;
+
+	leds = fwnode_get_named_child_node(port, "leds");
+	if (!leds) {
+		dev_dbg(priv->dev, "No Leds node specified in device tree for port %d!\n",
+			port_num);
+		return 0;
+	}
+
+	fwnode_for_each_child_node(leds, led) {
+		/* Reg rapresent the led number of the port.
+		 * Each port can have at least 3 leds attached
+		 * Commonly:
+		 * 1. is gigabit led
+		 * 2. is mbit led
+		 * 3. additional status led
+		 */
+		if (fwnode_property_read_u32(led, "reg", &led_num))
+			continue;
+
+		if (led_num >= QCA8K_LED_PORT_COUNT) {
+			dev_warn(priv->dev, "Invalid LED reg defined %d", port_num);
+			continue;
+		}
+
+		port_index = 3 * port_num + led_num;
+
+		port_led = &priv->ports_led[port_index];
+		port_led->port_num = port_num;
+		port_led->led_num = led_num;
+		port_led->priv = priv;
+
+		ret = fwnode_property_read_string(led, "default-state", &state);
+		if (!ret) {
+			if (!strcmp(state, "on")) {
+				port_led->cdev.brightness = 1;
+				qca8k_led_brightness_set(port_led, 1);
+			} else if (!strcmp(state, "off")) {
+				port_led->cdev.brightness = 0;
+				qca8k_led_brightness_set(port_led, 0);
+			} else if (!strcmp(state, "keep")) {
+				port_led->cdev.brightness =
+					qca8k_led_brightness_get(port_led);
+			}
+		}
+
+		qca8k_get_enable_led_reg(port_led->port_num, port_led->led_num, &reg_info);
+
+		/* Reset blink mode set by default */
+		ret = qca8k_rmw(priv, reg_info.reg, QCA8K_LED_RULE_MASK << reg_info.shift,
+				0 << reg_info.shift);
+
+		/* 3 brightness settings can be applied from Documentation:
+		 * 0 always off
+		 * 1 blink at 4Hz
+		 * 2 always on
+		 * 3 rule controlled
+		 * Suppots only 2 mode: (pcb limitation, with always on and blink
+		 * only the last led is set to this mode)
+		 * 0 always off (sets all leds off)
+		 * 3 rule controlled
+		 */
+		port_led->cdev.flags |= LED_SOFTWARE_CONTROLLED;
+		port_led->cdev.flags |= LED_HARDWARE_CONTROLLED;
+		port_led->cdev.max_brightness = 1;
+		port_led->cdev.brightness_set = qca8k_cled_brightness_set;
+		port_led->cdev.brightness_get = qca8k_cled_brightness_get;
+		port_led->cdev.blink_set = qca8k_cled_blink_set;
+		port_led->cdev.hw_control_start = qca8k_cled_hw_control_start;
+		port_led->cdev.hw_control_stop = qca8k_cled_hw_control_stop;
+		port_led->cdev.hw_control_status = qca8k_cled_hw_control_status;
+		init_data.default_label = ":port";
+		init_data.devicename = "qca8k";
+		init_data.fwnode = led;
+
+		ret = devm_led_classdev_register_ext(priv->dev, &port_led->cdev, &init_data);
+		if (ret)
+			dev_warn(priv->dev, "Failed to int led");
+	}
+
+	return 0;
+}
+
+int
+qca8k_setup_led_ctrl(struct qca8k_priv *priv)
+{
+	struct fwnode_handle *mdio, *port;
+	int port_num;
+	int ret;
+
+	mdio = device_get_named_child_node(priv->dev, "mdio");
+	if (!mdio) {
+		dev_info(priv->dev, "No MDIO node specified in device tree!\n");
+		return 0;
+	}
+
+	fwnode_for_each_child_node(mdio, port) {
+		if (fwnode_property_read_u32(port, "reg", &port_num))
+			continue;
+
+		/* Each port can have at least 3 different leds attached */
+		ret = qca8k_parse_port_leds(priv, port, port_num);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index a429c9750add..10b2b47b2156 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -148,7 +148,7 @@ qca8k_set_page(struct mii_bus *bus, u16 page)
 	return 0;
 }
 
-static int
+int
 qca8k_read(struct qca8k_priv *priv, u32 reg, u32 *val)
 {
 	struct mii_bus *bus = priv->bus;
@@ -192,7 +192,7 @@ qca8k_write(struct qca8k_priv *priv, u32 reg, u32 val)
 	return ret;
 }
 
-static int
+int
 qca8k_rmw(struct qca8k_priv *priv, u32 reg, u32 mask, u32 write_val)
 {
 	struct mii_bus *bus = priv->bus;
@@ -1109,6 +1109,10 @@ qca8k_setup(struct dsa_switch *ds)
 	if (ret)
 		return ret;
 
+	ret = qca8k_setup_led_ctrl(priv);
+	if (ret)
+		return ret;
+
 	/* Make sure MAC06 is disabled */
 	ret = qca8k_reg_clear(priv, QCA8K_REG_PORT0_PAD_CTRL,
 			      QCA8K_PORT0_PAD_MAC06_EXCHANGE_EN);
diff --git a/drivers/net/dsa/qca8k.h b/drivers/net/dsa/qca8k.h
index 128b8cf85e08..f68f037fe909 100644
--- a/drivers/net/dsa/qca8k.h
+++ b/drivers/net/dsa/qca8k.h
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/regmap.h>
 #include <linux/gpio.h>
+#include <linux/leds.h>
 
 #define QCA8K_NUM_PORTS					7
 #define QCA8K_NUM_CPU_PORTS				2
@@ -74,6 +75,43 @@
 #define   QCA8K_MDIO_MASTER_DATA_MASK			GENMASK(15, 0)
 #define   QCA8K_MDIO_MASTER_MAX_PORTS			5
 #define   QCA8K_MDIO_MASTER_MAX_REG			32
+
+/* LED control register */
+#define QCA8K_LED_COUNT					15
+#define QCA8K_LED_PORT_COUNT				3
+#define QCA8K_LED_RULE_COUNT				6
+#define QCA8K_LED_RULE_MAX				11
+#define QCA8K_LED_CTRL_REG(_i)				(0x050 + (_i) * 4)
+#define QCA8K_LED_CTRL0_REG				0x50
+#define QCA8K_LED_CTRL1_REG				0x54
+#define QCA8K_LED_CTRL2_REG				0x58
+#define QCA8K_LED_CTRL3_REG				0x5C
+#define   QCA8K_LED_CTRL_SHIFT(_i)			(((_i) % 2) * 16)
+#define   QCA8K_LED_CTRL_MASK				GENMASK(15, 0)
+#define QCA8K_LED_RULE_MASK				GENMASK(13, 0)
+#define QCA8K_LED_BLINK_FREQ_MASK			GENMASK(1, 0)
+#define QCA8K_LED_BLINK_FREQ_SHITF			0
+#define   QCA8K_LED_BLINK_2HZ				0
+#define   QCA8K_LED_BLINK_4HZ				1
+#define   QCA8K_LED_BLINK_8HZ				2
+#define   QCA8K_LED_BLINK_AUTO				3
+#define QCA8K_LED_LINKUP_OVER_MASK			BIT(2)
+#define QCA8K_LED_TX_BLINK_MASK				BIT(4)
+#define QCA8K_LED_RX_BLINK_MASK				BIT(5)
+#define QCA8K_LED_COL_BLINK_MASK			BIT(7)
+#define QCA8K_LED_LINK_10M_EN_MASK			BIT(8)
+#define QCA8K_LED_LINK_100M_EN_MASK			BIT(9)
+#define QCA8K_LED_LINK_1000M_EN_MASK			BIT(10)
+#define QCA8K_LED_POWER_ON_LIGHT_MASK			BIT(11)
+#define QCA8K_LED_HALF_DUPLEX_MASK			BIT(12)
+#define QCA8K_LED_FULL_DUPLEX_MASK			BIT(13)
+#define QCA8K_LED_PATTERN_EN_MASK			GENMASK(15, 14)
+#define QCA8K_LED_PATTERN_EN_SHIFT			14
+#define   QCA8K_LED_ALWAYS_OFF				0
+#define   QCA8K_LED_ALWAYS_BLINK_4HZ			1
+#define   QCA8K_LED_ALWAYS_ON				2
+#define   QCA8K_LED_RULE_CONTROLLED			3
+
 #define QCA8K_GOL_MAC_ADDR0				0x60
 #define QCA8K_GOL_MAC_ADDR1				0x64
 #define QCA8K_MAX_FRAME_SIZE				0x78
@@ -279,6 +317,19 @@ struct qca8k_ports_config {
 	u8 rgmii_tx_delay[QCA8K_NUM_CPU_PORTS]; /* 0: CPU port0, 1: CPU port6 */
 };
 
+struct qca8k_led_pattern_en {
+	u32 reg;
+	u8 shift;
+};
+
+struct qca8k_led {
+	u8 port_num;
+	u8 led_num;
+	u16 old_rule;
+	struct qca8k_priv *priv;
+	struct led_classdev cdev;
+};
+
 struct qca8k_priv {
 	u8 switch_id;
 	u8 switch_revision;
@@ -293,6 +344,7 @@ struct qca8k_priv {
 	struct dsa_switch_ops ops;
 	struct gpio_desc *reset_gpio;
 	unsigned int port_mtu[QCA8K_NUM_PORTS];
+	struct qca8k_led ports_led[QCA8K_LED_COUNT];
 };
 
 struct qca8k_mib_desc {
@@ -308,4 +360,17 @@ struct qca8k_fdb {
 	u8 mac[6];
 };
 
+/* Common function used by the LEDs module */
+int qca8k_read(struct qca8k_priv *priv, u32 reg, u32 *val);
+int qca8k_rmw(struct qca8k_priv *priv, u32 reg, u32 mask, u32 write_val);
+
+#ifdef CONFIG_NET_DSA_QCA8K_LEDS_SUPPORT
+int qca8k_setup_led_ctrl(struct qca8k_priv *priv);
+#else
+static inline int qca8k_setup_led_ctrl(struct qca8k_priv *priv)
+{
+	return 0;
+}
+#endif
+
 #endif /* __QCA8K_H */
-- 
2.32.0

