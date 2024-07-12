Return-Path: <linux-leds+bounces-2269-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1492F320
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 02:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9927E1C21F57
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 00:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02296624;
	Fri, 12 Jul 2024 00:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUT8Gyli"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA3910F9
	for <linux-leds@vger.kernel.org>; Fri, 12 Jul 2024 00:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720744862; cv=none; b=GYUgduub0q0iy9DHIJ3lJTLVHlFBrD56qzwL7funVq/IFEja7H1Co4cgciqli1Cx08fwUYPNdudIPtJ10c03uh1Gz+ChafL/gcRn2R9R4lOc//79b2YHE4gTOTIh6aCeFW1H9PiEozpCA2EMeDkgj/uh1XPPabmKH5qiNyt4MSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720744862; c=relaxed/simple;
	bh=H58Fz5nPf8JcG6RN5j2vE2f3z5W9IM/EyS0G5IJ4k9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGxBx+U13ZLYJBfiFe0ahiwA/5Ux4fQsxuzf2zU9F24f+LApAvbGIebz6okQEiyWpWMq7RD6OyOyleVLQV89FmuEx8Esdf2TbrXxinTzwdZIMXFbF3uR5dxAJ1uVYFaODalX/Ah/t0KOB74hB9+7LuYbsX3VnEtrtBmF0T0fhKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUT8Gyli; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720744861; x=1752280861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H58Fz5nPf8JcG6RN5j2vE2f3z5W9IM/EyS0G5IJ4k9M=;
  b=mUT8GyliRtnqM2exxxmbB34nU1CqMz3Gc2Q6ZusSowQH6i1nG18ykO1F
   P8ctp0IzsxJ2j//JhCmAy86fDwI6Fc5Dn3g+DJPLQCk/LLcXd9ePw/eAB
   PFN9WgLfgLa7zS2DxK2KZCAXPqYeXgD6fMeygTNCj2LkXVix/iR7y3oeS
   1JShBAcnm2/hpUMklNGfOVLGav3bS+uilqhQIV/DRJKgzVIKZ8k4iMzwe
   Ez++eMa0TYExz3Mlx1A1m0nq1KgKzRRaD5U3hYhYlOQp+Y2YoalP2v0gV
   9inbajunysoKQ6WUSMPVWWOU0Cylfat4SIYNZL/Qjp6GAkmYWxsqqJA5B
   w==;
X-CSE-ConnectionGUID: aayR2RPwRMyNQs2hhGL6SA==
X-CSE-MsgGUID: QcX0wUPfT2ClsJpdE16Xdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17876252"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="17876252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 17:41:00 -0700
X-CSE-ConnectionGUID: oK41M0wrSVm13WaRps8XDw==
X-CSE-MsgGUID: EdYXLxmPTACfXLZE++VXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="53577626"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 17:40:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS4LH-000a8U-29;
	Fri, 12 Jul 2024 00:40:55 +0000
Date: Fri, 12 Jul 2024 08:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 65/65] drivers/leds/leds-lp5569.c:204:31:
 error: incompatible pointer types passing 'int *' to parameter of type 'u8
 *' (aka 'unsigned char *')
Message-ID: <202407120801.PxZUtOgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   d9cc80b1c9b40a33c022e125b7f9555813c7f385
commit: d9cc80b1c9b40a33c022e125b7f9555813c7f385 [65/65] leds: leds-lp5569: Enable chip after chip configuration
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407120801.PxZUtOgp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120801.PxZUtOgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120801.PxZUtOgp-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   In file included from drivers/leds/leds-lp5569.c:11:
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
   In file included from drivers/leds/leds-lp5569.c:11:
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
   In file included from drivers/leds/leds-lp5569.c:11:
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
>> drivers/leds/leds-lp5569.c:204:31: error: incompatible pointer types passing 'int *' to parameter of type 'u8 *' (aka 'unsigned char *') [-Werror,-Wincompatible-pointer-types]
     204 |                           chip, LP5569_REG_STATUS, &val);
         |                                                    ^~~~
   include/linux/iopoll.h:46:14: note: expanded from macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                            ^~~~
   drivers/leds/leds-lp55xx-common.h:229:62: note: passing argument to parameter 'val' here
     229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
         |                                                              ^
>> drivers/leds/leds-lp5569.c:204:31: error: incompatible pointer types passing 'int *' to parameter of type 'u8 *' (aka 'unsigned char *') [-Werror,-Wincompatible-pointer-types]
     204 |                           chip, LP5569_REG_STATUS, &val);
         |                                                    ^~~~
   include/linux/iopoll.h:51:15: note: expanded from macro 'read_poll_timeout'
      51 |                         (val) = op(args); \
         |                                    ^~~~
   drivers/leds/leds-lp55xx-common.h:229:62: note: passing argument to parameter 'val' here
     229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
         |                                                              ^
   17 warnings and 2 errors generated.


vim +204 drivers/leds/leds-lp5569.c

   171	
   172	static int lp5569_post_init_device(struct lp55xx_chip *chip)
   173	{
   174		int ret;
   175		int val;
   176	
   177		val = LP5569_DEFAULT_CONFIG;
   178		val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
   179		ret = lp55xx_write(chip, LP5569_REG_MISC, val);
   180		if (ret)
   181			return ret;
   182	
   183		if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
   184			/* Internal clock MUST be configured before CLK output */
   185			ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
   186						 LP5569_INTERNAL_CLK,
   187						 LP5569_INTERNAL_CLK);
   188			if (ret)
   189				return ret;
   190	
   191			ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
   192						 LP5569_CLK_OUTPUT,
   193						 LP5569_CLK_OUTPUT);
   194			if (ret)
   195				return ret;
   196		}
   197	
   198		ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
   199		if (ret)
   200			return ret;
   201	
   202		read_poll_timeout(lp55xx_read, ret, !(val & LP5569_STARTUP_BUSY),
   203				  LP5569_STARTUP_SLEEP, LP5569_STARTUP_SLEEP * 10, false,
 > 204				  chip, LP5569_REG_STATUS, &val);
   205	
   206		return lp5569_init_program_engine(chip);
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

