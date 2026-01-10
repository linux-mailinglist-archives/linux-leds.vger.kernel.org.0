Return-Path: <linux-leds+bounces-6610-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0932D0CF15
	for <lists+linux-leds@lfdr.de>; Sat, 10 Jan 2026 05:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D50130060DD
	for <lists+linux-leds@lfdr.de>; Sat, 10 Jan 2026 04:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC1F2853F3;
	Sat, 10 Jan 2026 04:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2ouBRuv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC307223336
	for <linux-leds@vger.kernel.org>; Sat, 10 Jan 2026 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768018817; cv=none; b=YxyLGNkr89JJxFN1sN6LB8j8elRErHwJRlnIXFYvEs5gfzLGS+yrb3N9vSxkj0eqGctvK1YdCO52URnORkjvkvDMUNCVKtOPq5YCX3JX/bYT8H6mbLtNeyK1vzOqJckOEs0p1iYKXJZBpYLFpTgF/B8TdsO7hxrh0URMD6bN98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768018817; c=relaxed/simple;
	bh=io2f+hjhUrZYYXSQOBNN4czXpcELuAZnxKD2yFNNXSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWCIruVOKedw8jCI0DMu8HzSqd9w41Cc+N8WqVj2tFn79oDpO6FUgmzOlzUx/CwJ/yfXm9YEjin4ELm1aEkSeEO09zhlj9V3eTQsEzZdznAUD+41RNWUKg87eahMZR4LG16X6N0xoZ3BH2BAPbl8InCsQUWIk2F/g+JgYItk1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2ouBRuv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768018814; x=1799554814;
  h=date:from:to:cc:subject:message-id;
  bh=io2f+hjhUrZYYXSQOBNN4czXpcELuAZnxKD2yFNNXSI=;
  b=G2ouBRuv2SSOyupgWH6ipDPgirLPxryK/8RWgsQjJ8ILwm5I3xg0PV8T
   AVafHuOOB6jc450F+JIfIlo5QPfsyJeZNsqra2zLwggz5BT7zrFwJSgTg
   Pec5chAjeID2jY3jLnOLGgYo/gINiUBaOZZnl6TLSwMDtX0zybEZEMe9C
   0JPkPFM7JKB7hUwGqI8z9NUhIGSmP7MtfD1Tb8i5kHK+LAaBj8Wjj+HUo
   ieLVw7ytJ1/eYWA5xo12Q6DQlBIdr6KVpVYYLQs4+D1tPbQjVIRnTV25E
   UwTj77dDQz3SKqPDqTTuLx9/+TD/rLt7RZPx1cFj695TyI+xtG+she7QA
   Q==;
X-CSE-ConnectionGUID: oOfxrae7QDi49ylVs9jD8g==
X-CSE-MsgGUID: ISuZP4/QSyirvGJLgfk/NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69441311"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69441311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 20:20:14 -0800
X-CSE-ConnectionGUID: FSdRNF1pTbGzMnpSMumzRw==
X-CSE-MsgGUID: 1R3rkbBjSA+6a1TujzGIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208455510"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2026 20:20:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veQSQ-0000000083s-2HjO;
	Sat, 10 Jan 2026 04:20:10 +0000
Date: Sat, 10 Jan 2026 12:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 3/10] ERROR: modpost:
 "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
Message-ID: <202601101239.ORkhfLpB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
commit: 51f7560294c911e9394357a903ffa28eebe4b253 [3/10] leds: Add support for TI LP5860 LED driver chip
config: xtensa-randconfig-r071-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101239.ORkhfLpB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101239.ORkhfLpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101239.ORkhfLpB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-lp5860-core.o
>> ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
>> ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_LP5860_CORE
   Depends on [n]: NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=m] && LEDS_CLASS [=y] && OF [=n]
   Selected by [m]:
   - LEDS_LP5860_SPI [=m] && NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=m] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

