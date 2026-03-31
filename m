Return-Path: <linux-leds+bounces-7605-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHA5NhUBzGkoNQYAu9opvQ
	(envelope-from <linux-leds+bounces-7605-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:15:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CAB36E4C7
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74A02305C726
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 17:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263A730E83A;
	Tue, 31 Mar 2026 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihxkAxSo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0E30DEDC;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976889; cv=none; b=JuX/EwjHqjwf9e614Uogn9H/hb77zrXqnbdsvc8m24oIwkP3idQ2JTgwEpspFVV4eMtH61nu6JHGS5HcL6aetjlmBbVvXseYm5jQKoJKn8uYECrX6q+vnHZdtSyeTH6/pDd+h1fW0PSYdfguYSYbSRqTVozGlZoz08jfOq2xvVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976889; c=relaxed/simple;
	bh=1ilQ6NwIUAHuE2aXouCYG3EJCP4y8gHjjw4b67QEdUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilIybP6wMONjYJSvIfhF7b8IylM/11DsQdWFjAHOEEYPfWnZo/LeOJkW2xXGTaenIXh12hUIq6h3EJyEQzFWA2RvUU5yyoW3EgTpO1IslcR4slcxWlUQIBpBzZEAnpRBKmuhdeb39rYW2gvqWRp0z8IREv5UtSEzH+WUj2y8zwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihxkAxSo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB4C2C2BCB7;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774976888;
	bh=1ilQ6NwIUAHuE2aXouCYG3EJCP4y8gHjjw4b67QEdUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ihxkAxSoKYhMGXu3BnFe9EbNduu71ZjjQ0s+JMS8OAFmw3nZIw0AFh8C/LHT5bccE
	 hvAc7vopHE7zpdOEZNZ3jAR6W35Mv2PoBTWH6tsuLCVEwAXOPIJr6PjE9Urd1c+vXR
	 dT+pjrABYohYeVBM5IYzusPKxdS13kVeW7ingeejGSm5lCL530ZNKe4RqY7wMx0c+Y
	 YN2HGDRs6aOVLKen2I7d0gTW2DlBw8UjhrvPVG6uFW+sjdlbXrsiNVCUn6Kt/oyxKf
	 e/yG9flkrrpTesiB1DZuRpVUHTIdCCqMZhzKN89LLE1R4lCP4JnBpXJnGorjFXtV4e
	 HjxYN+V5XfzLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE34910F92EB;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Tue, 31 Mar 2026 10:08:08 -0700
Subject: [PATCH v4 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
In-Reply-To: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774976888; l=6626;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=zZMrBj64Vyzjy9VmRNEhdaRoz7QyR5FMwlozpltanIw=;
 b=HmrcrSMHPZJNXzn2ONNfC4cfqhJNThuubjSJxk2wAFZA36qAzISrc/thEDUdcCtHIWAVCANvl
 a26on99UkSeBL/pA90C6DsjINzXLPUndo/9GTq4l9uSIvpY1sjWdd7y
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7605-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.961];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6CAB36E4C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Extend the RT8515 driver to support flash ICs that use only a single
GPIO for both flash and torch modes (no separate ENT pin), with an
optional vin regulator that gates power to the flash IC.

When vin-supply is provided, the driver enables the regulator before
activating the LED and disables it when turning off.

Make ent-gpios optional and validate at probe time that exactly one of
ent-gpios or vin-supply is provided. When ent-gpios is absent, the
driver uses enf-gpios for both flash and torch brightness control.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/leds/flash/leds-rt8515.c | 100 ++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index f6b439674c03..c7f0bdf804a7 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -63,16 +63,44 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
 	return container_of(fled, struct rt8515, fled);
 }
 
-static void rt8515_gpio_led_off(struct rt8515 *rt)
+static int rt8515_gpio_led_off(struct rt8515 *rt)
 {
+	int ret;
+
 	gpiod_set_value(rt->enable_flash, 0);
-	gpiod_set_value(rt->enable_torch, 0);
+	if (rt->enable_torch)
+		gpiod_set_value(rt->enable_torch, 0);
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
+	/* IC needs time to reset its brightness counter */
+	usleep_range(100, 200);
+	/* Enable regulator */
+	ret = regulator_enable(rt->reg);
+	if (ret)
+		return ret;
 
 	/*
 	 * Toggling a GPIO line with a small delay increases the
@@ -84,6 +112,8 @@ static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
 		gpiod_set_value(gpiod, 1);
 		udelay(1);
 	}
+
+	return 0;
 }
 
 /* This is setting the torch light level */
@@ -92,23 +122,39 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
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
+		ret = rt8515_gpio_brightness_commit(rt, rt->enable_torch ?
+				rt->enable_torch : rt->enable_flash, brightness);
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
+		gpiod_set_value(rt->enable_torch ? rt->enable_torch :
+				rt->enable_flash, 1);
 	}
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
@@ -117,27 +163,33 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
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
 		/* Set timeout */
 		mod_timer(&rt->powerdown_timer,
 			  jiffies + usecs_to_jiffies(timeout->val));
 	} else {
 		timer_delete_sync(&rt->powerdown_timer);
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
@@ -166,9 +218,12 @@ static const struct led_flash_ops rt8515_flash_ops = {
 static void rt8515_powerdown_timer(struct timer_list *t)
 {
 	struct rt8515 *rt = timer_container_of(rt, t, powerdown_timer);
+	int ret;
 
 	/* Turn the LED off */
-	rt8515_gpio_led_off(rt);
+	ret = rt8515_gpio_led_off(rt);
+	if (ret)
+		dev_err(rt->dev, "failed to turn off LED (%d)\n", ret);
 }
 
 static void rt8515_init_flash_timeout(struct rt8515 *rt)
@@ -298,12 +353,18 @@ static int rt8515_probe(struct platform_device *pdev)
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
+	rt->reg = devm_regulator_get(dev, "vin");
+	if (IS_ERR(rt->reg))
+		return dev_err_probe(dev, PTR_ERR(rt->reg),
+				     "failed to get vin supply\n");
+
 	child = device_get_next_child_node(dev, NULL);
 	if (!child) {
 		dev_err(dev,
@@ -333,7 +394,12 @@ static int rt8515_probe(struct platform_device *pdev)
 
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
 

-- 
2.53.0



