Return-Path: <linux-leds+bounces-1953-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E5E909BAC
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 07:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE181C21217
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 05:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB6616C861;
	Sun, 16 Jun 2024 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G91z+T83"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800A42AB6;
	Sun, 16 Jun 2024 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718516544; cv=none; b=g7NXIp7kcOIEA3Y2ysAH6DvK9Bxh0I8mB9grnP9xD/AHC7ndRR7p17zsgvAcXRNTG+NtrfOzZxmucjeDqlGfifdrA7asnmkjT4GWQoEa9ykep3yOl77D5fUvpjM7IRw6Z2Nia0E4xKzdyU8uED86N7G7Ky1pQLEt3Gmq0Hcy6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718516544; c=relaxed/simple;
	bh=g1O0x727UHaUeoGQ2xBEP03d/wnL/6bZ8hAO9Xh6FC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ53TKgvhKVFygr4XLt1agFkb8G183KsR6/5diccoSFSCQ4FS45k8VrrRHmIfs07CN3MMZt8Wn/uTUnwRbOxjS21RnUQ2TLJIqxQMIu6iCBtR1bw5EQP/9j15OwMs3hLu2cfdAf0AwvExOafHUWsxfIswEitKosMwuvN4wj0Qu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G91z+T83; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718516542; x=1750052542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1O0x727UHaUeoGQ2xBEP03d/wnL/6bZ8hAO9Xh6FC8=;
  b=G91z+T83s5/CulC1DWourzJHsKJVWEZC34toK1yOQA331l8c1egysLk1
   W/SHsdl38eaQEqydk+HxnoteUQxsluwZlc4YegRFRXb/B3TeYF43btLNB
   e3MQzssfrq1VZ1RoDJV3sAjfma1y7jFBSLFmDfI4txYVVMcSXEONkbRJT
   nvLLZd7D3aIFT8TlEiEWG/UMPwk4aGkpBFl9LYN+CuoMzIbkLop75gvnP
   r4TdA2VQmgY+BQk+IZmzFmamNQ7gt3M55sfJ+sOeiwNcUc/OAGd5RsetY
   tJKhwwvLCFYNnBlPTFo0YduTvJ7Z6ycpOSIXQF1HzsnlqOXqJNir+hNfX
   g==;
X-CSE-ConnectionGUID: 2RQDuXNSSwOmQcfIMcwgvw==
X-CSE-MsgGUID: qk4+AO+PQ2WxPuBF7TqICw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="26049327"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="26049327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 22:42:21 -0700
X-CSE-ConnectionGUID: N0ar4n4jSw2aWmiol6yv/w==
X-CSE-MsgGUID: dcN5wMWaTCS34QeZSQ6dLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41615846"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jun 2024 22:42:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIiee-0000uo-1v;
	Sun, 16 Jun 2024 05:42:16 +0000
Date: Sun, 16 Jun 2024 13:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 05/20] leds: leds-lp55xx: generalize load_engine
 function
Message-ID: <202406161332.pjUUlreJ-lkp@intel.com>
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
config: arc-randconfig-002-20240616 (https://download.01.org/0day-ci/archive/20240616/202406161332.pjUUlreJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161332.pjUUlreJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161332.pjUUlreJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_wait_opmode_done':
   drivers/leds/leds-lp55xx-common.c:71:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      71 |         int ret;
         |             ^~~
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_load_engine':
>> drivers/leds/leds-lp55xx-common.c:39:40: error: implicit declaration of function 'FIELD_PREP_CONST' [-Werror=implicit-function-declaration]
      39 | #define   LP55xx_MODE_LOAD_ENG         FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x1)
         |                                        ^~~~~~~~~~~~~~~~
   drivers/leds/leds-lp55xx-common.c:103:15: note: in expansion of macro 'LP55xx_MODE_LOAD_ENG'
     103 |         val = LP55xx_MODE_LOAD_ENG << LP55xx_MODE_ENGn_SHIFT(idx, cfg->reg_op_mode.shift);
         |               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


vim +/FIELD_PREP_CONST +39 drivers/leds/leds-lp55xx-common.c

    28	
    29	/*
    30	 * Program Memory Operations
    31	 * Same Mask for each engine for both mode and exec
    32	 * ENG1        GENMASK(3, 2)
    33	 * ENG2        GENMASK(5, 4)
    34	 * ENG3        GENMASK(7, 6)
    35	 */
    36	#define LP55xx_MODE_DISABLE_ALL_ENG	0x0
    37	#define LP55xx_MODE_ENG_MASK           GENMASK(1, 0)
    38	#define   LP55xx_MODE_DISABLE_ENG      FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x0)
  > 39	#define   LP55xx_MODE_LOAD_ENG         FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x1)
    40	#define   LP55xx_MODE_RUN_ENG          FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x2)
    41	#define   LP55xx_MODE_HALT_ENG         FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x3)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

