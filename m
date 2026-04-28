Return-Path: <linux-leds+bounces-7885-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ2iBA7D8GloYQEAu9opvQ
	(envelope-from <linux-leds+bounces-7885-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 16:24:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E175486DE1
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 16:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B701319D8CA
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D86343DA23;
	Tue, 28 Apr 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM4EeCrT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6F43CEC8
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384760; cv=none; b=qt7EXZ0DA3bL5rRc5QLTxLSBa5jSWrEfCQ9JnTLSwCC8K+rKMGLdWzuuTdDLg9+idzxj7jeh/68ORBNVjgoti96Noxjh1ZWr7JSe9EqPk8J54OBqyFg6aAr1iCWzB0pdJhyntU/ILmscX1FiLwSPAb/znFvxSX8vwZxzclFDJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384760; c=relaxed/simple;
	bh=KpHc4VUnEH8yC2HEUnCrC546BMHSJ+FMabQtH7NyOYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usXncHcP1D/7XH5452mDwFwjdMrNLZB6mwteE/nzWZkfQn/5ebOaoQ4esxoknTxZ9X3KIxOw1aFg/cIuJeFo86LM4S5JNOTpLVYffEUow6+iqyXTlUPH2zbV6QoAEWvWR4n9rG/n2dMNa3K1b+u6Om5aqVGsQYI2HmUCkBxJuN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM4EeCrT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso86459885e9.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777384756; x=1777989556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKZ7iAWIrTA/bQhSyAbJFi9RrHxwT2445JQxA+ahvBs=;
        b=VM4EeCrT2YtnOCSRBVGGdyVL8zNPAzZnKFiAbgjcsLSeP1SbGLJOFHRf6BGUGn5AqV
         yUONrqSX8lzKNa/6ZnEh+Teb+K498s6lcLPTiCfUiN94u0z4RZzwCoj/JNiTmmqhzrjV
         SyurCk/561TN1hTUh5MTCsCAs54ZUDhXlR7R0G+f4WgDyHz/SKN1Y82E2oQflPtLc2VT
         GX86O5uynA2VUtAKjl6I00xDlZu4DWd5ztDF0P099nr68KJhtz8Pnyt2AWK/payHFgA4
         iJc4UO8cn4WO9dyT0JKCVnzwQIJiiIfo/KGCf8Pr1XaMoBIvHCXbWr0Y7a5oRNC+Jg3z
         HUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384756; x=1777989556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eKZ7iAWIrTA/bQhSyAbJFi9RrHxwT2445JQxA+ahvBs=;
        b=ioL+2RtgHMbVJLCYD9ac63ITXzi329Q1QTkkc1rwEKl2etxHncq3IOi6N5ioonZZ1Q
         ejRPAyil4mbqqX24YB42vNPtclQYcVcblAA5z23vlW/DUVwOVwTjfypul4+AnicjKlao
         8DDSynCzQJ6iXKf5OUDoA9hpT77un4LKGMwfPABAdRj8z8+SaFFcMINbkieGjjfabAzS
         cS8H9VLGlplZWCyUCrWz6OPtZgkyaCLeXojCmdohDBS3Ng3ze1Kp32HabeWWi2LRv64e
         SiUpxJqittCL8bYsZSUG/f35VuQYrdGHqVP4IXXtcJEm+YBL6nBTL9am0huXccFgyuRY
         0rRg==
X-Forwarded-Encrypted: i=1; AFNElJ+QSL0GkA4Too/TVqhSSpch7vJOlIAmtAY4HOF1SW6AhdkI89XJc4su9fOy+rjkJQZBEu0eKD4p+Bst@vger.kernel.org
X-Gm-Message-State: AOJu0YzP8heObNhgTshj3Uoyl9l/YMkxOQYIhWS3a7Irj5U/tdmdhdoN
	kb2tnZQrJJvQLbajJAEVxg+DzNr8GZr878M2wKmcrAEdWP+LbFqw7ESW8p3C0lA3UK0=
X-Gm-Gg: AeBDiet8l3PaV/Mb86ULmBciJm06TvFm/tGpB5mpQka7gqEjRmHAOOBM4HyldF07kG0
	HO0hwlDVtkapySCqWnjF4SbJcfpvkg1wt3pq4h8VUKmhJGIyRR3sUZuOIFfS0dOadSH5/PIaKCg
	PKgNWw3k081xDoW0kQ4O5Kg5vjqoTspIdEau7gc0GHl17o3+wEVc++/I7yCUTVDD0+IUM5CZCp4
	jVNW0dM8b6JI1TuZ1BwxSOXO+sMAvBqVGdpVxEsBALs0RD56V8Q+BczsryUXPR/fLMARxKwPKAM
	MyE/tA2C0Eslq4jjAqJhPuNWHR+4EyHc+GrwtHg3ZWPrKpW1KBnZl55GEvGYD5JClBHme/iUWEG
	ISytHDUTpxONWGYIjWxPrI4cYTXzRXh072U56yEXyxuREHpQFmIozHu3yfUarZafOTw5FMjQkW8
	0LiWW3sACMZDw5nJaAVrDjfYteg5YSnDn/zLW5R7kkobw4b2eLeLLTypY=
X-Received: by 2002:a05:600d:8402:b0:489:149a:f9e7 with SMTP id 5b1f17b1804b1-48a77b25340mr41771075e9.27.1777384756154;
        Tue, 28 Apr 2026 06:59:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773efe04sm60811155e9.12.2026.04.28.06.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:59:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 15:59:12 +0200
Subject: [PATCH 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-2-0caade5fdb32@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10600;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XwkwUb/gWDWAE9PtQGUU15EurO7ORw1iWyFV0UYaRgM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L0w/OVhYkTAXvHRGaCiz8CW7n4IHJz+kTXaca4S
 ut5XKtSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC9MAAKCRB33NvayMhJ0RNRD/
 4/4h4yOM7I3EarDvjhcxVqPKR9CqLLRXKdDBEN20tTL91KzTiC0rRNlKrObP64R/pyZpLi3g7VO0o5
 Kf0+wXjW+4MxTFIXQbd5KcYMpIwnD88SjwEK0ZLyChCs2+OiwjMhjDMMWfnBDqDO9vpZ/qgaFlhO+G
 1d639USK2QYY/QwVHtxSSekQ9qVqoQCRVS3YtitYwTFyniDuJJ5wWBaCYcDVALLFCwaC4OJVhTw4NX
 F8A+Fy1ul7wigBan35kV5n6f9ZhzCPOsrkuCvB0mT+qZ0kC2N2hknmvVWkgd2RCdk717yVyrDVc30l
 bnUHfdMXcSEXUGw+njC0SeTiT86oUPCHn82siZoISXN+NyoTf5U+m2o9nGRV50Q8yqCzn30MWGMb9c
 pYGTSOLxDPqmnY4ip7fZEHnkgwbD5mKYsgglAT7YEB0KkMcsx5yp/Uo1+1A5FOxlB2mydnJhAfUluk
 aHEqn/6DjIry4TwcZQk9OUzjEgUDhLGLvIlqm6O0zfieSztc1a3oDBKU4sVHt7GShBdAy3XOAcUSXE
 ah47tWO8lYJ3HXhuFay1UvEV37Vs12Ox+Idmx4ouBIcnyEQzsItok/TlmL1+NGyfVmvrOFdmI3xsgc
 CXhxU//mPkKEY6TFizcMWFnHHjfgieS11gCxS/G/KZz5Dm97IhRrw5xqOKyw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 9E175486DE1
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
	TAGGED_FROM(0.00)[bounces-7885-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
index 000000000000..a3e24bd444b6
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
+	usleep_range(100, 200);
+
+	/* try read and check device id */
+	ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
+	if (ret < 0)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "failed to read device id\n");
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


