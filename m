Return-Path: <linux-leds+bounces-7293-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGFmIoJgsWl/uQIAu9opvQ
	(envelope-from <linux-leds+bounces-7293-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 13:30:58 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7EB2639EB
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 13:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F8731A6DC4
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 12:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551403D88F2;
	Wed, 11 Mar 2026 12:27:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18683DF015
	for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232062; cv=none; b=qbIbHSzgbkzv85kJly4Maw+wgp4vDM2BhAeixy9dSCqPauZDoNs5sLUDufktEsc0VaLB54VT/1X4gmamhNti8r9mlA4MUYEoBx4GOB1muh2QZU7lOXlce0iJEdF+AITIecKXAbWdjDW3h4n1mywMaraACQGVuClNqM9VHa76iuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232062; c=relaxed/simple;
	bh=gGHm4R+DqstAdiyoqIK+LYoWHwK4l7grCC17b0tMOIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBCg7AAHKcJ5gi8MYH6RK6WRZg/GvWpyvxi+2M9fBaz1Dd2J9U5fNt/WFJpYyBePm7IHvG4/kihyX/8nbGvLDzDPun4JrDOyw1B9cGAoXTu3l9inQepCFsGHV5o4eaqHQ8kKgzLjqK+LqN9Mc5XbXJ8gbmD3QRHlSuQncNqHWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1w0If0-0002PX-3P; Wed, 11 Mar 2026 13:27:34 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 11 Mar 2026 13:27:02 +0100
Subject: [PATCH v2 2/2] leds: lp5860: detect and report fault state
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-v6-19-topic-ti-lp5860-fault-v2-2-f9454910f009@pengutronix.de>
References: <20260311-v6-19-topic-ti-lp5860-fault-v2-0-f9454910f009@pengutronix.de>
In-Reply-To: <20260311-v6-19-topic-ti-lp5860-fault-v2-0-f9454910f009@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: EC7EB2639EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.695];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7293-lists,linux-leds=lfdr.de];
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
 drivers/leds/rgb/leds-lp5860-core.c       | 143 ++++++++++++++++++++++++++++++
 include/linux/platform_data/leds-lp5860.h |  19 +++-
 2 files changed, 159 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index 28b4d86e11f1a..b62a1db18c05b 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -19,6 +19,149 @@ static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
 }
 
+static const char *lp5860_led_name(struct lp5860 *lp, unsigned int idx)
+{
+	for (int i = 0; i < lp->leds_count; i++) {
+		struct mc_subled *mc_led_info;
+		struct lp5860_led *led;
+
+		led = &lp->leds[i];
+
+		mc_led_info = led->mc_cdev.subled_info;
+
+		for (int j = 0; j < led->mc_cdev.num_colors; j++) {
+			if (mc_led_info[j].channel == idx)
+				return led->mc_cdev.led_cdev.dev->kobj.name;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t lp5860_get_fault_state(struct lp5860 *led, char *buf,
+				      unsigned int reg, unsigned int length)
+{
+	int len = 0;
+
+	for (unsigned int dot = 0; dot < length; dot++) {
+		unsigned int offset = 0;
+		unsigned int value;
+		unsigned int max_bits;
+		int ret;
+
+		ret = regmap_read(led->regmap, reg + dot, &value);
+		if (ret)
+			return ret;
+
+		max_bits = BITS_PER_BYTE;
+		/* Every 3rd Dot_x register only has 2 bits */
+		if (dot % 3 == 2)
+			max_bits = 2;
+
+		for (unsigned int bit = 0; bit < max_bits; bit++) {
+			offset++;
+
+			if (value & BIT(bit)) {
+				len += sprintf(buf + len, "%s:%d", lp5860_led_name(led, offset),
+					       offset - 1);
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
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
+	if (!(value & LP5860_FAULT_STATE_OPEN_DETECTION))
+		return 0;
+
+	return lp5860_get_fault_state(led, buf, LP5860_REG_DOT_LOD_START,
+				      LP5860_DOT_LOD_LENGTH);
+}
+static LP5860_DEV_ATTR_R(fault_state_open);
+
+static ssize_t lp5860_fault_state_short_show(struct device *dev,
+					     struct device_attribute *attr, char *buf)
+{
+	struct lp5860 *led = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
+	if (!(value & LP5860_FAULT_STATE_SHORT_DETECTION))
+		return 0;
+
+	return lp5860_get_fault_state(led, buf, LP5860_REG_DOT_LSD_START,
+				      LP5860_DOT_LSD_LENGTH);
+}
+static LP5860_DEV_ATTR_R(fault_state_short);
+
+static ssize_t lp5860_fault_state_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct lp5860 *led = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(led->regmap, LP5860_REG_FAULT_STATE, &value);
+	if (ret)
+		return ret;
+
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
+	if (value & LP5860_FAULT_STATE_OPEN_DETECTION)
+		ret = regmap_write(led->regmap, LP5860_REG_LOD_CLEAR, 0xf);
+
+	if (value & LP5860_FAULT_STATE_SHORT_DETECTION)
+		ret = regmap_write(led->regmap, LP5860_REG_LSD_CLEAR, 0xf);
+
+	if (ret < 0)
+		return ret;
+
+	return len;
+}
+static LP5860_DEV_ATTR_RW(fault_state);
+
+static struct attribute *lp5860_led_attrs[] = {
+	&dev_attr_fault_state_open.attr,
+	&dev_attr_fault_state_short.attr,
+	&dev_attr_fault_state.attr,
+	NULL,
+};
+
+static const struct attribute_group lp5860_led_group = {
+	.attrs = lp5860_led_attrs,
+};
+
 static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
 {
 	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
diff --git a/include/linux/platform_data/leds-lp5860.h b/include/linux/platform_data/leds-lp5860.h
index 7bc69a7a550dd..7b2cc88d70e24 100644
--- a/include/linux/platform_data/leds-lp5860.h
+++ b/include/linux/platform_data/leds-lp5860.h
@@ -188,7 +188,9 @@
 #define LP5860_DOT_CS_ON		0x01
 #define LP5860_DOT_CS_OFF		0x00
 
-/* Dot lod value */
+/* Dot LED open detection (LOD) value */
+#define LP5860_FAULT_STATE_OPEN_DETECTION	BIT(1)
+
 #define LP5860_DOT_LOD0_OFFSET		0
 #define LP5860_DOT_LOD1_OFFSET		1
 #define LP5860_DOT_LOD2_OFFSET		2
@@ -201,7 +203,11 @@
 #define LP5860_DOT_LOD_ON		0x01
 #define LP5860_DOT_LOD_OFF		0x00
 
-/* dot lsd value */
+#define LP5860_DOT_LOD_LENGTH		0x20
+
+/* Dot LED short detection (LSD) value */
+#define LP5860_FAULT_STATE_SHORT_DETECTION	BIT(0)
+
 #define LP5860_DOT_LSD0_OFFSET		0
 #define LP5860_DOT_LSD1_OFFSET		1
 #define LP5860_DOT_LSD2_OFFSET		2
@@ -214,7 +220,8 @@
 #define LP5860_DOT_LSD_ON		0x01
 #define LP5860_DOT_LSD_OFF		0x00
 
-/* Register lod state */
+#define LP5860_DOT_LSD_LENGTH		0x20
+
 #define LP5860_GLOBAL_LOD_OFFSET	1
 #define LP5860_GLOBAL_LOD_STATE		BIT(1)
 #define LP5860_GLOBAL_LSD_OFFSET	0
@@ -248,6 +255,12 @@
  */
 #define LP5860_MAX_LED_CHANNELS		4
 
+#define LP5860_DEV_ATTR_R(name)	\
+	DEVICE_ATTR(name, 0444, lp5860_##name##_show, NULL)
+
+#define LP5860_DEV_ATTR_RW(name)	\
+	DEVICE_ATTR(name, 0644, lp5860_##name##_show, lp5860_##name##_store)
+
 struct lp5860_led {
 	struct lp5860 *chip;
 	struct led_classdev_mc mc_cdev;

-- 
2.51.0


