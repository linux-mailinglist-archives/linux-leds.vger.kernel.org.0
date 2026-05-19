Return-Path: <linux-leds+bounces-8205-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJTjIt8iDGrjWwUAu9opvQ
	(envelope-from <linux-leds+bounces-8205-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:44:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5457A62A
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85354302B74A
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 08:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08A03E929C;
	Tue, 19 May 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmqyCuRl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5D3E8324
	for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180232; cv=none; b=q7hSfS17DS9+TkHox9/PG4MPVlU+uYXZQ8+pLiIgLlNM2EJ7E/Nd6pDTeAMusCgQfvdRzP2KHdlNLDxjtjMjf3bxVylfcinZpqADXSoS8ou/5kd0XCvgXRv+nMgTURXK2gFoj3K65Rw3naOcqyGHjXx+O+MKHUC4ojIhlxd1z2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180232; c=relaxed/simple;
	bh=+UmLm2la6J+9CZ1tOqDl3OuAY4zUNXxkK2YXwTA6dfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOjvkNH2omdvRFMipxv9FsboNuSaeEp0+394YOhJb09kyFwD1nWifUAKyIotVFPmMSgXgAaT0SHvFw1p3feUty5/uxtCDlTDY6++0Ph9oUsJs217MxlhY8PqdawhxLpMPL4Ne4v+Tp1PqKbGltkTEarF3SAmr/v7SDLKypXHff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MmqyCuRl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2332077f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 01:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779180225; x=1779785025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V8owIkqb0IXOMsCbYYf82xOEW2gHUB6FosAIwSfRW8=;
        b=MmqyCuRlgnlYlakVU2NI644WGV05Ur92di8kDV//pwIzfvs5aXScyBVM7F4FtxXQAb
         rbs+5hM277Zag8TPQkWllTLzqtYjR4R2CSBT9CW4kQMhqErYPv6vQBp2AuEirPBU90mR
         2leJTfBBxgtQ5zlJrGfGtP2OumaKmv/hEF23h2RYk/B6T4oxXQ5VTi+xmf7fXrKvbGYC
         ETXrNOVw228/GgfdjyEKGI6cEV8UPG/vKeBLRVL6LaR1Vjam2zLabkCFz+y33bOCXzwb
         0vJ1hKWhsp1xpb5ubFh8sW4fmPD1uz1yBpWYOTE5NFV2GrzfICgvFGJFqGIekBPTuVdR
         k4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180225; x=1779785025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8V8owIkqb0IXOMsCbYYf82xOEW2gHUB6FosAIwSfRW8=;
        b=QlicdwqiyklN6weatcaTtLpWBeYuUJuixXS++8q5uiWt53AtLMuFAgaZvDo0oIFP2w
         bya+fC/ssKeERtDYvFubKk+YpIxmBWkts3ihDXnjC+2+MlfXKyjDs2i1Bp99MHoM32jo
         dYf1Lj0I4+crLmqEvot1MlxK5nhM9jfB0b6PE9vwpy+NSHkhl6oizKVBjTlpxM9Y5ZQu
         YZkzzRjWcTNHM3O8O29ddeCigKgtaqVUJQ8sypnh9cKygS2odxX3B0gpixdZYanaPDB9
         NJY4zv4D/FkUH0R/nHe4tU0NgjzDAcCXZeA/4SOz4o10OIahs4wr5GX2WL3PF6VV3Nsb
         7y9g==
X-Forwarded-Encrypted: i=1; AFNElJ8xu2ky4oy21qmrOte3Jns0vXgGFbn8frNVHl+Ss0rHdtUWUsiqvN0XrXiSQakOpH2LpY1rkvl6L6bH@vger.kernel.org
X-Gm-Message-State: AOJu0YzYiXxo4pB5KRKiRTOCpVL+gO8bl1cvMQZWwB3rSxMP6xLXlWKL
	5KZWhzaKXW73OHTa+Kcx0huoou1KSF+WL0wO49TnU3zQIBSKPDbhiS8eSFygLiKDX00=
X-Gm-Gg: Acq92OEZb9/lL3NeOP72UcZz76bGxRzFS2KhKjj2skjLm08m1E6xKGy4dkWPoNDhcEP
	UC+68IbCCH5bvovlojc3B1e11gpXUHsENfAsDgPBXIw/Ai7Uk6WrE7GyLLIpAv9iQ7ESNDUs4BQ
	FLMeqFzFBMg45i2tQlilwLQcj5Xq7DXCOm3NtEPWA4QDUBrpP81d3XNOdLJyEbiZrOWX2KIqzBO
	IjGbQPXqOHKs5U1ZON8taaWKazoTBpMhaxcSl3p+hIMImB+j6TFlfAiou+kEwUULKCo8wHSmGx6
	nnspKRgJK/3DYTzpIUBQlPTXg7liW1QRvKkYMwNjfb2DzbASBK/0h3HI9XpAx79tltMQhX9oYD0
	s01JClLNCqepkNYMMQ/sIegrzGAdvjlNqmdQRMjQyVrW+fhMPx5nG9hoV7ib5Zn+au+lwTln7/G
	r9cKo47VKzB3hXFvM1+RhGoud/sm0mqFpi9luzvWu/MlX8
X-Received: by 2002:a05:6000:2503:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-45e5c5ca060mr31027168f8f.16.1779180224776;
        Tue, 19 May 2026 01:43:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm47709855f8f.31.2026.05.19.01.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:43:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 May 2026 10:43:39 +0200
Subject: [PATCH v3 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-2-ec8194bbc885@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9072;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wb7mo6LEArl0Je+5k74ZTD2ybJAQuH2n+ORe4rJ9pdM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDCK9zoderLsc8QhTndVTQm+bNlrG/gTaYVNw3qVT
 7agj8MWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagwivQAKCRB33NvayMhJ0aRTEA
 DAYCVPIR5BYMJF25xPixbYB9+ChXuRKhxjdIOjvUvHx6pppz+ppOfFeWBo+UcP2DwJ3euz+jzQnDiX
 yh935UGHrfMAMlY9Wi3JYwHYhYiYhELv2SElU362IA5z2iVVYtY2lUAcFUYHa/ayLCboim6qDNCI1b
 yomUiUKYTAIj+ZJhr7/5FTNgVlrPD2+lnv7qfT6Zfy9q80mDqYABWBCFHfK6xi43u8gZPPvdlyGUkx
 QSxii+gNVDI7JsJ2Jgne2eStQAs8H33LZvnEx3apgBmVuqdYzCm6GTCL3V5c6WEgw8XTcJrTwrDx3b
 6r+IGuvkUcrJaU498vVd1C39w9ySvbkIQj31BP/3XYC2Alk1o7KnwRyWxeKKrNtcLXyRy0SFXJd0KE
 Vp6GswHg7tolpatNb1z/N4/RKtIRSSVfdiTby1gg9pUeJr/IfElApZSjGAJ23yWsAiKsD9TJP/2aZM
 OT+G+UvezdAHGoH//Ayk2tAzB18jtR5NmZgdNbYcLg5bPpTs5Zf5RQsSGWG5tyMU6zH7lYVUzVTZeP
 rAm08YL++MxL3p6kDLHgYKhAAnKSgK6v7ZoKW2+BKem5rq5AtKEw2VoaMJ4nAo2Sw63a0oG3ezHkeB
 F2lvSJ6WwFNKD/z8BiS0DIY73hRl9VnkQUBCF66xuOIOg/dfO7BTd18+njxg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8205-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email]
X-Rspamd-Queue-Id: 14B5457A62A
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
index a7a3fbaf7c29..052ac80c8213 100644
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
+	  backlight controller found in Ayaneo Socket S2.
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
index 000000000000..a6087e687b64
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
+#define MSK_LED_ENABLE		GENMASK(5, 0)
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


