Return-Path: <linux-leds+bounces-301-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A74808954
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 14:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782B01C20B2C
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 13:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FAD40BEB;
	Thu,  7 Dec 2023 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhX1gVVG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE04B10CA
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701956267; x=1733492267;
  h=date:from:to:cc:subject:message-id;
  bh=cGAd7tannP5dTtf/8J4fAkrp/pYpmYKKVo00JIgR//Y=;
  b=hhX1gVVG7imp0z196dEpMRZbv5G0H3a9JldbAFlkS8oqFSLhJb4ZWZUs
   1x74KyU8ZXyudpZiWDIrrtbJoNwMzpvV95vXsNs9vNUrXEcUPQVqJWnAs
   TDwP40owswKPJCf/vlTobmuYdh+shR01BqYA0mqluWB3IuJbDKdJOk+zU
   WSClimX63QJTAv2R7RG784gxfFgTZ/9qqUIxqr8q2zuOibcoKGbz5Vzll
   aP3yTvduskPbNnpAYBU8qXSwd22kjcOdSSZZH2ndwCTXFJmaYmLcIGdqL
   FoeHFEOjDtedHEMcSA/83zrv4hzzspXdhKxBT26gAZRswb8/cS4AdAEr8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460720002"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460720002"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775408766"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="775408766"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 07 Dec 2023 05:37:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBEZT-000CIh-2a;
	Thu, 07 Dec 2023 13:37:43 +0000
Date: Thu, 07 Dec 2023 21:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 5707a06e5391a4eeaf0c2705f973336537a41c79
Message-ID: <202312072111.WyuP3JBA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 5707a06e5391a4eeaf0c2705f973336537a41c79  dt-bindings: leds: aw200xx: Fix led pattern and add reg constraints

Warning ids grouped by kconfigs:

clang_recent_errors
|-- i386-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- i386-randconfig-003-20231206
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
`-- x86_64-allyesconfig
    `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used

elapsed time: 1451m

configs tested: 206
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20231207   gcc  
arc                   randconfig-002-20231207   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20231207   gcc  
arm                   randconfig-002-20231207   gcc  
arm                   randconfig-003-20231207   gcc  
arm                   randconfig-004-20231207   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231207   gcc  
arm64                 randconfig-002-20231207   gcc  
arm64                 randconfig-003-20231207   gcc  
arm64                 randconfig-004-20231207   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231207   gcc  
csky                  randconfig-002-20231207   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231207   clang
hexagon               randconfig-002-20231207   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231206   clang
i386         buildonly-randconfig-002-20231206   clang
i386         buildonly-randconfig-003-20231206   clang
i386         buildonly-randconfig-004-20231206   clang
i386         buildonly-randconfig-005-20231206   clang
i386         buildonly-randconfig-006-20231206   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231206   clang
i386                  randconfig-002-20231206   clang
i386                  randconfig-003-20231206   clang
i386                  randconfig-004-20231206   clang
i386                  randconfig-005-20231206   clang
i386                  randconfig-006-20231206   clang
i386                  randconfig-011-20231206   gcc  
i386                  randconfig-011-20231207   clang
i386                  randconfig-012-20231206   gcc  
i386                  randconfig-012-20231207   clang
i386                  randconfig-013-20231206   gcc  
i386                  randconfig-013-20231207   clang
i386                  randconfig-014-20231206   gcc  
i386                  randconfig-014-20231207   clang
i386                  randconfig-015-20231206   gcc  
i386                  randconfig-015-20231207   clang
i386                  randconfig-016-20231206   gcc  
i386                  randconfig-016-20231207   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231207   gcc  
loongarch             randconfig-002-20231207   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231207   gcc  
nios2                 randconfig-002-20231207   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231207   gcc  
parisc                randconfig-002-20231207   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20231207   gcc  
powerpc               randconfig-002-20231207   gcc  
powerpc               randconfig-003-20231207   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
powerpc64             randconfig-001-20231207   gcc  
powerpc64             randconfig-002-20231207   gcc  
powerpc64             randconfig-003-20231207   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231207   gcc  
riscv                 randconfig-002-20231207   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231207   clang
s390                  randconfig-002-20231207   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231207   gcc  
sh                    randconfig-002-20231207   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231207   gcc  
sparc64               randconfig-002-20231207   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231207   gcc  
um                    randconfig-002-20231207   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231207   gcc  
x86_64       buildonly-randconfig-002-20231207   gcc  
x86_64       buildonly-randconfig-003-20231207   gcc  
x86_64       buildonly-randconfig-004-20231207   gcc  
x86_64       buildonly-randconfig-005-20231207   gcc  
x86_64       buildonly-randconfig-006-20231207   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231207   gcc  
x86_64                randconfig-012-20231207   gcc  
x86_64                randconfig-013-20231207   gcc  
x86_64                randconfig-014-20231207   gcc  
x86_64                randconfig-015-20231207   gcc  
x86_64                randconfig-016-20231207   gcc  
x86_64                randconfig-071-20231207   gcc  
x86_64                randconfig-072-20231207   gcc  
x86_64                randconfig-073-20231207   gcc  
x86_64                randconfig-074-20231207   gcc  
x86_64                randconfig-075-20231207   gcc  
x86_64                randconfig-076-20231207   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20231207   gcc  
xtensa                randconfig-002-20231207   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

