Return-Path: <linux-leds+bounces-3521-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3119E89FD
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 04:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36F22162A6C
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 03:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1811F19AA5D;
	Mon,  9 Dec 2024 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ci4UOFuZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D11E199FBF;
	Mon,  9 Dec 2024 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733715729; cv=none; b=jY18L7TrDFpzOH7oGP+bjipAg6J4E4Rurub6YsQEkA8D2uQCZAAAx/aSloY3Z4HRcd/KXh29U5f0vFltYWjAi3fAgBtDPHVCT+uw/Zx33Vlsd5udBelOTI59zJQ69/Th79xDvVWDuHdXN0LsJZyRHAq4Eow/5T9/iBt9JtS9R4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733715729; c=relaxed/simple;
	bh=jjCNDzZlfiFPST1Vis/4xXYsOg56hSTf+XAT+Z9Q2rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKcHqWCBYCoAFgVXbD0sAjXKpQ3MDOGb50MyJz/nN+dQ7ypIwJUTWqH/+a4otZ+akfTpUL6heCwopf0CrUIx8YQ8zg+CF8KAjTygCj/rtBty3WdORAp0MbM8OcocTAsrR5C6dBltoAb6a8lorhwfrjcP5+/m4w9tsY0NhuCT7GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ci4UOFuZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733715727; x=1765251727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jjCNDzZlfiFPST1Vis/4xXYsOg56hSTf+XAT+Z9Q2rE=;
  b=ci4UOFuZPSPrUPphy43bBdegj5Jo88zPorw/shgi5NDnvRymnI1/UbhZ
   PA0qVeW+HdsHDcHrssfSL3nbC0D7cfaz2UoPsMtHq8PMXXZlc0wE917Z4
   64+qgL3Sbx4tVHQq2oZwZ8jX1R5XulHWMWLN6M+vl5N8RuOJPnjwBC2fj
   Q4CsX2DQiJ961pk9RRGvtwyWl60vGB2qzyFUYToxpkMK63e9dBp9U3s0J
   QfPMYdTDt5X83/Ui4GHknQOKQurWfL8KyEhUf5cV8IstHVpaGS9qMyslc
   BVX/dpypmTD2FH5Z5uS+6uIhouRdB4ENejnHkgdf1HE7KDQL0silYO0jd
   A==;
X-CSE-ConnectionGUID: oCOkom0OQU+0N4MpBIxWEA==
X-CSE-MsgGUID: XOTz8Z+uSqivRINhdVPnbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34135608"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34135608"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:42:07 -0800
X-CSE-ConnectionGUID: Hbvqi3ZbQg6aI6/GpXdtlQ==
X-CSE-MsgGUID: 0/36i1gHQEmF+PLe0iTyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94752221"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 19:42:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUel-0003kL-0f;
	Mon, 09 Dec 2024 03:41:59 +0000
Date: Mon, 9 Dec 2024 11:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Chan <towinchenmi@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <202412070752.4Q1AOuGo-lkp@intel.com>
References: <20241206172735.4310-3-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172735.4310-3-towinchenmi@gmail.com>

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-leds-backlight-apple-dwi-bl-Add-bindings-for-Apple-DWI-backlight/20241207-013254
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241206172735.4310-3-towinchenmi%40gmail.com
patch subject: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
config: hexagon-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070752.4Q1AOuGo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070752.4Q1AOuGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070752.4Q1AOuGo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/dwi_bl.c:46:9: error: implicit declaration of function 'FIELD_PREP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
                  ^
>> drivers/video/backlight/dwi_bl.c:61:9: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return FIELD_GET(DWI_BL_CMD_DATA, cmd);
                  ^
   2 errors generated.


vim +/FIELD_PREP +46 drivers/video/backlight/dwi_bl.c

    37	
    38	static int dwi_bl_update_status(struct backlight_device *bl)
    39	{
    40		struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
    41	
    42		int brightness = backlight_get_brightness(bl);
    43	
    44		u32 cmd = 0;
    45	
  > 46		cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
    47		cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
    48	
    49		writel(cmd, dwi_bl->base + DWI_BL_CMD);
    50		writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
    51	
    52		return 0;
    53	}
    54	
    55	static int dwi_bl_get_brightness(struct backlight_device *bl)
    56	{
    57		struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
    58	
    59		u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
    60	
  > 61		return FIELD_GET(DWI_BL_CMD_DATA, cmd);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

