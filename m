Return-Path: <linux-leds+bounces-7871-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KsWJjUd8GlYOgEAu9opvQ
	(envelope-from <linux-leds+bounces-7871-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:36:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143A47CCFD
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A15300DE2B
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9D1154425;
	Tue, 28 Apr 2026 02:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky+fC/NL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9B3921ED
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343673; cv=none; b=glom9xbhacQo814PfvBQ0JwJjs8dMBstFeZJNJnKXNoEYfOPi1D4D+dfaPh0/znGTjWmNcllOZLnjxmoSFxdFnjI49fSSw4DqKSsEee3VDXO2ibKVE9wlcVMYaWUU8ecBaAPKmzyv3YE07ZL2jAF2upsSUd5UiIVzur+RZ3dzVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343673; c=relaxed/simple;
	bh=Wj2asEhQquK+fSwcH/j3WIHVOoV8HWt1sMZeo3rKa6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIovPtEP0+e5GUP8eZGISZJk9f7jVoCGAf6j9WigIAaeaC6dMFCRlMCJ5qJFyI/oBpts9MmoexGJ/i0/5VN564rq+Ob3hszxSJdiyWVuIYVgTsWaTUU+C0o2I+D0KzbIar2bpoD1oq/pWuyMAurlrcxeVvSyhsDLCuxgzS4KasI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky+fC/NL; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so10361240eec.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 19:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343672; x=1777948472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=ky+fC/NLy5lAiw9mqH/QUNzVh20IKI6PP3yK/krabai14jX3CeNujl3HuYpJcuJVAM
         rbpHI3VaZHasnd7YVrzI2wSjb5WA7WQhzPlqhuiGi8eDM0bzRdqZx7uq6jyomjQkjp7l
         O7CYrBCMBDSyNC7e7C5ovOfM2BDo0v3x21ZJ81aXDWpW2rWeSOBnnoY4AU99czngB/mR
         rsCbcI/cv036/7S4IZPatimyTFLN/eF+GRKU7AvP+sf5ZvDTawDbmyH59qXZOoy8UPnQ
         Yuvt157+kmCss+Auy1xVN1HkMRo6zJuF2cqlZVjYamTiAAFCQvT+Dd++13nGy5zHPaUx
         4mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343672; x=1777948472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ly1kTdTsdBgzdp71diysp7YHSBV9sCg3eeeHrpVV4BM=;
        b=cQnP2Egv89aQu4sUeCTdJ6DpyQOZRStA5KWJ2sCbMqO4pPE/idSuvYFa7mkFd/GGTx
         f269WsLPBK1fG8A1DlsVptDesjLWHWftDFWmY9rUB+YKP5s4Prd2XZKxd6oGgj+W33L2
         WPvAa3DXr1VesgQ+IS6o7cyU9ltZWntKbqVYxB5JGamuUnuU7pNWhbgcusLANz1keJPA
         sdfgU4Fk717aUd5+XH33FTVkhLqBGBa9Sx1qxNE7R1xex9ilb3zftt8mW2idtZCDbqYs
         dzqBxtHFDxvOLsAYXypuR5yLvBideGvyqvlHlepB0Um6QUKeTEMgw6iFspJq9MryuQK9
         A0qA==
X-Forwarded-Encrypted: i=1; AFNElJ+OuE4ZjIkrOVAGrlHtciln2K52hpp46tTQkO12C8v4Nj7Gd8MXNTU9Gox0RdSaCMMOyxg40wevWj7U@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUCEJ0rleu7840UInt95Np2mtL/r6R18WmHm72STkFozAxBhy
	+uLWp6nGcqhqnKt1hINy8Mnbe898ItNIIVID9RMgsRdW9+RPkdzYORYe
X-Gm-Gg: AeBDietiNmKJAW3t4AQCU/oMGcGfTejyKZQDrK9pNv4met1uV4OT6EeGp6KOQsmAFEX
	8BvB/xFihTYemI12MtTFHUUcOjPl3BL7jQ25UAUeHE8QkXZ4CcmA/UEoLrsQUvtQ/G1gH8nxijZ
	Wo8eAX9LP6Vekq5Io6eredtkGCYPV8x89H3ZgMkML7UvF/INIVo5y4AevtvQeVTm8y+r+1I6Yk9
	MxImjc7vbhXhj+u25fwrtcJ7K/ZD0F7PxYXUMldqC8V/kKRAmiNpu5mLbunWzDUOVw1GLZ2juHo
	9XJ+IIuTJj/2I/j9rbctP5CkIsYW4C9/FRuRBIS5QkP31U18QsCj/VqP/OAslx6SMUp9ouZIk5f
	4q9ETQpTgwNx4CNaXY6/XBMJw8sT5PPhm0NQhMNfQcynYqKFWMPfuNdBcCLdUB7088nRl2eiq96
	HaV74kAxCvQlTyYFDYbnowJYMrF/f3i6zhrdlQttkQOQ==
X-Received: by 2002:a05:7300:bb07:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2ed0a0ee88bmr621869eec.26.1777343671664;
        Mon, 27 Apr 2026 19:34:31 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:31 -0700 (PDT)
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
Subject: [PATCH v2 4/5] leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
Date: Tue, 28 Apr 2026 10:34:00 +0800
Message-ID: <20260428023401.330308-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0143A47CCFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7871-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware
shutdown mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..d2be996dd4ea 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -60,6 +60,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *shutdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +422,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	priv->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->shutdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->shutdown_gpio),
+				"Failed to get shutdown gpio\n");
+
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
 	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
 
-- 
2.53.0


