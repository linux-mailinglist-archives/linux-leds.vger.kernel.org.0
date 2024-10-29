Return-Path: <linux-leds+bounces-3198-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772E9B5442
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 21:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D02B2331D
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 20:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DDF20ADD2;
	Tue, 29 Oct 2024 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="SXeXWTtp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF320A5F1;
	Tue, 29 Oct 2024 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234527; cv=none; b=gGfbBsIu5g/tqfV0FkIKmZ7eSYwrwOeLGSYWdVY3gzM/y1Yqbs331vXtgrIww/BnST/eRbd15H4ADXXp6AOxSMyTHO7rQ2ZrJmyY0uuM+IIdnpK9C+3f1w5gNgoYKZACB44LG8bhhg6UbcKrXP7J6Y9aaaQvW4Vpfo9HcT7odpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234527; c=relaxed/simple;
	bh=IdHM0Hd7O9esdaYks5tdDsPVmvNzOfMjsNAJ0HkIMXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y6He0bGk1Ic4q/uApQEtNloOmPZ3wP+gOQlIHNZ4HnRfi3dmjrUp/cvK+KGYP5qgA5zxFahvpLMjKGAiQ4zupyYiDH/XQMUZBhoHrVS0VflTXJLyC7FlyAJl44qq0m1dwOiNY9TgvM2bkqs26LxMbgH5oZSq9P6CBYCJqyXyJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=SXeXWTtp; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fpc.intra.ispras.ru (unknown [10.10.165.10])
	by mail.ispras.ru (Postfix) with ESMTPSA id 7C50B40F1DD9;
	Tue, 29 Oct 2024 20:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 7C50B40F1DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1730234522;
	bh=ZocKsk5ybxu8Akr6Go2akWj3CW80/wDMMRt+5pvw7n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXeXWTtp+UIlXvb3zAbXw1fXH+DP5U3x4Q4mFqdL8c+XVLpydv80T/9Fbmab5WlGX
	 Ivyfthd+YX3hTuhTMB2ewZcbGQa7JCt0l6lUWjYouJVxz8qVMxCKFGhyoNmzIrC3oq
	 Yovn8sSnuAHLRCaXR8QJNgrOPv64lxq5fCkgBjcI=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Kalscheuer <stefan@stklcode.de>,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.6 1/2] leds: spi-byte: Use devm_led_classdev_register_ext()
Date: Tue, 29 Oct 2024 23:41:27 +0300
Message-Id: <20241029204128.527033-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029204128.527033-1-pchelkin@ispras.ru>
References: <20241029204128.527033-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Kalscheuer <stefan@stklcode.de>

commit ccc35ff2fd2911986b716a87fe65e03fac2312c9 upstream.

Use extended classdev registration to generate generic device names from
color and function enums instead of reading only the label from the
device tree.

Signed-off-by: Stefan Kalscheuer <stefan@stklcode.de>
Link: https://lore.kernel.org/r/20240204150726.29783-1-stefan@stklcode.de
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/leds/leds-spi-byte.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index afe9bff7c7c1..b04cf502e603 100644
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
 
@@ -96,12 +96,9 @@ static int spi_byte_probe(struct spi_device *spi)
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
@@ -121,7 +118,11 @@ static int spi_byte_probe(struct spi_device *spi)
 	spi_byte_brightness_set_blocking(&led->ldev,
 					 led->ldev.brightness);
 
-	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
+	init_data.fwnode = of_fwnode_handle(child);
+	init_data.devicename = "leds-spi-byte";
+	init_data.default_label = ":";
+
+	ret = devm_led_classdev_register_ext(&spi->dev, &led->ldev, &init_data);
 	if (ret) {
 		of_node_put(child);
 		mutex_destroy(&led->mutex);
-- 
2.39.5


