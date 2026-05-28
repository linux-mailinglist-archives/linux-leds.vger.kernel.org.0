Return-Path: <linux-leds+bounces-8354-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMG+DDVJGGpoiggAu9opvQ
	(envelope-from <linux-leds+bounces-8354-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 15:55:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDE5F3271
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49AC13018D41
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C00A3E92B4;
	Thu, 28 May 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTEZwRiQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E7317171
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976322; cv=none; b=Lkc5zogBbx5ho05vDlwpoQXwvbWUKhoTb3uoelMYRNVa7bzwTp6HiIQP2DzFsSgmOLOAPDVtbJFJONWxJEytOLTda21k0uZ1Xx91UAALNDAU4YWLyzkwIDB41THG0XYWfSa/g7N9L8rnxmUn3j01h1qjGiWk0poO6E87gVfZyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976322; c=relaxed/simple;
	bh=QatHeIZOOO1MdlnFTcSf0Fa5jOzUlZQ5UPjhnZSfOVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hng6kNXfL8sRtUksqID64+TC+9+EwO8tf9OvQ8r4rB/tEaT8j0AIpwO7K3fAXdwqvjWlWBAo/gAOaRWbPY8GBIsR6zoaj+khsRmHCndaf4D2IsM7weD099JhIGlZ4pL2azFEI4zFKkoFAZc5T587jSiZk1DOpYF/jjterVwfZ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTEZwRiQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68b2229b48eso984644a12.2
        for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976318; x=1780581118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VF1wrmilBUlbim8sdlHkjNWy4s/JRLxuueYjCB0tac=;
        b=YTEZwRiQSM9RP0l8GbmMpvJHYJfGRPiE/uk9AxfaotULej8GbWy2mUZdQqbKiHQPUj
         L5tQXpsJ4VRfmAASbW8CMZsDV9qXknAFnTZlNXzp930ebb/oWrU4BDDzcs9Ewwugm6Fp
         QYtaARp3BcqRafSK3X9HNJwS5IZu/WkHxCuRSg3u6NnQPL5gMSjue1zhZn21Ge1Sosef
         pHnSvm9DX0oZjMnRN0YX+BRPcipEIH9W8dNZAviakS4PEnmuXd//Gt6R2Uc8VSthOU/X
         FqvwwQNVc/sDvhcDfhD4yO6gpGmI62BrBVmK5XUQrg5Y+Iv38viIoGhUbNLE360FTTnz
         c0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976318; x=1780581118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/VF1wrmilBUlbim8sdlHkjNWy4s/JRLxuueYjCB0tac=;
        b=jCjY2uI5NzxWU82MoFk/jLqEjZyJdEixDT1vYaEp9uqis1a8iaoyYUhbz1JkcrER1J
         Y9r44MPjs+ZMpxB8caodZsLO6S5ZwW4eWLew+KgcxixQs59yGq/ab70Op51odw1wuTLT
         UcR94k3Yju9s4wfw6D0dj4txi+hTOjx8hlQ94Lv1dG6+ZgKRPoXJ/ykDuYFUWuT7wWrw
         M+JH26Soanz6r/C6ZjGJCaY/yPOP3qDNTFGc+18rl95Hk2CzY51RDbqkfFXleA49frLR
         6vG/280Y1/WymZfyrLzmzTkLfWK5m+ns8whgkXVye4Vd3m23zI/5nimRz2gMg9iycVK2
         6qvg==
X-Forwarded-Encrypted: i=1; AFNElJ9NQYnfVfo+MbBJRnGrBFmpQ4Yn+bivkywL52y9Cw91stlRMVUolPxoEN23NqDHSybeJtE7EeNBdTA1@vger.kernel.org
X-Gm-Message-State: AOJu0YxqccG3IVamOnf1tbr1utVmuLDbBaRYBgE7nmSjU40iOkhegdpz
	hNBY9Df6TEklOydJLSnSv6Xxj1is+MFT/2JKrZKCWKFzxd/aPzZy/OFb
X-Gm-Gg: Acq92OEJ2eejQOETPA3Njtl08ChoUgdYW45UHnd4lDJ74I9XFDZo6/15NTNc1vF9H4D
	/yQFxOaYnpUF5I0YfAtoCpEmDWtD0JF5RPMgMDgPcfNKz9M6FbBQYezEju6UKGXVsX8ZKgZXqEY
	8M/yNVYrBnOWGXKXOemWoclBYC/RXEAFrkQ821f+tCkXZFrplCZWyb3S4eVAHw4kzg1PI/RRgzc
	L1HieRCHX8Ju5uPPGfuRyHCSsWgPGcOG15gb2tGI9aaZAVUM8B9pEO1jaXMiGNFgeMgoU+nkMLM
	aj95qINRNkTMRBZGjNgyBYCkhcJ2x709t5ZycwOet5GONCfswZCnO36qK1PNZ+09/7x/WZCZhGL
	T/+Q9hs4KxPnQGXkE4lHJVXOJ75CNN2lz1miSefJiFU0CvqqU6cafvEAEpl9YDAjkcSAFC/Q+Rc
	2CHnnObI3MVhRJ/08jy0HyXOk=
X-Received: by 2002:a17:907:d10:b0:bd1:4da0:b0d5 with SMTP id a640c23a62f3a-bdd2360369fmr1692341766b.17.1779976318068;
        Thu, 28 May 2026 06:51:58 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65da3bbsm723636566b.52.2026.05.28.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 6/6] video: leds: backlight: lm3533: Support getting LED sources from DT
Date: Thu, 28 May 2026 16:51:23 +0300
Message-ID: <20260528135123.103745-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528135123.103745-1-clamor95@gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8354-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BFFDE5F3271
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c          | 55 ++++++++++++++++++++++++++++-
 drivers/video/backlight/lm3533_bl.c | 37 ++++++++++++++++++-
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index d707d43d5526..07390bba9a48 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/leds.h>
 #include <linux/mfd/core.h>
@@ -26,6 +27,12 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_MASK			GENMASK(7, 2)
+#define   OUTPUT_CONF1_SHIFT			2
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_MASK			GENMASK(3, 0)
+#define   OUTPUT_CONF2_SHIFT			6
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -53,6 +60,9 @@ struct lm3533_led {
 
 	u32 max_current;
 	u32 pwm;
+
+	int num_leds;
+	u32 leds[LM3533_LVCTRLBANK_MAX];
 };
 
 
@@ -639,7 +649,33 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
-	int ret;
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	int ret, i;
+
+	if (led->num_leds) {
+		for (i = 0; i < led->num_leds; i++) {
+			if (led->leds[i] > LM3533_LVCTRLBANK_MAX)
+				continue;
+
+			output_cfg_shift = led->leds[i] * 2;
+			output_cfg_val |= led->id << output_cfg_shift;
+		}
+
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF1,
+				    output_cfg_val << OUTPUT_CONF1_SHIFT,
+				    OUTPUT_CONF1_MASK);
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF2,
+				    output_cfg_val >> OUTPUT_CONF2_SHIFT,
+				    OUTPUT_CONF2_MASK);
+		if (ret)
+			return ret;
+	}
 
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
@@ -714,6 +750,23 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
 
+	led->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	if (led->num_leds > 0 && led->num_leds <= LM3533_LVCTRLBANK_MAX) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     led->leds, led->num_leds);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get led-sources\n");
+			goto err_deregister;
+		}
+	} else {
+		led->num_leds = 0;
+	}
+
 	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index c03d0d1667e4..82b46a531dd2 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
@@ -21,6 +22,8 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
+#define   OUTPUT_CONF1_MASK		GENMASK(1, 0)
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 #define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
@@ -34,6 +37,9 @@ struct lm3533_bl {
 	u32 max_current;
 	u32 pwm;
 	bool linear;
+
+	u32 num_leds;
+	u32 led_strings[LM3533_HVCTRLBANK_COUNT];
 };
 
 
@@ -248,7 +254,8 @@ static struct attribute_group lm3533_bl_attribute_group = {
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int id = lm3533_bl_get_ctrlbank_id(bl);
-	int ret;
+	u32 output_cfg_val = 0;
+	int ret, i;
 
 	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
 			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
@@ -256,6 +263,16 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
 	if (ret)
 		return ret;
 
+	if (bl->num_leds) {
+		for (i = 0; i < bl->num_leds; i++)
+			output_cfg_val |= id << bl->led_strings[i];
+
+		ret = lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1,
+				    output_cfg_val, OUTPUT_CONF1_MASK);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -329,6 +346,24 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
 
+	bl->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default HVLED or is not linked to any HVLED at all.
+	 */
+	if (bl->num_leds > 0 && bl->num_leds <= LM3533_HVCTRLBANK_COUNT) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     bl->led_strings,
+						     bl->num_leds);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get led-sources\n");
+			goto err_sysfs_remove;
+		}
+	} else {
+		bl->num_leds = 0;
+	}
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		return ret;
-- 
2.51.0


