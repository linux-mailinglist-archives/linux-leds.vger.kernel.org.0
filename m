Return-Path: <linux-leds+bounces-5112-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A4FB0EF24
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 12:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10E8E3BD81A
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 10:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F7A28C85A;
	Wed, 23 Jul 2025 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="WKs3JYUQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D028C02D
	for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2025 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264940; cv=none; b=AKA1zjpeZSXzBYOd5iYXyoWdLmM7JErFvt5EjRP32d+uzpa5OjqyjM37B5I0obPT9Y2tLVVvIVSdwCaNzCeQewa465KQcQVWFu7PBNeFNL4oHKM1UMAFdCuewAchMInrgqjgIgl7QTDd/MCCJbIDelz5zTBcSPBmQ3RjeFX55oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264940; c=relaxed/simple;
	bh=X4RB/EqdDISFFUSuCWVjDZVIt5Na2IXaogngEJR9LaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiwUSnU2PbjhW10sVdGmcbFLMQtNCie2trpth6wBJnXil8PT0D7d9+WaMOMJDPKnXKojGxEBzGq8OzOvJl03UCyu0+wnpo7bXxxrqlA6I2FDQTv2o/E/IZoGZL5oVOpDnW8AhPUWGMUYtG9Yewq2I5+ujVmU4VZMRb4ZyYb47MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=WKs3JYUQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so44295775e9.0
        for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2025 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753264936; x=1753869736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZfYdzfHt38wkKRTaEHNUDVSiTE/Ug90q+HPqIdL9i0=;
        b=WKs3JYUQV4ChxOE7nGpmCJcZqogMPDbRP3ax3lYp0QYIykuZc/8KLC6LwAeaMsgu3K
         7UnSjIHquQ7BH1AtJyLmlBI72UDdE0t0kBlHmJ8kZ8B7gXFHjxeyYna1Jj9tzs29nRyt
         RiO6MRtmpxY/c0pcHh55miIFHeNwqpGT1mNrI7CeMes5gNS7DWpjwNFtXjLRydq6toV8
         b88C6EBBT5JIbFaSjdXkah+TLmvlPs24ANOuYk4S/+T9w16MUszwTjTkgeWqFK5bbAGZ
         RbY2X+/5QMf2Sex6o4rHGuNbZe5ee7ObYlXKPgYQd+rwgDEZYhmGOqEWTT91X8uG6FaY
         cZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264936; x=1753869736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZfYdzfHt38wkKRTaEHNUDVSiTE/Ug90q+HPqIdL9i0=;
        b=dCLiekx+xEwOV0ii7TD8SJS0Fp2MewGsyMbXwSf5pt/SYb/366kx6DpXDWc/deRIj6
         evZS1TjwdjBirXDMVYxxKVQmQ9ZzyDTcUbSjrNEB8tmpHdPzAEHQ/EeztB2Z+fylatcp
         nl5WU7lGQgawb2ASgZrMUPGg/E2mFLa7fe34m6MrRAJSBV4peuFEHEO/r9smW1oZRJ8t
         XefCeC5ARqpDKTOsqrn8jlbTqTT2yy7caCH8WTZsuZvcQCRw8dkYWwEYEWvdGgAjKqVP
         0h8cspkGl4LNV0cR9xC1da8a+993ROT7tUia19vDG3M7PhxhpxgeQBeDnYWtdQuchv/8
         siSQ==
X-Gm-Message-State: AOJu0YwHZW0L3j+84k5yKshRxlEX5r40+A74vsELMeedty+2jGJm9bsb
	kAWZPUyD8Hp6CScr3s3Dt8abFmjb6gEHYk7wsxG0U0J98erysDNMeLxeM5fYcEKcjAQ=
X-Gm-Gg: ASbGncvwovKHAgZWbolSeVOwLiDVBx4hRkkd36xN9pcmqohf5aOxN3v4O8QAWtSI1Ht
	bwYApYSF8UlOsEB00MVtKUu/mLPnkhFRue8lr2LUexvs+C88c+wdTaTe347pMd8JZ/dXZZxAeiA
	Jcfgkt6qV/D3Bz61vPHSCNGFnfw5mfZeBEGds6BRS4k1scc3nTv4Rbj3b9/ApojEp8BUEb62PVz
	qSESk17X3KFjBruUn+eYFAuOGZD1q1nKgEhqrWZ14Zz7gOvmyyotWt679V3iZcDIIFsD9duVadr
	zeDu/hdrox89HlxoZwtE7HJia+6mvA3XfAvVAuXO1wvnXxJWsTuQl2jObCOyXuUOGLsnxZtKYyF
	cRT3+vsqoNZqHhR7u5xjlyQJZEalu3YVxFrvV0A==
X-Google-Smtp-Source: AGHT+IFG00Ka7dTTXqD5R72xnTJ1FgjEk2W34dnzJ7eV8qjczJLkCd3qHfafX0BnqVEz8vMVuYSrkQ==
X-Received: by 2002:a05:600c:3107:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45868d2c693mr14672425e9.22.1753264936189;
        Wed, 23 Jul 2025 03:02:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:6066:6737:c27:90a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca31394sm15930793f8f.37.2025.07.23.03.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:02:15 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 23 Jul 2025 11:02:08 +0100
Subject: [PATCH v6 3/3] leds/leds-is31fl32xx: add support for is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-leds-is31fl3236a-v6-3-210328058625@thegoodpenguin.co.uk>
References: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
In-Reply-To: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753264931; l=5531;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=X4RB/EqdDISFFUSuCWVjDZVIt5Na2IXaogngEJR9LaM=;
 b=osBH6/HI1wRntHwW6t4fGMXMNUBccGGwzkGcNtaDNJfFf58F5Tw3iubILCajoCGDhA22rbET0
 jR56yYMXa2YAKOPZhhknm9UZGdILft2L6szjIDoHWDW/1PtEGedF56T
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
index 8793330dd4142f49f15d6ee9d87468c08509859f..dc9349f9d3501b179af493e0c877ec7b27a78157 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -32,6 +32,8 @@
 #define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
 #define IS31FL3216_CONFIG_SSD_DISABLE 0
 
+#define IS31FL32XX_PWM_FREQUENCY_22KHZ  0x01
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
+	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
+
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
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


