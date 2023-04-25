Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435666EDA1F
	for <lists+linux-leds@lfdr.de>; Tue, 25 Apr 2023 04:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbjDYCCO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Apr 2023 22:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbjDYCCN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2023 22:02:13 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE144EE4
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 19:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682388132; x=1713924132;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o5FVSxT73vW/Ad8Me7eXyOfXX10J5niEGCpo95dp3LQ=;
  b=j8CfsKiSGUzLNF/BQyDUlC7K3/KN294VtJOzfVS+zQhPEbyAvucrLEw7
   TeWqUjLzRPR9zTSW5KACXOkGO7dLQ7B4uU6dLT/LsalnLYkp98Avv6wOY
   Qtj+NtrH48dn1qqL8sXHSNjKTzI6HJ08+TqhSfR/S+8IwO011DHXWY+Ls
   mUT734SGqoL90OaxFf5BaQau/GnwhYRvsZbzQi17rs8zShpV54/S9Sy9A
   1Nwhx1YA3V1B/b/8J5An4S2HtrynsECqrf9GJKYqN5HdslX1lTh7r9o0M
   r9rEQsKIPDvrGCY7HVp8k8Fg3xZooIRaf27xSzI0Q+othyOOBMe4pRavj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326933920"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="326933920"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 19:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693301490"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="693301490"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Apr 2023 19:02:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pr80Q-000iqY-0N;
        Tue, 25 Apr 2023 02:02:10 +0000
Date:   Tue, 25 Apr 2023 10:01:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 36cd9fb5344675e9b9d9f96eabcb3cdfdbacc841
Message-ID: <64473475.8RmBMJgJNRh9AMCu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 36cd9fb5344675e9b9d9f96eabcb3cdfdbacc841  dt-bindings: leds: Add ROHM BD2606MVV LED

elapsed time: 726m

configs tested: 134
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230423   gcc  
alpha                randconfig-r013-20230423   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r002-20230423   gcc  
arc                  randconfig-r022-20230424   gcc  
arc                  randconfig-r025-20230423   gcc  
arc                  randconfig-r026-20230424   gcc  
arc                  randconfig-r043-20230423   gcc  
arc                  randconfig-r043-20230424   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230424   gcc  
arm                  randconfig-r012-20230423   gcc  
arm                  randconfig-r046-20230423   gcc  
arm                  randconfig-r046-20230424   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230423   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230424   clang
arm64                randconfig-r023-20230424   gcc  
arm64                randconfig-r025-20230424   gcc  
arm64                randconfig-r032-20230423   gcc  
csky         buildonly-randconfig-r003-20230424   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230423   gcc  
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r041-20230424   clang
hexagon              randconfig-r045-20230423   clang
hexagon              randconfig-r045-20230424   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                 randconfig-r032-20230424   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230423   gcc  
ia64                 randconfig-r036-20230423   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230424   gcc  
loongarch            randconfig-r034-20230424   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r003-20230424   gcc  
microblaze           randconfig-r021-20230423   gcc  
microblaze           randconfig-r035-20230423   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230423   clang
mips                 randconfig-r011-20230423   gcc  
mips                 randconfig-r015-20230424   clang
mips                 randconfig-r024-20230424   clang
nios2        buildonly-randconfig-r004-20230424   gcc  
nios2        buildonly-randconfig-r006-20230423   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r031-20230423   gcc  
nios2                randconfig-r031-20230424   gcc  
openrisc     buildonly-randconfig-r001-20230424   gcc  
openrisc     buildonly-randconfig-r004-20230423   gcc  
openrisc             randconfig-r006-20230424   gcc  
openrisc             randconfig-r033-20230424   gcc  
parisc       buildonly-randconfig-r002-20230424   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r034-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230423   clang
riscv                randconfig-r042-20230423   clang
riscv                randconfig-r042-20230424   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230424   clang
s390                 randconfig-r014-20230424   gcc  
s390                 randconfig-r044-20230423   clang
s390                 randconfig-r044-20230424   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230424   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r005-20230424   gcc  
sh                   randconfig-r022-20230423   gcc  
sh                   randconfig-r024-20230423   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r002-20230423   gcc  
sparc64              randconfig-r014-20230423   gcc  
sparc64              randconfig-r016-20230423   gcc  
sparc64              randconfig-r026-20230423   gcc  
sparc64              randconfig-r035-20230424   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230424   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230424   clang
x86_64               randconfig-a002-20230424   clang
x86_64               randconfig-a003-20230424   clang
x86_64               randconfig-a004-20230424   clang
x86_64               randconfig-a005-20230424   clang
x86_64               randconfig-a006-20230424   clang
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230423   gcc  
xtensa               randconfig-r021-20230424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
