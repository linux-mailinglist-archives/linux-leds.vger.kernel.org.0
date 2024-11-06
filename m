Return-Path: <linux-leds+bounces-3289-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2C9BDA6C
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 01:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11FB1C22CCE
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 00:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1E47DA6F;
	Wed,  6 Nov 2024 00:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URx8y0+G"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F819502B1;
	Wed,  6 Nov 2024 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730853543; cv=none; b=sd9pwcxwh89DyA+9WaN41qYtu5+OMweGZvEBE1fH3F2++W4JrYoKh6i/ddE/xPCRKesrUnxWIo3KnsRK35KY4BbAsQv0NWVjJO4yp7KG0DjbZrzaIdBXjPgwobm7qNxhOLw/4iHwFZuBGDq/bZhDfsCkHwXKGQVZwwKaWqms158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730853543; c=relaxed/simple;
	bh=CbnbHhZ5g+AnISB2qi8+n7pIi443xyPrj0/svOudxF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmhC+OLLwK24t/NHvdNVUVOCAp3iAkX9yvtfgSGzR3blQBeDj9Q6wBXxgA7ZpkCGXWkqOTK+y2YnvTlOE1S1Enm+HsmW1lZHlZjVtpPbBtXcnrpc/ry52ql+ms/yZnmjQ1fP/NvDlBGlF24+TJn0FIHd8CIn4yaXMp9wlrPBUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URx8y0+G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730853541; x=1762389541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CbnbHhZ5g+AnISB2qi8+n7pIi443xyPrj0/svOudxF8=;
  b=URx8y0+GKu1JcvX7vqMpnbItOYVw4YpfIpvSdun8/XFkbdjQfhVd8Aqf
   ggUBJ0zyPCROBNC7qfIG8zN9wfSgeVLHWhvn6Oki/Jf+hCRyYjfon1zWc
   FmiBlc7oVI68dvyyNy5sIikVojXDhA/oDOOKi3zAaCOpGuyP58w8DkHtt
   3KeufQRppw4tIyPtGOiaT1mv+/wM53mGO22zw/zrmhBFyok0RXWZfKbZP
   kDkFoIqK2WUbbCBfozlRY6vh08A4jNtyVnkawDp0YYTt79j8KDFnUda9Y
   D6b60doaipPFmEJCV0zpBpWiuwnIUZ0K6feBRYU/7wyZWXw0wVLLLZ/YX
   w==;
X-CSE-ConnectionGUID: sqdOaDe3TvOS1FmJlAhhtQ==
X-CSE-MsgGUID: Uh4bKZtIT+SSoa5vYInGbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41227719"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="41227719"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:38:57 -0800
X-CSE-ConnectionGUID: CMQEnPN1R86AFU17tTOaog==
X-CSE-MsgGUID: ht2dK8EgRFGQ7ou2Yl+MAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88793876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2024 16:38:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8U4R-000me5-2a;
	Wed, 06 Nov 2024 00:38:51 +0000
Date: Wed, 6 Nov 2024 08:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] [PATCH v5] leds: Add LED1202 I2C driver
Message-ID: <202411060859.fqkOY75Z-lkp@intel.com>
References: <20241105161041.4813-3-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105161041.4813-3-vicentiu.galanopulo@remote-tech.co.uk>

Hi Vicentiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vicentiu-Galanopulo/dt-bindings-leds-Add-LED1202-LED-Controller/20241106-001305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20241105161041.4813-3-vicentiu.galanopulo%40remote-tech.co.uk
patch subject: [PATCH 3/3] [PATCH v5] leds: Add LED1202 I2C driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241106/202411060859.fqkOY75Z-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060859.fqkOY75Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060859.fqkOY75Z-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/leds/leds-st1202.c: In function 'st1202_dt_init':
>> drivers/leds/leds-st1202.c:350:49: warning: missing terminating " character
     350 |                         dev_err_probe(dev, err, "Failed to register LED class dev,
         |                                                 ^
>> drivers/leds/leds-st1202.c:350:49: error: missing terminating " character
     350 |                         dev_err_probe(dev, err, "Failed to register LED class dev,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-st1202.c:351:41: error: 'error' undeclared (first use in this function); did you mean 'err'?
     351 |                                         error: %d\n", err);
         |                                         ^~~~~
         |                                         err
   drivers/leds/leds-st1202.c:351:41: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/leds/leds-st1202.c:351:46: error: expected ')' before ':' token
     351 |                                         error: %d\n", err);
         |                                              ^
         |                                              )
   drivers/leds/leds-st1202.c:350:38: note: to match this '('
     350 |                         dev_err_probe(dev, err, "Failed to register LED class dev,
         |                                      ^
>> drivers/leds/leds-st1202.c:351:50: error: stray '\' in program
     351 |                                         error: %d\n", err);
         |                                                  ^
   drivers/leds/leds-st1202.c:351:52: warning: missing terminating " character
     351 |                                         error: %d\n", err);
         |                                                    ^
   drivers/leds/leds-st1202.c:351:52: error: missing terminating " character
     351 |                                         error: %d\n", err);
         |                                                    ^~~~~~~~
>> drivers/leds/leds-st1202.c:352:36: error: expected ';' before '}' token
     352 |                         return err;
         |                                    ^
         |                                    ;
     353 |                 }
         |                 ~                   


vim +350 drivers/leds/leds-st1202.c

   318	
   319	static int st1202_dt_init(struct st1202_chip *chip)
   320	{
   321		struct device *dev = &chip->client->dev;
   322		struct st1202_led *led;
   323		int err, reg;
   324	
   325		for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
   326			struct led_init_data init_data = {};
   327	
   328			err = of_property_read_u32(child, "reg", &reg);
   329			if (err) {
   330				of_node_put(child);
   331				return dev_err_probe(dev, err, "Invalid register, error: %d\n", err);
   332			}
   333	
   334			led = &chip->leds[reg];
   335			led->is_active = true;
   336			led->fwnode = of_fwnode_handle(child);
   337	
   338			led->led_cdev.max_brightness = U8_MAX;
   339			led->led_cdev.brightness_set_blocking = st1202_led_set;
   340			led->led_cdev.pattern_set = st1202_led_pattern_set;
   341			led->led_cdev.pattern_clear = st1202_led_pattern_clear;
   342			led->led_cdev.default_trigger = "pattern";
   343	
   344			init_data.fwnode = led->fwnode;
   345			init_data.devicename = "st1202";
   346			init_data.default_label = ":";
   347			err = devm_led_classdev_register_ext(dev,
   348						&led->led_cdev, &init_data);
   349			if (err < 0) {
 > 350				dev_err_probe(dev, err, "Failed to register LED class dev,
 > 351						error: %d\n", err);
 > 352				return err;
   353			}
   354			led->led_cdev.brightness_set = st1202_brightness_set;
   355			led->led_cdev.brightness_get = st1202_brightness_get;
   356		}
   357	
   358		return 0;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

