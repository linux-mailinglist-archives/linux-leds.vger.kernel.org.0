Return-Path: <linux-leds+bounces-416-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9565813A2A
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 19:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5051F2139E
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DB267E98;
	Thu, 14 Dec 2023 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnhH0gOR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE20D10F;
	Thu, 14 Dec 2023 10:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702579281; x=1734115281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=spWRbrUoo3GHPvJawqTt5vlWN5LSpxWaXUCc4b6zvNY=;
  b=PnhH0gORm5FI1q/3PBOYd32mecI8eniLr8pY4AcSk/VWDVwYcZQAUY7e
   p6P/2ufKNHXggs5cnM3BR2Hyk0fpuXGmi0dAj7vKYN5F1xXKlPHzY5Uis
   mzFW96f1Fh8Imh1ilLtVFpLUCQUh7J97HLu9Gb6Z5GM2A787/YcC4ydRU
   F5W8G0Egq2QQ1W46bsVD/4czyB8UPcfMVvFUezuYUa/1lfTGqnaJtEAjI
   GpJC6FDtubAPr8c7WI2gz9/CZK6TVuRc+jd/UJPOfHqjvNBWtCywq9Ynm
   LuVi6GGVJCjNNH+b1WFlw0sm+aKo3ukErR5TRmcAWBphp+7hrBUhlWdtf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461631068"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="461631068"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803395262"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="803395262"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2023 10:40:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3196E44F; Thu, 14 Dec 2023 20:40:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 3/4] leds: max5970: Make use of dev_err_probe()
Date: Thu, 14 Dec 2023 20:40:10 +0200
Message-ID: <20231214184050.1272848-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231214184050.1272848-1-andriy.shevchenko@linux.intel.com>
References: <20231214184050.1272848-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the error handling in probe function by switching from
dev_err() to dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-max5970.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index de57b385b4f6..60db3c28d7d9 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -62,7 +62,7 @@ static int max5970_led_probe(struct platform_device *pdev)
 			continue;
 
 		if (reg >= MAX5970_NUM_LEDS) {
-			dev_err(dev, "invalid LED (%u >= %d)\n", reg, MAX5970_NUM_LEDS);
+			dev_err_probe(dev, -EINVAL, "invalid LED (%u >= %d)\n", reg, MAX5970_NUM_LEDS);
 			continue;
 		}
 
@@ -86,8 +86,7 @@ static int max5970_led_probe(struct platform_device *pdev)
 		ret = devm_led_classdev_register(dev, &ddata->cdev);
 		if (ret < 0) {
 			fwnode_handle_put(child);
-			dev_err(dev, "Failed to initialize LED %u\n", reg);
-			return ret;
+			return dev_err_probe(dev, ret, "Failed to initialize LED %u\n", reg);
 		}
 	}
 
-- 
2.43.0.rc1.1.gbec44491f096


