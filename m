Return-Path: <linux-leds+bounces-159-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F557F8F65
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 22:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79A02813B9
	for <lists+linux-leds@lfdr.de>; Sat, 25 Nov 2023 21:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899BD29432;
	Sat, 25 Nov 2023 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIP/eQ66"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F9F11F;
	Sat, 25 Nov 2023 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700946352; x=1732482352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NW76CWX73/hJcaUlP/qugyIO3Pjb3vwvquuSP5fkRTs=;
  b=MIP/eQ66Fo0Ewd7Nc7EwsDbCr/bRnd3DHgnrQvCkONvRzLawIqudPtLi
   7mHtd2ppgScDp2YncgiOaNPql6uAyMLyDzkQ2X2sqAwo2gUVkAnFHJ34q
   /lZOMpEZqu2qKA4OhhP9H3K3gLPEgX2cMdz69GCzzvmutgrpXpzigGMq7
   qrCRKhN4s7Oh0bOzEZElcayZB22GZJXhYRtjkfo6XzaAueGUbTpAwR729
   HsEGe2/9FdF29mOQpWuQBkPvbdBs8kFbqOTykDKGHZVGrbfCqcX3E5gWx
   yu7xW7s7LfcfbdjfBqZaWfsrIjhzfZz1j9yFqEphXQO3FZILTJ7bNLUnk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="382934973"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="382934973"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 13:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1015179469"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="1015179469"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2023 13:05:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6zqU-0004Qs-1Q;
	Sat, 25 Nov 2023 21:05:46 +0000
Date: Sun, 26 Nov 2023 05:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, pavel@ucw.cz, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	wyx137120466@gmail.com
Subject: Re: [PATCH 2/2] leds: add mp3326 driver
Message-ID: <202311260403.PyY8h5Dj-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuxi-Wang/dt-bindings-leds-add-mps-mp3326-LED/20231124-173610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20231124093034.951-3-Yuxi.Wang%40monolithicpower.com
patch subject: [PATCH 2/2] leds: add mp3326 driver
config: x86_64-randconfig-123-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260403.PyY8h5Dj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260403.PyY8h5Dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260403.PyY8h5Dj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-mp3326.c: In function 'mp3326_parse_dt':
   drivers/leds/leds-mp3326.c:543:6: warning: unused variable 'val' [-Wunused-variable]
     int val;
         ^~~
   drivers/leds/leds-mp3326.c: At top level:
   drivers/leds/leds-mp3326.c:611:3: error: 'struct i2c_driver' has no member named 'probe_new'; did you mean 'probe'?
     .probe_new = mp3326_leds_probe,
      ^~~~~~~~~
      probe
>> drivers/leds/leds-mp3326.c:611:15: warning: initialization makes integer from pointer without a cast [-Wint-conversion]
     .probe_new = mp3326_leds_probe,
                  ^~~~~~~~~~~~~~~~~
   drivers/leds/leds-mp3326.c:611:15: note: (near initialization for 'mp3326_driver.class')
   drivers/leds/leds-mp3326.c:611:15: error: initializer element is not computable at load time
   drivers/leds/leds-mp3326.c:611:15: note: (near initialization for 'mp3326_driver.class')


vim +611 drivers/leds/leds-mp3326.c

   609	
   610	static struct i2c_driver mp3326_driver = {
 > 611		.probe_new = mp3326_leds_probe,
   612		.driver = {
   613				.name = "mp3326_led",
   614				.of_match_table = mp3326_of_match,
   615			   },
   616		.id_table = mp3326_id,
   617	};
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

