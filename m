Return-Path: <linux-leds+bounces-7961-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJe+LHvB92mZlwIAu9opvQ
	(envelope-from <linux-leds+bounces-7961-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652D4B78D3
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 198FF300F5D8
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 21:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0766E3A9001;
	Sun,  3 May 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDdtPOox"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2243A7F4C;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844596; cv=none; b=q6D8usqaflsew6iUQaYamjVKwPXsGz3qGNCwaPLBg0CKDjm3c2i54MR2VXwYGL2++Ej8tto6ZusSHWQHKcVfZAp+9Ny1Dbjgo67cpmW1JYWz2kXrgVpy0InkPvd81qy/GHJq5ddCieDEHz//VEJ75hcZyHdmEe+cwqkurMksPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844596; c=relaxed/simple;
	bh=UNIInnizweh+PYPWAANIlkfMe5JtcEqTCQJHCmxP9Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ld4T0Dzf2a/c6wYexar6H8amtQZvV+/pfW73CNWEkhSAMo9EjHfbwjemWxZ35dBzKnPTeIUCml2sefrLsCitFXyvscV+aUlRkihVTscufqWHd/erQTqdi0EDZJk6TKL/CrQSSfjHp2a07vqQBOkJ95ZXkFUuJtew0QKGZHfb+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDdtPOox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AB73C2BCC9;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777844596;
	bh=UNIInnizweh+PYPWAANIlkfMe5JtcEqTCQJHCmxP9Bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aDdtPOoxCIEMQSohrv98or0CSCa4znOQEV6VpIt+/0lJyTE54P9PpKMLsu8z9j2Kb
	 IYzzzawDbnQlZkh8rTiAuFCeOYOP/4NLQNrKQes7xGNW75VZUoYu9oMn7XEOSH6oe5
	 0RRCjh/bd6I4gd6OCpQrD9rDPZRVTDyMYrshXecf563Auf8rvGijA4RD2L+dbyaMQv
	 hNtVa2qx1emhCROHdFrBtVv/tJu9IgZTiNUZ453q7fa6RDAZFsTbVp/uF2vPsX7vur
	 rJDf4xtvIX8oo/Dd7bGMAB2nrKOtNYyeFQF2KeNNKvf/zd8v7+ZJGZ92uH+GhKom0j
	 kPXLKHJU1jgVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737EECD342C;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 03 May 2026 14:43:16 -0700
Subject: [PATCH v5 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-expressatt_camera_flash-v5-2-95524506a799@gmail.com>
References: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
In-Reply-To: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777844595; l=8332;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ID7JLReDGTmzJX9PKpm0HrliqPo0rE9plki/J7Mr/bQ=;
 b=U+RAsZCnxJFGPqcVdoNRq/I1dBLtrhmN5fncz5R1IeCxwfwi4b+kLWSlYgrHYmAUD+TpE+fYp
 p6KLFUeGX24CyQTfimJ72YGbXiJy4gC3QPqGlDR9Z1mkBRbM0LTVaqM
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 5652D4B78D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-7961-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,powerdown_work.work:url]

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
 drivers/leds/flash/leds-rt8515.c | 130 +++++++++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index f6b439674c03..4459874e6a6c 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -31,6 +31,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/workqueue.h>
 
 #include <media/v4l2-flash-led-class.h>
 
@@ -52,7 +53,7 @@ struct rt8515 {
 	struct regulator *reg;
 	struct gpio_desc *enable_torch;
 	struct gpio_desc *enable_flash;
-	struct timer_list powerdown_timer;
+	struct delayed_work powerdown_work;
 	u32 max_timeout; /* Flash max timeout */
 	int flash_max_intensity;
 	int torch_max_intensity;
@@ -63,16 +64,50 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
 	return container_of(fled, struct rt8515, fled);
 }
 
-static void rt8515_gpio_led_off(struct rt8515 *rt)
+static int rt8515_gpio_led_off(struct rt8515 *rt)
 {
+	int ret;
+
 	gpiod_set_value(rt->enable_flash, 0);
 	gpiod_set_value(rt->enable_torch, 0);
+
+	if (!rt->reg)
+		return 0;
+
+	/* Disable regulator */
+	ret = regulator_is_enabled(rt->reg);
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return regulator_disable(rt->reg);
+
+	return 0;
 }
 
-static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
-					  int brightness)
+static int rt8515_gpio_brightness_commit(struct rt8515 *rt,
+					 struct gpio_desc *gpiod,
+					 int brightness)
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
+	/* Enable regulator */
+	if (rt->reg) {
+		ret = regulator_enable(rt->reg);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Toggling a GPIO line with a small delay increases the
@@ -84,6 +119,8 @@ static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
 		gpiod_set_value(gpiod, 1);
 		udelay(1);
 	}
+
+	return 0;
 }
 
 /* This is setting the torch light level */
@@ -92,23 +129,38 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
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
+		gpiod_set_value(rt->enable_torch ?: rt->enable_flash, 1);
 	}
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
@@ -117,27 +169,34 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 	struct rt8515 *rt = to_rt8515(fled);
 	struct led_flash_setting *timeout = &fled->timeout;
 	int brightness = rt->flash_max_intensity;
+	int ret = 0;
 
 	mutex_lock(&rt->lock);
 
 	if (state) {
 		/* Enable LED flash mode and set brightness */
-		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
+		ret = rt8515_gpio_brightness_commit(rt, rt->enable_flash, brightness);
+		if (ret)
+			goto out;
+
 		/* Set timeout */
-		mod_timer(&rt->powerdown_timer,
-			  jiffies + usecs_to_jiffies(timeout->val));
+		schedule_delayed_work(&rt->powerdown_work,
+				      usecs_to_jiffies(timeout->val));
 	} else {
-		timer_delete_sync(&rt->powerdown_timer);
+		cancel_delayed_work(&rt->powerdown_work);
 		/* Turn the LED off */
-		rt8515_gpio_led_off(rt);
+		ret = rt8515_gpio_led_off(rt);
+		if (ret)
+			goto out;
 	}
 
 	fled->led_cdev.brightness = LED_OFF;
 	/* After this the torch LED will be disabled */
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
@@ -145,7 +204,7 @@ static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
 {
 	struct rt8515 *rt = to_rt8515(fled);
 
-	*state = timer_pending(&rt->powerdown_timer);
+	*state = delayed_work_pending(&rt->powerdown_work);
 
 	return 0;
 }
@@ -163,12 +222,18 @@ static const struct led_flash_ops rt8515_flash_ops = {
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
@@ -298,12 +363,22 @@ static int rt8515_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rt->enable_flash),
 				     "cannot get ENF (enable flash) GPIO\n");
 
-	/* ENT - Enable Torch line */
-	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	/* ENT - Enable Torch line (optional for single-GPIO flash ICs) */
+	rt->enable_torch = devm_gpiod_get_optional(dev, "ent", GPIOD_OUT_LOW);
 	if (IS_ERR(rt->enable_torch))
 		return dev_err_probe(dev, PTR_ERR(rt->enable_torch),
 				     "cannot get ENT (enable torch) GPIO\n");
 
+	/* Optional VIN supply */
+	rt->reg = devm_regulator_get_optional(dev, "vin");
+	if (IS_ERR(rt->reg)) {
+		ret = PTR_ERR(rt->reg);
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get vin supply\n");
+		rt->reg = NULL;
+	}
+
 	child = device_get_next_child_node(dev, NULL);
 	if (!child) {
 		dev_err(dev,
@@ -328,12 +403,17 @@ static int rt8515_probe(struct platform_device *pdev)
 		dev_warn(dev,
 			 "flash-max-timeout-us property missing\n");
 	}
-	timer_setup(&rt->powerdown_timer, rt8515_powerdown_timer, 0);
+	INIT_DELAYED_WORK(&rt->powerdown_work, rt8515_powerdown_work);
 	rt8515_init_flash_timeout(rt);
 
 	fled->ops = &rt8515_flash_ops;
 
-	led->max_brightness = rt->torch_max_intensity;
+	/*
+	 * If there is no separate torch pin, use the flash max intensity
+	 * as the max brightness instead.
+	 */
+	led->max_brightness = rt->enable_torch ?
+		rt->torch_max_intensity : rt->flash_max_intensity;
 	led->brightness_set_blocking = rt8515_led_brightness_set;
 	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
@@ -372,7 +452,7 @@ static void rt8515_remove(struct platform_device *pdev)
 	struct rt8515 *rt = platform_get_drvdata(pdev);
 
 	rt8515_v4l2_flash_release(rt);
-	timer_delete_sync(&rt->powerdown_timer);
+	cancel_delayed_work_sync(&rt->powerdown_work);
 	mutex_destroy(&rt->lock);
 }
 

-- 
2.54.0



