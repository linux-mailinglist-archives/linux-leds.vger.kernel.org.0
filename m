Return-Path: <linux-leds+bounces-1851-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C98FF3C5
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B985284131
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ABE19938D;
	Thu,  6 Jun 2024 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aasd1Bzs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556419922F;
	Thu,  6 Jun 2024 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695047; cv=none; b=PCoGV+RHhEmD3Kp0NF6795OlOHTxiCg6sYEXC1VbKO8e3NZ/erBUmU10gMnW/y5asQFJ2PrzJoLMGv4yki6LfnevQKaPe9Hp3qDYtdJj4v900Qq77sPVaAf286zgMSFLqrhI0fkOCjqexIQmcwy6TLuV+DH26F46yuZ7+oEXDL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695047; c=relaxed/simple;
	bh=+T0sENgNAG9M5FwnYrWEQdFRsy0FTQjbFITtNZYR/ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rz5FoCWVcLl1acLpPVa+kYO3WGX1kHH3x8RAYm/8gmaSeYMMRgM5HbpLYfTx0h4cmJuOrQBOdHYrXpoBWfifx4+tCduj9F+9cwXzFgFlI5Z0G5/yHvCb3REyiVtqanQgbC+Vmdw/agxqgG+WO+mTpPp/ZAmFtgaqJWWGNpO4StM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aasd1Bzs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695046; x=1749231046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+T0sENgNAG9M5FwnYrWEQdFRsy0FTQjbFITtNZYR/ds=;
  b=Aasd1Bzs8tTN98XAksxXhpO+aO1z3TUE5b1Vlz/jjylJNKQpvBtntNeG
   fW3DKo6rGMDF37y1cPwseszbRC+puWKUkGJ06oYqHxmwKyICezebzlrRK
   jykDVeS+nZ6GU5e+lUc+WLWkKOjctYax9JlbV7yVfIvSf8pONfQ3PN1U0
   7lkDTJO2WVfA+H4ZgvHyG8g9y8NXdz7B5hPG4RGocHjUkjtw1faDwsul+
   fhWcFy0yH6LfW9CP2g7W0Y0WRAcGDQn6leuXgMxhORmOFaJEDvIgcY758
   qhQyWNKvUCgV/3jWEcEFIEsl04tRnalMwNraHKEvs4k7a1Ac2+w72m2Ee
   A==;
X-CSE-ConnectionGUID: 9+gfrYFDRA6kN6S5YOSPsw==
X-CSE-MsgGUID: mp3mJHFtTN+E5ZWp4HyLWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14192008"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14192008"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:42 -0700
X-CSE-ConnectionGUID: saaOhPoHRbas2EatagOU0g==
X-CSE-MsgGUID: iirFD67tTFm08JDcJmnQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38164434"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 10:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 71CD12A4; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 2/6] leds: spi-byte: Get rid of custom led_init_default_state_get()
Date: Thu,  6 Jun 2024 20:29:19 +0300
Message-ID: <20240606173037.3091598-3-andriy.shevchenko@linux.intel.com>
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

LED core provides a helper to parse default state from firmware node.
Use it instead of custom implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-spi-byte.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index b04cf502e603..76733946c99a 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -84,7 +84,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct spi_byte_led *led;
 	struct led_init_data init_data = {};
-	const char *state;
+	enum led_default_state state;
 	int ret;
 
 	if (of_get_available_child_count(dev_of_node(dev)) != 1) {
@@ -104,17 +104,10 @@ static int spi_byte_probe(struct spi_device *spi)
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
 
 	child = of_get_next_available_child(dev_of_node(dev), NULL);
-	state = of_get_property(child, "default-state", NULL);
-	if (state) {
-		if (!strcmp(state, "on")) {
-			led->ldev.brightness = led->ldev.max_brightness;
-		} else if (strcmp(state, "off")) {
-			of_node_put(child);
-			/* all other cases except "off" */
-			dev_err(dev, "default-state can only be 'on' or 'off'");
-			return -EINVAL;
-		}
-	}
+
+	state = led_init_default_state_get(of_fwnode_handle(child));
+	if (state == LEDS_DEFSTATE_ON)
+		led->ldev.brightness = led->ldev.max_brightness;
 	spi_byte_brightness_set_blocking(&led->ldev,
 					 led->ldev.brightness);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


