Return-Path: <linux-leds+bounces-7922-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Na2EE0p82lsxwEAu9opvQ
	(envelope-from <linux-leds+bounces-7922-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 12:05:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B44A075E
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 12:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11BD430FEA2E
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 09:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F7C406275;
	Thu, 30 Apr 2026 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOHwMywE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95988402B89
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542448; cv=none; b=LaEn2TrJi6VHiCF1QU+7V3YSfSvMHRdKNhdsCRDrkfcLPOaU49mAm0vFM1F4WRCv0r4sdK7a+XyKRqk3OZY1Bojvxj/vlArSrkpXItz68E8Q7ao+MNT5antGF7WjFVw8kRc0CsrgWFRZaxuC2WPRgBuWxJNlnux2iftnwFwn+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542448; c=relaxed/simple;
	bh=XrDuU794qprgNSeW5W4bCAApe8VeiBfNu6bUAv6dbrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocaFKtQVbAMxZ0xx/TFrzWOE6r5IovjMywL8O3UVPZxNkhFoYIisxZNWtucgdVQFSJqGJkgbqOBQfug/KH7R/8jIjuTbUm+sLeJRXM00XVjbv1k8WUIf58AvLd16sa8jnr6WKr2xJVHSHuPIWNbOqOi5/ztQegRin2+4DIgkxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOHwMywE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so9542875e9.0
        for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777542444; x=1778147244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVGWuVeYZSrHV7cWGaHlLzujxCFV0Ak9I1vcraKctWc=;
        b=oOHwMywET91YJXSkBpK49nxU2CEpO2eYIJ4UZKvoB3nV44b97qjF0gUtHmOMHia8qs
         r90xIWv1cpwIz+MnEtZ6x+NRSw8x6bjz5mxMerqjkENERkIBnlykWCYiVlzDlvRRSEXq
         1SIUcaxTBaWCyEzReTWl3AIOC0HmbaKxYvweCjPZ0ycc9yzAK3Iv5H27fkTt/wjBRbwo
         PblFyZmo4jSqjWhmtRZBBP9HuawybCMpsKFiDngP9qDbV5ue5L9hj/89nPuTuCKAqL3L
         dr84Ia1yAiMPJDga0xsX2CVwYNRFC5vVCmDWXlXf72kEbSO8GFcAFlpDr6/ojdB219nf
         Fpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542444; x=1778147244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OVGWuVeYZSrHV7cWGaHlLzujxCFV0Ak9I1vcraKctWc=;
        b=kziv0ltiF0f/81Dim3uPmKolvSHfiQGyhYtgYyaxlMMZrVXfkUka2lrOq6ya/hUCQY
         3THmsPQczqKMqsgGJNNi1MoFHb23P5BVk8Ftz0OgIO/vlfZnJRD1LKKBj9+0Gsywu3vJ
         wrhZEp8SFFViohZH6Mxh5SqnmuAoG4GlJzuDB+u0apMt5eS3KhmzbPJ1hpwbyHAp0r/+
         x54Uu3cxRuDSYwfyRMYy6AK5GdZg/kBtj/hhCLGHVNxoTeyO2rk07echPl3pco0d7dGh
         qG2BCKOSezoO5LOTy49PJi5ue+cHnGSR4U37SLsMK3JB+pKPOa7fF5yEiC419MkKcgnS
         hHDw==
X-Forwarded-Encrypted: i=1; AFNElJ+HCrfOmIRiyePvM9QVF4naebHG1U8kahDsSigihVra+ny+l4pWDXEfvFlCOv4xnawsJAYX9w2unFv8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ablZY+7DyAVoRw8lsBC7F5IF6XsfrrpZg6vOxhT2kwdUM1i3
	UgMgYtmqbWmnWqlCn5I6L4WP7UBq/A1VlbR+gLds2Fdp997ks9F4OEFJ/JH0wH2J+Mg=
X-Gm-Gg: AeBDiesgJl1RNqD3dAj4n4KIITO+WQHQbF1nv9glKArh/e4owbTs97h6sXb8Xr0lSFD
	AmoYjB1CL2FNl9JWwwjdNZ8wBeXVCbbft1GyHbDhBFBxAHd2MqeMtj/vnDc+AyZ+AesrQBe3J1E
	dB0GDGudoH4UnZ2V49/a8/uv0dByTJniTTubHpJ6K7JS9ipwrUB9n/VOaXo6QJLj1t5MmbniArp
	4Y2jCq9MAkD9DsF7bVUbSnPvzdFap561fEyda8/RW9uJHaG9MRymr4rhLsFyUXLC5IJXlFWMjmE
	paZY7qLS59SryXGSWILMEuSXd9ECCULEA2JwwnLUZd5HwE7Rr3bDkQTjIu3T+lx//Z7y0Scyx0L
	J43SxWY/w8H9DmsKxHTwCfw9+/HBdeYhcE9mJ2Ir9GsCuKipCdwtntCCSAug0zUiniH/UjxDMmm
	VC6fOA2Rr5K+vns8FRAv6JZlhs46mWuYHBueUMh04ZvJz/SJv5rmp2LhQ=
X-Received: by 2002:a05:600c:1f87:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48a83d66cfdmr33734885e9.2.1777542443755;
        Thu, 30 Apr 2026 02:47:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b9493bsm48984745e9.0.2026.04.30.02.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:47:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Apr 2026 11:47:16 +0200
Subject: [PATCH v2 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-2-308140640de9@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10623;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oLphRrYMc/i7SfmwTz1M2EuUqdpJ7AM0v6IBJaIdGes=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8yUoIF1IVAD+WKCk1PLMHraR26aN3AB9AE67gr2L
 BONsRneJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMlKAAKCRB33NvayMhJ0Y77D/
 0ZSC96M1+wBb9Ix/L3K2H8VP1HmuMmIDGWIM+/vXOjOp/PMh/EjPC+uH+MQKPJN6jDaYYLqSEDlSKD
 gmSERMhi6N0AGv0NvmiAASXBJ2fjSKT9cCRKJmWSLytK9o9rXreSHYpqUx9ZdGH6+WviehfRUwcNAg
 ITGJBs+AugRBEmfkD+uQnehRzep2mQtbw/E6dpNpxPxJbkVEc9w/YhUZI3AocTiUBsFsG96LjKLMwW
 OD0iXQK9A1tb8zoFq3BOAT7nA1TQxSDhzla2TiMHiMq+xJFALLfYV3b1lfglkBEE+0HjQ85VtOu7zO
 YijnUCkoacdB5kcamrEjjiO9HnB9qo2/Mtxl9zQUUW9oLXz3KlIELy2gHftv+x6F8TjHEy2kyeBPNr
 U+mqOAA4gfLlFAazELGrjUOxvxOKz/cV8PW0aXA+Y18P4FE8bnicT2+JMst5MhbFOxchi85BoyNFl+
 v48sCBVlBDMgfOtjTTkWj55sETlJ6O3irA+fEgMNz8ZcCjkuVsGY7AkCtBR+RXRuHnbMSv/23my9wg
 ntx8TVw3rj9/M6FGnMS3hiY+2iS+rjDTkgoCQCyMpRX7AzlhnJ6Wx6ANVsyTTHxklT7a7cCWP+8l4b
 kYCyhk/fsgJRqti0HRObx9TijfcpaPhHCjLcssxyXmOkLL9r8sqFD60kx+zA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 9D3B44A075E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7922-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,outlook.com:email]

From: KancyJoe <kancy2333@outlook.com>

Implement support for the Silergy SY7758 6-channel High Efficiency LED
Driver used for backlight brightness control in the Ayaneo Pocket S2
dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
---
 drivers/video/backlight/Kconfig  |   8 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/sy7758.c | 311 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 320 insertions(+)

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
index 000000000000..9b2d3bbb4ded
--- /dev/null
+++ b/drivers/video/backlight/sy7758.c
@@ -0,0 +1,311 @@
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
+#define DEFAULT_BRIGHTNESS 1024
+#define MAX_BRIGHTNESS 4080
+#define REG_MAX 0xAE
+
+/* Registers */
+#define REG_BRT_8BIT 0x00
+#define REG_DEV_CTL 0x01
+#define REG_STATUS 0x02
+#define REG_DEV_ID 0x03
+#define REG_DIRECT_CTL 0x04
+#define REG_STATUS2 0x05
+#define REG_BRT_12BIT_L 0x10
+#define REG_BRT_12BIT_H 0x11
+#define REG_LED_ENABLE 0x16
+
+/* OTP memory */
+#define REG_OTP_CFG98 0x98
+#define REG_OTP_CFG9E 0x9E
+#define REG_OTP_CFG0 0xA0
+#define REG_OTP_CFG1 0xA1
+#define REG_OTP_CFG2 0xA2
+#define REG_OTP_CFG3 0xA3
+#define REG_OTP_CFG4 0xA4
+#define REG_OTP_CFG5 0xA5
+#define REG_OTP_CFG6 0xA6
+#define REG_OTP_CFG7 0xA7
+#define REG_OTP_CFG9 0xA9
+#define REG_OTP_CFGA 0xAA
+#define REG_OTP_CFGE 0xAE
+
+/* Fields */
+#define BIT_DEV_CTL_FAST BIT(7)
+#define MSK_DEV_CTL_BRT_MODE GENMASK(2, 1)
+#define BIT_DEV_CTL_BL_CTLB BIT(0)
+
+#define BIT_STATUS_OPEN BIT(7)
+#define BIT_STATUS_SHORT BIT(6)
+#define BIT_STATUS_VREF_OK BIT(5)
+#define BIT_STATUS_VBST_OK BIT(4)
+#define BIT_STATUS_OVP BIT(3)
+#define BIT_STATUS_OCP BIT(2)
+#define BIT_STATUS_TSD BIT(1)
+#define BIT_STATUS_UVLO BIT(0)
+
+#define MSK_DIRECT_CTL_OUT GENMASK(5, 0)
+
+#define BIT_STATUS2_OCP50MS_LATCH BIT(0)
+#define BIT_STATUS2_OCP2 BIT(0)
+
+#define MSK_BRT_12BIT_L GENMASK(7, 0)
+#define MSK_BRT_12BIT_H GENMASK(3, 0)
+#define MSK_LED_ENABLE GENMASK(5, 0)
+
+#define BIT_CFG98_IBST_LIM_2X BIT(7)
+#define BIT_CFG98_A0_FSETB BIT(0)
+
+#define BIT_CFG9E_VBST_RANGE BIT(5)
+#define MSK_CFG9E_HEADROOM_OFFSET GENMASK(3, 0)
+
+#define MSK_CFG0_CURRENT_LOW GENMASK(7, 0)
+
+#define BIT_CFG1_PDET_STDBY BIT(7)
+#define MSK_CFG1_CURRENT_MAX GENMASK(6, 4)
+#define MSK_CFG1_CURRENT_HIGH GENMASK(3, 0)
+
+#define BIT_CFG2_UVLO_EN BIT(5)
+#define BIT_CFG2_UVLO_TH BIT(4)
+#define BIT_CFG2_BL_ON BIT(3)
+#define BIT_CFG2_ISET_EN BIT(2)
+#define BIT_CFG2_BST_ESET_EN BIT(1)
+
+#define MSK_CFG3_SLOPE GENMASK(6, 4)
+#define MSK_CFG3_FILTER GENMASK(3, 2)
+#define MSK_CFG3_PWM_INPUT_HYSTERESIS GENMASK(1, 0)
+#define MSK_CFG4_PWM_TO_I_TH GENMASK(7, 4)
+
+#define BIT_CFG5_PWM_DIRECT BIT(7)
+#define MSK_CFG5_PS_MODE GENMASK(6, 4)
+#define MSK_CFG5_PWM_FREQ GENMASK(3, 0)
+
+#define MSK_CFG6_BST_FREQ GENMASK(7, 6)
+#define MSK_CFG6_VBST GENMASK(5, 0)
+
+#define BIT_CFG7_EN_DRV3 BIT(5)
+#define BIT_CFG7_EN_DRV2 BIT(4)
+#define MSK_CFG7_IBST_LIM GENMASK(1, 0)
+
+#define MSK_CFG9_VBST_MAX GENMASK(7, 5)
+#define BIT_CFG9_JUMP_EN BIT(4)
+#define MSK_CFG9_JUMP_TH GENMASK(3, 2)
+#define MSK_CFG9_JUMP_VOLTAGE GENMASK(1, 0)
+
+#define BIT_CFGA_SSCLK_EN BIT(7)
+#define BIT_CFGA_ADAPTIVE BIT(3)
+#define MSK_CFGA_DRIVER_HEADROOM GENMASK(2, 0)
+#define MSK_CFGE_STEP_UP GENMASK(7, 6)
+#define MSK_CFGE_STEP_DN GENMASK(5, 4)
+#define MSK_CFGE_LED_FAULT_TH GENMASK(3, 2)
+#define MSK_CFGE_LED_COMP_HYST GENMASK(1, 0)
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
+	usleep_range(100, 200);
+
+	/* Get enable GPIO and set to high */
+	sydev->gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(sydev->gpio))
+		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
+				     "failed to get enable GPIO\n");
+
+	/* Let some time for HW to settle */
+	usleep_range(10000, 11000);
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
+MODULE_LICENSE("GPL");

-- 
2.34.1


