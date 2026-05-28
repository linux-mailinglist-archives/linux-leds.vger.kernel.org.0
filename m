Return-Path: <linux-leds+bounces-8331-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJD0AS2sF2pPNAgAu9opvQ
	(envelope-from <linux-leds+bounces-8331-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 04:45:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD25EBF3A
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 04:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB13531290A3
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 02:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66612EAD1C;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDFDcqHI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815193438AF;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935672; cv=none; b=JzuczlF6l5U4Zm38VDLXRX52KKbQ/SbXRivXLHlLa7xtVh3dyQVeqgjAZoyNBeBp69d8MdEcj3RbixPK0P5x4HDooppJPB28Kpeah2UkTxtHtlQXvtNUtgwqO5P4dK3oe9lV55Og1CabDVdMMS6FQM5pqsCmoioU7XZmA/da7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935672; c=relaxed/simple;
	bh=Y+4wVy0zYARcOMHewWAaadofMeQq0fIFyZ0TGq0ZCY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h68SJzW1dsLE8NkZqZJF6oSPSX3AZCrytyzAunZaJRg8LRHadiEDjhxfBhg+27Yuivl2iPzT9s2BjwajM/ztEP+NzWtiuREAbmD+Gqh9h8GxjJxNzCJPMGtdLBYoY6VIkhdpzihLofJUY+41r2K2oFtk2BRk9MW4Nd1qYgbBg9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDFDcqHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37C3DC2BCC7;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779935672;
	bh=Y+4wVy0zYARcOMHewWAaadofMeQq0fIFyZ0TGq0ZCY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mDFDcqHI/hEBhKlpKPoiBW6wViuW8n5xRm/ZIZeVvU4eBJcrsPqPL8Ei2f7GLG/4P
	 U67E3gfvwp5/USnEcSb3A8ULN939BfgR9yMdqW2rx+w68CoxOZTzDIRIowRpXFWFk2
	 9G2rE6rCX9X/cdsr0B2zoDFO4NjqrKmaYVBuo1OdDZtlmINX2C7N4OK2gFzMTh9iwA
	 CvFNggSzO2kje1ZqVE5FJJLwT7BmnjDOHHxnZyBk0lAbb92v4adGHUpHPIBAeCTDY3
	 K7+aE7pwNVyLZcRaPQc7v1uisT6J7vkEKs0SGidMu2Zh+eTd382IJKM/nE7E//dWP+
	 qRqqPMpTKMjzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B40CD5BC9;
	Thu, 28 May 2026 02:34:32 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 27 May 2026 19:34:31 -0700
Subject: [PATCH v6 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-expressatt_camera_flash-v6-2-de0f150024e4@gmail.com>
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
In-Reply-To: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935671; l=8840;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ECsUFWhTz2Rp4ynQ93GJ/pcNMjhSeYMsU+5K5mwgLYA=;
 b=E84r0jz3m/L680wFgNeCdunrTp+3koZAjcqJHxPV5OrepgPKzNhhMIB2klC9prQnRppxiqM4p
 dwM7B/PKPMQBqk1Gvnu8mFSUNjEHIS8vj0EKqklZHCCZt7c346v0GHC
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-8331-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.939];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[powerdown_work.work:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 99CD25EBF3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Extend the RT8515 driver to support flash ICs that use only a single
GPIO for both flash and torch modes (no separate ENT pin), with an
optional vin regulator that gates power to the flash IC.

When vin-supply is provided, the driver enables the regulator before
activating the LED and disables it when turning off.

Make ent-gpios optional. When ent-gpios is absent, the driver uses
enf-gpios for both flash and torch brightness control.

Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/leds/flash/leds-rt8515.c | 148 +++++++++++++++++++++++++++++----------
 1 file changed, 112 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index f6b439674c03..0fb84d98211d 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -31,6 +31,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/workqueue.h>
 
 #include <media/v4l2-flash-led-class.h>
 
@@ -44,6 +45,9 @@
 #define RT8515_TIMEOUT_US	250000U
 #define RT8515_MAX_TIMEOUT_US	300000U
 
+#define RT8515_OFF		0
+#define RT8515_ON		1
+
 struct rt8515 {
 	struct led_classdev_flash fled;
 	struct device *dev;
@@ -52,7 +56,7 @@ struct rt8515 {
 	struct regulator *reg;
 	struct gpio_desc *enable_torch;
 	struct gpio_desc *enable_flash;
-	struct timer_list powerdown_timer;
+	struct delayed_work powerdown_work;
 	u32 max_timeout; /* Flash max timeout */
 	int flash_max_intensity;
 	int torch_max_intensity;
@@ -63,27 +67,57 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
 	return container_of(fled, struct rt8515, fled);
 }
 
-static void rt8515_gpio_led_off(struct rt8515 *rt)
+static int rt8515_gpio_led_off(struct rt8515 *rt)
 {
-	gpiod_set_value(rt->enable_flash, 0);
-	gpiod_set_value(rt->enable_torch, 0);
+	int ret = 0;
+
+	gpiod_set_value(rt->enable_flash, RT8515_OFF);
+	gpiod_set_value(rt->enable_torch, RT8515_OFF);
+
+	if (!rt->reg)
+		return ret;
+
+	ret = regulator_is_enabled(rt->reg);
+	if (ret > 0)
+		ret = regulator_disable(rt->reg);
+
+	return ret;
 }
 
-static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
-					  int brightness)
+static int rt8515_gpio_brightness_commit(struct rt8515 *rt, struct gpio_desc *gpiod, int brightness)
 {
 	int i;
+	int ret;
+
+	/*
+	 * Reset the IC to start brightness from zero,
+	 * then re-enable and pulse to the desired level.
+	 */
+	ret = rt8515_gpio_led_off(rt);
+	if (ret)
+		return ret;
+
+	/* IC needs time to reset its brightness counter */
+	usleep_range(100, 200);
+
+	if (rt->reg) {
+		ret = regulator_enable(rt->reg);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Toggling a GPIO line with a small delay increases the
 	 * brightness one step at a time.
 	 */
 	for (i = 0; i < brightness; i++) {
-		gpiod_set_value(gpiod, 0);
+		gpiod_set_value(gpiod, RT8515_OFF);
 		udelay(1);
-		gpiod_set_value(gpiod, 1);
+		gpiod_set_value(gpiod, RT8515_ON);
 		udelay(1);
 	}
+
+	return 0;
 }
 
 /* This is setting the torch light level */
@@ -92,23 +126,38 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
 {
 	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
 	struct rt8515 *rt = to_rt8515(fled);
+	int ret = 0;
 
 	mutex_lock(&rt->lock);
 
 	if (brightness == LED_OFF) {
 		/* Off */
-		rt8515_gpio_led_off(rt);
+		ret = rt8515_gpio_led_off(rt);
+		if (ret)
+			goto out;
 	} else if (brightness < RT8515_TORCH_MAX) {
-		/* Step it up to movie mode brightness using the flash pin */
-		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
+		/*
+		 * Step it up to movie mode brightness.
+		 * If there is no separate torch pin, use the flash pin
+		 * for torch as well.
+		 */
+		ret = rt8515_gpio_brightness_commit(rt,
+				rt->enable_torch ?: rt->enable_flash, brightness);
+		if (ret)
+			goto out;
 	} else {
-		/* Max torch brightness requested */
-		gpiod_set_value(rt->enable_torch, 1);
+		/*
+		 * Max torch brightness requested.
+		 * If there is no separate torch pin, use the flash pin
+		 * for torch as well.
+		 */
+		gpiod_set_value(rt->enable_torch ?: rt->enable_flash, RT8515_ON);
 	}
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
@@ -117,27 +166,36 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 	struct rt8515 *rt = to_rt8515(fled);
 	struct led_flash_setting *timeout = &fled->timeout;
 	int brightness = rt->flash_max_intensity;
+	int ret = 0;
 
-	mutex_lock(&rt->lock);
-
-	if (state) {
-		/* Enable LED flash mode and set brightness */
-		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
-		/* Set timeout */
-		mod_timer(&rt->powerdown_timer,
-			  jiffies + usecs_to_jiffies(timeout->val));
-	} else {
-		timer_delete_sync(&rt->powerdown_timer);
+	if (!state) {
+		cancel_delayed_work_sync(&rt->powerdown_work);
+		mutex_lock(&rt->lock);
 		/* Turn the LED off */
-		rt8515_gpio_led_off(rt);
+		ret = rt8515_gpio_led_off(rt);
+		if (!ret)
+			fled->led_cdev.brightness = LED_OFF;
+		mutex_unlock(&rt->lock);
+		return ret;
 	}
 
+	mutex_lock(&rt->lock);
+
+	/* Enable LED flash mode and set brightness */
+	ret = rt8515_gpio_brightness_commit(rt, rt->enable_flash, brightness);
+	if (ret)
+		goto out;
+
+	/* Set timeout */
+	schedule_delayed_work(&rt->powerdown_work, usecs_to_jiffies(timeout->val));
+
 	fled->led_cdev.brightness = LED_OFF;
 	/* After this the torch LED will be disabled */
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
@@ -145,7 +203,7 @@ static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
 {
 	struct rt8515 *rt = to_rt8515(fled);
 
-	*state = timer_pending(&rt->powerdown_timer);
+	*state = delayed_work_pending(&rt->powerdown_work);
 
 	return 0;
 }
@@ -163,12 +221,18 @@ static const struct led_flash_ops rt8515_flash_ops = {
 	.timeout_set = rt8515_led_flash_timeout_set,
 };
 
-static void rt8515_powerdown_timer(struct timer_list *t)
+static void rt8515_powerdown_work(struct work_struct *work)
 {
-	struct rt8515 *rt = timer_container_of(rt, t, powerdown_timer);
+	struct rt8515 *rt = container_of(work, struct rt8515, powerdown_work.work);
+	int ret;
 
 	/* Turn the LED off */
-	rt8515_gpio_led_off(rt);
+	mutex_lock(&rt->lock);
+	ret = rt8515_gpio_led_off(rt);
+	mutex_unlock(&rt->lock);
+
+	if (ret)
+		dev_err(rt->dev, "failed to turn off LED (%d)\n", ret);
 }
 
 static void rt8515_init_flash_timeout(struct rt8515 *rt)
@@ -298,11 +362,18 @@ static int rt8515_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rt->enable_flash),
 				     "cannot get ENF (enable flash) GPIO\n");
 
-	/* ENT - Enable Torch line */
-	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	/* ENT - Enable Torch line (optional for single-GPIO flash ICs) */
+	rt->enable_torch = devm_gpiod_get_optional(dev, "ent", GPIOD_OUT_LOW);
 	if (IS_ERR(rt->enable_torch))
 		return dev_err_probe(dev, PTR_ERR(rt->enable_torch),
-				     "cannot get ENT (enable torch) GPIO\n");
+				     "Failed to obtain the Enable Torch GPIO\n");
+
+	rt->reg = devm_regulator_get_optional(dev, "vin");
+	if (IS_ERR(rt->reg)) {
+		if (PTR_ERR(rt->reg) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		rt->reg = NULL;
+	}
 
 	child = device_get_next_child_node(dev, NULL);
 	if (!child) {
@@ -328,12 +399,17 @@ static int rt8515_probe(struct platform_device *pdev)
 		dev_warn(dev,
 			 "flash-max-timeout-us property missing\n");
 	}
-	timer_setup(&rt->powerdown_timer, rt8515_powerdown_timer, 0);
+	INIT_DELAYED_WORK(&rt->powerdown_work, rt8515_powerdown_work);
 	rt8515_init_flash_timeout(rt);
 
 	fled->ops = &rt8515_flash_ops;
 
-	led->max_brightness = rt->torch_max_intensity;
+	/*
+	 * If there is no separate torch pin, use flash max intensity
+	 * as max brightness instead.
+	 */
+	led->max_brightness = rt->enable_torch ?
+		rt->torch_max_intensity : rt->flash_max_intensity;
 	led->brightness_set_blocking = rt8515_led_brightness_set;
 	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
@@ -372,7 +448,7 @@ static void rt8515_remove(struct platform_device *pdev)
 	struct rt8515 *rt = platform_get_drvdata(pdev);
 
 	rt8515_v4l2_flash_release(rt);
-	timer_delete_sync(&rt->powerdown_timer);
+	cancel_delayed_work_sync(&rt->powerdown_work);
 	mutex_destroy(&rt->lock);
 }
 

-- 
2.54.0



