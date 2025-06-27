Return-Path: <linux-leds+bounces-4899-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066FAEB471
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 12:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD9A1BC2159
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 10:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C68C2C08AF;
	Fri, 27 Jun 2025 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="pNEH7isv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A22BEFF9
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019647; cv=none; b=fklfosF6Iw6kdIY56hMSuz+knOF2Jr6NjKPHaQr86QYleFiRnae6zq5WIsy4TxcYKIQQPKIC13FXQlqaOblee4c1kmYG08TwpZn6TDzZfT51B04xHB9SXmTVu2rQRlxzHrIkrxlkVqeDFgD8iSc/cAteSr5TUlipQjlJXWwHg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019647; c=relaxed/simple;
	bh=jL/YtnZUBwUm3r8kPPjqfuJQkAPEMLB/FpIfnfB7Kmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmCaf50KMmQ06azfpW8ah+mQezx4QpCFGmom4xueevtCmWMppgF8cT+xScjAAkOjb2M2vRqafXck2lo//Cwq+GbL7UWiquXkvHZdYSAoBunRKMkWJ97dmmNmUWSmpuFx/XQ/hqIMPSqrsUCFbfqpZhx0csHNK9m61SYpqmzZWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=pNEH7isv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1494916f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751019643; x=1751624443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEKV6ts9W10Av07F6DCzZ39zrp07uluAsuhY5sBvobY=;
        b=pNEH7isvwcd1DOvkfdNDzV7UGUTl3G+VcFamDRzdnHitMw3XtWyNHo7Ve7MMyCqHdu
         rCxYQmcvHkWDod0ObKiKmM22mskZz8IB8Wz/g6sVe+r2gpyjPVZ0oW73hReHP0vDHblk
         C6L3gKHFJ+qBv4VUV18atyD3ogpwlta78OwNz5wuyR5+rfEA3je+nJ4iFBjvGXYVrw8d
         dLu1zyvzX8kCDbQbkV3UtaSndytJqRlko5xeAk/53LHMQI1AyVn8C9J1naRAu9EVzROF
         KkKrACF0kL9E325axcIDTWI0g5ejjGZr4QPdMyPAjSTBrINU+MQZKHUkZwrisRZaNGFM
         8p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019643; x=1751624443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEKV6ts9W10Av07F6DCzZ39zrp07uluAsuhY5sBvobY=;
        b=s/M7mEF0uYHDCbK8/PRmX1nCd+uLZSEauvd+6tyThKmJ5q8b/AXUHKqlCBFfXpKcUi
         gCKiN7J+EflR/MWsmUl7RgnGmG3F8AXNw373YNHjwXAHHgGroRnED2WWhQC20bnPGYk8
         4xzv8skCBwQuOuZYBlPUOIQ+TB1zifEfa/pkjJcDdoy5ewWEi5q/SLiZixHdE4XS8rmS
         R/qhibuuYVz84iDdn3SNgL0UEnGxhirgRte4mEMZe4KU74AaEWxSh/FujUC38tr1BTpX
         kwjnnCOglMiqIxUflMqeV3E5smW9pDSlhBAj1/0H4bGyLDAS2nAhnLm9Ip3n1dICFMEH
         w3jg==
X-Gm-Message-State: AOJu0YzSJeZkAf+1xQd2kKoAlJtfy0r05pEsedYnLNjAJUCghxJtfYr9
	9DWfz3YR81JB29OjTkAdNwe5l6JZNnTHpKR0wR5OCyMto2b2TrCKaFT+jVscJKKRx1VLBwDvMCr
	IBSJj6pM=
X-Gm-Gg: ASbGncsbsACEIk4vtL/lQ2/x2XvaUQlr4nXshsWytHWN8t7op2tg/6UDPK/cA6NzyUM
	nxXIHLlwk8m0cGAT7uZ3tapuam1GMbrqR/LQCqQkfsMLgOQu3NJduvHo2TcC66Hyy3dHcZytO+4
	6Hs8//1PIMpWEYTEruvOBKAVYFpM32ZJ6JvZ7k9r564cBoTJJJj54pE0uw0tjfqfbDDvWpy1Kg5
	gOpwi/eZLW5FIs+cuAXL+eeyBLpI2k0+wqZrxSJrCR6J/UU0DIR0oFohRyjdW5xKJMefscr8bw1
	1RN7+KEZ0pak/PIq1F5hW2TUGOc+SMCOX4ldO9z+clGjlYH7rcnhJrZQe9kyPWQrne/1RXBZkqB
	ptek=
X-Google-Smtp-Source: AGHT+IEaRWI6eEtESOZAX60HsBb4MY4ild3QZPxReHjEFDua8kGED/GJs0e6NClhbG8tzglFyqEpWQ==
X-Received: by 2002:a05:6000:2704:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a8f454905amr2335863f8f.1.1751019642944;
        Fri, 27 Jun 2025 03:20:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:1a4a:198c:c191:f3d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm2331700f8f.12.2025.06.27.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:20:42 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 27 Jun 2025 11:20:35 +0100
Subject: [PATCH v2 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-leds-is31fl3236a-v2-1-f6ef7495ce65@thegoodpenguin.co.uk>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
In-Reply-To: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751019641; l=4935;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=jL/YtnZUBwUm3r8kPPjqfuJQkAPEMLB/FpIfnfB7Kmo=;
 b=7CGhMlMkL1Y/uOXcbcJl3otoIY5jEsO0VoijKJBMZRvJFnX5tq3r0nHhGm4US407AHQrbwuMo
 4I5VzxJE9nVAzckCT4mbVPpW4Iu/D9TTavAwosLQ9GpnbUpB5gx+q37
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

Add an additional and optional control register for setting
the output PWM frequency to 22kHz. The default is 3kHz and
this option puts the operational frequency outside of the
audible range.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/leds/leds-is31fl32xx.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 8793330dd4142f49f15d6ee9d87468c08509859f..b3f25854f97eac0f87c5be762b1d8e3afaaecc21 100644
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
+	of_property_read_bool(dev_of_node(dev), "issi,22kHz-pwm")) {
+
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+					IS31FL32XX_PWM_FREQUENCY_22kHz);
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
@@ -405,6 +438,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 
 static const struct of_device_id of_is31fl32xx_match[] = {
 	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
+	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
 	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
 	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
 	{ .compatible = "si-en,sn3218",    .data = &is31fl3218_cdef, },
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


