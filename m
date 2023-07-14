Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C34753614
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 11:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbjGNJIM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 05:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235844AbjGNJIF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 05:08:05 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00A32728
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 02:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689325678; x=1720861678;
  h=date:from:to:cc:subject:message-id;
  bh=ZjaK5hR16w4gHcrA8CKzFZYrB3Z3vbr+l+yihwiAoR4=;
  b=YkLQ06oXIa0xet3RS/LL5rfvSVvSQu7+xUdzHY4I99DDXGXpE8OIYttJ
   6W4qbzq0ILpSIE8h/nG7D8bYOuESb0Yu5KFZZvcjbKoULJRmSOjvoJ5DC
   Dafsy3JE5mzRfgx7gMjhJAQltMvBmxEFGW3vVN0ZkEOrI3lX4hyG4IOJ7
   XthtevYfCDef9biegCc5dyue69bZHiM0EMyVexVDKNlnX0CQx/zxTKr3U
   45p00zJR7QfAHvWq50eIZFfvbryQbQZ226Rfm9nQqbHyfMf1iIGwJCDLz
   54u+bk5cM4/LFSa/1jo2QHbRMfMhyBDNR9Jspfk0dDsS/W86+9+zIEL53
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364303284"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="364303284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 02:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672626151"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="672626151"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Jul 2023 02:06:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qKEku-0007Kj-0P;
        Fri, 14 Jul 2023 09:06:28 +0000
Date:   Fri, 14 Jul 2023 17:06:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 7a2b85a76b05f16e8e788d035afcacdd4faa1d71
Message-ID: <202307141711.X8TIEIWs-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 7a2b85a76b05f16e8e788d035afcacdd4faa1d71  leds: simatic-ipc-leds-gpio: Fix comment style in SPDX header

elapsed time: 724m

configs tested: 116
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230713   gcc  
arc                  randconfig-r043-20230713   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230713   clang
arm                  randconfig-r046-20230713   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230713   gcc  
arm64                randconfig-r036-20230713   clang
csky                                defconfig   gcc  
csky                 randconfig-r025-20230713   gcc  
hexagon              randconfig-r041-20230713   clang
hexagon              randconfig-r045-20230713   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230713   clang
i386         buildonly-randconfig-r005-20230713   clang
i386         buildonly-randconfig-r006-20230713   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230713   clang
i386                 randconfig-i002-20230713   clang
i386                 randconfig-i003-20230713   clang
i386                 randconfig-i004-20230713   clang
i386                 randconfig-i005-20230713   clang
i386                 randconfig-i006-20230713   clang
i386                 randconfig-i011-20230713   gcc  
i386                 randconfig-i012-20230713   gcc  
i386                 randconfig-i013-20230713   gcc  
i386                 randconfig-i014-20230713   gcc  
i386                 randconfig-i015-20230713   gcc  
i386                 randconfig-i016-20230713   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r033-20230713   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r031-20230713   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230713   gcc  
nios2                randconfig-r015-20230713   gcc  
openrisc             randconfig-r022-20230713   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230713   gcc  
parisc               randconfig-r023-20230713   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r026-20230713   gcc  
powerpc              randconfig-r032-20230713   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230713   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r035-20230713   clang
s390                 randconfig-r044-20230713   gcc  
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230713   gcc  
sparc                randconfig-r016-20230713   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230713   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230713   clang
x86_64       buildonly-randconfig-r002-20230713   clang
x86_64       buildonly-randconfig-r003-20230713   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230713   clang
x86_64               randconfig-x001-20230713   gcc  
x86_64               randconfig-x002-20230713   gcc  
x86_64               randconfig-x003-20230713   gcc  
x86_64               randconfig-x004-20230713   gcc  
x86_64               randconfig-x005-20230713   gcc  
x86_64               randconfig-x006-20230713   gcc  
x86_64               randconfig-x011-20230713   clang
x86_64               randconfig-x012-20230713   clang
x86_64               randconfig-x013-20230713   clang
x86_64               randconfig-x014-20230713   clang
x86_64               randconfig-x015-20230713   clang
x86_64               randconfig-x016-20230713   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230713   gcc  
xtensa               randconfig-r034-20230713   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
