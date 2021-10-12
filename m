Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF4742ACFD
	for <lists+linux-leds@lfdr.de>; Tue, 12 Oct 2021 21:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhJLTKH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Oct 2021 15:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhJLTKG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Oct 2021 15:10:06 -0400
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48626C061570
        for <linux-leds@vger.kernel.org>; Tue, 12 Oct 2021 12:08:04 -0700 (PDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4HTPcK2HmPzMrBZy
        for <linux-leds@vger.kernel.org>; Tue, 12 Oct 2021 20:40:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by laurent.telenet-ops.be with bizsmtp
        id 56ZY260090KW32a016ZYuX; Tue, 12 Oct 2021 20:33:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMah-004RUO-Nd; Tue, 12 Oct 2021 20:33:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMag-002j7n-FW; Tue, 12 Oct 2021 20:33:30 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v7 20/21] auxdisplay: ht16k33: Add LED support
Date:   Tue, 12 Oct 2021 20:33:26 +0200
Message-Id: <20211012183327.649865-21-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Instantiate a single LED based on the "led" subnode in DT.
This allows the user to control display brightness and blinking (backed
by hardware support) through the LED class API and triggers, and exposes
the display color.  The LED will be named
"auxdisplay:<color>:<function>".

When running in dot-matrix mode and if no "led" subnode is found, the
driver falls back to the traditional backlight mode, to preserve
backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Marek Behún <kabel@kernel.org>
---
v7:
  - Add missing call to ht16k33_brightness_set() in
    ht16k33_fbdev_probe(), to make sure brightness and blinking are set
    to a sane state,

v6:
  - Add Reviewed-by,
  - Reorder operations in ht16k33_led_probe() to simplify future
    conversion to device properties,

v5:
  - Add missing select NEW_LEDS,

v4:
  - Add missing select LEDS_CLASS,

v3:
  - Remove unneeded C++ comment,
  - Use "err" instead of "error" to be consistent with existing driver
    naming style,
  - Make the creation of the LED device dependent on the presence of the
    "led" subnode in DT, so it can be used in dot-matrix mode too.
  - Use led_init_data() and devm_led_classdev_register_ext() to retrieve
    all LED properties from DT, instead of manual LED name construction
    based on just the "color" property,

v2:
  - Use "auxdisplay" instead of DRIVER_NAME in LED name.
---
 drivers/auxdisplay/Kconfig   |   2 +
 drivers/auxdisplay/ht16k33.c | 126 ++++++++++++++++++++++++++++++-----
 2 files changed, 112 insertions(+), 16 deletions(-)

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 42fc7b155de09dbc..e32ef7f9945d49b2 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -176,6 +176,8 @@ config HT16K33
 	select FB_SYS_IMAGEBLIT
 	select INPUT_MATRIXKMAP
 	select FB_BACKLIGHT
+	select NEW_LEDS
+	select LEDS_CLASS
 	select LINEDISP
 	help
 	  Say yes here to add support for Holtek HT16K33, RAM mapping 16*8
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 9ce9271d5e3d0b31..aef3dc87dc9f5ed2 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -18,6 +18,7 @@
 #include <linux/backlight.h>
 #include <linux/input.h>
 #include <linux/input/matrix_keypad.h>
+#include <linux/leds.h>
 #include <linux/workqueue.h>
 #include <linux/mm.h>
 
@@ -34,6 +35,10 @@
 
 #define REG_DISPLAY_SETUP		0x80
 #define REG_DISPLAY_SETUP_ON		BIT(0)
+#define REG_DISPLAY_SETUP_BLINK_OFF	(0 << 1)
+#define REG_DISPLAY_SETUP_BLINK_2HZ	(1 << 1)
+#define REG_DISPLAY_SETUP_BLINK_1HZ	(2 << 1)
+#define REG_DISPLAY_SETUP_BLINK_0HZ5	(3 << 1)
 
 #define REG_ROWINT_SET			0xA0
 #define REG_ROWINT_SET_INT_EN		BIT(0)
@@ -94,12 +99,14 @@ struct ht16k33_seg {
 struct ht16k33_priv {
 	struct i2c_client *client;
 	struct delayed_work work;
+	struct led_classdev led;
 	struct ht16k33_keypad keypad;
 	union {
 		struct ht16k33_fbdev fbdev;
 		struct ht16k33_seg seg;
 	};
 	enum display_type type;
+	uint8_t blink;
 };
 
 static const struct fb_fix_screeninfo ht16k33_fb_fix = {
@@ -158,7 +165,7 @@ static DEVICE_ATTR(map_seg14, 0644, map_seg_show, map_seg_store);
 
 static int ht16k33_display_on(struct ht16k33_priv *priv)
 {
-	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
+	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON | priv->blink;
 
 	return i2c_smbus_write_byte(priv->client, data);
 }
@@ -173,8 +180,10 @@ static int ht16k33_brightness_set(struct ht16k33_priv *priv,
 {
 	int err;
 
-	if (brightness == 0)
+	if (brightness == 0) {
+		priv->blink = REG_DISPLAY_SETUP_BLINK_OFF;
 		return ht16k33_display_off(priv);
+	}
 
 	err = ht16k33_display_on(priv);
 	if (err)
@@ -184,6 +193,49 @@ static int ht16k33_brightness_set(struct ht16k33_priv *priv,
 				    REG_BRIGHTNESS | (brightness - 1));
 }
 
+static int ht16k33_brightness_set_blocking(struct led_classdev *led_cdev,
+					   enum led_brightness brightness)
+{
+	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
+						 led);
+
+	return ht16k33_brightness_set(priv, brightness);
+}
+
+static int ht16k33_blink_set(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
+						 led);
+	unsigned int delay;
+	uint8_t blink;
+	int err;
+
+	if (!*delay_on && !*delay_off) {
+		blink = REG_DISPLAY_SETUP_BLINK_1HZ;
+		delay = 1000;
+	} else if (*delay_on <= 750) {
+		blink = REG_DISPLAY_SETUP_BLINK_2HZ;
+		delay = 500;
+	} else if (*delay_on <= 1500) {
+		blink = REG_DISPLAY_SETUP_BLINK_1HZ;
+		delay = 1000;
+	} else {
+		blink = REG_DISPLAY_SETUP_BLINK_0HZ5;
+		delay = 2000;
+	}
+
+	err = i2c_smbus_write_byte(priv->client,
+				   REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON |
+				   blink);
+	if (err)
+		return err;
+
+	priv->blink = blink;
+	*delay_on = *delay_off = delay;
+	return 0;
+}
+
 static void ht16k33_fb_queue(struct ht16k33_priv *priv)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
@@ -435,6 +487,35 @@ static void ht16k33_seg14_update(struct work_struct *work)
 	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
 }
 
+static int ht16k33_led_probe(struct device *dev, struct led_classdev *led,
+			     unsigned int brightness)
+{
+	struct led_init_data init_data = {};
+	struct device_node *node;
+	int err;
+
+	/* The LED is optional */
+	node = of_get_child_by_name(dev->of_node, "led");
+	if (!node)
+		return 0;
+
+	init_data.fwnode = of_fwnode_handle(node);
+	init_data.devicename = "auxdisplay";
+	init_data.devname_mandatory = true;
+
+	led->brightness_set_blocking = ht16k33_brightness_set_blocking;
+	led->blink_set = ht16k33_blink_set;
+	led->flags = LED_CORE_SUSPENDRESUME;
+	led->brightness = brightness;
+	led->max_brightness = MAX_BRIGHTNESS;
+
+	err = devm_led_classdev_register_ext(dev, led, &init_data);
+	if (err)
+		dev_err(dev, "Failed to register LED\n");
+
+	return err;
+}
+
 static int ht16k33_keypad_probe(struct i2c_client *client,
 				struct ht16k33_keypad *keypad)
 {
@@ -508,25 +589,33 @@ static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv *priv,
 			       uint32_t brightness)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
-	struct backlight_properties bl_props;
-	struct backlight_device *bl;
+	struct backlight_device *bl = NULL;
 	int err;
 
-	/* Backlight */
-	memset(&bl_props, 0, sizeof(struct backlight_properties));
-	bl_props.type = BACKLIGHT_RAW;
-	bl_props.max_brightness = MAX_BRIGHTNESS;
+	if (priv->led.dev) {
+		err = ht16k33_brightness_set(priv, brightness);
+		if (err)
+			return err;
+	} else {
+		/* backwards compatibility with DT lacking an led subnode */
+		struct backlight_properties bl_props;
+
+		memset(&bl_props, 0, sizeof(struct backlight_properties));
+		bl_props.type = BACKLIGHT_RAW;
+		bl_props.max_brightness = MAX_BRIGHTNESS;
+
+		bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev,
+						    priv, &ht16k33_bl_ops,
+						    &bl_props);
+		if (IS_ERR(bl)) {
+			dev_err(dev, "failed to register backlight\n");
+			return PTR_ERR(bl);
+		}
 
-	bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev, priv,
-					    &ht16k33_bl_ops, &bl_props);
-	if (IS_ERR(bl)) {
-		dev_err(dev, "failed to register backlight\n");
-		return PTR_ERR(bl);
+		bl->props.brightness = brightness;
+		ht16k33_bl_update_status(bl);
 	}
 
-	bl->props.brightness = brightness;
-	ht16k33_bl_update_status(bl);
-
 	/* Framebuffer (2 bytes per column) */
 	BUILD_BUG_ON(PAGE_SIZE < HT16K33_FB_SIZE);
 	fbdev->buffer = (unsigned char *) get_zeroed_page(GFP_KERNEL);
@@ -663,6 +752,11 @@ static int ht16k33_probe(struct i2c_client *client)
 		dft_brightness = MAX_BRIGHTNESS;
 	}
 
+	/* LED */
+	err = ht16k33_led_probe(dev, &priv->led, dft_brightness);
+	if (err)
+		return err;
+
 	/* Keypad */
 	if (client->irq > 0) {
 		err = ht16k33_keypad_probe(client, &priv->keypad);
-- 
2.25.1

