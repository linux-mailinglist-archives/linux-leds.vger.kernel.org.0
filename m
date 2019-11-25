Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5DB10905E
	for <lists+linux-leds@lfdr.de>; Mon, 25 Nov 2019 15:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbfKYOuv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 Nov 2019 09:50:51 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:39318 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728318AbfKYOuv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 25 Nov 2019 09:50:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id B83C6FB05;
        Mon, 25 Nov 2019 15:50:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gTmB3CO10jfU; Mon, 25 Nov 2019 15:50:46 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id CD91F49288; Mon, 25 Nov 2019 15:47:58 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] leds: backlight: register with class backlight too
Date:   Mon, 25 Nov 2019 15:47:58 +0100
Message-Id: <4ba4ec252c23ee57ed5c2d6bd68292c95925b647.1574692624.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574692624.git.agx@sigxcpu.org>
References: <cover.1574692624.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This allows it to be used as backlight device in device tree (e.g. to
link it to a LCD panel) and helps userspace since it shows up in
/sys/class/backlight then.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/leds/trigger/ledtrig-backlight.c | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 487577d22cfc..3967f7014b9a 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -22,6 +22,9 @@ struct bl_trig_notifier {
 	int brightness;
 	int old_status;
 	struct notifier_block notifier;
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+	struct backlight_device *backlight_device;
+#endif
 	unsigned invert;
 };
 
@@ -98,11 +101,40 @@ static struct attribute *bl_trig_attrs[] = {
 };
 ATTRIBUTE_GROUPS(bl_trig);
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+static int bl_get_brightness(struct backlight_device *b)
+{
+	struct led_classdev *led = bl_get_data(b);
+
+	return led_get_brightness(led);
+}
+
+static int bl_update_status(struct backlight_device *b)
+{
+	struct led_classdev *led = bl_get_data(b);
+
+	if (b->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+		led_set_brightness_nosleep(led, 0);
+	else
+		led_set_brightness_nosleep(led, b->props.brightness);
+
+	return 0;
+}
+
+static const struct backlight_ops backlight_ops = {
+	.get_brightness = bl_get_brightness,
+	.update_status	= bl_update_status,
+};
+#endif
+
 static int bl_trig_activate(struct led_classdev *led)
 {
 	int ret;
 
 	struct bl_trig_notifier *n;
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+	struct backlight_properties props;
+#endif
 
 	n = kzalloc(sizeof(struct bl_trig_notifier), GFP_KERNEL);
 	if (!n)
@@ -118,13 +150,35 @@ static int bl_trig_activate(struct led_classdev *led)
 	if (ret)
 		dev_err(led->dev, "unable to register backlight trigger\n");
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = LED_FULL;
+	props.brightness = led->brightness;
+	n->backlight_device = backlight_device_register(led->name,
+							led->dev,
+							led,
+							&backlight_ops,
+							&props);
+	if (IS_ERR(n->backlight_device)) {
+		ret = IS_ERR(n->backlight_device);
+		goto out;
+	}
+#endif
+
 	return 0;
+out:
+	fb_unregister_client(&n->notifier);
+	return ret;
 }
 
 static void bl_trig_deactivate(struct led_classdev *led)
 {
 	struct bl_trig_notifier *n = led_get_trigger_data(led);
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+	backlight_device_unregister(n->backlight_device);
+#endif
 	fb_unregister_client(&n->notifier);
 	kfree(n);
 }
-- 
2.23.0

