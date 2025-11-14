Return-Path: <linux-leds+bounces-6134-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B38C5C653
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 10:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 468F03AEA75
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 09:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9140E309EEE;
	Fri, 14 Nov 2025 09:54:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C87308F30
	for <linux-leds@vger.kernel.org>; Fri, 14 Nov 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114081; cv=none; b=nbqK3QOZ6+5JRnNNPoH4KqN3EHv7k1Ki/s9bPvk0KKMVXt8SZlXImA6jFDCjAjoMG+wMqLopQqVo5sgCE1hD/k2T7YiiNwCrhXFhUcVfmKoZiUfwVkwKsUOzQnWs3FLm6lI9tv3FHBrrOHq49FuqN0MbuoqOeD2YBTGQ1YpKYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114081; c=relaxed/simple;
	bh=FNuLFNYSYnezzO+QsOV53dAd6639wI2m+K9qYFmawvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o796whWMRzLpUUSNMHDojYzc8324xqETu8qorWDKL2krRtSYT9+CmNJ6TYr2fX2rB8XSGDJOyIQDvtBzcYtCj0n2IEN6/YC4J2Cq1KimF9Khd1sddA8EOHXGXBz6chHltUkYsRKoqCILeZmhUvcKGTTTpO7YUCD3CoJJ/pRwX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 34E9A281EC6;
	Fri, 14 Nov 2025 09:46:50 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 3/3] leds: is31f132xx: re-order code to remove forward declarations
Date: Fri, 14 Nov 2025 10:46:40 +0100
Message-ID: <20251114094640.4096054-4-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114094640.4096054-1-daniel.mack@holoplot.com>
References: <20251114094640.4096054-1-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Mack <daniel@zonque.org>

Move the chipdef structs after the functions they reference so that forward
declarations become unnecessary.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-is31fl32xx.c | 136 ++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 71 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 26664fad91ae..05e28257ca4b 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -103,77 +103,6 @@ struct is31fl32xx_chipdef {
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
 };
 
-static const struct is31fl32xx_chipdef is31fl3236_cdef = {
-	.channels				= 36,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x25,
-	.global_control_reg			= 0x4a,
-	.reset_reg				= 0x4f,
-	.pwm_register_base			= 0x01,
-	.led_control_register_base		= 0x26,
-	.enable_bits_per_led_control_register	= 1,
-	.brightness_steps			= 256,
-};
-
-static const struct is31fl32xx_chipdef is31fl3235_cdef = {
-	.channels				= 28,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x25,
-	.global_control_reg			= 0x4a,
-	.reset_reg				= 0x4f,
-	.pwm_register_base			= 0x05,
-	.led_control_register_base		= 0x2a,
-	.enable_bits_per_led_control_register	= 1,
-	.brightness_steps			= 256,
-};
-
-static const struct is31fl32xx_chipdef is31fl3218_cdef = {
-	.channels				= 18,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x16,
-	.global_control_reg			= IS31FL32XX_REG_NONE,
-	.reset_reg				= 0x17,
-	.pwm_register_base			= 0x01,
-	.led_control_register_base		= 0x13,
-	.enable_bits_per_led_control_register	= 6,
-	.brightness_steps			= 256,
-};
-
-static int is31fl3216_reset(struct is31fl32xx_priv *priv);
-static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
-					bool enable);
-static const struct is31fl32xx_chipdef is31fl3216_cdef = {
-	.channels				= 16,
-	.shutdown_reg				= IS31FL32XX_REG_NONE,
-	.pwm_update_reg				= 0xB0,
-	.global_control_reg			= IS31FL32XX_REG_NONE,
-	.reset_reg				= IS31FL32XX_REG_NONE,
-	.pwm_register_base			= 0x10,
-	.pwm_registers_reversed			= true,
-	.led_control_register_base		= 0x01,
-	.enable_bits_per_led_control_register	= 8,
-	.reset_func				= is31fl3216_reset,
-	.sw_shutdown_func			= is31fl3216_software_shutdown,
-	.brightness_steps			= 256,
-};
-
-static int is31fl3293_reset(struct is31fl32xx_priv *priv);
-static int is31fl3293_software_shutdown(struct is31fl32xx_priv *priv,
-					bool enable);
-static const struct is31fl32xx_chipdef is31fl3293_cdef = {
-	.channels				= 3,
-	.shutdown_reg				= IS31FL32XX_REG_NONE,
-	.pwm_update_reg				= 0x28,
-	.pwm_update_value			= 0xc5,
-	.global_control_reg			= IS31FL32XX_REG_NONE,
-	.reset_reg				= IS31FL32XX_REG_NONE,
-	.pwm_register_base			= 0x19,
-	.led_control_register_base		= IS31FL32XX_REG_NONE,
-	.brightness_steps			= 4096,
-	.reset_func				= is31fl3293_reset,
-	.sw_shutdown_func			= is31fl3293_software_shutdown,
-};
-
 static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
 {
 	int ret;
@@ -525,6 +454,71 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	return 0;
 }
 
+static const struct is31fl32xx_chipdef is31fl3236_cdef = {
+	.channels				= 36,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x26,
+	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
+};
+
+static const struct is31fl32xx_chipdef is31fl3235_cdef = {
+	.channels				= 28,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.pwm_register_base			= 0x05,
+	.led_control_register_base		= 0x2a,
+	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
+};
+
+static const struct is31fl32xx_chipdef is31fl3218_cdef = {
+	.channels				= 18,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x16,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= 0x17,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x13,
+	.enable_bits_per_led_control_register	= 6,
+	.brightness_steps			= 256,
+};
+
+static const struct is31fl32xx_chipdef is31fl3216_cdef = {
+	.channels				= 16,
+	.shutdown_reg				= IS31FL32XX_REG_NONE,
+	.pwm_update_reg				= 0xB0,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x10,
+	.pwm_registers_reversed			= true,
+	.led_control_register_base		= 0x01,
+	.enable_bits_per_led_control_register	= 8,
+	.reset_func				= is31fl3216_reset,
+	.sw_shutdown_func			= is31fl3216_software_shutdown,
+	.brightness_steps			= 256,
+};
+
+static const struct is31fl32xx_chipdef is31fl3293_cdef = {
+	.channels				= 3,
+	.shutdown_reg				= IS31FL32XX_REG_NONE,
+	.pwm_update_reg				= 0x28,
+	.pwm_update_value			= 0xc5,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x19,
+	.led_control_register_base		= IS31FL32XX_REG_NONE,
+	.brightness_steps			= 4096,
+	.reset_func				= is31fl3293_reset,
+	.sw_shutdown_func			= is31fl3293_software_shutdown,
+};
+
 static const struct of_device_id of_is31fl32xx_match[] = {
 	{ .compatible = "issi,is31fl3293", .data = &is31fl3293_cdef, },
 	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
-- 
2.51.1


