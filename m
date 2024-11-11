Return-Path: <linux-leds+bounces-3379-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 355619C3BA0
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 11:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7870B213B2
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2024 10:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF7C175D34;
	Mon, 11 Nov 2024 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRNmAlfI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC015C15A;
	Mon, 11 Nov 2024 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319469; cv=none; b=T42T9MR+a4PGZS5cKCD/W60mOyNorFzFDLGFhyyG7i0MSIDHijhsllLGrpnTDkcj+yjjn1QQt6dQFr6ETv+67y4GUnAFxqMg+g+BMmG2sb1zjHrDLszxHt7jMhaFM7F90s99RLl2exWLwkwlCWTel09pJ7A8ClAiDNEE/a7kpUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319469; c=relaxed/simple;
	bh=L03X2l5xIJgoGgO3xAuN5DbnHI/1H9gFJ2yZ8353ycg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0nj9O08UU2bW/CVIuT9FCQoFSfbcRBVv9un5OfitbUyIHuYCmqLQSid7xCdfZIfwSRhjS6h3WUtw5bf4+YMVmUR/2MgJ6x+v3FfbpP2xsHxzfEtVHZ4++8lhNMQcu6qwluDg2Q7I4S4uGKPN9/CQvKP+9HFjy/SGyxROfdUyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRNmAlfI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838CEC4CEDE;
	Mon, 11 Nov 2024 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731319468;
	bh=L03X2l5xIJgoGgO3xAuN5DbnHI/1H9gFJ2yZ8353ycg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kRNmAlfIi4mDWJGszqBvExNYFY4LxJmT+ZXOFiX93X5OcP0/qVv8LdL69MuE+mui7
	 HJG+kSLyqI21wxEdJCYQohOOxRPakECP0Y9kLYAxkfYNealrV5t5ArcL6/ILZ3+t5c
	 pJ6rDVFGW//mGflJ2ms+RcJVZe6DbMe2ypaAtlA0o6lZ7ZMV3W5kgIOpewKzvUkTY6
	 R1zRbEy++Y4W7uRDfYmJyCc0Vf8gFZG383GxRWDmCGEFT1AkpoMk8hsL1HKQpP5as7
	 QjKdmfba2nAvHxhDd93TJdifUYHbrvR39eOS3JnRJdxm+vg4BZM/HSJmRpzE2t5Pxt
	 jcdz98RVOyS1g==
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
Subject: [PATCH leds v7 07/11] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Mon, 11 Nov 2024 11:03:51 +0100
Message-ID: <20241111100355.6978-8-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>
References: <20241111100355.6978-1-kabel@kernel.org>
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
index b60c34f57d0e..61186c3a6c2f 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -43,12 +43,15 @@ struct omnia_led {
  * @client:			I2C client device
  * @lock:			mutex to protect cached state
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


