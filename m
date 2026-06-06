Return-Path: <linux-leds+bounces-8515-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VLgYHzGpI2omwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8515-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 06:59:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D0A64C6DF
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 06:59:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GGpYP5Ht;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8515-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8515-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5704C3047361
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18FA30648A;
	Sat,  6 Jun 2026 04:58:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1BD2F8E9A
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721901; cv=none; b=aBDJqtepwmCahqT4LeCcshSXAxrTyGlUQDM/VKEAnlNu73G5mjOAir339hY5dPNPaa5PGaZRbAFbwN7JU+OOPtlry/JLxtDP4FXcNDw/2RLgtjEaP189/C2llP39KO+aRYz0q4U+pclwnenjSy+CV1nPigPx3Emj7jXiupesR68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721901; c=relaxed/simple;
	bh=YRqN1j/Uc0jI/GiT/Eg6MIuncKpETtLQTmH4/MsCOmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRFprPhdN2EO9AV9XYuwRi7r/cBSrFHa2nsFpTnKh148lVE/Se1Q8a3bbvoQ5uvE1WjPLzBqQ4sJOhfSDu0ucr6F/1+aDsKJTm/335P520z7fd4LH7RSTonrwrLmVDebNb8X0ipmpp146N2+7/5P/3zrGvTV8LGXqstFXoW1hi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGpYP5Ht; arc=none smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec429c2bb1so382371966b.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721899; x=1781326699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqXfwtTZgGLv1WLyA0/ZZTY8n+25azMFw/42UfL9a9I=;
        b=GGpYP5Hts8BID/r58VqOnLfMhLRly5Vmj8qSNLiDFFwEjswkhc4HCDjOXeWFWatmP9
         yvLiQ1jQEV19MU+UnmyL9bjo4v5y3gJoOHPfBQgkHeUe62rdHtEALKm4HQ9o6Si4sewa
         hEfT4buYJVM0PY+PJlsvN1354HUW7TXzqzBDIhoEeZbYJ/TMUAZbKw27D9x3BdJhHJha
         yRa8K8xdVm4riCMEmGygbHMNB14wxud/CeMNz7FKnrc/y9O3g1yTkTMfnpbCWVqjj7ex
         ZXqJM5TGr5fp9+V0M2ui5TvCWRVoLnSwr6aLn1iV5lmcHyjyeU8qFrU25Xm105gdl6Q9
         Dwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721899; x=1781326699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YqXfwtTZgGLv1WLyA0/ZZTY8n+25azMFw/42UfL9a9I=;
        b=JFbHeVh1/tRGsWCJAtfSRy89bwJ8nO6weiP2xU6NXi94jcxybI13BgbazLdbJE251f
         BDxqlP63IoVhsXWbhHSBH3GNWmDqjylBJWv80oiDRUb3w7JAzXZBWYVNMRKLAxwFtOfe
         cuNOMrC7pfiAGhT4IsltFIgvSD8iDgQAdYMfgBKhTVqjuBHYaNvUwJfI1lI0MqD5Io8B
         Gy6TQNUvn5l0J8YITve9qWPWDWuLiKDRGzqWgzUhlQ8Lw8Q6Zqc7Dew2qiH7q3ZgUACX
         obB3BZaQ+8KygJJHd1McCXCdhCt8wKlk3vevl/ySO2TZSTAT879ZDgZYPfkZwoUK99Ll
         IeAA==
X-Forwarded-Encrypted: i=1; AFNElJ8UetVy64OIXwlEAvepRj7BxZ348sDjIt6meFTwOxXRxGqRis6lHPKdb6UK9typ2DSLXInI57UsKvqS@vger.kernel.org
X-Gm-Message-State: AOJu0YzrsZRPS4Xh+izfODIydU5nucRJPm+dL6xtjT3F2VvdToK4orDi
	tivZWlzaWmHNaSJzhD0AkAXikuQ2ytg7zBcBvjJZkeI8wobcb0k1etmj
X-Gm-Gg: Acq92OEE2chSYslis0RBo55KD9xxK3LaSih7ljka65plojBTFq27YM39+byXf7UlJe6
	2MDaz/uTIGZfzRWWxf6QlOUwfoGo8vP/J99eTpaGBl/0RLkPuiFXZmRp/FW5QVwAz3xp4K11a9q
	9hCUPbxmZ/Lf+ad/uFiMtv590kRRYJXM4n2Q2Cg0qzrmZZDkdXaNwuyVarnlQJdfr6vk7sC7Jig
	LXSJN+ta3otqsW/pgPwjPwUqNwpfml5xF4UTRuHrHeORFLzB/Gy2x1ERKrqmETV0XWHIhWzS/GX
	iPHzok554RZ22EYVOEcR/W6DqUUSrlzCn8+Myo9KnzgF6c3o1tgfkJKeIQZMhtE8Cq8UxPwtYzy
	98SLvB1ll1ZaAOJknWWFBfTg3RcdTvNIEQLu1E+x2nP1sMTOSos1HQLeTZGj7jy0GQ4rzEX820H
	UOaVLDR7v3DgjGJkIDyXl25hc=
X-Received: by 2002:a17:907:60cb:b0:bee:4562:32fa with SMTP id a640c23a62f3a-bf3708686cdmr334213566b.14.1780721898847;
        Fri, 05 Jun 2026 21:58:18 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:17 -0700 (PDT)
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
Subject: [PATCH v4 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Sat,  6 Jun 2026 07:57:29 +0300
Message-ID: <20260606045738.21050-6-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8515-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25D0A64C6DF

The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
used only in lm3533_als_setup. Incorporate their code into
lm3533_als_setup directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c | 51 +++++++++-------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index a9af8e2b965f..c4035d1c8d57 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -708,54 +708,29 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
-{
-	int ret;
-
-	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
-
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
-
-	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int lm3533_als_setup(struct lm3533_als *als,
 			    const struct lm3533_als_platform_data *pdata)
 {
+	struct device *dev = &als->pdev->dev;
 	int ret;
 
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
+				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
 
 	/* ALS input is always high impedance in PWM-mode. */
 	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
+		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+		    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid resistor value\n");
+
+		ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
+				   pdata->r_select);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret, "failed to set resistor\n");
 	}
 
 	return 0;
-- 
2.53.0


