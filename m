Return-Path: <linux-leds+bounces-413-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1413813A28
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 19:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C1F8B21413
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C01568299;
	Thu, 14 Dec 2023 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDOuX50S"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134CC10E;
	Thu, 14 Dec 2023 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702579259; x=1734115259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G18B/IrnfrebrjvuaMIQ0eCCWtBtYWxi9zew/6c/ODs=;
  b=HDOuX50Skft9RqXi5wDVrpxjOrP5dcz7dBbaATjyPOQrx5TYBGsc+SU6
   s+nGb+zXW5yU0cq6O/RutLpa45MDzVGhJ+ni5Ap3H1y1LURHgER4/tjtJ
   uL4Pi/o1dUdAkk8v17Rub4keqJ5fUBcWwXnsGJpyKBD7sOi6Szmy0GTF9
   Q+jv2M8+C+++ua34jNpBaP0cfSiQryPs/8ogeZV5LDgyYwrasAHuNUiyh
   6xzSoD17Ag85JBj1V9wC464RXTk8nQK8sDQGfhzJI91P/MpneUNte/u9V
   Hc98qwTzm+tyZW+9IIf45aOtM+3uf5X9eH4Zm0pf4rxQu999fpQ73MScL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385582264"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="385582264"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840374564"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="840374564"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 10:40:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1BF5B13A; Thu, 14 Dec 2023 20:40:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 1/4] leds: max5970: Remove unused variable
Date: Thu, 14 Dec 2023 20:40:08 +0200
Message-ID: <20231214184050.1272848-2-andriy.shevchenko@linux.intel.com>
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

leds-max5970.c:50:21: warning: variable 'num_leds' set but not used [-Wunused-but-set-variable]

Remove unused variable.

Fixes: 736214b4b02a ("leds: max5970: Add support for max5970")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-max5970.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index 456a16a47450..7959d079ae94 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -45,7 +45,7 @@ static int max5970_led_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct device_node *led_node, *child;
 	struct max5970_led *ddata;
-	int ret = -ENODEV, num_leds = 0;
+	int ret = -ENODEV;
 
 	regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!regmap)
@@ -89,7 +89,6 @@ static int max5970_led_probe(struct platform_device *pdev)
 			dev_err(dev, "Failed to initialize LED %u\n", reg);
 			return ret;
 		}
-		num_leds++;
 	}
 
 	return ret;
-- 
2.43.0.rc1.1.gbec44491f096


