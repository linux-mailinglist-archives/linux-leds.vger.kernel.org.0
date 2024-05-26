Return-Path: <linux-leds+bounces-1699-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 379838CF556
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 20:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E676B281084
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 18:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A3D12BEAC;
	Sun, 26 May 2024 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oG00mbCj"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21D12BF11;
	Sun, 26 May 2024 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716747515; cv=none; b=K8Af7r2F65Om1mJ/rlT+nO46/dUyfUKBS1of2bOcsiZWCaY4fFdPuyVTqUa7Ca/+9XkrczufaPkctfDUQMGPoIBOOqehP44reIL1UYB0Yorj7xIRjwb9NQg4SYk8FQwackQl/UXqNaAcjxt4q0jDN1VPNQB+l6ohNdq3w3XavIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716747515; c=relaxed/simple;
	bh=o5fqvb3/w5pnVYn9E3ghdcEeFk44zpjLuVu8Q1kPrU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfYRE1Y9gQMCVqqZ7DGQKuKPeA/x9rGrDMJVPjWDH9ZjQfX0okkBJfdpfL2JzjpdWppuS5j62/4g8UB3HluwyGOkiThsIhY5vLnucPLA/HIFNWAJNX9CjNacMkzJSjmsIBTMqnvt5p+Oy9PoP21z59kvdtsiZuJ2wiKVyhLzt3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=oG00mbCj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716747502;
	bh=o5fqvb3/w5pnVYn9E3ghdcEeFk44zpjLuVu8Q1kPrU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oG00mbCjZV03syE8vVMKNMGLtxiI7CFz+i/mi6lKQ4kahXFCP6wZvyrkOWOhSBAOw
	 cuKk+ENDV3luYvDrJhBFrIDurSvZbcA6GBkXZlf6vAN7DwdYXyRotPeszjbgbhiXe3
	 BrCp50SRfx438aTlKM6OlrdO2qRGhsrNdYP5+dR8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 26 May 2024 20:17:16 +0200
Subject: [PATCH v3 2/4] leds: add flag to avoid automatic renaming of led
 devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240526-cros_ec-kbd-led-framework-v3-2-ee577415a521@weissschuh.net>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-leds@vger.kernel.org, 
 Rajas Paranjpe <paranjperajas@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716747501; l=1355;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=o5fqvb3/w5pnVYn9E3ghdcEeFk44zpjLuVu8Q1kPrU8=;
 b=UuKtiug1UtluwOnfe1goI/vLdBWB9Kzcj4CMjbR6DCSxeESDq5Vp+XZD5i510Ppr35TMIzm9P
 rWGXRNI1GbBDXdyyEyP2JarvLHBwMgBzjeczQK5iMzhRtIQvBx70F5D
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a mechanism for drivers to opt-out of the automatic device renaming
on conflicts.
Those drivers will provide their own conflict resolution.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class.c | 2 ++
 include/linux/leds.h     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index c298355d5b7d..2f08c20702f3 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -503,6 +503,8 @@ int led_classdev_register_ext(struct device *parent,
 	ret = led_classdev_next_name(proposed_name, final_name, sizeof(final_name));
 	if (ret < 0)
 		return ret;
+	else if (ret && led_cdev->flags & LED_REJECT_NAME_CONFLICT)
+		return -EEXIST;
 	else if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision\n",
 			 proposed_name, final_name);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6300313c46b7..36663ac6c58a 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -107,6 +107,7 @@ struct led_classdev {
 #define LED_BRIGHT_HW_CHANGED	BIT(21)
 #define LED_RETAIN_AT_SHUTDOWN	BIT(22)
 #define LED_INIT_DEFAULT_TRIGGER BIT(23)
+#define LED_REJECT_NAME_CONFLICT BIT(24)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;

-- 
2.45.1


