Return-Path: <linux-leds+bounces-8516-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OUg0AMKpI2piwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8516-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:01:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5364C74F
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l1+nCZh9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8516-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8516-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFFDB304ADE4
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434612F8EA7;
	Sat,  6 Jun 2026 04:58:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D25830BBB9
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721907; cv=none; b=SdXjupvfyUgS4yTWyPq5uX15+qgZOvP9anr6UfxUOkQrml4ev+g3wYoncV6d5X9ZtuTv43Mf+f240Xg+Zi8cuFIbqX8C1jw6/M5ONIalpb6DI3wHikk3wghRvBaODMuvjqzIadp4JHHe1KS/2+QLTml2XYlVU4iT2FP//zw+l8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721907; c=relaxed/simple;
	bh=4z8TZ1ZUPM43BFkNRD7i/+Vv36ZfSXtks2zi9DysJhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdpbsBTv10qjkMertNmoaawsmLDPg5N/wAourc1j/gQCvBcobV3EetqiYViJUelYdrEzTWQLLBgo9kABHSOJiO1d0tllMK5e32a/ui8P6R3ZaR7ju/vFy4Wveu+oSQNa85sy6P42vcn8hJaJeMCo44mO6bTJfPc1w7JRGvOCXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1+nCZh9; arc=none smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec423a5265so419969566b.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721903; x=1781326703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS67jochwubseohJgYpjn1pYUwemo5z+ytbVISXPDzc=;
        b=l1+nCZh9V7/wz6JtkQQ6PBnqXL/wtVrqwMlhOqOaVMYkob9Wpupqqjq0mZ0KpL26B9
         y4b4hPJFKh5sDnxM5QFJd99qkzPoMCE/UKzvL714iLWhyhdeDSnnXugP8R4JYN3d9EcJ
         ySja4FYQ7zoU7Duh7m26VxteXMBx81fYQSihfnZZGaaYPq6edxOQpzHZQGmM+fBWPg5Q
         oP7NZmfCcvzd0RH6m6sujxTI1jXn0aqUxv3ttU4o092DZoQryryUlo6M9y/rSWuwWthG
         V8FMQPaUZiK9ajYwkKkEERFQv23w7jGIsa2b97/FQeca89ief8a4ePr2tTHAOKAPGWXh
         /fDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721903; x=1781326703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wS67jochwubseohJgYpjn1pYUwemo5z+ytbVISXPDzc=;
        b=azolhpecLz28erN16+nf4Nm3nLL4OCic45e9jzemXvljKDL1Cx5HJuDB4CShYpxZJW
         g2KL86eIqcXYxzWMSFnUL8xriAphB6PVHX5je72l/wmCr+bMEN4im//1O+fTmPB0lj2O
         K+HTL6Pgaw2YUFnxQeAzulqylkuToygdsOQl0AchAo/wd3nNjQRM+Ipbc3RhpSnj+tAT
         QWfbX6VkZJwcXTJ83PRUo1tZJArXcRsrg38L+x1Skc/nWQ5i08OcF45TIgciw1f1SDda
         wvZlSjYTKMDk44DxJbyBv+b0XYBoPsrArJxXoKaQI0nIUAsRvEL5d13ANkHOWGCAg9Ws
         MRYA==
X-Forwarded-Encrypted: i=1; AFNElJ+vAdOSWRu0dqdPdPg9mjTvmSsDaZqyrf1BsSq8i8x+cm/mNgXxldFVG3kwjzECxCnWpeReaVVG8HTH@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkBSBNLcpcRclSlBXn6fKTbHJhGx5aKMh5zyfQnCJT4XNivfT
	7J8OBRoK8cENP10fp7GnB24yT56MQMxvtVx8SAI8woof/zlVNH2zLzKr
X-Gm-Gg: Acq92OG/kAjVHAPuSiLIhwZs7NnH85+nRsgse10N4zknbxBSek29xJpScVoY/y5Hwqf
	9QzbtsRNaUTyvwP62AbvogpreLHJ23bCslVCOoHuRJEbdTkncXL084PHeEGGUFg0Uf6XL2sociD
	U1CCm/7R+hHXwQzKQ/tT4kYHinla+UI4O1SGFdVfCBQ3Mo3s1r/Xyts+/YJlCFStKmCPi1DyJU2
	8AobcLOB1UQ+F2nAwfBIb9sLwq010kg55JNkt8lUc9938VPPVr66CnUFMkMjH6upkNAPTiJMl6q
	dxJ338NYPs0l+KeuEGF/xslMVd8EIn97VHTEmw+bS2o/G7US2sF4WT79QbmURYDiFNV4Xj0cIbP
	RTLJ4nyY4UmBgWY3850Iapzyp2tEJe8c8Do3qzuKZXL96NUNlZobaJGoaIyE/CYBAYrf5ElHJ2h
	E2T//dSFbwEYKqt1/34Ij7u7k=
X-Received: by 2002:a17:907:3fa1:b0:bdd:378:3f2a with SMTP id a640c23a62f3a-bf372d28da4mr313211866b.38.1780721902322;
        Fri, 05 Jun 2026 21:58:22 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:20 -0700 (PDT)
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
Subject: [PATCH v4 06/14] mfd: lm3533-core: Remove redundant pdata helpers
Date: Sat,  6 Jun 2026 07:57:30 +0300
Message-ID: <20260606045738.21050-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8516-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BB5364C74F

The lm3533_set_boost_freq and lm3533_set_boost_ovp functions are used only
in lm3533_device_setup, which in turn is only called by
lm3533_device_init. Incorporate their code directly into
lm3533_device_init to simplify driver readability.

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


