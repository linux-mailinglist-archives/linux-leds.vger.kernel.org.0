Return-Path: <linux-leds+bounces-4857-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F2AE089E
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 16:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FFF716D899
	for <lists+linux-leds@lfdr.de>; Thu, 19 Jun 2025 14:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7DA21A43D;
	Thu, 19 Jun 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="dD+R+TME"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6B1AF0B5
	for <linux-leds@vger.kernel.org>; Thu, 19 Jun 2025 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342970; cv=none; b=Q0PPfAby1UACTZUVd9WeFmutVmldSlnu+v6JwgvgDynOar6gpRF2XHSeWoGM/dLwZcZXUIW2dfHTCWxPrAVM/beSPuhE76n/W2EwkWvmFxChS2P5w7hHN95epWB+VYl5idWge9vtUkcylPqlanhgpENtYDnpVrdEzixM3AJgPxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342970; c=relaxed/simple;
	bh=xxOseSEAmMj2m75IwrSvC2dTIWn8YCFypU5YZJCu0YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+rwAci9eXL0vsk/u8uWJ58smZ/0YV9nONI3+9RIahEdQGdgnnN7MvbUW6+dXZEXc/fRkyRnqvhqOEUFxGjUq1+UNgr/sbmXwOZeEPhsU+HAMU7gqjKCya47oPzv/jNEE7654+SJmNqgwwbDHf9WR98uj8QlHw+bip60tp8nYEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=dD+R+TME; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235f9ea8d08so7615685ad.1
        for <linux-leds@vger.kernel.org>; Thu, 19 Jun 2025 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1750342967; x=1750947767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLJwLGd0qPyFTtxZ6LI9ukhQE3/Rm0fiyJO6Oqqj0rw=;
        b=dD+R+TME75OAuqlVDCzB+Xf74YopfbJA4XRL3kK5hEDxitTM+LVjv45i4hlb9lEHxZ
         nmdT2IellVVdQyOcpy/p7QiEyBi2Dty7+BHwYEtrLnOQ9nJ+L7LUgUAMhD+VgJm5aC7m
         ydJ4yQanwLd2jqimlyWGth0CLLSpLUCijgnG8vcrbbxgHj/1Ay4uAewCcm3NGQVgML81
         nAPKxxzPVRwr1AJby3wCJgSW+B5V2XU0sFi66uzxxjc3xBnnXkgZ74S6OmZJ//siBSsu
         ASgGz43OxjXiWVcx0iXzc7fzAhhskuz57EaMc+UrX06eWXpNtPNcyOKyvdluhSz9mZrO
         P+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342967; x=1750947767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLJwLGd0qPyFTtxZ6LI9ukhQE3/Rm0fiyJO6Oqqj0rw=;
        b=Dvx12UObsNxkNrIzoMmUP/m7XxOGR/iTsM424VW1wIHjvoVcDTF+NeU7Xw1t2Xq0Ak
         /FP7hZzP7MFNEQUxfJoKMgFC2jcvL7MxD6ILM7poZguW2oCcyO9fS5N+0KBzYTsBCVwm
         tc46DaXe6EA6XHv1i9ds+uSIHyT4kP3I4bL92Nc3OdvEtcWUWkc4MLsoT6W20JS2toeL
         5oz15U6z/QvigmfuLh5eQ7xZ1g0yyadF6AY1alETcq5xuNsGDIIfvlLI6ZmtqyEoRa5J
         iXCovCQxMtKLNO3sUM4mmMuNy3bwsW4txbLuo5Xe+ShPYMSCq2cf+2I4LJD3Y0AiX82z
         d1eg==
X-Gm-Message-State: AOJu0Yxw84UL+2vJpbaFAlF6YYMmbohpaQCpyQpwn6AoQVnfFTvY8sTn
	Vi184mmZLMDStJFchhREFhoRiAFh2BvZiyeh3ACYhSnO2xNoLGMnHQ40AJ1YiRlfNSkff/Zn8Ba
	Gr+XHRDU=
X-Gm-Gg: ASbGnctrAk5I1z6baN0Op9eyYSwD8JtKR56xxAWicy5F5tWCyDG+GJi8RLihJLjAt9b
	6FgpubCCVboFXbmftAJvqR5lPCObmq6WbZ6KTCGd6T8DA0Cj+w2GdBHmNapoArB43JDrMWJ+tKR
	SZhI1CD9+VxKn4FSdOR2LvnFYa2dA+i2T4RFG1RA8nWrUt7fITJ9Rhfjfj4Psv2f+OQQCNuNhvH
	AMkhO0qP4cHd13dNs84eknnChia6ZnhBvA+J8HXTMds+9l9Z2YandGXCQwmOM56bkGFQ9MqQBGq
	rVL1Bmta8aTSdp8Q7u58HJxGbQjy+2ftcklI2bW54NJPmsaduHQdT8+VGSPxUoi1jTuh9b7NMV3
	fA4gG0rIPhMU/OUPe
X-Google-Smtp-Source: AGHT+IGt1YeJIzXFQEIrWC6aADqIawfgrhdepwm+ykByi4g8krCN1zYKYTlQb0PHea+Ft3FocAEEPg==
X-Received: by 2002:a17:902:c94e:b0:235:779:ede5 with SMTP id d9443c01a7336-2366b139bb6mr347445305ad.40.1750342966745;
        Thu, 19 Jun 2025 07:22:46 -0700 (PDT)
Received: from pawel-TGP.seescan.com ([2a00:23c7:1d1a:9c01:6a9b:79fb:fd3e:b03b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bfe4sm120259945ad.18.2025.06.19.07.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:22:46 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
To: linux-leds@vger.kernel.org
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 1/2] leds/leds-is31fl32xx: add support for is31fl3236a
Date: Thu, 19 Jun 2025 14:18:59 +0100
Message-ID: <20250619142233.653273-1-pzalewski@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit is adding an additional and optional control
register for setting the output PWM frequency to 22kHz.
The default is 3kHz and this option puts the operational
frequency outside of the audible range. The control over this
parameter was added via the device tree parser function,
as really whether to use this functionality or not would
depend on the board.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/leds/leds-is31fl32xx.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 8793330dd414..d23260f3f6ce 100644
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
@@ -57,6 +59,7 @@ struct is31fl32xx_priv {
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
  * @enable_bits_per_led_control_register: number of LEDs enable bits in each
+ * @output_frequency_setting_register: address of outupt frequency register (optional)
  * @reset_func          : pointer to reset function
  * @sw_shutdown_func    : pointer to software shutdown function
  *
@@ -80,6 +83,7 @@ struct is31fl32xx_chipdef {
 	bool	pwm_registers_reversed;
 	u8	led_control_register_base;
 	u8	enable_bits_per_led_control_register;
+	u8	output_frequency_setting_register;
 	int (*reset_func)(struct is31fl32xx_priv *priv);
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
 };
@@ -93,6 +97,19 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.output_frequency_setting_register = IS31FL32XX_REG_NONE,
+};
+
+static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
+	.channels				= 36,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x26,
+	.enable_bits_per_led_control_register	= 1,
+	.output_frequency_setting_register = 0x4b,
 };
 
 static const struct is31fl32xx_chipdef is31fl3235_cdef = {
@@ -104,6 +121,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
 	.pwm_register_base			= 0x05,
 	.led_control_register_base		= 0x2a,
 	.enable_bits_per_led_control_register	= 1,
+	.output_frequency_setting_register = IS31FL32XX_REG_NONE,
 };
 
 static const struct is31fl32xx_chipdef is31fl3218_cdef = {
@@ -115,6 +133,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x13,
 	.enable_bits_per_led_control_register	= 6,
+	.output_frequency_setting_register = IS31FL32XX_REG_NONE,
 };
 
 static int is31fl3216_reset(struct is31fl32xx_priv *priv);
@@ -130,6 +149,7 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
 	.pwm_registers_reversed			= true,
 	.led_control_register_base		= 0x01,
 	.enable_bits_per_led_control_register	= 8,
+	.output_frequency_setting_register = IS31FL32XX_REG_NONE,
 	.reset_func				= is31fl3216_reset,
 	.sw_shutdown_func			= is31fl3216_software_shutdown,
 };
@@ -363,8 +383,21 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	if (of_property_read_bool(dev_of_node(dev), "is31fl32xx,22kHz-pwm")
+	&& (cdef->output_frequency_setting_register != IS31FL32XX_REG_NONE)) {
+
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_register,
+							IS31FL32XX_PWM_FREQUENCY_22kHz);
+
+		if (ret) {
+			dev_err(dev, "Failed to write output pwm frequency register\n");
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


