Return-Path: <linux-leds+bounces-4446-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E0A7F41A
	for <lists+linux-leds@lfdr.de>; Tue,  8 Apr 2025 07:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599E23B3A09
	for <lists+linux-leds@lfdr.de>; Tue,  8 Apr 2025 05:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69446215168;
	Tue,  8 Apr 2025 05:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlPwC5pf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EED207E0F;
	Tue,  8 Apr 2025 05:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744089636; cv=none; b=YRziZiEjr1J74jR+gE9AozR9hnZPpewUgxFLKKSbhrNLUAAXpS5qNPu/x5Qe4yYGU6AfjdhAZ0f4ghNetPisBP2JQ9OJX62ktYqP8EJcLaP4+UBTwaKGtWn70cl2w0KHuODtQcVgivS2ujTcFX1gc5eI7OFbrdZkJXjLUGLU+Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744089636; c=relaxed/simple;
	bh=/0DCSkYs9FK7HPj8e3N5ePHpwmEPO47Lc4S2mr9GGEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbX27jdIMod2Ofg748lu6aCUpCb8UdH1vmEjQexbUVN6n75LloYWUBRtHP+Lbf6ImawB4MdQvBVzh5yDU+g+evbXNVq4W0NlYoAXsXdvYMLQuT3mNKlStlVnpxoCNsaLCg98HaHLDqCOLhE4NZ866kTVPalQtAoyBhpg4UBKhU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlPwC5pf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744089635; x=1775625635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/0DCSkYs9FK7HPj8e3N5ePHpwmEPO47Lc4S2mr9GGEg=;
  b=JlPwC5pfnFOYqR7+o3DjMPAl9RnYfFb1UTSSK+J4mqJ6ICrXrgUTElyz
   CZx8AsPcI/Y8pbWc4oYnCVVvvAYr49INGBYgnaM8/LodKy+RhRoM6q7yd
   TAoJ1L+ihitRB11EeUlpU0mdgJv25lBEKSGXv/0HxRl7h0TXq/B6KivwP
   IcrgkPux1NUbqRGipLzBGdscFS5JYyi0LV/DighxzQXdbc94bMfOYuSCO
   E1cIyLT6C9q8PTpWwq/nKBvwVefjv/FDhzTDu4XJdWB2syxcGG+4yq4Ex
   2+hyoGWBAoNxJcLNc9Au6uBjktWlG48npVDRk4qYxCeYHWOZnTGhnuuZB
   g==;
X-CSE-ConnectionGUID: 6s9qu/pxS3OeWOQYFgESjA==
X-CSE-MsgGUID: 21VmzwerSfOvPZBbUc9ctg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45390090"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45390090"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 22:20:34 -0700
X-CSE-ConnectionGUID: z7YBI9LvRBmLdFYHNnA0RA==
X-CSE-MsgGUID: oDg5vx6gTu2Rw5dbJx4vng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="151343970"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 22:20:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u21Ns-00048Z-0a;
	Tue, 08 Apr 2025 05:20:28 +0000
Date: Tue, 8 Apr 2025 13:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
	Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 4/4] backlight: ktz8866: add definitions to make it more
 readable
Message-ID: <202504081215.rL4DExNA-lkp@intel.com>
References: <20250407095119.588920-5-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-5-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next lee-backlight/for-backlight-fixes linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-backlight-kinetic-ktz8866-add-ktz8866-slave-compatible/20250407-175635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250407095119.588920-5-mitltlatltl%40gmail.com
patch subject: [PATCH 4/4] backlight: ktz8866: add definitions to make it more readable
config: riscv-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081215.rL4DExNA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081215.rL4DExNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081215.rL4DExNA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/ktz8866.c:77:32: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
      77 |         regmap_read(ktz->regmap, reg, &val);
         |                                       ^~~~
   include/linux/regmap.h:1297:69: note: passing argument to parameter 'val' here
    1297 | int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
         |                                                                     ^
>> drivers/video/backlight/ktz8866.c:112:66: error: expected ')'
     112 |         ktz8866_write(ktz, BL_BRT_LSB, FIELD_GET(LOWER_BYTE, brightness);
         |                                                                         ^
   drivers/video/backlight/ktz8866.c:112:15: note: to match this '('
     112 |         ktz8866_write(ktz, BL_BRT_LSB, FIELD_GET(LOWER_BYTE, brightness);
         |                      ^
   drivers/video/backlight/ktz8866.c:113:67: error: expected ')'
     113 |         ktz8866_write(ktz, BL_BRT_MSB, FIELD_GET(HIGHER_BYTE, brightness);
         |                                                                          ^
   drivers/video/backlight/ktz8866.c:113:15: note: to match this '('
     113 |         ktz8866_write(ktz, BL_BRT_MSB, FIELD_GET(HIGHER_BYTE, brightness);
         |                      ^
   drivers/video/backlight/ktz8866.c:136:13: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     136 |                 if (!(val && CURRENT_SINKS_MASK))
         |                           ^  ~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ktz8866.c:136:13: note: use '&' for a bitwise operation
     136 |                 if (!(val && CURRENT_SINKS_MASK))
         |                           ^~
         |                           &
   drivers/video/backlight/ktz8866.c:136:13: note: remove constant to silence this warning
     136 |                 if (!(val && CURRENT_SINKS_MASK))
         |                           ^~~~~~~~~~~~~~~~~~~~~
   1 warning and 3 errors generated.


vim +112 drivers/video/backlight/ktz8866.c

    97	
    98	static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
    99	{
   100		struct ktz8866 *ktz = bl_get_data(backlight_dev);
   101		unsigned int brightness = backlight_get_brightness(backlight_dev);
   102	
   103		if (!ktz->led_on && brightness > 0) {
   104			ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, BL_EN_BIT);
   105			ktz->led_on = true;
   106		} else if (brightness == 0) {
   107			ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, 0);
   108			ktz->led_on = false;
   109		}
   110	
   111		/* Set brightness */
 > 112		ktz8866_write(ktz, BL_BRT_LSB, FIELD_GET(LOWER_BYTE, brightness);
   113		ktz8866_write(ktz, BL_BRT_MSB, FIELD_GET(HIGHER_BYTE, brightness);
   114	
   115		return 0;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

