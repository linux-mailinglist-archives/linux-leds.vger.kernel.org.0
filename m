Return-Path: <linux-leds+bounces-2580-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D61029699FB
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 752EFB232DB
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD201B9838;
	Tue,  3 Sep 2024 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxh2RgBp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAD1B9835
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358792; cv=none; b=Njqd/Wo6OudswK4laZVOOXGTzLEgD7rcU/DHVseauf3hMfWJB2dYsX4T548ukALEp8WHKsZPScOmTKf0hpY5CWTbk7zc3pLs+GvWrOYfEP3KilBdp8LAM3KxLeF7datAzRV9sIDDzyyQ7YEc7b/tZSuakegSxUM+rANyzbNi0Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358792; c=relaxed/simple;
	bh=+6WpNVrCZbrPyIo2yJvnzbuKKSplNROCG5vR3F7Jw60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOSw6CP7fmQG3f0PCGbQyM4tscAEAVt9jWilz4MsvMhdxvdDNApqjtcKcrLSKc3qC/A8YyXrZug/z3MJ/WwLAep3UjixCMsbQCtEsyECA/DUo2AOlAIWbzwuLqFyySvG3/ccNpQD0pT7OUhCOBOC5R/pPKOvIcpnd8MDiI7cI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxh2RgBp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B70C4CECC;
	Tue,  3 Sep 2024 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358792;
	bh=+6WpNVrCZbrPyIo2yJvnzbuKKSplNROCG5vR3F7Jw60=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=hxh2RgBp4j+pABu1bU7syBo5HQa17PnIunEWZ5RmIAB9STUZhHSsncsX9i0vhWFvf
	 yPD6IeKbXJhf9pvMG/KNXOuvcOE5RdyVFY4gKarOqO9rnL3yYNkpN+9l3QV1TB7VnJ
	 iarAKcBsy9JhQ+BvGBDvhXY3sx3T2Srm1BHvSP9JYPxfSzdbeHDqwleqaTAC/X9wVl
	 Eo776UoPxgB/1TRMdbbLCffrObp96L1F0E4O746BHNjo3ql6/2E14Cao9oHruVYcXC
	 7GQrsXdWvwksBAXRcT0pfjdhHVOo4A3gETzFTtgwyOySaQSwWr6v1xG2qv7uaOVy03
	 TzsWrzgAzNm0Q==
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
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v2 05/11] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Tue,  3 Sep 2024 12:19:24 +0200
Message-ID: <20240903101930.16251-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
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
index 82cf58fbe946..51b13d3d7476 100644
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


