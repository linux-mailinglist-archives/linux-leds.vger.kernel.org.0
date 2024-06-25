Return-Path: <linux-leds+bounces-2119-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8491616E
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 10:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075BE1F247C8
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 08:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464651494C2;
	Tue, 25 Jun 2024 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oRTfm4FJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA8E1494CF;
	Tue, 25 Jun 2024 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304490; cv=none; b=IkMlWRNuEuKXlM/dSlKwDBWWlJ341W1mwDbZxi3Kr94yTXFVMFF3GuLsspAbNb1UF4E57TRMzBWnQ1nlNQ60O7FFVwaEmJUOBPN6XrfHH0BX+efCbEhAPfMTHoGv7D2wKG+UB2aoo6iZugA5Qze2FhUCKKGr5XI/IROQB6x4hRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304490; c=relaxed/simple;
	bh=2DrgvTFh1Y8ZBhAo2bGZlrCNTrt/32SfYiX9Ov/4Dtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LS1FEWi6JmX/5de0vkj/vId6vATTTQ5wymYgS5/Nss4BwCCDEqsP0piSfr1M3KDq38CVYApM8vDmdbI0krcxqMyWpRWoLMqwQQjC94BGfXhigPYrZG8JnjNQBayEXgLhtj4EQ7ZF73UIWHuoBhaH1l6MwrVYNpZDCVxHq5VjjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oRTfm4FJ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A00F60006;
	Tue, 25 Jun 2024 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719304486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TBmCVBHWFHxT12SEsWkRlk2XPtdKv1K+6AK5GF/8j/A=;
	b=oRTfm4FJmcuLCm98NAnXX2V2+6CxC4YdhTNbFffE7pf1i/kvK1gf3W6vMNiyDmnRlxwAZi
	qz8XwxiQJRE3ZaZsZT8U1WkOQeRiwqMf/nWe9PtpmLOglDKWWgqICQKbWnMYumBGx5SLNz
	i7Jb+rMhkzNZdZG2PH9h8GghP+OzMKE6KReRc7NXEGokCyTM1Zdq0jqbvRh48UntzvgdYZ
	Sndsp8x2OqHPMTTNMDwxTXDaH0zhqaUEbfmMSeAAiWa+mh4l5BD+mqCekcUPKiakljIjhz
	UX9ZECkzxTCv8iB+vQEyBMWZ0+gNn162g9i/tpbHCu1G5jX0EY4H9f7eAyAVOg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Jun 2024 10:34:38 +0200
Subject: [PATCH v2] Revert "leds: led-core: Fix refcount leak in
 of_led_get()"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240625-led-class-device-leak-v2-1-75fdccf47421@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAB2BemYC/4WNTQ6CMBBGr0Jm7Rg6YEFW3sOwKO0oE5GaljQaw
 t2tXMDle/l+VogchCN0xQqBk0TxcwY6FGBHM98ZxWUGKqkuNZ1wYod2MjGiy3HLWZgHal01hlp
 Sumkhd1+Bb/Led6995lHi4sNnv0nqZ/8tJoUKzzzUdaUrVVq6DN4vk8xH65/Qb9v2BYGTnMm8A
 AAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Miaoqian Lin <linmq006@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com

This reverts commit da1afe8e6099980fe1e2fd7436dca284af9d3f29.

Commit 699a8c7c4bd3 ("leds: Add of_led_get() and led_put()"), introduced in
5.5, added of_led_get() and led_put() but missed a put_device() in
led_put(), thus creating a leak in case the consumer device is removed.

Arguably device removal was not very popular, so this went apparently
unnoticed until 2022. In January 2023 two different patches got merged to
fix the same bug:

 - commit da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()")
 - commit 445110941eb9 ("leds: led-class: Add missing put_device() to led_put()")

They fix the bug in two different ways, which creates no patch conflicts,
and both were merged in v6.2. The result is that now there is one more
put_device() than get_device()s, instead of one less.

Arguably device removal is not very popular yet, so this apparently hasn't
been noticed as well up to now. But it blew up here while I'm working with
device tree overlay insertion and removal. The symptom is an apparently
unrelated list of oopses on device removal, with reasons:

  kernfs: can not remove 'uevent', no directory
  kernfs: can not remove 'brightness', no directory
  kernfs: can not remove 'max_brightness', no directory
  ...

Here sysfs fails removing attribute files, which is because the device name
changed and so the sysfs path. This is because the device name string got
corrupted, which is because it got freed too early and its memory reused.

Different symptoms could appear in different use cases.

Fix by removing one of the two fixes.

The choice was to remove commit da1afe8e6099 because:

 * it is calling put_device() inside of_led_get() just after getting the
   device, thus it is basically not refcounting the LED device at all
   during its entire lifetime
 * it does not add a corresponding put_device() in led_get(), so it fixes
   only the OF case

The other fix (445110941eb9) is adding the put_device() in led_put() so it
covers the entire lifetime, and it works even in the non-DT case.

Fixes: da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()")
Co-developed-by: Hervé Codina <herve.codina@bootlin.com>
Signed-off-by: Hervé Codina <herve.codina@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Add missing SoB line for co-developer
- Link to v1: https://lore.kernel.org/r/20240625-led-class-device-leak-v1-1-9eb4436310c2@bootlin.com
---

Changed in v2:
 - add missing SoM line for Hervé
---
 drivers/leds/led-class.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 24fcff682b24..b23d2138cd83 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -258,7 +258,6 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 
 	led_dev = class_find_device_by_of_node(&leds_class, led_node);
 	of_node_put(led_node);
-	put_device(led_dev);
 
 	return led_module_get(led_dev);
 }

---
base-commit: 28ef3e64d0a22f6a29a1ea489293715a29623e52
change-id: 20240625-led-class-device-leak-6637a2821678

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


