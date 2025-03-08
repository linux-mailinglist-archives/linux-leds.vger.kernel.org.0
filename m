Return-Path: <linux-leds+bounces-4198-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3FA579FF
	for <lists+linux-leds@lfdr.de>; Sat,  8 Mar 2025 12:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41EAE189145A
	for <lists+linux-leds@lfdr.de>; Sat,  8 Mar 2025 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20D11B3956;
	Sat,  8 Mar 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBekcoLN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097DF1B0424;
	Sat,  8 Mar 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741433538; cv=none; b=sn31rTUXzBdxwRzp2pDGWcjfEG1UeEHmYKlRFM4aEnmYQr5/BnfKcnQa1ldXHJZ2VI9XEomkIYdSJoRj+uozPNn5H+Y/Z3OYtOxl+MjUgBK/GndKxP7d6y6/pM9SF7682aM3mhyrZqHO5a+vt3qk5evpHEW7FHooK7T6SC6Og4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741433538; c=relaxed/simple;
	bh=mGyzuQSYI7lxTaG2jXM1kKKIwq/K5pIrgPk+wo5OWgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcz2adxcyM4tL9gY04p+nrSW36m/seKa4u7oi87Rcpbz+aDfgRKRUEMyX15gwHYREBN82sIS1PFNUEkoxpffQo6Vuccra3DMs6r+s/yOY3/Qq8sL2ODC97Fuoen2R/0jwrym7lhX4r98M/AYFXgQjKsAY2AG5Rc3n7UbzSLu3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBekcoLN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741433537; x=1772969537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mGyzuQSYI7lxTaG2jXM1kKKIwq/K5pIrgPk+wo5OWgs=;
  b=IBekcoLNJC4CD/dWjW8+kTbMex0vw49C4L2ge37dfNeYZ99Q+OF2o6pH
   Z6wQfUumkq/FbXQZCu0D/V8qgM6gHSysrx39s0Fzk5LafVw9rWsUZYxCh
   0WLRVKSxncuEyAzm0/4DzgjV9vPBN2IfQGfQ8jRIZiuykI/zWQFu13gO3
   AUZJK43sUesIbRbaGJDMeIrK9K2bHYN9A4grSQFm8c7jiL/CbAGbOWlVR
   ZmfcWcOooxz6/MSmUYWEwsZglRNMIRUQtbPtlAinQ8f+jDnjIkQsYhqdo
   gustSIujflOZ7NXYU9R8sBrIZNjWsKnVNH/49DXfpfIGV6fWvmrv0GV1I
   g==;
X-CSE-ConnectionGUID: /1ZXoKZQSSKC27qCDuy5Gg==
X-CSE-MsgGUID: TzmBCFOURFGmAzlOd/krfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46259549"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="46259549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 03:32:16 -0800
X-CSE-ConnectionGUID: IMg6izIxRlW2TFhEeyHY2g==
X-CSE-MsgGUID: wh3GvtK/TuespLgCOnphSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119724206"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2025 03:32:13 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqsPb-0001qk-2a;
	Sat, 08 Mar 2025 11:32:11 +0000
Date: Sat, 8 Mar 2025 19:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <202503081907.HxPC1bKV-lkp@intel.com>
References: <20250306140947.580324-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-7-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next linus/master lee-backlight/for-backlight-fixes v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250306-221554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250306140947.580324-7-tzimmermann%40suse.de
patch subject: [PATCH v3 06/11] backlight: Replace fb events with a dedicated function call
config: i386-randconfig-005-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081907.HxPC1bKV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081907.HxPC1bKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081907.HxPC1bKV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/video/fbdev/core/fb_backlight.o: in function `fb_bl_notify_blank':
>> drivers/video/fbdev/core/fb_backlight.c:47: undefined reference to `backlight_notify_blank'
>> ld: drivers/video/fbdev/core/fb_backlight.c:49: undefined reference to `backlight_notify_blank_all'


vim +47 drivers/video/fbdev/core/fb_backlight.c

    40	
    41	void fb_bl_notify_blank(struct fb_info *info, int old_blank)
    42	{
    43		bool on = info->blank == FB_BLANK_UNBLANK;
    44		bool prev_on = old_blank == FB_BLANK_UNBLANK;
    45	
    46		if (info->bl_dev)
  > 47			backlight_notify_blank(info->bl_dev, info->device, on, prev_on);
    48		else
  > 49			backlight_notify_blank_all(info->device, on, prev_on);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

