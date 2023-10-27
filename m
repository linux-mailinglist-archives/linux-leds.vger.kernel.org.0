Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C47D7D90B4
	for <lists+linux-leds@lfdr.de>; Fri, 27 Oct 2023 10:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbjJ0IIX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 27 Oct 2023 04:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjJ0IIV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 27 Oct 2023 04:08:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A8C1B3
        for <linux-leds@vger.kernel.org>; Fri, 27 Oct 2023 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698394098; x=1729930098;
  h=date:from:to:cc:subject:message-id;
  bh=YdapiwKPJz+mqEx8c9BxYDblzGlcK6mWkMdDCiL1GOo=;
  b=BriT4nbRLdlhVA1MrCGa09S+tfmkSjWv+7OlPgrak7YKSoTHvnNMcsbI
   t0UBifDhYCsmHvrtPxFieMu6ezEQmvwKqTxps2WvKUZ7pF+ROlA63HVUf
   nX4+ytSbKp8mquT1Doz6wdL00uUCRrW0BeUBTSepknXD/BFHqUZBvXPeE
   aib8pJ2XF3uwXQCGy4IG3bxqFWvkPc+dAO4dpWHcJ1Xnro2XLkSJp0er1
   E5pEwSHwjqM+SD7KG+uycF/HOgvggB7XBlyFJKaN2atNA6w988AJLWJWS
   EONUhYqtd5HkTbquZt01uYciL46nIHA8Oksfx70Cti9Kim7huxfRYJTdU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367074722"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367074722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 01:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="735813"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2023 01:07:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwHt8-000Ad5-1Q;
        Fri, 27 Oct 2023 08:08:14 +0000
Date:   Fri, 27 Oct 2023 16:07:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 13f0ccb77e98cc82c04db2c5fab984865666285e
Message-ID: <202310271618.ltqhs4L3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 13f0ccb77e98cc82c04db2c5fab984865666285e  leds: lp5521: Add an error check in lp5521_post_init_device

elapsed time: 1452m

configs tested: 230
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
arc                        nsim_700_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231026   gcc  
arc                   randconfig-001-20231027   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                   randconfig-001-20231027   gcc  
arm                        realview_defconfig   gcc  
arm                       spear13xx_defconfig   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231026   gcc  
i386         buildonly-randconfig-001-20231027   gcc  
i386         buildonly-randconfig-002-20231026   gcc  
i386         buildonly-randconfig-002-20231027   gcc  
i386         buildonly-randconfig-003-20231026   gcc  
i386         buildonly-randconfig-003-20231027   gcc  
i386         buildonly-randconfig-004-20231026   gcc  
i386         buildonly-randconfig-004-20231027   gcc  
i386         buildonly-randconfig-005-20231026   gcc  
i386         buildonly-randconfig-005-20231027   gcc  
i386         buildonly-randconfig-006-20231026   gcc  
i386         buildonly-randconfig-006-20231027   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231026   gcc  
i386                  randconfig-001-20231027   gcc  
i386                  randconfig-002-20231026   gcc  
i386                  randconfig-002-20231027   gcc  
i386                  randconfig-003-20231026   gcc  
i386                  randconfig-003-20231027   gcc  
i386                  randconfig-004-20231026   gcc  
i386                  randconfig-004-20231027   gcc  
i386                  randconfig-005-20231026   gcc  
i386                  randconfig-005-20231027   gcc  
i386                  randconfig-006-20231026   gcc  
i386                  randconfig-006-20231027   gcc  
i386                  randconfig-011-20231026   gcc  
i386                  randconfig-011-20231027   gcc  
i386                  randconfig-012-20231026   gcc  
i386                  randconfig-012-20231027   gcc  
i386                  randconfig-013-20231026   gcc  
i386                  randconfig-013-20231027   gcc  
i386                  randconfig-014-20231026   gcc  
i386                  randconfig-014-20231027   gcc  
i386                  randconfig-015-20231026   gcc  
i386                  randconfig-015-20231027   gcc  
i386                  randconfig-016-20231026   gcc  
i386                  randconfig-016-20231027   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231026   gcc  
loongarch             randconfig-001-20231027   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                         wii_defconfig   gcc  
powerpc64                           defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20231026   gcc  
riscv                 randconfig-001-20231027   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231026   gcc  
s390                  randconfig-001-20231027   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231026   gcc  
sparc                 randconfig-001-20231027   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-001-20231027   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-002-20231027   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-003-20231027   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-004-20231027   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-005-20231027   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64       buildonly-randconfig-006-20231027   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231026   gcc  
x86_64                randconfig-001-20231027   gcc  
x86_64                randconfig-002-20231026   gcc  
x86_64                randconfig-002-20231027   gcc  
x86_64                randconfig-003-20231026   gcc  
x86_64                randconfig-003-20231027   gcc  
x86_64                randconfig-004-20231026   gcc  
x86_64                randconfig-004-20231027   gcc  
x86_64                randconfig-005-20231026   gcc  
x86_64                randconfig-005-20231027   gcc  
x86_64                randconfig-006-20231026   gcc  
x86_64                randconfig-006-20231027   gcc  
x86_64                randconfig-011-20231026   gcc  
x86_64                randconfig-011-20231027   gcc  
x86_64                randconfig-012-20231026   gcc  
x86_64                randconfig-012-20231027   gcc  
x86_64                randconfig-013-20231026   gcc  
x86_64                randconfig-013-20231027   gcc  
x86_64                randconfig-014-20231026   gcc  
x86_64                randconfig-014-20231027   gcc  
x86_64                randconfig-015-20231026   gcc  
x86_64                randconfig-015-20231027   gcc  
x86_64                randconfig-016-20231026   gcc  
x86_64                randconfig-016-20231027   gcc  
x86_64                randconfig-071-20231026   gcc  
x86_64                randconfig-071-20231027   gcc  
x86_64                randconfig-072-20231026   gcc  
x86_64                randconfig-072-20231027   gcc  
x86_64                randconfig-073-20231026   gcc  
x86_64                randconfig-073-20231027   gcc  
x86_64                randconfig-074-20231026   gcc  
x86_64                randconfig-074-20231027   gcc  
x86_64                randconfig-075-20231026   gcc  
x86_64                randconfig-075-20231027   gcc  
x86_64                randconfig-076-20231026   gcc  
x86_64                randconfig-076-20231027   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
