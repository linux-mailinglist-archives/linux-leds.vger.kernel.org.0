Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62996BF231
	for <lists+linux-leds@lfdr.de>; Fri, 17 Mar 2023 21:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjCQUOb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Mar 2023 16:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjCQUOa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Mar 2023 16:14:30 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17F2252AB
        for <linux-leds@vger.kernel.org>; Fri, 17 Mar 2023 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679084069; x=1710620069;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rB4rNOGkBwb5mvJxoziOF4vMr/BCbjQKq3VS1VBJ5Ew=;
  b=QJI47ZpMxMGMWMaPaiXICs8OiIJajFaCRa32y7k8v0nOJCpIie8xkgYu
   aImLx/Bsxj+M+asmtynWW1/M1WL7I6wDfZGlINPKGcBR2mj/U6OM6q5YF
   f2gNuPZ1BDNiH19TFvMJI3oMR9j6AdrKIoW6sbgN80pyni7E8Y1v1fIAh
   +H7SvqyRk8YUM9GbraGrpUcjqEIu2JvzwCgrGSumbOUUL+dm50PPTlKq5
   YoLr4AqkslH6OP18frT7d6Iftm67fYEfEQ2WXVMwiviR3XiiAKlfnDJpo
   YCEIOEJD6FD8MD7sYwGkS9/eHtiiSu9NzHKjbCXmCx7BUGpjYv8rVWXnZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326715803"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="326715803"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 13:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630388241"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630388241"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 13:14:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdGSw-0009Yw-0P;
        Fri, 17 Mar 2023 20:14:18 +0000
Date:   Sat, 18 Mar 2023 04:13:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 4ba9df04b7ac66d2d000ed7ae2d8136302d99a57
Message-ID: <6414c9f8.Jh2KXs7s0AqEH4dQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 4ba9df04b7ac66d2d000ed7ae2d8136302d99a57  docs: leds: Add MT6370 RGB LED pattern document

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303171729.CcgyFx17-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/leds/rgb/leds-mt6370-rgb.c:889:15: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET
|-- arm-allyesconfig
|   `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET
|-- i386-allyesconfig
|   `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET
|-- ia64-allmodconfig
|   `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET
|-- m68k-allmodconfig
|   `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET
|-- powerpc-allmodconfig
|   `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET
`-- sparc-allyesconfig
    `-- drivers-leds-rgb-leds-mt6370-rgb.c:error:implicit-declaration-of-function-FIELD_GET

elapsed time: 721m

configs tested: 111
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r026-20230315   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230312   gcc  
arm                  randconfig-r006-20230313   clang
arm                  randconfig-r011-20230312   clang
arm                  randconfig-r021-20230315   gcc  
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230312   clang
arm64                randconfig-r006-20230312   clang
csky                                defconfig   gcc  
csky                 randconfig-r014-20230313   gcc  
csky                 randconfig-r031-20230313   gcc  
hexagon              randconfig-r013-20230312   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r004-20230313   gcc  
i386                 randconfig-r032-20230313   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230312   gcc  
ia64                 randconfig-r015-20230313   gcc  
ia64                 randconfig-r016-20230313   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230313   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230313   gcc  
m68k                 randconfig-r005-20230312   gcc  
m68k                 randconfig-r023-20230315   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230313   gcc  
openrisc             randconfig-r003-20230312   gcc  
openrisc             randconfig-r022-20230315   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230313   clang
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230313   gcc  
s390                 randconfig-r024-20230315   clang
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230313   gcc  
sparc                randconfig-r025-20230315   gcc  
sparc                randconfig-r033-20230313   gcc  
sparc                randconfig-r035-20230313   gcc  
sparc64              randconfig-r013-20230313   gcc  
sparc64              randconfig-r015-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
