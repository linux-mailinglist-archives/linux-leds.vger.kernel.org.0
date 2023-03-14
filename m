Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4286B8A2B
	for <lists+linux-leds@lfdr.de>; Tue, 14 Mar 2023 06:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjCNFQU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Mar 2023 01:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCNFQT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Mar 2023 01:16:19 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536668EA11
        for <linux-leds@vger.kernel.org>; Mon, 13 Mar 2023 22:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678770978; x=1710306978;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t+SNnTN6H5to+56k65r4XGDx7lFIIttMCbI1SRqX9TY=;
  b=Y+xD4FYUTkAKUBswpRXLUlw47zrxJymACrEgm5CkHP0g/+bv0p4QaH8S
   B1vnxlrha47DHOP5bLXQ4sXiBM1fS1XIaI2NTZgCPgJQCMisPdcETacKQ
   XrfFZv5zPiF/Fyq0vEDZMQP67e6XyGR971x9yf8stVkJgDscIGFz/K8LH
   3QfsHjmgEbu6y5zpCOrNFn/5wuJQko6UDI7G4POtVQSTgauqilP0uZW+p
   Y1og0bTVgE7nBK2pWCSyD95MxQYBSuS59L/COzWI025Mkh5QkJdmfC6hr
   Xja0kcaCOEwls+knPOzjXc5J+QjCT8ZkvCW6XdTOwxjxBDRtsfRr2EQ3M
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321187303"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="321187303"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 22:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743167905"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="743167905"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2023 22:16:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pbx1D-0006YZ-0v;
        Tue, 14 Mar 2023 05:16:15 +0000
Date:   Tue, 14 Mar 2023 13:16:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 faa7f34a47f057dee571861eccadfe81834dde6c
Message-ID: <64100316.tqhL0xTNFeHw7f/Z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: faa7f34a47f057dee571861eccadfe81834dde6c  leds: tlc591xx: Mark OF related data as maybe unused

elapsed time: 723m

configs tested: 127
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230313   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230313   gcc  
alpha                randconfig-r026-20230313   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230312   gcc  
arc                  randconfig-r024-20230313   gcc  
arc                  randconfig-r031-20230312   gcc  
arc                  randconfig-r034-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230312   clang
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230313   clang
arm64                randconfig-r013-20230312   gcc  
arm64                randconfig-r034-20230313   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230312   gcc  
csky                 randconfig-r025-20230312   gcc  
csky                 randconfig-r035-20230312   gcc  
hexagon              randconfig-r001-20230312   clang
hexagon              randconfig-r005-20230313   clang
hexagon              randconfig-r016-20230313   clang
hexagon              randconfig-r033-20230312   clang
hexagon              randconfig-r035-20230313   clang
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
i386                 randconfig-r023-20230313   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230313   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r036-20230313   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230313   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230313   gcc  
microblaze           randconfig-r023-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r031-20230313   clang
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230312   gcc  
nios2                randconfig-r014-20230312   gcc  
openrisc             randconfig-r032-20230312   gcc  
openrisc             randconfig-r036-20230312   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230312   gcc  
parisc               randconfig-r033-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230313   clang
powerpc              randconfig-r016-20230312   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230313   clang
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230312   clang
s390                 randconfig-r013-20230313   clang
s390                 randconfig-r025-20230313   clang
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230313   gcc  
sh                   randconfig-r022-20230312   gcc  
sh                   randconfig-r022-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230313   gcc  
sparc64              randconfig-r001-20230313   gcc  
sparc64              randconfig-r004-20230313   gcc  
sparc64              randconfig-r021-20230313   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230313   gcc  
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
xtensa               randconfig-r015-20230312   gcc  
xtensa               randconfig-r032-20230313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
