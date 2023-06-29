Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DC2741F82
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jun 2023 07:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjF2FIV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jun 2023 01:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjF2FIM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jun 2023 01:08:12 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC1C2728
        for <linux-leds@vger.kernel.org>; Wed, 28 Jun 2023 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688015292; x=1719551292;
  h=date:from:to:cc:subject:message-id;
  bh=OR2DRoqzgbn1FYKFSrCr4HckouNG2OKVcHEmqDsMzK4=;
  b=dZM20TYTKIsZlfdLApKJhOy/bF2tVjjWO79PqNYTk+YGVHDcG38zqU1H
   5MflSyqpNA0EhQkaNCQqi5BnHGiusMPqneL4Wk+Gv6/CGzbfux1a85j/J
   o+RMoQuTMxqan1444q1ns3bwu+ApRCWQcigACulVK4H9cFgpBsJBIVcas
   d1lcb5nK4G0/Kzdn6BPItBY4iQszhAfJ9wIEMUHqmYpX66PDVoB8fMAl1
   DopviM4C75iYpS+ZzaUyi2K/zqU325kzDAnKnmK5nsydevC3C44Y0dq86
   avSHdWEAbMmC4zxKa97/AemGi9Ose6g52RehNzkfvgJPRBzr79H7ApHzw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364573216"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="364573216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 22:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830395867"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="830395867"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2023 22:08:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qEjt3-000Dpj-1e;
        Thu, 29 Jun 2023 05:08:09 +0000
Date:   Thu, 29 Jun 2023 13:07:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 877e91191ccf0782ae18c5dfa7522fb1e5bfba8c
Message-ID: <202306291351.sftXimk5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 877e91191ccf0782ae18c5dfa7522fb1e5bfba8c  leds: leds-mt6323: Adjust return/parameter types in wled get/set callbacks

elapsed time: 723m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230628   gcc  
alpha                randconfig-r032-20230628   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230629   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230629   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230628   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230628   gcc  
hexagon              randconfig-r041-20230629   clang
hexagon              randconfig-r045-20230629   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230628   clang
i386         buildonly-randconfig-r005-20230628   clang
i386         buildonly-randconfig-r006-20230628   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230628   clang
i386                 randconfig-i002-20230628   clang
i386                 randconfig-i003-20230628   clang
i386                 randconfig-i004-20230628   clang
i386                 randconfig-i005-20230628   clang
i386                 randconfig-i006-20230628   clang
i386                 randconfig-i011-20230628   gcc  
i386                 randconfig-i012-20230628   gcc  
i386                 randconfig-i013-20230628   gcc  
i386                 randconfig-i014-20230628   gcc  
i386                 randconfig-i015-20230628   gcc  
i386                 randconfig-i016-20230628   gcc  
i386                 randconfig-r021-20230628   gcc  
i386                 randconfig-r026-20230628   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230628   gcc  
loongarch            randconfig-r035-20230628   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230628   gcc  
m68k                 randconfig-r014-20230628   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230628   gcc  
riscv                randconfig-r023-20230628   gcc  
riscv                randconfig-r042-20230629   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230629   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230628   gcc  
sh                   randconfig-r006-20230628   gcc  
sh                   randconfig-r025-20230628   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230628   gcc  
sparc                randconfig-r034-20230628   gcc  
sparc64              randconfig-r024-20230628   gcc  
sparc64              randconfig-r031-20230628   gcc  
sparc64              randconfig-r033-20230628   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r036-20230628   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230628   clang
x86_64       buildonly-randconfig-r002-20230628   clang
x86_64       buildonly-randconfig-r003-20230628   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r016-20230628   gcc  
x86_64               randconfig-x001-20230628   gcc  
x86_64               randconfig-x002-20230628   gcc  
x86_64               randconfig-x003-20230628   gcc  
x86_64               randconfig-x004-20230628   gcc  
x86_64               randconfig-x005-20230628   gcc  
x86_64               randconfig-x006-20230628   gcc  
x86_64               randconfig-x011-20230628   clang
x86_64               randconfig-x012-20230628   clang
x86_64               randconfig-x013-20230628   clang
x86_64               randconfig-x014-20230628   clang
x86_64               randconfig-x015-20230628   clang
x86_64               randconfig-x016-20230628   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230628   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
