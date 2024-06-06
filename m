Return-Path: <linux-leds+bounces-1852-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2B8FF3C6
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 19:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A591F27FF0
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2024 17:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA025199393;
	Thu,  6 Jun 2024 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qk2Fi7js"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B234199234;
	Thu,  6 Jun 2024 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695047; cv=none; b=hyOx3ruYQHOuzIxketbIoB07FRQQnB6RhBBP1D5NsZi6odtmVXyn2gmce8ndE0vSxnoShHsfFzvdP12ticATyJyhN7QEuMMInj9PyhH1kS3jgUkRKhbyiqdiIHdfLB4HKScz3gtwOhjygCwCzqJ6liASAL0876ohix3T6uB4Nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695047; c=relaxed/simple;
	bh=SMIWLQZ2FupVBlM31XPw4RYjoVZTvalI7UR2L9gYyHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+rDFhU5u7HdKNfxI/rV/F/FXcPD7eFhiVQzde8NbVRPfHzlxnLO/Nggkmg56tenBj6vyyOfh2HAIaz90MwWivJvt3d3o54/cPP5pRlFQMkk/h6FC5FEM8ARY2mWQIWeSM0+I+0Q9Qc/Z/QLQ5OR5ZLEnih2Ein1i/hUcXS7BY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qk2Fi7js; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695046; x=1749231046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SMIWLQZ2FupVBlM31XPw4RYjoVZTvalI7UR2L9gYyHQ=;
  b=Qk2Fi7jsAL/9nPlhRxH4ZbcxNZoiKjs7URBIKHJ7hiTuibefieBKbU6i
   dK707S1swMLHSvzj4cQjv1g4ZSGyYUOReS5+tgrr63D20rAcTS/1f4f5g
   6U4/i7IDaAM5/f6/adcFxkwsn87R/OW7KVsaZX6aYGv/G9YQEHncJPKlu
   INihz+hUefqWVYuD/DD2ccbWZfgE7ux5GrW3LF0cZHyKT22dXgmOWvhj2
   cAQ7ocOWCfPnjTfoP5ZJxV6/RzDdpxcMkhsYn+K+iEDDesrFYnXaVY/RB
   97VjOJH+X78OcKfjRFSOHI7cLO0YDQnJ6Y9zx/XzmxHGFtIBF9yU9ks1O
   g==;
X-CSE-ConnectionGUID: aPm333LZSUCOxTpjKLUxbg==
X-CSE-MsgGUID: /3m8v5tDT++6etYWIzV0RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14192017"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14192017"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:30:44 -0700
X-CSE-ConnectionGUID: iCYEa+upQaOoKpBzwNf6cQ==
X-CSE-MsgGUID: bdLa/RDYQ9+S4deA6N+Z7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38164438"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2024 10:30:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ABC9E339; Thu, 06 Jun 2024 20:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 6/6] leds: spi-byte: Move OF ID table closer to their user
Date: Thu,  6 Jun 2024 20:29:23 +0300
Message-ID: <20240606173037.3091598-7-andriy.shevchenko@linux.intel.com>
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

There is no code that uses ID table directly, except the
struct device_driver at the end of the file. Hence, move
table closer to its user. It's always possible to access
them via a pointer.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-spi-byte.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 985bbbed251b..d24d0ddf347c 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -56,13 +56,6 @@ static const struct spi_byte_chipdef ubnt_acb_spi_led_cdef = {
 	.max_value = 0x3F,
 };
 
-static const struct of_device_id spi_byte_dt_ids[] = {
-	{ .compatible = "ubnt,acb-spi-led", .data = &ubnt_acb_spi_led_cdef },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
-
 static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
 					    enum led_brightness brightness)
 {
@@ -122,6 +115,12 @@ static int spi_byte_probe(struct spi_device *spi)
 	return devm_led_classdev_register_ext(dev, &led->ldev, &init_data);
 }
 
+static const struct of_device_id spi_byte_dt_ids[] = {
+	{ .compatible = "ubnt,acb-spi-led", .data = &ubnt_acb_spi_led_cdef },
+	{}
+};
+MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
+
 static struct spi_driver spi_byte_driver = {
 	.probe		= spi_byte_probe,
 	.driver = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


