Return-Path: <linux-leds+bounces-1877-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D24059047AA
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 01:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5611F23ECF
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 23:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBC0155CB4;
	Tue, 11 Jun 2024 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EE9N4I9p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF71553B5;
	Tue, 11 Jun 2024 23:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718148557; cv=none; b=VWS1Ec5Vk05yVUUhJLJRvJPUx1sQ+mCq6QKFuJspjEqMZCkybPDWv/JozBmoA06QL6pgFfqXzMzCcztU1yHM1gbiTiLXkZUBUjZ5DBudXahzXDVJxQg2CP2eVglBvnjEHR3WBQqNl8Yb5LcTBce8MOd681hqGxeunZgzX/4RB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718148557; c=relaxed/simple;
	bh=cEgxiPt0rjuOFF/CkNhjSSJ5TFsQJlMXM2Cu0DWFNLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvLXIzB+j9pob6ie4leH9y4e2c3lmv+Zm0pZ4+RJrPL8PWnvWakg3Cnr8xgO9n7wuDM4P5M2a/4ySg5wFoxYf6H+NwYFv8f5Slb/RhzEWpzGcc001bbAKAbvoUW6NJ7cOCQt1T4FIAO2tG1lTsfTYubSSqBibKF++gTkdf9r3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EE9N4I9p; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718148555; x=1749684555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEgxiPt0rjuOFF/CkNhjSSJ5TFsQJlMXM2Cu0DWFNLQ=;
  b=EE9N4I9ppYOeBo11fk3TP4kgywE5B+Ykv60BgbnalAxJx/9RSBPNpQR5
   5a0eBJLMol4a/vFRncOdTPf6V+KPT3vG1CsZ252UYVO3nt28bJjxJ4dus
   j0An95zgKP+4Vw2qDAF2zLq2/UgQ0Mg/1Tw08EfOiJZ3yqGCUlZNF3GZy
   piN0pJ2QnfoU4ZIjXRgZkbHJSoNJQWZNOss3AMwD71JFmm/5q+VBvuTck
   dsEAjyYIxY5PmYHP18fO/jajeaz67KEux0UEe+Yo69EfFivJb7SP/RhK/
   1aI60aOdR95bligMyK9SGHC7SKmiLdQ1gqi9IMidIFGwQuK6HYtTQJTfk
   A==;
X-CSE-ConnectionGUID: 3x9cEZrqSkyh3yF7mEJBpA==
X-CSE-MsgGUID: ZfN7FptgQOa5iaAIVPI+Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15017165"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="15017165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:29:15 -0700
X-CSE-ConnectionGUID: s03IGNquQmG7GjL3OuQ8Qg==
X-CSE-MsgGUID: g4avmVaVSbePBziobpFHyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="40301805"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2024 16:29:12 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHAvN-0000zW-2n;
	Tue, 11 Jun 2024 23:29:09 +0000
Date: Wed, 12 Jun 2024 07:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>, pavel@ucw.cz, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, wyx137120466@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] leds: add mp3326 driver
Message-ID: <202406120751.SskLd0jn-lkp@intel.com>
References: <20240611083236.1609-3-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611083236.1609-3-Yuxi.Wang@monolithicpower.com>

Hi Yuxi,

kernel test robot noticed the following build errors:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on linus/master v6.10-rc3 next-20240611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuxi-Wang/dt-bindings-leds-add-mps-mp3326-LED/20240611-165810
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
patch link:    https://lore.kernel.org/r/20240611083236.1609-3-Yuxi.Wang%40monolithicpower.com
patch subject: [PATCH V2 2/2] leds: add mp3326 driver
config: s390-randconfig-r081-20240612 (https://download.01.org/0day-ci/archive/20240612/202406120751.SskLd0jn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120751.SskLd0jn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120751.SskLd0jn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/leds/leds-mp3326.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:1856:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/leds/leds-mp3326.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/leds/leds-mp3326.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/leds/leds-mp3326.c:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/leds/leds-mp3326.c:232:41: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     232 |                         chip->regmap_fields[led->subled_info[i].channel]
         |                                                              ^
   drivers/leds/leds-mp3326.c:220:7: note: initialize the variable 'i' to silence this warning
     220 |         int i;
         |              ^
         |               = 0
>> drivers/leds/leds-mp3326.c:493:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'int (struct device *, struct device_attribute *, char *)' [-Wincompatible-function-pointer-types]
     493 | static DEVICE_ATTR_RW(led_pwm);
         |        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:132:45: note: expanded from macro 'DEVICE_ATTR_RW'
     132 |         struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:138:46: note: expanded from macro '__ATTR_RW'
     138 | #define __ATTR_RW(_name) __ATTR(_name, 0644, _name##_show, _name##_store)
         |                                              ^~~~~~~~~~~~
   <scratch space>:105:1: note: expanded from here
     105 | led_pwm_show
         | ^~~~~~~~~~~~
   include/linux/sysfs.h:104:10: note: expanded from macro '__ATTR'
     104 |         .show   = _show,                                                \
         |                   ^~~~~
>> drivers/leds/leds-mp3326.c:493:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, const char *, size_t)' (aka 'long (*)(struct device *, struct device_attribute *, const char *, unsigned long)') with an expression of type 'int (struct device *, struct device_attribute *, const char *, size_t)' (aka 'int (struct device *, struct device_attribute *, const char *, unsigned long)') [-Wincompatible-function-pointer-types]
     493 | static DEVICE_ATTR_RW(led_pwm);
         |        ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:132:45: note: expanded from macro 'DEVICE_ATTR_RW'
     132 |         struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:138:60: note: expanded from macro '__ATTR_RW'
     138 | #define __ATTR_RW(_name) __ATTR(_name, 0644, _name##_show, _name##_store)
         |                                                            ^~~~~~~~~~~~~
   <scratch space>:106:1: note: expanded from here
     106 | led_pwm_store
         | ^~~~~~~~~~~~~
   include/linux/sysfs.h:105:11: note: expanded from macro '__ATTR'
     105 |         .store  = _store,                                               \
         |                   ^~~~~~
   drivers/leds/leds-mp3326.c:494:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'int (struct device *, struct device_attribute *, char *)' [-Wincompatible-function-pointer-types]
     494 | static DEVICE_ATTR_RW(led_enable);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:132:45: note: expanded from macro 'DEVICE_ATTR_RW'
     132 |         struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:138:46: note: expanded from macro '__ATTR_RW'
     138 | #define __ATTR_RW(_name) __ATTR(_name, 0644, _name##_show, _name##_store)
         |                                              ^~~~~~~~~~~~
   <scratch space>:109:1: note: expanded from here
     109 | led_enable_show
         | ^~~~~~~~~~~~~~~
   include/linux/sysfs.h:104:10: note: expanded from macro '__ATTR'
     104 |         .show   = _show,                                                \
         |                   ^~~~~
   drivers/leds/leds-mp3326.c:494:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, const char *, size_t)' (aka 'long (*)(struct device *, struct device_attribute *, const char *, unsigned long)') with an expression of type 'int (struct device *, struct device_attribute *, const char *, size_t)' (aka 'int (struct device *, struct device_attribute *, const char *, unsigned long)') [-Wincompatible-function-pointer-types]
     494 | static DEVICE_ATTR_RW(led_enable);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:132:45: note: expanded from macro 'DEVICE_ATTR_RW'
     132 |         struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:138:60: note: expanded from macro '__ATTR_RW'
     138 | #define __ATTR_RW(_name) __ATTR(_name, 0644, _name##_show, _name##_store)
         |                                                            ^~~~~~~~~~~~~
   <scratch space>:110:1: note: expanded from here
     110 | led_enable_store
         | ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:105:11: note: expanded from macro '__ATTR'
     105 |         .store  = _store,                                               \
         |                   ^~~~~~
   drivers/leds/leds-mp3326.c:495:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'int (struct device *, struct device_attribute *, char *)' [-Wincompatible-function-pointer-types]
     495 | static DEVICE_ATTR_RO(led_short_fault);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:136:45: note: expanded from macro 'DEVICE_ATTR_RO'
     136 |         struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:10: note: expanded from macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~~~~~~~~
   <scratch space>:114:1: note: expanded from here
     114 | led_short_fault_show
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-mp3326.c:496:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'int (struct device *, struct device_attribute *, char *)' [-Wincompatible-function-pointer-types]
     496 | static DEVICE_ATTR_RO(led_open_fault);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:136:45: note: expanded from macro 'DEVICE_ATTR_RO'
     136 |         struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:117:10: note: expanded from macro '__ATTR_RO'
     117 |         .show   = _name##_show,                                         \
         |                   ^~~~~~~~~~~~
   <scratch space>:117:1: note: expanded from here
     117 | led_open_fault_show
         | ^~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-mp3326.c:686:11: error: incompatible function pointer types initializing 'int (*)(struct i2c_client *, const struct i2c_device_id *)' with an expression of type 'int (struct i2c_client *)' [-Wincompatible-function-pointer-types]
     686 |         .probe = mp3326_leds_probe,
         |                  ^~~~~~~~~~~~~~~~~
   18 warnings and 7 errors generated.


vim +493 drivers/leds/leds-mp3326.c

   492	
 > 493	static DEVICE_ATTR_RW(led_pwm);
   494	static DEVICE_ATTR_RW(led_enable);
   495	static DEVICE_ATTR_RO(led_short_fault);
   496	static DEVICE_ATTR_RO(led_open_fault);
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

