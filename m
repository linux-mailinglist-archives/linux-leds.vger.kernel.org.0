Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107E011489C
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2019 22:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLEVZL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Dec 2019 16:25:11 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38291 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfLEVZL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Dec 2019 16:25:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so5412731wrh.5;
        Thu, 05 Dec 2019 13:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yY42JF5Ppbct0NGiQDwjXUceg9GH5Esb/q4oxlJF5qw=;
        b=uAP8DkaagDA5XCZA52x4WgfUbVA9q789oq4FW+bqh2SxP+GJQUv01OJeVDdzQy5H7h
         +ekIj0ufiUWBl7FnkDm8hW0yPfXIVH0h/jdHGPq9CC7PcyflKdNtQlZVKMmMnorTvKms
         47ZriPVNAHqGh8dJYlLc8b7kLROyrE5Nm5ugiP8mAizY0Iotva7So+mvqGYwd14HwQXq
         PuAM6XTj2+5TAOyJxz/f4hsCFLD04g6GboNFEX6XKSLcmooJsrAFY5tfC9YfcZ7hSIH1
         mTSecf9R1fYhLuqQCqTRvnShHX9sORcKt1xANaC2N6jPgNZe2WyIwDGx5Y+R+4f1LMIK
         vd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yY42JF5Ppbct0NGiQDwjXUceg9GH5Esb/q4oxlJF5qw=;
        b=bWZ2zo7VG2mdoSAOxt8hTCiH1NC1akvjd0qTGfFkEcHbs9mOER7kx0K/Hk3kn3YQX4
         INknKinGxDNpymUWLkafOe4hyuJh0XutYwItgADV7iuVGVB6A6Gp3WDfp9Vy+8XJFYth
         pd6We3Uuh8bMpur2feXby9rjyzZCcs/2xjEluJ7z1qVu0A3VFXDqlEdVuualKiSTN2sa
         DntItjI3kAYyq0NBlCqw/qmR5TA332y6YNLI2hZnyA2MESrwxK11h2hzsal3S3/m7YMV
         dIteMzN0CLPlqvVYvtukG1Vlndi0JEbpRXKsWgCAYPNP7HrCXt6QAEzDm44lUD/Rftt+
         MlHg==
X-Gm-Message-State: APjAAAVApXv/9J8TFQTmSA4PZ9pI7iyyMHChFB6phkcdXT8SMA9dyeqP
        bkh242GJik8oP9UFSEWX8C30rsbU
X-Google-Smtp-Source: APXvYqwaboVPNTOwrCpASOTss9LBf6Ia2nVc18UsatHmw2eCvYx3QC8rfGHlQCA+tvHR0TmXvucpDQ==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr12023435wrx.102.1575581109200;
        Thu, 05 Dec 2019 13:25:09 -0800 (PST)
Received: from myhost.home (bla66.neoplus.adsl.tpnet.pl. [83.28.194.66])
        by smtp.gmail.com with ESMTPSA id b17sm13860558wrx.15.2019.12.05.13.25.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 13:25:08 -0800 (PST)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH] leds: gpio: Fix uninitialized gpio label for fwnode based probe
Date:   Thu,  5 Dec 2019 22:25:01 +0100
Message-Id: <20191205212501.9163-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When switching to using generic LED name composition mechanism via
devm_led_classdev_register_ext() API the part of code initializing
struct gpio_led's template name property was removed alongside.
It was however overlooked that the property was also passed to
devm_fwnode_get_gpiod_from_child() in place of "label" parameter,
which when set to NULL, results in gpio label being initialized to '?'.

It could be observed in debugfs and failed to properly identify
gpio association with LED consumer.

Fix this shortcoming by updating the GPIO label after the LED is
registered and its final name is known.

Fixes: d7235f5feaa0 ("leds: gpio: Use generic support for composing LED names")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/leds-gpio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index a5c73f3d5f79..43eeed096d0d 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -151,9 +151,14 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led led = {};
 		const char *state = NULL;
 
+		/**
+		 * Acquire gpiod from DT with uninitialized label, which
+		 * will be updated after LED class device is registered,
+		 * Only then the final LED name is known.
+		 */
 		led.gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
 							     GPIOD_ASIS,
-							     led.name);
+							     NULL);
 		if (IS_ERR(led.gpiod)) {
 			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
@@ -186,6 +191,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
 		}
+		/* Set gpiod label to match the corresponding LED name. */
+		gpiod_set_consumer_name(led_dat->gpiod,
+					led_dat->cdev.dev->kobj.name);
 		priv->num_leds++;
 	}
 
-- 
2.11.0

