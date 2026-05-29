Return-Path: <linux-leds+bounces-8383-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOLTDhvpGWpazwgAu9opvQ
	(envelope-from <linux-leds+bounces-8383-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:29:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B52607DDE
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE15E30CC978
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 19:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6113D7A01;
	Fri, 29 May 2026 19:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xIu+4Ptb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E13ACA5D
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082599; cv=none; b=FOpvWQQt5nYbHvEMi5pBulk3uKZZafJRhYIfJc4kf0swUXRzLxLStrRv8YnZCSpBGzpal+d170UDcu94h3rE/VjApK7EB1xoexfoQM89NDMoJ0yYMDgX1eBDLCyaI/G0odqsiP7iiTKGYkN2I+xqPlhd/sbKRq3qG2tNVNGfx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082599; c=relaxed/simple;
	bh=gYcq7Rz4j6QtBRxcKhlguyBDeB7tKsEFmNCPTB3yxUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOeQxti8H/9VwAL0qau07aK27qtIDFC9qURsVcPaLyLz0Yuy1U6+RDy+0QOLpiR1rPDKjC2hyq8litNW5dS87XRok08FpxdXGq5jGNgwSfYG6RHi64kbz5ushuCTDe+FQNewuTehUJqBkqGpyHTgAofsaB0lQz0KT5TBI/4H1o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xIu+4Ptb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso92251045e9.1
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780082595; x=1780687395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//M1ApxG9v0l3nblUWj9g3X4Ff7TR6GHEfH34gHlZFM=;
        b=xIu+4PtbNwWS65W56REv+vhoMCSl77WZ1r9oSBEVY6RrzeQ/iGednY1lUa0GUOYzuz
         3zSC8JMVuSipzTVv8NxiwGRKfSBQb4iOORRBcokm18WdlssMJsrixhCv07q1pIr8Wxgx
         7Jm19fO/lhIIL9S2inF3Rscc4c3sIg9ewtkpEr2pQTbTwAeIZfZ7P2wNZna3wkGrRZiD
         HQqReF4M8yOy2HlmMdsMqpgwu9fx0QOPlpXCD3IAjxQq4faJvojbscdJC6FCRzGjdliu
         VbJU0gwI8EUO+EDIduaRRHFWMWdiaSVZtQSVs6PeDAAEJ2h3iwsFwpEKIiFZKGsmo0E7
         B2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082595; x=1780687395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=//M1ApxG9v0l3nblUWj9g3X4Ff7TR6GHEfH34gHlZFM=;
        b=reI2NkR1w8ZTgBUle37dqt2DKbEW2Yo7bahmDprhQ1imBwHcGRVO/b7ehh76KKCMms
         Uk32d7P2+keu7Ab3h9uHTxfS/gbBDohqjWoXorAeYRZ/Rum/oGC0RdzDhwn5UYE4dJZN
         DdBkI3JXYm0LgOmfC7XH8+D/7iKfyGPh1nvQ+6kvI+FPL3pj41/YQp68EPogIeYvkz3B
         1z4KpARYqU6uxhC9OGaX5u4qcwXFND4uU2MLkSYqUgoJ3IvhWUlrSAjXY3cfbKliw8ei
         dE4G7r1SAbQSw4lirnwJAkNlhvc7xVfgCQFPpQa62zOHOxg9HU/UmNaL4BjejYwDiIyy
         RSUw==
X-Forwarded-Encrypted: i=1; AFNElJ9tvWHe+4p29V5nfOmvC20bw6FuacvPJ3PCYCMXHdqC6xSVTO5Fa50zdu1TVyFUXZ88mIhmqv3udD+7@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOW6yG4WerRkYZLl/9juCpG05JH1OCTA6paGBlLJ5wUhnN4bM
	Ea9uNpWbGFXnCrRbjfnZOEDJbwvOt2L8OUUWBbcOMW5aDfaU0xFC0isoq7Ou6DUxTjs=
X-Gm-Gg: Acq92OE1suzztj7BHkt9nEpFQL2QgAqTdIeY73Crrm3oHqRvISqVfNCh16Id2M8oEpN
	d4BgMvAzW5+A+U1qMicTZqEAtdsgqYwJccUicPLKmiGDhmBu/GqpjEEMah+bK9rI3DGi7cig9AJ
	kkL3ZO6RIfsGHgwDI6jeaXgkWFj/8E8KxoGsn9OCknNRRYrsNToSrgC66bqUH3/ETQNJuhWPR8n
	vzjyFRU8mRRjEOtAieInhUsQIyMGpbUazrRevvMrkhpwyxHfXmFVElAtsRP/TMo0TGN0hfBTFs/
	+a+de4PaHG3IdyIdXnFWtxs1Qgkwi/JZJN6SuUYDBItTUfVFRecEfrkpIw1GyjNdRoKHAE47l/t
	zVqHjWNDJhbSv6nhrlCqiEKG/kWD6jogXSf7tIcVG3CmB6OpIpKKzSHEuB6ClBQH+AUU1hZbX5Z
	h/FiMzWI07An4AhzDLRXwUJhjo89mARPbXifbzdnkPPQlnMxw9fpXI/KY=
X-Received: by 2002:a05:600d:6446:10b0:48f:eb8b:997a with SMTP id 5b1f17b1804b1-490a2965784mr12217235e9.31.1780082595029;
        Fri, 29 May 2026 12:23:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm28692545e9.9.2026.05.29.12.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 12:23:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 29 May 2026 21:23:09 +0200
Subject: [PATCH v5 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-2-03aacd49747c@linaro.org>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
In-Reply-To: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9056;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Q/1ZmBHTV7Dmd3ACYbq+YYmxVmtDO6gVDxzfxPEqnIY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqGeeexQxA3p7IBJrzsJwUeqbb6uvAkUHR/tiqKJpB
 m1wNpZ6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahnnngAKCRB33NvayMhJ0YKIEA
 DMglzCxZ9tcxguPCX/kBdKAdfE9gB+UDXs/KtKnsN66L2F9YpTWlYTgpapIp5vlj/TrJOiLVPtnc0P
 JXi2KKA/w+1JJlpyzlfapEn5XXpIHp+T1OA+pKIC+6R1Uy8Xs5kE80aIebLFZea+xcNd7Seb2rc51L
 l8TsfxkuxwyxF4B9k9VyXph2L7kD/APYcJudb1quJ+U8VCASYfvTt287qceNP9kq42O2UDRcHf6cJA
 vWfkACLc9AYwc0yu15SL7okNj7qNk/sntoXTlOgHgV0E43+e/m+MJf9mE5bpLxUVY7vKois9DuUE75
 IQ0DrnuI1k1O5vCpAO0XbaJ6aCCEi6WVzP1pJgOI8L8V8ZalMoMgScPhTP3HexizJmOsicRkYbwgDW
 6M51RaTIxSdpZlim1ViTTMHFm2qeYejU4NWe9WszG+BCiIhShuCeZFy/XVzOzOLfK+E6Vknd7zhILN
 s8uIQhkF8Mr972wKXTGyeAOURnxc44Og5L/U5Dj62k/aB6OndIHLPEdf5XEgmdGY6czdWmlAGsc4H7
 lKbFpgCBXuG+LhjA4Ke8ltXxEEifkF606DRHfkm62530LWroa7Jo5fhm90lBTEietsu0rfykFlPdKM
 lEozFAxYR5u7Z5O44tvYJiHCK4/rl0DIA+UOIRM8pjEPWHAa2hgI09OpGY3w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8383-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,outlook.com:email]
X-Rspamd-Queue-Id: E4B52607DDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: KancyJoe <kancy2333@outlook.com>

Implement support for the Silergy SY7758 6-channel High Efficiency LED
Driver used for backlight brightness control in the Ayaneo Pocket S2
dual-DSI panel.

Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/video/backlight/Kconfig  |   8 ++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/sy7758.c | 259 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 268 insertions(+)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a7a3fbaf7c29..a1f70a2bae99 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -207,6 +207,14 @@ config BACKLIGHT_KTZ8866
 		Say Y to enable the backlight driver for the Kinetic KTZ8866
 		found in Xiaomi Mi Pad 5 series.
 
+config BACKLIGHT_SY7758
+	tristate "Backlight Driver for Silergy SY7758"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y to enable the backlight driver for the Silergy SY7758
+	  backlight controller found in Ayaneo Pocket S2.
+
 config BACKLIGHT_LM3533
 	tristate "Backlight Driver for LM3533"
 	depends on MFD_LM3533
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 794820a98ed4..39ef588b1cf2 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
 obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
 obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
 obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
+obj-$(CONFIG_BACKLIGHT_SY7758)		+= sy7758.o
 obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
 obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
 obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/sy7758.c
new file mode 100644
index 000000000000..786589cb8df9
--- /dev/null
+++ b/drivers/video/backlight/sy7758.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Silergy SY7758 6-channel High Efficiency LED Driver
+ *
+ * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
+ * Copyright (C) 2026 Linaro Limited
+ * Author: Neil Armstrong <neil.armstrong@linaro.org>
+ */
+#include <linux/backlight.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/err.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/regmap.h>
+#include <linux/bitfield.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#define DEFAULT_BRIGHTNESS	1024
+#define MAX_BRIGHTNESS		4080
+#define REG_MAX			0xAE
+
+/* Registers */
+#define REG_DEV_CTL		0x01
+#define REG_DEV_ID		0x03
+#define REG_BRT_12BIT_L		0x10
+#define REG_BRT_12BIT_H		0x11
+
+/* OTP memory */
+#define REG_OTP_CFG0		0xA0
+#define REG_OTP_CFG1		0xA1
+#define REG_OTP_CFG2		0xA2
+#define REG_OTP_CFG5		0xA5
+#define REG_OTP_CFG9		0xA9
+
+/* Fields */
+#define BIT_DEV_CTL_FAST	BIT(7)
+#define MSK_DEV_CTL_BRT_MODE	GENMASK(2, 1)
+#define BIT_DEV_CTL_BL_CTLB	BIT(0)
+
+#define MSK_BRT_12BIT_L		GENMASK(7, 0)
+#define MSK_BRT_12BIT_H		GENMASK(3, 0)
+
+#define MSK_CFG0_CURRENT_LOW	GENMASK(7, 0)
+
+#define BIT_CFG1_PDET_STDBY	BIT(7)
+#define MSK_CFG1_CURRENT_MAX	GENMASK(6, 4)
+#define MSK_CFG1_CURRENT_HIGH	GENMASK(3, 0)
+
+#define BIT_CFG2_UVLO_EN	BIT(5)
+#define BIT_CFG2_UVLO_TH	BIT(4)
+#define BIT_CFG2_BL_ON		BIT(3)
+#define BIT_CFG2_ISET_EN	BIT(2)
+#define BIT_CFG2_BST_ESET_EN	BIT(1)
+
+#define BIT_CFG5_PWM_DIRECT	BIT(7)
+#define MSK_CFG5_PS_MODE	GENMASK(6, 4)
+#define MSK_CFG5_PWM_FREQ	GENMASK(3, 0)
+
+#define MSK_CFG9_VBST_MAX	GENMASK(7, 5)
+#define BIT_CFG9_JUMP_EN	BIT(4)
+#define MSK_CFG9_JUMP_TH	GENMASK(3, 2)
+#define MSK_CFG9_JUMP_VOLTAGE	GENMASK(1, 0)
+
+struct sy7758 {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct gpio_desc *gpio;
+	struct backlight_device *bl;
+};
+
+static const struct regmap_config sy7758_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_MAX,
+};
+
+static int sy7758_backlight_update_status(struct backlight_device *backlight_dev)
+{
+	struct sy7758 *sydev = bl_get_data(backlight_dev);
+	unsigned int brightness = backlight_get_brightness(backlight_dev);
+	int ret;
+
+	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_L,
+			   FIELD_PREP(MSK_BRT_12BIT_L,
+				      brightness & 0xff));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_H,
+			   FIELD_PREP(MSK_BRT_12BIT_H,
+				      (brightness >> 8) & 0xf));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct backlight_ops sy7758_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = sy7758_backlight_update_status,
+};
+
+static int sy7758_init(struct sy7758 *sydev)
+{
+	int ret = 0;
+
+	ret = regmap_write(sydev->regmap, REG_DEV_CTL,
+			   BIT_DEV_CTL_FAST | BIT_DEV_CTL_BL_CTLB |
+			   FIELD_PREP(MSK_DEV_CTL_BRT_MODE, 2));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_L,
+			   FIELD_PREP(MSK_BRT_12BIT_L,
+				      DEFAULT_BRIGHTNESS & 0xff));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_BRT_12BIT_H,
+			   FIELD_PREP(MSK_BRT_12BIT_H,
+				      (DEFAULT_BRIGHTNESS >> 8)));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_OTP_CFG5,
+			   FIELD_PREP(MSK_CFG5_PS_MODE, 6) |
+			   FIELD_PREP(MSK_CFG5_PWM_FREQ, 4));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_OTP_CFG0,
+			   FIELD_PREP(MSK_CFG0_CURRENT_LOW, 85));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_OTP_CFG1,
+			   BIT_CFG1_PDET_STDBY |
+			   FIELD_PREP(MSK_CFG1_CURRENT_MAX, 1) |
+			   FIELD_PREP(MSK_CFG1_CURRENT_HIGH, 10));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_OTP_CFG9,
+			   FIELD_PREP(MSK_CFG9_VBST_MAX, 4));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sydev->regmap, REG_OTP_CFG2,
+			   BIT_CFG2_BL_ON | BIT_CFG2_UVLO_EN);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int sy7758_probe(struct i2c_client *client)
+{
+	struct backlight_properties props = { };
+	struct device *dev = &client->dev;
+	struct sy7758 *sydev;
+	unsigned int dev_id;
+	int ret;
+
+	sydev = devm_kzalloc(dev, sizeof(*sydev), GFP_KERNEL);
+	if (!sydev)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, sydev);
+
+	/* Initialize regmap */
+	sydev->client = client;
+	sydev->regmap = devm_regmap_init_i2c(client, &sy7758_regmap_config);
+	if (IS_ERR(sydev->regmap))
+		return dev_err_probe(dev, PTR_ERR(sydev->regmap),
+				     "failed to init regmap\n");
+
+	/* Get and enable regulator */
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulator\n");
+
+	fsleep(100);
+
+	/* Get enable GPIO and set to high */
+	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(sydev->gpio))
+		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
+				     "failed to get enable GPIO\n");
+
+	/* Let some time for HW to settle */
+	fsleep(10000);
+
+	/* try read and check device id */
+	ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to read device id\n");
+	if (dev_id != 0x63) {
+		dev_err(dev, "unexpected device id: 0x%02x\n", dev_id);
+		return -ENODEV;
+	}
+
+	/* Initialize and set default brightness */
+	ret = sy7758_init(sydev);
+	if (ret)
+		return ret;
+
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = MAX_BRIGHTNESS;
+	props.brightness = DEFAULT_BRIGHTNESS;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+
+	sydev->bl = devm_backlight_device_register(dev, "sy7758-backlight",
+						   dev, sydev, &sy7758_backlight_ops,
+						   &props);
+	if (IS_ERR(sydev->bl))
+		return dev_err_probe(dev, PTR_ERR(sydev->bl),
+				     "failed to register backlight device\n");
+
+	return backlight_update_status(sydev->bl);
+}
+
+static void sy7758_remove(struct i2c_client *client)
+{
+	struct sy7758 *sydev = i2c_get_clientdata(client);
+
+	backlight_disable(sydev->bl);
+}
+
+static const struct i2c_device_id sy7758_ids[] = {
+	{ "sy7758" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, sy7758_ids);
+
+static const struct of_device_id sy7758_match_table[] = {
+	{ .compatible = "silergy,sy7758", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sy7758_match_table);
+
+static struct i2c_driver sy7758_driver = {
+	.driver = {
+		.name = "sy7758",
+		.of_match_table = sy7758_match_table,
+	},
+	.probe = sy7758_probe,
+	.remove = sy7758_remove,
+	.id_table = sy7758_ids,
+};
+
+module_i2c_driver(sy7758_driver);
+
+MODULE_DESCRIPTION("Silergy SY7758 Backlight Driver");
+MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL");

-- 
2.34.1


