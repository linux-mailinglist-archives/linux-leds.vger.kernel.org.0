Return-Path: <linux-leds+bounces-8631-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +D+xKCtVMmoKywUAu9opvQ
	(envelope-from <linux-leds+bounces-8631-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:04:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CADD697694
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:04:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j55C8Dpw;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8631-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8631-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A7C530A20B8
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3E53DDDCF;
	Wed, 17 Jun 2026 08:01:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E03D5228
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:01:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683272; cv=none; b=hJAa8LA5f+rlTlQ9qdPK9ITPqWFLO9rfIIuKqyt4p37sh/VdPhdO0KW7N83fThCi5d6deQvE+ptd8oSB5gguLSwu/VCmR0+f16P6aacOrIIXWQkOdL0Vnl5A9RjkE8OflMzUoyJBWgm9njRd6yPlWlmw2ic/KyQmySDlBMQa+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683272; c=relaxed/simple;
	bh=Ls0b0vD2wig6OC9g77u6/BGQVzYqGOsH2nEh1F6Jtno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXzz/vuukbUwrGWGjcaZXXF9jk3AlLxnOrt1wE46HCvS0+I2aJCrS87huuNngAMngf7DQsG2M3YTnqDcfaRZSuDgdrQkUe7XL8HOenYRNWMngujW/CkK8wrRAkuEI0MLHppPSH/dsPSK9/HGJp+ufkKuj9SosDr8Kjb8ADz6fig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j55C8Dpw; arc=none smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bef47b1ac01so812867166b.2
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683260; x=1782288060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTLq06Trmxaj5LKPvLHLVj78rBrJr8ohTB02upYl/fw=;
        b=j55C8Dpw4JAjpowjX5MRGoQSu11jbYYeo6Zl4jngfa7KhsF/kDxBkNiNIbB3DDTU1M
         wPSA9RLVxsiaY1PpRPGEzt5DVTEr0KecZ+S72Qac0e98lOmV+U62TisaDvJRbgQ+0IQI
         S3hhEjGK+bz93ZR9xIXDP8vPetOaFqWE19npJqo3Fe8DWRDe3hu1+iVpCzJ8bePJETXB
         NNDicfx7oQGavFEabaO8h/fF9m0Mpj4JEsuMdYNFBJE9tptyGMwJs8V/s/6DOGGWm8Je
         PKkPTUxBYKuBCoLElUszqDDZMrSn7hpTKsL1EqbeB6vT7Fn/j9YW7Xm7B7uxqp5+fGJ9
         JZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683260; x=1782288060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iTLq06Trmxaj5LKPvLHLVj78rBrJr8ohTB02upYl/fw=;
        b=qmr37lbPzYKiqrLz1wVRvu2Mn5dIK1j+GsRpJiYNr6GIuZ78wFk18LzAPdPkSdVwjB
         5S0xtZ6WSAS5ZTjtHRPQ5WE2Jj6nHlY6S6A6qYaO7CGFmsZ0WCfzT6uoBBSDvVsrBnw+
         BqdCFqeZke8OGPUEouB+3jdprxSMhwpIwpUqvusbqBO8su3c7ua9WQbhOkl5ppBFos14
         RyGa8+DSs117ZadLWMN8LPDGVVGCs79sBuNl07qLlw70wvKWTO3v7ZHKrqQKFV2ZbvU8
         jNpnoWPxhZotZuCbCcQfOZSdeL4rFhIFnd5PaqYf3bbHfgtp2IZcOYf7Sovt0F441oqB
         tUjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yFp4jimD27GrT1CsHOgvRabwhiJDlI5GNeRVa55kPYrnClpJZKYmFqHfGYPq+8iNNq54qbiqi9OZo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Q6uWxYYsp+XlEW0dpYo2Cgfc/X9nbC/fCFIUKvgHDOCZYH9O
	hMbifyubrHF9p4WzTKOPX+MCO1uGIgt5osoRBclXyXr6qfod3DiszeUS
X-Gm-Gg: Acq92OHr3yPjamiwh+f7vDhO3zBtWZw6kPQhMSmznLfPf/pBO8YAsqVmg8ef7XgeT7E
	mqMcNKoBJJpprTvlfhBozOHNDuV7ufZVcJMNrvRNLPaiLqycpf5DZgn+4Ti1sqJioKzIjcADOYY
	Q9DQUVMFjwDIS3m7kv/6mGKVsFWC3emlJxB1ox/OICycimGySCrZTYYC6tiIxCu8f7jrRtR7xQY
	qzrOIAEnkGo7kUN+Wsf1WpOuOCP90JsM7thtO6cZhTT4gdOfuV+s9nbQatZzwhHiNlJPSEctWF0
	bo9HXuxrjutGbllXVofwi8MqR3koVBJN/lFbr/Adgy1+Xc4S4Sl1unlm3xywggK2LGUd2w1mRRE
	Mbr12lWaiPCsbNYA9/Y4VafOPPTlTaoooxvs2p3f+OtgrfQExF21Mq8MESWvnoebjZX54V7Ip4B
	KMiw==
X-Received: by 2002:a17:907:da4:b0:bf9:ad4f:4437 with SMTP id a640c23a62f3a-c05a6105803mr189014466b.3.1781683259392;
        Wed, 17 Jun 2026 01:00:59 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 12/14] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Wed, 17 Jun 2026 11:00:29 +0300
Message-ID: <20260617080031.99156-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8631-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CADD697694

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 9eb0db640948..d003d5802508 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -37,6 +37,7 @@ struct lm3533_bl {
 	u32 pwm;
 
 	bool have_als;
+	bool linear;
 };
 
 
@@ -231,8 +232,14 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), bl->linear);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -286,6 +293,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	props.brightness = default_brightness;
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.53.0


