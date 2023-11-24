Return-Path: <linux-leds+bounces-140-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B067F7DCC
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 19:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1383D1C21202
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 18:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7EC381D6;
	Fri, 24 Nov 2023 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR290TFK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F4E1FCA
	for <linux-leds@vger.kernel.org>; Fri, 24 Nov 2023 10:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700850373; x=1732386373;
  h=date:from:to:cc:subject:message-id;
  bh=LZeytrsgabz+pmdjwGxlcJVsS117QlzcZdTSJ4cZEqU=;
  b=eR290TFKRHo3MqysrTPByhTnAPebOkVCyBbKPG/DW682V8E/HfqlqqDd
   jKhEXX7hmUQ+zp4fiCSxQ0/a227hQPf/hYz4giYOOdGocowSIQFJ51to0
   1M+29s+2t6J6hroxHzBws2vRdRh8MQ+htUdvyl6Y5mayzWdvTTunECkfR
   DU6RsMv/g8I1sjaHsg2lno8yLKIFUQ4b3y/Dgum7laTe7+QBFa5TdceaG
   nT81gfBEUt09R7d4lBKS892Kvvj/00YMlVS+UM0RR+UO+x4BM6FXeP2ku
   y/ytoahnvYH5RVKg5dd3MR0mWfYaANn6JJFNEBdlwr6g7Y9U5hP9pKzR/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5682512"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5682512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 10:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="16032229"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 10:26:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6asS-0003BC-1G;
	Fri, 24 Nov 2023 18:26:08 +0000
Date: Sat, 25 Nov 2023 02:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 8171710be2d04fdc263da49212d7b875d3688f58
Message-ID: <202311250212.mfBhjuYK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 8171710be2d04fdc263da49212d7b875d3688f58  leds: max5970: Add support for max5970

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- i386-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
`-- x86_64-randconfig-r112-20231124
    `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used

elapsed time: 1455m

configs tested: 213
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231124   gcc  
arc                   randconfig-002-20231124   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                   randconfig-001-20231124   clang
arm                   randconfig-002-20231124   clang
arm                   randconfig-003-20231124   clang
arm                   randconfig-004-20231124   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231124   clang
arm64                 randconfig-002-20231124   clang
arm64                 randconfig-003-20231124   clang
arm64                 randconfig-004-20231124   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231124   gcc  
csky                  randconfig-002-20231124   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231124   clang
hexagon               randconfig-002-20231124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231124   clang
i386         buildonly-randconfig-002-20231124   clang
i386         buildonly-randconfig-003-20231124   clang
i386         buildonly-randconfig-004-20231124   clang
i386         buildonly-randconfig-005-20231124   clang
i386         buildonly-randconfig-006-20231124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231124   clang
i386                  randconfig-002-20231124   clang
i386                  randconfig-003-20231124   clang
i386                  randconfig-004-20231124   clang
i386                  randconfig-005-20231124   clang
i386                  randconfig-006-20231124   clang
i386                  randconfig-011-20231124   gcc  
i386                  randconfig-012-20231124   gcc  
i386                  randconfig-013-20231124   gcc  
i386                  randconfig-014-20231124   gcc  
i386                  randconfig-015-20231124   gcc  
i386                  randconfig-016-20231124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231124   gcc  
loongarch             randconfig-002-20231124   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231124   gcc  
nios2                 randconfig-002-20231124   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231124   gcc  
parisc                randconfig-002-20231124   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231124   clang
powerpc               randconfig-002-20231124   clang
powerpc               randconfig-003-20231124   clang
powerpc64             randconfig-001-20231124   clang
powerpc64             randconfig-002-20231124   clang
powerpc64             randconfig-003-20231124   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231124   clang
riscv                 randconfig-002-20231124   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231124   gcc  
s390                  randconfig-002-20231124   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20231124   gcc  
sh                    randconfig-002-20231124   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231124   gcc  
sparc64               randconfig-002-20231124   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231124   clang
um                    randconfig-002-20231124   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231124   clang
x86_64       buildonly-randconfig-002-20231124   clang
x86_64       buildonly-randconfig-003-20231124   clang
x86_64       buildonly-randconfig-004-20231124   clang
x86_64       buildonly-randconfig-005-20231124   clang
x86_64       buildonly-randconfig-006-20231124   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231124   gcc  
x86_64                randconfig-002-20231124   gcc  
x86_64                randconfig-003-20231124   gcc  
x86_64                randconfig-004-20231124   gcc  
x86_64                randconfig-005-20231124   gcc  
x86_64                randconfig-006-20231124   gcc  
x86_64                randconfig-011-20231124   clang
x86_64                randconfig-012-20231124   clang
x86_64                randconfig-013-20231124   clang
x86_64                randconfig-014-20231124   clang
x86_64                randconfig-015-20231124   clang
x86_64                randconfig-016-20231124   clang
x86_64                randconfig-071-20231124   clang
x86_64                randconfig-072-20231124   clang
x86_64                randconfig-073-20231124   clang
x86_64                randconfig-074-20231124   clang
x86_64                randconfig-075-20231124   clang
x86_64                randconfig-076-20231124   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231124   gcc  
xtensa                randconfig-002-20231124   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

