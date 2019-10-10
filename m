Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3914BD32C4
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 22:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfJJUrL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Oct 2019 16:47:11 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44461 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJUrL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Oct 2019 16:47:11 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N5UoU-1i2es011GU-016zYG; Thu, 10 Oct 2019 22:46:54 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
        Arnd Bergmann <arnd@arndb.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH 22/36] ARM: s3c: leds: move setpull() calls into board files
Date:   Thu, 10 Oct 2019 22:30:06 +0200
Message-Id: <20191010203043.1241612-22-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IjPRqyNCk9Jj8lgUo8AGgUPg4bR6DprP+OOdXhqNKO8qOwt0xhd
 C2SHsPn0rmLvp2BmEar807/8Lz+jbW7k3OFnX7y5QpbWJWDK+vSQG3ohu5Ec37V5pxMtJtw
 Bs1DvB8VuRoB5HXGLVPgk7CtO1dROru3DxpAM/lf+ydZz9tju0gPnpI7GVbB3tQzTWZ00UZ
 SmX7AKF4lhuV4m494d8xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RTbf8pI/5gU=:ul670ZZ9CbPFvAMiWRVmzi
 tCWOzza+8z1LsijOSpOzEM09hLnF6pe8LnRuHaxMDgHvZ9VCAu5mMYycu9NqdQ8WngQj+25eT
 65fZrcYeKIRW3R1u1JXiIgU4MzCcOOkRBBOZK4iMS49RCuSjtG4W62KQGBTnhJG6ZTeB1hOtT
 DCGd7ofv3Gk4pqgNM3Tu0s7jcR2mvVhY3z+poyiIenX7WB/jkuttJztXqvOOx/mJOrtJAmoQw
 sXsJr1AxRq6sjZCUnXfh4gLby78+4AKu9FY41zzrLv1Qv5sj7PgJGxtV8ZWgxxNj5P8gZF+8X
 3/RmmgE27M1pfFSHkeTdX7VfjtM3pcPNUM60fLtXxvvIh9NCaeM6123xQMQcbO9SyCEaDZOIK
 ZgxBip39nf8EaqDUFw8oLNl/cDGjd4ezhMLe6pgoquLoO/BuC04S/h+m+Qcd94eX6SFz4yYPh
 W+TVWxqFkueJRU+BcWEMoWcUa1dkHBbRVdi1LBGhOipuvXCYcCBncRTgs/kgbSmyKYgE0JuNo
 U2GTD5bEeQ/rpQlFIuNb0w5qB7f13lSbXMFPRxzBmTKB8wb3JGfidhXk3PXuTGZSjZp/Y0MFR
 pYew8tNdEQu6x291LBV1308oZ5Mii0Ojoe8JHa2PlxlJrQE++HjeYYULL/UVGUNxHCsaCqmNN
 db2qzZEIGYPI0q4C8rjP+8bHYd1PMPfihvpp7WoH6b/bUwpVFIBlabx5f01+ClTu26c1bvUYm
 MHxkZYSekW3l9HR3iZYZ/XySmNiJUwuaj+WKPfFSGnse+bEoPoiC5+cpKkG/CVosQj4RwxJF6
 azmCqWbFFri4rO3D7Cx5IjqRjOszEhV4CLpM9JKkHftUplP2u0R6Ro0DQbIK8/H2tizfEjGrD
 D1BhRf1YcUd6Pd7ONehA==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The leds-s3c24xx driver calls the private s3c_gpio_setpull()
interface for each gpio line, but doing this requires
access to the machine header files.

Move those calls into the machine init functions for any
board that uses the driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/common-smdk.c   | 6 ++++--
 arch/arm/mach-s3c24xx/mach-mini2440.c | 6 ++++++
 arch/arm/mach-s3c24xx/mach-n30.c      | 5 +++++
 arch/arm/mach-s3c24xx/mach-qt2410.c   | 1 +
 arch/arm/mach-s3c24xx/mach-vr1000.c   | 7 +++++++
 drivers/leds/leds-s3c24xx.c           | 7 -------
 6 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 58e30cad386c..5392d5106b4b 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -189,11 +189,13 @@ static const struct gpio smdk_led_gpios[] = {
 void __init smdk_machine_init(void)
 {
 	/* Configure the LEDs (even if we have no LED support)*/
+	int i, ret;
 
-	int ret = gpio_request_array(smdk_led_gpios,
-				     ARRAY_SIZE(smdk_led_gpios));
+	ret = gpio_request_array(smdk_led_gpios, ARRAY_SIZE(smdk_led_gpios));
 	if (!WARN_ON(ret < 0))
 		gpio_free_array(smdk_led_gpios, ARRAY_SIZE(smdk_led_gpios));
+	for (i = 0; i < ARRAY_SIZE(smdk_led_gpios); i++)
+		s3c_gpio_setpull(smdk_led_gpios[i].gpio, S3C_GPIO_PULL_NONE);
 
 	if (machine_is_smdk2443())
 		smdk_nand_info.twrph0 = 50;
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index bb44b8704d64..894d43ff94f1 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -690,6 +690,12 @@ static void __init mini2440_init(void)
 	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
 			      S3C_GPIO_PULL_NONE);
 
+	/* LEDs: no point in having a pull-up if we are always driving */
+	s3c_gpio_setpull(S3C2410_GPB(5), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(6), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(7), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(8), S3C_GPIO_PULL_NONE);
+
 	if (features.lcd_index != -1) {
 		int li;
 
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 1836f1cc0992..5f5ca4b7015c 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -571,6 +571,11 @@ static void __init n30_init(void)
 			      S3C2410_MISCCR_USBSUSPND0 |
 			      S3C2410_MISCCR_USBSUSPND1, 0x0);
 
+	/* LEDs: no point in having a pull-up if we are always driving */
+	s3c_gpio_setpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
+
 	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
 	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
 			      S3C_GPIO_PULL_NONE);
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 3cf8423c76c6..6686f02a3f4f 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -332,6 +332,7 @@ static void __init qt2410_machine_init(void)
 
 	/* set initial state of the LED GPIO */
 	WARN_ON(gpio_request_one(S3C2410_GPB(0), GPIOF_OUT_INIT_HIGH, NULL));
+	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
 	gpio_free(S3C2410_GPB(0));
 
 	s3c24xx_udc_set_platdata(&qt2410_udc_cfg);
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24xx/mach-vr1000.c
index 853e74f9b8b5..ca2f874a637e 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -37,6 +37,7 @@
 #include <mach/hardware.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
@@ -322,6 +323,12 @@ static void __init vr1000_init(void)
 	i2c_register_board_info(0, vr1000_i2c_devs,
 				ARRAY_SIZE(vr1000_i2c_devs));
 
+
+	/* LEDs: no point in having a pull-up if we are always driving */
+	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(1), S3C_GPIO_PULL_NONE);
+	s3c_gpio_setpull(S3C2410_GPB(2), S3C_GPIO_PULL_NONE);
+
 	nor_simtec_init();
 	simtec_audio_add(NULL, true, NULL);
 
diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index f8b8d6e313ee..bc67e5d344a6 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -16,9 +16,6 @@
 #include <linux/module.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 
-#include <mach/regs-gpio.h>
-#include <plat/gpio-cfg.h>
-
 /* our context */
 
 struct s3c24xx_gpio_led {
@@ -73,10 +70,6 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 	if (ret < 0)
 		return ret;
 
-	/* no point in having a pull-up if we are always driving */
-
-	s3c_gpio_setpull(pdata->gpio, S3C_GPIO_PULL_NONE);
-
 	if (pdata->flags & S3C24XX_LEDF_TRISTATE)
 		gpio_direction_input(pdata->gpio);
 	else
-- 
2.20.0

