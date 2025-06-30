Return-Path: <linux-leds+bounces-4938-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C662AED8E8
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A797A3BBD
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974E224678A;
	Mon, 30 Jun 2025 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDg/VS9m"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FBAC8CE;
	Mon, 30 Jun 2025 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276418; cv=none; b=ryKNznM7KBmIhduQB/TezVy8ltUREmRmULO77guijTYM2JZ+Quk/R7HU+lA8JsVG3p23bWJZUPE5x8+AXStIF2fMbAG8hdtMhhGPHGEhuw63QrQyD3jpBvCzZewp0GeNGqTbS8YowlcZS5pvjTqWelIA3u4rC0LguAz/xxNbz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276418; c=relaxed/simple;
	bh=a8BIoSpJulmP8dEpPRPih9G6XOFwJxzxZhEGBuOEH5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vC8iG4mpH6B/36thZAqDjov+2mNypp65IvQgxoMgQAFULEsIdSRTAmct0iY8gCplFTuHjGoZ1wVgbMjwhN2oZ/5IvXRP2NFfw9ojQlvFugjyMpkS1hWQW1GNctc8X43LPIObLcjx8v9ejEm+CFLU/vxi0IOIvJEzimEJ+ueG2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDg/VS9m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751276417; x=1782812417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a8BIoSpJulmP8dEpPRPih9G6XOFwJxzxZhEGBuOEH5w=;
  b=NDg/VS9mLUFKNmcnFIijs2tEFsZpp2KS09GOGTawM72jZJ6vu4wTIvsT
   tTsWQoHnH7wIgc5xOV6IVKWz6WKBE1I4dDYwty80+kgAue2oCJDXfE0SJ
   gVgWjrLoAIJhHjuZtnJ7PyU4gbSFxXFKpJCu9MOY8GZukAA20XWs0eR8C
   BcZXJi/kO2foAkCPiGOs4GGcJPhvLobRXs6TGQj3GMyUHKHh4JiCKC+E7
   ewXkUY4Rb7NUanEBERlunnrxosVrPkBbUyPVMmkUUFCvfHF0ydJRmno+B
   AwSHnG0w1trmpB5NLT+o/SCq7FgVkphbn/d0l4yScqddyt2Qx7Rq5PvTt
   g==;
X-CSE-ConnectionGUID: Bw8pxgEsRjyngDMwRlq5QA==
X-CSE-MsgGUID: MPLYHB1aQz69K0mXd5Zidw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63752390"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="63752390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:39:11 -0700
X-CSE-ConnectionGUID: UcvK3hX3Q4C313NWFyiBjw==
X-CSE-MsgGUID: cTlKUx1qTx6DRggmgChIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="154126324"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2025 02:39:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 11D681FE; Mon, 30 Jun 2025 12:39:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v1 1/1] leds: pca955x: Avoid potential overflow when filling default_label (take 2)
Date: Mon, 30 Jun 2025 12:39:06 +0300
Message-ID: <20250630093906.1715800-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC compiler v8.5.0 is not happy about printing
into a too short buffer (when build with `make W=1`):

  drivers/leds/leds-pca955x.c:696:5: note: 'snprintf' output between 2 and 11 bytes into a destination of size 8

Unfortunately this is a false positive from the old GCC versions,
but we may still improve the code by using '%hhu' format specifier
and reduce buffer size by 4 bytes.

Fixes: bd3d14932923 ("leds: pca955x: Avoid potential overflow when filling default_label")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506282159.TXfvorYl-lkp@intel.com/
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-pca955x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 42fe056b1c74..70d109246088 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -587,7 +587,7 @@ static int pca955x_probe(struct i2c_client *client)
 	struct pca955x_platform_data *pdata;
 	bool keep_psc0 = false;
 	bool set_default_label = false;
-	char default_label[8];
+	char default_label[4];
 	int bit, err, reg;
 
 	chip = i2c_get_match_data(client);
@@ -693,7 +693,7 @@ static int pca955x_probe(struct i2c_client *client)
 			}
 
 			if (set_default_label) {
-				snprintf(default_label, sizeof(default_label), "%u", i);
+				snprintf(default_label, sizeof(default_label), "%hhu", i);
 				init_data.default_label = default_label;
 			} else {
 				init_data.default_label = NULL;
-- 
2.47.2


