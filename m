Return-Path: <linux-leds+bounces-5010-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F9AFCE74
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jul 2025 17:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BD67561DDB
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jul 2025 15:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3025A2E0B7A;
	Tue,  8 Jul 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="Hu+h6bqE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D6211A28
	for <linux-leds@vger.kernel.org>; Tue,  8 Jul 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986822; cv=none; b=ABYIjApdmP5EPwYqjBxUNWi50ijbSzR9DCguO2gP26xbQaOUY2FlVJ+vn64XUQy6VpeylGWsRJmIs6ZLmOVm5rt4woGSDQq3tlcnpYrxNJmJHpjGPcV1M9IFdouRyeLi+s3fX/698YVdhcCYy2ZKZ7HIAeGm+/YW8pG0wnfUQFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986822; c=relaxed/simple;
	bh=TcNVKg1uWK5gvw7ouEDNUpzejUpmhf7qeqTdsGGsOR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szNdVy/cW53OX3ytzEov3d27gZLpgG0uCkVO32/95/Sx9DJf/F1mDB7SdVO9VpLqNqtSptyU9Lsxg1IFkmIjxsUkYlCes82Eb0PLaMpvbxODk/E1ecHq6GLG/8m/N8hJoV7U0Z4rGQrcA/iwKZafAGXf5nA+zYsQIlSsCFUia10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=Hu+h6bqE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso38737445e9.2
        for <linux-leds@vger.kernel.org>; Tue, 08 Jul 2025 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751986817; x=1752591617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+bfOYiAAZEmOkKJUcdq4zkMimVeCuvfF0enwIJA4MM=;
        b=Hu+h6bqEWHW3YFlrzhRQTB/DmqRXLza20UHRSwyU1oi7oqqINXvsOKZQKxvDxFoms5
         FCCfVszmonkumcb19FpvJa0SSnWXGPjKlmNHX3WNZDs6iW23v/sWbnqdYBBHq8LrG7HL
         FUZ02YjzzxWmdVunnWGWDU07rLsMhaiBwAX/QLbNPIXQ8XO1HJTiVdMb5Pk+ckbhxuaO
         8pkPlgaw+A88j7NRTGbWbQiFwXZPJh4XbbpKUqqcyZIbT5jd03meTbMa1RicBOUMVI30
         SVfUs5+qZyrTJlNlA2D6HScqJNV6afWGUTBAD1lU6RiG9XZD5Q1yfBCNQd0CR7fyzXlt
         922g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986817; x=1752591617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+bfOYiAAZEmOkKJUcdq4zkMimVeCuvfF0enwIJA4MM=;
        b=HDwNrcskhOF9Ei+ZcfmMwU+9VLuN+AF7jYno295VmW3tuMitv6ojvP06hshr9vNI0j
         WaSmqdeycSXIA5bh8IbbslG5SsJTbRd/a5J7K+RWL1gwav6Nfu+YXCd7nAYH+FbZDOjR
         S7Z4sY0XzD3LoRe0TeWHKyK832qOhd6ajTBYZMuZLTaw6RABy0K0w/0k0ZULT/OuocnP
         Ak7lMa36+r1Gu1SayQA0dr3ZJ5wJlmnvrriiw9pLkMaOg4btjoiMAZvT8AQwPXP6jxWZ
         EVoNKETSmLszvVZP99wsfaP8jFVT0MNZNWptyS89iVLYPiw/KOTsu8isM7MT9g/tKH8t
         raRA==
X-Gm-Message-State: AOJu0YxaQdfRhSEz3ifL9c0KPwbpwV5KxDfNGda021vZKmO+7HLswd9a
	+GwsPdxFD1SBYjpPlOXDTqfjyoRUmlbCPtpYddqqOhjFFDLibuOh8sJxVXXJ4ICgnNjUEwzJjxN
	TH6wk6Rk=
X-Gm-Gg: ASbGncsJAxm05i1+W+vywvvK34MwLORzHKwH8stkKqZerTzkjtPPwVV74aYW0HcM03w
	eDNTB32dwoIG784DTUYveHWdzkM8+fVuHgyVhZlqYD3FD5f+ZQjRJ5FCOQ+/faGekI36YeFRoM4
	6QL6VxfetaWS0xs/PdD6sSA6jES5ipsGhiHsDvUQeLDNksS0je2nwmXgQlMrSOIFad2aHEXDSX+
	IML5ttuOvBzbSCjid8OMJIXuamxM12+rzN1Xm/OJmzDn2L1O8BU8kZhzsTZ1AqtuPGG2HMLzd1O
	U6nXW4T1OlXhCMPJTbBWk4DfPPUF/+Z9u/0GC1v534fZ7cY4R0juV1YhYY2AUqJEdwMuAuhZe2v
	n678=
X-Google-Smtp-Source: AGHT+IEI+a6mSfBqIeYw8GeeQrtXv67hwYKl3tgQqC9zKHmZfV3vVZnOkmbHKxPCRBOiFxCrGo5Zmg==
X-Received: by 2002:a05:600c:3f1a:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-454b4ec2132mr180590745e9.30.1751986816769;
        Tue, 08 Jul 2025 08:00:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:f9da:8274:e1d1:97ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030b4f6sm13517433f8f.10.2025.07.08.08.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:00:16 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 08 Jul 2025 15:59:45 +0100
Subject: [PATCH v3 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-leds-is31fl3236a-v3-1-d68979b042dd@thegoodpenguin.co.uk>
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
In-Reply-To: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751986814; l=4945;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=TcNVKg1uWK5gvw7ouEDNUpzejUpmhf7qeqTdsGGsOR0=;
 b=dOiTmPFnkgkqhSdkpVMyWBhm7R30MnKMKWOWtMYFID40JbkNkWpubXkjPrzaHpRN/GtcL+Seb
 ZZRzNTwLDiuCQ6ugi2DJx3tuZv9fEXJDxX0iZcfnUjgOuuFwisvqzhJ
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
index 8793330dd4142f49f15d6ee9d87468c08509859f..c8e27c219177e8e7a17738fbd3bba84340d9776f 100644
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


