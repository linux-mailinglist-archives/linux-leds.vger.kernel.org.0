Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64D786C5D72
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 04:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCWDtM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 23:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjCWDtL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 23:49:11 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A952E3B2
        for <linux-leds@vger.kernel.org>; Wed, 22 Mar 2023 20:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679543349; x=1711079349;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rB2lMbaKJ0zwdipBtsBFqfKhRP+Szg38EKvorprWx7k=;
  b=R8PaMBBeW13w00b16ps4NK90TNl/QRGqYPrKyIcuTUEOjRO06PNDt2kt
   SX9s/s29TFUT8wfYD6sLKm/dpCMn2bYend6MR71kZCpAUhpwNobQhRH5O
   4KLNUNJSamArmu0oqwCQTHIY8h5ZmqdHKp3uGr5tgs5clYoeGWXu1KIVG
   ruCsUbwYuS5kGivwA3aib8x6RMg7nO29Lw07NNyQOeJzTevtELOZKERNp
   hnxY7U8eh/boGO+1Da5JqZCLaBGtMZ2pDB+xvg5Q4T+rc1XHszLg0vmSR
   xKB06yIrhPrWWYtuiqVgGRfC4OL9Uzyt0PPJpUZNyLlnh8p1W0y/HkTzW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336893733"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="336893733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 20:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746554645"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746554645"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2023 20:49:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfBwp-000DvB-0A;
        Thu, 23 Mar 2023 03:49:07 +0000
Date:   Thu, 23 Mar 2023 11:48:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 8faac9aba0d89d99608396fd8f6e049a545bfcf9
Message-ID: <641bcbf9.BxARvAz+tHdaeTI9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 8faac9aba0d89d99608396fd8f6e049a545bfcf9  leds: rgb: mt6370: Fix implicit declaration for FIELD_GET

elapsed time: 721m

configs tested: 157
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230322   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r024-20230322   gcc  
arc                  randconfig-r034-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r013-20230322   clang
arm                  randconfig-r022-20230322   clang
arm                  randconfig-r046-20230322   clang
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r001-20230322   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230322   gcc  
csky                 randconfig-r011-20230322   gcc  
csky                 randconfig-r012-20230322   gcc  
csky                 randconfig-r013-20230322   gcc  
csky                 randconfig-r016-20230322   gcc  
csky                 randconfig-r024-20230322   gcc  
csky                 randconfig-r026-20230322   gcc  
hexagon      buildonly-randconfig-r003-20230322   clang
hexagon              randconfig-r004-20230322   clang
hexagon              randconfig-r006-20230322   clang
hexagon              randconfig-r011-20230322   clang
hexagon              randconfig-r015-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
ia64         buildonly-randconfig-r003-20230322   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r013-20230322   gcc  
ia64                 randconfig-r031-20230322   gcc  
ia64                 randconfig-r032-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230322   gcc  
loongarch    buildonly-randconfig-r002-20230322   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230322   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230322   gcc  
m68k                 randconfig-r031-20230322   gcc  
microblaze           randconfig-r001-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230322   gcc  
mips                 randconfig-r034-20230322   gcc  
mips                 randconfig-r036-20230322   gcc  
nios2        buildonly-randconfig-r002-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230322   gcc  
nios2                randconfig-r015-20230322   gcc  
openrisc     buildonly-randconfig-r006-20230322   gcc  
openrisc             randconfig-r002-20230322   gcc  
openrisc             randconfig-r015-20230322   gcc  
openrisc             randconfig-r016-20230322   gcc  
openrisc             randconfig-r022-20230322   gcc  
openrisc             randconfig-r023-20230322   gcc  
openrisc             randconfig-r026-20230322   gcc  
openrisc             randconfig-r033-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230322   gcc  
parisc               randconfig-r012-20230322   gcc  
parisc               randconfig-r013-20230322   gcc  
parisc               randconfig-r016-20230322   gcc  
parisc               randconfig-r024-20230322   gcc  
parisc               randconfig-r036-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc      buildonly-randconfig-r004-20230322   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc              randconfig-r013-20230322   gcc  
powerpc              randconfig-r033-20230322   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230322   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230322   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r003-20230322   clang
s390                 randconfig-r022-20230322   gcc  
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                   randconfig-r016-20230322   gcc  
sh                   randconfig-r034-20230322   gcc  
sh                   randconfig-r036-20230322   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230322   gcc  
sparc                randconfig-r014-20230322   gcc  
sparc                randconfig-r035-20230322   gcc  
sparc64              randconfig-r026-20230322   gcc  
sparc64              randconfig-r033-20230322   gcc  
sparc64              randconfig-r035-20230322   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
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
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230322   gcc  
xtensa               randconfig-r002-20230322   gcc  
xtensa               randconfig-r005-20230322   gcc  
xtensa               randconfig-r032-20230322   gcc  
xtensa               randconfig-r035-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
