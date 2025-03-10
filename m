Return-Path: <linux-leds+bounces-4204-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C6A589E8
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 02:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 502593ABE90
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 01:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDA2130A73;
	Mon, 10 Mar 2025 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/0w8Obw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DD3597B;
	Mon, 10 Mar 2025 01:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741569712; cv=none; b=G2VoMXfztteEhMBzqqHwxMQkuh+47kfPnbQKwd54yazHsjV0WEhlR0iZ2OE+b87moAkWSl8NXEN6rjgRPjScOkGaCBCc8brOA+Lp3urV0Nh9aTjFlnScA2eDiFfvjXB+NgCMn3W/yRfQq+I6JkKplMUubD461DLZHguHZ35vhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741569712; c=relaxed/simple;
	bh=z8QdkKRYlOpmTs+ivZoED/+3/x2JDmVV+mfVt3piMxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YP4D794QGKjN5GSnD/VUlXTVCJdWgQJ2JH0VcHDJIaR3m/soMK8k3Oe1Hun4lDOcaNmwowLKBf9hOhP4d7rKETPRjt2JUrhJ52+LIpUqgbTnA4TRz01IekxA080RmsGwEK8WaqBw0HFjtHLwVh83sOYn1d8PwYJAY5QxaJAi90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/0w8Obw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741569710; x=1773105710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z8QdkKRYlOpmTs+ivZoED/+3/x2JDmVV+mfVt3piMxQ=;
  b=l/0w8Obw4iPo2fcIyV75TtHLFdxAepTQ+9iRhfnYCqCDGZnuSPjnAgsL
   vXMbHKH9IOwUGk+p8Dbhw4hqGu6xBwvBrNUD9RmG6pbJ1YtbPCFVG6uqC
   HCbtFJHCFWFgqI92oSr3gkgczBg100zFJTwvPvSlEuHLIPbm+9tlsjp2f
   yNKTcCHsnEujRmCqW2gGCcglcGrvAOLvz+EZq0vAEiCIgiD6aa35LFGN1
   eOpZv+9Vp0oA1lgqB18RZ/0k7QAEOqCJwdYqqHDevrtck2urcLSpiBhEa
   ikwFCrogys3YnJaA5WA8tMK6QWELu9uM1i8oufnXioMGtpJervIoyRrKx
   g==;
X-CSE-ConnectionGUID: UbIGbG9+R7KTeD7YuseYXg==
X-CSE-MsgGUID: 9doK0O2eRu+C7RODITgmFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53929401"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53929401"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 18:21:50 -0700
X-CSE-ConnectionGUID: ZNSrZuboRGCjuTdXMONxgA==
X-CSE-MsgGUID: Gx/TtrTmTz27T9IJebfdUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119839028"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2025 18:21:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trRpw-0003fw-1Z;
	Mon, 10 Mar 2025 01:21:44 +0000
Date: Mon, 10 Mar 2025 09:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, pavel@kernel.org, lee@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Message-ID: <202503100925.eZz1D0kw-lkp@intel.com>
References: <20250306172126.24667-4-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306172126.24667-4-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-Add-LP5812-LED-driver/20250307-012604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250306172126.24667-4-trannamatk%40gmail.com
patch subject: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
config: x86_64-randconfig-005-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100925.eZz1D0kw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100925.eZz1D0kw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100925.eZz1D0kw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "led_set_autonomous_animation_config" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_initialize" [drivers/leds/leds-lp5812.ko] undefined!
ERROR: modpost: "lp5812_read" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_write" [drivers/leds/leds-lp5812.ko] undefined!
ERROR: modpost: "lp5812_disable_all_leds" [drivers/leds/leds-lp5812.ko] undefined!
ERROR: modpost: "lp5812_enable_disable" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_device_command" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_reset" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_update_regs_config" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_fault_clear" [drivers/leds/leds-lp5812.ko] undefined!
WARNING: modpost: suppressed 23 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

