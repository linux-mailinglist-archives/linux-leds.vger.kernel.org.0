Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECE53BFF1
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 01:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390751AbfFJXhq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 19:37:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45580 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390747AbfFJXhq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 19:37:46 -0400
Received: by mail-pl1-f193.google.com with SMTP id bi6so3864079plb.12
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lwYUN/KUyzUQQmKgro+g5eqK3FeGewhxwiwrsgABWdM=;
        b=JNH8X5fVDnaksMRrJIPAhSlbONYaT+Qzmac4p+4aIJ9MyL8CBR4CbOBSaLfJ/lVSWz
         pvy14bPyQRVfCaYdY6N70JiL3c1/7002idQAVcssXH4SBW+0u1+C1Vpj0J8C56+lsuaW
         rD6bAgc+3gw9fyJeWeljeJYPPMzpJKROpovfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lwYUN/KUyzUQQmKgro+g5eqK3FeGewhxwiwrsgABWdM=;
        b=A+RaoUc4NQpBYVz+PsavnRhOySnUVrjAQbsEuH0294o0BTjGG9e8kPXl/zDdb6eCQK
         sVKOVU+7SEFlxsYwdDH9Zs5k5tggJswsG5wyeTGlmM8nSPKQ8uvEuWp8gJrYajpFm/Iu
         46tqh+pjEzQbwTCaYP1xIY/52p+QTtLOiwvK5UeNpaMGqyWs9Swx+WE85eGyj0a08Cep
         JT9AW61a6REOwCz4Iy0uIIyPdIgG6Acgr2m3XNn1k+VY++tbsbYrl5W3HMg32H1dvFY8
         LHNec5mBnJs2k0QHaq7u84NRK5txYjPNOoBzpX/fpiFq6mZplcNOR+RdmPqIdVY1qVTG
         BuKg==
X-Gm-Message-State: APjAAAWymc56I9hriYbCdWxIzwyqtn3qpFuum1stJxn6F6vJsjOo8iey
        8eQ1B3O6QS/2h6ThWknamqLmAA==
X-Google-Smtp-Source: APXvYqzXs66MLOw7Ug1WtaUrdzJynS7SOfkyQfCnYQ3Tk82lp8vcxCASVc5yQ0uIfTU53qcM/aLF/Q==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr57526892plq.223.1560209865771;
        Mon, 10 Jun 2019 16:37:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id p27sm7658412pfq.136.2019.06.10.16.37.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:37:45 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/2] backlight: pwm_bl: Get number of brightness levels for CIE 1931 from the device tree
Date:   Mon, 10 Jun 2019 16:37:39 -0700
Message-Id: <20190610233739.29477-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190610233739.29477-1-mka@chromium.org>
References: <20190610233739.29477-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Commit 88ba95bedb79 ("backlight: pwm_bl: Compute brightness of LED
linearly to human eye") uses pwm_period / hweight32(pwm_period) as
as heuristic to determine the number of brightness levels when the DT
doesn't provide a brightness level table. This heuristic is broken
and can result in excessively large brightness tables.

Instead of using the heuristic try to retrieve the number of
brightness levels from the device tree (property 'max-brightness'
+ 1). If the value is not specified use a default of 256 levels.

Fixes: 88ba95bedb79 ("backlight: pwm_bl: Compute brightness of LED linearly to human eye")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/video/backlight/pwm_bl.c | 59 ++++++++++++--------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index fb45f866b923..2913cbe9cfcb 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -194,38 +194,19 @@ int pwm_backlight_brightness_default(struct device *dev,
 				     struct platform_pwm_backlight_data *data,
 				     unsigned int period)
 {
-	unsigned int counter = 0;
-	unsigned int i, n;
+	unsigned int i;
+	unsigned int nlevels = data->max_brightness + 1;
 	u64 retval;
 
-	/*
-	 * Count the number of bits needed to represent the period number. The
-	 * number of bits is used to calculate the number of levels used for the
-	 * brightness-levels table, the purpose of this calculation is have a
-	 * pre-computed table with enough levels to get linear brightness
-	 * perception. The period is divided by the number of bits so for a
-	 * 8-bit PWM we have 255 / 8 = 32 brightness levels or for a 16-bit PWM
-	 * we have 65535 / 16 = 4096 brightness levels.
-	 *
-	 * Note that this method is based on empirical testing on different
-	 * devices with PWM of 8 and 16 bits of resolution.
-	 */
-	n = period;
-	while (n) {
-		counter += n % 2;
-		n >>= 1;
-	}
-
-	data->max_brightness = DIV_ROUND_UP(period, counter);
-	data->levels = devm_kcalloc(dev, data->max_brightness,
+	data->levels = devm_kcalloc(dev, nlevels,
 				    sizeof(*data->levels), GFP_KERNEL);
 	if (!data->levels)
 		return -ENOMEM;
 
 	/* Fill the table using the cie1931 algorithm */
-	for (i = 0; i < data->max_brightness; i++) {
+	for (i = 0; i < nlevels; i++) {
 		retval = cie1931((i * PWM_LUMINANCE_SCALE) /
-				 data->max_brightness, PWM_LUMINANCE_SCALE) *
+				 nlevels, PWM_LUMINANCE_SCALE) *
 				 period;
 		retval = DIV_ROUND_CLOSEST_ULL(retval, PWM_LUMINANCE_SCALE);
 		if (retval > UINT_MAX)
@@ -233,8 +214,7 @@ int pwm_backlight_brightness_default(struct device *dev,
 		data->levels[i] = (unsigned int)retval;
 	}
 
-	data->dft_brightness = data->max_brightness / 2;
-	data->max_brightness--;
+	data->dft_brightness = nlevels / 2;
 
 	return 0;
 }
@@ -272,8 +252,13 @@ static int pwm_backlight_parse_dt(struct device *dev,
 	 * set a default table of brightness levels will be used.
 	 */
 	prop = of_find_property(node, "brightness-levels", &length);
-	if (!prop)
+	if (!prop) {
+		if (of_property_read_u32(node, "max-brightness",
+					 &data->max_brightness))
+			data->max_brightness = 255;
+
 		return 0;
+	}
 
 	data->max_brightness = length / sizeof(u32);
 
@@ -565,13 +550,10 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 			pb->levels = data->levels;
 		}
-	} else if (!data->max_brightness) {
+	} else if (node) {
 		/*
-		 * If no brightness levels are provided and max_brightness is
-		 * not set, use the default brightness table. For the DT case,
-		 * max_brightness is set to 0 when brightness levels is not
-		 * specified. For the non-DT case, max_brightness is usually
-		 * set to some value.
+		 * If no brightness levels are provided use the default
+		 * brightness table.
 		 */
 
 		/* Get the PWM period (in nanoseconds) */
@@ -591,12 +573,13 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 			pb->levels = data->levels;
 		}
-	} else {
-		/*
-		 * That only happens for the non-DT case, where platform data
-		 * sets the max_brightness value.
-		 */
+	} else if (data->max_brightness) {
+		/* non-DT case, max_brightness value set in platform data. */
 		pb->scale = data->max_brightness;
+	} else {
+		dev_err(&pdev->dev, "max brightness is not specified\n");
+		ret = -EINVAL;
+		goto err_alloc;
 	}
 
 	pb->lth_brightness = data->lth_brightness * (state.period / pb->scale);
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

