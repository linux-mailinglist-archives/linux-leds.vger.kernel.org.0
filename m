Return-Path: <linux-leds+bounces-599-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B182CA7E
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jan 2024 09:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3ADB284AF4
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jan 2024 08:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9551865A;
	Sat, 13 Jan 2024 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUdwzJHS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D818647
	for <linux-leds@vger.kernel.org>; Sat, 13 Jan 2024 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705134460; x=1736670460;
  h=date:from:to:cc:subject:message-id;
  bh=NhRk9CrsTeKamB2raCdwhghDTciLfWj4SBH4QYpxa2c=;
  b=gUdwzJHSertOq0u9jpZUJ6SDk/KG1XHc1v7Ur2tCdwFm7zEPKbvv7KWz
   4wnHqXbPV7cYXizKrKF4/wbi7cwzO35aVXIAWXwhnQqaokEEooAgMUMHR
   Rc+o6LF+fqL0kc0kpJv/x/UIiUZY8gfK6ykthVyas7CFQR09DTL0IbLUJ
   2MVFhcAKMwhkbl6foxsJdoKpfB00wODDAOsa44wJlH78Jz4k/iaBybUuR
   jqdE5zJ/WtXS2AmQFxEfno3EBQMqFNxyUBs7prL8i6O0BitCwdzPmAsFH
   NavoofPtG5pr9y9X/PtVQaE2Pv2jfAwTx/ANpSsqgZPfSMvxgH0uhA8ug
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="20841574"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="20841574"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 00:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853504537"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="853504537"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2024 00:27:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOZMd-000AGk-21;
	Sat, 13 Jan 2024 08:27:35 +0000
Date: Sat, 13 Jan 2024 16:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next-next] BUILD REGRESSION
 1f88a09c35f8d50eff1adbc9e35cc2982b3ac9f9
Message-ID: <202401131654.HSONHFjm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
branch HEAD: 1f88a09c35f8d50eff1adbc9e35cc2982b3ac9f9  docs: ABI: sysfs-class-led-trigger-netdev: Document now hidable link_*

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401131235.zLTJE6Po-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/leds/rgb/leds-qcom-lpg.c:17:10: fatal error: linux/soc/qcom/qcom-pbs.h: No such file or directory

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- arc-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- arc-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- arm-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- arm-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- arm64-randconfig-001-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- csky-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- csky-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- i386-buildonly-randconfig-003-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- i386-randconfig-062-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- loongarch-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- loongarch-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- loongarch-randconfig-002-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- m68k-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- m68k-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- microblaze-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- microblaze-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- mips-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- mips-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- nios2-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- nios2-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- nios2-randconfig-002-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- openrisc-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- openrisc-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- parisc-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- parisc-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- powerpc64-randconfig-001-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- powerpc64-randconfig-r123-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- riscv-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- riscv-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- s390-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- s390-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sh-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sh-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sparc-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sparc-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sparc-randconfig-002-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sparc64-allmodconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- sparc64-allyesconfig
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
|-- x86_64-randconfig-072-20240113
|   `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory
`-- xtensa-allyesconfig
    `-- drivers-leds-rgb-leds-qcom-lpg.c:fatal-error:linux-soc-qcom-qcom-pbs.h:No-such-file-or-directory

elapsed time: 1458m

configs tested: 163
configs skipped: 1

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240113   gcc  
arc                   randconfig-002-20240113   gcc  
arm                               allnoconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20240113   gcc  
arm                   randconfig-002-20240113   gcc  
arm                   randconfig-003-20240113   gcc  
arm                   randconfig-004-20240113   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240113   gcc  
arm64                 randconfig-002-20240113   gcc  
arm64                 randconfig-003-20240113   gcc  
arm64                 randconfig-004-20240113   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240113   gcc  
csky                  randconfig-002-20240113   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20240113   clang
i386                  randconfig-012-20240113   clang
i386                  randconfig-013-20240113   clang
i386                  randconfig-014-20240113   clang
i386                  randconfig-015-20240113   clang
i386                  randconfig-016-20240113   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240113   gcc  
loongarch             randconfig-002-20240113   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240113   gcc  
nios2                 randconfig-002-20240113   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240113   gcc  
parisc                randconfig-002-20240113   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc               randconfig-001-20240113   gcc  
powerpc               randconfig-002-20240113   gcc  
powerpc               randconfig-003-20240113   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     taishan_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240113   gcc  
powerpc64             randconfig-002-20240113   gcc  
powerpc64             randconfig-003-20240113   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240113   gcc  
riscv                 randconfig-002-20240113   gcc  
riscv                          rv32_defconfig   clang
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                                allnoconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240113   gcc  
sh                    randconfig-002-20240113   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240113   gcc  
sparc64               randconfig-002-20240113   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240113   gcc  
um                    randconfig-002-20240113   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240113   gcc  
x86_64       buildonly-randconfig-002-20240113   gcc  
x86_64       buildonly-randconfig-003-20240113   gcc  
x86_64       buildonly-randconfig-004-20240113   gcc  
x86_64       buildonly-randconfig-005-20240113   gcc  
x86_64       buildonly-randconfig-006-20240113   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240113   gcc  
x86_64                randconfig-012-20240113   gcc  
x86_64                randconfig-013-20240113   gcc  
x86_64                randconfig-014-20240113   gcc  
x86_64                randconfig-015-20240113   gcc  
x86_64                randconfig-016-20240113   gcc  
x86_64                randconfig-071-20240113   gcc  
x86_64                randconfig-072-20240113   gcc  
x86_64                randconfig-073-20240113   gcc  
x86_64                randconfig-074-20240113   gcc  
x86_64                randconfig-075-20240113   gcc  
x86_64                randconfig-076-20240113   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240113   gcc  
xtensa                randconfig-002-20240113   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

