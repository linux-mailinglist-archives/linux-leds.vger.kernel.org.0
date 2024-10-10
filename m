Return-Path: <linux-leds+bounces-3064-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D19993C4
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 22:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A604B1F24203
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 20:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DBC1E1027;
	Thu, 10 Oct 2024 20:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nUZ4g8xd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085C1CF7B8
	for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 20:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592607; cv=none; b=AhOV1DNYuvgnnPGo6FgzJCwjb6bOuJPb9E7esfLN6BksRkC6XPm+2Jj9ojI2lU0zjwt4kdrQ+uS2XkoppcCXbNVu7yfLejBm7bLayAZbrwY/aF7a5LR13n1okp7ZsrsXALE5g9di9agd1y5xaNYH4P25OfFbBATkyXcADXVOXu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592607; c=relaxed/simple;
	bh=UGDjWe3SBWZx047q1lPvOSl4fhs8DmcqPkIjiJ+yKlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BpGvFYx9KbxtWfY5spC0crYw1yskvv2PN4XK9+e0CYwQEmqaAVpphhH7oZpfucvs8sJoHnYh/9bmtrZ5nCS0bkSIeHkTPUf/T5GXs7nEv71x4lnZZV9mm6NvHafaHzG6aPyhWhJHtYweFF4KJha3FUWf2Ddj1rElS31Ezb5hVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nUZ4g8xd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a997736106fso174080366b.3
        for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 13:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728592602; x=1729197402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5LVLVle4s4z/0XqVuc05wzxrC9kKPBHOq7p/xmrtrQ=;
        b=nUZ4g8xdSM2g67A+mzLgB3Z7Vi/8PGbGjC6VADVSHEPdoIU8uHX9J2IhARvZyQEG7H
         FjJUnSTi6tJAvWc6AtqfILMJI3NemugFtNS5j70hJKYPUXv31+7QDu3GG3kVp5Wl8jzZ
         2Yi+mISxcPVcyP+589bCNV3ZeHLx5WsZ81Z302irtfo5jkGiKSEqW1oMTVxWPjIqQ8qF
         rWLYkzfk6yXwF7A70bLcZQF3sdcvE9acaYhz/RUxQnblwQp2mcIIy8Uf3BVWQU4lVbmW
         Xc8naA7EqjzZMLUo1IlJevsUVXgGuqCBbZgcSqYYMmVNciFBvFseZhmjOQfBgQgDLcQe
         3fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728592602; x=1729197402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5LVLVle4s4z/0XqVuc05wzxrC9kKPBHOq7p/xmrtrQ=;
        b=Pm0L06FePWSGL8VGdnSfmUTKKijZlw7WVjtp7Cb5VAHI6GaWU8VsGAmBrn9lIe9Bh0
         wHXs2eW91MRA4Jczrl/T2Mx7jZQbA6M/2RQPMk1cxvnL5Z/M20u2kp44BUCo8ASnaoGl
         vSHWNlfHLWRVSn7R54zg9rHhJANBfottI/7e/iO2dhYCNgkRF3KSCsQWY/LLbN+ww976
         j+KNLFP6oruqQt/wB7jCdtOJ3wRTfetOXNCfqeMkfEJKhmkU/Jl6kKYMiRaRYsrVyTA8
         dPaW+vUhlgZr3m3HSsDXGILjbuY+NpZyvkX5zLlVyaqF4m2IOv57TuI1DvukOmOBaDnw
         64Mw==
X-Gm-Message-State: AOJu0Yz5rY494CDI/xDBIyUUfOL5aI3dIollg0PtW6vGzg0lP1jZnaax
	14pS0aH4gjEl1//TNEBtgLO0cu49+g9tTM6Dc5V6aftlldsr/SbEQazndxKe7YM=
X-Google-Smtp-Source: AGHT+IF23ILmS8mfl2c3a3lmY5lviiueUxC66kStFuQiwxQ0m4C0oAf4NkN9U3JUjnf6pouvkJCbcg==
X-Received: by 2002:a17:906:d264:b0:a99:5de9:8312 with SMTP id a640c23a62f3a-a99b9583ab2mr20485166b.44.1728592602476;
        Thu, 10 Oct 2024 13:36:42 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80f29b3sm133726066b.221.2024.10.10.13.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 13:36:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [PATCH] leds: Switch back to struct platform_driver::remove()
Date: Thu, 10 Oct 2024 22:36:23 +0200
Message-ID: <20241010203622.839625-5-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17555; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UGDjWe3SBWZx047q1lPvOSl4fhs8DmcqPkIjiJ+yKlg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnCDrKLqLemp2mLX3/r03C8/aVRLHE82DbxxFMa d1DZCH1tlmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwg6ygAKCRCPgPtYfRL+ Tm+YB/4kwmjqXXDvMbCfkd0HK/eEnvZzjvEQqQBjbdNmPLzhV7SK8EiFd1JL0jxBhjfVfYD5uCS Tj9+Nxf0UYHxlZtQztfROnrh9KTHcZbTTyItRoJ45uJ6ardRfdjhKtbi23K9c/RDJ/1JrwOuCs5 a3sMwdagAdp5RA0/wbdKCi/vEWKa2fiQJEYg0tRBlZbKS28xFQFZ8tx/M2MHj44eB/qEpTNzTjO Lzs6HAdFDAAS9a3F7LldDIdA4OVRqEBMqGJtuqbAW95W4EUpfH7io8DoYYzDfLCWJxUTa9gv5BE Xqa2jAAznoTUsIm1KxXZ+0YGbsMlXxStZ5Gs31lB/Dc3OI0h
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/leds/ to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these files, make indention of the struct initializer
consistent in several files.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on todays's next, feel free to drop changes that result
in a conflict when you come around to apply this. I'll care for the
fallout at a later time then. (Having said that, if you use b4 am -3 and
git am -3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/leds/blink/leds-lgm-sso.c                       | 2 +-
 drivers/leds/flash/leds-aat1290.c                       | 2 +-
 drivers/leds/flash/leds-ktd2692.c                       | 2 +-
 drivers/leds/flash/leds-max77693.c                      | 2 +-
 drivers/leds/flash/leds-mt6360.c                        | 2 +-
 drivers/leds/flash/leds-qcom-flash.c                    | 2 +-
 drivers/leds/flash/leds-rt8515.c                        | 2 +-
 drivers/leds/flash/leds-sgm3140.c                       | 2 +-
 drivers/leds/leds-88pm860x.c                            | 2 +-
 drivers/leds/leds-adp5520.c                             | 2 +-
 drivers/leds/leds-cht-wcove.c                           | 2 +-
 drivers/leds/leds-clevo-mail.c                          | 2 +-
 drivers/leds/leds-da903x.c                              | 2 +-
 drivers/leds/leds-da9052.c                              | 2 +-
 drivers/leds/leds-lm3533.c                              | 2 +-
 drivers/leds/leds-mc13783.c                             | 2 +-
 drivers/leds/leds-mt6323.c                              | 2 +-
 drivers/leds/leds-powernv.c                             | 4 ++--
 drivers/leds/leds-rb532.c                               | 2 +-
 drivers/leds/leds-regulator.c                           | 2 +-
 drivers/leds/leds-sc27xx-bltc.c                         | 2 +-
 drivers/leds/leds-sun50i-a100.c                         | 2 +-
 drivers/leds/leds-sunfire.c                             | 4 ++--
 drivers/leds/leds-wm831x-status.c                       | 2 +-
 drivers/leds/leds-wm8350.c                              | 2 +-
 drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c  | 2 +-
 drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c | 2 +-
 drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c      | 2 +-
 28 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 7b04ea146260..effaaaf302b5 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -861,7 +861,7 @@ MODULE_DEVICE_TABLE(of, of_sso_led_match);
 
 static struct platform_driver intel_sso_led_driver = {
 	.probe		= intel_sso_led_probe,
-	.remove_new	= intel_sso_led_remove,
+	.remove		= intel_sso_led_remove,
 	.driver		= {
 			.name = "lgm-ssoled",
 			.of_match_table = of_sso_led_match,
diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index c7b6a1f01288..49251cfd3350 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -536,7 +536,7 @@ MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
 
 static struct platform_driver aat1290_led_driver = {
 	.probe		= aat1290_led_probe,
-	.remove_new	= aat1290_led_remove,
+	.remove		= aat1290_led_remove,
 	.driver		= {
 		.name	= "aat1290",
 		.of_match_table = aat1290_led_dt_match,
diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 16a01a200c0b..2e42f845df28 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -343,7 +343,7 @@ static struct platform_driver ktd2692_driver = {
 		.of_match_table = ktd2692_match,
 	},
 	.probe  = ktd2692_probe,
-	.remove_new = ktd2692_remove,
+	.remove = ktd2692_remove,
 };
 
 module_platform_driver(ktd2692_driver);
diff --git a/drivers/leds/flash/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
index 90d78b3d22f8..daee10986108 100644
--- a/drivers/leds/flash/leds-max77693.c
+++ b/drivers/leds/flash/leds-max77693.c
@@ -1042,7 +1042,7 @@ MODULE_DEVICE_TABLE(of, max77693_led_dt_match);
 
 static struct platform_driver max77693_led_driver = {
 	.probe		= max77693_led_probe,
-	.remove_new	= max77693_led_remove,
+	.remove		= max77693_led_remove,
 	.driver		= {
 		.name	= "max77693-led",
 		.of_match_table = max77693_led_dt_match,
diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 4c74f1cf01f0..3b2c7ac1bac7 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -887,7 +887,7 @@ static struct platform_driver mt6360_led_driver = {
 		.of_match_table = mt6360_led_of_id,
 	},
 	.probe = mt6360_led_probe,
-	.remove_new = mt6360_led_remove,
+	.remove = mt6360_led_remove,
 };
 module_platform_driver(mt6360_led_driver);
 
diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 41ce034f700e..e83d62b71629 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -942,7 +942,7 @@ static struct platform_driver qcom_flash_led_driver = {
 		.of_match_table = qcom_flash_led_match_table,
 	},
 	.probe = qcom_flash_led_probe,
-	.remove_new = qcom_flash_led_remove,
+	.remove = qcom_flash_led_remove,
 };
 
 module_platform_driver(qcom_flash_led_driver);
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index eef426924eaf..6b051f182b72 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -388,7 +388,7 @@ static struct platform_driver rt8515_driver = {
 		.of_match_table = rt8515_match,
 	},
 	.probe  = rt8515_probe,
-	.remove_new = rt8515_remove,
+	.remove = rt8515_remove,
 };
 module_platform_driver(rt8515_driver);
 
diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index db0ac6641954..3c01739c0b46 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -300,7 +300,7 @@ MODULE_DEVICE_TABLE(of, sgm3140_dt_match);
 
 static struct platform_driver sgm3140_driver = {
 	.probe	= sgm3140_probe,
-	.remove_new = sgm3140_remove,
+	.remove	= sgm3140_remove,
 	.driver	= {
 		.name	= "sgm3140",
 		.of_match_table = sgm3140_dt_match,
diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 81238376484b..ef5c6c4667ab 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -226,7 +226,7 @@ static struct platform_driver pm860x_led_driver = {
 		.name	= "88pm860x-led",
 	},
 	.probe	= pm860x_led_probe,
-	.remove_new = pm860x_led_remove,
+	.remove	= pm860x_led_remove,
 };
 
 module_platform_driver(pm860x_led_driver);
diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index d89a4dca50ae..13e5bc80e56e 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -184,7 +184,7 @@ static struct platform_driver adp5520_led_driver = {
 		.name	= "adp5520-led",
 	},
 	.probe		= adp5520_led_probe,
-	.remove_new	= adp5520_led_remove,
+	.remove		= adp5520_led_remove,
 };
 
 module_platform_driver(adp5520_led_driver);
diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index b4998402b8c6..8246f048edcb 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -461,7 +461,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(cht_wc_leds_pm, cht_wc_leds_suspend, cht_wc_leds
 
 static struct platform_driver cht_wc_leds_driver = {
 	.probe = cht_wc_leds_probe,
-	.remove_new = cht_wc_leds_remove,
+	.remove = cht_wc_leds_remove,
 	.shutdown = cht_wc_leds_disable,
 	.driver = {
 		.name = "cht_wcove_leds",
diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-mail.c
index 82da0fe688ad..f00b16ac1586 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -165,7 +165,7 @@ static void clevo_mail_led_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver clevo_mail_led_driver = {
-	.remove_new	= clevo_mail_led_remove,
+	.remove		= clevo_mail_led_remove,
 	.driver		= {
 		.name		= KBUILD_MODNAME,
 	},
diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index f067a5f4d3c4..71209b3c8f1e 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -133,7 +133,7 @@ static struct platform_driver da903x_led_driver = {
 		.name	= "da903x-led",
 	},
 	.probe		= da903x_led_probe,
-	.remove_new	= da903x_led_remove,
+	.remove		= da903x_led_remove,
 };
 
 module_platform_driver(da903x_led_driver);
diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 64679d62076b..7c9051184a59 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -179,7 +179,7 @@ static struct platform_driver da9052_led_driver = {
 		.name	= "da9052-leds",
 	},
 	.probe		= da9052_led_probe,
-	.remove_new	= da9052_led_remove,
+	.remove		= da9052_led_remove,
 };
 
 module_platform_driver(da9052_led_driver);
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index a3d33165d262..45795f2a1042 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -744,7 +744,7 @@ static struct platform_driver lm3533_led_driver = {
 		.name = "lm3533-leds",
 	},
 	.probe		= lm3533_led_probe,
-	.remove_new	= lm3533_led_remove,
+	.remove		= lm3533_led_remove,
 	.shutdown	= lm3533_led_shutdown,
 };
 module_platform_driver(lm3533_led_driver);
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index da99d114bfb2..e22f09d13798 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -301,7 +301,7 @@ static struct platform_driver mc13xxx_led_driver = {
 	.driver	= {
 		.name	= "mc13xxx-led",
 	},
-	.remove_new	= mc13xxx_led_remove,
+	.remove		= mc13xxx_led_remove,
 	.id_table	= mc13xxx_led_id_table,
 };
 module_platform_driver_probe(mc13xxx_led_driver, mc13xxx_led_probe);
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index a19e8e0b6d1b..dbdc221c3828 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -713,7 +713,7 @@ MODULE_DEVICE_TABLE(of, mt6323_led_dt_match);
 
 static struct platform_driver mt6323_led_driver = {
 	.probe		= mt6323_led_probe,
-	.remove_new	= mt6323_led_remove,
+	.remove		= mt6323_led_remove,
 	.driver		= {
 		.name	= "mt6323-led",
 		.of_match_table = mt6323_led_dt_match,
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 49ab8c9a3f29..3a38578ce8e4 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -323,8 +323,8 @@ static const struct of_device_id powernv_led_match[] = {
 MODULE_DEVICE_TABLE(of, powernv_led_match);
 
 static struct platform_driver powernv_led_driver = {
-	.probe	= powernv_led_probe,
-	.remove_new = powernv_led_remove,
+	.probe = powernv_led_probe,
+	.remove = powernv_led_remove,
 	.driver = {
 		.name = "powernv-led-driver",
 		.of_match_table = powernv_led_match,
diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index e66f73879c8e..782e1c11ee44 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -49,7 +49,7 @@ static void rb532_led_remove(struct platform_device *pdev)
 
 static struct platform_driver rb532_led_driver = {
 	.probe = rb532_led_probe,
-	.remove_new = rb532_led_remove,
+	.remove = rb532_led_remove,
 	.driver = {
 		.name = "rb532-led",
 	},
diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index 848e929c4a61..ade64629431a 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -193,7 +193,7 @@ static struct platform_driver regulator_led_driver = {
 		.of_match_table = regulator_led_of_match,
 	},
 	.probe  = regulator_led_probe,
-	.remove_new = regulator_led_remove,
+	.remove = regulator_led_remove,
 };
 
 module_platform_driver(regulator_led_driver);
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index cca98c644aa6..0c5169773949 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -344,7 +344,7 @@ static struct platform_driver sc27xx_led_driver = {
 		.of_match_table = sc27xx_led_of_match,
 	},
 	.probe = sc27xx_led_probe,
-	.remove_new = sc27xx_led_remove,
+	.remove = sc27xx_led_remove,
 };
 
 module_platform_driver(sc27xx_led_driver);
diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 4c468d487486..f71aab858dc5 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -567,7 +567,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sun50i_a100_ledc_pm,
 
 static struct platform_driver sun50i_a100_ledc_driver = {
 	.probe		= sun50i_a100_ledc_probe,
-	.remove_new	= sun50i_a100_ledc_remove,
+	.remove		= sun50i_a100_ledc_remove,
 	.shutdown	= sun50i_a100_ledc_remove,
 	.driver		= {
 		.name		= "sun50i-a100-ledc",
diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index a621e5e5c75c..bd24e7f5947a 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -219,7 +219,7 @@ MODULE_ALIAS("platform:sunfire-fhc-leds");
 
 static struct platform_driver sunfire_clockboard_led_driver = {
 	.probe		= sunfire_clockboard_led_probe,
-	.remove_new	= sunfire_led_generic_remove,
+	.remove		= sunfire_led_generic_remove,
 	.driver		= {
 		.name	= "sunfire-clockboard-leds",
 	},
@@ -227,7 +227,7 @@ static struct platform_driver sunfire_clockboard_led_driver = {
 
 static struct platform_driver sunfire_fhc_led_driver = {
 	.probe		= sunfire_fhc_led_probe,
-	.remove_new	= sunfire_led_generic_remove,
+	.remove		= sunfire_led_generic_remove,
 	.driver		= {
 		.name	= "sunfire-fhc-leds",
 	},
diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index 70b32d80f960..05930e9e8887 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -292,7 +292,7 @@ static struct platform_driver wm831x_status_driver = {
 		   .name = "wm831x-status",
 		   },
 	.probe = wm831x_status_probe,
-	.remove_new = wm831x_status_remove,
+	.remove = wm831x_status_remove,
 };
 
 module_platform_driver(wm831x_status_driver);
diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 61cbefa05710..87e60ea927b9 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -255,7 +255,7 @@ static struct platform_driver wm8350_led_driver = {
 		   .name = "wm8350-led",
 		   },
 	.probe = wm8350_led_probe,
-	.remove_new = wm8350_led_remove,
+	.remove = wm8350_led_remove,
 	.shutdown = wm8350_led_shutdown,
 };
 
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
index 726c186391af..c98c370687c2 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-apollolake.c
@@ -53,7 +53,7 @@ static void simatic_ipc_leds_gpio_apollolake_remove(struct platform_device *pdev
 
 static struct platform_driver simatic_ipc_led_gpio_apollolake_driver = {
 	.probe = simatic_ipc_leds_gpio_apollolake_probe,
-	.remove_new = simatic_ipc_leds_gpio_apollolake_remove,
+	.remove = simatic_ipc_leds_gpio_apollolake_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c b/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
index 3fec96c549c1..7f7cff275448 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-elkhartlake.c
@@ -43,7 +43,7 @@ static void simatic_ipc_leds_gpio_elkhartlake_remove(struct platform_device *pde
 
 static struct platform_driver simatic_ipc_led_gpio_elkhartlake_driver = {
 	.probe = simatic_ipc_leds_gpio_elkhartlake_probe,
-	.remove_new = simatic_ipc_leds_gpio_elkhartlake_remove,
+	.remove = simatic_ipc_leds_gpio_elkhartlake_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
index a1f10952513c..bc23d701bcb7 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.c
@@ -93,7 +93,7 @@ static void simatic_ipc_leds_gpio_f7188x_remove(struct platform_device *pdev)
 
 static struct platform_driver simatic_ipc_led_gpio_driver = {
 	.probe = simatic_ipc_leds_gpio_f7188x_probe,
-	.remove_new = simatic_ipc_leds_gpio_f7188x_remove,
+	.remove = simatic_ipc_leds_gpio_f7188x_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
-- 
2.45.2


