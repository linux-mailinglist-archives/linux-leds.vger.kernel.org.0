Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E855F6F112C
	for <lists+linux-leds@lfdr.de>; Fri, 28 Apr 2023 06:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjD1E6V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Apr 2023 00:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjD1E6V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Apr 2023 00:58:21 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1963426A1
        for <linux-leds@vger.kernel.org>; Thu, 27 Apr 2023 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682657900; x=1714193900;
  h=date:from:to:cc:subject:message-id;
  bh=JoXjL8DWeez8lektwez/cNt2hVWhQtC4d95hEWKCX1U=;
  b=bTSiF8ea97UnvHwqIW4NQcNAhaNHtdTMU00B3r/VWRZ+7hJezZkAnhVx
   zY7l7rGDjSnli7CKjvLZKvFlnWeMrqm9Q6Z3ryzefXA1VeFtCyrP6mdFu
   CyaHCuPco0pzHyJVpBoq1XUg1liEctpr0BqsvusJpl4jttWqsTZks5RGJ
   w471XU3XAmhGL54I1pxeZa/zT1ffwQtAU5a/wWN8T6JHLz15jLbRYjl53
   AMjVMUmawG34Lg6Zbd/Br3eBqI15LyNCa1elMG7Mkx9dA1W7oA7Lg9GbV
   4NYXxS+CG4LxSsPxPkhs8MOQsMzfHRU5zsZld/FUDsJaD87RXLjnhtZPI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375644334"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="375644334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 21:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727399248"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727399248"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 21:58:18 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1psGBW-00007l-0e;
        Fri, 28 Apr 2023 04:58:18 +0000
Date:   Fri, 28 Apr 2023 12:58:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 8325642d2757eba80210dec727bb0bcffb837ff1
Message-ID: <20230428045802.E9MUI%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 8325642d2757eba80210dec727bb0bcffb837ff1  leds: bd2606mvv: Driver for the Rohm 6 Channel i2c LED driver

elapsed time: 722m

configs tested: 118
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230427   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230428   gcc  
arc                  randconfig-r043-20230427   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                  randconfig-r004-20230427   clang
arm                  randconfig-r012-20230427   gcc  
arm                  randconfig-r046-20230427   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230427   gcc  
csky         buildonly-randconfig-r003-20230427   gcc  
csky         buildonly-randconfig-r004-20230427   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230427   gcc  
csky                 randconfig-r023-20230427   gcc  
csky                 randconfig-r026-20230428   gcc  
hexagon              randconfig-r021-20230427   clang
hexagon              randconfig-r034-20230427   clang
hexagon              randconfig-r041-20230427   clang
hexagon              randconfig-r045-20230427   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230427   gcc  
ia64                 randconfig-r025-20230427   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r024-20230427   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230427   gcc  
microblaze           randconfig-r004-20230428   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
mips                 randconfig-r036-20230427   clang
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230427   gcc  
openrisc     buildonly-randconfig-r005-20230427   gcc  
openrisc             randconfig-r001-20230428   gcc  
openrisc             randconfig-r005-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc              randconfig-r026-20230427   clang
powerpc              randconfig-r033-20230427   gcc  
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230427   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230427   gcc  
s390                 randconfig-r021-20230428   gcc  
s390                 randconfig-r044-20230427   clang
sh                               allmodconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r016-20230427   gcc  
sh                   randconfig-r022-20230427   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230428   gcc  
sparc                randconfig-r013-20230427   gcc  
sparc                randconfig-r032-20230427   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r024-20230428   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230427   gcc  
xtensa               randconfig-r015-20230427   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
