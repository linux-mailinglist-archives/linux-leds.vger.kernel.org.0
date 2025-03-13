Return-Path: <linux-leds+bounces-4246-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2DA5FB36
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 17:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE77217EBA8
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C8626869F;
	Thu, 13 Mar 2025 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB+Y5DJU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80232E3392;
	Thu, 13 Mar 2025 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741882596; cv=none; b=U040xsUt2cuY6s8RIDcms0DBIp+5hsqrv6DdOgRXj9UDqofEGoXypHU6q9M9hFyCT9KkkAGBGrImLpSflsWB+jOrwGi86Mnn0gulpwYQCzCrfiuv4cxeHFo+Ozm0cFtya9dLPnrz0tnj7VI5lssy48h4lM6rshMg5mgVAtZVQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741882596; c=relaxed/simple;
	bh=xlKITJEOHXk8Lgg/rg/tk6qkvUHIYLh+vawG8p0EoA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSDxg+Ct4t0MREr+f7SpG6+QjzmzZXNwE+UHl/0pYVdlyZFvLdM41kwz5FednL/+oUIb3wBnMJ94Xj2ns4Mws76W6i2e0QDRF2OvcvqKBJWsriBAIScwl2ShfIKM9C8JqCsSmIwB8cBedBznBwv4+CFxWzBDiAfX11AKwKEjOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB+Y5DJU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741882595; x=1773418595;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xlKITJEOHXk8Lgg/rg/tk6qkvUHIYLh+vawG8p0EoA4=;
  b=TB+Y5DJUPBwq74k+zwzEyIlf4o9tJNzAydxO8OxaYBs47AOl6jQJhxmK
   329vgLv/92ekKEwsNUp0WpqPBMTjcuiH3Qz+dfNyFG1SAGTESHqi+GlmS
   UlX+JMhwL6iIArrQu7tZ2jZe3DaTeLskye8Ar0yvnI9VT81/RnXrewTo6
   my5LN1o7rtVnaZjxqpneyX/huLkdHPFIvvlC89MwOWBjUnx9qNTNXxAVA
   AGZFl6wi9aAYhbQ+H8wSDbat8EmBakQrW/Syd+XcufznAllsvK6Aysudd
   IF5UH8y4XkO8D3N/VJ9aa8gp1GPyRrobalkja4EmCgdjXM+8uUc8YvdTF
   w==;
X-CSE-ConnectionGUID: HfsdmzkiR9+umcdFRFn/+g==
X-CSE-MsgGUID: Ix7HSifaTlKheOBDbpVz2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43189165"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="43189165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 09:16:34 -0700
X-CSE-ConnectionGUID: D4iZTYNJTbSM5DSHouVk0A==
X-CSE-MsgGUID: KPM7VXAiQhq2tQIuZdVKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121507868"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2025 09:16:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6F635156; Thu, 13 Mar 2025 18:16:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	George Stark <gnstark@salutedevices.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>
Subject: [PATCH v1 1/1] leds: nic78bx: tidy up ACPI ID table
Date: Thu, 13 Mar 2025 18:16:30 +0200
Message-ID: <20250313161630.415515-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tidy up ACPI ID table:

- drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h and
  other necessary headers

- remove explicit driver_data initializer

- drop comma in the terminator entry

With that done, extend compile test coverage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/Kconfig        |  3 ++-
 drivers/leds/leds-nic78bx.c | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 8f59a7a01371..9df66462260a 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -920,7 +920,8 @@ config LEDS_USER
 config LEDS_NIC78BX
 	tristate "LED support for NI PXI NIC78bx devices"
 	depends on LEDS_CLASS
-	depends on X86 && ACPI
+	depends on HAS_IOPORT
+	depends on X86 || COMPILE_TEST
 	help
 	  This option enables support for the User1 and User2 LEDs on NI
 	  PXI NIC78bx devices.
diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index 282d9e4cf116..f3161266b8ad 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -3,11 +3,19 @@
  * Copyright (C) 2016 National Instruments Corp.
  */
 
-#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/leds.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/types.h>
 
 #define NIC78BX_USER1_LED_MASK		0x3
 #define NIC78BX_USER1_GREEN_LED		BIT(0)
@@ -181,8 +189,8 @@ static int nic78bx_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id led_device_ids[] = {
-	{"NIC78B3", 0},
-	{"", 0},
+	{ "NIC78B3" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, led_device_ids);
 
@@ -190,7 +198,7 @@ static struct platform_driver led_driver = {
 	.probe = nic78bx_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.acpi_match_table = ACPI_PTR(led_device_ids),
+		.acpi_match_table = led_device_ids,
 	},
 };
 
-- 
2.47.2


