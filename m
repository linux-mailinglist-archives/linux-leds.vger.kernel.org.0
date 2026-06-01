Return-Path: <linux-leds+bounces-8408-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HiRIn6lHWr5cgkAu9opvQ
	(envelope-from <linux-leds+bounces-8408-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:30:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91112621BA7
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 223A030F08E6
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F913DBD72;
	Mon,  1 Jun 2026 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiszMNeP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1313DCD89
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327151; cv=none; b=ByOKYizC3SGYBE5ZGY0cXL5OdNwcFLYS0HzidIMa4Kml3atfgRZQCwLQ6g3ZLgCmpeZ546kYmVCiK7JFoVAbSAgCDHU6RE59Cwe6nDf5blVVqA3KjxUXwAaVUPUwE1nTkp4ib5pIbB2wLsALwUgvZ34eFRv7ZH+8pDDnGCAveRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327151; c=relaxed/simple;
	bh=UtPscoMn7/+u3hgCsxGsK5x29OOmOoQ7cGtI5AS2sAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QG/hFpgrqQouvI84oolRT8Zr4E+n2nk3TglXx5z9EDEnOGj+XmbwaIVI9diUC4CB34Si0H9aaZDGkiOuPow/tmC/d2evHmkkByu5MMIJM77kuUdWI3q7a+aPN/loQeIA4B+PvrS8WUCvXjonduSdxyA7r6XcOoaUeL+q6uI7Xis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiszMNeP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1690637f8f.0
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327142; x=1780931942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y382WZZPSXgqkJt8F6mrSdOVSYmocK83eFeJ1TSWQE4=;
        b=XiszMNeP4wUTqUxFlUnFLah3PuhRurrdvgYAUaNSfjnBlvvHl4pqWSxVXYji1IkvFB
         d/yKXKPKYdhAClOQR2tK7rd6MK0PKTeG97Uq4lP711I9N9hCNI2BFP6N7qWzvyjHc9In
         al2CzUtKFUSIaZNGOZIpI8FLH0E4BJUb5YmBDgLKILvJBa+bbu4E4IvcnkuvDSFQnaHg
         nYFpMdRKzuUytJchtXBfPXAil8EeAdG9FtyAHUiXh6o0PV5OWMnFdXvXhATbuPKKfPtG
         Z1EuUnHfzPSCc6uQzKa9H7DvHB5/7IdKsHlpFTWKT1lXdCDdKXCd043ftoa/GPZL4lGk
         G50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327142; x=1780931942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y382WZZPSXgqkJt8F6mrSdOVSYmocK83eFeJ1TSWQE4=;
        b=f3bjKf+f7jpz2vvy9LEV5wtDsOc4vbn0KtEmHg3zZjIpy0yDSx5HvZXdI/U1iuROEf
         J5Z5o4+8+7YtPOGvtr4JqHELSP0nh6FLp5WM7TM1DUAI2BA9hnYW+URCS/eKVHlX1zoN
         L3xyFxtDC9ACk+GSTqVbYlEC4qZOWRDjLdsJY+Uv9UGg2N35SP9NNbnQICU7owZaWpMd
         p1CanpkMv2XjdhbcI4WeWM4PeRsQCNOwO44O+Wfeba+Jfr2MhK84nUyj8pWeJanFkz7T
         9f73GZ20a93DHIJbO/tTr+HZ9wKRgk8Rw4l8GcokXdymymjhHkMQz7GYpmGrfsGKaT0a
         IREA==
X-Forwarded-Encrypted: i=1; AFNElJ8dnrA60FWO2cAqgOy66aUaMJwxSwlGg5JxkHSGaA3elDiRQLWTYT8JJSUB3rKx2oqCLak1sk+LtuWL@vger.kernel.org
X-Gm-Message-State: AOJu0YyfAOZyem6d6Ulr8U7KyHYny98dMWO/yoqdDmoKiY2f8FNfoarC
	24AccU3azxkKknkMh6NjyxyeofCT5YVxYGPy/tEn31Ie4y6DujJJ8BNL
X-Gm-Gg: Acq92OFtfpZ4u/qKZLWAcS7NprWlxAG8R43RVdpYYAwbQMET6qsec4a3Ktj6Iz5xlBW
	seU7acc+j+rYu7Y6cNqDtGZWsndboDsOuPIAd8ybtZLM7IQObs9y4fS3ODrf6huK2hbTOZgCmxi
	JAHoZNKKAE7voM1HNwfKfM3zbS2oL52P2J+IITTPKIgjyWA0amue+9cGYb06qvq3tjSP1S3PNoQ
	XqeeqbrGgUI7a1bKAqLnfAQ9FDoTtoxMxK0UNYkzAEKWz0uDkD4uRvmrcZsZtOPrDmY0zfOcLNq
	7xCPAnFu257IpF5OtTihqZHo5sKZaum6ZwZKu6eWtBRmD+9qJbJtxnGtGiB6yK9mylF5+sSrS9t
	7panDCJUrFW4bZBs8uN6gI12oVLQjXG8TE2ys0Ppq8GLY/T1wzstofVWeJdphfRLJpmMgTsG69X
	kfqRl04ga9wiyfTj/KL1fWW0o=
X-Received: by 2002:a05:6000:4c8:b0:45e:ea3a:47d6 with SMTP id ffacd0b85a97d-45ef6b93b94mr15555475f8f.32.1780327142357;
        Mon, 01 Jun 2026 08:19:02 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:01 -0700 (PDT)
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
Subject: [PATCH v3 03/11] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Mon,  1 Jun 2026 18:18:23 +0300
Message-ID: <20260601151831.76350-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8408-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 91112621BA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
used only in lm3533_als_setup. Incorporate their code into
lm3533_als_setup directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c | 61 +++++++++-------------------------
 1 file changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index fb61904f110f..52136ca1abc9 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -716,61 +716,32 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
-{
-	u8 mask = LM3533_ALS_INPUT_MODE_MASK;
-	u8 val;
-	int ret;
-
-	if (pwm_mode)
-		val = mask;	/* pwm input */
-	else
-		val = 0;	/* analog input */
-
-	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
-				 mask, val);
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
-	ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
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
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+				 LM3533_ALS_INPUT_MODE_MASK,
+				 pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
+
 
 	/* ALS input is always high impedance in PWM-mode. */
 	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
+		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+		    pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
+			dev_err(&als->pdev->dev, "invalid resistor value\n");
+			return -EINVAL;
+		}
+
+		ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
+				   pdata->r_select);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret, "failed to set resistor\n");
 	}
 
 	return 0;
-- 
2.51.0


