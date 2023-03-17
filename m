Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740086BDFFC
	for <lists+linux-leds@lfdr.de>; Fri, 17 Mar 2023 05:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjCQEJO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Mar 2023 00:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjCQEJI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Mar 2023 00:09:08 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93BA8ABEF
        for <linux-leds@vger.kernel.org>; Thu, 16 Mar 2023 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679026141; x=1710562141;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mL1mB1kAbrAyP99Subr6KbgVgRu2Re46/9C3VoqmDM0=;
  b=aPCTnYIv9aiKGxIlgoIbwBsCOSapy+yxG/PQKPiaQxp0xrr5d5EW4KGC
   muPr+kgoJImF/Y4PajWZhw0f2UduQTHqsrc3hFeMRt1B18a12fpQSKqNv
   Z/vd7NYu66ojoMdQo8aiFCogPTNITTh0Hjq8cHviM7ViK7rM52ScjAcqt
   SfmQzIFJHzR6lb2vwzNmLpqjt0CiDFtXU0O76FTt8zeejqHGpHTBshaBK
   TI0u7U65ySOJIT+OMVg0jdUoRvfYVOi6OL+ESx6nQmvhdWzO1nTr3rEae
   Dbhi/qMiPTBVWe0Ai3oyfGTrj7DlhRFn0ssdd1aIH3uAmGqgwmcuFwEC5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="365872835"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="365872835"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 21:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682545307"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="682545307"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2023 21:08:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pd1Oh-00094a-1j;
        Fri, 17 Mar 2023 04:08:55 +0000
Date:   Fri, 17 Mar 2023 12:07:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 1aeff621689120db60cb7029e5a0fde7d01f7fb6
Message-ID: <6413e79a.m55cBNUprk7jID08%lkp@intel.com>
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
branch HEAD: 1aeff621689120db60cb7029e5a0fde7d01f7fb6  dt-bindings: leds: Add QCOM flash LED controller

elapsed time: 723m

configs tested: 114
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230313   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230312   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230313   gcc  
arc                  randconfig-r026-20230315   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r021-20230315   gcc  
arm                  randconfig-r046-20230312   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230312   gcc  
csky                                defconfig   gcc  
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
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230312   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230312   gcc  
m68k                 randconfig-r016-20230313   gcc  
m68k                 randconfig-r023-20230315   gcc  
microblaze   buildonly-randconfig-r002-20230313   gcc  
microblaze           randconfig-r006-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230312   gcc  
mips                 randconfig-r001-20230312   gcc  
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2        buildonly-randconfig-r005-20230313   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230313   gcc  
openrisc             randconfig-r022-20230315   gcc  
parisc       buildonly-randconfig-r006-20230313   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230313   gcc  
riscv                randconfig-r014-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230312   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230315   gcc  
sparc64              randconfig-r001-20230313   gcc  
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
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230313   clang
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230313   clang
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230313   clang
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230313   clang
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230313   clang
x86_64                        randconfig-a016   clang
x86_64               randconfig-k001-20230313   clang
x86_64               randconfig-r002-20230313   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230312   gcc  
xtensa               randconfig-r015-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
