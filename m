Return-Path: <linux-leds+bounces-3029-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29875997CC6
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 08:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA7CA1F22D8D
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 06:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F241991AF;
	Thu, 10 Oct 2024 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLq9l48h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0742863D;
	Thu, 10 Oct 2024 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728540054; cv=none; b=WrTRKwMQ7ULW5AV6pphIuVjGAFOV6CcfOaqtwibZfjYC/V9YTKWPn6fdxEpfiTUwZehFk7cwMcoBlnwPQUgj4zL54wpAxJvm4gZHvxZvMP2VbZ4MtncsfgUzi/+MUk+ggmTFRGIrJhqZEEtNskuA4jbNJfTRf3KjnleuBtSogT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728540054; c=relaxed/simple;
	bh=PK7oZMg/krXjhlNrDoVFQfXTxHOhq4hpTEDSiQrqDME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5ey1AIn9k0gQMTvRNJ+Cs0nbWCIfCxM44M6i18UPmRhKNVzDyebsOqWnE6KR1Mwui4WM/7MaZ+lhnWPyDjFYlGNJpgvj3DDydccg4AN7hsUzu5MpHVvcYzg/+vrHpXYbrG8ODv7tTicya8e1Ow4/M7MowI3ZtA6fgmMb4m7Qi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLq9l48h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728540052; x=1760076052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PK7oZMg/krXjhlNrDoVFQfXTxHOhq4hpTEDSiQrqDME=;
  b=CLq9l48htPc3hUYt+pdpPHeEFm99xMaMmMKiC4SuBdccne4rwEhgG895
   6jJCRVMzZsNe9InCOqQitDqVR8gibmBpQFBjjXRDG7LKPjbeH+JcB7htq
   n5ha8DBhn3fNQDwoYZLr2Yp4puLKDHtFtJ7DXzMLEU+HjAlVwOy4A9DfA
   NpGp29QAY9sPQVT9f7xWPNSB4DMCyyfS24RFfWOC0WVZ+qGig8K2n9KMw
   uEHsVlvOPp5bkQcFG+EeisWcZ4fgana+N6TWsoZbyQgiA+RvSgNeEWTyq
   XyJ5h2902dQyECnaAQOy2kH8z8lUgjXOgMBW+9qpkTrM2RRMH7neXAQLr
   w==;
X-CSE-ConnectionGUID: 5Sx2sbMNTPiTBv5tMSgPyw==
X-CSE-MsgGUID: bq41FM1/SVO0b6yIbLPb2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15498886"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="15498886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 23:00:52 -0700
X-CSE-ConnectionGUID: BASR9FPEQmGnZyQhWB2nEg==
X-CSE-MsgGUID: w4QsR1g9SImq5EPcW6Cc/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76096954"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2024 23:00:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1symEB-000AF7-1f;
	Thu, 10 Oct 2024 06:00:47 +0000
Date: Thu, 10 Oct 2024 14:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] leds: lp55xx: Fix check for invalid channel number
Message-ID: <202410101313.hQc9I8AL-lkp@intel.com>
References: <1728464547-31722-1-git-send-email-michal.vokac@ysoft.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1728464547-31722-1-git-send-email-michal.vokac@ysoft.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on linus/master v6.12-rc2 next-20241009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Vok/leds-lp55xx-Fix-check-for-invalid-channel-number/20241009-171340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/1728464547-31722-1-git-send-email-michal.vokac%40ysoft.com
patch subject: [PATCH] leds: lp55xx: Fix check for invalid channel number
config: xtensa-randconfig-r071-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101313.hQc9I8AL-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101313.hQc9I8AL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101313.hQc9I8AL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/leds/leds-lp55xx-common.c:17:
   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_parse_common_child':
>> drivers/leds/leds-lp55xx-common.c:1130:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
    1130 |                 dev_err(dev, "Use channel numbers between 0 and %d\n",
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/leds/leds-lp55xx-common.c:1130:17: note: in expansion of macro 'dev_err'
    1130 |                 dev_err(dev, "Use channel numbers between 0 and %d\n",
         |                 ^~~~~~~
   drivers/leds/leds-lp55xx-common.c:1130:25: note: each undeclared identifier is reported only once for each function it appears in
    1130 |                 dev_err(dev, "Use channel numbers between 0 and %d\n",
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/leds/leds-lp55xx-common.c:1130:17: note: in expansion of macro 'dev_err'
    1130 |                 dev_err(dev, "Use channel numbers between 0 and %d\n",
         |                 ^~~~~~~


vim +1130 drivers/leds/leds-lp55xx-common.c

  1111	
  1112	static int lp55xx_parse_common_child(struct device_node *np,
  1113					     struct lp55xx_led_config *cfg,
  1114					     int led_number, int *chan_nr)
  1115	{
  1116		int ret;
  1117	
  1118		of_property_read_string(np, "chan-name",
  1119					&cfg[led_number].name);
  1120		of_property_read_u8(np, "led-cur",
  1121				    &cfg[led_number].led_current);
  1122		of_property_read_u8(np, "max-cur",
  1123				    &cfg[led_number].max_current);
  1124	
  1125		ret = of_property_read_u32(np, "reg", chan_nr);
  1126		if (ret)
  1127			return ret;
  1128	
  1129		if (*chan_nr < 0 || *chan_nr >= cfg->max_channel) {
> 1130			dev_err(dev, "Use channel numbers between 0 and %d\n",
  1131				cfg->max_channel - 1);
  1132			return -EINVAL;
  1133		}
  1134	
  1135		return 0;
  1136	}
  1137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

