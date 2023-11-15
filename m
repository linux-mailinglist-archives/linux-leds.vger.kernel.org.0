Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5077E0F33
	for <lists+linux-leds@lfdr.de>; Sat,  4 Nov 2023 12:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjKDLkO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Nov 2023 07:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjKDLkN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Nov 2023 07:40:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9EAD47
        for <linux-leds@vger.kernel.org>; Sat,  4 Nov 2023 04:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699098010; x=1730634010;
  h=date:from:to:cc:subject:message-id;
  bh=SjPzbSGb2XZpbnrWY1yDDWyXIklryZBJJPKClTzGElo=;
  b=Tphe4uYPP7/D7bybaB8K45J/LR53WIlA4rhltiD7YCSpAgix37P44ZqN
   MYiLdC6R0IYRI256vg6teXdy/qm/V5/D8/yGl30d62Pm31U7lrjV+cqOV
   t58C+w/eK008tKyL3/RcWFNHcWoF3vigwNMr0+aSRjLu58y2Xg0yLyg2y
   0u5z7+8O7evNvbBSdM3hcjowo3jQhwLLVS8nybmTOVtFGzkQoIH4cnJKH
   lsw8txea4m50861aGY1Z/KhI+0beQ9y/0y6IXga/WyJ1nI3stgThEKH6q
   WZgvX9ECmVt/0QYcXEowZ3XE1AbEc/whPjbCg3nNERteLZAhfZCMBA5ME
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369286215"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369286215"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738355828"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="738355828"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2023 04:40:08 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qzF0Y-0004CZ-25;
        Sat, 04 Nov 2023 11:40:06 +0000
Date:   Sat, 04 Nov 2023 19:39:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 b9604be241587fb29c0f40450e53d0a37dc611b5
Message-ID: <202311041954.8r0jthM8-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: b9604be241587fb29c0f40450e53d0a37dc611b5  leds: lp5521: Add an error check in lp5521_post_init_device

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arc-allyesconfig
    `-- drivers-iommu-io-pgtable-dart.c:warning:variable-new-set-but-not-used

elapsed time: 4268m

configs tested: 391
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
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231101   gcc  
arc                   randconfig-001-20231102   gcc  
arc                   randconfig-001-20231103   gcc  
arc                   randconfig-002-20231101   gcc  
arc                   randconfig-002-20231102   gcc  
arc                   randconfig-002-20231103   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                           omap1_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                          pxa168_defconfig   clang
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231102   gcc  
arm                   randconfig-001-20231103   gcc  
arm                   randconfig-001-20231104   gcc  
arm                   randconfig-002-20231102   gcc  
arm                   randconfig-002-20231103   gcc  
arm                   randconfig-002-20231104   gcc  
arm                   randconfig-003-20231102   gcc  
arm                   randconfig-003-20231103   gcc  
arm                   randconfig-003-20231104   gcc  
arm                   randconfig-004-20231102   gcc  
arm                   randconfig-004-20231103   gcc  
arm                   randconfig-004-20231104   gcc  
arm                       spear13xx_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231102   gcc  
arm64                 randconfig-001-20231103   gcc  
arm64                 randconfig-001-20231104   gcc  
arm64                 randconfig-002-20231102   gcc  
arm64                 randconfig-002-20231103   gcc  
arm64                 randconfig-002-20231104   gcc  
arm64                 randconfig-003-20231102   gcc  
arm64                 randconfig-003-20231103   gcc  
arm64                 randconfig-003-20231104   gcc  
arm64                 randconfig-004-20231102   gcc  
arm64                 randconfig-004-20231103   gcc  
arm64                 randconfig-004-20231104   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231101   gcc  
csky                  randconfig-001-20231102   gcc  
csky                  randconfig-001-20231103   gcc  
csky                  randconfig-002-20231101   gcc  
csky                  randconfig-002-20231102   gcc  
csky                  randconfig-002-20231103   gcc  
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231102   gcc  
i386         buildonly-randconfig-001-20231103   gcc  
i386         buildonly-randconfig-002-20231102   gcc  
i386         buildonly-randconfig-002-20231103   gcc  
i386         buildonly-randconfig-003-20231102   gcc  
i386         buildonly-randconfig-003-20231103   gcc  
i386         buildonly-randconfig-004-20231102   gcc  
i386         buildonly-randconfig-004-20231103   gcc  
i386         buildonly-randconfig-005-20231102   gcc  
i386         buildonly-randconfig-005-20231103   gcc  
i386         buildonly-randconfig-006-20231102   gcc  
i386         buildonly-randconfig-006-20231103   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231102   gcc  
i386                  randconfig-001-20231103   gcc  
i386                  randconfig-002-20231102   gcc  
i386                  randconfig-002-20231103   gcc  
i386                  randconfig-002-20231104   gcc  
i386                  randconfig-003-20231102   gcc  
i386                  randconfig-003-20231103   gcc  
i386                  randconfig-003-20231104   gcc  
i386                  randconfig-004-20231102   gcc  
i386                  randconfig-004-20231103   gcc  
i386                  randconfig-004-20231104   gcc  
i386                  randconfig-005-20231102   gcc  
i386                  randconfig-005-20231103   gcc  
i386                  randconfig-005-20231104   gcc  
i386                  randconfig-006-20231102   gcc  
i386                  randconfig-006-20231103   gcc  
i386                  randconfig-006-20231104   gcc  
i386                  randconfig-011-20231102   gcc  
i386                  randconfig-011-20231103   gcc  
i386                  randconfig-011-20231104   gcc  
i386                  randconfig-012-20231102   gcc  
i386                  randconfig-012-20231103   gcc  
i386                  randconfig-012-20231104   gcc  
i386                  randconfig-013-20231102   gcc  
i386                  randconfig-013-20231103   gcc  
i386                  randconfig-013-20231104   gcc  
i386                  randconfig-014-20231102   gcc  
i386                  randconfig-014-20231103   gcc  
i386                  randconfig-014-20231104   gcc  
i386                  randconfig-015-20231102   gcc  
i386                  randconfig-015-20231103   gcc  
i386                  randconfig-015-20231104   gcc  
i386                  randconfig-016-20231102   gcc  
i386                  randconfig-016-20231103   gcc  
i386                  randconfig-016-20231104   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231101   gcc  
loongarch             randconfig-001-20231102   gcc  
loongarch             randconfig-001-20231103   gcc  
loongarch             randconfig-002-20231101   gcc  
loongarch             randconfig-002-20231102   gcc  
loongarch             randconfig-002-20231103   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231101   gcc  
nios2                 randconfig-001-20231102   gcc  
nios2                 randconfig-001-20231103   gcc  
nios2                 randconfig-001-20231104   gcc  
nios2                 randconfig-002-20231101   gcc  
nios2                 randconfig-002-20231102   gcc  
nios2                 randconfig-002-20231103   gcc  
nios2                 randconfig-002-20231104   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231101   gcc  
parisc                randconfig-001-20231102   gcc  
parisc                randconfig-001-20231103   gcc  
parisc                randconfig-001-20231104   gcc  
parisc                randconfig-002-20231101   gcc  
parisc                randconfig-002-20231102   gcc  
parisc                randconfig-002-20231103   gcc  
parisc                randconfig-002-20231104   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                       eiger_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20231101   gcc  
powerpc               randconfig-001-20231102   gcc  
powerpc               randconfig-001-20231103   gcc  
powerpc               randconfig-001-20231104   gcc  
powerpc               randconfig-002-20231101   gcc  
powerpc               randconfig-002-20231102   gcc  
powerpc               randconfig-002-20231103   gcc  
powerpc               randconfig-002-20231104   gcc  
powerpc               randconfig-003-20231101   gcc  
powerpc               randconfig-003-20231102   gcc  
powerpc               randconfig-003-20231103   gcc  
powerpc               randconfig-003-20231104   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc64             randconfig-001-20231101   gcc  
powerpc64             randconfig-001-20231102   gcc  
powerpc64             randconfig-001-20231103   gcc  
powerpc64             randconfig-001-20231104   gcc  
powerpc64             randconfig-002-20231101   gcc  
powerpc64             randconfig-002-20231102   gcc  
powerpc64             randconfig-002-20231103   gcc  
powerpc64             randconfig-002-20231104   gcc  
powerpc64             randconfig-003-20231101   gcc  
powerpc64             randconfig-003-20231102   gcc  
powerpc64             randconfig-003-20231103   gcc  
powerpc64             randconfig-003-20231104   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231101   gcc  
riscv                 randconfig-001-20231102   gcc  
riscv                 randconfig-001-20231103   gcc  
riscv                 randconfig-001-20231104   gcc  
riscv                 randconfig-002-20231101   gcc  
riscv                 randconfig-002-20231102   gcc  
riscv                 randconfig-002-20231103   gcc  
riscv                 randconfig-002-20231104   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231101   gcc  
s390                  randconfig-001-20231102   gcc  
s390                  randconfig-001-20231103   gcc  
s390                  randconfig-001-20231104   gcc  
s390                  randconfig-002-20231101   gcc  
s390                  randconfig-002-20231102   gcc  
s390                  randconfig-002-20231103   gcc  
s390                  randconfig-002-20231104   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231102   gcc  
sh                    randconfig-001-20231103   gcc  
sh                    randconfig-001-20231104   gcc  
sh                    randconfig-002-20231102   gcc  
sh                    randconfig-002-20231103   gcc  
sh                    randconfig-002-20231104   gcc  
sh                          rsk7201_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231102   gcc  
sparc                 randconfig-001-20231103   gcc  
sparc                 randconfig-001-20231104   gcc  
sparc                 randconfig-002-20231102   gcc  
sparc                 randconfig-002-20231103   gcc  
sparc                 randconfig-002-20231104   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231102   gcc  
sparc64               randconfig-001-20231103   gcc  
sparc64               randconfig-001-20231104   gcc  
sparc64               randconfig-002-20231102   gcc  
sparc64               randconfig-002-20231103   gcc  
sparc64               randconfig-002-20231104   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231102   gcc  
um                    randconfig-001-20231103   gcc  
um                    randconfig-001-20231104   gcc  
um                    randconfig-002-20231102   gcc  
um                    randconfig-002-20231103   gcc  
um                    randconfig-002-20231104   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231102   gcc  
x86_64       buildonly-randconfig-001-20231103   gcc  
x86_64       buildonly-randconfig-001-20231104   gcc  
x86_64       buildonly-randconfig-002-20231102   gcc  
x86_64       buildonly-randconfig-002-20231103   gcc  
x86_64       buildonly-randconfig-002-20231104   gcc  
x86_64       buildonly-randconfig-003-20231102   gcc  
x86_64       buildonly-randconfig-003-20231103   gcc  
x86_64       buildonly-randconfig-003-20231104   gcc  
x86_64       buildonly-randconfig-004-20231102   gcc  
x86_64       buildonly-randconfig-004-20231103   gcc  
x86_64       buildonly-randconfig-004-20231104   gcc  
x86_64       buildonly-randconfig-005-20231102   gcc  
x86_64       buildonly-randconfig-005-20231103   gcc  
x86_64       buildonly-randconfig-005-20231104   gcc  
x86_64       buildonly-randconfig-006-20231102   gcc  
x86_64       buildonly-randconfig-006-20231103   gcc  
x86_64       buildonly-randconfig-006-20231104   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231102   gcc  
x86_64                randconfig-001-20231103   gcc  
x86_64                randconfig-001-20231104   gcc  
x86_64                randconfig-002-20231102   gcc  
x86_64                randconfig-002-20231103   gcc  
x86_64                randconfig-002-20231104   gcc  
x86_64                randconfig-003-20231102   gcc  
x86_64                randconfig-003-20231103   gcc  
x86_64                randconfig-003-20231104   gcc  
x86_64                randconfig-004-20231102   gcc  
x86_64                randconfig-004-20231103   gcc  
x86_64                randconfig-004-20231104   gcc  
x86_64                randconfig-005-20231102   gcc  
x86_64                randconfig-005-20231103   gcc  
x86_64                randconfig-005-20231104   gcc  
x86_64                randconfig-006-20231102   gcc  
x86_64                randconfig-006-20231103   gcc  
x86_64                randconfig-006-20231104   gcc  
x86_64                randconfig-011-20231102   gcc  
x86_64                randconfig-011-20231103   gcc  
x86_64                randconfig-011-20231104   gcc  
x86_64                randconfig-012-20231102   gcc  
x86_64                randconfig-012-20231103   gcc  
x86_64                randconfig-012-20231104   gcc  
x86_64                randconfig-013-20231102   gcc  
x86_64                randconfig-013-20231103   gcc  
x86_64                randconfig-013-20231104   gcc  
x86_64                randconfig-014-20231102   gcc  
x86_64                randconfig-014-20231103   gcc  
x86_64                randconfig-014-20231104   gcc  
x86_64                randconfig-015-20231102   gcc  
x86_64                randconfig-015-20231103   gcc  
x86_64                randconfig-015-20231104   gcc  
x86_64                randconfig-016-20231102   gcc  
x86_64                randconfig-016-20231103   gcc  
x86_64                randconfig-016-20231104   gcc  
x86_64                randconfig-071-20231102   gcc  
x86_64                randconfig-071-20231103   gcc  
x86_64                randconfig-071-20231104   gcc  
x86_64                randconfig-072-20231102   gcc  
x86_64                randconfig-072-20231103   gcc  
x86_64                randconfig-072-20231104   gcc  
x86_64                randconfig-073-20231102   gcc  
x86_64                randconfig-073-20231103   gcc  
x86_64                randconfig-073-20231104   gcc  
x86_64                randconfig-074-20231102   gcc  
x86_64                randconfig-074-20231103   gcc  
x86_64                randconfig-074-20231104   gcc  
x86_64                randconfig-075-20231102   gcc  
x86_64                randconfig-075-20231103   gcc  
x86_64                randconfig-075-20231104   gcc  
x86_64                randconfig-076-20231102   gcc  
x86_64                randconfig-076-20231103   gcc  
x86_64                randconfig-076-20231104   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231102   gcc  
xtensa                randconfig-001-20231103   gcc  
xtensa                randconfig-001-20231104   gcc  
xtensa                randconfig-002-20231102   gcc  
xtensa                randconfig-002-20231103   gcc  
xtensa                randconfig-002-20231104   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
