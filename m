Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A846B32B26D
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243875AbhCCCpS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:45:18 -0500
Received: from mx4.wp.pl ([212.77.101.11]:13033 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1837964AbhCBWNf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 2 Mar 2021 17:13:35 -0500
Received: (wp-smtpd smtp.wp.pl 11724 invoked from network); 2 Mar 2021 19:12:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1614708731; bh=ciS88uVJy8OrbsbcD0pWozRcCU7AyCe4P5bhTsESSds=;
          h=From:To:Cc:Subject;
          b=g7qZybdDnxjUM2uL/xez/E+l5BpvZQwy9EaTBi45ktyFp082Nh6XpYOffIEu2BgDD
           Ohh0mGwgLLeGlIm9A5F2ly+2zO3CslTHgqiLle+d9xnpWJr6JaTo13Wd4TZxPVW5fr
           LYacI7c/VKn58ssXjL/dns1BFK594SmDJeJ83T4g=
Received: from 79.184.197.150.ipv4.supernova.orange.pl (HELO localhost) (antoni.przybylik@wp.pl@[79.184.197.150])
          (envelope-sender <antoni.przybylik@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <pavel@ucw.cz>; 2 Mar 2021 19:12:11 +0100
From:   Antoni Przybylik <antoni.przybylik@wp.pl>
To:     pavel@ucw.cz
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Antoni Przybylik <antoni.przybylik@wp.pl>
Subject: [PATCH] Leds: made enum led_brightness into typedef
Date:   Tue,  2 Mar 2021 19:11:26 +0100
Message-Id: <20210302181126.515419-1-antoni.przybylik@wp.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: 54f454c0f2e13ec5a5b7c7ec9654e10b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [kRNU]                               
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In TODO it was written:
* Get rid of enum led_brightness

It is really an integer, as maximum is configurable. Get rid of it, or
make it into typedef or something.

So I made it into typedef.

Signed-off-by: Antoni Przybylik <antoni.przybylik@wp.pl>
---
 drivers/leds/TODO                     |  5 ----
 drivers/leds/blink/leds-lgm-sso.c     |  6 ++---
 drivers/leds/flash/leds-rt8515.c      |  2 +-
 drivers/leds/led-class-multicolor.c   |  2 +-
 drivers/leds/led-triggers.c           |  2 +-
 drivers/leds/leds-88pm860x.c          |  2 +-
 drivers/leds/leds-aat1290.c           |  8 +++----
 drivers/leds/leds-acer-a500.c         |  2 +-
 drivers/leds/leds-adp5520.c           |  2 +-
 drivers/leds/leds-an30259a.c          |  2 +-
 drivers/leds/leds-apu.c               |  4 ++--
 drivers/leds/leds-ariel.c             |  4 ++--
 drivers/leds/leds-as3645a.c           |  4 ++--
 drivers/leds/leds-asic3.c             |  2 +-
 drivers/leds/leds-aw2013.c            |  2 +-
 drivers/leds/leds-bcm6328.c           |  2 +-
 drivers/leds/leds-bcm6358.c           |  2 +-
 drivers/leds/leds-bd2802.c            |  2 +-
 drivers/leds/leds-blinkm.c            |  8 +++----
 drivers/leds/leds-clevo-mail.c        |  2 +-
 drivers/leds/leds-cobalt-qube.c       |  2 +-
 drivers/leds/leds-cobalt-raq.c        |  4 ++--
 drivers/leds/leds-cpcap.c             |  2 +-
 drivers/leds/leds-cr0014114.c         |  2 +-
 drivers/leds/leds-da903x.c            |  2 +-
 drivers/leds/leds-da9052.c            |  4 ++--
 drivers/leds/leds-dac124s085.c        |  2 +-
 drivers/leds/leds-el15203000.c        |  2 +-
 drivers/leds/leds-fsg.c               | 12 +++++-----
 drivers/leds/leds-gpio.c              |  4 ++--
 drivers/leds/leds-hp6xx.c             |  4 ++--
 drivers/leds/leds-ip30.c              |  2 +-
 drivers/leds/leds-ipaq-micro.c        |  2 +-
 drivers/leds/leds-is31fl319x.c        |  2 +-
 drivers/leds/leds-is31fl32xx.c        |  2 +-
 drivers/leds/leds-ktd2692.c           |  6 ++---
 drivers/leds/leds-lm3530.c            |  4 ++--
 drivers/leds/leds-lm3532.c            |  2 +-
 drivers/leds/leds-lm3533.c            |  4 ++--
 drivers/leds/leds-lm355x.c            |  6 ++---
 drivers/leds/leds-lm3601x.c           |  2 +-
 drivers/leds/leds-lm36274.c           |  2 +-
 drivers/leds/leds-lm3642.c            |  6 ++---
 drivers/leds/leds-lm3692x.c           |  4 ++--
 drivers/leds/leds-lm3697.c            |  2 +-
 drivers/leds/leds-locomo.c            |  6 ++---
 drivers/leds/leds-lp3944.c            |  4 ++--
 drivers/leds/leds-lp3952.c            |  2 +-
 drivers/leds/leds-lp50xx.c            |  2 +-
 drivers/leds/leds-lp55xx-common.c     |  4 ++--
 drivers/leds/leds-lp8788.c            |  2 +-
 drivers/leds/leds-lp8860.c            |  2 +-
 drivers/leds/leds-lt3593.c            |  2 +-
 drivers/leds/leds-max77650.c          |  2 +-
 drivers/leds/leds-max77693.c          |  2 +-
 drivers/leds/leds-max8997.c           |  4 ++--
 drivers/leds/leds-mc13783.c           |  2 +-
 drivers/leds/leds-menf21bmc.c         |  2 +-
 drivers/leds/leds-mlxcpld.c           |  4 ++--
 drivers/leds/leds-mlxreg.c            |  8 +++----
 drivers/leds/leds-mt6323.c            | 10 ++++----
 drivers/leds/leds-net48xx.c           |  2 +-
 drivers/leds/leds-netxbig.c           |  2 +-
 drivers/leds/leds-nic78bx.c           |  4 ++--
 drivers/leds/leds-ns2.c               |  4 ++--
 drivers/leds/leds-ot200.c             |  2 +-
 drivers/leds/leds-pca9532.c           |  4 ++--
 drivers/leds/leds-pca955x.c           |  2 +-
 drivers/leds/leds-pca963x.c           |  4 ++--
 drivers/leds/leds-pm8058.c            |  6 ++---
 drivers/leds/leds-powernv.c           |  8 +++----
 drivers/leds/leds-pwm.c               |  2 +-
 drivers/leds/leds-rb532.c             |  4 ++--
 drivers/leds/leds-regulator.c         |  4 ++--
 drivers/leds/leds-s3c24xx.c           |  2 +-
 drivers/leds/leds-sc27xx-bltc.c       |  4 ++--
 drivers/leds/leds-sgm3140.c           |  2 +-
 drivers/leds/leds-spi-byte.c          |  2 +-
 drivers/leds/leds-ss4200.c            |  2 +-
 drivers/leds/leds-sunfire.c           | 18 +++++++--------
 drivers/leds/leds-syscon.c            |  2 +-
 drivers/leds/leds-tca6507.c           |  2 +-
 drivers/leds/leds-tlc591xx.c          |  2 +-
 drivers/leds/leds-tps6105x.c          |  2 +-
 drivers/leds/leds-turris-omnia.c      |  2 +-
 drivers/leds/leds-wm831x-status.c     |  4 ++--
 drivers/leds/leds-wm8350.c            |  2 +-
 drivers/leds/leds-wrap.c              |  6 ++---
 drivers/leds/trigger/ledtrig-audio.c  |  6 ++---
 drivers/leds/trigger/ledtrig-camera.c |  4 ++--
 drivers/leds/uleds.c                  |  2 +-
 include/linux/leds.h                  | 33 +++++++++++++--------------
 92 files changed, 174 insertions(+), 180 deletions(-)

diff --git a/drivers/leds/TODO b/drivers/leds/TODO
index bfa60fa1d812..7ca785d0ff77 100644
--- a/drivers/leds/TODO
+++ b/drivers/leds/TODO
@@ -1,11 +1,6 @@
 -*- org -*-
 
 * On/off LEDs should have max_brightness of 1
-* Get rid of enum led_brightness
-
-It is really an integer, as maximum is configurable. Get rid of it, or
-make it into typedef or something.
-
 * Review atomicity requirements in LED subsystem
 
 Calls that may and that may not block are mixed in same structure, and
diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 7d5c9ca007d6..ad5f87e9111c 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -230,7 +230,7 @@ static void sso_led_freq_set(struct sso_led_priv *priv, u32 pin, int freq_idx)
 }
 
 static void sso_led_brightness_set(struct led_classdev *led_cdev,
-				   enum led_brightness brightness)
+				   led_brightness brightness)
 {
 	struct sso_led_priv *priv;
 	struct sso_led_desc *desc;
@@ -263,11 +263,11 @@ static void sso_led_brightness_set(struct led_classdev *led_cdev,
 		gpiod_set_value(led->gpiod, val);
 }
 
-static enum led_brightness sso_led_brightness_get(struct led_classdev *led_cdev)
+static led_brightness sso_led_brightness_get(struct led_classdev *led_cdev)
 {
 	struct sso_led *led = cdev_to_sso_led_data(led_cdev);
 
-	return (enum led_brightness)led->desc.brightness;
+	return (led_brightness)led->desc.brightness;
 }
 
 static int
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index 590bfa180d10..dd26374404c9 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -88,7 +88,7 @@ static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
 
 /* This is setting the torch light level */
 static int rt8515_led_brightness_set(struct led_classdev *led,
-				     enum led_brightness brightness)
+				     led_brightness brightness)
 {
 	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
 	struct rt8515 *rt = to_rt8515(fled);
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index e317408583df..06bee59c76db 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -13,7 +13,7 @@
 #include "leds.h"
 
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
-				 enum led_brightness brightness)
+				 led_brightness brightness)
 {
 	struct led_classdev *led_cdev = &mcled_cdev->led_cdev;
 	int i;
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 4e7b78a84149..c87b3e59436e 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -375,7 +375,7 @@ EXPORT_SYMBOL_GPL(devm_led_trigger_register);
 /* Simple LED Trigger Interface */
 
 void led_trigger_event(struct led_trigger *trig,
-			enum led_brightness brightness)
+			led_brightness brightness)
 {
 	struct led_classdev *led_cdev;
 	unsigned long flags;
diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 508d0d859f2e..b7a5f7428aac 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -64,7 +64,7 @@ static int led_power_set(struct pm860x_chip *chip, int port, int on)
 }
 
 static int pm860x_led_set(struct led_classdev *cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct pm860x_led *led = container_of(cdev, struct pm860x_led, cdev);
 	struct pm860x_chip *chip;
diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 589484b22c79..225f3f948887 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -55,7 +55,7 @@ struct aat1290_led_config_data {
 	/* external strobe capability */
 	bool has_external_strobe;
 	/* max LED brightness level */
-	enum led_brightness max_brightness;
+	led_brightness max_brightness;
 };
 
 struct aat1290_led {
@@ -138,7 +138,7 @@ static void aat1290_set_flash_safety_timer(struct aat1290_led *led,
 /* LED subsystem callbacks */
 
 static int aat1290_led_brightness_set(struct led_classdev *led_cdev,
-					enum led_brightness brightness)
+					led_brightness brightness)
 {
 	struct led_classdev_flash *fled_cdev = led_cdev_to_fled_cdev(led_cdev);
 	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
@@ -370,7 +370,7 @@ static void aat1290_init_flash_timeout(struct aat1290_led *led,
 }
 
 #if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
-static enum led_brightness aat1290_intensity_to_brightness(
+static led_brightness aat1290_intensity_to_brightness(
 					struct v4l2_flash *v4l2_flash,
 					s32 intensity)
 {
@@ -386,7 +386,7 @@ static enum led_brightness aat1290_intensity_to_brightness(
 }
 
 static s32 aat1290_brightness_to_intensity(struct v4l2_flash *v4l2_flash,
-					enum led_brightness brightness)
+					led_brightness brightness)
 {
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
 	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
diff --git a/drivers/leds/leds-acer-a500.c b/drivers/leds/leds-acer-a500.c
index 8cf0b11f4390..8bc7741cd337 100644
--- a/drivers/leds/leds-acer-a500.c
+++ b/drivers/leds/leds-acer-a500.c
@@ -35,7 +35,7 @@ static const struct reg_sequence a500_ec_orange_led_enable_seq[] = {
 };
 
 static int a500_ec_led_brightness_set(struct led_classdev *led_cdev,
-				      enum led_brightness value)
+				      led_brightness value)
 {
 	struct a500_led *led = container_of(led_cdev, struct a500_led, cdev);
 	struct reg_sequence control_seq[2];
diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 5a0cc7af2df8..7809e4b2eabd 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -27,7 +27,7 @@ struct adp5520_led {
 };
 
 static int adp5520_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct adp5520_led *led;
 
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index a0df1fb28774..3d1b3ee8ab5e 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -79,7 +79,7 @@ struct an30259a {
 };
 
 static int an30259a_brightness_set(struct led_classdev *cdev,
-				   enum led_brightness brightness)
+				   led_brightness brightness)
 {
 	struct an30259a_led *led;
 	int ret;
diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index c409b80c236d..d3fc7aaed12b 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -64,7 +64,7 @@ struct apu_led_priv {
 /* LED profile */
 struct apu_led_profile {
 	const char *name;
-	enum led_brightness brightness;
+	led_brightness brightness;
 	unsigned long offset; /* for devm_ioremap */
 };
 
@@ -103,7 +103,7 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
 
-static void apu1_led_brightness_set(struct led_classdev *led, enum led_brightness value)
+static void apu1_led_brightness_set(struct led_classdev *led, led_brightness value)
 {
 	struct apu_led_priv *pled = cdev_to_priv(led);
 
diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
index 49e1bddaa15e..40982e594402 100644
--- a/drivers/leds/leds-ariel.c
+++ b/drivers/leds/leds-ariel.c
@@ -31,7 +31,7 @@ struct ariel_led {
 
 #define led_cdev_to_ariel_led(c) container_of(c, struct ariel_led, led_cdev)
 
-static enum led_brightness ariel_led_get(struct led_classdev *led_cdev)
+static led_brightness ariel_led_get(struct led_classdev *led_cdev)
 {
 	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
 	unsigned int led_status = 0;
@@ -46,7 +46,7 @@ static enum led_brightness ariel_led_get(struct led_classdev *led_cdev)
 }
 
 static void ariel_led_set(struct led_classdev *led_cdev,
-			  enum led_brightness brightness)
+			  led_brightness brightness)
 {
 	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
 
diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index e8922fa03379..5fc4f5d9fc71 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -309,7 +309,7 @@ static unsigned int as3645a_current_to_reg(struct as3645a *flash, bool is_flash,
 }
 
 static int as3645a_set_indicator_brightness(struct led_classdev *iled_cdev,
-					    enum led_brightness brightness)
+					    led_brightness brightness)
 {
 	struct as3645a *flash = iled_cdev_to_as3645a(iled_cdev);
 	int rval;
@@ -324,7 +324,7 @@ static int as3645a_set_indicator_brightness(struct led_classdev *iled_cdev,
 }
 
 static int as3645a_set_assist_brightness(struct led_classdev *fled_cdev,
-					 enum led_brightness brightness)
+					 led_brightness brightness)
 {
 	struct led_classdev_flash *fled = lcdev_to_flcdev(fled_cdev);
 	struct as3645a *flash = fled_to_as3645a(fled);
diff --git a/drivers/leds/leds-asic3.c b/drivers/leds/leds-asic3.c
index 8cbc1b8bafa5..d12d6dfbc445 100644
--- a/drivers/leds/leds-asic3.c
+++ b/drivers/leds/leds-asic3.c
@@ -34,7 +34,7 @@ static const unsigned int led_n_base[ASIC3_NUM_LEDS] = {
 };
 
 static void brightness_set(struct led_classdev *cdev,
-	enum led_brightness value)
+	led_brightness value)
 {
 	struct platform_device *pdev = to_platform_device(cdev->dev->parent);
 	const struct mfd_cell *cell = mfd_get_cell(pdev);
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 80d937454aee..4c5e9cab7ddf 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -150,7 +150,7 @@ static bool aw2013_chip_in_use(struct aw2013 *chip)
 }
 
 static int aw2013_brightness_set(struct led_classdev *cdev,
-				 enum led_brightness brightness)
+				 led_brightness brightness)
 {
 	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
 	int ret, num;
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 226d17d253ed..962cd94e1d49 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -125,7 +125,7 @@ static void bcm6328_led_mode(struct bcm6328_led *led, unsigned long value)
 }
 
 static void bcm6328_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	struct bcm6328_led *led =
 		container_of(led_cdev, struct bcm6328_led, cdev);
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 9d2e487fa08a..684a99989033 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -73,7 +73,7 @@ static unsigned long bcm6358_led_busy(void __iomem *mem)
 }
 
 static void bcm6358_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	struct bcm6358_led *led =
 		container_of(led_cdev, struct bcm6358_led, cdev);
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 8bbaef5a2986..e21ef4453440 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -516,7 +516,7 @@ static struct device_attribute *bd2802_attributes[] = {
 
 #define BD2802_CONTROL_RGBS(name, id, clr)				\
 static int bd2802_set_##name##_brightness(struct led_classdev *led_cdev,\
-					enum led_brightness value)	\
+						led_brightness value)	\
 {									\
 	struct bd2802_led *led =					\
 		container_of(led_cdev, struct bd2802_led, cdev_##name);	\
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index b4e1fdff4186..a4a6674ce2ee 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -420,7 +420,7 @@ static int blinkm_transfer_hw(struct i2c_client *client, int cmd)
 }
 
 static int blinkm_led_common_set(struct led_classdev *led_cdev,
-				 enum led_brightness value, int color)
+				 led_brightness value, int color)
 {
 	/* led_brightness is 0, 127 or 255 - we just use it here as-is */
 	struct blinkm_led *led = cdev_to_blmled(led_cdev);
@@ -461,19 +461,19 @@ static int blinkm_led_common_set(struct led_classdev *led_cdev,
 }
 
 static int blinkm_led_red_set(struct led_classdev *led_cdev,
-			       enum led_brightness value)
+			       led_brightness value)
 {
 	return blinkm_led_common_set(led_cdev, value, RED);
 }
 
 static int blinkm_led_green_set(struct led_classdev *led_cdev,
-				 enum led_brightness value)
+				 led_brightness value)
 {
 	return blinkm_led_common_set(led_cdev, value, GREEN);
 }
 
 static int blinkm_led_blue_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
+				led_brightness value)
 {
 	return blinkm_led_common_set(led_cdev, value, BLUE);
 }
diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-mail.c
index f512e99b976b..9b4deac29eb0 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -93,7 +93,7 @@ static const struct dmi_system_id clevo_mail_led_dmi_table[] __initconst = {
 MODULE_DEVICE_TABLE(dmi, clevo_mail_led_dmi_table);
 
 static void clevo_mail_led_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
+				led_brightness value)
 {
 	i8042_lock_chip();
 
diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index ef22e1e94048..f4faa55214e9 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -18,7 +18,7 @@ static void __iomem *led_port;
 static u8 led_value;
 
 static void qube_front_led_set(struct led_classdev *led_cdev,
-			       enum led_brightness brightness)
+			       led_brightness brightness)
 {
 	if (brightness)
 		led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 045c239c7328..7c13af9d67a8 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -21,7 +21,7 @@ static u8 led_value;
 static DEFINE_SPINLOCK(led_value_lock);
 
 static void raq_web_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness brightness)
+			    led_brightness brightness)
 {
 	unsigned long flags;
 
@@ -42,7 +42,7 @@ static struct led_classdev raq_web_led = {
 };
 
 static void raq_power_off_led_set(struct led_classdev *led_cdev,
-				  enum led_brightness brightness)
+				  led_brightness brightness)
 {
 	unsigned long flags;
 
diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
index 7d41ce8c9bb1..0ab3247c9414 100644
--- a/drivers/leds/leds-cpcap.c
+++ b/drivers/leds/leds-cpcap.c
@@ -100,7 +100,7 @@ static int cpcap_led_set_power(struct cpcap_led *led, bool status)
 	return 0;
 }
 
-static int cpcap_led_set(struct led_classdev *ledc, enum led_brightness value)
+static int cpcap_led_set(struct led_classdev *ledc, led_brightness value)
 {
 	struct cpcap_led *led = container_of(ledc, struct cpcap_led, led);
 	int brightness;
diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index d03cfd3c0bfb..e25e700b8fc9 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -160,7 +160,7 @@ static void cr0014114_recount_work(struct work_struct *work)
 }
 
 static int cr0014114_set_sync(struct led_classdev *ldev,
-			      enum led_brightness brightness)
+			      led_brightness brightness)
 {
 	int			ret;
 	struct cr0014114_led    *led = container_of(ldev,
diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 2b5fb00438a2..3f61e8444ff8 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -38,7 +38,7 @@ struct da903x_led {
 #define DA9034_LED_OFFSET(id)	((id) - DA9034_ID_LED_1)
 
 static int da903x_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct da903x_led *led =
 			container_of(led_cdev, struct da903x_led, cdev);
diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 04060c862bf9..0e963f78d3d8 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -37,7 +37,7 @@ static unsigned char led_reg[] = {
 };
 
 static int da9052_set_led_brightness(struct da9052_led *led,
-				     enum led_brightness brightness)
+				     led_brightness brightness)
 {
 	u8 val;
 	int error;
@@ -52,7 +52,7 @@ static int da9052_set_led_brightness(struct da9052_led *led,
 }
 
 static int da9052_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct da9052_led *led =
 			container_of(led_cdev, struct da9052_led, cdev);
diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
index 20dc9b9d7dea..a02ee0007c40 100644
--- a/drivers/leds/leds-dac124s085.c
+++ b/drivers/leds/leds-dac124s085.c
@@ -31,7 +31,7 @@ struct dac124s085 {
 #define POWER_DOWN_OUTPUT	(3 << 12)
 
 static int dac124s085_set_brightness(struct led_classdev *ldev,
-				      enum led_brightness brightness)
+				      led_brightness brightness)
 {
 	struct dac124s085_led *led = container_of(ldev, struct dac124s085_led,
 						  ldev);
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 6ca47f2a2004..83dc155e63a0 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -126,7 +126,7 @@ static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
 }
 
 static int el15203000_set_blocking(struct led_classdev *ldev,
-				   enum led_brightness brightness)
+				   led_brightness brightness)
 {
 	struct el15203000_led *led = container_of(ldev,
 						  struct el15203000_led,
diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
index bc6b420637d6..84dac4a372ee 100644
--- a/drivers/leds/leds-fsg.c
+++ b/drivers/leds/leds-fsg.c
@@ -30,7 +30,7 @@ static unsigned short latch_value;
 
 
 static void fsg_led_wlan_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
+			     led_brightness value)
 {
 	if (value) {
 		latch_value &= ~(1 << FSG_LED_WLAN_BIT);
@@ -42,7 +42,7 @@ static void fsg_led_wlan_set(struct led_classdev *led_cdev,
 }
 
 static void fsg_led_wan_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	if (value) {
 		latch_value &= ~(1 << FSG_LED_WAN_BIT);
@@ -54,7 +54,7 @@ static void fsg_led_wan_set(struct led_classdev *led_cdev,
 }
 
 static void fsg_led_sata_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
+			     led_brightness value)
 {
 	if (value) {
 		latch_value &= ~(1 << FSG_LED_SATA_BIT);
@@ -66,7 +66,7 @@ static void fsg_led_sata_set(struct led_classdev *led_cdev,
 }
 
 static void fsg_led_usb_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	if (value) {
 		latch_value &= ~(1 << FSG_LED_USB_BIT);
@@ -78,7 +78,7 @@ static void fsg_led_usb_set(struct led_classdev *led_cdev,
 }
 
 static void fsg_led_sync_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
+			     led_brightness value)
 {
 	if (value) {
 		latch_value &= ~(1 << FSG_LED_SYNC_BIT);
@@ -90,7 +90,7 @@ static void fsg_led_sync_set(struct led_classdev *led_cdev,
 }
 
 static void fsg_led_ring_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
+			     led_brightness value)
 {
 	if (value) {
 		latch_value &= ~(1 << FSG_LED_RING_BIT);
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index b5d5e22d2d1e..417bc44477f6 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -32,7 +32,7 @@ static inline struct gpio_led_data *
 }
 
 static void gpio_led_set(struct led_classdev *led_cdev,
-	enum led_brightness value)
+	led_brightness value)
 {
 	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
 	int level;
@@ -55,7 +55,7 @@ static void gpio_led_set(struct led_classdev *led_cdev,
 }
 
 static int gpio_led_set_blocking(struct led_classdev *led_cdev,
-	enum led_brightness value)
+	led_brightness value)
 {
 	gpio_led_set(led_cdev, value);
 	return 0;
diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
index 54af9e63c09c..e328a47fd1fa 100644
--- a/drivers/leds/leds-hp6xx.c
+++ b/drivers/leds/leds-hp6xx.c
@@ -15,7 +15,7 @@
 #include <mach/hp6xx.h>
 
 static void hp6xxled_green_set(struct led_classdev *led_cdev,
-			       enum led_brightness value)
+			       led_brightness value)
 {
 	u8 v8;
 
@@ -27,7 +27,7 @@ static void hp6xxled_green_set(struct led_classdev *led_cdev,
 }
 
 static void hp6xxled_red_set(struct led_classdev *led_cdev,
-			     enum led_brightness value)
+			     led_brightness value)
 {
 	u16 v16;
 
diff --git a/drivers/leds/leds-ip30.c b/drivers/leds/leds-ip30.c
index 1f952bad0fe8..927a7e6115be 100644
--- a/drivers/leds/leds-ip30.c
+++ b/drivers/leds/leds-ip30.c
@@ -18,7 +18,7 @@ struct ip30_led {
 };
 
 static void ip30led_set(struct led_classdev *led_cdev,
-			enum led_brightness value)
+			led_brightness value)
 {
 	struct ip30_led *led = container_of(led_cdev, struct ip30_led, cdev);
 
diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 504a95b6ef45..e855987501b7 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -19,7 +19,7 @@
 #define LED_ALWAYS   (1 << 6) /* LED Interrupt Mask 0:No mask, 1:mask         */
 
 static int micro_leds_brightness_set(struct led_classdev *led_cdev,
-				      enum led_brightness value)
+				      led_brightness value)
 {
 	struct ipaq_micro *micro = dev_get_drvdata(led_cdev->dev->parent->parent);
 	/*
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 4161b9dd7e48..d994c55a1129 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -108,7 +108,7 @@ static const struct of_device_id of_is31fl319x_match[] = {
 MODULE_DEVICE_TABLE(of, of_is31fl319x_match);
 
 static int is31fl319x_brightness_set(struct led_classdev *cdev,
-				     enum led_brightness brightness)
+				     led_brightness brightness)
 {
 	struct is31fl319x_led *led = container_of(cdev, struct is31fl319x_led,
 						  cdev);
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 2180255ad339..603932877035 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -220,7 +220,7 @@ static int is31fl3216_software_shutdown(struct is31fl32xx_priv *priv,
  * register writes up to that point.
  */
 static int is31fl32xx_brightness_set(struct led_classdev *led_cdev,
-				     enum led_brightness brightness)
+				     led_brightness brightness)
 {
 	const struct is31fl32xx_led_data *led_data =
 		container_of(led_cdev, struct is31fl32xx_led_data, cdev);
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 632f10db4b3f..e1320943350c 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -68,7 +68,7 @@ struct ktd2692_led_config_data {
 	/* maximum flash timeout */
 	u32 flash_max_timeout;
 	/* max LED brightness level */
-	enum led_brightness max_brightness;
+	led_brightness max_brightness;
 };
 
 struct ktd2692_context {
@@ -83,7 +83,7 @@ struct ktd2692_context {
 	struct gpio_desc *ctrl_gpio;
 
 	enum ktd2692_led_mode mode;
-	enum led_brightness torch_brightness;
+	led_brightness torch_brightness;
 };
 
 static struct ktd2692_context *fled_cdev_to_led(
@@ -154,7 +154,7 @@ static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
 }
 
 static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
-				       enum led_brightness brightness)
+				       led_brightness brightness)
 {
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index 2db455efd4b1..660fb9fe938a 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -108,7 +108,7 @@ struct lm3530_data {
 	struct lm3530_platform_data *pdata;
 	enum lm3530_mode mode;
 	struct regulator *regulator;
-	enum led_brightness brightness;
+	led_brightness brightness;
 	bool enable;
 };
 
@@ -302,7 +302,7 @@ static int lm3530_init_registers(struct lm3530_data *drvdata)
 }
 
 static void lm3530_brightness_set(struct led_classdev *led_cdev,
-				     enum led_brightness brt_val)
+				     led_brightness brt_val)
 {
 	int err;
 	struct lm3530_data *drvdata =
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 0bf25bdde02f..fee38ae7e3b0 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -344,7 +344,7 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
 }
 
 static int lm3532_brightness_set(struct led_classdev *led_cdev,
-				 enum led_brightness brt_val)
+				 led_brightness brt_val)
 {
 	struct lm3532_led *led =
 			container_of(led_cdev, struct lm3532_led, led_dev);
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 43d5970d96aa..f415a3071947 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -116,7 +116,7 @@ static int lm3533_led_pattern_enable(struct lm3533_led *led, int enable)
 }
 
 static int lm3533_led_set(struct led_classdev *cdev,
-						enum led_brightness value)
+						led_brightness value)
 {
 	struct lm3533_led *led = to_lm3533_led(cdev);
 
@@ -128,7 +128,7 @@ static int lm3533_led_set(struct led_classdev *cdev,
 	return lm3533_ctrlbank_set_brightness(&led->cb, value);
 }
 
-static enum led_brightness lm3533_led_get(struct led_classdev *cdev)
+static led_brightness lm3533_led_get(struct led_classdev *cdev)
 {
 	struct lm3533_led *led = to_lm3533_led(cdev);
 	u8 val;
diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 2d3e11845ba5..4a14d6552f10 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -306,7 +306,7 @@ static int lm355x_control(struct lm355x_chip_data *chip,
 /* torch */
 
 static int lm355x_torch_brightness_set(struct led_classdev *cdev,
-					enum led_brightness brightness)
+					led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_torch);
@@ -321,7 +321,7 @@ static int lm355x_torch_brightness_set(struct led_classdev *cdev,
 /* flash */
 
 static int lm355x_strobe_brightness_set(struct led_classdev *cdev,
-					 enum led_brightness brightness)
+					 led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_flash);
@@ -336,7 +336,7 @@ static int lm355x_strobe_brightness_set(struct led_classdev *cdev,
 /* indicator */
 
 static int lm355x_indicator_brightness_set(struct led_classdev *cdev,
-					    enum led_brightness brightness)
+					    led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_indicator);
diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index d0e1d4814042..d1670b7fbf85 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -168,7 +168,7 @@ static int lm3601x_read_faults(struct lm3601x_led *led)
 }
 
 static int lm3601x_brightness_set(struct led_classdev *cdev,
-					enum led_brightness brightness)
+					led_brightness brightness)
 {
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(cdev);
 	struct lm3601x_led *led = fled_cdev_to_led(fled_cdev);
diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index aadb03468a40..a71c74485532 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -41,7 +41,7 @@ struct lm36274 {
 };
 
 static int lm36274_brightness_set(struct led_classdev *led_cdev,
-				  enum led_brightness brt_val)
+				  led_brightness brt_val)
 {
 	struct lm36274 *chip = container_of(led_cdev, struct lm36274, led_dev);
 
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 8007b82985a8..c896c251a355 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -196,7 +196,7 @@ static ssize_t torch_pin_store(struct device *dev,
 static DEVICE_ATTR_WO(torch_pin);
 
 static int lm3642_torch_brightness_set(struct led_classdev *cdev,
-					enum led_brightness brightness)
+					led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_torch);
@@ -243,7 +243,7 @@ static ssize_t strobe_pin_store(struct device *dev,
 static DEVICE_ATTR_WO(strobe_pin);
 
 static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
-					 enum led_brightness brightness)
+					 led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_flash);
@@ -258,7 +258,7 @@ static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
 
 /* indicator */
 static int lm3642_indicator_brightness_set(struct led_classdev *cdev,
-					    enum led_brightness brightness)
+					    led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_indicator);
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index e945de45388c..868fb8a74dd7 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -323,7 +323,7 @@ static int lm3692x_leds_disable(struct lm3692x_led *led)
 }
 
 static int lm3692x_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
+				led_brightness brt_val)
 {
 	struct lm3692x_led *led =
 			container_of(led_cdev, struct lm3692x_led, led_dev);
@@ -362,7 +362,7 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
-static enum led_brightness lm3692x_max_brightness(struct lm3692x_led *led,
+static led_brightness lm3692x_max_brightness(struct lm3692x_led *led,
 						  u32 max_cur)
 {
 	u32 max_code;
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 7d216cdb91a8..8be9314b87f0 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -111,7 +111,7 @@ static const struct regmap_config lm3697_regmap_config = {
 };
 
 static int lm3697_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
+				led_brightness brt_val)
 {
 	struct lm3697_led *led = container_of(led_cdev, struct lm3697_led,
 					      led_dev);
diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
index 42dc46e3f00f..d89abad2c7a2 100644
--- a/drivers/leds/leds-locomo.c
+++ b/drivers/leds/leds-locomo.c
@@ -15,7 +15,7 @@
 #include <asm/hardware/locomo.h>
 
 static void locomoled_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value, int offset)
+				led_brightness value, int offset)
 {
 	struct locomo_dev *locomo_dev = LOCOMO_DEV(led_cdev->dev->parent);
 	unsigned long flags;
@@ -29,13 +29,13 @@ static void locomoled_brightness_set(struct led_classdev *led_cdev,
 }
 
 static void locomoled_brightness_set0(struct led_classdev *led_cdev,
-				enum led_brightness value)
+				led_brightness value)
 {
 	locomoled_brightness_set(led_cdev, value, LOCOMO_LPT0);
 }
 
 static void locomoled_brightness_set1(struct led_classdev *led_cdev,
-				enum led_brightness value)
+				led_brightness value)
 {
 	locomoled_brightness_set(led_cdev, value, LOCOMO_LPT1);
 }
diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 838e6f19d37e..b375c585b304 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -277,7 +277,7 @@ static int lp3944_led_set_blink(struct led_classdev *led_cdev,
 }
 
 static int lp3944_led_set_brightness(struct led_classdev *led_cdev,
-				      enum led_brightness brightness)
+				      led_brightness brightness)
 {
 	struct lp3944_led_data *led = ldev_to_led(led_cdev);
 
@@ -321,7 +321,7 @@ static int lp3944_configure(struct i2c_client *client,
 
 			/* to expose the default value to userspace */
 			led->ldev.brightness =
-					(enum led_brightness) pled->status;
+					(led_brightness) pled->status;
 
 			/* Set the default led status */
 			err = lp3944_led_set(led, pled->status);
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 6ee9131fbf25..2631c5ed5f75 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -56,7 +56,7 @@ static void lp3952_on_off(struct lp3952_led_array *priv,
  * values 0-4. 0 meaning turn off.
  */
 static int lp3952_set_brightness(struct led_classdev *cdev,
-				 enum led_brightness value)
+				 led_brightness value)
 {
 	unsigned int reg, shift_val;
 	struct lp3952_ctrl_hdl *led = container_of(cdev,
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 06230614fdc5..105f9c324471 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -303,7 +303,7 @@ static struct lp50xx_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 }
 
 static int lp50xx_brightness_set(struct led_classdev *cdev,
-			     enum led_brightness brightness)
+			     led_brightness brightness)
 {
 	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
 	struct lp50xx_led *led = mcled_cdev_to_led(mc_dev);
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 81de1346bf5d..0232a57a5fc9 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -135,7 +135,7 @@ static struct attribute *lp55xx_led_attrs[] = {
 ATTRIBUTE_GROUPS(lp55xx_led);
 
 static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
-				    enum led_brightness brightness)
+				    led_brightness brightness)
 {
 	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
 	struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
@@ -147,7 +147,7 @@ static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
 }
 
 static int lp55xx_set_brightness(struct led_classdev *cdev,
-			     enum led_brightness brightness)
+			     led_brightness brightness)
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
 	struct lp55xx_device_config *cfg = led->chip->cfg;
diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 9b9525ccca15..134673b5267c 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -86,7 +86,7 @@ static int lp8788_led_enable(struct lp8788_led *led,
 }
 
 static int lp8788_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness val)
+				led_brightness val)
 {
 	struct lp8788_led *led =
 			container_of(led_cdev, struct lp8788_led, led_dev);
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index f0533a337bc1..7e98ab970041 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -203,7 +203,7 @@ static int lp8860_fault_check(struct lp8860_led *led)
 }
 
 static int lp8860_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
+				led_brightness brt_val)
 {
 	struct lp8860_led *led =
 			container_of(led_cdev, struct lp8860_led, led_dev);
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 68e06434ac08..5a8345d73d67 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -18,7 +18,7 @@ struct lt3593_led_data {
 };
 
 static int lt3593_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct lt3593_led_data *led_dat =
 		container_of(led_cdev, struct lt3593_led_data, cdev);
diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 1eeac56b0014..51809e407cf0 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -45,7 +45,7 @@ static struct max77650_led *max77650_to_led(struct led_classdev *cdev)
 }
 
 static int max77650_led_brightness_set(struct led_classdev *cdev,
-				       enum led_brightness brightness)
+				       led_brightness brightness)
 {
 	struct max77650_led *led = max77650_to_led(cdev);
 	int val, mask;
diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index 5c1faeb55a31..a79d99aa11bb 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -459,7 +459,7 @@ static int max77693_setup(struct max77693_led_device *led,
 
 /* LED subsystem callbacks */
 static int max77693_led_brightness_set(struct led_classdev *led_cdev,
-					enum led_brightness value)
+					led_brightness value)
 {
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	struct max77693_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index c0bddb33888d..7cd0b7887822 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -114,7 +114,7 @@ static void max8997_led_enable(struct max8997_led *led, bool enable)
 }
 
 static void max8997_led_set_current(struct max8997_led *led,
-				enum led_brightness value)
+				led_brightness value)
 {
 	int ret;
 	struct i2c_client *client = led->iodev->i2c;
@@ -146,7 +146,7 @@ static void max8997_led_set_current(struct max8997_led *led,
 }
 
 static void max8997_led_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
+				led_brightness value)
 {
 	struct max8997_led *led =
 			container_of(led_cdev, struct max8997_led, cdev);
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 675502c15c2b..ec839541a4cf 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -50,7 +50,7 @@ static unsigned int mc13xxx_max_brightness(int id)
 }
 
 static int mc13xxx_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	struct mc13xxx_led *led =
 		container_of(led_cdev, struct mc13xxx_led, cdev);
diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 6b1b47160602..3122de6788f3 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -50,7 +50,7 @@ static struct menf21bmc_led leds[] = {
 static DEFINE_MUTEX(led_lock);
 
 static void
-menf21bmc_led_set(struct led_classdev *led_cdev, enum led_brightness value)
+menf21bmc_led_set(struct led_classdev *led_cdev, led_brightness value)
 {
 	int led_val;
 	struct menf21bmc_led *led = container_of(led_cdev,
diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
index f4721f8065f0..119045d9af69 100644
--- a/drivers/leds/leds-mlxcpld.c
+++ b/drivers/leds/leds-mlxcpld.c
@@ -99,7 +99,7 @@ struct mlxcpld_led_profile {
 	u8 offset;
 	u8 mask;
 	u8 base_color;
-	enum led_brightness brightness;
+	led_brightness brightness;
 	const char *name;
 };
 
@@ -280,7 +280,7 @@ static void mlxcpld_led_store_hw(u8 mask, u8 off, u8 vset)
 }
 
 static void mlxcpld_led_brightness_set(struct led_classdev *led,
-				       enum led_brightness value)
+				       led_brightness value)
 {
 	struct mlxcpld_led_priv *pled = cdev_to_priv(led);
 
diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 82aea1cd0c12..8777f9a8fe2a 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -94,7 +94,7 @@ mlxreg_led_store_hw(struct mlxreg_led_data *led_data, u8 vset)
 	return ret;
 }
 
-static enum led_brightness
+static led_brightness
 mlxreg_led_get_hw(struct mlxreg_led_data *led_data)
 {
 	struct mlxreg_led_priv_data *priv = led_data->data_parent;
@@ -132,7 +132,7 @@ mlxreg_led_get_hw(struct mlxreg_led_data *led_data)
 }
 
 static int
-mlxreg_led_brightness_set(struct led_classdev *cled, enum led_brightness value)
+mlxreg_led_brightness_set(struct led_classdev *cled, led_brightness value)
 {
 	struct mlxreg_led_data *led_data = cdev_to_priv(cled);
 
@@ -142,7 +142,7 @@ mlxreg_led_brightness_set(struct led_classdev *cled, enum led_brightness value)
 		return mlxreg_led_store_hw(led_data, MLXREG_LED_IS_OFF);
 }
 
-static enum led_brightness
+static led_brightness
 mlxreg_led_brightness_get(struct led_classdev *cled)
 {
 	struct mlxreg_led_data *led_data = cdev_to_priv(cled);
@@ -187,7 +187,7 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 	struct mlxreg_core_data *data = led_pdata->data;
 	struct mlxreg_led_data *led_data;
 	struct led_classdev *led_cdev;
-	enum led_brightness brightness;
+	led_brightness brightness;
 	u32 regval;
 	int i;
 	int err;
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index f59e0e8bda8b..464d1096d2ed 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -83,7 +83,7 @@ struct mt6323_led {
 	int			id;
 	struct mt6323_leds	*parent;
 	struct led_classdev	cdev;
-	enum led_brightness	current_brightness;
+	led_brightness	current_brightness;
 };
 
 /**
@@ -105,7 +105,7 @@ struct mt6323_leds {
 };
 
 static int mt6323_led_hw_brightness(struct led_classdev *cdev,
-				    enum led_brightness brightness)
+				    led_brightness brightness)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
@@ -153,7 +153,7 @@ static int mt6323_led_hw_off(struct led_classdev *cdev)
 	return 0;
 }
 
-static enum led_brightness
+static led_brightness
 mt6323_get_led_hw_brightness(struct led_classdev *cdev)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
@@ -185,7 +185,7 @@ mt6323_get_led_hw_brightness(struct led_classdev *cdev)
 }
 
 static int mt6323_led_hw_on(struct led_classdev *cdev,
-			    enum led_brightness brightness)
+			    led_brightness brightness)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
@@ -306,7 +306,7 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 }
 
 static int mt6323_led_set_brightness(struct led_classdev *cdev,
-				     enum led_brightness brightness)
+				     led_brightness brightness)
 {
 	struct mt6323_led *led = container_of(cdev, struct mt6323_led, cdev);
 	struct mt6323_leds *leds = led->parent;
diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index a93468c13772..a963e51acb65 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -23,7 +23,7 @@
 static struct platform_device *pdev;
 
 static void net48xx_error_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+		led_brightness value)
 {
 	scx200_gpio_ops.gpio_set(NET48XX_ERROR_LED_GPIO, value ? 1 : 0);
 }
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 77213b79f84d..fd9c07f545a0 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -166,7 +166,7 @@ static int netxbig_led_blink_set(struct led_classdev *led_cdev,
 }
 
 static void netxbig_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	struct netxbig_led_data *led_dat =
 		container_of(led_cdev, struct netxbig_led_data, cdev);
diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index f196f52eec1e..98764072afca 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -42,7 +42,7 @@ static inline struct nic78bx_led *to_nic78bx_led(struct led_classdev *cdev)
 }
 
 static void nic78bx_brightness_set(struct led_classdev *cdev,
-				  enum led_brightness brightness)
+				  led_brightness brightness)
 {
 	struct nic78bx_led *nled = to_nic78bx_led(cdev);
 	unsigned long flags;
@@ -62,7 +62,7 @@ static void nic78bx_brightness_set(struct led_classdev *cdev,
 	spin_unlock_irqrestore(&nled->data->lock, flags);
 }
 
-static enum led_brightness nic78bx_brightness_get(struct led_classdev *cdev)
+static led_brightness nic78bx_brightness_get(struct led_classdev *cdev)
 {
 	struct nic78bx_led *nled = to_nic78bx_led(cdev);
 	unsigned long flags;
diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 1677d66d8b0e..7ffa6c4d7563 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -101,7 +101,7 @@ static void ns2_led_set_mode(struct ns2_led *led, enum ns2_led_modes mode)
 }
 
 static void ns2_led_set(struct led_classdev *led_cdev,
-			enum led_brightness value)
+			led_brightness value)
 {
 	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 	enum ns2_led_modes mode;
@@ -117,7 +117,7 @@ static void ns2_led_set(struct led_classdev *led_cdev,
 }
 
 static int ns2_led_set_blocking(struct led_classdev *led_cdev,
-			enum led_brightness value)
+			led_brightness value)
 {
 	ns2_led_set(led_cdev, value);
 	return 0;
diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
index 12af1127d9b7..9244d6fcafc1 100644
--- a/drivers/leds/leds-ot200.c
+++ b/drivers/leds/leds-ot200.c
@@ -90,7 +90,7 @@ static u8 leds_back;
 static u8 leds_front;
 
 static void ot200_led_brightness_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+		led_brightness value)
 {
 	struct ot200_led *led = container_of(led_cdev, struct ot200_led, cdev);
 	u8 *val;
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 27d027165472..542b8b51b287 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -114,7 +114,7 @@ static struct i2c_driver pca9532_driver = {
  * leds that are not ON/OFF.
  * */
 static int pca9532_calcpwm(struct i2c_client *client, int pwm, int blink,
-	enum led_brightness value)
+	led_brightness value)
 {
 	int a = 0, b = 0, i = 0;
 	struct pca9532_data *data = i2c_get_clientdata(client);
@@ -172,7 +172,7 @@ static void pca9532_setled(struct pca9532_led *led)
 }
 
 static int pca9532_set_brightness(struct led_classdev *led_cdev,
-	enum led_brightness value)
+	led_brightness value)
 {
 	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..11262219dc9b 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -237,7 +237,7 @@ static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 }
 
 static int pca955x_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	struct pca955x_led *pca955x_led;
 	struct pca955x *pca955x;
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 00aecd67e348..de4d196890d3 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -114,7 +114,7 @@ struct pca963x {
 };
 
 static int pca963x_brightness(struct pca963x_led *led,
-			      enum led_brightness brightness)
+			      led_brightness brightness)
 {
 	struct i2c_client *client = led->chip->client;
 	struct pca963x_chipdef *chipdef = led->chip->chipdef;
@@ -202,7 +202,7 @@ static int pca963x_power_state(struct pca963x_led *led)
 }
 
 static int pca963x_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct pca963x_led *led;
 	int ret;
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index fb2ab72c0c40..f9eb27272c50 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -26,7 +26,7 @@ struct pm8058_led {
 };
 
 static void pm8058_led_set(struct led_classdev *cled,
-	enum led_brightness value)
+	led_brightness value)
 {
 	struct pm8058_led *led;
 	int ret = 0;
@@ -53,7 +53,7 @@ static void pm8058_led_set(struct led_classdev *cled,
 		pr_err("Failed to set LED brightness\n");
 }
 
-static enum led_brightness pm8058_led_get(struct led_classdev *cled)
+static led_brightness pm8058_led_get(struct led_classdev *cled)
 {
 	struct pm8058_led *led;
 	int ret;
@@ -94,7 +94,7 @@ static int pm8058_led_probe(struct platform_device *pdev)
 	int ret;
 	struct regmap *map;
 	const char *state;
-	enum led_brightness maxbright;
+	led_brightness maxbright;
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 743e2cdd0891..61019b3e04f3 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -74,7 +74,7 @@ static int powernv_get_led_type(const char *led_type_desc)
  * scheduled. This function can sleep at opal_async_wait_response call.
  */
 static int powernv_led_set(struct powernv_led_data *powernv_led,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	int rc, token;
 	u64 led_mask, led_value = 0;
@@ -128,7 +128,7 @@ static int powernv_led_set(struct powernv_led_data *powernv_led,
  * This function fetches the LED state for a given LED type for
  * mentioned LED classdev structure.
  */
-static enum led_brightness powernv_led_get(struct powernv_led_data *powernv_led)
+static led_brightness powernv_led_get(struct powernv_led_data *powernv_led)
 {
 	int rc;
 	__be64 mask, value, max_type;
@@ -171,7 +171,7 @@ static enum led_brightness powernv_led_get(struct powernv_led_data *powernv_led)
  * to update LED state.
  */
 static int powernv_brightness_set(struct led_classdev *led_cdev,
-				   enum led_brightness value)
+				   led_brightness value)
 {
 	struct powernv_led_data *powernv_led =
 		container_of(led_cdev, struct powernv_led_data, cdev);
@@ -190,7 +190,7 @@ static int powernv_brightness_set(struct led_classdev *led_cdev,
 }
 
 /* LED classdev 'brightness_get' function */
-static enum led_brightness powernv_brightness_get(struct led_classdev *led_cdev)
+static led_brightness powernv_brightness_get(struct led_classdev *led_cdev)
 {
 	struct powernv_led_data *powernv_led =
 		container_of(led_cdev, struct powernv_led_data, cdev);
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index f53f9309ca6c..4d0d0ce71d7f 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -37,7 +37,7 @@ struct led_pwm_priv {
 };
 
 static int led_pwm_set(struct led_classdev *led_cdev,
-		       enum led_brightness brightness)
+		       led_brightness brightness)
 {
 	struct led_pwm_data *led_dat =
 		container_of(led_cdev, struct led_pwm_data, cdev);
diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index b6447c1721b4..9a5d10085969 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -17,7 +17,7 @@
 #include <asm/mach-rc32434/rb.h>
 
 static void rb532_led_set(struct led_classdev *cdev,
-			  enum led_brightness brightness)
+			  led_brightness brightness)
 {
 	if (brightness)
 		set_latch_u5(LO_ULED, 0);
@@ -25,7 +25,7 @@ static void rb532_led_set(struct led_classdev *cdev,
 		set_latch_u5(0, LO_ULED);
 }
 
-static enum led_brightness rb532_led_get(struct led_classdev *cdev)
+static led_brightness rb532_led_get(struct led_classdev *cdev)
 {
 	return (get_latch_u5() & LO_ULED) ? LED_FULL : LED_OFF;
 }
diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index 208c98918433..bb23d7f2cc65 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -46,7 +46,7 @@ static inline int led_regulator_get_max_brightness(struct regulator *supply)
 }
 
 static int led_regulator_get_voltage(struct regulator *supply,
-		enum led_brightness brightness)
+		led_brightness brightness)
 {
 	if (brightness == 0)
 		return -EINVAL;
@@ -88,7 +88,7 @@ static void regulator_led_disable(struct regulator_led *led)
 }
 
 static int regulator_led_brightness_set(struct led_classdev *led_cdev,
-					 enum led_brightness value)
+					 led_brightness value)
 {
 	struct regulator_led *led = to_regulator_led(led_cdev);
 	int voltage;
diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 3c0c7aa63b8c..664301273cde 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -30,7 +30,7 @@ static inline struct s3c24xx_gpio_led *to_gpio(struct led_classdev *led_cdev)
 }
 
 static void s3c24xx_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
+			    led_brightness value)
 {
 	struct s3c24xx_gpio_led *led = to_gpio(led_cdev);
 
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index e199ea15e406..62bdbc374aa5 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -84,7 +84,7 @@ static u32 sc27xx_led_get_offset(struct sc27xx_led *leds)
 	return leds->priv->base + SC27XX_LEDS_OFFSET * leds->line;
 }
 
-static int sc27xx_led_enable(struct sc27xx_led *leds, enum led_brightness value)
+static int sc27xx_led_enable(struct sc27xx_led *leds, led_brightness value)
 {
 	u32 base = sc27xx_led_get_offset(leds);
 	u32 ctrl_base = leds->priv->base + SC27XX_LEDS_CTRL;
@@ -114,7 +114,7 @@ static int sc27xx_led_disable(struct sc27xx_led *leds)
 			(SC27XX_LED_RUN | SC27XX_LED_TYPE) << ctrl_shift, 0);
 }
 
-static int sc27xx_led_set(struct led_classdev *ldev, enum led_brightness value)
+static int sc27xx_led_set(struct led_classdev *ldev, led_brightness value)
 {
 	struct sc27xx_led *leds = to_sc27xx_led(ldev);
 	int err;
diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
index f4f831570f11..736641efa16e 100644
--- a/drivers/leds/leds-sgm3140.c
+++ b/drivers/leds/leds-sgm3140.c
@@ -97,7 +97,7 @@ static const struct led_flash_ops sgm3140_flash_ops = {
 };
 
 static int sgm3140_brightness_set(struct led_classdev *led_cdev,
-				  enum led_brightness brightness)
+				  led_brightness brightness)
 {
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index f1964c96fb15..1a30d802a183 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -63,7 +63,7 @@ static const struct of_device_id spi_byte_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
 
 static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
-					    enum led_brightness brightness)
+					    led_brightness brightness)
 {
 	struct spi_byte_led *led = container_of(dev, struct spi_byte_led, ldev);
 	u8 value;
diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index fcaa34706b6c..9918de94ad52 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -217,7 +217,7 @@ static u32 nasgpio_led_get_attr(struct led_classdev *led_cdev, u32 port)
  * in this driver.
  */
 static void nasgpio_led_set_brightness(struct led_classdev *led_cdev,
-				       enum led_brightness brightness)
+				       led_brightness brightness)
 {
 	u32 setting = 0;
 	if (brightness >= LED_HALF)
diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index eba7313719bf..fd89e566eeb2 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -28,7 +28,7 @@ struct sunfire_led {
 #define	to_sunfire_led(d) container_of(d, struct sunfire_led, led_cdev)
 
 static void __clockboard_set(struct led_classdev *led_cdev,
-			     enum led_brightness led_val, u8 bit)
+			     led_brightness led_val, u8 bit)
 {
 	struct sunfire_led *p = to_sunfire_led(led_cdev);
 	u8 reg = upa_readb(p->reg);
@@ -52,25 +52,25 @@ static void __clockboard_set(struct led_classdev *led_cdev,
 }
 
 static void clockboard_left_set(struct led_classdev *led_cdev,
-				enum led_brightness led_val)
+				led_brightness led_val)
 {
 	__clockboard_set(led_cdev, led_val, CLOCK_CTRL_LLED);
 }
 
 static void clockboard_middle_set(struct led_classdev *led_cdev,
-				  enum led_brightness led_val)
+				  led_brightness led_val)
 {
 	__clockboard_set(led_cdev, led_val, CLOCK_CTRL_MLED);
 }
 
 static void clockboard_right_set(struct led_classdev *led_cdev,
-				 enum led_brightness led_val)
+				 led_brightness led_val)
 {
 	__clockboard_set(led_cdev, led_val, CLOCK_CTRL_RLED);
 }
 
 static void __fhc_set(struct led_classdev *led_cdev,
-			     enum led_brightness led_val, u32 bit)
+			     led_brightness led_val, u32 bit)
 {
 	struct sunfire_led *p = to_sunfire_led(led_cdev);
 	u32 reg = upa_readl(p->reg);
@@ -94,24 +94,24 @@ static void __fhc_set(struct led_classdev *led_cdev,
 }
 
 static void fhc_left_set(struct led_classdev *led_cdev,
-			 enum led_brightness led_val)
+			 led_brightness led_val)
 {
 	__fhc_set(led_cdev, led_val, FHC_CONTROL_LLED);
 }
 
 static void fhc_middle_set(struct led_classdev *led_cdev,
-			   enum led_brightness led_val)
+			   led_brightness led_val)
 {
 	__fhc_set(led_cdev, led_val, FHC_CONTROL_MLED);
 }
 
 static void fhc_right_set(struct led_classdev *led_cdev,
-			  enum led_brightness led_val)
+			  led_brightness led_val)
 {
 	__fhc_set(led_cdev, led_val, FHC_CONTROL_RLED);
 }
 
-typedef void (*set_handler)(struct led_classdev *, enum led_brightness);
+typedef void (*set_handler)(struct led_classdev *, led_brightness);
 struct led_type {
 	const char	*name;
 	set_handler	handler;
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 7eddb8ecb44e..f7db154dbe58 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -33,7 +33,7 @@ struct syscon_led {
 };
 
 static void syscon_led_set(struct led_classdev *led_cdev,
-	enum led_brightness value)
+	led_brightness value)
 {
 	struct syscon_led *sled =
 		container_of(led_cdev, struct syscon_led, cdev);
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 225b765830bd..d07fe73e332b 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -545,7 +545,7 @@ static int led_assign(struct tca6507_led *led)
 }
 
 static void tca6507_brightness_set(struct led_classdev *led_cdev,
-				   enum led_brightness brightness)
+				   led_brightness brightness)
 {
 	struct tca6507_led *led = container_of(led_cdev, struct tca6507_led,
 					       led_cdev);
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 5b9dfdf743ec..4cc9ee697169 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -107,7 +107,7 @@ tlc591xx_set_pwm(struct tlc591xx_priv *priv, struct tlc591xx_led *led,
 
 static int
 tlc591xx_brightness_set(struct led_classdev *led_cdev,
-			enum led_brightness brightness)
+			led_brightness brightness)
 {
 	struct tlc591xx_led *led = ldev_to_led(led_cdev);
 	struct tlc591xx_priv *priv = led->priv;
diff --git a/drivers/leds/leds-tps6105x.c b/drivers/leds/leds-tps6105x.c
index 09fd88a6c8f0..e34d036eff74 100644
--- a/drivers/leds/leds-tps6105x.c
+++ b/drivers/leds/leds-tps6105x.c
@@ -23,7 +23,7 @@ static void tps6105x_handle_put(void *data)
 }
 
 static int tps6105x_brightness_set(struct led_classdev *cdev,
-				  enum led_brightness brightness)
+				  led_brightness brightness)
 {
 	struct tps6105x_priv *priv = container_of(cdev, struct tps6105x_priv,
 							cdev);
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 7b2f4d0ae3fe..b6baeb1b42a9 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -42,7 +42,7 @@ struct omnia_leds {
 };
 
 static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
-					     enum led_brightness brightness)
+					     led_brightness brightness)
 {
 	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
 	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index c48b80574f02..c440a21b548d 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -29,7 +29,7 @@ struct wm831x_status {
 	int blink_time;
 	int blink_cyc;
 	int src;
-	enum led_brightness brightness;
+	led_brightness brightness;
 };
 
 #define to_wm831x_status(led_cdev) \
@@ -64,7 +64,7 @@ static void wm831x_status_set(struct wm831x_status *led)
 }
 
 static int wm831x_status_brightness_set(struct led_classdev *led_cdev,
-					 enum led_brightness value)
+					 led_brightness value)
 {
 	struct wm831x_status *led = to_wm831x_status(led_cdev);
 	unsigned long flags;
diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 8f243c413723..472e2aa33f58 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -139,7 +139,7 @@ static int wm8350_led_disable(struct wm8350_led *led)
 }
 
 static int wm8350_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
+			   led_brightness value)
 {
 	struct wm8350_led *led = to_wm8350_led(led_cdev);
 	unsigned long flags;
diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 794697e16068..4c8cf1562a50 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -24,7 +24,7 @@
 static struct platform_device *pdev;
 
 static void wrap_power_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+		led_brightness value)
 {
 	if (value)
 		scx200_gpio_set_low(WRAP_POWER_LED_GPIO);
@@ -33,7 +33,7 @@ static void wrap_power_led_set(struct led_classdev *led_cdev,
 }
 
 static void wrap_error_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+		led_brightness value)
 {
 	if (value)
 		scx200_gpio_set_low(WRAP_ERROR_LED_GPIO);
@@ -42,7 +42,7 @@ static void wrap_error_led_set(struct led_classdev *led_cdev,
 }
 
 static void wrap_extra_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+		led_brightness value)
 {
 	if (value)
 		scx200_gpio_set_low(WRAP_EXTRA_LED_GPIO);
diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
index f76621e88482..4681e5ca4cbc 100644
--- a/drivers/leds/trigger/ledtrig-audio.c
+++ b/drivers/leds/trigger/ledtrig-audio.c
@@ -8,15 +8,15 @@
 #include <linux/module.h>
 
 static struct led_trigger *ledtrig_audio[NUM_AUDIO_LEDS];
-static enum led_brightness audio_state[NUM_AUDIO_LEDS];
+static led_brightness audio_state[NUM_AUDIO_LEDS];
 
-enum led_brightness ledtrig_audio_get(enum led_audio type)
+led_brightness ledtrig_audio_get(enum led_audio type)
 {
 	return audio_state[type];
 }
 EXPORT_SYMBOL_GPL(ledtrig_audio_get);
 
-void ledtrig_audio_set(enum led_audio type, enum led_brightness state)
+void ledtrig_audio_set(enum led_audio type, led_brightness state)
 {
 	audio_state[type] = state;
 	led_trigger_event(ledtrig_audio[type], state);
diff --git a/drivers/leds/trigger/ledtrig-camera.c b/drivers/leds/trigger/ledtrig-camera.c
index ab1c410872ff..174c3dc9beab 100644
--- a/drivers/leds/trigger/ledtrig-camera.c
+++ b/drivers/leds/trigger/ledtrig-camera.c
@@ -19,7 +19,7 @@ DEFINE_LED_TRIGGER(ledtrig_torch);
 
 void ledtrig_flash_ctrl(bool on)
 {
-	enum led_brightness brt = on ? LED_FULL : LED_OFF;
+	led_brightness brt = on ? LED_FULL : LED_OFF;
 
 	led_trigger_event(ledtrig_flash, brt);
 }
@@ -27,7 +27,7 @@ EXPORT_SYMBOL_GPL(ledtrig_flash_ctrl);
 
 void ledtrig_torch_ctrl(bool on)
 {
-	enum led_brightness brt = on ? LED_FULL : LED_OFF;
+	led_brightness brt = on ? LED_FULL : LED_OFF;
 
 	led_trigger_event(ledtrig_torch, brt);
 }
diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
index 7320337b22d2..bb4b982fda9a 100644
--- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -37,7 +37,7 @@ struct uleds_device {
 static struct miscdevice uleds_misc;
 
 static void uleds_brightness_set(struct led_classdev *led_cdev,
-				 enum led_brightness brightness)
+				 led_brightness brightness)
 {
 	struct uleds_device *udev = container_of(led_cdev, struct uleds_device,
 						 led_cdev);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 329fd914cf24..5b136459cacb 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -25,13 +25,12 @@ struct device_node;
  * LED Core
  */
 
-/* This is obsolete/useless. We now support variable maximum brightness. */
-enum led_brightness {
-	LED_OFF		= 0,
-	LED_ON		= 1,
-	LED_HALF	= 127,
-	LED_FULL	= 255,
-};
+typedef int led_brightness;
+
+#define LED_OFF		0
+#define LED_ON		1
+#define LED_HALF	127
+#define LED_FULL	255
 
 struct led_init_data {
 	/* device fwnode handle */
@@ -95,15 +94,15 @@ struct led_classdev {
 	 * that can sleep while setting brightness.
 	 */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
-					  enum led_brightness brightness);
+					  led_brightness brightness);
 	/*
 	 * Set LED brightness level immediately - it can block the caller for
 	 * the time required for accessing a LED device register.
 	 */
 	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
-				       enum led_brightness brightness);
+				       led_brightness brightness);
 	/* Get LED brightness level */
-	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
+	led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
 	/*
 	 * Activate hardware accelerated blink, delays are in milliseconds
@@ -381,7 +380,7 @@ int devm_led_trigger_register(struct device *dev,
 void led_trigger_register_simple(const char *name,
 				struct led_trigger **trigger);
 void led_trigger_unregister_simple(struct led_trigger *trigger);
-void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
+void led_trigger_event(struct led_trigger *trigger,  led_brightness event);
 void led_trigger_blink(struct led_trigger *trigger, unsigned long *delay_on,
 		       unsigned long *delay_off);
 void led_trigger_blink_oneshot(struct led_trigger *trigger,
@@ -434,7 +433,7 @@ static inline void led_trigger_register_simple(const char *name,
 					struct led_trigger **trigger) {}
 static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
 static inline void led_trigger_event(struct led_trigger *trigger,
-				enum led_brightness event) {}
+					led_brightness event) {}
 static inline void led_trigger_blink(struct led_trigger *trigger,
 				      unsigned long *delay_on,
 				      unsigned long *delay_off) {}
@@ -566,7 +565,7 @@ void led_classdev_notify_brightness_hw_changed(
 	struct led_classdev *led_cdev, unsigned int brightness);
 #else
 static inline void led_classdev_notify_brightness_hw_changed(
-	struct led_classdev *led_cdev, enum led_brightness brightness) { }
+	struct led_classdev *led_cdev, led_brightness brightness) { }
 #endif
 
 /**
@@ -586,15 +585,15 @@ enum led_audio {
 };
 
 #if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
-enum led_brightness ledtrig_audio_get(enum led_audio type);
-void ledtrig_audio_set(enum led_audio type, enum led_brightness state);
+led_brightness ledtrig_audio_get(enum led_audio type);
+void ledtrig_audio_set(enum led_audio type, led_brightness state);
 #else
-static inline enum led_brightness ledtrig_audio_get(enum led_audio type)
+static inline led_brightness ledtrig_audio_get(enum led_audio type)
 {
 	return LED_OFF;
 }
 static inline void ledtrig_audio_set(enum led_audio type,
-				     enum led_brightness state)
+				     led_brightness state)
 {
 }
 #endif
-- 
2.30.1

