Return-Path: <linux-leds+bounces-8625-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id La/0GmZUMmrIygUAu9opvQ
	(envelope-from <linux-leds+bounces-8625-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:01:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC706975D0
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q5FvIMP4;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8625-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8625-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B70313028253
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6559A3C8182;
	Wed, 17 Jun 2026 08:01:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24723B7760
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683259; cv=none; b=jn/aSQw+9MNJxKHqFCAD3MQAhrqM1Cj/wyjaQRM9GW5/E/m501xNc1UimWIqRHU/KSDWNJf7w8pxbiPDkE36l+Cvr9Y8q0D4WV/4YUP9TnhWZ2DQMhvFNrsEsN8e3QJVDsPodn29owftHbADqoPIo3mq+svHVqnsT1l8odelMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683259; c=relaxed/simple;
	bh=BwWYKnYatgp0/f3D570qVWCNy9eZh1sTktWSktle2dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWVoLya4KVKpazEe+JuDUV47byAOszk3iS7OpxNdDjRvyf5u0DR9tOIkzbS3k7ZCi09dL3TS0i+eXwOGvw+hEZVrTGsQAw4hAsvDTN+oVuQ4pQBnn7aV2tDxtk2FrvmoOpqR2aiiSXn7bc4XwiKmP8WAXeTPOtgYVeB4hVhXMss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5FvIMP4; arc=none smtp.client-ip=209.85.218.50
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bf1141c26ecso652514266b.0
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683251; x=1782288051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8y+i4Wk6Q8lVb7K/zxazYX8oolr+QPONOjz4+CZ6S0=;
        b=q5FvIMP48mll3yVpjAuWYJ3T/u8Cg5dIq6l67h4fvUg3PiilFeHS/nBCe7KHm8M2nM
         Uw6BTGaGfd8U7E+7yrdpvDibkoKmSW1uJaJbWTDZiicaqgBvJG6suX6gkT4ul/q1vY8a
         KwvRRXWHUAY3HgPapPfOu6PCw4Bo4quZLc1xxm8bLDfeabnMf+CYz3z/KqIMjp3lcU0m
         d0YAQhg5bS3P9346WFMu5yzpdSeMkQRrstkj+AlCbaAQBMgFuVRvanArFdAz0sFbAjkw
         Madl+Dx5oaB5m2CXiBeH64ew2UakvEOt9V0yJ43GlGY2wNHo1TlyN2Y+YE5emmm9bk6u
         wO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683251; x=1782288051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8y+i4Wk6Q8lVb7K/zxazYX8oolr+QPONOjz4+CZ6S0=;
        b=pfQT/RDbytpLL5peBnxlbn1+ltF08ee25qoboZ6Ag+ZlRfz/rPnNw5g1R/kd9U0SAb
         8WZmiTTT4Va5MLYEqNb1irOBBY6vaQPdgbXJkB8MH66pxvG7EbdymS8yuLcNE5Y82a5k
         qEcxXTNAS9TPHDJiGB9/Lgsi/40ZAGTD79m407C5vMgGqr6bjs2USEMQVYtruEik6eVB
         1XhnYY4ynagXV14yqNnN9yUDpK6wjtnASheiW1rgtYgVT5ZzlDjrwo0wsiLAfMb0jhJD
         4RsvIgTce43JRaQWKkSdcijlhpsn+wrAWw3RilyV3TL7BOXPpgGOesiRAryEC6wWKfxN
         nrlg==
X-Forwarded-Encrypted: i=1; AFNElJ+rGQ/1/ZT76wM5Sdt2UzwfylncQ6j51O9PT4SA1/Z4cXoWN4WmQ3Qfa9W+g8Pml46ZCFDIcMPzHqFc@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLjDrCmn8+a5FYBFGFzhnxlFKeAjEspwjfPSdqAeCW16XTk4n
	xK+WKTRSUnJMW5uD8qGuaA6loH0bzOiM1prQj9iGbAKH/sukaydu6UVB
X-Gm-Gg: AfdE7cmKG6jFoEzgt1Q2upqAg9kGbRRkQeYWwZRllDyjNyQQIGwFZQZ2RywaHzBZ+Ng
	GZiVn7BZUL4qJXIeFYOGA9uyqyV4hHgoh9U/evm67d1hGXlg9vIALS56MLxGz11VInoremmE3r1
	r2fDjtCojWdj1Ww66o9kyjqwXz7/Fln7ZSr/1ARorobf9mxOcz76jFCqFbtkMRv5jG1yKo0ynUu
	NpmfdfHfez1ElUkIALsYBGhO/2saq/sOAkPobOk1mUPTFH7joWT7LKZvjaHZoQ79M9f74vsjfrz
	5wV1qSzTB7dzn/eo2vElP2drn/84rOztch4nuzh1d8rbBfPn0yELfQ1RV9E9/H8OE1YmE3dNBxS
	d1Oiz8frLMMM9A/lCpNis9zkXkM/m/66ZQacHbfIvsxH7hM5p+XH2akM/UFJvnT1cKYFfQs1+BP
	6CASSeNzyAWzZN
X-Received: by 2002:a17:907:d02:b0:be2:d66:eb4d with SMTP id a640c23a62f3a-c05a7abd063mr208115166b.44.1781683250733;
        Wed, 17 Jun 2026 01:00:50 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:50 -0700 (PDT)
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
Subject: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
Date: Wed, 17 Jun 2026 11:00:23 +0300
Message-ID: <20260617080031.99156-7-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8625-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BC706975D0

The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are used
only in lm3533_device_setup(), which in turn is only called by
lm3533_device_init(). Incorporate their code directly into
lm3533_device_init() to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 57 ++++++++++-----------------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index f9bdc0a1d9be..45e7f7481aa0 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -80,35 +80,6 @@ static struct mfd_cell lm3533_led_devs[] = {
 	},
 };
 
-static int lm3533_set_boost_freq(struct lm3533 *lm3533,
-						enum lm3533_boost_freq freq)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_FREQ_MASK,
-				 freq << LM3533_BOOST_FREQ_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
-
-	return ret;
-}
-
-
-static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
-						enum lm3533_boost_ovp ovp)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_OVP_MASK,
-				 ovp << LM3533_BOOST_OVP_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
-
-	return ret;
-}
-
 /*
  * HVLED output config -- output hvled controlled by backlight bl
  */
@@ -406,18 +377,6 @@ static int lm3533_device_led_init(struct lm3533 *lm3533)
 	return 0;
 }
 
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
-
 static int lm3533_device_init(struct lm3533 *lm3533)
 {
 	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
@@ -437,9 +396,21 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 
 	lm3533_enable(lm3533);
 
-	ret = lm3533_device_setup(lm3533, pdata);
-	if (ret)
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_FREQ_MASK,
+				 pdata->boost_freq << LM3533_BOOST_FREQ_SHIFT);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost frequency\n");
 		goto err_disable;
+	}
+
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_OVP_MASK,
+				 pdata->boost_ovp << LM3533_BOOST_OVP_SHIFT);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost ovp\n");
+		goto err_disable;
+	}
 
 	lm3533_device_als_init(lm3533);
 	lm3533_device_bl_init(lm3533);
-- 
2.53.0


