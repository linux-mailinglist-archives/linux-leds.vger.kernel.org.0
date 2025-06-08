Return-Path: <linux-leds+bounces-4756-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5897BAD118C
	for <lists+linux-leds@lfdr.de>; Sun,  8 Jun 2025 10:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F01169350
	for <lists+linux-leds@lfdr.de>; Sun,  8 Jun 2025 08:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706F51F4174;
	Sun,  8 Jun 2025 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5ga3o4F"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C651F4608;
	Sun,  8 Jun 2025 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749371087; cv=none; b=OQSO+3z5+nroTgbjWOLW0nHXINWzJjT8qK5TFiblVdpcHzgoFA8U0z6WA7Y+DaUHX6KmhzLyIO+wMlVpLqy52cTtVVqnQ1JpdxnxotUI70LfJGTJyT1rY0x9qv2Epp/Hs+LmWu+6LVSi+nTWCgtYHnBZ7j2KrWV8Jqy4IfnDN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749371087; c=relaxed/simple;
	bh=pzcUpgNfL5aXJSUVhcbhvobo76CDYDOSkRzo00jG1kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoNcoc7n9+wlzy+qiyRYZD+ppYoZh9NwsqmEdHdUwzAoTyzHpiB6Fffb0lRkfXVZJmPdn8uNhrIdrh0T9uVROnf6QKcqmoPMTLg9UyTDjtSIvx2lCZBISJmeST+x3jbDHo0Lrtap+gjrW+mJ8a9Y9ziShlxyzIVdXIz2vSJxZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5ga3o4F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749371085; x=1780907085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pzcUpgNfL5aXJSUVhcbhvobo76CDYDOSkRzo00jG1kw=;
  b=g5ga3o4FLfd7fuc9GqUker0/mcwPirrK1b+aQ3x/h1EQjX5u0yNWt9VQ
   8eiGbuysnC86Smj3R1DPip0f2ZN5rmebQKEsB6ffVDKNC4tLb1tKx/0Bd
   LKqchi1jA9nsiJeEoJ2owtbZLja6org3KyOCdI8DJZRQuQeWs1nzlVbpJ
   mDvuheYIrbtcFMXvbtahVpBy94Q3ZQiQCqVO9Ak5O1K2IYFPEVJBId47h
   j88XfYR3kCrjELTXUL+MJSjUB8NpOB+tHyL7R2hMuiQ/IS0ezs+UNw3Xk
   SD+NX1EV1QQCfwKW2C8HYi6y9GY4Kac6PkEP0Exidr+vU0HqZUeQyyFMv
   Q==;
X-CSE-ConnectionGUID: zMCGhJfmQaqmbBVcnMzDHQ==
X-CSE-MsgGUID: 4UXvILeHTpKFCZLUmSouKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51331092"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="51331092"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 01:24:44 -0700
X-CSE-ConnectionGUID: O4Si8lL5Tb+AY/qsGPs3IA==
X-CSE-MsgGUID: ap//mOuiTXO32dX0BDJp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146815666"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jun 2025 01:24:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOBKZ-0006I1-0h;
	Sun, 08 Jun 2025 08:24:39 +0000
Date: Sun, 8 Jun 2025 16:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Timmermann <linux@timmermann.space>, lee@kernel.org,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@timmermann.space
Subject: Re: [PATCH v4 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <202506081650.eFkFkBP7-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Timmermann/dt-bindings-leds-Add-new-as3668-support/20250608-055330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250607215049.29259-3-linux%40timmermann.space
patch subject: [PATCH v4 2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250608/202506081650.eFkFkBP7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081650.eFkFkBP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081650.eFkFkBP7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/leds/leds-as3668.c:8:
   drivers/leds/leds-as3668.c: In function 'as3668_write_value':
>> drivers/leds/leds-as3668.c:55:39: warning: format '%tx' expects argument of type 'unsigned ptrdiff_t', but argument 3 has type 'int' [-Wformat=]
      55 |                 dev_err(&client->dev, "error writing to reg 0x%tx, returned %d", reg, err);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/leds/leds-as3668.c:55:17: note: in expansion of macro 'dev_err'
      55 |                 dev_err(&client->dev, "error writing to reg 0x%tx, returned %d", reg, err);
         |                 ^~~~~~~
   drivers/leds/leds-as3668.c:55:65: note: format string is defined here
      55 |                 dev_err(&client->dev, "error writing to reg 0x%tx, returned %d", reg, err);
         |                                                               ~~^
         |                                                                 |
         |                                                                 long unsigned int
         |                                                               %x
   drivers/leds/leds-as3668.c: In function 'as3668_probe':
   drivers/leds/leds-as3668.c:133:62: warning: format '%tx' expects argument of type 'unsigned ptrdiff_t', but argument 4 has type 'int' [-Wformat=]
     133 |                                 "chip reported wrong id: 0x%tx\n", chip_id1);
         |                                                            ~~^     ~~~~~~~~
         |                                                              |     |
         |                                                              |     int
         |                                                              long unsigned int
         |                                                            %x
   drivers/leds/leds-as3668.c:137:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     137 |         chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_id2);
         |                       ^~~~~~~~~
   In file included from include/linux/printk.h:616,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13:
   drivers/leds/leds-as3668.c:145:17: warning: format '%tx' expects argument of type 'unsigned ptrdiff_t', but argument 4 has type 'int' [-Wformat=]
     145 |                 "chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/leds/leds-as3668.c:144:9: note: in expansion of macro 'dev_dbg'
     144 |         dev_dbg(&client->dev,
         |         ^~~~~~~
   drivers/leds/leds-as3668.c:145:31: note: format string is defined here
     145 |                 "chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
         |                             ~~^
         |                               |
         |                               long unsigned int
         |                             %x
   drivers/leds/leds-as3668.c:145:17: warning: format '%tx' expects argument of type 'unsigned ptrdiff_t', but argument 5 has type 'int' [-Wformat=]
     145 |                 "chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/leds/leds-as3668.c:144:9: note: in expansion of macro 'dev_dbg'
     144 |         dev_dbg(&client->dev,
         |         ^~~~~~~
   drivers/leds/leds-as3668.c:145:49: note: format string is defined here
     145 |                 "chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
         |                                               ~~^
         |                                                 |
         |                                                 long unsigned int
         |                                               %x
   drivers/leds/leds-as3668.c:145:17: warning: format '%tx' expects argument of type 'unsigned ptrdiff_t', but argument 6 has type 'int' [-Wformat=]
     145 |                 "chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'


vim +55 drivers/leds/leds-as3668.c

    49	
    50	static int as3668_write_value(struct i2c_client *client, u8 reg, u8 value)
    51	{
    52		int err = i2c_smbus_write_byte_data(client, reg, value);
    53	
    54		if (err)
  > 55			dev_err(&client->dev, "error writing to reg 0x%tx, returned %d", reg, err);
    56	
    57		return err;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

