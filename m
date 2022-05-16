Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E02552843F
	for <lists+linux-leds@lfdr.de>; Mon, 16 May 2022 14:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiEPMeu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 May 2022 08:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbiEPMet (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 May 2022 08:34:49 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808E539174;
        Mon, 16 May 2022 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652704488; x=1684240488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkwJB3FC+w/sAIG0GdnTROrSAhvxYi63fkLJ9hK9U2g=;
  b=KOk8fSEmewEIr4stMydJr17Nj3X+t2k2M16/pgcASglGoInPGbzwN9G6
   GNXojGIoR+xiqgURLx/0WH1VDZ42wb7/TvOxgV1jJBXykoyoHoiwNeuCq
   0jorbx3NVcC1AlHJRbjBJWa6drGDC10EcnbRCw96mQ7yz/neudj4PwhbZ
   EErJRLaG9axW6MfCrB5Uu+FY02WEi+WRaWkX2/omZaHSnRLQl548mTfF/
   +/jEyffQDs7vCWEID47uokqQx2dlRJka1vbRSMOH331f+DS3Ols5smKgv
   zx/7RWkivA4NpBTW/CrIFmegMwXrfZud67RDuFQotaRbso61S+O9DFqj1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="269642230"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="269642230"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 05:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="699511964"
Received: from lkp-server02.sh.intel.com (HELO 0628dcddc537) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 May 2022 05:34:31 -0700
Received: from kbuild by 0628dcddc537 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqZvi-00005l-Ny;
        Mon, 16 May 2022 12:34:30 +0000
Date:   Mon, 16 May 2022 20:34:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kyle Swenson <kyle.swenson@est.tech>, pavel@ucw.cz,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Swenson <kyle.swenson@est.tech>
Subject: Re: [PATCH 1/2] leds: aw21024: Add support for Awinic's AW21024
Message-ID: <202205162025.GEAQ50Y7-lkp@intel.com>
References: <20220513190409.3682501-1-kyle.swenson@est.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513190409.3682501-1-kyle.swenson@est.tech>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kyle,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on robh/for-next v5.18-rc7 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Swenson/leds-aw21024-Add-support-for-Awinic-s-AW21024/20220514-030705
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: hexagon-randconfig-r014-20220516 (https://download.01.org/0day-ci/archive/20220516/202205162025.GEAQ50Y7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/38eeda60299918b5599f4a58714dc91f9741677c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kyle-Swenson/leds-aw21024-Add-support-for-Awinic-s-AW21024/20220514-030705
        git checkout 38eeda60299918b5599f4a58714dc91f9741677c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-aw21024.c:295:34: warning: unused variable 'of_aw21024_leds_match' [-Wunused-const-variable]
   static const struct of_device_id of_aw21024_leds_match[] = {
                                    ^
   1 warning generated.


vim +/of_aw21024_leds_match +295 drivers/leds/leds-aw21024.c

   294	
 > 295	static const struct of_device_id of_aw21024_leds_match[] = {
   296		{ .compatible = "awinic,aw21024", },
   297		{},
   298	};
   299	MODULE_DEVICE_TABLE(of, of_aw21024_leds_match);
   300	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
