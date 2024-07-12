Return-Path: <linux-leds+bounces-2274-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0492F985
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 13:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D16282B62
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2024 11:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9E013D605;
	Fri, 12 Jul 2024 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/n2USJF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F29C624
	for <linux-leds@vger.kernel.org>; Fri, 12 Jul 2024 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720783466; cv=none; b=THJxrVWF0/HDNjXvkz89x2eYeiswzAeDCCoaEPyF8ubNAthhMkr2R2kiQz/0d8BIlePQxI/Rs5XnobjNVjBlw1DrCUVtWqZOb14lt/xLga5EDJbm6a4SlydteR/UVVwdT+OgHqIibAZbhQD8TcVYPIidJ3Wd5Xep/mUCDKnTLEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720783466; c=relaxed/simple;
	bh=ACnYhDBNOmb4VEksGsTIpj5GdSW/7L7dfUfZnkN+JeI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j3CTthqluZcKma5vwDnUw6QDA+L2/4WUbOo2IRHurbyf/IKOUe+0tw9+74U+Fw1I61ba4JZQ88fZPD4ch15eVlAu+o0mJ9T3ooHj6pKALN3irwHFwdsd4/PjAEkxTq1oqVl98ZyIlq9PrhEwrMlf/RBepAkcaBYJov0iolyAZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/n2USJF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720783464; x=1752319464;
  h=date:from:to:cc:subject:message-id;
  bh=ACnYhDBNOmb4VEksGsTIpj5GdSW/7L7dfUfZnkN+JeI=;
  b=B/n2USJFLsXmy87D+4KXb3mM0Tpw0n7ZnvIGn6tfWG720xTfqz46hjg4
   QtpufiClpa4LjEn1TUI7Ps4qPEhEiDax5zBND90jV6+ol7p5pmN1oib5G
   yGbntjdVYCNiJdMTEiZYrtVLubXNV4KZFsmUSWEA/jEP+wF3++ciBD+Uo
   H7bxMV2uSFvuytPG0RDbDfCAnYqaZqVhr59MLoAGpt6yY6aJ19z7IV+9k
   FEkpQMZ3hjr9diLX4ANh5jW3Vo8SO+Nr31NIlWKM1N4bYCvwpTvOxu44w
   FfEmeL21BCA/+FCS65TYr7EvkiMRMst6zH55esuOk5UyawcqxVadB9qQs
   w==;
X-CSE-ConnectionGUID: 30AyW84FRGGnYbOHUoc/Cw==
X-CSE-MsgGUID: aCBRwcceQtmeVKta7vRBog==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17928559"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="17928559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 04:24:23 -0700
X-CSE-ConnectionGUID: FpVUQk3tQceBEPkJtHtjnw==
X-CSE-MsgGUID: IueGh3+ZRX6owrj+BLlcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53715991"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2024 04:24:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSENv-000ahu-1c;
	Fri, 12 Jul 2024 11:24:19 +0000
Date: Fri, 12 Jul 2024 19:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 d9cc80b1c9b40a33c022e125b7f9555813c7f385
Message-ID: <202407121909.CX3yFZfA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: d9cc80b1c9b40a33c022e125b7f9555813c7f385  leds: leds-lp5569: Enable chip after chip configuration

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202407120702.K20luS0E-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202407120801.PxZUtOgp-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/leds/leds-lp5569.c:204:31: error: incompatible pointer types passing 'int *' to parameter of type 'u8 *' (aka 'unsigned char *') [-Werror,-Wincompatible-pointer-types]
drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:incompatible-pointer-types-passing-int-to-parameter-of-type-u8-(aka-unsigned-char-)-Werror-Wincompatible-pointer-types
|-- hexagon-allyesconfig
|   `-- drivers-leds-leds-lp5569.c:error:incompatible-pointer-types-passing-int-to-parameter-of-type-u8-(aka-unsigned-char-)-Werror-Wincompatible-pointer-types
|-- i386-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- i386-allyesconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- loongarch-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- m68k-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- m68k-allyesconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- microblaze-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- microblaze-allyesconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- s390-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:incompatible-pointer-types-passing-int-to-parameter-of-type-u8-(aka-unsigned-char-)-Werror-Wincompatible-pointer-types
|-- sh-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
|-- um-allmodconfig
|   `-- drivers-leds-leds-lp5569.c:error:incompatible-pointer-types-passing-int-to-parameter-of-type-u8-(aka-unsigned-char-)-Werror-Wincompatible-pointer-types
|-- um-allyesconfig
|   `-- drivers-leds-leds-lp5569.c:error:passing-argument-of-lp55xx_read-from-incompatible-pointer-type
`-- x86_64-allyesconfig
    `-- drivers-leds-leds-lp5569.c:error:incompatible-pointer-types-passing-int-to-parameter-of-type-u8-(aka-unsigned-char-)-Werror-Wincompatible-pointer-types

elapsed time: 1021m

configs tested: 193
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240712   gcc-13.2.0
arc                   randconfig-002-20240712   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                   milbeaut_m10v_defconfig   gcc-13.2.0
arm                        multi_v7_defconfig   gcc-13.2.0
arm                   randconfig-001-20240712   gcc-13.2.0
arm                   randconfig-002-20240712   gcc-13.2.0
arm                   randconfig-003-20240712   gcc-13.2.0
arm                   randconfig-004-20240712   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-13.2.0
arm                           stm32_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240712   gcc-13.2.0
arm64                 randconfig-002-20240712   gcc-13.2.0
arm64                 randconfig-003-20240712   gcc-13.2.0
arm64                 randconfig-004-20240712   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240712   gcc-13.2.0
csky                  randconfig-002-20240712   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240712   gcc-9
i386         buildonly-randconfig-002-20240712   clang-18
i386         buildonly-randconfig-002-20240712   gcc-9
i386         buildonly-randconfig-003-20240712   clang-18
i386         buildonly-randconfig-003-20240712   gcc-9
i386         buildonly-randconfig-004-20240712   clang-18
i386         buildonly-randconfig-004-20240712   gcc-9
i386         buildonly-randconfig-005-20240712   gcc-11
i386         buildonly-randconfig-005-20240712   gcc-9
i386         buildonly-randconfig-006-20240712   clang-18
i386         buildonly-randconfig-006-20240712   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240712   clang-18
i386                  randconfig-001-20240712   gcc-9
i386                  randconfig-002-20240712   clang-18
i386                  randconfig-002-20240712   gcc-9
i386                  randconfig-003-20240712   clang-18
i386                  randconfig-003-20240712   gcc-9
i386                  randconfig-004-20240712   clang-18
i386                  randconfig-004-20240712   gcc-9
i386                  randconfig-005-20240712   clang-18
i386                  randconfig-005-20240712   gcc-9
i386                  randconfig-006-20240712   clang-18
i386                  randconfig-006-20240712   gcc-9
i386                  randconfig-011-20240712   clang-18
i386                  randconfig-011-20240712   gcc-9
i386                  randconfig-012-20240712   clang-18
i386                  randconfig-012-20240712   gcc-9
i386                  randconfig-013-20240712   clang-18
i386                  randconfig-013-20240712   gcc-9
i386                  randconfig-014-20240712   gcc-10
i386                  randconfig-014-20240712   gcc-9
i386                  randconfig-015-20240712   gcc-10
i386                  randconfig-015-20240712   gcc-9
i386                  randconfig-016-20240712   gcc-12
i386                  randconfig-016-20240712   gcc-9
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240712   gcc-13.2.0
loongarch             randconfig-002-20240712   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
nios2                            alldefconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240712   gcc-13.2.0
nios2                 randconfig-002-20240712   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240712   gcc-13.2.0
parisc                randconfig-002-20240712   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      ppc6xx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240712   gcc-13.2.0
powerpc               randconfig-002-20240712   gcc-13.2.0
powerpc               randconfig-003-20240712   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240712   gcc-13.2.0
powerpc64             randconfig-002-20240712   gcc-13.2.0
powerpc64             randconfig-003-20240712   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240712   gcc-13.2.0
riscv                 randconfig-002-20240712   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240712   gcc-13.2.0
s390                  randconfig-002-20240712   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240712   gcc-13.2.0
sh                    randconfig-002-20240712   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240712   gcc-13.2.0
sparc64               randconfig-002-20240712   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240712   gcc-13.2.0
um                    randconfig-002-20240712   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240712   clang-18
x86_64       buildonly-randconfig-002-20240712   clang-18
x86_64       buildonly-randconfig-003-20240712   clang-18
x86_64       buildonly-randconfig-004-20240712   clang-18
x86_64       buildonly-randconfig-005-20240712   clang-18
x86_64       buildonly-randconfig-006-20240712   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240712   clang-18
x86_64                randconfig-002-20240712   clang-18
x86_64                randconfig-003-20240712   clang-18
x86_64                randconfig-004-20240712   clang-18
x86_64                randconfig-005-20240712   clang-18
x86_64                randconfig-006-20240712   clang-18
x86_64                randconfig-011-20240712   clang-18
x86_64                randconfig-012-20240712   clang-18
x86_64                randconfig-013-20240712   clang-18
x86_64                randconfig-014-20240712   clang-18
x86_64                randconfig-015-20240712   clang-18
x86_64                randconfig-016-20240712   clang-18
x86_64                randconfig-071-20240712   clang-18
x86_64                randconfig-072-20240712   clang-18
x86_64                randconfig-073-20240712   clang-18
x86_64                randconfig-074-20240712   clang-18
x86_64                randconfig-075-20240712   clang-18
x86_64                randconfig-076-20240712   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240712   gcc-13.2.0
xtensa                randconfig-002-20240712   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

