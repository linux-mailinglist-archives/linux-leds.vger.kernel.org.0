Return-Path: <linux-leds+bounces-8226-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF0pL9O/DWr32wUAu9opvQ
	(envelope-from <linux-leds+bounces-8226-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:06:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D358F4CE
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 760E4308601B
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F1A3E639E;
	Wed, 20 May 2026 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUZSvaYR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D92AD03
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285465; cv=none; b=EsUeVdguNO5ojvIr8ZCxGyzYbpIxtsXOGde+zMdPugB2aUzB5fYmuE+U+Y4n+++rl4PM4gBhIQFcdAjzhyN6vDBIHma6KcTxIujKDhMW/4BYEaojmoH9eFfHT1WtTCeDMvgrEAVDr0xAlOf4bRii13kV+kUX88L8qYhUqwPymtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285465; c=relaxed/simple;
	bh=NJrZZSi0o9VWzREhhBEGRggS+ScI0rgS2bTlC1O7Evw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgaTa1sREOKFz/5IKV9ByNt0LhHg86hci9aCZpnXmgMsH5b7bo7Eg/nbeMdn5V3wX7ldC1L9yjekzBJy1A5B+95eo8LpcJUGfHlbKkLWms35Ca+tpliE4mnpDhL0dp1uE3z4D7xMXqVJpPOZPGQcuPWZ7lJ8328uoXwk0nyvjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUZSvaYR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c827313dac0so2638640a12.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285463; x=1779890263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFCXqSHrRWZZKbLGMzbhUrsRJwY3I6y6cobGCV3nNZc=;
        b=OUZSvaYR8RTwyR9XMw4EhDOwBwaJQBdD4QbFQoU9tTljTaXKfN6H/aJE7QBLVsXS9s
         R96B4qmg3+IyqOOCli5vWDTWSKvX4oNJs5xqTRFVkSdyBqVNWNeWF6vxv85Nxjr4icZx
         6bpiVOymdSrVUzYFFiTC1UoGhrwZPIigdnmtKLwiYwmVB/lvhG96rKYm2v4H3QRVQzyA
         usTOMY+3JwD33c/QbX8F3QEy71JgwdeyxkNV72CS968Li72K42aOJGyVx4YU23Ynuv06
         RT77d0IwhFkQpXF4lwQGnfhpLtAen+31pTqjdjUqRjaLgWOUBcfJZ6rnf3g/PF7bccwG
         V6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285463; x=1779890263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFCXqSHrRWZZKbLGMzbhUrsRJwY3I6y6cobGCV3nNZc=;
        b=gn8TNgS59Xn6FhPjgIN0bv9tk+DtKhW7qJErmnxbortmVTVRuW7C6f76kSg/LhFl75
         UwGkYUKyBSZoYG8ElMl6uPSE5UDM588J13oOnYTLVCK8G0EJuA/wsl5AZBeEWAJVg0MK
         lctAYwtiH40+fFU7Ztd7Xx5bWwbc2e+1qm7zCoKunQC2tH5NQOGFQlqr4r8gEqKzF7c/
         +Oo4jaePV0Kfa4Wg5/FRVT3I4tAG8jvaOQaMmam1AvEnXh5wzDM0qdQuntExWpqiA3Q3
         Msb4JxWDaFNNzj90r47nbyZSQnUs5vvykfxBbHr6YM/aDdpoE220oQx5VY5/pt6GkcaI
         8mHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qh09E9TTc8hE6jSddShDpypNJ7mFhcycddOp+M3x2o4ElxsTGfcg6DRggNqxSeInvTPUcxHIxa2/K@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAEbA2VYPduurQU1M1CNfXw1/LVqcZFvXt8Benq42JBFx7Ee7
	YAoyHlLxEVUKATsU+uw9VONYhxgU8928NlcYMhSiaaWljKxApDgxEIKw
X-Gm-Gg: Acq92OHQ2DrNw3C49GrpzOV/R+fU8IMG3uwR/eZiSIZ9qtYeo7pVu+X1DiJIfRkjtJF
	nXYBMPwx3yAYrSz3g37GCGnUPgQne4WsHG0nrxsJZaY7BAycS/OMEg9pgD2gKmtwBGCJAkM7Z6l
	OYUAJaUTkjNpDCgw2Q8MzZrScDJH2/6UoXWTK+02yNhXOfL51HCwQQHtTglQeyjbt4F4iHezYJZ
	77VuErUyry4MDtCte2jShsLvxCVtTZMKscpwjHTvsEIp8mDWodBo6E7hqDWk5jlF2qxyVVRC5dp
	dCzguAdnfs4Mvy54/SibuGncM27RPRWLiitMBJ6joTBNEj7gVgVseItt6uLk/7gn0jCu3PVDEeG
	JfIDGFZHfu//d3rdC47qGmdZh8kwmgvrZ79azyQDxUa13/vnU8taSzqkKGsggONp4F7LuYkXQHF
	Uz8lI3vXo1lPO1CzRO17bAPExxxHCxVtY36MYczhfCMRqPhRPWyA==
X-Received: by 2002:a17:90b:4a42:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-3692345e3eamr25930138a91.7.1779285463062;
        Wed, 20 May 2026 06:57:43 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v7 6/6] leds: is31fl32xx: Move pwm frequency setting to init_regs()
Date: Wed, 20 May 2026 21:56:59 +0800
Message-ID: <20260520135659.1430008-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8226-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BB6D358F4CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

commit a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
swapped the order of is31fl32xx_parse_dt() and is31fl32xx_init_regs().

This causes the PWM frequency configuration programmed in
is31fl32xx_parse_dt() to be overwritten by the register reset
operation performed in is31fl32xx_init_regs().

Move the PWM frequency setting logic from is31fl32xx_parse_dt() to
is31fl32xx_init_regs() and separates device tree parsing from hardware
initialization.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 2d7ff4c5a08c..c545a3b7a05a 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -63,6 +63,7 @@ struct is31fl32xx_priv {
 	struct i2c_client *client;
 	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
+	bool pwm_22khz;
 	struct is31fl32xx_led_data leds[];
 };
 
@@ -346,6 +347,14 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	if (ret)
 		return ret;
 
+	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
+		priv->pwm_22khz) {
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+							IS31FL32XX_PWM_FREQUENCY_22KHZ);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Set enable bit for all channels.
 	 * We will control state with PWM registers alone.
@@ -420,7 +429,6 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
-	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
 	/* Driving this GPIO line low takes the chip out of shutdown,
@@ -431,17 +439,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
 				"Failed to get powerdown gpio\n");
 
-	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
-	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
-
-		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
-				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
-
-		if (ret) {
-			dev_err(dev, "Failed to write output PWM frequency register\n");
-			return ret;
-		}
-	}
+	priv->pwm_22khz = of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm");
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		struct led_init_data init_data = {};
-- 
2.54.0


