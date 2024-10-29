Return-Path: <linux-leds+bounces-3189-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E879B4B7D
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799E2284B4A
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E3A206E77;
	Tue, 29 Oct 2024 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDBkUyDl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10DA206E67;
	Tue, 29 Oct 2024 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210220; cv=none; b=PqR72K16Gk+lVC3UkXUrEqw3nyYzszmAvEJT8uCGfKuVm68FXJ2KZlOgyKTRwhanrzbfxNnQyiSfrTPZcf7LdbQIldNk97bkzd/oz44ATH2RsN7rTQ2M5ntyJS+ZG9R/5rrir219tyupYCIT4TcE+6EJ9Eds0UzeBAvHZPGHRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210220; c=relaxed/simple;
	bh=MSD9y2n/tjvuERbL3dPKRUkIWXA6bylEOX2usY03xaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vd/QusRW23EXLTKhqwbUgoJxrfJ89RCENAuLJ87c17j6giyzkwVsuMEFkOr1VTzgPfobyDQElKTPGv3p9Bu181JjW2RlvkJSXSKPkS1OjqBOeHnT6eVvRnToarEXS8jiLiMmMxur+pVlVCBkfMbjTUYYtk4jdmn78YeWxQlrTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDBkUyDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41382C4CEE3;
	Tue, 29 Oct 2024 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210220;
	bh=MSD9y2n/tjvuERbL3dPKRUkIWXA6bylEOX2usY03xaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gDBkUyDlycXFxow+CiF4Wjz3K07iHLBooLXkde89U8WYzNegzwdd5jRdh+guKBTOU
	 xiMy38OJgwUo3PX49mDP6txPLC2amXfBXocEKG858+anUZiEcQY2UqFk7JIopqe6bm
	 erpXsYSg1vpvYo0/NEevMcEkZJTe0nbC8bqi9dZKtBOA32/oBAfq8hXY0sR7LiUhEZ
	 JBa7pFTmyC2CiGKwZcZiXQM2XaD0mdcSW1FLPphYMPhJlcERGE3sDYzUwWAPR5CFid
	 eUB1k+S988bLbClf41CI/MFvd0O4QWrWtARQhN6s3YCQsBoTs/2QWj/zuIOOTcS2w7
	 7wFYF4iAIJQKA==
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
Subject: [PATCH leds v4 07/12] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Tue, 29 Oct 2024 14:56:16 +0100
Message-ID: <20241029135621.12546-8-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
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
 drivers/leds/leds-turris-omnia.c | 48 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index fcbe93b61e49..443aaf948bb8 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -219,6 +219,7 @@ config LEDS_TURRIS_OMNIA
 	depends on OF
 	depends on TURRIS_OMNIA_MCU
 	select LEDS_TRIGGERS
+	select TURRIS_OMNIA_MCU_GPIO
 	help
 	  This option enables basic support for the LEDs found on the front
 	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index b13b3b269ae9..ac7938f57bfe 100644
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
 static int omnia_mcu_get_features(const struct i2c_client *client)
 {
 	struct i2c_client mcu_client = *client;
@@ -436,6 +463,14 @@ static int omnia_leds_probe(struct i2c_client *client)
 			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
 	}
 
+	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						omnia_brightness_changed_threaded_fn, IRQF_ONESHOT,
+						"leds-turris-omnia", leds);
+		if (ret <= 0)
+			return dev_err_probe(dev, ret ?: -ENXIO, "Cannot request brightness IRQ\n");
+	}
+
 	mutex_init(&leds->lock);
 
 	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
@@ -458,6 +493,19 @@ static int omnia_leds_probe(struct i2c_client *client)
 
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


