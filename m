Return-Path: <linux-leds+bounces-8162-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOlONbhxCWpJaQQAu9opvQ
	(envelope-from <linux-leds+bounces-8162-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:43:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52855FB5B
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 848393007A7F
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAA23148C2;
	Sun, 17 May 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLMRetIP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F531355D
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003819; cv=none; b=tskYi/o2h1ALgoCmuU2N3bCMOtD4AI853K3Ilo/belL2wZBSQCvLtyhCjlR4BlynJXEAU8Vf1zXlXtE+2UCDChWju9oIKg3ukfToqzbMsMPlT0Hz95OUiKBy4lD1g1ZOUQEmbqOMEDQd3cUDrjz/Ztn9Rf3d7nKg+FGOEpXCjho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003819; c=relaxed/simple;
	bh=oH4r5AK/iPEQl02poYMM4nYKVOSVc+BYgsBQehbqz44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVRIGJDbDILRNDq3S5GsQXez1a8S/TsT7Aiex1ihWMbhZlSKeNvrrLYczTNGBHenbBvYhBrdpDBEYr9cMdUrpIU7Ov6P+4nHkihsQSbwZwQHWGvZb9dB61BiMTmSNBri5odB8OaQqilbuqYDvZ237b/Kb7TImJ2CZQNAmT2hCmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLMRetIP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44e1860558fso561103f8f.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003815; x=1779608615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCgjDXarYti7vTNUFmsGSYACwS96Ny5FHsWUIJ695K8=;
        b=PLMRetIP4UM4g8nu7qtTeUoNZnfGz3U40p0FB9Mw+JtAUo54isiMoEqn985F+GA8nW
         xJJIjVVQeNUXMCMKBd8xi87QGbmHgQFwz8oLGzAC2X1CtD8DRUu4YrMzIANQEDAZQcqB
         akNFYK1fxsT+FK9srY8Atjm/D/+uqR+/ZpkitcJvaeESTmErJSdNaYGLbjUCXzYPx8ra
         iAF+TJC8Ke+9455cRHV644vkFOVRForE/KUOphvgUlg17x4ZdCSmqT1D/QJLXLghwDz6
         tJ5p2MmN/1Rg8+afj0k8p11Ikn5gJAJW/k7v47I6mGFS/eNWCQZVQH8hBiLLq3voDNfG
         UY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003815; x=1779608615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCgjDXarYti7vTNUFmsGSYACwS96Ny5FHsWUIJ695K8=;
        b=kPVhZd5tGRjQqC2mw2w2zkxfxfLOarfWpanS7UoVGHuy7ElzajHBc1LU1jSnLQ4lZt
         wanT78407osR5+WhyUU10C/ZbBVlyQKB/QcF/EHwtqtasLFrqSLv8cmar8N+LkANZ8tF
         UkdjaZYS/p+cjspxnmYLG6BB4YBSG+XC8p1diF1gZcB5cKyYBUTlLXTNAfTVhKbgzasY
         w0CJF7cYXBBctWDHprBkRb9SJe+j9RaNrUplj8PpVtp/ZyOPN/trxEsBcv53PCsgLRlK
         uuJzKlGizTjLMnyj691LUQcANuYxDoCR+7MJk0mjq1UWxhfVXK392nenNNvdUWc+a9P0
         KZ4g==
X-Forwarded-Encrypted: i=1; AFNElJ+Q4XJazooBl9lUPGSQb5zIHgS+UFVspSy1Q6XzLOwjyuIt6eUevT540ESwYJRo7a14FCPwxkUi4mJw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyubx/clHZ6V10UWddv2oy1UC/y0f87Cr3vOAaEWTycqa9pUS8Z
	MPex/8lEN6cUz38zV/xIOj70zxcWloHHcqCAV2TdVGjYnEXDronbJKJV
X-Gm-Gg: Acq92OEmNM6S9Zs7odfcH/Omc0ffxwEDyil/Qr2/7/yliW/UbOazKHjSXeaINrtTLz8
	0OOA1aES+wnaQWeJzl0rc/D2AJMNRo6ci+4UdBzj9yTa+LPd42UibE8xByolYKxNhpnct81MRCy
	OYuaNwogkKG31HgeI76mZgYEXGQtWKsToEHIJJ3C+iiau0TlQY7GvuMmTnDb0J0fB31Dmsym0L9
	rGSqI9zMkvasZ1t8GnCSAcYKt2XJXcHkpkmx08TZsCQ9Nn/aDDIIEHy1gGh/wAETfOrxIR5M17Y
	CK8dlo/5Vp1nD3YfVsQQ3T7PmZCtmv9ZB5xk1ODNl3FN8Cye9bASdK8GNutYHWMzBoYGDtFC0Rb
	o4pZc0yF7E9iMzxel9Pk+HFiVjm7WxyLCu+LYpZWAGN63SLe7Iq8xhnMpC9nw6cQDyN1n8qKAgs
	EjwXOdEpocc70B
X-Received: by 2002:a05:6000:25c4:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-45e5c589d93mr16397649f8f.16.1779003815037;
        Sun, 17 May 2026 00:43:35 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:34 -0700 (PDT)
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
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 3/6] mfd: lm3533: Add support for VIN power supply
Date: Sun, 17 May 2026 10:43:03 +0300
Message-ID: <20260517074306.30937-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517074306.30937-1-clamor95@gmail.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CF52855FB5B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8162-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 22 ++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 83ebd780f39d..131eb1a1c8eb 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -173,14 +173,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	return ret;
 }
 
-static void lm3533_enable(struct lm3533 *lm3533)
+static int lm3533_enable(struct lm3533 *lm3533)
 {
+	int ret;
+
+	ret = regulator_enable(lm3533->vin_supply);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to enable vin power supply\n");
+		return ret;
+	}
+
 	gpiod_set_value(lm3533->hwen, 1);
+
+	return 0;
 }
 
 static void lm3533_disable(struct lm3533 *lm3533)
 {
 	gpiod_set_value(lm3533->hwen, 0);
+	regulator_disable(lm3533->vin_supply);
 }
 
 enum lm3533_attribute_type {
@@ -331,7 +342,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 	struct device *dev = lm3533->dev;
 	int ret;
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
 			    lm3533->boost_freq << LM3533_BOOST_FREQ_SHIFT,
@@ -453,6 +466,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
 				     "failed to get HWEN GPIO\n");
 
+	lm3533->vin_supply = devm_regulator_get(lm3533->dev, "vin");
+	if (IS_ERR(lm3533->vin_supply))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->vin_supply),
+				     "failed to get vin-supply\n");
+
 	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
 				 &lm3533->boost_ovp);
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3aa962d4c747..e355a3ac982e 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -28,6 +28,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.51.0


