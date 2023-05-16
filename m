Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6CD70430C
	for <lists+linux-leds@lfdr.de>; Tue, 16 May 2023 03:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjEPBnw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 May 2023 21:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjEPBnv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2023 21:43:51 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5F01BF
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 18:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684201430; x=1715737430;
  h=date:from:to:cc:subject:message-id;
  bh=uA+TJQxNjVb4p9Nu/bRxSu3RKjcmZBquxUZJ57C8hAs=;
  b=AwJK79Xotw2ZNkKRzr3Rxb84XS707OlK0esdI2sqs3NJqEIMgDDn5oki
   36wHDqD7YWGypCwZMVgc12v2yY0Oh2K+BrgESYgpgbbF7PrM0D0ISPEqj
   fpEskeDBji9kGobavLKg6hRR7Fm8Sl1G6jcocjBisHVi526fIayp+hegK
   2DpY6cvCf5tVmjixf3iAIkgieV1B1MEcOa8jYPpB+E5ZlFz19bDN/97OS
   5IXEVOpbMckSmlKdzzdL26ElreTmAv283fFP3I8w1wJQDZVg+7FPSFLy0
   NETbi9t1vOD4hzrFRz4dXf4wDt7sykngOctd4r4fzjm0cKK00MWgcnf9V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379528808"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="379528808"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 18:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="651638321"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="651638321"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 May 2023 18:43:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pyjj9-0006q0-3D;
        Tue, 16 May 2023 01:43:47 +0000
Date:   Tue, 16 May 2023 09:43:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 7a9496d0feb5fefdc9a556ce189f8a7326e40625
Message-ID: <20230516014342.Yshct%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
branch HEAD: 7a9496d0feb5fefdc9a556ce189f8a7326e40625  dt-bindings: leds: Drop redundant cpus enum match

elapsed time: 945m

configs tested: 189
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230515   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230515   gcc  
alpha                randconfig-r012-20230515   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r043-20230515   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r003-20230515   gcc  
arm                  randconfig-r025-20230515   clang
arm                  randconfig-r046-20230515   clang
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230515   clang
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230515   gcc  
arm64                randconfig-r015-20230515   gcc  
arm64                randconfig-r022-20230515   gcc  
arm64                randconfig-r026-20230515   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230515   gcc  
csky                 randconfig-r014-20230515   gcc  
hexagon              randconfig-r006-20230515   clang
hexagon              randconfig-r021-20230515   clang
hexagon              randconfig-r023-20230515   clang
hexagon              randconfig-r041-20230515   clang
hexagon              randconfig-r045-20230515   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230515   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230515   clang
i386                 randconfig-a002-20230515   clang
i386                 randconfig-a003-20230515   clang
i386                 randconfig-a004-20230515   clang
i386                 randconfig-a005-20230515   clang
i386                 randconfig-a006-20230515   clang
i386                 randconfig-a011-20230515   gcc  
i386                 randconfig-a012-20230515   gcc  
i386                 randconfig-a013-20230515   gcc  
i386                 randconfig-a014-20230515   gcc  
i386                 randconfig-a015-20230515   gcc  
i386                 randconfig-a016-20230515   gcc  
i386                 randconfig-i051-20230515   clang
i386                 randconfig-i052-20230515   clang
i386                 randconfig-i053-20230515   clang
i386                 randconfig-i054-20230515   clang
i386                 randconfig-i055-20230515   clang
i386                 randconfig-i056-20230515   clang
i386                 randconfig-i061-20230515   clang
i386                 randconfig-i062-20230515   clang
i386                 randconfig-i063-20230515   clang
i386                 randconfig-i064-20230515   clang
i386                 randconfig-i065-20230515   clang
i386                 randconfig-i066-20230515   clang
i386                 randconfig-i071-20230515   gcc  
i386                          randconfig-i071   clang
i386                 randconfig-i072-20230515   gcc  
i386                 randconfig-i073-20230515   gcc  
i386                          randconfig-i073   clang
i386                 randconfig-i074-20230515   gcc  
i386                 randconfig-i075-20230515   gcc  
i386                          randconfig-i075   clang
i386                 randconfig-i076-20230515   gcc  
i386                 randconfig-i081-20230515   gcc  
i386                 randconfig-i082-20230515   gcc  
i386                 randconfig-i083-20230515   gcc  
i386                 randconfig-i084-20230515   gcc  
i386                 randconfig-i085-20230515   gcc  
i386                 randconfig-i086-20230515   gcc  
i386                 randconfig-i091-20230515   clang
i386                 randconfig-i092-20230515   clang
i386                 randconfig-i093-20230515   clang
i386                 randconfig-i094-20230515   clang
i386                 randconfig-i095-20230515   clang
i386                 randconfig-i096-20230515   clang
i386                 randconfig-r031-20230515   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230515   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230515   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230515   gcc  
m68k                 randconfig-r034-20230515   gcc  
microblaze           randconfig-r011-20230515   gcc  
microblaze           randconfig-r024-20230515   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                 randconfig-r022-20230515   clang
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230515   gcc  
nios2                randconfig-r033-20230515   gcc  
openrisc     buildonly-randconfig-r003-20230515   gcc  
openrisc     buildonly-randconfig-r006-20230515   gcc  
parisc       buildonly-randconfig-r006-20230515   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230515   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc                     tqm8560_defconfig   clang
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230515   clang
riscv                randconfig-r013-20230515   gcc  
riscv                randconfig-r042-20230515   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230515   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230515   gcc  
sh                   randconfig-r035-20230515   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230515   gcc  
sparc                randconfig-r034-20230515   gcc  
sparc64              randconfig-r024-20230515   gcc  
sparc64              randconfig-r032-20230515   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230515   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230515   clang
x86_64               randconfig-a002-20230515   clang
x86_64               randconfig-a003-20230515   clang
x86_64               randconfig-a004-20230515   clang
x86_64               randconfig-a005-20230515   clang
x86_64               randconfig-a006-20230515   clang
x86_64               randconfig-a011-20230515   gcc  
x86_64               randconfig-a012-20230515   gcc  
x86_64               randconfig-a013-20230515   gcc  
x86_64               randconfig-a014-20230515   gcc  
x86_64               randconfig-a015-20230515   gcc  
x86_64               randconfig-a016-20230515   gcc  
x86_64               randconfig-k001-20230515   gcc  
x86_64               randconfig-r036-20230515   clang
x86_64               randconfig-x051-20230515   gcc  
x86_64               randconfig-x052-20230515   gcc  
x86_64               randconfig-x053-20230515   gcc  
x86_64               randconfig-x054-20230515   gcc  
x86_64               randconfig-x055-20230515   gcc  
x86_64               randconfig-x056-20230515   gcc  
x86_64               randconfig-x061-20230515   gcc  
x86_64               randconfig-x062-20230515   gcc  
x86_64               randconfig-x063-20230515   gcc  
x86_64               randconfig-x064-20230515   gcc  
x86_64               randconfig-x065-20230515   gcc  
x86_64               randconfig-x066-20230515   gcc  
x86_64               randconfig-x071-20230515   clang
x86_64               randconfig-x072-20230515   clang
x86_64               randconfig-x073-20230515   clang
x86_64               randconfig-x074-20230515   clang
x86_64               randconfig-x075-20230515   clang
x86_64               randconfig-x076-20230515   clang
x86_64               randconfig-x081-20230515   clang
x86_64               randconfig-x082-20230515   clang
x86_64               randconfig-x083-20230515   clang
x86_64               randconfig-x084-20230515   clang
x86_64               randconfig-x085-20230515   clang
x86_64               randconfig-x086-20230515   clang
x86_64               randconfig-x091-20230515   gcc  
x86_64               randconfig-x092-20230515   gcc  
x86_64               randconfig-x093-20230515   gcc  
x86_64               randconfig-x094-20230515   gcc  
x86_64               randconfig-x095-20230515   gcc  
x86_64               randconfig-x096-20230515   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230515   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
