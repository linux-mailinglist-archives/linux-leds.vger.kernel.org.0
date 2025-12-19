Return-Path: <linux-leds+bounces-6453-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806ACD09CE
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 16:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95FC73068DE3
	for <lists+linux-leds@lfdr.de>; Fri, 19 Dec 2025 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E111F328247;
	Fri, 19 Dec 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b="A6wAPFlG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mailkram.bugwerft.de (mailkram.bugwerft.de [95.216.200.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0BC33BBCC
	for <linux-leds@vger.kernel.org>; Fri, 19 Dec 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.200.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159147; cv=none; b=ZH00dWRd1+24ogzUv9BGbV+Dm0v9zxHVMLAQNqvBtXK2si9cWyrhYNTgM6YyQYXA7YPXf4HgUvZluqxZ/BNnNlWFK7ihUAHx+/4Xbj3SSL8AtCE1GdL6xv6LtflW+MMqO02SP6/EgG0NUgTZga8y5i967qWJ7ZISamzxgofIEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159147; c=relaxed/simple;
	bh=3ztc5y29mE5nv0ZxJE7SAyKvo8CnvxbiVdDAs+F4CqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDQzSB5rDvloMPPBtl62utyWv9IiSWqu+YoXB1VfLbvsBd6r9CTzCDQgoUA2LbTi1QiiCIxoNPsa8E8QZYkE1CwscKPsJYMHZAhMULIuxZVfWWdSAc/NfmXXAONgdtUlKrm8eo3dY+rFIuRRfGLq8PlLrn4wnvV1zJR9TXePRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org; spf=pass smtp.mailfrom=zonque.org; dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b=A6wAPFlG; arc=none smtp.client-ip=95.216.200.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonque.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zonque.org; s=mail;
	t=1766159139; bh=3ztc5y29mE5nv0ZxJE7SAyKvo8CnvxbiVdDAs+F4CqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A6wAPFlGddctnej1ng5D4dCEP/tasM+71d45kEwbKvaDihiVMS8G92d63p75e3Yc0
	 NXJOnz9lsdjSs/9C3RQR8+ENf9U4JvjjJXBlefVNJ4BQiICYD/UCX2DympokCiBz2i
	 qwPzwy6UvTiG6Vpt6Da12Kj2+4vnhTbCOj9hpgZg=
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mailkram.bugwerft.de (Postfix) with ESMTPSA id AC1FF416D1;
	Fri, 19 Dec 2025 15:45:38 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 2/3] leds: is31f132xx: re-order code to remove forward declarations
Date: Fri, 19 Dec 2025 16:45:20 +0100
Message-ID: <20251219154521.643312-3-daniel@zonque.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219154521.643312-1-daniel@zonque.org>
References: <20251219154521.643312-1-daniel@zonque.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the chipdef structs after the functions they reference so that forward
declarations become unnecessary.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
v2 -> v3: re-ordered patches to get rid of the forward declarations
          before introducing more of them.

 drivers/leds/leds-is31fl32xx.c | 128 ++++++++++++++++-----------------
 1 file changed, 62 insertions(+), 66 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index dc9349f9d350..bd5323f2316e 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -88,72 +88,6 @@ struct is31fl32xx_chipdef {
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
 };
 
-static const struct is31fl32xx_chipdef is31fl3236_cdef = {
-	.channels				= 36,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x25,
-	.global_control_reg			= 0x4a,
-	.reset_reg				= 0x4f,
-	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
-	.pwm_register_base			= 0x01,
-	.led_control_register_base		= 0x26,
-	.enable_bits_per_led_control_register	= 1,
-};
-
-static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-	.channels				= 36,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x25,
-	.global_control_reg			= 0x4a,
-	.reset_reg				= 0x4f,
-	.output_frequency_setting_reg		= 0x4b,
-	.pwm_register_base			= 0x01,
-	.led_control_register_base		= 0x26,
-	.enable_bits_per_led_control_register	= 1,
-};
-
-static const struct is31fl32xx_chipdef is31fl3235_cdef = {
-	.channels				= 28,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x25,
-	.global_control_reg			= 0x4a,
-	.reset_reg				= 0x4f,
-	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
-	.pwm_register_base			= 0x05,
-	.led_control_register_base		= 0x2a,
-	.enable_bits_per_led_control_register	= 1,
-};
-
-static const struct is31fl32xx_chipdef is31fl3218_cdef = {
-	.channels				= 18,
-	.shutdown_reg				= 0x00,
-	.pwm_update_reg				= 0x16,
-	.global_control_reg			= IS31FL32XX_REG_NONE,
-	.reset_reg				= 0x17,
-	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
-	.pwm_register_base			= 0x01,
-	.led_control_register_base		= 0x13,
-	.enable_bits_per_led_control_register	= 6,
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
-	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
-	.pwm_register_base			= 0x10,
-	.pwm_registers_reversed			= true,
-	.led_control_register_base		= 0x01,
-	.enable_bits_per_led_control_register	= 8,
-	.reset_func				= is31fl3216_reset,
-	.sw_shutdown_func			= is31fl3216_software_shutdown,
-};
-
 static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
 {
 	int ret;
@@ -435,6 +369,68 @@ static int is31fl32xx_parse_dt(struct device *dev,
 
 	return 0;
 }
+static const struct is31fl32xx_chipdef is31fl3236_cdef = {
+	.channels				= 36,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
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
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x26,
+	.enable_bits_per_led_control_register	= 1,
+};
+
+static const struct is31fl32xx_chipdef is31fl3235_cdef = {
+	.channels				= 28,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x05,
+	.led_control_register_base		= 0x2a,
+	.enable_bits_per_led_control_register	= 1,
+};
+
+static const struct is31fl32xx_chipdef is31fl3218_cdef = {
+	.channels				= 18,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x16,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= 0x17,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x13,
+	.enable_bits_per_led_control_register	= 6,
+};
+
+static const struct is31fl32xx_chipdef is31fl3216_cdef = {
+	.channels				= 16,
+	.shutdown_reg				= IS31FL32XX_REG_NONE,
+	.pwm_update_reg				= 0xB0,
+	.global_control_reg			= IS31FL32XX_REG_NONE,
+	.reset_reg				= IS31FL32XX_REG_NONE,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x10,
+	.pwm_registers_reversed			= true,
+	.led_control_register_base		= 0x01,
+	.enable_bits_per_led_control_register	= 8,
+	.reset_func				= is31fl3216_reset,
+	.sw_shutdown_func			= is31fl3216_software_shutdown,
+};
 
 static const struct of_device_id of_is31fl32xx_match[] = {
 	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
-- 
2.52.0


