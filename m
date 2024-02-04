Return-Path: <linux-leds+bounces-754-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC92848ED5
	for <lists+linux-leds@lfdr.de>; Sun,  4 Feb 2024 16:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF2C1F21B63
	for <lists+linux-leds@lfdr.de>; Sun,  4 Feb 2024 15:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DA0224C6;
	Sun,  4 Feb 2024 15:16:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from alpha.404-net.de (alpha.404-net.de [193.26.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C616224E3
	for <linux-leds@vger.kernel.org>; Sun,  4 Feb 2024 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.26.159.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707059767; cv=none; b=CMReJLHkNawdC4OnS1I7c1CtqznAbbj4Jr6koAIT7zLpgM7nfAyYr9FT+X8SMG39oO8OXdn7jX03qZuIjbc/Cq1ajFhVBSd6ebp/YEt+zPF0ErwbTSdEClGZmGLL778kTtVSewSlUP807/DdphgGgDaDejSMEV73FCqQfnKS3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707059767; c=relaxed/simple;
	bh=s2QuvAjQ1a7LpB4lqJqaMhnT2yqN11n+k+pub6Q/bPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRxvI7x5BfRi6yZEUZ4kzsJFUl9SL+GBvrbFBsc7KcHZP4bhOLsmZlLCoK7mVN+osggUrc2PlLXHwigVPTqH6+aBnGyECigeupxoi79Fxz8X6GTHrlZ8PY//UlTqJ67QGo/TrRKCkFYeUuvoXVBpUY9yNJ/mWhiofLQccPLkVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stklcode.de; spf=pass smtp.mailfrom=stklcode.de; arc=none smtp.client-ip=193.26.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stklcode.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stklcode.de
Received: from stklpc.intra.404-net.de (2001-4dd0-4f5d-1101-0-0-0-4eb.ipv6dyn.netcologne.de [IPv6:2001:4dd0:4f5d:1101::4eb])
	by alpha.404-net.de (Postfix) with ESMTPSA id 9BAFD11FE8;
	Sun,  4 Feb 2024 16:07:38 +0100 (CET)
Authentication-Results: alpha.404-net.de;
	spf=pass (sender IP is 2001:4dd0:4f5d:1101::4eb) smtp.mailfrom=stefan@stklcode.de smtp.helo=stklpc.intra.404-net.de
Received-SPF: pass (alpha.404-net.de: connection is authenticated)
From: Stefan Kalscheuer <stefan@stklcode.de>
To: linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Christian Mauderer <oss@c-mauderer.de>,
	Stefan Kalscheuer <stefan@stklcode.de>
Subject: [PATCH] leds: spi-byte: use devm_led_classdev_register_ext()
Date: Sun,  4 Feb 2024 16:07:26 +0100
Message-ID: <20240204150726.29783-1-stefan@stklcode.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use extended classdev registration to generate generic device names from
color and function enums instead of reading only the label from the
device tree.

Signed-off-by: Stefan Kalscheuer <stefan@stklcode.de>
---
 drivers/leds/leds-spi-byte.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 9d91f21842f2..96296db5f410 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -83,7 +83,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	struct device_node *child;
 	struct device *dev = &spi->dev;
 	struct spi_byte_led *led;
-	const char *name = "leds-spi-byte::";
+	struct led_init_data init_data = {};
 	const char *state;
 	int ret;
 
@@ -97,12 +97,9 @@ static int spi_byte_probe(struct spi_device *spi)
 	if (!led)
 		return -ENOMEM;
 
-	of_property_read_string(child, "label", &name);
-	strscpy(led->name, name, sizeof(led->name));
 	led->spi = spi;
 	mutex_init(&led->mutex);
 	led->cdef = device_get_match_data(dev);
-	led->ldev.name = led->name;
 	led->ldev.brightness = LED_OFF;
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
@@ -120,7 +117,11 @@ static int spi_byte_probe(struct spi_device *spi)
 	spi_byte_brightness_set_blocking(&led->ldev,
 					 led->ldev.brightness);
 
-	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
+	init_data.fwnode = of_fwnode_handle(child);
+	init_data.devicename = "leds-spi-byte";
+	init_data.default_label = ":";
+
+	ret = devm_led_classdev_register_ext(&spi->dev, &led->ldev, &init_data);
 	if (ret) {
 		mutex_destroy(&led->mutex);
 		return ret;
-- 
2.43.0


