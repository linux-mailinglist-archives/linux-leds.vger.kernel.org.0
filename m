Return-Path: <linux-leds+bounces-8219-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H8FI/G4DWrC2QUAu9opvQ
	(envelope-from <linux-leds+bounces-8219-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:36:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0158EE17
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BD9F3055073
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C4B3939D3;
	Wed, 20 May 2026 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGQkL1Tj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307962D97BB
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284067; cv=none; b=tJhYKTbRmv/Q1VRk53hQDupLEn4hMQTgKsEYKfdSqzLAtLx4qQfNQ1gWmvqYqj8UPUlg5nvv8YiNbAxFUVy/V3bN+QKubOshA6yRp+bJhQNER4JbIQsU13IIZVeKwQG2uFloTq9fZ19hthZyUnl5ieJ2kvjX9hv2mf0PIo3bYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284067; c=relaxed/simple;
	bh=33+ik9qldfzElfwEbUFdDRSw3s77jyByMHu+q2J05gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcXL/kPrn1tfhGtXWVf6DrHWiBRXkHG0Ra59sASY1OmkLDHGdt3cESqkaAaJJVMlXV4bgGJwNKsDNad7rp7kFucHMbqQUo8D0SsZYDwB8Uz7h84gNQTdoJX44hj43JRGhQhdCDTDvdRLcjNmeRdFIP07nxhqDZYLKfIqrgy2mm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGQkL1Tj; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-47c7b282e21so1929344b6e.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284065; x=1779888865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDbe/ecn+aILq8lwi+Q4VCno4aximoHPHL06TCJTUbc=;
        b=VGQkL1TjfYqFkDOBcz9/aqaw3XxRpnBGYZLrhrtR0RcVLgAhX76mrx9dJAWhh90XhT
         d8yp+vCO+o4U66bc18nYe1u378LR+s6cE1kEOvifD10kI+S3nXr/0/crP/FszsJ9nSrQ
         YdaW29FY1gIcEej5szMCuFiexjLR+udmIQlBBdZRW1lNuzYkjpjf1kf3pR2QOloUChHv
         yMTT8fphMroh4Sj5IAkOI+KZx++4dFssSNImWPxCXjl1babT7C4HUqrzWNZE0MRgeZ7a
         lCGiKseoPWu8CdVcUh3hPF5F/DPw4Bw0YOD5bFcwNCiZ5E5mHmusySyQ9OkvQWrwomjT
         thMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284065; x=1779888865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDbe/ecn+aILq8lwi+Q4VCno4aximoHPHL06TCJTUbc=;
        b=ry/MRGfMb9gDa0fb3pOZD0OWZ/plQs3W8r9dVp9ZsfJH7XbjfTKQFOfvW3qAKJknt5
         q9nCL52VsGk/9+juMtsIAZ9MuckIrlY3k9YytgXW6LNWLcIRqTnNSHHNbmHskeA9BFYG
         HmcobMaset7eHmEkEE96fO6RqwAYw9KTOg11lB4yD+vERgtfjEadpuNBj2mgXvZ9ONJM
         sFgv0g+ppcc+0T1WtWaCknr2m01sXe7oixVHf2U1aKD9oSRHK6UrVb+jSs1lIhvBCyI2
         Rxd6jAl3ezIgVpdKAs6ICBZ58PdG9srYs5pDzx0xRt/263g6pnjXRCcrFeqdEWGfIT2K
         HPIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zxicT7F2fsf4M92OTGOx55x/4Jg7USRiJAUSq1nTKTR7uxEfxI1U+fLrhr1kUoutvQxXafwZOEaYB@vger.kernel.org
X-Gm-Message-State: AOJu0YzVeUuiqlVtsvYnEL+X4rwRCm1nx332odHFoKD90OC+8CA71zxu
	kTu1a+Nb/mEhonoYSnQ9nRvr4DgKbwTujTR5wu6uX5wMVzDH2o1mNQjk
X-Gm-Gg: Acq92OHJF315wf66V7dN2OqdAyClEKxVBRdBLe+rl6W6+5IkN3LQUudLcLQFSaGBXL/
	YUVbIWp5x4VodVq72Hf+VlR9XZPByEIknMpqc7KFR22TE8QFp947NFaTWefBdpOtvZviCxpBkaY
	sID2ltEAD/Qpiry01AXhagf4tldz1FUvYnhTLLxhc9CB414rnaZlLnArncSAxZJ06+Y4SNQ+k3Y
	3MlLC/xXUBjiRxdi9IJ53YMP4SLDE9OtA7FkUP9CndHhbnsb0nJ+UdPvBGC/vfxmRkE2gaBW3Ka
	PvyLtEMekzbF+KcQAIK16/GGvDUXKi/X5Qq3wIiEU2a7+qrBJrHpUH5mDTzBR23fb++hQwnGAXn
	cSP/HoUdiqay96gW/5ZHelaw4trAAYp4ziqroANaGz02jraoqWPMN//KFCE/0/7fddc+wF7L5r+
	tNU3lwpkI0CYIVUhmGu+a2TVp1mi67OcPPDrp/dg4=
X-Received: by 2002:a05:6808:3986:b0:482:dae4:23cd with SMTP id 5614622812f47-482e564d54cmr16908898b6e.10.1779284065074;
        Wed, 20 May 2026 06:34:25 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:24 -0700 (PDT)
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
Subject: [PATCH v6 6/6] leds: is31fl32xx: Move pwm frequency setting to init_regs()
Date: Wed, 20 May 2026 21:33:43 +0800
Message-ID: <20260520133343.1423946-7-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8219-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0DA0158EE17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit a18983b95a61 ("leds: is31fl32xx: Add support for is31fl3293")
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
index 5678c2273bbd..3e86e414c532 100644
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
+				       		IS31FL32XX_PWM_FREQUENCY_22KHZ);
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


