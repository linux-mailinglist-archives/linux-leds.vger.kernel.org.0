Return-Path: <linux-leds+bounces-7096-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHA8JcdDqWlV3gAAu9opvQ
	(envelope-from <linux-leds+bounces-7096-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 09:50:15 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A920DBB4
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 09:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B790300E2B2
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 08:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E196C307AD5;
	Thu,  5 Mar 2026 08:50:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93524372EE3
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700611; cv=none; b=a5ftBz9nsoo15q5fEvCyozCehko0ByGtHoKgGuni3Si8oK9u9EigVob4KOpuHllp2Z4DxCHEO0b18qLbd/gsVAFhVh5A1rwLLxykK+7lif/c9/afOlpqsPIk+JoEx43bYjktKJglh2M2XlNvGHPBXpHE+FgpC9OOb0VtcWQk3ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700611; c=relaxed/simple;
	bh=MCfkzr9F858y4zadZYVKuvqBAXRlw6hXZT3L1bGnZ0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MYleJlK+74gTkw87QyWSIon1dGXs7Qk7aSSiKGw3PRAWoonRgMpRTgEbemNTdD7jWrTomiLpvif3/T+bHWYg2NjBRHmdkpsN/TWoLG4V71e752VU0ep2y2ruUo3CkE9PiG239BoWDiOermF2e6HWMh1WYBR4Wp5g6Fsr83LZYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vy4PG-00068N-D4; Thu, 05 Mar 2026 09:50:06 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 05 Mar 2026 09:49:59 +0100
Subject: [PATCH RESEND] leds: lp5860: detect and report fault state
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-v6-19-topic-ti-lp5860-fault-v1-1-2219827f0524@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 411A920DBB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.983];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7096-lists,linux-leds=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

The lp5860 can detect shorts and open circuits. If an open (LOD) or
short (LSD) is detected, the global bit in LP5860_FAULT_STATE is set.
The channel that caused this can be read from the corresponding Dot_lsdX
and Dot_lodX register and bit offset.

The global bits can be cleared by writing 0xf to the LOD/LSD_clear
register.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/ABI/testing/sysfs-class-spi-lp5860 |  50 +++++++++
 drivers/leds/rgb/leds-lp5860-core.c              | 135 +++++++++++++++++++++++
 include/linux/platform_data/leds-lp5860.h        |  12 +-
 3 files changed, 196 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860
index 80b22a9d66421..ded9eec855bd9 100644
--- a/Documentation/ABI/testing/sysfs-class-spi-lp5860
+++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
@@ -21,3 +21,53 @@ Contact:        Steffen Trumtrar <kernel@pengutronix.de>
 Description:
 	Contains and sets the global brightness for the R color group.
 	Can be adjusted in 128 steps from 0% to 100% of the maximum brightness.
+
+What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
+Date:           January 2026
+KernelVersion:  6.19
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
+Date:           January 2026
+KernelVersion:  6.19
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
diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index 79a932edd1d24..ef00577a63a73 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -19,6 +19,138 @@ static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
 }
 
+static const char *lp5860_find_led(struct lp5860 *lp, unsigned int idx)
+{
+	struct mc_subled *mc_led_info;
+	struct lp5860_led *led;
+	int i, j;
+
+	for (i = lp->leds_count - 1; i >= 0; i--) {
+		led = &lp->leds[i];
+
+		mc_led_info = led->mc_cdev.subled_info;
+
+		for (j = 0; j < led->mc_cdev.num_colors; j++) {
+			if (mc_led_info[j].channel == idx)
+				return led->mc_cdev.led_cdev.dev->kobj.name;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t lp5860_fault_state_lod_lsd(struct lp5860 *led, char *buf,
+					  unsigned int reg, unsigned int length)
+{
+	unsigned int value = 0;
+	unsigned int dot, bit;
+	unsigned int max_bits;
+	unsigned int offset = 0;
+	int len = 0;
+	bool match = false;
+	int ret;
+
+	for (dot = 0; dot < length; dot++) {
+		match = false;
+		ret = regmap_read(led->regmap, reg + dot, &value);
+		if (ret)
+			return ret;
+
+		max_bits = BITS_PER_BYTE;
+		/* every 3rd Dot_x register only has 2 bits */
+		if (dot % 3 == 2)
+			max_bits = 2;
+
+		for (bit = 0; bit < max_bits; bit++) {
+			offset++;
+			if (value & BIT(bit)) {
+				len += sprintf(buf + len, "%s:%d", lp5860_find_led(led, offset),
+					       offset - 1);
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
+	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
+	if (!(value & LP5860_FAULT_STATE_LOD))
+		return 0;
+
+	return lp5860_fault_state_lod_lsd(led, buf, LP5860_REG_DOT_LOD_START,
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
+	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
+	if (!(value & LP5860_FAULT_STATE_LSD))
+		return 0;
+
+	return lp5860_fault_state_lod_lsd(led, buf, LP5860_REG_DOT_LSD_START,
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
+	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
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
+		ret = regmap_write(led->regmap, LP5860_REG_LOD_CLEAR, 0xf);
+	if (value & LP5860_FAULT_STATE_LSD)
+		ret = regmap_write(led->regmap, LP5860_REG_LSD_CLEAR, 0xf);
+
+	if (ret < 0)
+		return ret;
+	return len;
+}
+static LP5860_DEV_ATTR_RW(fault_state);
+
 LP5860_SHOW_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
 LP5860_STORE_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
 DEVICE_ATTR_RW(r_global_brightness_set);
@@ -35,6 +167,9 @@ static struct attribute *lp5860_led_attrs[] = {
 	&dev_attr_r_global_brightness_set.attr,
 	&dev_attr_g_global_brightness_set.attr,
 	&dev_attr_b_global_brightness_set.attr,
+	&dev_attr_fault_state_open.attr,
+	&dev_attr_fault_state_short.attr,
+	&dev_attr_fault_state.attr,
 	NULL,
 };
 
diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h
index 94d184702b11a..d032a0e6d2617 100644
--- a/include/linux/platform_data/leds-lp5860.h
+++ b/include/linux/platform_data/leds-lp5860.h
@@ -189,6 +189,9 @@
 #define LP5860_DOT_CS_OFF		0x00
 
 /* Dot lod value */
+#define LP5860_FAULT_STATE_LOD		BIT(1)
+#define LP5860_FAULT_STATE_LSD		BIT(0)
+
 #define LP5860_DOT_LOD0_OFFSET		0
 #define LP5860_DOT_LOD1_OFFSET		1
 #define LP5860_DOT_LOD2_OFFSET		2
@@ -201,7 +204,9 @@
 #define LP5860_DOT_LOD_ON		0x01
 #define LP5860_DOT_LOD_OFF		0x00
 
-/* dot lsd value */
+/* Dot lsd value */
+#define LP5860_DOT_LOD_LENGTH		0x20
+
 #define LP5860_DOT_LSD0_OFFSET		0
 #define LP5860_DOT_LSD1_OFFSET		1
 #define LP5860_DOT_LSD2_OFFSET		2
@@ -215,6 +220,8 @@
 #define LP5860_DOT_LSD_OFF		0x00
 
 /* Register lod state */
+#define LP5860_DOT_LSD_LENGTH		0x20
+
 #define LP5860_GLOBAL_LOD_OFFSET	1
 #define LP5860_GLOBAL_LOD_STATE		BIT(1)
 #define LP5860_GLOBAL_LSD_OFFSET	0
@@ -248,6 +255,9 @@
  */
 #define LP5860_MAX_LED_CHANNELS		4
 
+#define LP5860_DEV_ATTR_R(name)	\
+	DEVICE_ATTR(name, 0444, lp5860_##name##_show, NULL)
+
 #define LP5860_DEV_ATTR_RW(name)	\
 	DEVICE_ATTR(name, 0644, lp5860_##name##_show, lp5860_##name##_store)
 

---
base-commit: d60f615f21e161506b3ac9bee8add471f0e27a8c
change-id: 20260129-v6-19-topic-ti-lp5860-fault-c8bd1f59fc3f

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>


