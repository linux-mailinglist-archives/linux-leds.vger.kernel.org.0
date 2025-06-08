Return-Path: <linux-leds+bounces-4757-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD7EAD11BE
	for <lists+linux-leds@lfdr.de>; Sun,  8 Jun 2025 11:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4EA3ABEDC
	for <lists+linux-leds@lfdr.de>; Sun,  8 Jun 2025 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38B91FBEBE;
	Sun,  8 Jun 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDPPac+P"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02188EEBB;
	Sun,  8 Jun 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749376072; cv=none; b=KhuhmKEfWhN1/wvWtr1hOh5ggJeSXGfHaQGzcHggj9E3QN0+4QHxZjTi5OAes3WITBTsZMv4Ga4+eSxc6sLVnuqA0WPyLj9eR6s2cGAYHqHfwsYXki3o65ZWRU2Xk6Xww3RxJmIgrbWfeU1RjExdVN1vbgnoIIRbQwg83IPYpuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749376072; c=relaxed/simple;
	bh=rpNI3IMbC6DwEi4B7NJPMihppGsO9Qhp2pkATeCsjOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JahFb958e2IQI7juifkCTBczhyrTKQVkOfMGahaXzV9K+gJudPj0TDgZcUa26xzC2N/hzru/FHqlzOa7LGs0E1jUyl1nIq8Po+WxRyc/Yr3h6IOFmAZn3eFAS7HdiN8tElsofiWb4/gIhgCrUwXF4KFVY2JCmZ6YOYE46tPmkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDPPac+P; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749376070; x=1780912070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rpNI3IMbC6DwEi4B7NJPMihppGsO9Qhp2pkATeCsjOE=;
  b=JDPPac+PePkgqKXKANs3XSVK8Qt1BCz0oUe+TAg3qJ2L29StitRfVKAN
   BRf7q/L+rybwyj9QGoxy/NwE4QUI/yc+DUuIaLKV5eVRJMz7piEejVY2e
   F3OqkorRUlG5o6Kh9OC/Zygp1rd0lLMtWrcKRXLF4+9UBOtJuNRcy0ua8
   p1L6prsTuQHgiuBEIyYvTSheidYGAnHwLEomtJkH4bqL73UumSx2zWCT2
   f0bXHaIHsGq/4sIS7mjl0qzTawym4RZFV246jafYKPRdkagm1r9uFkMcT
   SZZjnLy1fuk16inyYM3sGG4cVvw9czkBxPO5lDhS1ZO3vrV+Q/sfWXQgJ
   Q==;
X-CSE-ConnectionGUID: lnJs9U4CRCKBtgb0JhosLA==
X-CSE-MsgGUID: oiQkpsc2SiK2xG5db/EYcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="55261174"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="55261174"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 02:47:49 -0700
X-CSE-ConnectionGUID: 65JjCYvHRB67cFOYb1OaCw==
X-CSE-MsgGUID: kOnhTtSkQtSNSZY0g05BbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="151107146"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2025 02:47:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOCcy-0006JF-1v;
	Sun, 08 Jun 2025 09:47:44 +0000
Date: Sun, 8 Jun 2025 17:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Timmermann <linux@timmermann.space>, lee@kernel.org,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@timmermann.space
Subject: Re: [PATCH v4 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <202506081754.yXYFC7WL-lkp@intel.com>
References: <20250607215049.29259-3-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607215049.29259-3-linux@timmermann.space>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Timmermann/dt-bindings-leds-Add-new-as3668-support/20250608-055330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250607215049.29259-3-linux%40timmermann.space
patch subject: [PATCH v4 2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250608/202506081754.yXYFC7WL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081754.yXYFC7WL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081754.yXYFC7WL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-as3668.c:137:16: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |         chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_id2);
         |                       ^
   1 error generated.


vim +/FIELD_GET +137 drivers/leds/leds-as3668.c

   117	
   118	static int as3668_probe(struct i2c_client *client)
   119	{
   120		u8 chip_id1, chip_id2, chip_serial, chip_rev;
   121		struct as3668 *as3668;
   122	
   123		/* Check for sensible i2c address */
   124		if (client->addr != 0x42)
   125			return dev_err_probe(&client->dev, -EFAULT,
   126					     "unexpected address for as3668 device\n");
   127	
   128		/* Read identifier from chip */
   129		chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
   130	
   131		if (chip_id1 != AS3668_CHIP_IDENT)
   132			return dev_err_probe(&client->dev, -ENODEV,
   133					"chip reported wrong id: 0x%tx\n", chip_id1);
   134	
   135		/* Check the revision*/
   136		chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
 > 137		chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_id2);
   138		chip_rev = FIELD_GET(AS3668_CHIP_ID2_REV_MASK, chip_id2);
   139	
   140		if (chip_rev != AS3668_CHIP_REV1)
   141			dev_warn(&client->dev, "unexpected chip revision\n");
   142	
   143		/* Print out information about the chip */
   144		dev_dbg(&client->dev,
   145			"chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
   146			chip_id1, chip_id2, chip_serial, chip_rev);
   147	
   148		as3668 = devm_kzalloc(&client->dev, struct_size(as3668, leds, AS3668_MAX_LEDS), GFP_KERNEL);
   149		as3668->client = client;
   150	
   151		as3668_dt_init(as3668);
   152	
   153		/* Initialize the chip */
   154		as3668_write_value(client, AS3668_CURRX_CONTROL, 0x55);
   155		as3668_write_value(client, AS3668_CURR1, 0x00);
   156		as3668_write_value(client, AS3668_CURR2, 0x00);
   157		as3668_write_value(client, AS3668_CURR3, 0x00);
   158		as3668_write_value(client, AS3668_CURR4, 0x00);
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

