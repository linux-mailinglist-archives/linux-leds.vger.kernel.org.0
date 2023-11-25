Return-Path: <linux-leds+bounces-146-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF57F8E4B
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08D6C1C20AC3
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 20:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DE52FE3F;
	Sat, 25 Nov 2023 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXwn1L7K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B28127;
	Sat, 25 Nov 2023 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700942450; x=1732478450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ndvF+Ar9gfYxB4rkH+FeGi/cHGDpQpbFY+l59NJJuCQ=;
  b=aXwn1L7K+FiTepoVjDLc1n0TySWKAnIPYjVU7bt7osIxzRlgq3fjCgWr
   QjZgctzEL62Sc4rKeY4KNXpw3XdA9CELBj0v9GVE+3D0FjuPaPbG8XSrR
   FV2ugoE5YIGjDPHRagNORdIZSfARJ3sZ+KSs7L22SPf4plpjkkyz+1+eC
   ZgTyuXHGnkm7/ySW/7jCiI8tPzB+4m0rnt+mQ/khRuYbZmPZw89RsgF8E
   nXVjkVd/tf4Bk1ib7rChiL3DbiN8wNj8DfnWOoDOCFA/dfCRffQQqzql5
   SK8YGP6sLp/TBRGJ2JQPO2H7iaufCo8IxZbGRfR9RBEiGLfxBWL2R9ja7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="391398657"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="391398657"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 12:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="891332354"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="891332354"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2023 12:00:46 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6ypY-0004Mh-1Z;
	Sat, 25 Nov 2023 20:00:44 +0000
Date: Sun, 26 Nov 2023 04:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, pavel@ucw.cz, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, wyx137120466@gmail.com
Subject: Re: [PATCH 2/2] leds: add mp3326 driver
Message-ID: <202311260229.JhaLyLj7-lkp@intel.com>
References: <20231124093034.951-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124093034.951-3-Yuxi.Wang@monolithicpower.com>

Hi Yuxi,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuxi-Wang/dt-bindings-leds-add-mps-mp3326-LED/20231124-173610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20231124093034.951-3-Yuxi.Wang%40monolithicpower.com
patch subject: [PATCH 2/2] leds: add mp3326 driver
config: i386-buildonly-randconfig-005-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260229.JhaLyLj7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260229.JhaLyLj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260229.JhaLyLj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-mp3326.c:543:6: warning: unused variable 'val' [-Wunused-variable]
           int val;
               ^
   drivers/leds/leds-mp3326.c:611:3: error: field designator 'probe_new' does not refer to any field in type 'struct i2c_driver'
           .probe_new = mp3326_leds_probe,
            ^
>> drivers/leds/leds-mp3326.c:619:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   module_i2c_driver(mp3326_driver);
   ^
   int
>> drivers/leds/leds-mp3326.c:619:19: error: a parameter list without types is only allowed in a function definition
   module_i2c_driver(mp3326_driver);
                     ^
   1 warning and 3 errors generated.


vim +/int +619 drivers/leds/leds-mp3326.c

   618	
 > 619	module_i2c_driver(mp3326_driver);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

