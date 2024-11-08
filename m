Return-Path: <linux-leds+bounces-3354-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5BB9C1E02
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43ED81F21663
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AA31EC016;
	Fri,  8 Nov 2024 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2LaFnsY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDD1EE006;
	Fri,  8 Nov 2024 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072562; cv=none; b=LCJEvyB+ozleGcCBJnxLblacLuLg3jPk7GX7wvfnCLYsrjT4TCpI+L1Wkm1hEuX6q4etBZ5s4D0g8BmViYBFJ1Tyu+oIfwd8G9nWteCbbQTbJ2qHz5dgS0Vb3kfxz4syMN+EBLXRzalWy2NSOfN4MajJuHpPqMMH0b4VK5LltAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072562; c=relaxed/simple;
	bh=2mCfw6DyCE9G4G1QDXR052pAiuSPWSjGKmy4YcCQVhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKAvm52QLCxFoNc1ai0e0WOtHdntfY9+FD2fcqz/C10pZWRo03TvWjeBZi47Q6XjHLPA91GEWRr1WLw+TvIHiu4HaF7/Q1tBzGqO388/k8c88d6SDIL/xvrGJX7YjwjleQLOx9zv7WBXTkq9XkNVijuypuWlhY9nqbJoVUkmn68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2LaFnsY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FD7C4CED3;
	Fri,  8 Nov 2024 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072562;
	bh=2mCfw6DyCE9G4G1QDXR052pAiuSPWSjGKmy4YcCQVhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s2LaFnsYVTJcX+S0mu6xfmiscCGEX6OR7am7zbqPt64CjvYDZH009GZQarH+8DnWw
	 dNI6ZD+DLt82MmSRCmoTe4gURXPPt3B6WJkT/CAek9GxYhW3IZN53sMAcyZIp/9J6c
	 Sz69PXOld3wCF2V8SFYkdtZgWqbMVQ+dKuzc9i5/hqi2MDrC51urN/R6VsoZ/J3YHr
	 0IHe8XFCo+ezsk9pH6tClC7s39GlV8zeGJebdR5XHOCkHEn5+xed+wGNNmlYFF2G0u
	 jSPD/IT2tVxqmqCYveLBc2/sv+Ts4O0tFjtnEp6EJndO/SyMJuWm3Gc+G93DX6FSQ8
	 ws1rZNveD3StA==
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
Subject: [PATCH leds v6 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Fri,  8 Nov 2024 14:28:40 +0100
Message-ID: <20241108132845.31005-8-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
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
 drivers/leds/Kconfig             |  1 +
 drivers/leds/leds-turris-omnia.c | 62 ++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index fcbe93b61e49..9ab6b56898c6 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -218,6 +218,7 @@ config LEDS_TURRIS_OMNIA
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on OF
 	depends on TURRIS_OMNIA_MCU
+	depends on TURRIS_OMNIA_MCU_GPIO
 	select LEDS_TRIGGERS
 	help
 	  This option enables basic support for the LEDs found on the front
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 7d2ed0c6500a..b2c37dd2e1cc 100644
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
 
@@ -373,6 +376,59 @@ static struct attribute *omnia_led_controller_attrs[] = {
 };
 ATTRIBUTE_GROUPS(omnia_led_controller);
 
+static irqreturn_t omnia_brightness_changed_threaded_fn(int irq, void *data)
+{
+	struct omnia_leds *leds = data;
+
+	if (unlikely(!leds->brightness_knode)) {
+		/*
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
+static void omnia_brightness_knode_put(void *data)
+{
+	struct omnia_leds *leds = data;
+
+	if (leds->brightness_knode)
+		sysfs_put(leds->brightness_knode);
+}
+
+static int omnia_request_brightness_irq(struct omnia_leds *leds)
+{
+	struct device *dev = &leds->client->dev;
+	int ret;
+
+	if (!leds->client->irq) {
+		dev_info(dev,
+			 "Brightness change interrupt supported by MCU firmware but not described in device-tree\n");
+
+		return 0;
+	}
+
+	/*
+	 * Registering the brightness_knode destructor before requesting the IRQ ensures that on
+	 * removal the brightness_knode sysfs node is put only after the IRQ is freed.
+	 * This is needed because the interrupt handler uses the knode.
+	 */
+	ret = devm_add_action(dev, omnia_brightness_knode_put, leds);
+	if (ret < 0)
+		return ret;
+
+	return devm_request_threaded_irq(dev, leds->client->irq, NULL,
+					 omnia_brightness_changed_threaded_fn, IRQF_ONESHOT,
+					 "leds-turris-omnia", leds);
+}
+
 static int omnia_mcu_get_features(const struct i2c_client *mcu_client)
 {
 	u16 reply;
@@ -459,6 +515,12 @@ static int omnia_leds_probe(struct i2c_client *client)
 			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
 	}
 
+	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
+		ret = omnia_request_brightness_irq(leds);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Cannot request brightness IRQ\n");
+	}
+
 	mutex_init(&leds->lock);
 
 	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
-- 
2.45.2


