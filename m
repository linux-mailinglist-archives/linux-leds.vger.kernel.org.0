Return-Path: <linux-leds+bounces-414-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1459813A26
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 19:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5BB1C2093A
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 18:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610C1208BD;
	Thu, 14 Dec 2023 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkBHWIff"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEAF10F;
	Thu, 14 Dec 2023 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702579259; x=1734115259;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N7rGglN+w0R8A5Lt7lXnmbQND5j6xiAnpyeA7uoua60=;
  b=SkBHWIfftkJTGCc4AcWnBcZuTX4Ix/Gkm2KUdNTlBr7JN8c00w4cGEic
   0EFs7o6AFlo5pcGHKWqSzbX1K9/sG9G72vME+Gcv4Go0R/l3hx+KRWfCk
   lnMqGlYQBNPnp+AvTf+RRQ6v8wCeI4ACti3vVHveNXEj8K8BOKXM8esys
   vMH4jk/UiO0tOfOM+PhZp/P/xpfHd6z1TacEkqqyEIvGvRKxmO3oy/ltA
   CS98hQbo7N3G8HRLXfs/kHNIsV5QnlE+Wky51zRvhsCF2k9NOC1MsSHDL
   8878W16Ih91T1Hqxj5bxggEFl6TMYUrccKXGj1YL4NmburgVBCTN3goB8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385582270"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="385582270"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 10:40:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840374566"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="840374566"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 10:40:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0B42918E; Thu, 14 Dec 2023 20:40:52 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v1 0/4] leds: max5970: Allow to use on non-OF platforms
Date: Thu, 14 Dec 2023 20:40:07 +0200
Message-ID: <20231214184050.1272848-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow to use driver on non-OF platforms and other cleanups.

Andy Shevchenko (4):
  leds: max5970: Remove unused variable
  leds: max5970: Make use of device properties
  leds: max5970: Make use of dev_err_probe()
  leds: max5970: Add missing headers

 drivers/leds/leds-max5970.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


