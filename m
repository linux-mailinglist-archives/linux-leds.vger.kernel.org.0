Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1DF20BD62
	for <lists+linux-leds@lfdr.de>; Sat, 27 Jun 2020 02:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgF0AKV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Jun 2020 20:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgF0AKU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jun 2020 20:10:20 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CFDC03E979
        for <linux-leds@vger.kernel.org>; Fri, 26 Jun 2020 17:10:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id i3so12091714ljg.3
        for <linux-leds@vger.kernel.org>; Fri, 26 Jun 2020 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ld5PGWaH8xtpVt5DTCi9Hfpk3jUZ1QbhkvNzqqXUeK0=;
        b=vacDk+jTBNIWAzAKlAsufWBgrEFVMZeLbynkOBA7XbLEoDQ2JkdqjtoMPzqFNp9ylv
         fcKnC8K0BjpN98gdQr+bvdXA9KXEpVHJnB+VTtaKq0Rs2oVW2BOcppHojC3mRRGVvmFW
         8SDm8YzQJrTV6rhSkkvE9alLS9qucPM29f+q55hINQQmt+CnouTtV96Cn+OUyIIVW33L
         xWAUM6LXui/AmnyBADn41DD5yUmI8kx8O9YN7PPLOvDgKpX0XhyTpuad7xdVxMUf1EJH
         fj9dPDQN1hDWd57CQSyryYqZrvRElduUnR31BQB5sWxNKfrCM881KcQFFoP67i+fF2i+
         fyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ld5PGWaH8xtpVt5DTCi9Hfpk3jUZ1QbhkvNzqqXUeK0=;
        b=SZXnEhF5c4ZccHXpvKDCt+kGv9DQlJF0sPQ2j6d8+Mrqd5M4Y/4T5FZdCtdZ1z4X8A
         81YtkO1A/S4R+uDuxdIxylPj5DxqPz5ejymQyzdyCPIDwr5JWQR7aatqHtdB3f0UwBzn
         bD6GzEFdasVljLZKt6TwdSo2AmG7ZGATPv/1CpFG2+E3bgV07jEkjvsNLb0cxlOt6sQs
         N0yEphtevLYMuhEICJXIWIslhxN6FcNAtKx2g4zPKuJiOdG1+jMMol9ZBh/30hfrUxsG
         +tzOeui0hQuvap/L4nP8vBBoYh3kOL62VR8Ejv1uola5taxtDHTsWQzNTeX/NchQGWXf
         cXqA==
X-Gm-Message-State: AOAM530BQIVuHo3rgyNfDYPz/UXZj5xPfDsdHMFBv8Wk9oyFceKv5LGA
        RnJ83KySLnL+O6HrxjNKzPkLBw==
X-Google-Smtp-Source: ABdhPJx+hHBeIizUo1rtQvxiys7rFjJmwU+kcHDA/tSvnXniSwbx3LrjkuR96+a1vfe5ExTcYwNi9A==
X-Received: by 2002:a05:651c:1193:: with SMTP id w19mr2744874ljo.121.1593216618548;
        Fri, 26 Jun 2020 17:10:18 -0700 (PDT)
Received: from genomnajs.lan (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
        by smtp.gmail.com with ESMTPSA id f129sm7084043lfd.6.2020.06.26.17.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 17:10:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] leds: s3c24xx: Convert to use GPIO descriptors
Date:   Sat, 27 Jun 2020 02:10:15 +0200
Message-Id: <20200627001015.427376-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This converts the s3c24xx LED driver to use GPIO descriptors
and also modify all board files to account for these changes
by registering the appropriate GPIO tables for each board.

The driver was using a custom flag to indicate open drain
(tristate) but this can be handled by standard descriptor
machine tables.

The driver was setting non-pull-up for the pin using the custom
S3C24xx GPIO API, but this is a custom pin control system used
by the S3C24xx and no generic GPIO function, so this has simply
been pushed back into the respective board files.

Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-s3c24xx/common-smdk.c        | 67 +++++++++++++++-------
 arch/arm/mach-s3c24xx/mach-mini2440.c      | 63 +++++++++++++++++---
 arch/arm/mach-s3c24xx/mach-n30.c           | 54 +++++++++++++++--
 arch/arm/mach-s3c24xx/mach-qt2410.c        | 12 +++-
 arch/arm/mach-s3c24xx/mach-vr1000.c        | 38 +++++++++++-
 drivers/leds/leds-s3c24xx.c                | 37 +++---------
 include/linux/platform_data/leds-s3c24xx.h |  6 --
 7 files changed, 200 insertions(+), 77 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 58e30cad386c..10fc804c4ec5 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -14,6 +14,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
 
@@ -44,29 +45,53 @@
 
 /* LED devices */
 
+static struct gpiod_lookup_table smdk_led4_gpio_table = {
+	.dev_id = "s3c24xx_led.0",
+	.table = {
+		GPIO_LOOKUP("GPF", 4, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table smdk_led5_gpio_table = {
+	.dev_id = "s3c24xx_led.1",
+	.table = {
+		GPIO_LOOKUP("GPF", 6, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table smdk_led6_gpio_table = {
+	.dev_id = "s3c24xx_led.2",
+	.table = {
+		GPIO_LOOKUP("GPF", 5, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table smdk_led7_gpio_table = {
+	.dev_id = "s3c24xx_led.3",
+	.table = {
+		GPIO_LOOKUP("GPF", 7, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata smdk_pdata_led4 = {
-	.gpio		= S3C2410_GPF(4),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.name		= "led4",
 	.def_trigger	= "timer",
 };
 
 static struct s3c24xx_led_platdata smdk_pdata_led5 = {
-	.gpio		= S3C2410_GPF(5),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.name		= "led5",
 	.def_trigger	= "nand-disk",
 };
 
 static struct s3c24xx_led_platdata smdk_pdata_led6 = {
-	.gpio		= S3C2410_GPF(6),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.name		= "led6",
 };
 
 static struct s3c24xx_led_platdata smdk_pdata_led7 = {
-	.gpio		= S3C2410_GPF(7),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.name		= "led7",
 };
 
@@ -179,27 +204,25 @@ static struct platform_device __initdata *smdk_devs[] = {
 	&smdk_led7,
 };
 
-static const struct gpio smdk_led_gpios[] = {
-	{ S3C2410_GPF(4), GPIOF_OUT_INIT_HIGH, NULL },
-	{ S3C2410_GPF(5), GPIOF_OUT_INIT_HIGH, NULL },
-	{ S3C2410_GPF(6), GPIOF_OUT_INIT_HIGH, NULL },
-	{ S3C2410_GPF(7), GPIOF_OUT_INIT_HIGH, NULL },
-};
-
 void __init smdk_machine_init(void)
 {
-	/* Configure the LEDs (even if we have no LED support)*/
-
-	int ret = gpio_request_array(smdk_led_gpios,
-				     ARRAY_SIZE(smdk_led_gpios));
-	if (!WARN_ON(ret < 0))
-		gpio_free_array(smdk_led_gpios, ARRAY_SIZE(smdk_led_gpios));
-
 	if (machine_is_smdk2443())
 		smdk_nand_info.twrph0 = 50;
 
 	s3c_nand_set_platdata(&smdk_nand_info);
 
+	/* Disable pull-up on the LED lines */
+	s3c_gpio_setpull(S3C2410_GPF(4), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPF(5), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPF(6), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPF(7), S3C_GPIO_PULL_NONE);
+
+	/* Add lookups for the lines */
+	gpiod_add_lookup_table(&smdk_led4_gpio_table);
+	gpiod_add_lookup_table(&smdk_led5_gpio_table);
+	gpiod_add_lookup_table(&smdk_led6_gpio_table);
+	gpiod_add_lookup_table(&smdk_led7_gpio_table);
+
 	platform_add_devices(smdk_devs, ARRAY_SIZE(smdk_devs));
 
 	s3c_pm_init();
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 9035f868fb34..11add63b79c2 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -402,37 +402,68 @@ static struct platform_device mini2440_button_device = {
 
 /* LEDS */
 
+static struct gpiod_lookup_table mini2440_led1_gpio_table = {
+	.dev_id = "s3c24xx_led.1",
+	.table = {
+		GPIO_LOOKUP("GPB", 5, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table mini2440_led2_gpio_table = {
+	.dev_id = "s3c24xx_led.2",
+	.table = {
+		GPIO_LOOKUP("GPB", 6, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table mini2440_led3_gpio_table = {
+	.dev_id = "s3c24xx_led.3",
+	.table = {
+		GPIO_LOOKUP("GPB", 7, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table mini2440_led4_gpio_table = {
+	.dev_id = "s3c24xx_led.4",
+	.table = {
+		GPIO_LOOKUP("GPB", 8, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table mini2440_led5_gpio_table = {
+	.dev_id = "s3c24xx_led.5",
+	.table = {
+		GPIO_LOOKUP("GPG", 4, NULL, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata mini2440_led1_pdata = {
 	.name		= "led1",
-	.gpio		= S3C2410_GPB(5),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.def_trigger	= "heartbeat",
 };
 
 static struct s3c24xx_led_platdata mini2440_led2_pdata = {
 	.name		= "led2",
-	.gpio		= S3C2410_GPB(6),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.def_trigger	= "nand-disk",
 };
 
 static struct s3c24xx_led_platdata mini2440_led3_pdata = {
 	.name		= "led3",
-	.gpio		= S3C2410_GPB(7),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.def_trigger	= "mmc0",
 };
 
 static struct s3c24xx_led_platdata mini2440_led4_pdata = {
 	.name		= "led4",
-	.gpio		= S3C2410_GPB(8),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.def_trigger	= "",
 };
 
 static struct s3c24xx_led_platdata mini2440_led_backlight_pdata = {
 	.name		= "backlight",
-	.gpio		= S3C2410_GPG(4),
 	.def_trigger	= "backlight",
 };
 
@@ -714,6 +745,20 @@ static void __init mini2440_init(void)
 	i2c_register_board_info(0, mini2440_i2c_devs,
 				ARRAY_SIZE(mini2440_i2c_devs));
 
+	/* Disable pull-up on the LED lines */
+	s3c_gpio_setpull(S3C2410_GPB(5), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(6), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(7), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(8), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPG(4), S3C_GPIO_PULL_NONE);
+
+	/* Add lookups for the lines */
+	gpiod_add_lookup_table(&mini2440_led1_gpio_table);
+	gpiod_add_lookup_table(&mini2440_led2_gpio_table);
+	gpiod_add_lookup_table(&mini2440_led3_gpio_table);
+	gpiod_add_lookup_table(&mini2440_led4_gpio_table);
+	gpiod_add_lookup_table(&mini2440_led5_gpio_table);
+
 	platform_add_devices(mini2440_devices, ARRAY_SIZE(mini2440_devices));
 
 	if (features.count)	/* the optional features */
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index d856f23939af..58a64f6d5fd0 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -45,6 +45,7 @@
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/gpio-cfg.h>
 #include <linux/platform_data/mmc-s3cmci.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <plat/samsung-time.h>
@@ -246,17 +247,33 @@ static struct platform_device n35_button_device = {
 };
 
 /* This is the bluetooth LED on the device. */
+
+static struct gpiod_lookup_table n30_blue_led_gpio_table = {
+	.dev_id = "s3c24xx_led.1",
+	.table = {
+		GPIO_LOOKUP("GPG", 6, NULL, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata n30_blue_led_pdata = {
 	.name		= "blue_led",
-	.gpio		= S3C2410_GPG(6),
 	.def_trigger	= "",
 };
 
 /* This is the blue LED on the device. Originally used to indicate GPS activity
  * by flashing. */
+
+static struct gpiod_lookup_table n35_blue_led_gpio_table = {
+	.dev_id = "s3c24xx_led.1",
+	.table = {
+		GPIO_LOOKUP("GPD", 8, NULL, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata n35_blue_led_pdata = {
 	.name		= "blue_led",
-	.gpio		= S3C2410_GPD(8),
 	.def_trigger	= "",
 };
 
@@ -264,17 +281,30 @@ static struct s3c24xx_led_platdata n35_blue_led_pdata = {
  * red, blinking green or solid green when the battery is low,
  * charging or full respectively.  By driving GPD9 low, it's possible
  * to force the LED to blink red, so call that warning LED.  */
+
+static struct gpiod_lookup_table n30_warning_led_gpio_table = {
+	.dev_id = "s3c24xx_led.2",
+	.table = {
+		GPIO_LOOKUP("GPD", 9, NULL, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata n30_warning_led_pdata = {
 	.name		= "warning_led",
-	.flags          = S3C24XX_LEDF_ACTLOW,
-	.gpio		= S3C2410_GPD(9),
 	.def_trigger	= "",
 };
 
+static struct gpiod_lookup_table n35_warning_led_gpio_table = {
+	.dev_id = "s3c24xx_led.2",
+	.table = {
+		GPIO_LOOKUP("GPD", 9, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata n35_warning_led_pdata = {
 	.name		= "warning_led",
-	.flags          = S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
-	.gpio		= S3C2410_GPD(9),
 	.def_trigger	= "",
 };
 
@@ -577,6 +607,12 @@ static void __init n30_init(void)
 				      S3C2410_MISCCR_USBSUSPND0 |
 				      S3C2410_MISCCR_USBSUSPND1, 0x0);
 
+		/* Disable pull-up and add GPIO tables */
+		s3c_gpio_setpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
+		gpiod_add_lookup_table(&n30_blue_led_gpio_table);
+		gpiod_add_lookup_table(&n30_warning_led_gpio_table);
+
 		platform_add_devices(n30_devices, ARRAY_SIZE(n30_devices));
 	}
 
@@ -594,6 +630,12 @@ static void __init n30_init(void)
 				      S3C2410_MISCCR_USBSUSPND1,
 				      S3C2410_MISCCR_USBSUSPND0);
 
+		/* Disable pull-up and add GPIO tables */
+		s3c_gpio_setpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
+		gpiod_add_lookup_table(&n35_blue_led_gpio_table);
+		gpiod_add_lookup_table(&n35_warning_led_gpio_table);
+
 		platform_add_devices(n35_devices, ARRAY_SIZE(n35_devices));
 	}
 }
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 5d48e5b6e738..ff9e3197309b 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -177,9 +177,15 @@ static struct platform_device qt2410_cs89x0 = {
 
 /* LED */
 
+static struct gpiod_lookup_table qt2410_led_gpio_table = {
+	.dev_id = "s3c24xx_led.0",
+	.table = {
+		GPIO_LOOKUP("GPB", 0, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata qt2410_pdata_led = {
-	.gpio		= S3C2410_GPB(0),
-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
 	.name		= "led",
 	.def_trigger	= "timer",
 };
@@ -338,6 +344,8 @@ static void __init qt2410_machine_init(void)
 	s3c_i2c0_set_platdata(NULL);
 
 	gpiod_add_lookup_table(&qt2410_spi_gpiod_table);
+	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
+	gpiod_add_lookup_table(&qt2410_led_gpio_table);
 	platform_add_devices(qt2410_devices, ARRAY_SIZE(qt2410_devices));
 	s3c_pm_init();
 }
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
index 853e74f9b8b5..6a3fb2becc7c 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -13,6 +13,7 @@
 #include <linux/timer.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/dm9000.h>
 #include <linux/i2c.h>
 
@@ -40,6 +41,7 @@
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
+#include <plat/gpio-cfg.h>
 #include <plat/samsung-time.h>
 
 #include "bast.h"
@@ -223,21 +225,42 @@ static struct platform_device vr1000_dm9k1 = {
 
 /* LEDS */
 
+static struct gpiod_lookup_table vr1000_led1_gpio_table = {
+	.dev_id = "s3c24xx_led.1",
+	.table = {
+		GPIO_LOOKUP("GPB", 0, NULL, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table vr1000_led2_gpio_table = {
+	.dev_id = "s3c24xx_led.2",
+	.table = {
+		GPIO_LOOKUP("GPB", 1, NULL, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table vr1000_led3_gpio_table = {
+	.dev_id = "s3c24xx_led.3",
+	.table = {
+		GPIO_LOOKUP("GPB", 2, NULL, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct s3c24xx_led_platdata vr1000_led1_pdata = {
 	.name		= "led1",
-	.gpio		= S3C2410_GPB(0),
 	.def_trigger	= "",
 };
 
 static struct s3c24xx_led_platdata vr1000_led2_pdata = {
 	.name		= "led2",
-	.gpio		= S3C2410_GPB(1),
 	.def_trigger	= "",
 };
 
 static struct s3c24xx_led_platdata vr1000_led3_pdata = {
 	.name		= "led3",
-	.gpio		= S3C2410_GPB(2),
 	.def_trigger	= "",
 };
 
@@ -317,6 +340,15 @@ static void __init vr1000_init_time(void)
 static void __init vr1000_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
+
+	/* Disable pull-up on LED lines and register GPIO lookups */
+	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(1), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(2), S3C_GPIO_PULL_NONE);
+	gpiod_add_lookup_table(&vr1000_led1_gpio_table);
+	gpiod_add_lookup_table(&vr1000_led2_gpio_table);
+	gpiod_add_lookup_table(&vr1000_led3_gpio_table);
+
 	platform_add_devices(vr1000_devices, ARRAY_SIZE(vr1000_devices));
 
 	i2c_register_board_info(0, vr1000_i2c_devs,
diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index f8b8d6e313ee..3734173596bf 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -11,19 +11,19 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 
 #include <mach/regs-gpio.h>
-#include <plat/gpio-cfg.h>
 
 /* our context */
 
 struct s3c24xx_gpio_led {
 	struct led_classdev		 cdev;
 	struct s3c24xx_led_platdata	*pdata;
+	struct gpio_desc		*gpiod;
 };
 
 static inline struct s3c24xx_gpio_led *to_gpio(struct led_classdev *led_cdev)
@@ -35,20 +35,9 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
 	struct s3c24xx_gpio_led *led = to_gpio(led_cdev);
-	struct s3c24xx_led_platdata *pd = led->pdata;
-	int state = (value ? 1 : 0) ^ (pd->flags & S3C24XX_LEDF_ACTLOW);
+	int state = (value ? 1 : 0);
 
-	/* there will be a short delay between setting the output and
-	 * going from output to input when using tristate. */
-
-	gpio_set_value(pd->gpio, state);
-
-	if (pd->flags & S3C24XX_LEDF_TRISTATE) {
-		if (value)
-			gpio_direction_output(pd->gpio, state);
-		else
-			gpio_direction_input(pd->gpio);
-	}
+	gpiod_set_value(led->gpiod, state);
 }
 
 static int s3c24xx_led_probe(struct platform_device *dev)
@@ -69,22 +58,12 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	led->pdata = pdata;
 
-	ret = devm_gpio_request(&dev->dev, pdata->gpio, "S3C24XX_LED");
-	if (ret < 0)
-		return ret;
-
-	/* no point in having a pull-up if we are always driving */
-
-	s3c_gpio_setpull(pdata->gpio, S3C_GPIO_PULL_NONE);
-
-	if (pdata->flags & S3C24XX_LEDF_TRISTATE)
-		gpio_direction_input(pdata->gpio);
-	else
-		gpio_direction_output(pdata->gpio,
-			pdata->flags & S3C24XX_LEDF_ACTLOW ? 1 : 0);
+	/* Default to off */
+	led->gpiod = devm_gpiod_get(&dev->dev, NULL, GPIOD_OUT_LOW);
+	if (IS_ERR(led->gpiod))
+		return PTR_ERR(led->gpiod);
 
 	/* register our new led device */
-
 	ret = devm_led_classdev_register(&dev->dev, &led->cdev);
 	if (ret < 0)
 		dev_err(&dev->dev, "led_classdev_register failed\n");
diff --git a/include/linux/platform_data/leds-s3c24xx.h b/include/linux/platform_data/leds-s3c24xx.h
index 5bbae85811e2..64f8d14876e0 100644
--- a/include/linux/platform_data/leds-s3c24xx.h
+++ b/include/linux/platform_data/leds-s3c24xx.h
@@ -10,13 +10,7 @@
 #ifndef __LEDS_S3C24XX_H
 #define __LEDS_S3C24XX_H
 
-#define S3C24XX_LEDF_ACTLOW	(1<<0)		/* LED is on when GPIO low */
-#define S3C24XX_LEDF_TRISTATE	(1<<1)		/* tristate to turn off */
-
 struct s3c24xx_led_platdata {
-	unsigned int		 gpio;
-	unsigned int		 flags;
-
 	char			*name;
 	char			*def_trigger;
 };
-- 
2.25.4

