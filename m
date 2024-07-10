Return-Path: <linux-leds+bounces-2247-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019492D89C
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 20:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C2C1F2510E
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 18:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC021940B1;
	Wed, 10 Jul 2024 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JrVGtwAJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nw+wyTdp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092503BBED;
	Wed, 10 Jul 2024 18:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720637444; cv=none; b=oJN7CfZ94yMQFolO0bKLOVL5qSJ7XyWFguDshtL6KZiV2AbMqKvfem9kyUURLdCaFSGXpQwLjfKrWAQYt7jVSvhyuYhh27WJ5Wclp8NT4pFmIen6mfv5W1pMAEnherp8mnKpwre0x/CK9dHpSlh/efr2srtHHTGkbXd+j3sWQqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720637444; c=relaxed/simple;
	bh=PVZoJi2gQUU+1ChxrT8xFfoip6UL9lSjaAnya/3pnYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Is/IA6g6yO1wL7SxqDaVHtpW3zdq55rZ+8+oCIYW9tOBxHiVlhtlZZVJRGAGmsC5JRCLMjaFkLwUDNU43ugSF7/oqhAd60p0ABTKkYFKZosE2+pS08rP+c05yz6mNXARhe+LNiPA7jkSrye1qJsbuOTQYS6SVBUgUccu+x7KNiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JrVGtwAJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nw+wyTdp; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WK6PN53rsz9sps;
	Wed, 10 Jul 2024 20:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1720637432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AvIh7AE0A4Rq9ccxEnjN39G12lYOSuaa61FRPTWL/0=;
	b=JrVGtwAJNkZcuxxEwgY+PQrIL6ruaLJitfcYF0Z5Fgsht80mcT4bp3y3/zeD4QGfDUTWzk
	gwNUF7E/6JHb7bPaEJmJYHjNqtarNhnS3THGFS6dzZhNgJHoLcY52cH9vfCW5OTYIsKqGf
	iWAXZQ4nqqmVLooU/91Wn3zvU4BLdfsV4Cd+RtJ72Z0BK7iQEn6Wun/rfUgPV35hdA+x2D
	3c+poHHLPJ86ROs5xrwj+IAassau31TijocDhc2mhSquV7ulsdPp4WjtH/5dkVoH54xMHu
	IQtBkl/AVqLauykc5Kg4RNHDxlQsa2yiCd6UDWg7w12m2iNnmOzE6ZwSyl4y2g==
From: Joseph Strauss <jstrauss@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1720637430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AvIh7AE0A4Rq9ccxEnjN39G12lYOSuaa61FRPTWL/0=;
	b=nw+wyTdpdCicx5nEo7LVTdNvwYC8xzppSNHsypYwKQ/bFhLwiiNuUBufBhSxlusD8CEUNk
	ZUUWc0FqcunM4wzGcL6J93Khc0cTFV015x2h/+oHeDYKvkMQ+Rx/qDEMPAT2y5lp+3TXA9
	8MT08945Dx8j9Wm3VvCZ/wvSVd8ZUQFsrguGyAbzaG9oCq3rb1ygd56FbjZ4vAXHQwUpuZ
	mtE3tG7Zv8naKfZH211V7G/n6fIrjUss80xAsDHod8LhSdqCtdV1EemJ029bFIwTbQ6Dob
	V4SFwGaop288P7EMu3XTGGP761EGN3jW64DsOdkGANS95i0FyKeHu3A5jGYPFg==
To: lee@kernel.org
Cc: pavel@ucw.cz,
	jansimon.moeller@gmx.de,
	conor@kernel.org,
	christophe.jaillet@wanadoo.fr,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joseph Strauss <jstrauss@mailbox.org>
Subject: [PATCH v8] Add multicolor support to BlinkM LED driver
Date: Wed, 10 Jul 2024 13:48:44 -0500
Message-Id: <20240710184844.108006-1-jstrauss@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7uk774tk9bduedmz7uz8wgqeo6tthr4y
X-MBO-RS-ID: 51825e8eda8fc8a5208

Add multicolor support to the BlinkM driver, making it easier to control
from userspace. The BlinkM LED is a programmable RGB LED. The driver
currently supports only the regular LED sysfs class, resulting in the
creation of three distinct classes, one for red, green, and blue. The
user then has to input three values into the three seperate brightness
files within those classes. The multicolor LED framework makes the
device easier to control with the multi_intensity file: the user can
input three values at once to form a color, while still controlling the
lightness with the brightness file.

The main struct blinkm_led has changed slightly. The struct led_classdev
for the regular sysfs classes remain. The blinkm_probe function checks
CONFIG_LEDS_BLINKM_MULTICOLOR to decide whether to load the seperate
sysfs classes or the single multicolor one, but never both. The
blinkm_set_mc_brightness() function had to be added to calculate the
three color components and then set the fields of the blinkm_data
structure accordingly.

Signed-off-by: Joseph Strauss <jstrauss@mailbox.org>
---
Changes in v2:
- Replaced instances of the constant 3 with NUM_LEDS, where applicable
- Fixed formatting errors
- Replaced loop inside of blinkm_set_mc_brightness() with equivalent
  statements
- Changed id of multicolor class from 4 to 3
- Replaced call to devm_kmalloc_array() with devm_kcalloc()
Changes in v3:
- Add CONFIG_LEDS_BLINKM_MULTICOLOR to check whether to use multicolor
  funcitonality
- Extend well-known-leds.txt to include standard names for RGB and indicator
  LEDS
- Change name of Blinkm sysfs class according to well-known-leds.txt
- Simplify struct blinkm_led and struct blinkm_data
- Remove magic numbers
- Fix formatting errors
- Remove unrelated changes
Changes in v4:
- Fix indentation
- Add default case to switch statement
Changes in v5:
- Fix warnings related to snprintf on s390 architecture, reported by
  0-DAY CI Kernel Test Service
Changes in v6:
- Refactored struct blinkm_led to use a union
- Refactored blinkm_probe()
- Clarified documentation
Changes in v7:
- Fix formatting and spelling errors
Changes in v8:
- Make compatible with Linux -next

 Documentation/leds/leds-blinkm.rst     |  29 +++-
 Documentation/leds/well-known-leds.txt |   8 +
 drivers/leds/Kconfig                   |   8 +
 drivers/leds/leds-blinkm.c             | 220 +++++++++++++++++--------
 4 files changed, 196 insertions(+), 69 deletions(-)

diff --git a/Documentation/leds/leds-blinkm.rst b/Documentation/leds/leds-blinkm.rst
index 2d3c226a371a..647be1c6c552 100644
--- a/Documentation/leds/leds-blinkm.rst
+++ b/Documentation/leds/leds-blinkm.rst
@@ -13,9 +13,31 @@ The device accepts RGB and HSB color values through separate commands.
 Also you can store blinking sequences as "scripts" in
 the controller and run them. Also fading is an option.
 
-The interface this driver provides is 2-fold:
+The interface this driver provides is 3-fold:
 
-a) LED class interface for use with triggers
+a) LED multicolor class interface for use with triggers
+#######################################################
+
+The registration follows the scheme::
+
+  blinkm-<i2c-bus-nr>-<i2c-device-nr>:rgb:indicator
+
+  $ ls -h /sys/class/leds/blinkm-1-9:rgb:indicator
+  brightness  device  max_brightness  multi_index  multi_intensity  power  subsystem  trigger  uevent
+
+Hue is controlled by the multi_intensity file and lightness is controlled by
+the brightness file.
+
+The order in which to write the intensity values can be found in multi_index.
+Exactly three values between 0 and 255 must be written to multi_intensity to
+change the color::
+
+  $ echo 255 100 50 > multi_intensity
+
+The overall lightness be changed by writing a value between 0 and 255 to the
+brightness file.
+
+b) LED class interface for use with triggers
 ############################################
 
 The registration follows the scheme::
@@ -79,6 +101,7 @@ E.g.::
 
 
 
-as of 6/2012
+as of 07/2024
 
 dl9pf <at> gmx <dot> de
+jstrauss <at> mailbox <dot> org
diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
index 67b44704801f..17ef78faf1f3 100644
--- a/Documentation/leds/well-known-leds.txt
+++ b/Documentation/leds/well-known-leds.txt
@@ -72,6 +72,14 @@ Good: "platform:*:charging" (allwinner sun50i, leds-cht-wcove)
 
 Good: ":backlight" (Motorola Droid 4)
 
+* Indicators
+
+Good: ":indicator" (Blinkm)
+
+* RGB
+
+Good: ":rgb" (Blinkm)
+
 * Ethernet LEDs
 
 Currently two types of Network LEDs are support, those controlled by
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 8d9d8da376e4..2e7831867315 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -825,6 +825,14 @@ config LEDS_BLINKM
 	  This option enables support for the BlinkM RGB LED connected
 	  through I2C. Say Y to enable support for the BlinkM LED.
 
+config LEDS_BLINKM_MULTICOLOR
+	bool "Enable multicolor support for BlinkM I2C RGB LED"
+	depends on LEDS_BLINKM
+	depends on LEDS_CLASS_MULTICOLOR
+	help
+	  This option enables multicolor sysfs class support for BlinkM LED and
+	  disables the older, separated sysfs interface
+
 config LEDS_POWERNV
 	tristate "LED support for PowerNV Platform"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index e40b87aead2d..577497b9d426 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -2,6 +2,7 @@
 /*
  *  leds-blinkm.c
  *  (c) Jan-Simon Möller (dl9pf@gmx.de)
+ *  (c) Joseph Strauss (jstrauss@mailbox.org)
  */
 
 #include <linux/module.h>
@@ -15,6 +16,10 @@
 #include <linux/pm_runtime.h>
 #include <linux/leds.h>
 #include <linux/delay.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/kconfig.h>
+
+#define NUM_LEDS 3
 
 /* Addresses to scan - BlinkM is on 0x09 by default*/
 static const unsigned short normal_i2c[] = { 0x09, I2C_CLIENT_END };
@@ -22,19 +27,25 @@ static const unsigned short normal_i2c[] = { 0x09, I2C_CLIENT_END };
 static int blinkm_transfer_hw(struct i2c_client *client, int cmd);
 static int blinkm_test_run(struct i2c_client *client);
 
+/* Contains structs for both the color-separated sysfs classes, and the new multicolor class */
 struct blinkm_led {
 	struct i2c_client *i2c_client;
-	struct led_classdev led_cdev;
+	union {
+		/* used when multicolor support is disabled */
+		struct led_classdev led_cdev;
+		struct led_classdev_mc mcled_cdev;
+	} cdev;
 	int id;
 };
 
-#define cdev_to_blmled(c)          container_of(c, struct blinkm_led, led_cdev)
+#define led_cdev_to_blmled(c)			container_of(c, struct blinkm_led, cdev.led_cdev)
+#define mcled_cdev_to_led(c)			container_of(c, struct blinkm_led, cdev.mcled_cdev)
 
 struct blinkm_data {
 	struct i2c_client *i2c_client;
 	struct mutex update_lock;
 	/* used for led class interface */
-	struct blinkm_led blinkm_leds[3];
+	struct blinkm_led blinkm_leds[NUM_LEDS];
 	/* used for "blinkm" sysfs interface */
 	u8 red;			/* color red */
 	u8 green;		/* color green */
@@ -419,11 +430,29 @@ static int blinkm_transfer_hw(struct i2c_client *client, int cmd)
 	return 0;
 }
 
+static int blinkm_set_mc_brightness(struct led_classdev *led_cdev,
+				 enum led_brightness value)
+{
+	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
+	struct blinkm_led *led = mcled_cdev_to_led(mcled_cdev);
+	struct blinkm_data *data = i2c_get_clientdata(led->i2c_client);
+
+	led_mc_calc_color_components(mcled_cdev, value);
+
+	data->next_red = (u8) mcled_cdev->subled_info[RED].brightness;
+	data->next_green = (u8) mcled_cdev->subled_info[GREEN].brightness;
+	data->next_blue = (u8) mcled_cdev->subled_info[BLUE].brightness;
+
+	blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
+
+	return 0;
+}
+
 static int blinkm_led_common_set(struct led_classdev *led_cdev,
 				 enum led_brightness value, int color)
 {
 	/* led_brightness is 0, 127 or 255 - we just use it here as-is */
-	struct blinkm_led *led = cdev_to_blmled(led_cdev);
+	struct blinkm_led *led = led_cdev_to_blmled(led_cdev);
 	struct blinkm_data *data = i2c_get_clientdata(led->i2c_client);
 
 	switch (color) {
@@ -565,117 +594,175 @@ static int blinkm_detect(struct i2c_client *client, struct i2c_board_info *info)
 	return 0;
 }
 
-static int blinkm_probe(struct i2c_client *client)
+static int register_separate_colors(struct i2c_client *client, struct blinkm_data *data)
 {
-	struct blinkm_data *data;
-	struct blinkm_led *led[3];
-	int err, i;
+	/* 3 separate classes for red, green, and blue respectively */
+	struct blinkm_led *leds[NUM_LEDS];
+	int err;
 	char blinkm_led_name[28];
-
-	data = devm_kzalloc(&client->dev,
-			sizeof(struct blinkm_data), GFP_KERNEL);
-	if (!data) {
-		err = -ENOMEM;
-		goto exit;
-	}
-
-	data->i2c_addr = 0x08;
-	/* i2c addr  - use fake addr of 0x08 initially (real is 0x09) */
-	data->fw_ver = 0xfe;
-	/* firmware version - use fake until we read real value
-	 * (currently broken - BlinkM confused!) */
-	data->script_id = 0x01;
-	data->i2c_client = client;
-
-	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
-
-	/* Register sysfs hooks */
-	err = sysfs_create_group(&client->dev.kobj, &blinkm_group);
-	if (err < 0) {
-		dev_err(&client->dev, "couldn't register sysfs group\n");
-		goto exit;
-	}
-
-	for (i = 0; i < 3; i++) {
+	/* Register red, green, and blue sysfs classes */
+	for (int i = 0; i < NUM_LEDS; i++) {
 		/* RED = 0, GREEN = 1, BLUE = 2 */
-		led[i] = &data->blinkm_leds[i];
-		led[i]->i2c_client = client;
-		led[i]->id = i;
-		led[i]->led_cdev.max_brightness = 255;
-		led[i]->led_cdev.flags = LED_CORE_SUSPENDRESUME;
+		leds[i] = &data->blinkm_leds[i];
+		leds[i]->i2c_client = client;
+		leds[i]->id = i;
+		leds[i]->cdev.led_cdev.max_brightness = 255;
+		leds[i]->cdev.led_cdev.flags = LED_CORE_SUSPENDRESUME;
 		switch (i) {
 		case RED:
-			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
+			scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
 					 "blinkm-%d-%d-red",
 					 client->adapter->nr,
 					 client->addr);
-			led[i]->led_cdev.name = blinkm_led_name;
-			led[i]->led_cdev.brightness_set_blocking =
+			leds[i]->cdev.led_cdev.name = blinkm_led_name;
+			leds[i]->cdev.led_cdev.brightness_set_blocking =
 							blinkm_led_red_set;
 			err = led_classdev_register(&client->dev,
-						    &led[i]->led_cdev);
+							&leds[i]->cdev.led_cdev);
 			if (err < 0) {
 				dev_err(&client->dev,
 					"couldn't register LED %s\n",
-					led[i]->led_cdev.name);
+					leds[i]->cdev.led_cdev.name);
 				goto failred;
 			}
 			break;
 		case GREEN:
-			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
+			scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
 					 "blinkm-%d-%d-green",
 					 client->adapter->nr,
 					 client->addr);
-			led[i]->led_cdev.name = blinkm_led_name;
-			led[i]->led_cdev.brightness_set_blocking =
+			leds[i]->cdev.led_cdev.name = blinkm_led_name;
+			leds[i]->cdev.led_cdev.brightness_set_blocking =
 							blinkm_led_green_set;
 			err = led_classdev_register(&client->dev,
-						    &led[i]->led_cdev);
+						&leds[i]->cdev.led_cdev);
 			if (err < 0) {
 				dev_err(&client->dev,
 					"couldn't register LED %s\n",
-					led[i]->led_cdev.name);
+					leds[i]->cdev.led_cdev.name);
 				goto failgreen;
 			}
 			break;
 		case BLUE:
-			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
+			scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
 					 "blinkm-%d-%d-blue",
 					 client->adapter->nr,
 					 client->addr);
-			led[i]->led_cdev.name = blinkm_led_name;
-			led[i]->led_cdev.brightness_set_blocking =
+			leds[i]->cdev.led_cdev.name = blinkm_led_name;
+			leds[i]->cdev.led_cdev.brightness_set_blocking =
 							blinkm_led_blue_set;
 			err = led_classdev_register(&client->dev,
-						    &led[i]->led_cdev);
+							&leds[i]->cdev.led_cdev);
 			if (err < 0) {
 				dev_err(&client->dev,
 					"couldn't register LED %s\n",
-					led[i]->led_cdev.name);
+					leds[i]->cdev.led_cdev.name);
 				goto failblue;
 			}
 			break;
+		default:
+			break;
 		}		/* end switch */
 	}			/* end for */
-
-	/* Initialize the blinkm */
-	blinkm_init_hw(client);
-
 	return 0;
 
 failblue:
-	led_classdev_unregister(&led[GREEN]->led_cdev);
-
+	led_classdev_unregister(&leds[GREEN]->cdev.led_cdev);
 failgreen:
-	led_classdev_unregister(&led[RED]->led_cdev);
-
+	led_classdev_unregister(&leds[RED]->cdev.led_cdev);
 failred:
 	sysfs_remove_group(&client->dev.kobj, &blinkm_group);
-exit:
+
 	return err;
 }
 
+static int register_multicolor(struct i2c_client *client, struct blinkm_data *data)
+{
+	struct blinkm_led *mc_led;
+	struct mc_subled *mc_led_info;
+	char blinkm_led_name[28];
+	int err;
+
+	/* Register multicolor sysfs class */
+	/* The first element of leds is used for multicolor facilities */
+	mc_led = &data->blinkm_leds[RED];
+	mc_led->i2c_client = client;
+
+	mc_led_info = devm_kcalloc(&client->dev, NUM_LEDS, sizeof(*mc_led_info),
+					GFP_KERNEL);
+	if (!mc_led_info)
+		return -ENOMEM;
+
+	mc_led_info[RED].color_index = LED_COLOR_ID_RED;
+	mc_led_info[GREEN].color_index = LED_COLOR_ID_GREEN;
+	mc_led_info[BLUE].color_index = LED_COLOR_ID_BLUE;
+
+	mc_led->cdev.mcled_cdev.subled_info = mc_led_info;
+	mc_led->cdev.mcled_cdev.num_colors = NUM_LEDS;
+	mc_led->cdev.mcled_cdev.led_cdev.brightness = 255;
+	mc_led->cdev.mcled_cdev.led_cdev.max_brightness = 255;
+	mc_led->cdev.mcled_cdev.led_cdev.flags = LED_CORE_SUSPENDRESUME;
+
+	scnprintf(blinkm_led_name, sizeof(blinkm_led_name),
+		 "blinkm-%d-%d:rgb:indicator",
+		 client->adapter->nr,
+		 client->addr);
+	mc_led->cdev.mcled_cdev.led_cdev.name = blinkm_led_name;
+	mc_led->cdev.mcled_cdev.led_cdev.brightness_set_blocking = blinkm_set_mc_brightness;
+
+	err = led_classdev_multicolor_register(&client->dev, &mc_led->cdev.mcled_cdev);
+	if (err < 0) {
+		dev_err(&client->dev, "couldn't register LED %s\n",
+				mc_led->cdev.led_cdev.name);
+		sysfs_remove_group(&client->dev.kobj, &blinkm_group);
+	}
+	return 0;
+}
+
+static int blinkm_probe(struct i2c_client *client)
+{
+	struct blinkm_data *data;
+	int err;
+
+	data = devm_kzalloc(&client->dev,
+			sizeof(struct blinkm_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->i2c_addr = 0x08;
+	/* i2c addr  - use fake addr of 0x08 initially (real is 0x09) */
+	data->fw_ver = 0xfe;
+	/* firmware version - use fake until we read real value
+	 * (currently broken - BlinkM confused!)
+	 */
+	data->script_id = 0x01;
+	data->i2c_client = client;
+
+	i2c_set_clientdata(client, data);
+	mutex_init(&data->update_lock);
+
+	/* Register sysfs hooks */
+	err = sysfs_create_group(&client->dev.kobj, &blinkm_group);
+	if (err < 0) {
+		dev_err(&client->dev, "couldn't register sysfs group\n");
+		return err;
+	}
+
+	if (!IS_ENABLED(CONFIG_LEDS_BLINKM_MULTICOLOR)) {
+		err = register_separate_colors(client, data);
+		if (err < 0)
+			return err;
+	} else {
+		err = register_multicolor(client, data);
+		if (err < 0)
+			return err;
+	}
+
+	blinkm_init_hw(client);
+
+	return 0;
+}
+
 static void blinkm_remove(struct i2c_client *client)
 {
 	struct blinkm_data *data = i2c_get_clientdata(client);
@@ -683,8 +770,8 @@ static void blinkm_remove(struct i2c_client *client)
 	int i;
 
 	/* make sure no workqueue entries are pending */
-	for (i = 0; i < 3; i++)
-		led_classdev_unregister(&data->blinkm_leds[i].led_cdev);
+	for (i = 0; i < NUM_LEDS; i++)
+		led_classdev_unregister(&data->blinkm_leds[i].cdev.led_cdev);
 
 	/* reset rgb */
 	data->next_red = 0x00;
@@ -740,6 +827,7 @@ static struct i2c_driver blinkm_driver = {
 module_i2c_driver(blinkm_driver);
 
 MODULE_AUTHOR("Jan-Simon Moeller <dl9pf@gmx.de>");
+MODULE_AUTHOR("Joseph Strauss <jstrauss@mailbox.org>");
 MODULE_DESCRIPTION("BlinkM RGB LED driver");
 MODULE_LICENSE("GPL");
 
-- 
2.39.2


