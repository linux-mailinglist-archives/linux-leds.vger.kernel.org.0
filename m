Return-Path: <linux-leds+bounces-3853-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1FA2203B
	for <lists+linux-leds@lfdr.de>; Wed, 29 Jan 2025 16:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0576167870
	for <lists+linux-leds@lfdr.de>; Wed, 29 Jan 2025 15:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB361D90A5;
	Wed, 29 Jan 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoyGGyd1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5F1DA0E0;
	Wed, 29 Jan 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738164425; cv=none; b=h+gKOd2KHBSa4qjxO8XpATP+PEhbFcrGUYeJCB1fumax15dx3YFI7I9oe2PEvHcJV2Utc1CekCoHhk6TJl/ksH+RsdPNbAappaJ5i8nF+/n1XhMh0hrXGFufADn2JAVvSJ/aw4C79NHWjw3DfzpxvYP59W/69TT463yui9HMmyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738164425; c=relaxed/simple;
	bh=A4VIOunhQziyHZMYZiNn8/8DJn+KFVNGq/lxgg79L10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7u1YoMKgWwM8ydqD1bkN5b37cc8hrYNa0zu/V7PyPei5YzuRM3B+/wj0dcNHevht8J/CXjV3iCwnR4CV2Yp+8jVYRRE0e/XmoClf0FLoCIyan5J/JLgytXZmBbjMIDyseqvwQhxBxU33fBf3s+WGxJ+5GC/cEs7HzNcsA1awX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoyGGyd1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738164424; x=1769700424;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A4VIOunhQziyHZMYZiNn8/8DJn+KFVNGq/lxgg79L10=;
  b=AoyGGyd1HE1Uc/CE63PNQsCLIhl8aU5ibfIIVtOslcwUi+c3DzVLEhX0
   5f4so3ARVqn37gcnJyajzPghs0RIiCdZhtEzFczxIiWJr3MyrQP3L1g31
   7Ni0bKd6XQBvnrl12eXtkl43OtLnAKjErL1CVFUPCT1KuEkpzq+np6LCZ
   2FG5pvgr5c7wd69Qr30iKMzaBiZUq4U24FnGROoXNDEtZiUrFFb5CaTe3
   EmMjRfM1F1ilvU4VnEKXI2xcNRUlPk5RvlHRspFaB/Bv4gPiYslLP0whO
   3nLeXJC51bZmUemPTCZDbcl/7COepkAebRkbyP84WXYQOPVIfi48txE71
   A==;
X-CSE-ConnectionGUID: v6YK5FPRTF+CkxuZBkNCbQ==
X-CSE-MsgGUID: vsJettnLQCudPXc9TZGVpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37927755"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="37927755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 07:27:03 -0800
X-CSE-ConnectionGUID: NgCyPDbjT7e0ASVozGDEiQ==
X-CSE-MsgGUID: IXE3lsPdSCaV4+WV7z9R7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="109037807"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 07:27:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 91689296E; Wed, 29 Jan 2025 17:27:00 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] leds: lp8860: Drop unneeded assignment for cache_type
Date: Wed, 29 Jan 2025 17:26:59 +0200
Message-ID: <20250129152659.1801420-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

REGCACHE_NONE is the default type of the cache when not provided.
Drop unneeded explicit assignment to it.

Note, it's defined to 0, and if ever be redefined, it will break
literally a lot of the drivers, so it very unlikely to happen.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp8860.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 06196d851ade..995f2adf8569 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -331,7 +331,6 @@ static const struct regmap_config lp8860_regmap_config = {
 	.max_register = LP8860_EEPROM_UNLOCK,
 	.reg_defaults = lp8860_reg_defs,
 	.num_reg_defaults = ARRAY_SIZE(lp8860_reg_defs),
-	.cache_type = REGCACHE_NONE,
 };
 
 static const struct reg_default lp8860_eeprom_defs[] = {
@@ -369,7 +368,6 @@ static const struct regmap_config lp8860_eeprom_regmap_config = {
 	.max_register = LP8860_EEPROM_REG_24,
 	.reg_defaults = lp8860_eeprom_defs,
 	.num_reg_defaults = ARRAY_SIZE(lp8860_eeprom_defs),
-	.cache_type = REGCACHE_NONE,
 };
 
 static int lp8860_probe(struct i2c_client *client)
-- 
2.43.0.rc1.1336.g36b5255a03ac


