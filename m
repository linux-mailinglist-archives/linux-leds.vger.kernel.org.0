Return-Path: <linux-leds+bounces-6269-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DADC78DC8
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 12:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 73A6733075
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 11:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5166350D43;
	Fri, 21 Nov 2025 11:36:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C979634FF6C
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724984; cv=none; b=a2ynTdKu0A7MOfg2VBqbVQ953aQb88KUrLySyHN925UGSLbfwjERGVE/+93kF+a5NMKwaLiL1Pz/usVNlhWAA4mzJ4v0XZza2/ygKFeOpJiGtOe3mX1XFU+T8ubHfqrKCBzVFMVo5/rWGLEdmD4zMeRlHQmU1nyOSIYAuehxRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724984; c=relaxed/simple;
	bh=OYX/vyYydeilOwQU14xUswuwbqo5qX8QvCKQbSOgwrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbxgl+VmVk4x+ZS+KctodCVRT3DtDKkMjKbJnldoeQhzoIxvKZqW5UMslAuZla+dt+glzcJS3FDNtMZs7GPTc9Bq2yOpaTuyUaPoMWktQHJW2E0Hk7FDXeolMlNxxbSOEDABBkob2lV55po02Vfh7tlMgNrDEIz96kZuRfXVsaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com; spf=fail smtp.mailfrom=holoplot.com; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=holoplot.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=holoplot.com
Received: from hq-00595.pfsense.f14 (p4ff24940.dip0.t-ipconnect.de [79.242.73.64])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 116B3281ED7;
	Fri, 21 Nov 2025 11:36:15 +0000 (UTC)
From: Daniel Mack <daniel.mack@holoplot.com>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 2/3] leds: is31f132xx: re-order code to remove forward declarations
Date: Fri, 21 Nov 2025 12:35:56 +0100
Message-ID: <20251121113557.77418-3-daniel.mack@holoplot.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251121113557.77418-1-daniel.mack@holoplot.com>
References: <20251121113557.77418-1-daniel.mack@holoplot.com>
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
v2 -> v3: re-ordered patches to get rid of the forward declarations
          before introducing more of them,

 drivers/leds/leds-is31fl32xx.c | 97 ++++++++++++++++------------------
 1 file changed, 47 insertions(+), 50 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 8793330dd414..388d6a0b6932 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -84,56 +84,6 @@ struct is31fl32xx_chipdef {
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
-};
-
 static int is31fl32xx_write(struct is31fl32xx_priv *priv, u8 reg, u8 val)
 {
 	int ret;
@@ -403,6 +353,53 @@ static int is31fl32xx_parse_dt(struct device *dev,
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
+};
+
 static const struct of_device_id of_is31fl32xx_match[] = {
 	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
 	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
-- 
2.51.1


