Return-Path: <linux-leds+bounces-2226-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A092C318
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 20:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 110D4B231D0
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2024 18:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DE017B036;
	Tue,  9 Jul 2024 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtsPLFMw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB22BAE5
	for <linux-leds@vger.kernel.org>; Tue,  9 Jul 2024 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548477; cv=none; b=gxv56I4W4sFqap0RMkRbBI50lVS5kFW+N2IZgIm4kK1vx5iB4XxHk7E9LWcA7NpHs9o3eFM+sRmGTJpqwDE/lLx6j/kUkl+mBfKqDm3XYVQ9LjHb1TysfENabz/nShaef1x2bjZgu56hU0m+Tzz0lRZMob1SP3BZtMKHt/HkHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548477; c=relaxed/simple;
	bh=qrUzN8iAXN6LvBd2i2jNUgBvTEMvs6JsT+iLk2FnUnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNndjsJ4payjcx0HMprcsDUT6Nom3RRK1QXY8BxFQtU5zFcQOqly3+F0ZZMhRXSQSF9TZs3KhKm+mYBmPUfd6ST+qsVXgjVebJNdG6ijQ0ONwzrXfIz7v/r1hXEhsB+t95hHQbiadYXXML3DSFHlE+kuDzkrLn74jfd1KBaWJu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtsPLFMw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720548475; x=1752084475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrUzN8iAXN6LvBd2i2jNUgBvTEMvs6JsT+iLk2FnUnE=;
  b=DtsPLFMwQMThGXsGBSUYK192dlA5Z4aQYWIVhRt+8Fh4zr+4Et/EQegB
   gCaqjPZR8q/HndxZLjd3fykBT9Mk5pSSHeAVAUZckKbAZOk5GYM4JhI5v
   4EExA9l/Jk8P1nWP9By0Db9W7QVhCssB/Uz+wiNacak7w1feQa5ZivuhY
   4F16+95YQkEFUoGbCokRfUW4gsty2TKTGTxSNcz42rAMPX2xOpftfIbsV
   1K+Mebn6bLx96n0DpzaV/W1M6Xrk70oRQkIn6g4hZv4tD1lcbOYwuUtmt
   hNLAhvC+lUip5ct9K/7PhwkD24dgCF67llXsIDccvZrSeM2xNFxMe5J4D
   Q==;
X-CSE-ConnectionGUID: kAIhBI9eSe+v64MInXL65g==
X-CSE-MsgGUID: n//N0uO3QzqvN1k1Q3598Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28416734"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="28416734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 11:07:54 -0700
X-CSE-ConnectionGUID: jRBsUFI9TSasEFs/2T9CrQ==
X-CSE-MsgGUID: xaHH32hSTKCK0csP7ZOZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="48028816"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2024 11:07:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRFFl-000WyO-2f;
	Tue, 09 Jul 2024 18:07:49 +0000
Date: Wed, 10 Jul 2024 02:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 61/62] drivers/leds/leds-lp5521.c:189:15:
 error: too many arguments provided to function-like macro invocation
Message-ID: <202407100245.4payjdih-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   b9bd590268485652b928110b5543057543b5d02b
commit: efd0d1cbb8c5dd1049922e839fa7d85811facd53 [61/62] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240710/202407100245.4payjdih-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100245.4payjdih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407100245.4payjdih-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/leds/leds-lp5521.c:15:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lp5521.c:189:15: error: too many arguments provided to function-like macro invocation
     189 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
>> drivers/leds/leds-lp5521.c:189:2: error: use of undeclared identifier 'guard'
     189 |         guard(mutex, &chip->lock);
         |         ^
   5 warnings and 2 errors generated.
--
   In file included from drivers/leds/leds-lp5523.c:15:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lp5523.c:192:15: error: too many arguments provided to function-like macro invocation
     192 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
>> drivers/leds/leds-lp5523.c:192:2: error: use of undeclared identifier 'guard'
     192 |         guard(mutex, &chip->lock);
         |         ^
   5 warnings and 2 errors generated.
--
   In file included from drivers/leds/leds-lp5562.c:13:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lp5562.c:175:15: error: too many arguments provided to function-like macro invocation
     175 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
>> drivers/leds/leds-lp5562.c:175:2: error: use of undeclared identifier 'guard'
     175 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp5562.c:272:15: error: too many arguments provided to function-like macro invocation
     272 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp5562.c:272:2: error: use of undeclared identifier 'guard'
     272 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp5562.c:324:15: error: too many arguments provided to function-like macro invocation
     324 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp5562.c:324:2: error: use of undeclared identifier 'guard'
     324 |         guard(mutex, &chip->lock);
         |         ^
   5 warnings and 6 errors generated.
--
   In file included from drivers/leds/leds-lp5569.c:10:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lp5569.c:400:15: error: too many arguments provided to function-like macro invocation
     400 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
>> drivers/leds/leds-lp5569.c:400:2: error: use of undeclared identifier 'guard'
     400 |         guard(mutex, &chip->lock);
         |         ^
   5 warnings and 2 errors generated.
--
   In file included from drivers/leds/leds-lp55xx-common.c:17:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/leds/leds-lp55xx-common.c:18:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/leds/leds-lp55xx-common.c:18:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/leds/leds-lp55xx-common.c:18:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/leds/leds-lp55xx-common.c:276:15: error: too many arguments provided to function-like macro invocation
     276 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
>> drivers/leds/leds-lp55xx-common.c:276:2: error: use of undeclared identifier 'guard'
     276 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:291:15: error: too many arguments provided to function-like macro invocation
     291 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:291:2: error: use of undeclared identifier 'guard'
     291 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:409:15: error: too many arguments provided to function-like macro invocation
     409 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:409:2: error: use of undeclared identifier 'guard'
     409 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:637:15: error: too many arguments provided to function-like macro invocation
     637 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:637:2: error: use of undeclared identifier 'guard'
     637 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:676:15: error: too many arguments provided to function-like macro invocation
     676 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:676:2: error: use of undeclared identifier 'guard'
     676 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:704:15: error: too many arguments provided to function-like macro invocation
     704 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:704:2: error: use of undeclared identifier 'guard'
     704 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:803:15: error: too many arguments provided to function-like macro invocation
     803 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:803:2: error: use of undeclared identifier 'guard'
     803 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:827:15: error: too many arguments provided to function-like macro invocation
     827 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:827:2: error: use of undeclared identifier 'guard'
     827 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:851:15: error: too many arguments provided to function-like macro invocation
     851 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   drivers/leds/leds-lp55xx-common.c:851:2: error: use of undeclared identifier 'guard'
     851 |         guard(mutex, &chip->lock);
         |         ^
   drivers/leds/leds-lp55xx-common.c:870:15: error: too many arguments provided to function-like macro invocation
     870 |         guard(mutex, &chip->lock);
         |                      ^
   include/linux/cleanup.h:163:9: note: macro 'guard' defined here
     163 | #define guard(_name) \
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   17 warnings and 20 errors generated.


vim +189 drivers/leds/leds-lp5521.c

   180	
   181	static ssize_t lp5521_selftest(struct device *dev,
   182				       struct device_attribute *attr,
   183				       char *buf)
   184	{
   185		struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
   186		struct lp55xx_chip *chip = led->chip;
   187		int ret;
   188	
 > 189		guard(mutex, &chip->lock);
   190	
   191		ret = lp5521_run_selftest(chip, buf);
   192	
   193		return sysfs_emit(buf, "%s\n", ret ? "FAIL" : "OK");
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

