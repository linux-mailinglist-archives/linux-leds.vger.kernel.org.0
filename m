Return-Path: <linux-leds+bounces-330-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AB80BDB2
	for <lists+linux-leds@lfdr.de>; Sun, 10 Dec 2023 23:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4DB280B93
	for <lists+linux-leds@lfdr.de>; Sun, 10 Dec 2023 22:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A14636;
	Sun, 10 Dec 2023 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZVfSqdI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EC8E1;
	Sun, 10 Dec 2023 14:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702247894; x=1733783894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lz28C7rwIgrThVgX90L63yYl8K1fbXBIyqGbO5gn0Bs=;
  b=PZVfSqdIrchdidt+jPa7MUv5xHf+PS9c3IuvtwHcp1ht/uSx6pE9dbSW
   5GDAa9Gvoue/T015BGAxLP+ubaDH4ez0golkqKLADSHNoGuR0TEBg9vLM
   XdvW7R84CdHM76z44IF4adHTnmxFLaXh1xwMh17A0/KzWERVwNOnoJtS6
   o2q3taxvTDyfqtK1Rsll33H3o4B4z+xhzsK6AjBYFXuCr67+0/rvtOfwE
   mIrTMyq2dMu593uoNAuoYWwwL/dummykn3Xc5Rz6g9Bb2+BAaZnxm3Ldj
   P4neIcz/KOGkJN8bplUoULZFxh2ohen7VBw3BRZ3/ERvf/u718Vx088/P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="374735290"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="374735290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 14:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890867400"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890867400"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 14:38:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCSR7-000HLI-1k;
	Sun, 10 Dec 2023 22:38:09 +0000
Date: Mon, 11 Dec 2023 06:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amitesh Singh <singh.amitesh@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] feat(kernel/pca963x): implement power management
Message-ID: <202312110656.twrTxNHo-lkp@intel.com>
References: <881c6ba1-1701-41be-a4ac-81cdca5f0eea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881c6ba1-1701-41be-a4ac-81cdca5f0eea@gmail.com>

Hi Amitesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amitesh-Singh/feat-kernel-pca963x-implement-power-management/20231210-194846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/881c6ba1-1701-41be-a4ac-81cdca5f0eea%40gmail.com
patch subject: [PATCH] feat(kernel/pca963x): implement power management
config: arc-randconfig-002-20231211 (https://download.01.org/0day-ci/archive/20231211/202312110656.twrTxNHo-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110656.twrTxNHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110656.twrTxNHo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca963x.c:399:12: warning: 'pca963x_resume' defined but not used [-Wunused-function]
     399 | static int pca963x_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/leds/leds-pca963x.c:385:12: warning: 'pca963x_suspend' defined but not used [-Wunused-function]
     385 | static int pca963x_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/pca963x_resume +399 drivers/leds/leds-pca963x.c

   383	
   384	#ifdef CONFIG_PM
 > 385	static int pca963x_suspend(struct device *dev)
   386	{
   387		struct pca963x *chip;
   388		u8 reg;
   389	
   390		chip = dev_get_drvdata(dev);
   391	
   392		reg = i2c_smbus_read_byte_data(chip->client, PCA963X_MODE1);
   393		reg = reg | (1 << PCA963X_MODE1_SLEEP);
   394		i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
   395	
   396		return 0;
   397	}
   398	
 > 399	static int pca963x_resume(struct device *dev)
   400	{
   401		struct pca963x *chip;
   402		u8 reg;
   403	
   404		chip = dev_get_drvdata(dev);
   405	
   406		reg = i2c_smbus_read_byte_data(chip->client, PCA963X_MODE1);
   407		reg = reg & ~(1 << PCA963X_MODE1_SLEEP);
   408		i2c_smbus_write_byte_data(chip->client, PCA963X_MODE1, reg);
   409	
   410		return 0;
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

