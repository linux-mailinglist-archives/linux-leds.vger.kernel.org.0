Return-Path: <linux-leds+bounces-1853-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D600D8FF3C7
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747861F27F1A
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54841993A2;
	Thu,  6 Jun 2024 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2hEA5wh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE819922A;
	Thu,  6 Jun 2024 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695047; cv=none; b=VOlXvDAKjwZYsjUU/CJ24gPSnMFUijNVczLgqnTWxW6XHBMfULWBfqeWnj6Q0cMiNozQXNHNlgSFQCuVfMgVdcB+AKPLFSDtb+46wlMFr3KHYuUvsRdXF9XzO8fCukytN9HK+kCxIKx7KuGq1XAvZgHtJr/BOhKSQmgS7tLJA3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695047; c=relaxed/simple;
	bh=QBmoVRhUJZlP7PTuWcuGpKu7NTGstVCtnVRAN1E5hLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8XUQwIH7GGC4i6fHZPXwqfLM9VoPACjVBwyLiMZFlibJQM7UP+HxcW3KqkR/YoXocXtwaFaCsS1gNXMrbOicgf3ZKyFzULxSVuBhD0cfk923CJJGXmTLKEFeUQSjgBkJcas+YVDcrbmORObhlGRCiJRvXNnspQu9wiAsO1JQn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2hEA5wh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695046; x=1749231046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QBmoVRhUJZlP7PTuWcuGpKu7NTGstVCtnVRAN1E5hLQ=;
  b=Q2hEA5whgM8Wpp2zRDQFSFqBT1XNumVY6iPODNXQxaYw7hginnScI/JG
   FNV6OZfYzm8GDOVN9xOXmKBBrowq3yENC/inSos1N9Bq8c9CYcke6B9To
   /S1rzx/1dKGzj58ZVGV4hIcoh0+uejssqrzINcgGnTRL1x6L6Xo9Ab4ld
   VhqetqN9nP7erhBAXHAaFu/FQ75Vbxijn3+qlpwf649fBFIY/q34Em0vm
   QVdHdMmjOHhUCny+9I6i8D47s9YVyee/O10EMCwM2YSh0RJgWa3w7pC3l
   7aNnXW586uKAndxbH2JcLXjQiEnIcHxbhmoFSNJvtF3Xu6EeGtA7Z22Bb
   Q==;
X-CSE-ConnectionGUID: dDGHkDrJQTy/11upQFvmJg==
X-CSE-MsgGUID: ZqaKf1gfSUae0nAId7grcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14192013"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14192013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:42 -0700
X-CSE-ConnectionGUID: JD70v06MTVG8J74bIvUcIA==
X-CSE-MsgGUID: jmfgeVq2T/6APnArntHyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38164435"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 10:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8EE362CF; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 4/6] leds: spi-byte: Utilise temporary variable for struct device
Date: Thu,  6 Jun 2024 20:29:21 +0300
Message-ID: <20240606173037.3091598-5-andriy.shevchenko@linux.intel.com>
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

We have a temporary variable to keep a pointer to struct device.
Utilise it where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-spi-byte.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 1fc0a8cc123e..e63958e584c2 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -116,7 +116,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	init_data.devicename = "leds-spi-byte";
 	init_data.default_label = ":";
 
-	ret = devm_led_classdev_register_ext(&spi->dev, &led->ldev, &init_data);
+	ret = devm_led_classdev_register_ext(dev, &led->ldev, &init_data);
 	if (ret) {
 		mutex_destroy(&led->mutex);
 		return ret;
-- 
2.43.0.rc1.1336.g36b5255a03ac


