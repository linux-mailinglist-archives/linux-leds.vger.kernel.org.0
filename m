Return-Path: <linux-leds+bounces-4632-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3CFAB68FC
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 12:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 629B07A462F
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 10:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4C27056B;
	Wed, 14 May 2025 10:37:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9241274659
	for <linux-leds@vger.kernel.org>; Wed, 14 May 2025 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219022; cv=none; b=BSASgZZLtQ6Gd8l/a7IFUZbhvgnGpwiNMEDu0pJUR1oggMhPeihu1/EO8zAykT8tAuOWFL4jzobl/kBLcr/CI2V+a6bFcekBCDsRFYzW9ETbtN8X3JCm2pn9rnVSxvP4RRloJMYl7N0E8PsiG7TWo+mRWRe3NYXvc3qSZm6z2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219022; c=relaxed/simple;
	bh=uKFFlHLknlfJ9L1hP+29ctSOJj1098wcy9w2nmieQ14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mt/BZa3qYjjBBaKhl0OB5Jv8W73ZlqVFkXGMaiTh0ehf46m8mjFWUxXST98K/ECVayTel+d5SXlmXhDYHLsznqxfrwvPEgLfpBmIjWiZ+Xks8L/hIHpYsGVWNLLNeoIkicUmWW8O2I3hKxLExAh1Xbzjys1hACI+cdXgxaWM4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1uF9Tm-0004uZ-Gb; Wed, 14 May 2025 12:36:50 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 14 May 2025 12:36:31 +0200
Subject: [PATCH v2 4/4] leds: lp5860: detect and report fault state
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-v6-14-topic-ti-lp5860-v2-4-72ecc8fa4ad7@pengutronix.de>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
In-Reply-To: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The lp5860 can detect shorts and open circuits. If an open (LOD) or
short (LSD) is detected, the global bit in LP5860_FAULT_STATE is set.
The channel that caused this can be read from the corresponding Dot_lsdX
and Dot_lodX register and bit offset.

The global bits can be cleared by writing 0xf to the LOD/LSD_clear
register.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/ABI/testing/sysfs-class-spi-lp5860 |  50 +++++++++
 drivers/leds/leds-lp5860-core.c                  | 137 +++++++++++++++++++++++
 drivers/leds/leds-lp5860.h                       |  10 ++
 3 files changed, 197 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860
index d24b49d38ecae55f1a1a4e465fbe71d30eff497e..292e5988ef5c6c1b353446f362dbd5b82d185c54 100644
--- a/Documentation/ABI/testing/sysfs-class-spi-lp5860
+++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
@@ -21,3 +21,53 @@ Contact:        Steffen Trumtrar <kernel@pengutronix.de>
 Description:
 	Contains and sets the current for the R color group.
 	Can be adjusted in 128 steps from 0% to 100% of the maximum output current.
+
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
+Date:           May 2025
+KernelVersion:  6.15
+Contact:        Steffen Trumtrar <kernel@pengutronix.de>
+Description:
+	Contains and sets the global fault state:
+
+	* 3: Open and short detected
+	* 2: Open detected
+	* 1: Short detected
+
+	Can be cleared by writing the corresponding value back to fault_state.
+
+	Example usage::
+
+		## Read
+		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
+		2
+
+		## Write
+		# echo 2 > /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
+
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_open
+Date:           May 2025
+KernelVersion:  6.15
+Contact:        Steffen Trumtrar <kernel@pengutronix.de>
+Description:
+	Contains all LEDs and channels where an open condition was detected.
+	The format is ledname:channel.
+
+	Example usage::
+
+		## Read
+		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_open
+		rgb1:0 rgb2:4
+
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_short
+Date:           May 2025
+KernelVersion:  6.15
+Contact:        Steffen Trumtrar <kernel@pengutronix.de>
+Description:
+	Contains all LEDs and channels where a short condition was detected.
+	The format is ledname:channel.
+
+	Example usage::
+
+		## Read
+		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_short
+		rgb1:0 rgb2:4
diff --git a/drivers/leds/leds-lp5860-core.c b/drivers/leds/leds-lp5860-core.c
index c3ce2528783a1910a267c1b35a65ad27a63083db..0a802bc7a6aca25dab5cf012a1a0fcb2edcf9432 100644
--- a/drivers/leds/leds-lp5860-core.c
+++ b/drivers/leds/leds-lp5860-core.c
@@ -27,6 +27,140 @@ static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
 }
 
+static const char *lp5860_find_led(struct lp5860 *lp, unsigned int idx)
+{
+	struct mc_subled *mc_led_info;
+	struct lp5860_led *led;
+	int i, j;
+
+	for (i = lp->leds_size - 1; i >= 0; i--) {
+		led = &lp->leds[i];
+
+		mc_led_info = led->mc_cdev.subled_info;
+
+		for (j = 0; j < led->mc_cdev.num_colors; j++) {
+			if (mc_led_info[j].channel == idx)
+				goto out;
+		}
+	}
+
+out:
+	return led->mc_cdev.led_cdev.dev->kobj.name;
+}
+
+static ssize_t lp5860_fault_state_lod_lsd(struct lp5860 *led, char *buf,
+					  unsigned int reg, unsigned int length)
+{
+	unsigned int value = 0;
+	unsigned int i, j;
+	unsigned int max_bits;
+	unsigned int offset = 0;
+	int len = 0;
+	bool match = false;
+	int ret;
+
+	for (i = 0; i < length; i++) {
+		match = false;
+		ret = regmap_read(led->regmap, reg + i, &value);
+		if (ret)
+			return ret;
+
+		max_bits = BITS_PER_BYTE;
+		// every 3rd Dot_x register only has 2 bits
+		if (i%3 == 2)
+			max_bits = 2;
+
+		for (j = 0; j < max_bits; j++) {
+			offset++;
+			if (value & BIT(j)) {
+				len += sprintf(buf + len, "%s:%d",
+					       lp5860_find_led(led, offset),
+					       offset-1);
+				match = true;
+				len += sprintf(buf + len, " ");
+			}
+		}
+	}
+
+	buf[len++] = '\n';
+
+	return len;
+}
+
+static ssize_t lp5860_fault_state_open_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct lp5860 *led = dev_get_drvdata(dev);
+	unsigned int value = 0;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP5860_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
+	if (!(value & LP5860_FAULT_STATE_LOD))
+		return 0;
+
+	return lp5860_fault_state_lod_lsd(led, buf, LP5860_DOT_LOD_START,
+					  LP5860_DOT_LOD_LENGTH);
+}
+static LP5860_DEV_ATTR_R(fault_state_open);
+
+static ssize_t lp5860_fault_state_short_show(struct device *dev,
+					     struct device_attribute *attr, char *buf)
+{
+	struct lp5860 *led = dev_get_drvdata(dev);
+	unsigned int value = 0;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP5860_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
+	if (!(value & LP5860_FAULT_STATE_LSD))
+		return 0;
+
+	return lp5860_fault_state_lod_lsd(led, buf, LP5860_DOT_LSD_START,
+					  LP5860_DOT_LSD_LENGTH);
+}
+static LP5860_DEV_ATTR_R(fault_state_short);
+
+static ssize_t lp5860_fault_state_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct lp5860 *led = dev_get_drvdata(dev);
+	unsigned int value = 0;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP5860_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+	return sysfs_emit(buf, "%d\n", (value & 0x3));
+}
+
+static ssize_t lp5860_fault_state_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len)
+{
+	struct lp5860 *led = dev_get_drvdata(dev);
+	unsigned int value = 0;
+	int ret;
+
+	if (kstrtoint(buf, 0, &value))
+		return -EINVAL;
+
+	if (value & LP5860_FAULT_STATE_LOD)
+		ret = regmap_write(led->regmap, LP5860_LOD_CLEAR, 0xf);
+	if (value & LP5860_FAULT_STATE_LSD)
+		ret = regmap_write(led->regmap, LP5860_LSD_CLEAR, 0xf);
+
+	if (ret < 0)
+		return ret;
+	return len;
+}
+static LP5860_DEV_ATTR_RW(fault_state);
+
 LP5860_SHOW_MODE(r_current_set, LP5860_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
 LP5860_STORE_MODE(r_current_set, LP5860_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
 static LP5860_DEV_ATTR_RW(r_current_set);
@@ -40,6 +174,9 @@ LP5860_STORE_MODE(b_current_set, LP5860_B_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
 static LP5860_DEV_ATTR_RW(b_current_set);
 
 static struct attribute *lp5860_attributes[] = {
+	&dev_attr_fault_state_open.attr,
+	&dev_attr_fault_state_short.attr,
+	&dev_attr_fault_state.attr,
 	&dev_attr_r_current_set.attr,
 	&dev_attr_g_current_set.attr,
 	&dev_attr_b_current_set.attr,
diff --git a/drivers/leds/leds-lp5860.h b/drivers/leds/leds-lp5860.h
index 3b8342a832bc75afdf2318fd4ee1ee9ce105cbe3..4b1f9e2f85b9bbd16d4082521a25cdb217a5a315 100644
--- a/drivers/leds/leds-lp5860.h
+++ b/drivers/leds/leds-lp5860.h
@@ -196,6 +196,9 @@
 #define LP5860_DOT_CS_ON		0x01
 #define LP5860_DOT_CS_OFF		0x00
 
+#define LP5860_FAULT_STATE_LOD		BIT(1)
+#define LP5860_FAULT_STATE_LSD		BIT(0)
+
 /* dot lod Value */
 #define LP5860_DOT_LOD0_OFFSET		0
 #define LP5860_DOT_LOD1_OFFSET		1
@@ -209,6 +212,8 @@
 #define LP5860_DOT_LOD_ON		0x01
 #define LP5860_DOT_LOD_OFF		0x00
 
+#define LP5860_DOT_LOD_LENGTH		0x20
+
 /* dot lsd Value */
 #define LP5860_DOT_LSD0_OFFSET		0
 #define LP5860_DOT_LSD1_OFFSET		1
@@ -222,6 +227,8 @@
 #define LP5860_DOT_LSD_ON		0x01
 #define LP5860_DOT_LSD_OFF		0x00
 
+#define LP5860_DOT_LSD_LENGTH		0x20
+
 /* REG FAULT_STATE */
 #define LP5860_GLOBAL_LOD_OFFSET	1
 #define LP5860_GLOBAL_LOD_STATE		BIT(1)
@@ -257,6 +264,9 @@
  */
 #define LP5860_MAX_LED_CHANNELS		4
 
+#define LP5860_DEV_ATTR_R(name)	\
+	DEVICE_ATTR(name, 0444, lp5860_##name##_show, NULL)
+
 #define LP5860_DEV_ATTR_RW(name)	\
 	DEVICE_ATTR(name, 0644, lp5860_##name##_show, lp5860_##name##_store)
 

-- 
2.47.1


