Return-Path: <linux-leds+bounces-4936-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D07AED8A9
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 11:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A0B176F51
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 09:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37CD23F27B;
	Mon, 30 Jun 2025 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ch+zVODM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188B238C0F;
	Mon, 30 Jun 2025 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275611; cv=none; b=Q2rPWqb26BXwc1mgmTATv3XrdmUm1C3TvFSFiQHS8kxwvEyctnTguvSq8GEOgpTguOXW9xVdw0S2FTWMuG4Nh1wRpAXaNW2twxFkiJqFQBncCLNDoXvG1xWwYREtuqxUI30EiwcOnBlUJAfwkI6jjS8yAPMKjzOt9nXUr+rVbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275611; c=relaxed/simple;
	bh=p4NXhIjhxZHxvgyjIy/IaWoxXZdxmFfxhNPKlwQ9DK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tpQckHa4IsDdnLhQRCmKRA7IAYtGrnAkfLhrwcq6yQe3JuljgYP6Ii6ZwFXKbMhMo7BW7D4FNptZek31m1Mx2jY5oMQzqidfwdQE/lRy9o1HNNsf33HXadvvqtHAlY5mTzQC38E0H4EY1OUYYdN0Vk4aY5IIvePwL7GLLh2ewM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ch+zVODM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275611; x=1782811611;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p4NXhIjhxZHxvgyjIy/IaWoxXZdxmFfxhNPKlwQ9DK4=;
  b=Ch+zVODMRyhCAbuSTmWyYaueX8xj0adMEyaEho7gc09YNgyzxBf8hm3z
   xMOljHR1jwneXqKTBMIX2sK7dXzD04IYp6ecFUQYLQNKNtbtyIYWmRr76
   DgK0/bFNd+WnB822V60SxGwafHiekqqHdehJC6xueWjWinjKtyPAHHUzp
   Xu4Vev2j/fb6/Tjz+GaERUuv94uXxy8IoqN/c6q4tZBmdIFIaKFzQsXny
   o8/nhUDlKPeCB9AEbCWH4E0P6qujnjd1yzSoFIJUKDN7KX7CEAGE81QPB
   hIsmNx+VSnQkEsPURewcY3/lDLqXQ7A9DEPh8AhooJ1LErbrKAaaI+gnv
   g==;
X-CSE-ConnectionGUID: aoHk67PlSP6thA2gPgbXuQ==
X-CSE-MsgGUID: 3LByo/+cSK+hMEOGQwsHtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53370717"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53370717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:26:50 -0700
X-CSE-ConnectionGUID: 4OT8PkOkRf2nnpi1n03GEw==
X-CSE-MsgGUID: EQd8Tq+7TimAdm1XUrLsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157795017"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2025 02:26:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9F4901FE; Mon, 30 Jun 2025 12:26:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] leds: Unexport of_led_get()
Date: Mon, 30 Jun 2025 12:26:39 +0300
Message-ID: <20250630092639.1574860-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no users outside the module.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-class.c | 3 +--
 include/linux/leds.h     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index eaeb433dcc3e..859056dd1dee 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -256,7 +256,7 @@ static const struct class leds_class = {
  * Returns the LED device parsed from the phandle specified in the "leds"
  * property of a device tree node or a negative error-code on failure.
  */
-struct led_classdev *of_led_get(struct device_node *np, int index)
+static struct led_classdev *of_led_get(struct device_node *np, int index)
 {
 	struct device *led_dev;
 	struct device_node *led_node;
@@ -270,7 +270,6 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 
 	return led_module_get(led_dev);
 }
-EXPORT_SYMBOL_GPL(of_led_get);
 
 /**
  * led_put() - release a LED device
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b3f0aa081064..b16b803cc1ac 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -294,7 +294,6 @@ void led_remove_lookup(struct led_lookup_data *led_lookup);
 struct led_classdev *__must_check led_get(struct device *dev, char *con_id);
 struct led_classdev *__must_check devm_led_get(struct device *dev, char *con_id);
 
-extern struct led_classdev *of_led_get(struct device_node *np, int index);
 extern void led_put(struct led_classdev *led_cdev);
 struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 						  int index);
-- 
2.47.2


