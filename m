Return-Path: <linux-leds+bounces-1850-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341B8FF3C2
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A651C283F80
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CB8199241;
	Thu,  6 Jun 2024 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVY8xs0Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6C1991DD;
	Thu,  6 Jun 2024 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695046; cv=none; b=dVW2J9k4EsO7fkSXKTTcCaA2r2OcgBKyrQRFo/yinupYraxUwvsnk5PIncjKZ9GKHt4CB56+Srs+GxzeJPZLnRCFwY38qA8vQNJhhencI25cM6T1FctscrQV1owXOZBF0Q6a2t9BN8jprRqaFfF11LiJxTdA93f5kNOKQnw4vn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695046; c=relaxed/simple;
	bh=BCX/043BK+EE/JmjauW+PrrtG3fUrZvHQpf4V8w3pOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8xR/KupkJS1/0seP4MPN0SUnfz0mbW2HTxTPlYBSAIrTEewitpx3MGkBS9vil45AMrZL+JhZyI0EW8V+uoS/4Ua04oR5wMED066W3LLroyMFsFEzrwbCkVN15u9Tc3syc6HMWR4PsVn/m7Ik8olXlWcaCeRoSjUW6aGiWQGh9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVY8xs0Q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695046; x=1749231046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCX/043BK+EE/JmjauW+PrrtG3fUrZvHQpf4V8w3pOE=;
  b=QVY8xs0QxUaCGHqHQ6AiTGEyIiLN7uyZVruq4pXGv0BK28zwTUL+OlQg
   jrAvorBegiltyyNCv3AEnT4LnHvGkk/xwxKQYHfJRz4DC5TKTHTT6M//G
   sC7SGmNrsHI0KjTL7ERhG63b9cIIknsW3n3QI17BYLNMt6lueiukbGP8O
   NrRuXtd/DgJLCzUXxYDZl8pgooR26tm2Qcg0LOz7N0DiKizfZom6z5PAt
   vAOWllC4eGRSrMXw2t2+SGiEdenxgTPjMcoVfWfNnC95ciZ+8DBlCBUNJ
   LbioscPEzxVt4TsMsRlzyrPmdGDm5jtLo+6MDFkoAiXTjP3YrBf2xZLAZ
   g==;
X-CSE-ConnectionGUID: kAjadE15RBu8kCtTZMZz6g==
X-CSE-MsgGUID: L4W6HkA/SKOFQ1QBby4VyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="24956031"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="24956031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:45 -0700
X-CSE-ConnectionGUID: 4Ofs/nIeQA+HlYCfLlyj9w==
X-CSE-MsgGUID: QQxd/5k1RCqXBekkrwasjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38490680"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 10:30:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A6920371; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 5/6] leds: spi-byte: Use devm_mutex_init() for mutex initialization
Date: Thu,  6 Jun 2024 20:29:22 +0300
Message-ID: <20240606173037.3091598-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240606173037.3091598-1-andriy.shevchenko@linux.intel.com>
References: <20240606173037.3091598-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this driver LEDs are registered using devm_led_classdev_register()
so they are automatically unregistered after module's remove() is done.
led_classdev_unregister() calls module's led_set_brightness() to turn off
the LEDs and that callback uses mutex which was destroyed already
in module's remove() so use devm API instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-spi-byte.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index e63958e584c2..985bbbed251b 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -31,9 +31,9 @@
 #include <linux/leds.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/spi/spi.h>
-#include <linux/mutex.h>
 #include <uapi/linux/uleds.h>
 
 struct spi_byte_chipdef {
@@ -97,8 +97,11 @@ static int spi_byte_probe(struct spi_device *spi)
 	if (!led)
 		return -ENOMEM;
 
+	ret = devm_mutex_init(dev, &led->mutex);
+	if (ret)
+		return ret;
+
 	led->spi = spi;
-	mutex_init(&led->mutex);
 	led->cdef = device_get_match_data(dev);
 	led->ldev.brightness = LED_OFF;
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
@@ -116,33 +119,16 @@ static int spi_byte_probe(struct spi_device *spi)
 	init_data.devicename = "leds-spi-byte";
 	init_data.default_label = ":";
 
-	ret = devm_led_classdev_register_ext(dev, &led->ldev, &init_data);
-	if (ret) {
-		mutex_destroy(&led->mutex);
-		return ret;
-	}
-
-	spi_set_drvdata(spi, led);
-
-	return 0;
-}
-
-static void spi_byte_remove(struct spi_device *spi)
-{
-	struct spi_byte_led	*led = spi_get_drvdata(spi);
-
-	mutex_destroy(&led->mutex);
+	return devm_led_classdev_register_ext(dev, &led->ldev, &init_data);
 }
 
 static struct spi_driver spi_byte_driver = {
 	.probe		= spi_byte_probe,
-	.remove		= spi_byte_remove,
 	.driver = {
 		.name		= KBUILD_MODNAME,
 		.of_match_table	= spi_byte_dt_ids,
 	},
 };
-
 module_spi_driver(spi_byte_driver);
 
 MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
-- 
2.43.0.rc1.1336.g36b5255a03ac


