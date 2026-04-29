Return-Path: <linux-leds+bounces-7905-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF7ONTQp8mkxogEAu9opvQ
	(envelope-from <linux-leds+bounces-7905-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:52:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D944974FD
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CCC4316F198
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 15:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0DB3859D5;
	Wed, 29 Apr 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQrP/eqL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A832D0C98
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477513; cv=none; b=DdaDWCRaA2b4ManBK+COrTYLNKfVd+Y6rsWi1FqWhfqIVuS7TuKnqcTWwLxOPSwRwLucn5x8/IsMTmxgIbVpw+lB86lJsHOMX1inIs6e0h2oeWhUaJHjFpRNgXeqUA2SlbG79AYrax/xPY94ImrxqyZaDWQQ7KEeojD/lPUr3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477513; c=relaxed/simple;
	bh=fdv+qnDaJ6e9YQM8+aAyraCAienhNROQ1xibfx8bR18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBZHgEV5IpMQfl6s6wQ4x4BiAuTvKYLJeRqUHlMNQnKq73XeaKnUIveBwYIl8oxdv4VaGVZbxU+fO26EmZl1CXVturFoWua/hjd8jEbr5J7i32hTBooRClYY1GSNcgCrCCKPhJRmd+D+B8dQacT0dj08iqzxbNqp93fNZfNGSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQrP/eqL; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12dca45ca21so6638084c88.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477511; x=1778082311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UAJ4/YxLNK9emKJjm9XoQD+kWFNL0hxgMOdt9XSg/c=;
        b=hQrP/eqL6H8ndusEPmS8NKo+qjG+ejk377ayMY1l9Ao2pW2sRqObkA7lTArG3azpWL
         rj3l4OG9Z0OBfmdnIbIkWeztNGGwn5wEByDbf7Fh+hFvTxCuGHxthiR1DMxhiducKSkW
         YZv+U2b9XS5o5Bytg+dVFdt8/p/SZItetQy7qsU/ZqMHmgsqMAgDIGRd4Tqps77uzh6j
         /Ww0se9tqNhSj1OUH91yVs2cyAIod0r4uLgEFaUV1KPcBkQuDYJrgRMWnjwLM03/B2e9
         LbjAymVx8jF2Yyme7lkRTXZPBAwhujR3oLLvp4tXiV+dPOmjj6WOFLVZ9thWPVqO0e02
         VNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477511; x=1778082311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UAJ4/YxLNK9emKJjm9XoQD+kWFNL0hxgMOdt9XSg/c=;
        b=U92jwr5KMmkjKjH7Vu781f7fx2BuVPLNPr/Hwgumdugo+zMgDnjlFZ6rLa2IR3PZIb
         89Q6gRBM1YbsNfOG8W0rSydW3fNjH4m/3NvUP/oZwunhqB5BlWE1hxUxkBS6f2+qS8Jx
         MoQI+NVRAZYpSZzu1S+/to/QNDzVO4PFgjqW/O0Rsio6hXDOoRpgzzVeZcK7vxa4jmIz
         gyCgm104rviBEyk/v7pl35/fonrPwWhNKzgaLWN7of0GJRT9pnq4SQs+Iwh+fX+t6vqT
         WZgX/GhuzR465HcCdkjWXvaDMB2ya0HFvrP6S6mGiKp3aYoErABZHG7XCKmjZlNda6jw
         2Qng==
X-Forwarded-Encrypted: i=1; AFNElJ9UwTKoAZuXCij4Rsmt8RNf9S/zgS5vFcQWf4Uq3EXycblk0CKsbBqocy32MnBreoxBDzPhQec67HrB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5UFQHNenkm7wSCOuf4GeZuvf0ptTGWCdt9AjyrBQ4Guj5C95e
	/159UHrEf24Cib4wHEdz93Y0parOR0Szu6CfON8XFkpaSukodUAl517e
X-Gm-Gg: AeBDieuGnkQ4rnwYRdljZLaaVIMcd8f9T9pOcknAJLdig5HBr16cTSNsUmnm0zOHrcm
	0sfzFMPrYMbUApKcHftv224Cd0zcOIMqwiKFmh9RFQB+DS8dZhJHaPrt/KkJVDdfKleFaNfpAhC
	Yt1EyLmmo9YNAVCD0EKzcQAeOomB550rMkcl+wuuU7b+hmd4oWP1SJZy1vQpYcLPexLXdTqGkQD
	1D3LPpPRXsQJlctSUKz49ndj8kKr70uHnrvyQdB3WROPph5MRGMmjoh/Oee3DEIXBuw/elCYjp+
	9bcrgQXX0BdqlGNtzfyHYdc+x1lhZG0L6zDaA2A2RHgAE4xjkm32Ikj2mSPWmRzI2tmpKjlbLLv
	Apt52Y71PvYO1n9onlexjATPqoW9hhiF3O/gPjN7o7LG182qox5pNG5vXa/SmsUg+saoNIW5M8C
	kqVVhiYkOIES+YosIQ81I1TAJS0O3WonxfkFSbGvIGRg==
X-Received: by 2002:a05:7022:e1c:b0:12a:6e97:c21f with SMTP id a92af1059eb24-12ddd8e059fmr3574801c88.0.1777477511309;
        Wed, 29 Apr 2026 08:45:11 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:11 -0700 (PDT)
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
Subject: [PATCH v3 4/5] leds: is31fl32xx: Add powerdown pin to exit hardware shutdown mode
Date: Wed, 29 Apr 2026 23:44:48 +0800
Message-ID: <20260429154449.730880-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 33D944974FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7905-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Drive the pin logic low during probe() to exit hardware shutdown
mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index fe07acbb103a..801caf2b2e71 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -60,6 +60,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *powerdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -421,6 +422,11 @@ static int is31fl32xx_parse_dt(struct device *dev,
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


