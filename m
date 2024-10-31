Return-Path: <linux-leds+bounces-3215-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8B9B7700
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 10:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6689A285A08
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 09:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82021946A8;
	Thu, 31 Oct 2024 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lY+YTLhI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA4156967;
	Thu, 31 Oct 2024 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730365333; cv=none; b=FMMlgAX2n7Y+TfiL8qNrXdOUJed78E8+BNGZUjWzIHv8HlNSQO3r2bo73K/Y5vJggRFb5C7uMV3gvMuypZwSJx94gUjTYhYCdSO5M6kGZmTVH8LyFspvHDCkQh0EPBl4CHOElbFZvP4AC4zHknMlPpEshUThMkiFxHIHFR9NBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730365333; c=relaxed/simple;
	bh=7wg0X9kZZS7PBL5jMc02efri3UqXq/hrwkpInqVrfxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3aB8nXgwpN40EyZZ131k/tSVI1vYmAzTaVLV9JGA7LDmbVLyPCfZZ6Qs+KXt1CgSZJkIYxKxPzJSrWkyuVv4DepZEv+de5KK1tLNGaEiFjbOGnEameto1eq3aaoRcJg2aql29ZHaS957eueREdJKh0iOBLyzbZZJB3yvhoWNYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lY+YTLhI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730365331; x=1761901331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7wg0X9kZZS7PBL5jMc02efri3UqXq/hrwkpInqVrfxI=;
  b=lY+YTLhIWk9yTTuUDUV5/mDawAb+PHZaCzoGCS6BYJ6Kfk1KsCoAsvIm
   SmwwiADHuNDkqnA1DSgracaLxFyZgcsmFlr/ZeHUOJHvSU1PHYb696D4Y
   jrjmyKdTAefpshaBpz3KTFYE88/Dm+zdHIYkv2QGUrZl//M+o7/4HN1a3
   W7enG+j+p9UontoBPxr6zZ5/C+iWNEONIFgGzjqj5qQDAtoyWRoQn8UUT
   x/WzPmSRHKR0fG2znTtmZZsKW9EJrab/iTE50bEYcxPXqRuAX34N6KTg3
   n6Xo52AVv5mu70Ah81NxC2XfEnBJag64VLAoa36sS3KVOVperm6VSqwMd
   A==;
X-CSE-ConnectionGUID: tOpGHr4JTQ2upuri07vCJw==
X-CSE-MsgGUID: YRBqwoCfTQmqR3WSr22eBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40668913"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40668913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 02:02:10 -0700
X-CSE-ConnectionGUID: t/ukF9+VTSeT169OFp800A==
X-CSE-MsgGUID: yGJx0jYmROePN3OiTnGSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="120028737"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2024 02:02:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6R47-000ftZ-1H;
	Thu, 31 Oct 2024 09:02:03 +0000
Date: Thu, 31 Oct 2024 17:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH leds v4 02/12] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <202410311612.0OkxKVgC-lkp@intel.com>
References: <20241029135621.12546-3-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029135621.12546-3-kabel@kernel.org>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc5]
[cannot apply to lee-leds/for-leds-next robh/for-next next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Beh-n/turris-omnia-mcu-interface-h-Move-command-execution-function-to-global-header/20241029-215858
base:   linus/master
patch link:    https://lore.kernel.org/r/20241029135621.12546-3-kabel%40kernel.org
patch subject: [PATCH leds v4 02/12] leds: turris-omnia: Use command execution functions from the MCU driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241031/202410311612.0OkxKVgC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311612.0OkxKVgC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311612.0OkxKVgC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/leds/leds-turris-omnia.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-turris-omnia.c:409:12: warning: stack frame size (2064) exceeds limit (2048) in 'omnia_leds_probe' [-Wframe-larger-than]
     409 | static int omnia_leds_probe(struct i2c_client *client)
         |            ^
   5 warnings generated.


vim +/omnia_leds_probe +409 drivers/leds/leds-turris-omnia.c

43e9082fbccc7d Marek Behún         2023-09-18  408  
4934630409cb60 Uwe Kleine-König    2022-11-18 @409  static int omnia_leds_probe(struct i2c_client *client)
089381b27abe28 Marek Behún         2020-07-23  410  {
089381b27abe28 Marek Behún         2020-07-23  411  	struct device *dev = &client->dev;
122d57e2960c81 Krzysztof Kozlowski 2024-08-16  412  	struct device_node *np = dev_of_node(dev);
089381b27abe28 Marek Behún         2020-07-23  413  	struct omnia_leds *leds;
089381b27abe28 Marek Behún         2020-07-23  414  	struct omnia_led *led;
089381b27abe28 Marek Behún         2020-07-23  415  	int ret, count;
089381b27abe28 Marek Behún         2020-07-23  416  
089381b27abe28 Marek Behún         2020-07-23  417  	count = of_get_available_child_count(np);
089381b27abe28 Marek Behún         2020-07-23  418  	if (!count) {
089381b27abe28 Marek Behún         2020-07-23  419  		dev_err(dev, "LEDs are not defined in device tree!\n");
089381b27abe28 Marek Behún         2020-07-23  420  		return -ENODEV;
089381b27abe28 Marek Behún         2020-07-23  421  	} else if (count > OMNIA_BOARD_LEDS) {
089381b27abe28 Marek Behún         2020-07-23  422  		dev_err(dev, "Too many LEDs defined in device tree!\n");
089381b27abe28 Marek Behún         2020-07-23  423  		return -EINVAL;
089381b27abe28 Marek Behún         2020-07-23  424  	}
089381b27abe28 Marek Behún         2020-07-23  425  
089381b27abe28 Marek Behún         2020-07-23  426  	leds = devm_kzalloc(dev, struct_size(leds, leds, count), GFP_KERNEL);
089381b27abe28 Marek Behún         2020-07-23  427  	if (!leds)
089381b27abe28 Marek Behún         2020-07-23  428  		return -ENOMEM;
089381b27abe28 Marek Behún         2020-07-23  429  
089381b27abe28 Marek Behún         2020-07-23  430  	leds->client = client;
089381b27abe28 Marek Behún         2020-07-23  431  	i2c_set_clientdata(client, leds);
089381b27abe28 Marek Behún         2020-07-23  432  
43e9082fbccc7d Marek Behún         2023-09-18  433  	ret = omnia_mcu_get_features(client);
43e9082fbccc7d Marek Behún         2023-09-18  434  	if (ret < 0) {
43e9082fbccc7d Marek Behún         2023-09-18  435  		dev_err(dev, "Cannot determine MCU supported features: %d\n",
43e9082fbccc7d Marek Behún         2023-09-18  436  			ret);
43e9082fbccc7d Marek Behún         2023-09-18  437  		return ret;
43e9082fbccc7d Marek Behún         2023-09-18  438  	}
43e9082fbccc7d Marek Behún         2023-09-18  439  
43e9082fbccc7d Marek Behún         2023-09-18  440  	leds->has_gamma_correction = ret & FEAT_LED_GAMMA_CORRECTION;
43e9082fbccc7d Marek Behún         2023-09-18  441  	if (!leds->has_gamma_correction) {
43e9082fbccc7d Marek Behún         2023-09-18  442  		dev_info(dev,
43e9082fbccc7d Marek Behún         2023-09-18  443  			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
43e9082fbccc7d Marek Behún         2023-09-18  444  		dev_info(dev,
43e9082fbccc7d Marek Behún         2023-09-18  445  			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
43e9082fbccc7d Marek Behún         2023-09-18  446  	}
43e9082fbccc7d Marek Behún         2023-09-18  447  
089381b27abe28 Marek Behún         2020-07-23  448  	mutex_init(&leds->lock);
089381b27abe28 Marek Behún         2020-07-23  449  
cbd6954fecbeb8 Marek Behún         2023-09-18  450  	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
cbd6954fecbeb8 Marek Behún         2023-09-18  451  	if (ret < 0) {
cbd6954fecbeb8 Marek Behún         2023-09-18  452  		dev_err(dev, "Cannot register private LED trigger: %d\n", ret);
cbd6954fecbeb8 Marek Behún         2023-09-18  453  		return ret;
cbd6954fecbeb8 Marek Behún         2023-09-18  454  	}
cbd6954fecbeb8 Marek Behún         2023-09-18  455  
089381b27abe28 Marek Behún         2020-07-23  456  	led = &leds->leds[0];
122d57e2960c81 Krzysztof Kozlowski 2024-08-16  457  	for_each_available_child_of_node_scoped(np, child) {
089381b27abe28 Marek Behún         2020-07-23  458  		ret = omnia_led_register(client, led, child);
122d57e2960c81 Krzysztof Kozlowski 2024-08-16  459  		if (ret < 0)
089381b27abe28 Marek Behún         2020-07-23  460  			return ret;
089381b27abe28 Marek Behún         2020-07-23  461  
089381b27abe28 Marek Behún         2020-07-23  462  		led += ret;
089381b27abe28 Marek Behún         2020-07-23  463  	}
089381b27abe28 Marek Behún         2020-07-23  464  
089381b27abe28 Marek Behún         2020-07-23  465  	return 0;
089381b27abe28 Marek Behún         2020-07-23  466  }
089381b27abe28 Marek Behún         2020-07-23  467  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

