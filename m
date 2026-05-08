Return-Path: <linux-leds+bounces-8051-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EQ5MrTh/Wn0jwAAu9opvQ
	(envelope-from <linux-leds+bounces-8051-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:14:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E94F6DB6
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CFD5303D727
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327A73E1D0B;
	Fri,  8 May 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VluhlOnQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A63E274D
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245931; cv=none; b=XsB/jgUwPFHdelfymrH2k4Lukv/UDxwKokChc0XRAnwTWXO3cSBqGCL7fAICUT4YqAbhq7HygYWYSAbzFOidCnlUcapxmJa82kEnlOX+fgOzg6jDMse1LLzbklxKATmR0fMOVdWKLSzLN6e/Z/xjLZT4Aq+MKlc4vMbud3eTQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245931; c=relaxed/simple;
	bh=E8KHLC1Nbi3NBLgVxLEsG0ZdvPc4VF3KSVAQfL9DEHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uP7RULhfQksvl+/PO3cxcAiFPKYVmG8fjCIbK+EU7b/JJGsArDR9la/yWNw+unQHoE6+Iw1IlCBMiSTTpT9mW7Eg8jRvwnRZW4iu3SprnfgBfEqVws+k2S7ljMNfXk7EmB0kCSzX+sbDAc1jms/v8ZUlN5lk3E+KMbqE+P1tzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VluhlOnQ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so2058821eec.1
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245929; x=1778850729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=VluhlOnQGbnwreYd0K8rZIWDk5ygm2PxfJ/paaHeopFsdugyavawDZyc93rc4aFpli
         GaP1Q/CO7sxts8DJlff5Tr4yNcC94/8WLNpJS56YSXwXwWL8Hp2Brqv3lgT6xx5rfn7n
         fu1fHtSD12B6PB4Nz2N1qzIkssqL7CIj7QL14M0CUHxpBpHh9tpR3LsHe1cQ1dv4KyXc
         GBj3iMUTNJaJaHgI/AgtnWGKwzO56Sek+jWL9+peH/tsteHlQa9quQc2vbQjEX6TPEjn
         Q1V/LqigGhkAaHU7PR5FVHd6wHEdmDwyJrX44ff/IC3rzomMkrU9baK0c5/W31rLm9dl
         omMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245929; x=1778850729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gO706adh8M0cH/PpFGt/u7nigSQIbFuK2LgSPVQ9R0=;
        b=Ae1onbQnAln2nOW34EirR5Ry2AX4ims6wMe+TIMh1EwW0nmWQKXwKJwq3G2bN6VvbL
         4RHN0v0Mzz1Z4XFOzEHGBB+tPUMlgml+yaDMEwACvJHM1DXy5CSELZT19HhDRKJUYT+b
         ZOi4R4rPtFuQewPq4v6WsjdokIa/W2I+qpTOmxlMIhP8Rm5seYap3OKOCFoxeIemz6e/
         LPbpcYQ9IZJ7k1d4AM5DE/G+IVS6RL/+HguhRbScLYrfnTqb+zeRs3HOZ0Id2DDkwIkc
         951vs5FGGNs8vWaEXsM5QG+V0VTPOY3SjezGbqWQIdmk5u63yOAMN5MkC3VdanvAeIML
         iAhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B1rxB7+kNtCR6AcxieJouWH+mxYJbAaux2V/6SAzsQEoAubb1Lezuf3B+nAPzO+mtDa/OiM3+ZUbV@vger.kernel.org
X-Gm-Message-State: AOJu0YwdRNs21qZIjtb/PjyRbvlP56SfxdTUPtv/XjteUVs9Vpw5K537
	zqvlXkN2HNnU6WkPn3N7BO4oTChHBxN+229D5glxVwl0j0JZitPzTVWv
X-Gm-Gg: Acq92OGrXKZSkNFUr+hjBIXOr/wsP8OMMwm5VBaYSHVq1XLzek+4VEtKKoDrGM2WMta
	SpY0YpWSXT2txjbcPvmoWSo4Qwvu9gSNfMlhW/ssBLkKvo+KrzF5TjM/36WGN/vsP27cNcnqjHw
	4MeYCUXCC1etCnQMjfPT/qGl+TBZfT5fGlidkssa2Rg0BN2MAD4CAd0Jh0NuvfTM7CgL/7ASG1O
	chGGYwarR1ILGLQ29Acgdg1MhEbMWCW0pKleH8626GwV/V2aDTrn7q7N/ozHoz4hCIWoMBN3PDc
	nzZvJhQtV/k3/UmwBOUlMmz/gA5wpURp51jQIUYhcuxQdLyALedf9HfNO/1flOOEEDi8vRG18PE
	rK+j0sYGV0LfuAeOsloGGG/50AXc56WSLwcELPrd3/8k2GcaremBAxuh9MRtGYkv0CYLuBnkmrd
	FxlG4tYA3yaiYBRhekfA==
X-Received: by 2002:a05:7300:a987:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-2f549e6b1d2mr6307684eec.16.1778245928826;
        Fri, 08 May 2026 06:12:08 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:12:08 -0700 (PDT)
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
Subject: [PATCH v5 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Fri,  8 May 2026 21:11:38 +0800
Message-ID: <20260508131139.1523597-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 262E94F6DB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8051-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware shutdown
mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..57d779e07a62 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -60,6 +61,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +423,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get powerdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0


