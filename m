Return-Path: <linux-leds+bounces-1849-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD128FF3C0
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71BF71F2753E
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A9B199232;
	Thu,  6 Jun 2024 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSjJLI1B"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8A81991D9;
	Thu,  6 Jun 2024 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695046; cv=none; b=j5KSIonjANi84yVuO3vRhdgOJY06YHpCzZMS8onw5wZELCBav0w7Uz0uJT4M115N2CgWn5g6PRFb5JG6edK9oJET21xsmlns/0M7+CTpO7EGTbilAJ7+v+J/pVo5tvJLSO0F78EhXSevs7s/Ls4an2jVnhkW7zwRdI1nKO3ovXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695046; c=relaxed/simple;
	bh=5YQCa8UVebd8nCd5+11hDHGlbqk8BQoGJTU401XyJxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBn1vlIH9PnorWO4BhniM9m4egnP5zw1xD46r3bpJZjybpHHukdLIf1mkwsLbP4cxenZd5M+qj1CY4K3uamFG3sdPWfkfaFi6vFDqRO45QlsHIRA4Slg7OkWjopuk7E8NUGL9zjCbr2svPfuzajMJoh586+6oa83rYfrJkyyloo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSjJLI1B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695044; x=1749231044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5YQCa8UVebd8nCd5+11hDHGlbqk8BQoGJTU401XyJxw=;
  b=FSjJLI1B0qDTAyaINsurGB9jH5ebSnuOUWkB1yyVzaGdUaZzYObrqx4S
   a7w2x4QpLWqqrOMQd+Ym5W/J7qXwsQAJ/W0BKc/iF9gu4wsxLo1tjtLzk
   j1zLhngpRT9FO6oAfcjmh/VtX8AgDSMs6KN68paNGuFsUjTkDzw9s0aRs
   rbGOCFfscsXQwpxbqQ11yec8/wNGuLAzgNXOy2fIPJtkGDZnoNIlcfuUD
   JI2nnJFXbcjvb8YSQSiC0qiFEohZv3vMF+H28swHfmjP1FDnYas4PUmQh
   u4aauuPdcC16cfkRx5Y5ekr3j+kFNAzF0SGbaYvTy8LkkyBOwXVENkzDI
   g==;
X-CSE-ConnectionGUID: /VM9+RPXRQGky+F2kWzWaA==
X-CSE-MsgGUID: 6qGyQckDSS+p996Xo4oLpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14191999"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14191999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:42 -0700
X-CSE-ConnectionGUID: +/WMy0gpS+204HBPvSapuA==
X-CSE-MsgGUID: h74mzfkjSOqbenqFhNfL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38164432"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 10:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 67E7AF7; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/6] leds: spi-byte: call of_node_put() on error path
Date: Thu,  6 Jun 2024 20:29:18 +0300
Message-ID: <20240606173037.3091598-2-andriy.shevchenko@linux.intel.com>
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

Add a missing call to of_node_put(np) on error.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-spi-byte.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 96296db5f410..b04cf502e603 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -91,7 +91,6 @@ static int spi_byte_probe(struct spi_device *spi)
 		dev_err(dev, "Device must have exactly one LED sub-node.");
 		return -EINVAL;
 	}
-	child = of_get_next_available_child(dev_of_node(dev), NULL);
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -104,11 +103,13 @@ static int spi_byte_probe(struct spi_device *spi)
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
 
+	child = of_get_next_available_child(dev_of_node(dev), NULL);
 	state = of_get_property(child, "default-state", NULL);
 	if (state) {
 		if (!strcmp(state, "on")) {
 			led->ldev.brightness = led->ldev.max_brightness;
 		} else if (strcmp(state, "off")) {
+			of_node_put(child);
 			/* all other cases except "off" */
 			dev_err(dev, "default-state can only be 'on' or 'off'");
 			return -EINVAL;
@@ -123,9 +124,12 @@ static int spi_byte_probe(struct spi_device *spi)
 
 	ret = devm_led_classdev_register_ext(&spi->dev, &led->ldev, &init_data);
 	if (ret) {
+		of_node_put(child);
 		mutex_destroy(&led->mutex);
 		return ret;
 	}
+
+	of_node_put(child);
 	spi_set_drvdata(spi, led);
 
 	return 0;
-- 
2.43.0.rc1.1336.g36b5255a03ac


