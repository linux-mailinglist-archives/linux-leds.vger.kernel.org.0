Return-Path: <linux-leds+bounces-7143-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIMmJSF4q2nDdQEAu9opvQ
	(envelope-from <linux-leds+bounces-7143-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDAD2292BE
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D5B63006201
	for <lists+linux-leds@lfdr.de>; Sat,  7 Mar 2026 00:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAEB2D9496;
	Sat,  7 Mar 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO+W/4/e"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100482D12F5;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845084; cv=none; b=bSFmrQcpkc+SEHr4YvyyxqGyAUyB9DkmfkPpF+EqKC21QE11diAKzZRuh13mW1xKdXreaY9QauKev/HTMh8MiT3DQhbgozYSfwSI68mrysO8jHD8+QLF8cCWVp92PykoFTxt6yHbdC9ijLtgUVO5K96Xv7xhh2h0CWjwVymCcug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845084; c=relaxed/simple;
	bh=or+7upfxppeC6I+hTgBjStuGZkwTFy3gMr85nNaSj9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4AglhihGrFr1wOiIEtiCxYAaIVQ/WfNHMuPSRZkILyoirYmkTJvJwXpipJsKEwVNiYr1kHaMU5GgU+bwi8v9uBwPWckNNf8Y0R71tsXzSWG8GBfX5V4cK6IDhJZbl/EAI2dpYrQ9NIjwEugGhRK0euq0UmRs3V7q43f4Hkl8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO+W/4/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEEE9C2BC86;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772845083;
	bh=or+7upfxppeC6I+hTgBjStuGZkwTFy3gMr85nNaSj9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nO+W/4/eHGqWDRQDTU8k+wrQ7St8Omv0QfEi/Cr4yJnNgcAWRE22voqrixJgFz+Tt
	 wUKjI+xjJejUECWRz7TqMqNgyEa4pE9pAUG6juHqzbNxT66Imnkl6OA1r89AoSNHmN
	 R+XJCJDysN+iY80TjH7iaOic3NVdD2dA3OEHTG04TrnkqB/pF13Ak/4KFXS6hOs0lR
	 Q4ipD9zjqOyP0RqycVRCmiYjN/IZN6YVrjWFR3D1C+FXHriepbi4QLNySAlRhxCll9
	 C7kehseo5Fdi7Goks9V7XWZC+/7E//tlx9w3qoVn5ZXnv/vqDn2e6qdQP1NYEt2Fwb
	 KaIybhJKS7YJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0163FC9EC8;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 06 Mar 2026 16:58:03 -0800
Subject: [PATCH 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with unlock gate
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-expressatt_camera_flash-v1-2-b1996f7cdfdd@gmail.com>
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772845083; l=3781;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=eBn8zK2zm3rDt5Cq7ivsaMjK/w9HVVqK9pNgZvC1x40=;
 b=UGnv+rPdrIkDsaPCfH0UYYPewggp5aHqP1G8iGvesY+NLY+lLUq1qPqga3ovVhzNgVzx5sl0w
 SGvmYjjv2mDCarGK2PGGbQNJeXJUO0bubloizi0gW2DiVMpf0Oq6bHu
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 9CDAD2292BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7143-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Rudraksha Gupta <guptarud@gmail.com>

Extend the RT8515 driver to support flash ICs that use only a single
GPIO for both flash and torch modes (no separate ENT pin), with an
optional unlock GPIO that gates the flash circuit.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/leds/flash/leds-rt8515.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index f6b439674c03..3164bf91e4c9 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -52,6 +52,7 @@ struct rt8515 {
 	struct regulator *reg;
 	struct gpio_desc *enable_torch;
 	struct gpio_desc *enable_flash;
+	struct gpio_desc *unlock_gpio;
 	struct timer_list powerdown_timer;
 	u32 max_timeout; /* Flash max timeout */
 	int flash_max_intensity;
@@ -66,7 +67,10 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
 static void rt8515_gpio_led_off(struct rt8515 *rt)
 {
 	gpiod_set_value(rt->enable_flash, 0);
-	gpiod_set_value(rt->enable_torch, 0);
+	if (rt->enable_torch)
+		gpiod_set_value(rt->enable_torch, 0);
+	if (rt->unlock_gpio)
+		gpiod_set_value_cansleep(rt->unlock_gpio, 0);
 }
 
 static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
@@ -99,11 +103,19 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
 		/* Off */
 		rt8515_gpio_led_off(rt);
 	} else if (brightness < RT8515_TORCH_MAX) {
-		/* Step it up to movie mode brightness using the flash pin */
-		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
+		/* Unlock the flash circuit if needed */
+		if (rt->unlock_gpio)
+			gpiod_set_value_cansleep(rt->unlock_gpio, 1);
+		/* Step it up to movie mode brightness */
+		rt8515_gpio_brightness_commit(rt->enable_torch ?
+				rt->enable_torch : rt->enable_flash, brightness);
 	} else {
+		/* Unlock the flash circuit if needed */
+		if (rt->unlock_gpio)
+			gpiod_set_value_cansleep(rt->unlock_gpio, 1);
 		/* Max torch brightness requested */
-		gpiod_set_value(rt->enable_torch, 1);
+		gpiod_set_value(rt->enable_torch ? rt->enable_torch :
+				rt->enable_flash, 1);
 	}
 
 	mutex_unlock(&rt->lock);
@@ -121,6 +133,9 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 	mutex_lock(&rt->lock);
 
 	if (state) {
+		/* Unlock the flash circuit if needed */
+		if (rt->unlock_gpio)
+			gpiod_set_value_cansleep(rt->unlock_gpio, 1);
 		/* Enable LED flash mode and set brightness */
 		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
 		/* Set timeout */
@@ -298,12 +313,23 @@ static int rt8515_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rt->enable_flash),
 				     "cannot get ENF (enable flash) GPIO\n");
 
-	/* ENT - Enable Torch line */
-	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	/* ENT - Enable Torch line (optional for single-GPIO flash ICs) */
+	rt->enable_torch = devm_gpiod_get_optional(dev, "ent", GPIOD_OUT_LOW);
 	if (IS_ERR(rt->enable_torch))
 		return dev_err_probe(dev, PTR_ERR(rt->enable_torch),
 				     "cannot get ENT (enable torch) GPIO\n");
 
+	/* Optional unlock GPIO (e.g. PMIC MPP to gate flash circuit) */
+	rt->unlock_gpio = devm_gpiod_get_optional(dev, "unlock", GPIOD_OUT_LOW);
+	if (IS_ERR(rt->unlock_gpio))
+		return dev_err_probe(dev, PTR_ERR(rt->unlock_gpio),
+				     "cannot get unlock GPIO\n");
+
+	/* Exactly one of ENT or unlock must be provided */
+	if (!rt->enable_torch == !rt->unlock_gpio)
+		return dev_err_probe(dev, -EINVAL,
+				     "exactly one of ent-gpios or unlock-gpios is required\n");
+
 	child = device_get_next_child_node(dev, NULL);
 	if (!child) {
 		dev_err(dev,

-- 
2.53.0



