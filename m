Return-Path: <linux-leds+bounces-7383-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH/jLVbwumkBdQIAu9opvQ
	(envelope-from <linux-leds+bounces-7383-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:35:02 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889A2C15FF
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 618B7303A3DE
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 18:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5111E3E3D8E;
	Wed, 18 Mar 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxSAA0vB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238D3E2741;
	Wed, 18 Mar 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858881; cv=none; b=N7cwYQbIjIq5B6jJhpaOwyDycYZiAnTqoWbhboqjzsXAVRYYcNO9KZQRCHPv6jKacZ7FHuQ7sWvJdiGp5HMC8YjqDdFvmq2UqVJt8bMKnTWfQFgQBEEen+xdN9YC3FlGOTqCPoveAt3voXraVpJxVY69LV0oH3+GSGQNNbB8vt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858881; c=relaxed/simple;
	bh=E7tnsMC7ZepUXd/Uiotk8REsBsDrkzUH/mRdAkea3ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsBE6zOAZTjsupkbHKYKWNZzlPkHIimdLqtHWNfJzZtanUKHClVWb8Tandj4DVyFLoRfYMnviYlVGaRTi2xf0QzIgiBzsCTBnBKlOn8/dXVRl8ZZH4peEnjY9T/soNrbeHLfBaLmbpKxAoQY9Ef5LEgpQc8P2GWV1eqPEIdPA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxSAA0vB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC972C2BCAF;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773858880;
	bh=E7tnsMC7ZepUXd/Uiotk8REsBsDrkzUH/mRdAkea3ww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dxSAA0vBy9WSZvkuaf73yNSg+kI9lqJudHxJIYlfPbA3ds7c5hVKV7b9SH3whZ/y5
	 PSAn0R7mvPQbEhPn3uMZo4z0rPCnDflGjWRu/+xtwNYDuIH2VWiHpAY/Ko4BlVYiyD
	 7rX2lRySlisYmARvkjw5wSCMWvzEpNbvhx+TG5FZ3iXhFO8Ri9AYsvR/1BMsfi9ik3
	 yDt5l0SOxBOt1MqTjEsNk7kET3z7MFLqcEEIOeTauA2FDirybIH9aobnju+YTwdViC
	 A3onfMCmqWF0pXu86UZaPzOec9grYBuQIJ6uAbLqFvurHnQ+AurOEeV0HxZzNIC6Y3
	 0dXYupyNTtabg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB591077605;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 18 Mar 2026 11:34:40 -0700
Subject: [PATCH v2 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-expressatt_camera_flash-v2-2-5c2b9a623dcb@gmail.com>
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
In-Reply-To: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773858880; l=5198;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=PKRvCMK0VSbCQ3Z9MBD1bkA0UDBR/q3Gb0zyNbKdvRE=;
 b=MQbNxOMteq4Y3zoIYZ+ythyp8RsNJ2IshduHMf9mzkPG0sMd3jUjq/ybA754Z1jwsX1+ANo6j
 7eJq3o73ZClBiAr+JxcRNpLmcMfmkMGXrMy7WnV41fbgygRSbwbhtP4
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7383-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7889A2C15FF
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

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/leds/flash/leds-rt8515.c | 64 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index f6b439674c03..69cfd5cba921 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -50,6 +50,7 @@ struct rt8515 {
 	struct v4l2_flash *v4l2_flash;
 	struct mutex lock;
 	struct regulator *reg;
+	bool reg_enabled;
 	struct gpio_desc *enable_torch;
 	struct gpio_desc *enable_flash;
 	struct timer_list powerdown_timer;
@@ -66,7 +67,12 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
 static void rt8515_gpio_led_off(struct rt8515 *rt)
 {
 	gpiod_set_value(rt->enable_flash, 0);
-	gpiod_set_value(rt->enable_torch, 0);
+	if (rt->enable_torch)
+		gpiod_set_value(rt->enable_torch, 0);
+	if (rt->reg && rt->reg_enabled) {
+		regulator_disable(rt->reg);
+		rt->reg_enabled = false;
+	}
 }
 
 static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
@@ -92,6 +98,7 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
 {
 	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
 	struct rt8515 *rt = to_rt8515(fled);
+	int ret = 0;
 
 	mutex_lock(&rt->lock);
 
@@ -99,16 +106,33 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
 		/* Off */
 		rt8515_gpio_led_off(rt);
 	} else if (brightness < RT8515_TORCH_MAX) {
-		/* Step it up to movie mode brightness using the flash pin */
-		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
+		/* Enable the vin regulator if needed */
+		if (rt->reg && !rt->reg_enabled) {
+			ret = regulator_enable(rt->reg);
+			if (ret)
+				goto out;
+			rt->reg_enabled = true;
+		}
+		/* Step it up to movie mode brightness */
+		rt8515_gpio_brightness_commit(rt->enable_torch ?
+				rt->enable_torch : rt->enable_flash, brightness);
 	} else {
+		/* Enable the vin regulator if needed */
+		if (rt->reg && !rt->reg_enabled) {
+			ret = regulator_enable(rt->reg);
+			if (ret)
+				goto out;
+			rt->reg_enabled = true;
+		}
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
@@ -117,10 +141,18 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 	struct rt8515 *rt = to_rt8515(fled);
 	struct led_flash_setting *timeout = &fled->timeout;
 	int brightness = rt->flash_max_intensity;
+	int ret = 0;
 
 	mutex_lock(&rt->lock);
 
 	if (state) {
+		/* Enable the vin regulator if needed */
+		if (rt->reg && !rt->reg_enabled) {
+			ret = regulator_enable(rt->reg);
+			if (ret)
+				goto out;
+			rt->reg_enabled = true;
+		}
 		/* Enable LED flash mode and set brightness */
 		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
 		/* Set timeout */
@@ -135,9 +167,10 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 	fled->led_cdev.brightness = LED_OFF;
 	/* After this the torch LED will be disabled */
 
+out:
 	mutex_unlock(&rt->lock);
 
-	return 0;
+	return ret;
 }
 
 static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
@@ -298,12 +331,27 @@ static int rt8515_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rt->enable_flash),
 				     "cannot get ENF (enable flash) GPIO\n");
 
-	/* ENT - Enable Torch line */
-	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	/* ENT - Enable Torch line (optional for single-GPIO flash ICs) */
+	rt->enable_torch = devm_gpiod_get_optional(dev, "ent", GPIOD_OUT_LOW);
 	if (IS_ERR(rt->enable_torch))
 		return dev_err_probe(dev, PTR_ERR(rt->enable_torch),
 				     "cannot get ENT (enable torch) GPIO\n");
 
+	/* Optional VIN supply (e.g. GPIO-controlled fixed regulator) */
+	rt->reg = devm_regulator_get_optional(dev, "vin");
+	if (IS_ERR(rt->reg)) {
+		if (PTR_ERR(rt->reg) == -ENODEV)
+			rt->reg = NULL;
+		else
+			return dev_err_probe(dev, PTR_ERR(rt->reg),
+					     "failed to get vin supply\n");
+	}
+
+	/* Exactly one of ENT or VIN must be provided */
+	if (!rt->enable_torch == !rt->reg)
+		return dev_err_probe(dev, -EINVAL,
+				     "exactly one of ent-gpios or vin-supply is required\n");
+
 	child = device_get_next_child_node(dev, NULL);
 	if (!child) {
 		dev_err(dev,

-- 
2.53.0



