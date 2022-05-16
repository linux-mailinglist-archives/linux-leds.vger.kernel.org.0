Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDC552826A
	for <lists+linux-leds@lfdr.de>; Mon, 16 May 2022 12:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242798AbiEPKnw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 May 2022 06:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242802AbiEPKnl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 May 2022 06:43:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F259CF580;
        Mon, 16 May 2022 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652697810; x=1684233810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/xq52s2GsK7V5EZLMI5cU5Z33KAXMYGbSQJlQt3ABI4=;
  b=HU2ywZORJpM8Z0nd9t/SITaHIw0oN/qUKXp9RV/QaTEMxoJXdoCE0Hlk
   T/lQyWThMY1TqUDPvtv+mqseopZTNd8c23jdzFOEy/cSVT3GMntO8HplQ
   Xfp5cUWIFTBR8I47745BGZ/vqEbvx9YPUt1UP95tyImUfIfkrLNSBjZZ+
   MaYsEHPPnVM8QKaNmPNmrztBYkzjyoTsdt+AHWUieL4HSiJhjqYFO6atQ
   6B71iopQLW2h/Ie96QWE+k/dyPO6Kh5dySzcgOjAqf0OOzc1rXo6cvcxI
   LNWeGePhG7rNTMVtHir92/3ox4uKoMeUw4+PlaDG9T3tICXm37dWd1OKm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="269620301"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="269620301"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="604800430"
Received: from lkp-server02.sh.intel.com (HELO 0628dcddc537) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 May 2022 03:43:27 -0700
Received: from kbuild by 0628dcddc537 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqYCE-000016-G9;
        Mon, 16 May 2022 10:43:26 +0000
Date:   Mon, 16 May 2022 18:42:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kyle Swenson <kyle.swenson@est.tech>, pavel@ucw.cz,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>
Subject: Re: [PATCH 1/2] leds: aw21024: Add support for Awinic's AW21024
Message-ID: <202205161859.bDAFU09i-lkp@intel.com>
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
config: x86_64-randconfig-r011-20220516 (https://download.01.org/0day-ci/archive/20220516/202205161859.bDAFU09i-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/38eeda60299918b5599f4a58714dc91f9741677c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kyle-Swenson/leds-aw21024-Add-support-for-Awinic-s-AW21024/20220514-030705
        git checkout 38eeda60299918b5599f4a58714dc91f9741677c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-aw21024.c:295:34: warning: 'of_aw21024_leds_match' defined but not used [-Wunused-const-variable=]
     295 | static const struct of_device_id of_aw21024_leds_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~


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
