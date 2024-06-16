Return-Path: <linux-leds+bounces-1951-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 575C4909B96
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 06:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 051241F211FA
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 04:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1560616C6A4;
	Sun, 16 Jun 2024 04:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRUAkzq5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A07161924;
	Sun, 16 Jun 2024 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718512702; cv=none; b=kzkcStqn/r049TDHCJqUb5wnKok305B6DBGvxFIw/p2amIbRP1c3/bdrg5ZEW1zvBz677eeel3/BkIDW1yA1eB20lVhasAG5Ze6TFEtxbWX+1m5nm8KL+ObIuZWW68/ojexz8cHBSo6OpzGxaDg3WXy8E0yl3bu4rsHwRwhaDB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718512702; c=relaxed/simple;
	bh=o/VLIl/xK8NQmO8nYEVw8XXAqfCyxNZj18HOw4mq02k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DekcuxWUoCXBuZqaJAec7eKPZNKXYRsiMJ7QwL2C1Zqm5zvzmN7tCqvUtoXlILdsI2fzXfSpJA6S5LMng2U5SM+SP1FT5zPgcEtYgdC6dVTUoyMKyXB8Uae/mDtmIMyOMxorEoHGorjamCT/pHuusC2OelN8a04DsNUoggxGYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRUAkzq5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718512700; x=1750048700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/VLIl/xK8NQmO8nYEVw8XXAqfCyxNZj18HOw4mq02k=;
  b=NRUAkzq5AioFpVcSMqAbGNPOrnXRrWwizySFgmIGCpL4O7GYDNMjFsaa
   zInIDa6++IVglRrttqDKrRkEOLyXGriZVsdxsYePug+XD6qitfIp1fp40
   JYf+z6JVjAcCs4ghTaZ9M97XYkBcySKPBVOpILSQkeVUThRzEgHj/LcP6
   I2qBY5z8r8K0vjxrLp53BmqEwxpPfpliBCRNZSYKuEfsycQcxM3OyETSn
   NaeQ7Px53jvGgID+TZnYzy0RpnTb7gfKYoenrLhVM35lRJkoyUWeOOgmq
   a8HHY5TCL8BDVq8P3wDapXOoQUFHjZus30XeZ8PCjRZeGXR6XuzMKenNX
   Q==;
X-CSE-ConnectionGUID: 2QNssWquRWWAuhO5BvkVtA==
X-CSE-MsgGUID: EUZs73ugRR+qKwfh7/Lw1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="18287092"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="18287092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 21:38:19 -0700
X-CSE-ConnectionGUID: +V0C8pcLQL+2CLiSy1tJOw==
X-CSE-MsgGUID: jAuyMvuZQc6+3euM9PzCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="71666515"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jun 2024 21:38:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIhef-0000sw-2m;
	Sun, 16 Jun 2024 04:38:13 +0000
Date: Sun, 16 Jun 2024 12:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 05/20] leds: leds-lp55xx: generalize load_engine
 function
Message-ID: <202406161247.DuuZguPR-lkp@intel.com>
References: <20240615231152.28201-6-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615231152.28201-6-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.10-rc3]
[cannot apply to lee-leds/for-leds-next pavel-leds/for-next next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-limit-pwr-sel-property-to-ti-lp8501/20240616-071915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240615231152.28201-6-ansuelsmth%40gmail.com
patch subject: [PATCH v5 05/20] leds: leds-lp55xx: generalize load_engine function
config: i386-buildonly-randconfig-001-20240616 (https://download.01.org/0day-ci/archive/20240616/202406161247.DuuZguPR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161247.DuuZguPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161247.DuuZguPR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-lp55xx-common.c:103:8: error: call to undeclared function 'FIELD_PREP_CONST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     103 |         val = LP55xx_MODE_LOAD_ENG << LP55xx_MODE_ENGn_SHIFT(idx, cfg->reg_op_mode.shift);
         |               ^
   drivers/leds/leds-lp55xx-common.c:39:40: note: expanded from macro 'LP55xx_MODE_LOAD_ENG'
      39 | #define   LP55xx_MODE_LOAD_ENG         FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x1)
         |                                        ^
   1 error generated.


vim +/FIELD_PREP_CONST +103 drivers/leds/leds-lp55xx-common.c

    95	
    96	void lp55xx_load_engine(struct lp55xx_chip *chip)
    97	{
    98		enum lp55xx_engine_index idx = chip->engine_idx;
    99		const struct lp55xx_device_config *cfg = chip->cfg;
   100		u8 mask, val;
   101	
   102		mask = LP55xx_MODE_ENGn_MASK(idx, cfg->reg_op_mode.shift);
 > 103		val = LP55xx_MODE_LOAD_ENG << LP55xx_MODE_ENGn_SHIFT(idx, cfg->reg_op_mode.shift);
   104	
   105		lp55xx_update_bits(chip, cfg->reg_op_mode.addr, mask, val);
   106		lp55xx_wait_opmode_done(chip);
   107	}
   108	EXPORT_SYMBOL_GPL(lp55xx_load_engine);
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

