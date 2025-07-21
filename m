Return-Path: <linux-leds+bounces-5101-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED074B0C1F3
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 12:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1361F1882047
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A2029E0E3;
	Mon, 21 Jul 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="LWqUugeQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A35299A9A
	for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095344; cv=none; b=BfvbYQ1ctNM3A2oMSY4Tuj+Tix5VuC9gbvU07uzJoAu/8rPKTLpiPKvrT+ZQr9Q4LKSr5jyn5mYlAQHS20MV/RjogdBMWedU2UoApUjh0Is5b2SWKeb2G20Ze53wBktCu/Ov9z4snhBlMMFcbhVBDHeErtb8SiJnwXrReyv2DZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095344; c=relaxed/simple;
	bh=NuZrXXQ5tlfhJZ6G10mYOT34Gf1XyPJpaO9Kpu9cCUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7ABsSei93DD03VSuYcTvU+db/CgpzL2ooqoUJ2nGYPY+/WTBXkO5cEGxHgsUM0q3yl/B5ew9WAyplXf7MKzjQ22+XqV+gZS4BAEQA/uG5kZv/K8iOSbaXDO3MNDxy4cmGXF0jwJ9TBhDk3lodmJJhLDYHeSmVaCWdCg9KSN0jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=LWqUugeQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d3f72391so42248205e9.3
        for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753095340; x=1753700140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUbJHYYUJ4dPHD8beah1zUaqGMO0MQts8CvEiFdKGdo=;
        b=LWqUugeQ5RkIRGygqMiwrtg2DBwyxkLNypEd8Jp58VF+eBw1NtgXez0YvtIW8Dgj2j
         vDJnjcicFrU/BOEIsWp8/esF+BToBCyzVWaiIWnFdqYZ3tx00UHWNmsREpuiXCeVcU29
         EcGaoKzkZxcmk2FjECbebemVGu5Ylepk7dQI6fB2Rb+NcqQXzPVPLY2jYlu7LahcHN5z
         nflrZ146wa1caHs0YBpzm+JAijNtMahFIcL64NXklt0o0gi9ukP1UzxEBuqmk7+oKSAA
         HMNsYTXMynr+AeDDU/ZxidMDwh76n3xr8sTMy6aFoup3bhAHNHYpUzfGYzLXr6/XbirN
         Zp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095340; x=1753700140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUbJHYYUJ4dPHD8beah1zUaqGMO0MQts8CvEiFdKGdo=;
        b=PzywPduQRP9R3po/svXtgwgxLhoYJ90S1H5U6n9+M0RMOP2vrXgjhqfCP5hGq50ub/
         2sS2CBRCplkDLE3ifSFgf0oCFQn0XbwopUQm74oLsPk/NjZeo/8ZXvvqa39RB9VWfZEu
         +EBhTJ7el4qEVX31gPDeA4a1dDv3/u9QeJdptib2EGV/ebymb5ctUV9YKahYFxt2Tyf6
         PUTDaui3sJPXsJk77dSllD8mXzeEF+SB+wLLxYVwf1D557vwLz33k03/kprcvf/cIKgb
         vfKQt3BSB4qfcvzv0CA14sMypwyehzGXVc10C0xkrNUH6OZElKqdZweGrw8y1XrlMhfY
         DPEw==
X-Gm-Message-State: AOJu0YzHYkSqvRN4PqgrMWNPq9fqqLVl2lbu3zyTk4Npy7N+UorEsQRp
	YRWvpQ3XGU3ZheFAkMnBo6PrvOZwP+Os3cnfro2WmV025nfqBGCCE3taoGmCWqcZBsg=
X-Gm-Gg: ASbGncvwvDGglTmq1LsagctkqJhb4/ttJn3j6ZWGRCMslK1ssv5qO+ZzIzpXKu8ipdU
	b1ykF6tzAsbk5yxy/YjB3tFQqOJnfh9Qu4a+aYuSO/o0DHFeK2gibU2RHCoJfSkJMseRAf6kGwI
	0eN8LX9kpPlWbYMb+qhij6t90xLAcmo3m2UCvmeHxS1wE6WYx2n/3+PQpHFwSufTgYqoLUyhYnJ
	7+18ggkUDfCgtpIN6SWdIf9Jdyx4pc03I/KMjw47kHpNn5coXu+V46LFPFCT/eP6VplnQmwVCAg
	U7gwWW0WMd3zC7e60ZhzccDo2WbeJ5MbTfnEeIJUpO1H0ncS4cE1rsmaNYmZKitVqTW8agZtYUS
	IxTt4gm0+Ym1k0Yi81rQ/Q2YotOJ2QU58ySxuERs=
X-Google-Smtp-Source: AGHT+IF1lmSOzgL4wDUJq39mEQD7x5P6qMzn1mwA8CQY8we75CiW8GMTh1i/iH0wgp7RlTwS3s3l4g==
X-Received: by 2002:a05:600c:4fc5:b0:456:1156:e5f5 with SMTP id 5b1f17b1804b1-456359ee0a4mr154457615e9.31.1753095340104;
        Mon, 21 Jul 2025 03:55:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:f373:f0d1:903c:a9bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4566dd6b8bfsm18141065e9.35.2025.07.21.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:55:39 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 21 Jul 2025 11:55:36 +0100
Subject: [PATCH v5 3/3] leds/leds-is31fl32xx: add support for is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-leds-is31fl3236a-v5-3-264e841f4da9@thegoodpenguin.co.uk>
References: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
In-Reply-To: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753095336; l=5531;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=NuZrXXQ5tlfhJZ6G10mYOT34Gf1XyPJpaO9Kpu9cCUo=;
 b=8m1UXArXyLCiGvkxeYE/a0sz6nuFLtKPTmQuTeEfmsFp7iYUi4rpc6ijCcpK9xskZ4FbActwI
 U0fVdXhuxalAnrqa8oDklbiWyBsEPSNzBsXMAcnUP9RZu7ytZ8wbpev
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

Add an additional and optional control register for setting
the output PWM frequency to 22kHz. The default is 3kHz and
this option puts the operational frequency outside of the
audible range.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/leds/leds-is31fl32xx.c | 47 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 8793330dd4142f49f15d6ee9d87468c08509859f..5ec1ca71f326378e3a714a886260b86002feffa9 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -32,6 +32,8 @@
 #define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
 #define IS31FL3216_CONFIG_SSD_DISABLE 0
 
+#define IS31FL32XX_PWM_FREQUENCY_22kHz  0x01
+
 struct is31fl32xx_priv;
 struct is31fl32xx_led_data {
 	struct led_classdev cdev;
@@ -53,6 +55,7 @@ struct is31fl32xx_priv {
  * @pwm_update_reg      : address of PWM Update register
  * @global_control_reg  : address of Global Control register (optional)
  * @reset_reg           : address of Reset register (optional)
+ * @output_frequency_setting_reg: address of output frequency register (optional)
  * @pwm_register_base   : address of first PWM register
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
@@ -76,6 +79,7 @@ struct is31fl32xx_chipdef {
 	u8	pwm_update_reg;
 	u8	global_control_reg;
 	u8	reset_reg;
+	u8	output_frequency_setting_reg;
 	u8	pwm_register_base;
 	bool	pwm_registers_reversed;
 	u8	led_control_register_base;
@@ -90,6 +94,19 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_update_reg				= 0x25,
 	.global_control_reg			= 0x4a,
 	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x26,
+	.enable_bits_per_led_control_register	= 1,
+};
+
+static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
+	.channels				= 36,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= 0x4b,
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
@@ -101,6 +118,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
 	.pwm_update_reg				= 0x25,
 	.global_control_reg			= 0x4a,
 	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
 	.pwm_register_base			= 0x05,
 	.led_control_register_base		= 0x2a,
 	.enable_bits_per_led_control_register	= 1,
@@ -112,6 +130,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
 	.pwm_update_reg				= 0x16,
 	.global_control_reg			= IS31FL32XX_REG_NONE,
 	.reset_reg				= 0x17,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x13,
 	.enable_bits_per_led_control_register	= 6,
@@ -126,6 +145,7 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
 	.pwm_update_reg				= 0xB0,
 	.global_control_reg			= IS31FL32XX_REG_NONE,
 	.reset_reg				= IS31FL32XX_REG_NONE,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
 	.pwm_register_base			= 0x10,
 	.pwm_registers_reversed			= true,
 	.led_control_register_base		= 0x01,
@@ -363,8 +383,21 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
+	    of_property_read_bool(dev_of_node(dev), "issi,22kHz-pwm")) {
+
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+				       IS31FL32XX_PWM_FREQUENCY_22kHz);
+
+		if (ret) {
+			dev_err(dev, "Failed to write output PWM frequency register\n");
+			return ret;
+		}
+	}
+
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		struct led_init_data init_data = {};
 		struct is31fl32xx_led_data *led_data =
@@ -404,12 +437,13 @@ static int is31fl32xx_parse_dt(struct device *dev,
 }
 
 static const struct of_device_id of_is31fl32xx_match[] = {
-	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
-	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
-	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
-	{ .compatible = "si-en,sn3218",    .data = &is31fl3218_cdef, },
-	{ .compatible = "issi,is31fl3216", .data = &is31fl3216_cdef, },
-	{ .compatible = "si-en,sn3216",    .data = &is31fl3216_cdef, },
+	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
+	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
+	{ .compatible = "issi,is31fl3235",  .data = &is31fl3235_cdef, },
+	{ .compatible = "issi,is31fl3218",  .data = &is31fl3218_cdef, },
+	{ .compatible = "si-en,sn3218",     .data = &is31fl3218_cdef, },
+	{ .compatible = "issi,is31fl3216",  .data = &is31fl3216_cdef, },
+	{ .compatible = "si-en,sn3216",     .data = &is31fl3216_cdef, },
 	{},
 };
 
@@ -466,6 +500,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
 	{ "is31fl3236" },
+	{ "is31fl3236a" },
 	{ "is31fl3235" },
 	{ "is31fl3218" },
 	{ "sn3218" },

-- 
2.48.1


