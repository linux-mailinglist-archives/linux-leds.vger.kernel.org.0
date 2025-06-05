Return-Path: <linux-leds+bounces-4745-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CCACF39D
	for <lists+linux-leds@lfdr.de>; Thu,  5 Jun 2025 18:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 186A47A370A
	for <lists+linux-leds@lfdr.de>; Thu,  5 Jun 2025 15:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA301F099C;
	Thu,  5 Jun 2025 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6fO/TMU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74619D080;
	Thu,  5 Jun 2025 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139203; cv=none; b=Y0G35vrkofLdtjp/ifsevWk+juTYJmLF4vzkLl1q3o0+l7ffxD2FTC+TZuYRNrWUKjvlzSFLUexZFCuHcnRKoO4CxBzHZWarXSfb41VOPc5LbIFSek0i3rr8P6alwCS/ecPwtX8ON+OVDIK2WzMXIWhYF7yTKUcGReyWRfHqF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139203; c=relaxed/simple;
	bh=RRz7YiPhyPTQ22ArkvymjhdfeIHClOipkpfMkO35EZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVcDoz7714eVO9sLaW3mB0n7wiKP/XDB4qtBKCzHicaZ3E1a/65sEOsyb+ACzdaHVGTK5lbgB2356V7bIGsLLP4L7SqZfxBDgNRVABQz7gtMKl4M9+RO4IYaL9ElVBY/YGzOTnDQN0O4jtI7ObyB0OznLfOf3v4Oe4BWo8OBGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6fO/TMU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749139201; x=1780675201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RRz7YiPhyPTQ22ArkvymjhdfeIHClOipkpfMkO35EZM=;
  b=l6fO/TMU6lF7r4mNoC561ba2FYM0sb7OFmue5z0shRPpAlyIo1CGPhXp
   SdEkI8VbsFkkU6omV6x9DZJSl2Cpt0E+DVRZBzEJmKmKC97hUFgd+2oe4
   zavjg3Nn+5cvlSeoawlageYdZVh4ne4Sq+xbjszggyHAGNrFWQDDUJ66h
   kjv1RsIdcTDcMoQ1/v4O9djEfabCepfzhpZkofNuc38jUuTF9bHGIeaVX
   f0K+NmHXfxzsQz+WQWzVb+qChxfc/swuJIpDbbZcVvfyeSvX2XvLJCydy
   w7mrHw1rJYg75jWnlDwYNixbavQxAc7WXMb1yEhkJfRlyGS02ff9lDpUt
   Q==;
X-CSE-ConnectionGUID: bTOKd+ywQyy6YQo57m9kmg==
X-CSE-MsgGUID: U7UP7RbzRyueyT63myarjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61886190"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="61886190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 09:00:01 -0700
X-CSE-ConnectionGUID: v0/PGK0lRouERhntos4ZtA==
X-CSE-MsgGUID: Lvt/OwDyTLSQbKeDu4fzcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="145510428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2025 08:59:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uND0V-0004F7-0s;
	Thu, 05 Jun 2025 15:59:55 +0000
Date: Thu, 5 Jun 2025 23:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Timmermann <linux@timmermann.space>, lee@kernel.org,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@timmermann.space
Subject: Re: [PATCH v3 1/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <202506052351.GK29s0TN-lkp@intel.com>
References: <20250604225838.102910-2-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604225838.102910-2-linux@timmermann.space>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on linus/master v6.15 next-20250605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Timmermann/leds-as3668-Driver-for-the-ams-Osram-4-channel-i2c-LED-driver/20250605-112204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250604225838.102910-2-linux%40timmermann.space
patch subject: [PATCH v3 1/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506052351.GK29s0TN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506052351.GK29s0TN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/Kconfig:116: syntax error
   drivers/leds/Kconfig:116: unknown statement "The"
   drivers/leds/Kconfig:117:warning: ignoring unsupported character '.'
   drivers/leds/Kconfig:117: unknown statement "the"
   drivers/leds/Kconfig:118:warning: ignoring unsupported character ','
   drivers/leds/Kconfig:118:warning: ignoring unsupported character '.'
   drivers/leds/Kconfig:118: unknown statement "channel"
   drivers/leds/Kconfig:121:warning: ignoring unsupported character ','
   drivers/leds/Kconfig:121:warning: ignoring unsupported character ':'
   drivers/leds/Kconfig:121: unknown statement "To"
   drivers/leds/Kconfig:122:warning: ignoring unsupported character '.'
   drivers/leds/Kconfig:122: unknown statement "will"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:731: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/leds/Kconfig:116: syntax error
   drivers/leds/Kconfig:116: unknown statement "The"
   drivers/leds/Kconfig:117:warning: ignoring unsupported character '.'
   drivers/leds/Kconfig:117: unknown statement "the"
   drivers/leds/Kconfig:118:warning: ignoring unsupported character ','
   drivers/leds/Kconfig:118:warning: ignoring unsupported character '.'
   drivers/leds/Kconfig:118: unknown statement "channel"
   drivers/leds/Kconfig:121:warning: ignoring unsupported character ','
   drivers/leds/Kconfig:121:warning: ignoring unsupported character ':'
   drivers/leds/Kconfig:121: unknown statement "To"
   drivers/leds/Kconfig:122:warning: ignoring unsupported character '.'
   drivers/leds/Kconfig:122: unknown statement "will"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:731: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +116 drivers/leds/Kconfig

    66	
    67	config LEDS_88PM860X
    68		tristate "LED Support for Marvell 88PM860x PMIC"
    69		depends on LEDS_CLASS
    70		depends on MFD_88PM860X
    71		help
    72		  This option enables support for on-chip LED drivers found on Marvell
    73		  Semiconductor 88PM8606 PMIC.
    74	
    75	config LEDS_AN30259A
    76		tristate "LED support for Panasonic AN30259A"
    77		depends on LEDS_CLASS && I2C && OF
    78		help
    79		  This option enables support for the AN30259A 3-channel
    80		  LED driver.
    81	
    82		  To compile this driver as a module, choose M here: the module
    83		  will be called leds-an30259a.
    84	
    85	config LEDS_APU
    86		tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
    87		depends on LEDS_CLASS
    88		depends on X86 && DMI
    89		help
    90		  This driver makes the PC Engines APU1 front panel LEDs
    91		  accessible from userspace programs through the LED subsystem.
    92	
    93		  If you're looking for APU2/3, use the pcengines-apu2 driver.
    94		  (symbol CONFIG_PCENGINES_APU2)
    95	
    96		  To compile this driver as a module, choose M here: the
    97		  module will be called leds-apu.
    98	
    99	config LEDS_ARIEL
   100		tristate "Dell Wyse 3020 status LED support"
   101		depends on LEDS_CLASS
   102		depends on (MACH_MMP3_DT && MFD_ENE_KB3930) || COMPILE_TEST
   103		help
   104		  This driver adds support for controlling the front panel status
   105		  LEDs on Dell Wyse 3020 (Ariel) board via the KB3930 Embedded
   106		  Controller.
   107	
   108		  Say Y to if your machine is a Dell Wyse 3020 thin client.
   109	
   110	config LEDS_AS3668
   111		tristate "LED support for AMS AS3668"
   112		depends on LEDS_CLASS
   113		depends on I2C
   114		help
   115			 This option enables support for the AMS AS3668 LED controller.
 > 116			The AS3668 provides up to four LED channels and is controlled via
   117			the I2C bus. This driver offers basic brightness control for each
   118			channel, without support for blinking or other advanced features.
   119	
   120	
   121			To compile this driver as a module, choose M here: the module
   122			will be called leds-as3668.
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

