Return-Path: <linux-leds+bounces-2673-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BED977FF5
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 14:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4AE1F21935
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2024 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6221D932B;
	Fri, 13 Sep 2024 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5Vkbo6e"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA51D86E3;
	Fri, 13 Sep 2024 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230693; cv=none; b=IGZFSEfzN0Ee2z7k+ph+odCPF2jktbJYPf9IYtKygw5cDw7I5RRodYPBoLkrZekhh6q3i+dsrGXSrXH0TuYTeVG2n/w3li0gN2rnbSyc+n8jLBWw2JfZU5+h8g8jqPnAAt0b1zUOry0s2rvGiI7IoNaf1qRojehTR4qUhp8CcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230693; c=relaxed/simple;
	bh=+ctK+EX3ptfMmMS6zGzFfk7fZNhwln/VjVR+eyf8w94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQNcoHj2jLu/YD0U1pUnMOq4owFIFRsDK+B5eKgNtwlyPHsG57bEJFNhAuHxOYsJ04OXcrXzroEyOaCOhWiORt6OtAbHeBilZ0pji+JiZE4KVccWqz5Mki1uhFKGieumTzvp+OZFQ9SGYea++bke0IRujtf2K+YA1RlnQkO+WuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5Vkbo6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744A6C4CEC7;
	Fri, 13 Sep 2024 12:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230692;
	bh=+ctK+EX3ptfMmMS6zGzFfk7fZNhwln/VjVR+eyf8w94=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5Vkbo6eCUNSqS/aE/j7LYRcWXLWb3Tk8eoKlAyug8SF4v3PXjzu+2am/J/aoLZpy
	 nZJXPuQQTbTI3ae0oCdebV34d7bOn3gTaDkfYYkohDI035O4aj49Lq1yeE2S4eev4S
	 Qjd6cOf38H6+HBEZfLqPEoaP8eDBePEWae/rk5yI+EsDCTAeVl4r8rkCVDQ36VmcEq
	 vWCAA6mjJ67qdEY6dLJwMfE8hykarI//+P0dHlvq9qmSiMyLsdDWDBItvNlGMFSqSn
	 +NsBTKmtiKDmhQvkRODtE8RvhntJA7ZeoRW3a+Y6TdxQyVJIKmFPn/mBIbRj4JcMtz
	 fsTzPXhLwzAMQ==
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
Subject: [PATCH leds v3 06/11] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Fri, 13 Sep 2024 14:30:58 +0200
Message-ID: <20240913123103.21226-7-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
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
 drivers/leds/leds-turris-omnia.c | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 82cf58fbe946..a87cdb58e476 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -33,6 +33,7 @@ struct omnia_leds {
 	struct i2c_client *client;
 	struct mutex lock;
 	bool has_gamma_correction;
+	struct kernfs_node *brightness_kn;
 	struct omnia_led leds[];
 };
 
@@ -357,6 +358,21 @@ static struct attribute *omnia_led_controller_attrs[] = {
 };
 ATTRIBUTE_GROUPS(omnia_led_controller);
 
+static irqreturn_t omnia_brightness_changed_handler(int irq, void *dev_id)
+{
+	struct omnia_leds *leds = dev_id;
+
+	if (unlikely(!leds->brightness_kn)) {
+		leds->brightness_kn = sysfs_get_dirent(leds->client->dev.kobj.sd, "brightness");
+		if (!leds->brightness_kn)
+			return IRQ_NONE;
+	}
+
+	sysfs_notify_dirent(leds->brightness_kn);
+
+	return IRQ_HANDLED;
+}
+
 static int omnia_mcu_get_features(const struct i2c_client *client)
 {
 	struct i2c_client mcu_client = *client;
@@ -420,6 +436,14 @@ static int omnia_leds_probe(struct i2c_client *client)
 			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
 	}
 
+	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
+		ret = devm_request_any_context_irq(dev, client->irq,
+						   omnia_brightness_changed_handler, IRQF_ONESHOT,
+						   "leds-turris-omnia", leds);
+		if (ret <= 0)
+			return dev_err_probe(dev, ret ?: -ENXIO, "Cannot request brightness IRQ\n");
+	}
+
 	mutex_init(&leds->lock);
 
 	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
@@ -442,6 +466,19 @@ static int omnia_leds_probe(struct i2c_client *client)
 
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
+	if (leds->brightness_kn)
+		sysfs_put(leds->brightness_kn);
+
 	/* put all LEDs into default (HW triggered) mode */
 	omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
-- 
2.44.2


