Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7317D6957B
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391385AbfGOO5p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:57:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56233 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390305AbfGOO5o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:44 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mo6zF-1iGLxR3Mxn-00pdeU; Mon, 15 Jul 2019 16:57:38 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH 1/6] leds: apu: drop superseeded apu2/3 led support
Date:   Mon, 15 Jul 2019 16:57:28 +0200
Message-Id: <1563202653-20994-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563202653-20994-1-git-send-email-info@metux.net>
References: <1563202653-20994-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:CS/XwDeDNKuT4rMh3j6KhNa13i86/GxMiL9rPw4R4ZWsGYY18kC
 B67X4lykS4tlqRTqsLI6n7BVlbpgAFsQWg3JJT1b6T9l2w/x3qta0vNULdYoRHOPJXMABxa
 qvTyBRHvEz4Ohx2DCZ166WfreSKFfFrAtS9NzdzVrLfXDv1bk2Xp7+wRImQZ9dCF1613NGP
 1T5iP4unrjv/Tm7+CxNWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E+hoOP6AaWI=:eEmGcgn/Nn9laN8z9RvnYC
 pCN2aTuLn2CeiFrzKDcB54r4zxY/4L1ohipZkBb2u2XiYCgOHRKFkWld+JP6UeE7c6/1+g1oa
 jDWgU+EeGzhnh2TeZLAufN6xcDSONeGCkeJEPs7QsAtba4CAf0CIY8ZX32f56DfPUV+FVKuDE
 iHG43lAQJHtkvZ+J2Rw1Om4q/MIwOfpGBhWc9BZ5TraaKIzoK9ekN434NEH+B7NehoEzwAAjm
 wzpQTzMzL5CQocH5kmuIYrdQ70MC57tZ9bFZYrDfa9DgbNoth1XJDQMWsezboM2hefucxDVJ9
 4ymGKz1KeUfNvmIEe1uoTzfGrQWzOW6J2sAE30NqA9nM9NmM9y/VbVbFi4xMsMemr7gqwxDbZ
 S3fUhd0T8d/fKBPJiagnDiXU+URRMnIPzWToOhaoz9AqN1rWh4BGXPqeriVMU1ZZylyQJvywe
 0ua+TzhHZKYS6ACEy5JJcI3Qihq9PTmyctlMPCt9PQL4XkVH6+NIIW+J/7WV/4JJ56svxio0E
 p5YxL5WmzVtUGtGt5QfnDVOMwJmYDOeHtImuSBE9EDRpqJQl9KoSyvkZIwr4kQ6Icz7FrF+OX
 0f9AsCL01CpYK3EO2IwT5x/ZjTsrKIH39l2xX5x5K9nlwrnP/bALyPo8ROhIX29GaHQdoa9e+
 a1eVeh++8NQJ5cuaP8kNpRJ1pVrpUXLHDvMMyCypfL/VIUbAAN7ZE+SuoKlhXB8791FirZe4p
 QalfFqYcgFNIKuY0f+S0h40zMe3kMIjrSfdvLg==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

This driver only supports gpio-attached LEDs on apu1/2/3 boards,
but neither gpio's themselves, nor other gpio-attached devices
(eg. front button).

For apu2+ a newer, more complete driver exists, based on a generic
driver for the AMD SOCs gpio-controller, supporting LEDs as well
other devices. Therefore these boards don't need legacy support
from this driver anymore.

Both drivers claim the same device, so only one driver may exist
in a system, putting distros in the position to decide between
either apu2+ keys or apu1 led support.

Therefore drop the apu2+ led support from the old driver, solve
the conflict and reduce unnecessary code.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/leds/Kconfig    |   5 +-
 drivers/leds/leds-apu.c | 124 +++---------------------------------------------
 2 files changed, 10 insertions(+), 119 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b0fdeef..f7a3dd7 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -74,9 +74,12 @@ config LEDS_APU
 	depends on LEDS_CLASS
 	depends on X86 && DMI
 	help
-	  This driver makes the PC Engines APU/APU2/APU3 front panel LEDs
+	  This driver makes the PC Engines APU1 front panel LEDs
 	  accessible from userspace programs through the LED subsystem.
 
+	  If you're looking for APU2/3, use the pcengines-apu2 driver.
+	  (symbol CONFIG_PCENGINES_APU2)
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called leds-apu.
 
diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 8d42e46..140093a 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -47,12 +47,6 @@
 #define APU1_NUM_GPIO           3
 #define APU1_IOSIZE             sizeof(u8)
 
-#define APU2_FCH_ACPI_MMIO_BASE 0xFED80000
-#define APU2_FCH_GPIO_BASE      (APU2_FCH_ACPI_MMIO_BASE + 0x1500)
-#define APU2_GPIO_BIT_WRITE     22
-#define APU2_APU2_NUM_GPIO      4
-#define APU2_IOSIZE             sizeof(u32)
-
 /* LED access parameters */
 struct apu_param {
 	void __iomem *addr; /* for ioread/iowrite */
@@ -75,7 +69,6 @@ struct apu_led_profile {
 /* Supported platform types */
 enum apu_led_platform_types {
 	APU1_LED_PLATFORM,
-	APU2_LED_PLATFORM,
 };
 
 struct apu_led_pdata {
@@ -96,19 +89,6 @@ struct apu_led_pdata {
 	{ "apu:green:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
 };
 
-static const struct apu_led_profile apu2_led_profile[] = {
-	{ "apu2:green:1", LED_ON,  APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
-	{ "apu2:green:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
-	{ "apu2:green:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
-};
-
-/* Same as apu2_led_profile, but with "3" in the LED names. */
-static const struct apu_led_profile apu3_led_profile[] = {
-	{ "apu3:green:1", LED_ON,  APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
-	{ "apu3:green:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
-	{ "apu3:green:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
-};
-
 static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
 	{
 		.ident = "apu",
@@ -117,54 +97,6 @@ struct apu_led_pdata {
 			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
 		}
 	},
-	/* PC Engines APU2 with "Legacy" bios < 4.0.8 */
-	{
-		.ident = "apu2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
-			DMI_MATCH(DMI_BOARD_NAME, "APU2")
-		}
-	},
-	/* PC Engines APU2 with "Legacy" bios >= 4.0.8 */
-	{
-		.ident = "apu2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
-			DMI_MATCH(DMI_BOARD_NAME, "apu2")
-		}
-	},
-	/* PC Engines APU2 with "Mainline" bios */
-	{
-		.ident = "apu2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
-			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu2")
-		}
-	},
-	/* PC Engines APU3 with "Legacy" bios < 4.0.8 */
-	{
-		.ident = "apu3",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
-			DMI_MATCH(DMI_BOARD_NAME, "APU3")
-		}
-	},
-	/* PC Engines APU3 with "Legacy" bios >= 4.0.8 */
-	{
-		.ident = "apu3",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
-			DMI_MATCH(DMI_BOARD_NAME, "apu3")
-		}
-	},
-	/* PC Engines APU2 with "Mainline" bios */
-	{
-		.ident = "apu3",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
-			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu3")
-		}
-	},
 	{}
 };
 MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
@@ -178,25 +110,6 @@ static void apu1_led_brightness_set(struct led_classdev *led, enum led_brightnes
 	spin_unlock(&apu_led->lock);
 }
 
-static void apu2_led_brightness_set(struct led_classdev *led, enum led_brightness value)
-{
-	struct apu_led_priv *pled = cdev_to_priv(led);
-	u32 value_new;
-
-	spin_lock(&apu_led->lock);
-
-	value_new = ioread32(pled->param.addr);
-
-	if (value)
-		value_new &= ~BIT(APU2_GPIO_BIT_WRITE);
-	else
-		value_new |= BIT(APU2_GPIO_BIT_WRITE);
-
-	iowrite32(value_new, pled->param.addr);
-
-	spin_unlock(&apu_led->lock);
-}
-
 static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 {
 	int i;
@@ -219,8 +132,6 @@ static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 		led_cdev->flags = LED_CORE_SUSPENDRESUME;
 		if (apu_led->platform == APU1_LED_PLATFORM)
 			led_cdev->brightness_set = apu1_led_brightness_set;
-		else if (apu_led->platform == APU2_LED_PLATFORM)
-			led_cdev->brightness_set = apu2_led_brightness_set;
 
 		pled->param.addr = devm_ioremap(dev,
 				apu_led->profile[i].offset, apu_led->iosize);
@@ -254,27 +165,10 @@ static int __init apu_led_probe(struct platform_device *pdev)
 
 	apu_led->pdev = pdev;
 
-	if (dmi_match(DMI_PRODUCT_NAME, "APU")) {
-		apu_led->profile = apu1_led_profile;
-		apu_led->platform = APU1_LED_PLATFORM;
-		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
-		apu_led->iosize = APU1_IOSIZE;
-	} else if (dmi_match(DMI_BOARD_NAME, "APU2") ||
-		   dmi_match(DMI_BOARD_NAME, "apu2") ||
-		   dmi_match(DMI_BOARD_NAME, "PC Engines apu2")) {
-		apu_led->profile = apu2_led_profile;
-		apu_led->platform = APU2_LED_PLATFORM;
-		apu_led->num_led_instances = ARRAY_SIZE(apu2_led_profile);
-		apu_led->iosize = APU2_IOSIZE;
-	} else if (dmi_match(DMI_BOARD_NAME, "APU3") ||
-		   dmi_match(DMI_BOARD_NAME, "apu3") ||
-		   dmi_match(DMI_BOARD_NAME, "PC Engines apu3")) {
-		apu_led->profile = apu3_led_profile;
-		/* Otherwise identical to APU2. */
-		apu_led->platform = APU2_LED_PLATFORM;
-		apu_led->num_led_instances = ARRAY_SIZE(apu3_led_profile);
-		apu_led->iosize = APU2_IOSIZE;
-	}
+	apu_led->profile = apu1_led_profile;
+	apu_led->platform = APU1_LED_PLATFORM;
+	apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
+	apu_led->iosize = APU1_IOSIZE;
 
 	spin_lock_init(&apu_led->lock);
 	return apu_led_config(&pdev->dev, apu_led);
@@ -295,13 +189,7 @@ static int __init apu_led_init(void)
 		pr_err("No PC Engines board detected\n");
 		return -ENODEV;
 	}
-	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") ||
-	      dmi_match(DMI_PRODUCT_NAME, "APU2") ||
-	      dmi_match(DMI_PRODUCT_NAME, "apu2") ||
-	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2") ||
-	      dmi_match(DMI_PRODUCT_NAME, "APU3") ||
-	      dmi_match(DMI_PRODUCT_NAME, "apu3") ||
-	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu3"))) {
+	if (!(dmi_match(DMI_PRODUCT_NAME, "APU"))) {
 		pr_err("Unknown PC Engines board: %s\n",
 				dmi_get_system_info(DMI_PRODUCT_NAME));
 		return -ENODEV;
@@ -337,6 +225,6 @@ static void __exit apu_led_exit(void)
 module_exit(apu_led_exit);
 
 MODULE_AUTHOR("Alan Mizrahi");
-MODULE_DESCRIPTION("PC Engines APU family LED driver");
+MODULE_DESCRIPTION("PC Engines APU1 front LED driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:leds_apu");
-- 
1.9.1

