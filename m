Return-Path: <linux-leds+bounces-3520-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036639E89E5
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 04:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A045B1883D81
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 03:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9099193435;
	Mon,  9 Dec 2024 03:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLee83u9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F23160799;
	Mon,  9 Dec 2024 03:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733715668; cv=none; b=faB3OQ9UnkmvTFCJzMIALmXNw3haK7JAaA4Utdw1klU8sj84uH+9FJtDjya/VEgaSR2Xiw0iCfmkcmPGnlkFLu9Bx2h3+HbGWpJW8AyTdWJ1QIpX7yW9p2+rWKnZlF/zOEoMIo9YF4jOSVByRgG2/ZmoYQpvtgFwb7/Pm6cZ18w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733715668; c=relaxed/simple;
	bh=ncK/sE8+KnlE+XPzzVk25YCDyXg/f1NqF+jwwsC606M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eecuc9Pd691mwylDCZ9Jr+FialQ7h4ASmcI55pFmAg4zydZtnmBe3MOof+xHDTEgFXyIiBdCXtBMee7OKe5D+ncOKT+qSrNCDmdZhnbvpYNkqtUxCA+rXnCZ4Lo/uCn9puxyrGhLCw+TSjVn2/5kS7KvpG23iluCf0XDaSmlRE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLee83u9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733715667; x=1765251667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncK/sE8+KnlE+XPzzVk25YCDyXg/f1NqF+jwwsC606M=;
  b=ZLee83u9uCmCkBQNj9EVe2Y22ErNStep4JeyEtHf1aqc2BL6uU9h/nXZ
   ze900PQZQjWWs7mkvhWHTr2+L4rpvG2MEw8dQ06OiSDwI08/rfWfX8V6n
   T0C4tuiA5c92PCh7IHFcI0naPcghgADlASA/EKyVEVzqr9H3d6Q5SIWPu
   rg8j4a69s60iTwjCQ2PxtPDe38J8Lpnbq3tWE5rxQE14XJyx0T2zPxex8
   6oY+kSLY6N2XRxXJjXPMqf8OIQQ0LI3iVkdTTcTKq4oS/XP4qybM/lPAN
   ZYJx3N/KAOlx/60C35o97t5bGm5vMZkWtAJJh0Ga9Y/8wfpBNak1DI5fc
   A==;
X-CSE-ConnectionGUID: 0tBkZmHDRWetxi86H/BPDg==
X-CSE-MsgGUID: Q82HfI5PQFuTVfLR+rncLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33889113"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33889113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:41:06 -0800
X-CSE-ConnectionGUID: X3YHOIjOT4KxtkQC+kKXTQ==
X-CSE-MsgGUID: nkT5gCzYSmOuxlFtB3DBpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95295523"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 19:41:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUdn-0003kB-0K;
	Mon, 09 Dec 2024 03:40:59 +0000
Date: Mon, 9 Dec 2024 11:40:50 +0800
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
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <202412070721.9tZI9Ogl-lkp@intel.com>
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
config: arc-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070721.9tZI9Ogl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070721.9tZI9Ogl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070721.9tZI9Ogl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/dwi_bl.c: In function 'dwi_bl_update_status':
>> drivers/video/backlight/dwi_bl.c:46:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      46 |         cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
         |                ^~~~~~~~~~
   drivers/video/backlight/dwi_bl.c: In function 'dwi_bl_get_brightness':
>> drivers/video/backlight/dwi_bl.c:61:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      61 |         return FIELD_GET(DWI_BL_CMD_DATA, cmd);
         |                ^~~~~~~~~
   cc1: some warnings being treated as errors


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

