Return-Path: <linux-leds+bounces-1847-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB558FF3BD
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BBCD1F24801
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0FB198E77;
	Thu,  6 Jun 2024 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSSpF0Jz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93189197A6A;
	Thu,  6 Jun 2024 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695044; cv=none; b=l4Y2s8yfwbBtz6W4MD/ZhuxjwcJLwOZ0PR16vodc4Pajwa9G5qP++dtEZlQ3HLKMkzO4BOaZNBfYzUZWLxx2mI/dKZTUDpVL5tGn4LiIH0BMHaUDZUMeUawUpGssMn/SiVKnuz01ljX859t909xKFZ+cEQNZXVo7yRWuFm0Phag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695044; c=relaxed/simple;
	bh=nWxfJAb/+1mkNjtmtDnUm6qW8y1b8t5E/REvy73XYYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1nHYHupQp16F2YXkWodIFyzHEvE3GzvLfIt82XAW0EJ9f471plVX+kVoCaIUzES4CtAuC/KA2cgCiMkf9k8RY5dg9NUHliF/qUBSSmySYVhIABJGdGPKMRTc/r4d+7qXbdXBZeBFd8/2OWldFd+ExrK7mjXAmalainLrWOjH4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSSpF0Jz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695042; x=1749231042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nWxfJAb/+1mkNjtmtDnUm6qW8y1b8t5E/REvy73XYYc=;
  b=bSSpF0JzkjxVJ6pm9FJHoaqt1KLjIR0aYecX+9944KYZ+RCRB9GCDT+G
   dzx7SDywK2pd5gFvi7U94J85NobZtsb7PuLI4GSLPFMGxsGqwBdZHvthv
   SQSCSSzIaWWp/3OMWqQa2tIAJem5uHKL09V+dY9z6xGdxyOPnGbqwD1Ly
   IWKDMlCtzhjEjXp1uOLDF5aV5l25sREFwUvAoe1zwdJiEKAQzzBrgaTbv
   SFMHxbJpM/8pNgr1fxy/Nw7FwvD79gVCkOXihKsJvzULhHUIP1uKNhy8H
   YwSB2ymQu78SMwOXHZslgsSbtGc8k6hebjkcchxjY1USjOu6EjdxZ0Teq
   g==;
X-CSE-ConnectionGUID: /CmCJF1rQL61kiEM+4muxg==
X-CSE-MsgGUID: STPl9IlPQr+bfKXokNMzoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14192002"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14192002"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:42 -0700
X-CSE-ConnectionGUID: pILV47EHS2W8SLgATK2rAw==
X-CSE-MsgGUID: R6CM1whQTyu3hqaw4eV0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38164433"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 10:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 89A6930B; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 3/6] leds: spi-byte: Make use of device properties
Date: Thu,  6 Jun 2024 20:29:20 +0300
Message-ID: <20240606173037.3091598-4-andriy.shevchenko@linux.intel.com>
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

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Add mod_devicetable.h include.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/Kconfig         |  1 -
 drivers/leds/leds-spi-byte.c | 15 +++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7211f0a4f88f..2e1925d2068c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -865,7 +865,6 @@ config LEDS_SPI_BYTE
 	tristate "LED support for SPI LED controller with a single byte"
 	depends on LEDS_CLASS
 	depends on SPI
-	depends on OF
 	help
 	  This option enables support for LED controller which use a single byte
 	  for controlling the brightness. Currently the following controller is
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 76733946c99a..1fc0a8cc123e 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -29,8 +29,9 @@
  */
 
 #include <linux/leds.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <linux/mutex.h>
 #include <uapi/linux/uleds.h>
@@ -80,14 +81,14 @@ static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
 
 static int spi_byte_probe(struct spi_device *spi)
 {
-	struct device_node *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	struct device *dev = &spi->dev;
 	struct spi_byte_led *led;
 	struct led_init_data init_data = {};
 	enum led_default_state state;
 	int ret;
 
-	if (of_get_available_child_count(dev_of_node(dev)) != 1) {
+	if (device_get_child_node_count(dev) != 1) {
 		dev_err(dev, "Device must have exactly one LED sub-node.");
 		return -EINVAL;
 	}
@@ -103,26 +104,24 @@ static int spi_byte_probe(struct spi_device *spi)
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
 
-	child = of_get_next_available_child(dev_of_node(dev), NULL);
+	child = device_get_next_child_node(dev, NULL);
 
-	state = led_init_default_state_get(of_fwnode_handle(child));
+	state = led_init_default_state_get(child);
 	if (state == LEDS_DEFSTATE_ON)
 		led->ldev.brightness = led->ldev.max_brightness;
 	spi_byte_brightness_set_blocking(&led->ldev,
 					 led->ldev.brightness);
 
-	init_data.fwnode = of_fwnode_handle(child);
+	init_data.fwnode = child;
 	init_data.devicename = "leds-spi-byte";
 	init_data.default_label = ":";
 
 	ret = devm_led_classdev_register_ext(&spi->dev, &led->ldev, &init_data);
 	if (ret) {
-		of_node_put(child);
 		mutex_destroy(&led->mutex);
 		return ret;
 	}
 
-	of_node_put(child);
 	spi_set_drvdata(spi, led);
 
 	return 0;
-- 
2.43.0.rc1.1336.g36b5255a03ac


