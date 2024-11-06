Return-Path: <linux-leds+bounces-3291-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB39BDBC1
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 03:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80711C20F5A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 02:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FFB18E377;
	Wed,  6 Nov 2024 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U26jhd04"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0192318E357;
	Wed,  6 Nov 2024 02:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730858643; cv=none; b=Td1SWc6aw/24OdVsyI7FGpsAQUF6eMlWvea7Tlvuh64shP6t42ExlRLG8aTG/LBJZ8OzU0P5sWLNr1dV4y247LpZggQYe+k6ncb93jHKHCMuc0TCnRkIaMHTQLHVw9tzjPe7URC9C3x+3ZdeRiE9pVLRVk+ocekGzeQNgzdavac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730858643; c=relaxed/simple;
	bh=yr5Ph1Tihi1w7qUuN1EN22QtdOscYJpSIjS6vBaq1m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idhzMZkuzDhGrlqC8nPAHhYUUj4nAzDJ4Ozhs/Kr9R0VXodXyeR0Bm5RZ51EPl5PXIgNUGUoUvoa3TjWNv6xtaSYhVg0HGx51tEz80gVOy8XZhllknZkFJCh/+xZ572FQcpCPDToO+Se4OoHj5Yd3cWMsSBomr93Uhqqzii3vQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U26jhd04; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730858642; x=1762394642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yr5Ph1Tihi1w7qUuN1EN22QtdOscYJpSIjS6vBaq1m4=;
  b=U26jhd04PpPfWzl2AbR6Oj8bNEbC9Mhvhl6UDydg8/AzAXB/SCkRzPVw
   DGuIbNMldb9OMBnC0/TlBOBH20RNmnm8OZNqDRM6JFfcXR4s+lZd0g1vN
   HyoRtd5nS9t/Su3VZ9t+Nnb8vXrqI4ayczHDyQAZisyo2PR2Ox6Q2V+8l
   OGG/pSLe9xcuVzpUhI8Y6ZwKnyES+A+hyQ45U4Kch8KxVhDGd9qtXTnXj
   O33Z6+UH4DBwnRe5kVb5fAfhqafMT6BZ0SZ9Y1FkTSoGcJ6/5azCfDwNC
   59faYf4SOrsURZJUr9saBgTBLEKiqVLUd4YHzbJkJGkdx+uDqWr1JNhY1
   A==;
X-CSE-ConnectionGUID: awJhk+3BQ+uT9amShg67dw==
X-CSE-MsgGUID: 9U/AhoQdSF2CYLIO+AqZCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="56036262"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="56036262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:04:01 -0800
X-CSE-ConnectionGUID: n5hkPUTeQeOgsBhL/4vAJA==
X-CSE-MsgGUID: tQ/8Oae2SmidS+ia16R7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84600421"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2024 18:03:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8VOl-000mjt-1k;
	Wed, 06 Nov 2024 02:03:55 +0000
Date: Wed, 6 Nov 2024 10:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] [PATCH v5] leds: Add LED1202 I2C driver
Message-ID: <202411060929.dw469eSa-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241106/202411060929.dw469eSa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060929.dw469eSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060929.dw469eSa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/leds/leds-st1202.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/leds/leds-st1202.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/leds/leds-st1202.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/leds/leds-st1202.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/leds/leds-st1202.c:350:28: warning: missing terminating '"' character [-Winvalid-pp-token]
     350 |                         dev_err_probe(dev, err, "Failed to register LED class dev,
         |                                                 ^
>> drivers/leds/leds-st1202.c:350:28: error: expected expression
   drivers/leds/leds-st1202.c:351:17: warning: missing terminating '"' character [-Winvalid-pp-token]
     351 |                                         error: %d\n", err);
         |                                                    ^
   9 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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
   351						error: %d\n", err);
   352				return err;
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

