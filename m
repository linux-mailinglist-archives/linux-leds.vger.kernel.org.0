Return-Path: <linux-leds+bounces-8532-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HFvxMySNJWqaJAIAu9opvQ
	(envelope-from <linux-leds+bounces-8532-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:24:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D93650DC4
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:24:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V9m3Kaak;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8532-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8532-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4222D304D5C5
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 15:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2377727FB37;
	Sun,  7 Jun 2026 15:20:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46672D2397
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 15:20:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845636; cv=none; b=avAEZFPsttcdBJLCRfM3vAnSx3ULKoFFJJw6uYLR5tE0rnQ6X6yAJa42J/vuGZDXy31bruebBDLSmRr1Z7Cna24NfYBaI4rmQB8iU3evKgMZETQ2M1XTdedwA5DuEgwtFzOsX54pudhUrs7FIHsj5tyGLXw6kCdcDu7wYhTphbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845636; c=relaxed/simple;
	bh=e/H4yzSTRx9v1FO/nY2xDM9IAIIvMAnlcw/dCWJpsew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kc4k3VCRULSj9as46G7LIXPl7k/BeIbnS3pOMboKrVbGz4g+m6j9zjVYPcyii7iC37Q2cuH+MNznulpIa9s723P89tl2Jd1F5lMMB8NP0iKKBByUgocNpeS35OjWczsYGL+nz3CRUE4sTazJU9LTaMGMFMuRUUwqQhF4/uhSEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9m3Kaak; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so2118670a91.3
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845634; x=1781450434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r66DUruGKk6cGeKPaPeTjn7wW8sOwdyE3f6CXLHUbkU=;
        b=V9m3KaakBwuzCXKKTDhwblaFRzmkYYUm2AZ+bRBLeDlbduzVukpD9J9Ci2kk5yDj/I
         zZi7SQn98dWiBuFFeeXOIB4ZrigXUA7ljuzlA+5BgUdOd46TzNRMHNkIWvZ/+D6q0Ryl
         Zb3CVE5PCFk1EvmZPI5Xhxx14S4vA0IS37M0BIb0JBQPJSq9oM8qPnBvsq0JzcL+MRc5
         DT79dSZPYVteBav44R33tOBM+JL+4DDfiYtZkzs+4g/VCZwdQb6aJa8WUJIyBBoQHyP2
         PmhJTeHpdOMNCqlRFMZcUXCpEaMthbHElJErPWuMxSn2voSZAVQ4UXEU/UnzzhvxyKFB
         xXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845634; x=1781450434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r66DUruGKk6cGeKPaPeTjn7wW8sOwdyE3f6CXLHUbkU=;
        b=JG4wrlwgCKs5okhRgyizRcHjTsbZHzBZP7HkP0QWUxMzOLLHgnfCSqJ6HkPz3aCAPr
         e+VkQ2ULCP0LsSP58QHVxiu1IYsK9DoSt1dzRL8OejYWa1O1lx2KFZpwZlwK2ttqTYLs
         35yLF3pitwSJBGgqfCrZnBy8v2Am/F+aAW6Yc2sw76DvQvx4PSRmG8BWI2QGJjHthYj0
         f8Ou4uGVqbPu/HAJwO0YplxLdn+98bqV1A2ZtuLkYnASiifO46reRSrNSSN5xl2qvqKJ
         c7RVZ2LweXDdEtKoHBYNriJY6YkqYE6T2i0X7E4W371bgIg1xxaWBMkLhQwfR6nGTPgJ
         /TDg==
X-Forwarded-Encrypted: i=1; AFNElJ9OZct1ARINqlXoJ5RF+oKuEJLWOD1EWkhGNMOMCany/aE19rjl8Z2KMHYVzoRXSePzJtr3KQgMCkoz@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmA+J/z5GwhdZAiXZchl/vpCTkcMWtCOxIpWywUml+1dtroWe
	Avev5kxLaCaT6535kLaXWdiLGxCi6GwXckE0smbZO4BXcqna9PrKxIcw
X-Gm-Gg: Acq92OGlHH/U1JL9+1hJTDlcq2nf+P/IvAP7mOcOay/zRQlz9wxCG7IE5vF0ctQ/dlh
	wqlZyLjzBqET2b2zN+qJwSVvbpFx9nXc+sDG9jzH6BiOvFcTxlTd0NFJmeefXbW/OwB9mRjPCjA
	eggOtBnoqJxtUuUSmnnlIk9ACImqQdWJpWazzu2PVSl1lL0VRMNEraTBNazmPVnv+pu7+TuFuwj
	wpo1hu4VSPFv7fJFlqCdagGdPA3UqB5AGEqWNzEg/aTnAUpMJuo11jJUouIuZNcfTs61Z88syAX
	DUm51yH6g7dmN1GTVy0/VrMEqsmSQzXlDdfjGP3c5HXyv9ZZuVbMEfDDRKqb+Tpcm5pzP9izp+6
	uYZ8UkqcgN3IpOQlc+lU2UlPCY8/v6PWbY7FufsDlTTwkEp4iB3ruqbmquL9HLsip3S0N1gdX95
	pQbA+8DQN3kTbIkgjWdPIuEZUb76u9mbwgywjJSVTWlqIHJuSTKg==
X-Received: by 2002:a17:90b:390e:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-370ee82f93cmr12620623a91.3.1780845634053;
        Sun, 07 Jun 2026 08:20:34 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:33 -0700 (PDT)
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
Subject: [PATCH v8 4/6] leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
Date: Sun,  7 Jun 2026 23:20:00 +0800
Message-ID: <20260607152002.446617-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8532-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luccafachinetti@gmail.com,m:pzalewski@thegoodpenguin.co.uk,m:daniel@zonque.org,m:jerrysteve1101@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27D93650DC4

The IS31FL32XX series features an SDB shutdown pin. Driving it low
(active low) places the chip into hardware shutdown mode for power
saving, while all register contents are preserved and registers are
not reset.

Deassert/assert the pin accordingly during probe() and remove() to
manage hardware shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 6c8d6b833260..b34fcef2c173 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
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
@@ -421,6 +423,15 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	/*
+	 * Driving this GPIO line low takes the chip out of shutdown,
+	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+	 */
+	priv->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->powerdown_gpio),
+				"Failed to get 'powerdown' GPIO\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
@@ -609,6 +620,9 @@ static void is31fl32xx_remove(struct i2c_client *client)
 	if (ret)
 		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
 			ERR_PTR(ret));
+
+	if (priv->powerdown_gpio)
+		gpiod_set_value_cansleep(priv->powerdown_gpio, 1);
 }
 
 /*
-- 
2.54.0


