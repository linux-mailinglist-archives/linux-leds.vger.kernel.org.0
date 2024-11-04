Return-Path: <linux-leds+bounces-3263-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 594959BB780
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 15:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D6581C23670
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2024 14:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182BA13A3F7;
	Mon,  4 Nov 2024 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw/ZaRQp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42403398B;
	Mon,  4 Nov 2024 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730001; cv=none; b=jrarhIaQ32HfihM812Z5U2fOszQGsK9zJHpHQu3NZEb10rm7LBKsJ3o37jyZ6reEL0DIO05eGgGT/lLJBCtIHeBnWrRgEIj+Y0ZbsP12BjXsMAkKbfOY/3q1wVR1UmwLA91vuJww2ODg9cxNvjpDSIAWrSZbHFeBrI1NVPFvgg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730001; c=relaxed/simple;
	bh=SlODgSG/IsQ68Nggxqk0gTPcTViSrI9YmTzyE7UmCnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHNf7ujptzoUhpgz0ILfwxfvAuPHxHhlIRWDuUfUHKQeizzlkSxnHjtvjc501OJtfIOSEuuO1CyqYvqR3jPrnUkNor2RBRp6my7XattPC7kWiA8JvjVZEllsBQrtM306BcI4FtImNXjq/Bpl91ycSjxusjcrnU1IvFqOZ5ZG9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw/ZaRQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314B6C4CED2;
	Mon,  4 Nov 2024 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730730000;
	bh=SlODgSG/IsQ68Nggxqk0gTPcTViSrI9YmTzyE7UmCnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fw/ZaRQp9UW+1qqpdjedwC/MfQuzwUkHLjnMAqPa/GAU7yKAtwB/QjZ902/DT+l5t
	 gYA3duve2L6zILYMA/IkTWOrs/VNklAsUIOkU2DaJn1AfDzh4QsaOA5jTzJbmjeZyL
	 z2p5/hP8WWJ6/qHBJKV5FTe+IpqK1PeGOWn4RKDwiNLdFPI2olnSXShd9LwKvkUBEU
	 iUXy8WU0zkHYBoXh1zjw43qo/P+dCv1qUBUTlf9guKVvQd4LxBTY9nSqEIABEK2Iea
	 Nlsq11EIPh47wgvZBThS7C1z66S8lRvqtIbl/uKzr4VG6o2ByF6OcUBLCxGQ9eke4E
	 DqoayPUMKQO1A==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v5 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Mon,  4 Nov 2024 15:19:19 +0100
Message-ID: <20241104141924.18816-8-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104141924.18816-1-kabel@kernel.org>
References: <20241104141924.18816-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recall that on Turris Omnia, the LED controller has a global brightness
property, which allows the user to make the front LED panel dimmer.

There is also a button on the front panel, which by default is
configured so that pressing it changes the global brightness to a lower
value (unless it is at 0%, in which case pressing the button changes the
global brightness to 100%).

Newer versions of the MCU firmware support informing the SOC that the
brightness was changed by button press event via an interrupt.

Now that we have the turris-omnia-mcu driver, which adds support for MCU
interrupts, add the ability to inform the userspace (via a sysfs
notification) that the global brightness was changed.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/Kconfig             |  2 +-
 drivers/leds/leds-turris-omnia.c | 48 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index fcbe93b61e49..148384aacdcc 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -217,7 +217,7 @@ config LEDS_TURRIS_OMNIA
 	depends on I2C
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on OF
-	depends on TURRIS_OMNIA_MCU
+	depends on TURRIS_OMNIA_MCU_GPIO
 	select LEDS_TRIGGERS
 	help
 	  This option enables basic support for the LEDs found on the front
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 7d2ed0c6500a..168ce362fd14 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -43,12 +43,15 @@ struct omnia_led {
  * @client:			I2C client device
  * @lock:			mutex to protect
  * @has_gamma_correction:	whether the MCU firmware supports gamma correction
+ * @brightness_knode:		kernel node of the "brightness" device sysfs attribute (this is the
+ *				driver specific global brightness, not the LED classdev brightness)
  * @leds:			flexible array of per-LED data
  */
 struct omnia_leds {
 	struct i2c_client *client;
 	struct mutex lock;
 	bool has_gamma_correction;
+	struct kernfs_node *brightness_knode;
 	struct omnia_led leds[];
 };
 
@@ -373,6 +376,30 @@ static struct attribute *omnia_led_controller_attrs[] = {
 };
 ATTRIBUTE_GROUPS(omnia_led_controller);
 
+static irqreturn_t omnia_brightness_changed_threaded_fn(int irq, void *data)
+{
+	struct omnia_leds *leds = data;
+
+	if (unlikely(!leds->brightness_knode)) {
+		/*
+		 * It would be nicer to get this dirent in the driver probe method, before the IRQ
+		 * is requested. But the really_probe() function in drivers/base/dd.c registers
+		 * driver's .dev_groups only after probe is finished, so during driver probe the
+		 * "brightness" sysfs node is not yet present.
+		 *
+		 * Note that sysfs_get_dirent() may sleep. This is okay, because we are in threaded
+		 * context.
+		 */
+		leds->brightness_knode = sysfs_get_dirent(leds->client->dev.kobj.sd, "brightness");
+		if (!leds->brightness_knode)
+			return IRQ_NONE;
+	}
+
+	sysfs_notify_dirent(leds->brightness_knode);
+
+	return IRQ_HANDLED;
+}
+
 static int omnia_mcu_get_features(const struct i2c_client *mcu_client)
 {
 	u16 reply;
@@ -459,6 +486,14 @@ static int omnia_leds_probe(struct i2c_client *client)
 			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
 	}
 
+	if (client->irq && (ret & OMNIA_FEAT_BRIGHTNESS_INT)) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						omnia_brightness_changed_threaded_fn, IRQF_ONESHOT,
+						"leds-turris-omnia", leds);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Cannot request brightness IRQ\n");
+	}
+
 	mutex_init(&leds->lock);
 
 	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
@@ -481,6 +516,19 @@ static int omnia_leds_probe(struct i2c_client *client)
 
 static void omnia_leds_remove(struct i2c_client *client)
 {
+	struct omnia_leds *leds = i2c_get_clientdata(client);
+
+	/*
+	 * We need to free the brightness IRQ here, before putting away the brightness sysfs node.
+	 * Otherwise devres would free the interrupt only after the sysfs node is removed, and if
+	 * an interrupt occurred between those two events, it would use a removed sysfs node.
+	 */
+	devm_free_irq(&client->dev, client->irq, leds);
+
+	/* Now put away the sysfs node we got the first time the interrupt handler was called */
+	if (leds->brightness_knode)
+		sysfs_put(leds->brightness_knode);
+
 	/* put all LEDs into default (HW triggered) mode */
 	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
-- 
2.45.2


