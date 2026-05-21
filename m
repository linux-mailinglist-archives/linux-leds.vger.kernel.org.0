Return-Path: <linux-leds+bounces-8273-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC5FBWy9Dmr1BwYAu9opvQ
	(envelope-from <linux-leds+bounces-8273-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 10:08:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E32895A0B5B
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 10:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E953B3016C6B
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917D13A3808;
	Thu, 21 May 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W844u0n0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6000F3A254A
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350889; cv=none; b=V0Wa42zHmsIUeKCFKrVKJbYAnGYqA8hOTyZOB4sdDcaIQP2+38ZNN3dZGG/eIpI2y8vngNN6kMJTctiKSpqodpFflbb6pS741nD5zGPfjQdnQk48H4b8hJmNVV/Y7bOtbVBnUiePGw1z9IWagLNwaXK/W584nDcxfIXbKbre8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350889; c=relaxed/simple;
	bh=YM4aydwESMgjV/jGUV++ipJrCu/qhshZ0GSCTAoHrLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LICeOET6w8uFxA1iE3j5GnXZjMQvN/A8qqSTWQxcgMH26dNc4ng6DuyOZkcEQImbRD80d8aBCoADEcgUSmX4t7T7KVSxAFwr9LUnmsDNJs7gOdUlHujWX2lTRruWMLCOXoD73Mb0ABGfX2/5bdQysD/5wlbor/+03+P883wBmKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W844u0n0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45d96d21e82so3359165f8f.0
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779350886; x=1779955686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqmwp3XSllutSgEQB4jfU8Pcl5vqj8wTCUN+On/194E=;
        b=W844u0n0KB5faTISphy5D4W4nxSxVCWuhdDOn2FH3fPny0Yk05FqARrSdY8eb7jdlk
         Ch86mlMTsBURFe/3xmo3+b2XdiYOcT0bnBz11V9pwonvbHnm1P+Ym5pcihd9jgTw7x6W
         l5zt2gBYta/7GWjD8tsWuhUkYL6DtNFHw8sB0BE5OB8d9xCUxSuhdow0188JrhJeWhKe
         BKXEp2kaGXLD5YTt42DGast4z89381gxJKJR92X1VxAO6hkVVA5W6pfrjK84cEddUt94
         SnJMlCTQIZHsCQuLsBsx6F1t2uFzztzcU07PZAp1D5hxpmb2g+eHSf72y2IVKdZVD04Y
         wZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350886; x=1779955686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hqmwp3XSllutSgEQB4jfU8Pcl5vqj8wTCUN+On/194E=;
        b=SXl5RuTTQrhjKCo2wGStWuIAP3TsPHzH6ivDfIwwsbtmDSX9AWWFvo+DhviIeEoNd4
         MKhXHZkk79gxChTOA3lrMFRC6dTi+1rmVQdCnrIO3GIgE/g08qn719kIojhVQJe00vLV
         KAbHGCqOnaIZNCE7ihFFIosee3eZwZJfIz+jg9wcmMbHfootKVoKfenyAilHz1nNyi5q
         qBVrA9r+Q65id+5fdHi20WdyGyF0rB2oNSLNMaUl1ENBE+nxqIBnGgaQTbMca0whSImX
         g14Np1U/Rc9bs0rKg1Nqw8YH1gpfvMyoIwcMvkjITzzWoQkccO3HjSmwML8QmIX5bxQ0
         HNKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5738FLTzA7wGtPtrbaSCNRjgF8tteLKmM6KVSUTt2FOIKEtBL3RIWI8mosFgTle+WM0BXMvoRJO9V@vger.kernel.org
X-Gm-Message-State: AOJu0YxaujcxPEbaluprmxBvRII2R6+MdsHt1dXmdXtuSeauUrbU8kST
	tQ5WRQ/qF6mMjYF1oJWZXEX+H15ph3N3hMuYp/lyxSxyXNA26pn3YrGcw6kK2PD9IIg=
X-Gm-Gg: Acq92OG4zkXc8npgLWSA0Q3OCoOn+54CENbcd0vVebKcKWCArQUNJdlxQagz4XDDjaT
	qqBUwW7B5E5s3vp67sG39hxw7RRP4Zw/Ak5KjnKIJPDNKHMyBmAVRmVRdCdExs6VsKuIO4iQ8v9
	fTRRqTGpeT2U1n2oFMFc36kKvDoCb4ytLImwV/JUr+7qX2QwjNyN+16TnRVBKOosbwHYX9HI4Jm
	GwSCoSMKotkMuRfcVkPFNWsmG2LYqoriPO7ztqO7TSd1EJdnj1/L/+yHXAfI4xoBW7Qm0VqVPIB
	N32NuC5bsT/H6G1zVspanxNvyDNyRVKF9N9CsQAUBDuGs9B/oT6iTDAiWWaIqbV+unE8jR7fLl+
	Y3rMr8lQBnxUsUy3Xi4iXbdf6AO1HSMrv2Km/3NpSdz4Qvf02SCjf3tQl/GnlObtsFEAjFjMcZ8
	j+4gFAWJNtwlbg8X5/lvceC8Dt4McsLXLRRMcpVIxTFUc/
X-Received: by 2002:a05:600c:45c6:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-49036033502mr22829275e9.5.1779350885518;
        Thu, 21 May 2026 01:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92ca4esm814369f8f.22.2026.05.21.01.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:08:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 10:08:01 +0200
Subject: [PATCH v4 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-2-73c732615e4a@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org>
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9059;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hejPZrQ9SUd6MBtEDhNk7MB+lykwJGM3b2AfdI4PgS0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDr1iNl+h8A/oQZ3DGDFQqAjp7LOGLMYbn5N0O5r1
 pftF2FiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag69YgAKCRB33NvayMhJ0dfvEA
 C1J1n3YlTRKzMOie9ESSzPDglS9AEq0GgP3WeSUIDZx2tK8t3CqxtClVHl5EKNNhbKzv5oEZCRKi3g
 Gu53zhdzaREkWyXG7ytUP9JTFyOiMMah4EeGwSbPnsxuA7KQqQqM0lehFZY066nYH378bfh7l2V3IO
 iDUiZTROYr0piNlmWwsxB8ZX7OIXTekS6Yo+zP8HXiUFQNx8HbDJyT4cn7v1+d6EAdpJoVjIJ3JhxD
 qKXMx9vwP63si+LAm2rAAuz5SjTLyfLMrEUj5PKW5ab9R8PuzQIqjjyKIfsicmYP1WZ3KkSQj3MM6+
 uss4IXMGWzAXLjxh6B5IFEGLulKtV7k1/hhCPUu1NL/d7f0LcYX0Trq16rnh4aG3fNyvg5Q8LVxIpa
 o/F6+8h174shFN6EXYCPSh3dH3ewyBdRdb40oE/mW3NxSse6JNAeRehBzpxkaW8XBfLZodlhgGK/q7
 PsZX84nz8RSf33PlTZWPHrdYdJkX8E2RMoktR+1YkqoM4KYMjrUvHH9yvW1wDEng9FroVjJrIhGS8J
 HesQovwRCwKIsAiNCNFQl2p6+RfsGOWJATDUvyFgQX95wGv3ts412mHB/oyn2CD1TDhoffynWfIRs0
 WmNBOE35T7b11dlmYwL16lAcueUy/zY5k1Uy8uZfsDa9F7kgsZ+xsFV+rqAg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8273-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,outlook.com:email]
X-Rspamd-Queue-Id: E32895A0B5B
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
index 000000000000..198d55939438
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
+	/* Get and enable regulators */
+	ret = devm_regulator_get_enable(dev, "vddio");
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


