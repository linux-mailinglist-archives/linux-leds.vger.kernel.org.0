Return-Path: <linux-leds+bounces-7510-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMgOAa/nxGkz5AQAu9opvQ
	(envelope-from <linux-leds+bounces-7510-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:00:47 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 614ED330C8E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0492B3034282
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 07:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F01E3B637A;
	Thu, 26 Mar 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZ49RFl4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2163B635E;
	Thu, 26 Mar 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511853; cv=none; b=NvPNXiDp+4G9kFEb0fyU+IyUGhIcVRoD3Dw7OVNEZDUoRvktZiKk5QdxcIHvzQ+97FvqNcaeffzDPck8GR5zKukVQkIOo0tAaScZ+7NTYAudd54pI42hjvaXsuKyLejU/bxEo/RefCzK8Y94di+XzQjoldzXw6ALR8ltxbPLQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511853; c=relaxed/simple;
	bh=kYdQEFCUjsNVHV6Kb5XOYYCwl12ecHQGVP9RCUGtumw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iym1RZdPOP9lKSEeCFnDkRB2If+EMyofiA/S4JsoN69CO8rmMuQ4HeuKyyUCt/3eIqD/Pj7NlTS2jH/PA12BJMiuFd+px9jyXPVFb7Ay/bAh/cOf7rH4rADhzPXgTJqc49VrtHmxeexewHUoMMQd2gt2MxxBjfeGvVnXEft/9cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZ49RFl4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE2A6C2BCB1;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774511853;
	bh=kYdQEFCUjsNVHV6Kb5XOYYCwl12ecHQGVP9RCUGtumw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FZ49RFl4cOdavtLxwOKm20wggQENV3LaUWU+IkHfITlfBPeGXUxlfIXMJ83QARail
	 4O6GN+vN4iCHRdAq6ERfcBxqa0bUOBTZGR/yq21P8gf1DPL2aZDKSs5JQkEGS5EjA6
	 /g6+62Km/FCt515Ir7sYA4D5xp/z7KdGHMwUmoWPr9R8jbGOVE4G5C1azrTK7cp6h0
	 jyPyoty2O+wB+kyqvUOhqo7bFVoI4F9SLkWSO/rftctwVBA9AvX5yAlSVh+a+NMyZS
	 jEg56HSlSmbFtvX8VtJ6oi8B79XJrLMv6kqdb7zdp2HiZq9A7tZ0h7gYImvF4muVFK
	 X1kwe4Dlbng4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7F7106F2EA;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 26 Mar 2026 00:57:32 -0700
Subject: [PATCH v3 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-expressatt_camera_flash-v3-2-e75e5d58990f@gmail.com>
References: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
In-Reply-To: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774511852; l=6405;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=DxF5mr9S7uv5Cl6kr35TrWcazHvf6XEimdIWdUqrFXQ=;
 b=YHBFR5RPRglHCH2KuCsKeuM/gq+oIW3ZdvzbxUjlZLxoLKterQK6y2Y1c8gBWKAXaBe3oukFZ
 Y937K0FY7onD83c8SliHKUOBIMzn8FnyiUtzQkJN4OOVEV7vMoRdgcf
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7510-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 614ED330C8E
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
 drivers/leds/flash/leds-rt8515.c | 90 ++++++++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index f6b439674c03..739cac8789c8 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -63,16 +63,44 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
 	return container_of(fled, struct rt8515, fled);
 }
 
-static void rt8515_gpio_led_off(struct rt8515 *rt)
+static int rt8515_led_off(struct rt8515 *rt)
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
+static int rt8515_set_flash_brightness(struct rt8515 *rt,
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
+	ret = rt8515_led_off(rt);
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
@@ -84,31 +112,41 @@ static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
 		gpiod_set_value(gpiod, 1);
 		udelay(1);
 	}
+
+	return 0;
 }
 
 /* This is setting the torch light level */
-static int rt8515_led_brightness_set(struct led_classdev *led,
+static int rt8515_set_brightness(struct led_classdev *led,
 				     enum led_brightness brightness)
 {
 	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
 	struct rt8515 *rt = to_rt8515(fled);
+	int ret = 0;
 
 	mutex_lock(&rt->lock);
 
 	if (brightness == LED_OFF) {
 		/* Off */
-		rt8515_gpio_led_off(rt);
+		ret = rt8515_led_off(rt);
+		if (ret)
+			goto out;
 	} else if (brightness < RT8515_TORCH_MAX) {
-		/* Step it up to movie mode brightness using the flash pin */
-		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
+		/* Step it up to movie mode brightness */
+		ret = rt8515_set_flash_brightness(rt, rt->enable_torch ?
+				rt->enable_torch : rt->enable_flash, brightness);
+		if (ret)
+			goto out;
 	} else {
 		/* Max torch brightness requested */
-		gpiod_set_value(rt->enable_torch, 1);
+		gpiod_set_value(rt->enable_torch ? rt->enable_torch :
+				rt->enable_flash, 1);
 	}
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
@@ -117,27 +155,33 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 	struct rt8515 *rt = to_rt8515(fled);
 	struct led_flash_setting *timeout = &fled->timeout;
 	int brightness = rt->flash_max_intensity;
+	int ret = 0;
 
 	mutex_lock(&rt->lock);
 
 	if (state) {
 		/* Enable LED flash mode and set brightness */
-		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
+		ret = rt8515_set_flash_brightness(rt, rt->enable_flash, brightness);
+		if (ret)
+			goto out;
 		/* Set timeout */
 		mod_timer(&rt->powerdown_timer,
 			  jiffies + usecs_to_jiffies(timeout->val));
 	} else {
 		timer_delete_sync(&rt->powerdown_timer);
 		/* Turn the LED off */
-		rt8515_gpio_led_off(rt);
+		ret = rt8515_led_off(rt);
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
@@ -166,9 +210,12 @@ static const struct led_flash_ops rt8515_flash_ops = {
 static void rt8515_powerdown_timer(struct timer_list *t)
 {
 	struct rt8515 *rt = timer_container_of(rt, t, powerdown_timer);
+	int ret;
 
 	/* Turn the LED off */
-	rt8515_gpio_led_off(rt);
+	ret = rt8515_led_off(rt);
+	if (ret)
+		dev_err(rt->dev, "failed to turn off LED (%d)\n", ret);
 }
 
 static void rt8515_init_flash_timeout(struct rt8515 *rt)
@@ -298,12 +345,18 @@ static int rt8515_probe(struct platform_device *pdev)
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
@@ -333,8 +386,9 @@ static int rt8515_probe(struct platform_device *pdev)
 
 	fled->ops = &rt8515_flash_ops;
 
-	led->max_brightness = rt->torch_max_intensity;
-	led->brightness_set_blocking = rt8515_led_brightness_set;
+	led->max_brightness = rt->enable_torch ?
+		rt->torch_max_intensity : rt->flash_max_intensity;
+	led->brightness_set_blocking = rt8515_set_brightness;
 	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
 	mutex_init(&rt->lock);

-- 
2.53.0



