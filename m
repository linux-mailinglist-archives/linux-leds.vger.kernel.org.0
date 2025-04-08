Return-Path: <linux-leds+bounces-4444-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79FA7F349
	for <lists+linux-leds@lfdr.de>; Tue,  8 Apr 2025 05:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E1F3AD954
	for <lists+linux-leds@lfdr.de>; Tue,  8 Apr 2025 03:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A6424A07F;
	Tue,  8 Apr 2025 03:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mizH4KWf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E5192B86;
	Tue,  8 Apr 2025 03:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744083925; cv=none; b=RB2P3lDwTbkPeoB+ekRaIGr4QxvA47Zkcqen0ck7CHruA/ImGaKrKjfwDS4UQaA/GwcKH7fTJo2mrwpI005N548n/74R0I3vdR6FkO/HbmP0fOHxJZff7J2e/GtTvEFAhpoPcMaR/GOjXtgs0KIC2TRok8Jo0xvf0jwiEwoMNm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744083925; c=relaxed/simple;
	bh=VIvUuappJ61Nl5FnOL6jalOsAXNYWQeoX7SDv29+gsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+dtvYbASXwSanANgE2TzKbo9HqWFcfenvWtikFNg9vUyHerFHushz6m4mQdVRscRd07dVydggf1zZrRcCPPnPGGIwgPo28Xc8Q+aNnKz1EuBISIkmtp5Yq3D/6PFQpPF5Kdg2twCJeleZvwlZsuf1voGzlJHduDJYYMy7p4QcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mizH4KWf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744083923; x=1775619923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VIvUuappJ61Nl5FnOL6jalOsAXNYWQeoX7SDv29+gsU=;
  b=mizH4KWfQl90zGWEdn/rwYfihY3v2HnHefk81hkFW6+AwnieERMxGCVF
   WxigwQyCcSPpE7oxF96MdopAcepEIPhk2gYVq/Anq0e7Oyp8mBc+TJKor
   7rTkpju9TcJ/9YguuAy0YHb+nrdf+qX5DCVnmRtDxPFyXbAIFXQJJ5imW
   tRWUSik7fYkm5ry+uuNgqZUwMpoyt300irqAmvI2TNzDKYWbGkmhA0hRH
   fenWtBp7XvNZ60iBvc2giZjfBUDw5Gx1o84J39WjBEVMZ+/wyMh1PNb6K
   FOmEZORC/9dtLoZABRn0OOwPTWtGzv3dl4LkZxSa/o2UYCwaofsMd/IwE
   g==;
X-CSE-ConnectionGUID: 8V6MhpyKQLigi+HxWjAOyQ==
X-CSE-MsgGUID: tlq1+g8nSKuyZCnAwdfEMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63041820"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="63041820"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:45:22 -0700
X-CSE-ConnectionGUID: gHKUOo6YTv2LbvR1DuTrsw==
X-CSE-MsgGUID: F3gNGv4TSy20YZbdhH0Tvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="133299602"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Apr 2025 20:45:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1ztk-00045f-1j;
	Tue, 08 Apr 2025 03:45:16 +0000
Date: Tue, 8 Apr 2025 11:45:07 +0800
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
Subject: Re: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Message-ID: <202504081109.E7PjHxpa-lkp@intel.com>
References: <20250407095119.588920-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-4-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next lee-backlight/for-backlight-fixes linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-backlight-kinetic-ktz8866-add-ktz8866-slave-compatible/20250407-175635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250407095119.588920-4-mitltlatltl%40gmail.com
patch subject: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
config: riscv-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081109.E7PjHxpa-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081109.E7PjHxpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081109.E7PjHxpa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/video/backlight/ktz8866.c:73:32: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
      73 |         regmap_read(ktz->regmap, reg, &val);
         |                                       ^~~~
   include/linux/regmap.h:1297:69: note: passing argument to parameter 'val' here
    1297 | int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
         |                                                                     ^
>> drivers/video/backlight/ktz8866.c:132:13: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     132 |                 if (!(val && CURRENT_SINKS_MASK))
         |                           ^  ~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ktz8866.c:132:13: note: use '&' for a bitwise operation
     132 |                 if (!(val && CURRENT_SINKS_MASK))
         |                           ^~
         |                           &
   drivers/video/backlight/ktz8866.c:132:13: note: remove constant to silence this warning
     132 |                 if (!(val && CURRENT_SINKS_MASK))
         |                           ^~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +73 drivers/video/backlight/ktz8866.c

    69	
    70	static inline void ktz8866_read(struct ktz8866 *ktz, unsigned int reg,
    71					unsigned int *val)
    72	{
  > 73		regmap_read(ktz->regmap, reg, &val);
    74	}
    75	
    76	static void ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
    77				  unsigned int val)
    78	{
    79		regmap_write(ktz->regmap, reg, val);
    80	
    81		if (ktz->slave)
    82			regmap_write(ktz->slave->regmap, reg, val);
    83	}
    84	
    85	static void ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
    86					unsigned int mask, unsigned int val)
    87	{
    88		regmap_update_bits(ktz->regmap, reg, mask, val);
    89	
    90		if (ktz->slave)
    91			regmap_update_bits(ktz->slave->regmap, reg, mask, val);
    92	}
    93	
    94	static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
    95	{
    96		struct ktz8866 *ktz = bl_get_data(backlight_dev);
    97		unsigned int brightness = backlight_get_brightness(backlight_dev);
    98	
    99		if (!ktz->led_on && brightness > 0) {
   100			ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, BL_EN_BIT);
   101			ktz->led_on = true;
   102		} else if (brightness == 0) {
   103			ktz8866_update_bits(ktz, BL_EN, BL_EN_BIT, 0);
   104			ktz->led_on = false;
   105		}
   106	
   107		/* Set brightness */
   108		ktz8866_write(ktz, BL_BRT_LSB, brightness & 0x7);
   109		ktz8866_write(ktz, BL_BRT_MSB, (brightness >> 3) & 0xFF);
   110	
   111		return 0;
   112	}
   113	
   114	static const struct backlight_ops ktz8866_backlight_ops = {
   115		.options = BL_CORE_SUSPENDRESUME,
   116		.update_status = ktz8866_backlight_update_status,
   117	};
   118	
   119	static void ktz8866_init(struct ktz8866 *ktz)
   120	{
   121		unsigned int val = 0;
   122	
   123		if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val)) {
   124			ktz8866_write(ktz, BL_EN, BIT(val) - 1);
   125		} else {
   126			/*
   127			 * Enable all 6 current sinks if the number of current
   128			 * sinks isn't specified and the bootloader didn't set
   129			 * the value.
   130			 */
   131			ktz8866_read(ktz, BL_EN, &val);
 > 132			if (!(val && CURRENT_SINKS_MASK))
   133				ktz8866_write(ktz, BL_EN, CURRENT_SINKS_MASK);
   134		}
   135	
   136		if (!of_property_read_u32(ktz->client->dev.of_node, "kinetic,current-ramp-delay-ms", &val)) {
   137			if (val <= 128)
   138				ktz8866_write(ktz, BL_CFG2, BIT(7) | (ilog2(val) << 3) | PWM_HYST);
   139			else
   140				ktz8866_write(ktz, BL_CFG2, BIT(7) | ((5 + val / 64) << 3) | PWM_HYST);
   141		}
   142	
   143		if (!of_property_read_u32(ktz->client->dev.of_node, "kinetic,led-enable-ramp-delay-ms", &val)) {
   144			if (val == 0)
   145				ktz8866_write(ktz, BL_DIMMING, 0);
   146			else {
   147				unsigned int ramp_off_time = ilog2(val) + 1;
   148				unsigned int ramp_on_time = ramp_off_time << 4;
   149				ktz8866_write(ktz, BL_DIMMING, ramp_on_time | ramp_off_time);
   150			}
   151		}
   152	
   153		if (of_property_read_bool(ktz->client->dev.of_node, "kinetic,enable-lcd-bias"))
   154			ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

