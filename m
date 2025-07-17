Return-Path: <linux-leds+bounces-5087-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9749AB0901F
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 17:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D251C440C1
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE90E2F94A0;
	Thu, 17 Jul 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="QlKMtmVd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789E2F7D04
	for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764542; cv=none; b=OdhnM65oxzE2Y+qupArSe4AAz3FG054r22wfs1xvJ9FC7DnFKtn6AOJphY9iO8tJ4RWwO5+6FKdi2gfNhBpJc7nHL4uM5T3RStSeCELk4hRGoK9e46Xfn5mzbJWQHthBX/wWghGDSOUbOC3oIpCI3g1GgurxAQuXrP+9v3rTkMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764542; c=relaxed/simple;
	bh=NuZrXXQ5tlfhJZ6G10mYOT34Gf1XyPJpaO9Kpu9cCUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HphjEbwMfCxTAh4mQ+9bENW+8ZzHB8FBHPVaCzJVifQNcOT6Jznu/QeOrzITXWMMKntxa6Py0YwHKdSZMeIytAmyCo2z2+ooZHyYHD+ikq5HVZpgpS2EzdKSlAIJQVuV9UFgoTruIbkk4ltJrvDeiv5lt0lSPOugdVW+aaUbXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=QlKMtmVd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54700a46eso664717f8f.1
        for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752764538; x=1753369338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUbJHYYUJ4dPHD8beah1zUaqGMO0MQts8CvEiFdKGdo=;
        b=QlKMtmVdzIZpKNmfuL919rglY2RbPsVbqTVDJ4RDWZViFRTPy3/dO85osapiLPytIU
         jGV0wDrt9ChlkYAkY+9kVcKml5pa4r6VlXeS8hFAePhU/rWTxfDY9eXhXz9fQ+S9B4kg
         z+pzrj089zz21it1IUkM0TEKvpW/DXWTBt1XRfDsftu/YT/1s1sQBMnsYEB/eFZd0NUE
         WlAtyFTQYxl2WmbMRrF5A5mlfas70kdDCB4IkHZeAq9E5r9vu/zG5LQ0+NvKbz63G0tW
         McD+L7coOvYe2mJSoL1XBpDtBRmtQ4rY9bWs+n4tdNwyoDj9YCsS2R0ni9uDKg5BXwmd
         LfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764538; x=1753369338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUbJHYYUJ4dPHD8beah1zUaqGMO0MQts8CvEiFdKGdo=;
        b=soyyEdv/OZa4tgooG6Y8isZ0oXtk+IabXgc93SelRy8EZk1RFNyM5l57ISLh+d568G
         zhjbNWvZEkGnoZrYI0yP00Txud5nPUeX222z8Q8ODnZISlhJGQJvHzAW0R7XNyn1D3ru
         Dt/hqYYfNAVYiGiV766/KkGpgevjnHXE6pMBULTG/KGzwzQ6i5fcQrZBi9NItt78pPRR
         8E4No0xujgHa4UFe888VFXhuQy6KARCLnFFYXlHJEr9FxoG0AgJc64l5sZzDpAjsPiWz
         80xi3MbAj1jylYx2gvXnGngCcCZuG60i/6Cmk7Nfg/WVmwsPEV2lX5HoNgWq38dwg09j
         4zbg==
X-Gm-Message-State: AOJu0Yy+6XZGa1QLQJlV/UyoCp0DhfdZSjsgCVWkSFSXvNtbqjqZG1Zh
	GxGYI0+zl81HnyNlup05k4kuLmLCdwziQxxG9a115f4bcsc9YuKBBo2hNtJfyx0XNfQ=
X-Gm-Gg: ASbGncvaS2j3mIfKNdXk8fxqaRLXrn0vlpnDdZle4McOvzbV71Xb5CNrnCwY0y63QJ/
	tArkY0a7PC5C/bX8gQqG2bECjarezAJw2OZcbRUFaYnop1fhBMiDV4NkSFdfToxzqpN0g+80KWW
	V3HSd3WTRrmRhsgGykYB2vxx/fpYflxwdOFtpkk+DaEtMjYvAeNRHHLSODuW1myQOBzonZmQtnT
	EyJMsmU8nBo1XNpnWes8x1baCmXooev9JMqcK2DUC6YyTl1TJoQrqjGvUgroc7A4lcuX5m88mLf
	QnKYsjjv7qp8bvUPqzQCiEfgqSRSNCDz7Fv2xZGMyvNGwFvHE3Qzy/MTE6XiClUdsDDm0mGDFlh
	Y1aHU432jgyNEyeOnVBehF/RBHFU46aRCUE25T4U=
X-Google-Smtp-Source: AGHT+IHkEGHGxu7VXqSi5lmH6fVl3oHkkA/hBP0zA2Ax85fviyQHeC51lkDdCJT5F7Y71CT+stzgbA==
X-Received: by 2002:a05:6000:2313:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3b613eab435mr2714201f8f.56.1752764537498;
        Thu, 17 Jul 2025 08:02:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:ebc8:7ccb:ef04:4f83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f5cb9bsm25321885e9.10.2025.07.17.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:02:17 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 17 Jul 2025 16:02:09 +0100
Subject: [PATCH v4 3/3] leds/leds-is31fl32xx: add support for is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-leds-is31fl3236a-v4-3-72ef946bfbc8@thegoodpenguin.co.uk>
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
In-Reply-To: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764533; l=5531;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=NuZrXXQ5tlfhJZ6G10mYOT34Gf1XyPJpaO9Kpu9cCUo=;
 b=a43lCfh+jM2LbjJFu88mbDfM8oMsA7XzFg2vx05SkvN9mAvFADOevL4QiHAyqby1wYG1AfaqC
 zRWSys/0wBaBhffIB5XBNZmvopWV2ukPwlKaUKmd8lBTEwPTs6Zh2Xi
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


