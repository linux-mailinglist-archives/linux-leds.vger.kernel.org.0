Return-Path: <linux-leds+bounces-417-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB2813A2B
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 19:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E8931C209B1
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A67D208BD;
	Thu, 14 Dec 2023 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8VMBTW6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA9912B;
	Thu, 14 Dec 2023 10:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702579282; x=1734115282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ejqGTJqRJV94y5/KtwKcYw2iSBE0q2SaQ5pb83PDPgA=;
  b=c8VMBTW6kAcPZcH66f2rP+cogRfWLGxZtPDNkDM1TFpKWwLfNVNiduF5
   xIhH3XR8VIPjA5qwJlUfrmoLllHLtQE1/JItWfmj4bpue8K+UMFdQZPwk
   IRVAowZjK1oE4O7LMI3/8LTPRE8j+sCIbBGER9ZyUevF5YAp7P9bxsYM2
   hlcmGd9n2C8YI7QnqQoboD621GsUq9xJnhk25z73SQiLmaWI8NHX7MId0
   6gn/sa3mmNN0rYYoN0MsjbgsDPEkKPr4ejyI/kyKIixr/+57I7oxK6xeO
   Rib2NrnNe6FYzakhFSxFWoq5o3OjHj5/b3rGwz3NMr55pbqNYNQHxKTAz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461631064"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="461631064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803395261"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="803395261"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 14 Dec 2023 10:40:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4511D46D; Thu, 14 Dec 2023 20:40:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 4/4] leds: max5970: Add missing headers
Date: Thu, 14 Dec 2023 20:40:11 +0200
Message-ID: <20231214184050.1272848-5-andriy.shevchenko@linux.intel.com>
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

Don't inherit headers "by chance" from others.
Include the needed ones explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-max5970.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index 60db3c28d7d9..56a584311581 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -7,9 +7,13 @@
  * Author: Patrick Rudolph <patrick.rudolph@9elements.com>
  */
 
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
 #include <linux/leds.h>
 #include <linux/mfd/max5970.h>
 #include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
-- 
2.43.0.rc1.1.gbec44491f096


