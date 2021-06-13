Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2953A516D
	for <lists+linux-leds@lfdr.de>; Sun, 13 Jun 2021 02:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFMAIk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 12 Jun 2021 20:08:40 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:35642 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFMAIk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Jun 2021 20:08:40 -0400
Received: by mail-lj1-f182.google.com with SMTP id n17so14774925ljg.2
        for <linux-leds@vger.kernel.org>; Sat, 12 Jun 2021 17:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZFYKxf7UW0S2RQWgaBSC4f2Mnxv2hI1hJP96MEozwjU=;
        b=nlbjgu0UvGK2B7MCax3AtJuHG9c9qI3LwMvt/PWNmbQO7b3TMj6sXDmX4GPBJ0UjVs
         IlYNCwgVd291KABpV6A70atdht8fEtquels0QzJdn1A/Y3PAXpgSgx2B3Eu3a+68cZu/
         8LwDpXhg6c9yZW27llxJ15Nuac1Gqwrck7cz5gc6ASQWDpe38DlO/7rdKsV0oRrS8zO0
         gMP8Nxwk5pJXxHO/SVDTIix/TH5CWlcmP9v5S7loxFR34bJO4T1/0YPdu7852b1fk99F
         9HlL6w9BbjM1lA5YJKUyUr3ggCLYkG3vVGjBKJ8llu+V5+rMtUbWWBsE1j88jWfE83cS
         QJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZFYKxf7UW0S2RQWgaBSC4f2Mnxv2hI1hJP96MEozwjU=;
        b=QtdnpGGpMdXQtwHvjXLjv04wGKeDpyKp7XdXWzIO2T/ZEdKqN88n3ES9aXLv7g0hwH
         uUVqR9xitm4CwFWaEYJx47lxnPIGKFGMUlOynpMrLX2+aSNIvHWz6PcUJj7c4BqCZxQy
         GZUIpmFj+SYWPJwVp2C2ccILeGhcfMYtRvOTfo16A9DKLK2cyO8RyhrIMM2fAmCC3KP/
         MNDWK5RM85W08+qCkU20yR1IFgOBDfw8idWX+iKniB0Qead8r5vMen8wxKiZRpWT0txV
         vqQ5C8WT4H5bRNhIWM60FUXVyWoU6fVTrsIe+E3mtdxpwfKvFOsC2JcpINwrDRZrrxqz
         x5Jg==
X-Gm-Message-State: AOAM531x9OsCqRLLhHS87+dA8z8m1pzfDv2qhfexpnY5R1w01cDMK1e/
        P91RKuXXxhmFtb+HNC/rMA2Oag==
X-Google-Smtp-Source: ABdhPJyp5l4OtvQSGoI0WRjiU41xl/0XfQi95ON2e7+4SMIhL8dEG6oG8KB4+f/7wHEwO3kJV2IroA==
X-Received: by 2002:a2e:711e:: with SMTP id m30mr8510936ljc.489.1623542727502;
        Sat, 12 Jun 2021 17:05:27 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id n10sm1022702lfl.104.2021.06.12.17.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 17:05:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/2] ARM: davinci: dm646x: Convert LEDs to GPIO descriptor table
Date:   Sun, 13 Jun 2021 02:03:02 +0200
Message-Id: <20210613000302.421268-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613000302.421268-1-linus.walleij@linaro.org>
References: <20210613000302.421268-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This converts the DaVinci DM646x LEDs to use GPIO
descriptor look-ups.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rebase on v5.13-rc1
- Resend
- LED maintainers: please apply this patch, it is ACKed by a DaVinci
  maintainer
ChangeLog v2->v3:
- Rebase on v5.10-rc1
- Resend
ChangeLog v1->v2:
- Collect Bartosz' review tag
- Rebase on v5.9-rc1
- Resend
---
 arch/arm/mach-davinci/board-dm646x-evm.c | 33 +++++++++++++++++-------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index ee91d81ebbfd..a7d720e8f0e2 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/leds.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -202,10 +203,10 @@ static struct i2c_driver dm6467evm_cpld_driver = {
 /* LEDS */
 
 static struct gpio_led evm_leds[] = {
-	{ .name = "DS1", .active_low = 1, },
-	{ .name = "DS2", .active_low = 1, },
-	{ .name = "DS3", .active_low = 1, },
-	{ .name = "DS4", .active_low = 1, },
+	{ .name = "DS1" },
+	{ .name = "DS2" },
+	{ .name = "DS3" },
+	{ .name = "DS4" },
 };
 
 static const struct gpio_led_platform_data evm_led_data = {
@@ -213,18 +214,32 @@ static const struct gpio_led_platform_data evm_led_data = {
 	.leds     = evm_leds,
 };
 
+static struct gpiod_lookup_table evm_leds_gpio_table = {
+	.dev_id = "leds-gpio.0",
+	.table = {
+		/*
+		 * These GPIOs are on a PCF8574a GPIO expander, which
+		 * is in turn named after the I2C device name. This is
+		 * device "u2" on I2C bus 1 with address 0x38. These
+		 * leds are at offset 4, 5, 6, 7.
+		 */
+		GPIO_LOOKUP_IDX("1-0038", 4, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 5, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 6, NULL, 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("1-0038", 7, NULL, 3, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device *evm_led_dev;
 
 static int evm_led_setup(struct i2c_client *client, int gpio,
 			unsigned int ngpio, void *c)
 {
-	struct gpio_led *leds = evm_leds;
 	int status;
 
-	while (ngpio--) {
-		leds->gpio = gpio++;
-		leds++;
-	}
+	/* Add the lookup table */
+	gpiod_add_lookup_table(&evm_leds_gpio_table);
 
 	evm_led_dev = platform_device_alloc("leds-gpio", 0);
 	platform_device_add_data(evm_led_dev, &evm_led_data,
-- 
2.31.1

