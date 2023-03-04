Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0016AA777
	for <lists+linux-leds@lfdr.de>; Sat,  4 Mar 2023 02:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjCDB7e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Mar 2023 20:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCDB7d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Mar 2023 20:59:33 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160C8136F5
        for <linux-leds@vger.kernel.org>; Fri,  3 Mar 2023 17:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677895173; x=1709431173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8CINLjQtDf/qIQzqThY972IETX7xD00Y1TVbmWvhffs=;
  b=bhhrVaAPFVA0Lm+E+vqo3X6UE8914xk9RiYOXDS3ZBbjbnqzyggCiEyW
   39H1sBI/kMIWOoWJlE0HPxIpQrwSv3uFFa7m3UMciTeu1y/I+PubG0UWT
   pIrhb+qpdAzocEr4sz69ET2/FBTZ07I6KWMVZLIfqW+HAsrkif0fQeChw
   NBKItK7mDBI2dlShxMQ3eSj7WEu3ojwK6NwENfwEEvIxzEZkWnwo0EOX6
   U1cmXwYV1wqMYGQQo/aRGB/ty0Bp/uPCkrUmVm+9v6P9BzSR08wiMuZab
   5Xlybu098+AC8o3onx2TqmJV2epvmJICj7aWwPFBoT6HzFy0jCvJBvtdQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332685045"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="332685045"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 17:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="744436479"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="744436479"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2023 17:59:31 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pYHBK-0001ms-2z;
        Sat, 04 Mar 2023 01:59:30 +0000
Date:   Sat, 04 Mar 2023 09:58:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 140d9006dd017fd9ea7c2d721d68ec3c83e2254e
Message-ID: <6402a5d0.MIxSP4NIi4J91VXX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 140d9006dd017fd9ea7c2d721d68ec3c83e2254e  leds: Fix reference to led_set_brightness() in doc

elapsed time: 722m

configs tested: 101
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230302   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230303   clang
arm                  randconfig-r015-20230302   gcc  
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230303   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230302   gcc  
hexagon              randconfig-r006-20230302   clang
hexagon              randconfig-r026-20230302   clang
hexagon              randconfig-r033-20230302   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
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
ia64         buildonly-randconfig-r002-20230302   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230302   gcc  
ia64                 randconfig-r012-20230302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230303   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230302   gcc  
m68k                 randconfig-r014-20230302   gcc  
m68k                 randconfig-r021-20230302   gcc  
m68k                 randconfig-r035-20230302   gcc  
microblaze           randconfig-r004-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r005-20230302   gcc  
openrisc             randconfig-r024-20230302   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230302   clang
powerpc              randconfig-r034-20230302   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230302   clang
riscv                               defconfig   gcc  
riscv                randconfig-r016-20230303   gcc  
riscv                randconfig-r036-20230302   gcc  
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230302   gcc  
sparc64              randconfig-r002-20230302   gcc  
sparc64              randconfig-r025-20230302   gcc  
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
