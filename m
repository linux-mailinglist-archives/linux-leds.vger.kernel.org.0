Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754D66EEB84
	for <lists+linux-leds@lfdr.de>; Wed, 26 Apr 2023 02:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236933AbjDZAkL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Apr 2023 20:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDZAkK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Apr 2023 20:40:10 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D3B49DF
        for <linux-leds@vger.kernel.org>; Tue, 25 Apr 2023 17:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682469609; x=1714005609;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8vKZNmbZWWb/Oq7XvmHv+nSs1EigZDl1Pv7nsunv/fE=;
  b=aVYIZQxlGyhLMWFWwhd+cZx+36BZl74FAwsZkq+io/yQuqX9UAVaE8Na
   x2VNSpiTTMaq2FAfz6jhhksxntNDd2LFv9J9dzAtFg9raJ4nAK8+lri3u
   jziGF1xK5QtnGYxWZtN0dkoLl5izW/MC8KcMKBETDldAVFQb3et+XEZDy
   fYqZ4WY3KeR5rW1Uf3yrBlw/AgSW8BL8saa1kwTLwyk7jNxnkQhKWpoQF
   wIm5Itdneh1AiPAvif0DzeGrCs8aaTLjrteU+34StI3Efpvtz1pOgI6tW
   Da1iSa2lRpWBMSPY+5JcaMQQt8Y6HE6+1WHwL4Fltr+ZKGOcSj5qEq/zZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="345700092"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="345700092"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 17:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="817918761"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="817918761"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Apr 2023 17:40:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1prTCY-000juh-2N;
        Wed, 26 Apr 2023 00:40:06 +0000
Date:   Wed, 26 Apr 2023 08:39:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next-next] BUILD SUCCESS
 fea27b037127c924221325d65c7966cb4c8c3603
Message-ID: <644872ca.mLC2YUZ2RQCNFTKn%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
branch HEAD: fea27b037127c924221325d65c7966cb4c8c3603  leds: bd2606mvv: Driver for the Rohm 6 Channel i2c LED driver

elapsed time: 724m

configs tested: 100
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230423   gcc  
alpha                randconfig-r022-20230424   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230423   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230423   gcc  
arc                  randconfig-r001-20230424   gcc  
arc                  randconfig-r022-20230423   gcc  
arc                  randconfig-r043-20230425   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230424   clang
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230423   clang
arm                  randconfig-r046-20230425   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230424   gcc  
csky         buildonly-randconfig-r005-20230424   gcc  
csky         buildonly-randconfig-r006-20230424   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r004-20230423   clang
hexagon              randconfig-r006-20230424   clang
hexagon              randconfig-r021-20230423   clang
hexagon              randconfig-r041-20230425   clang
hexagon              randconfig-r045-20230425   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230423   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230423   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230423   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230424   gcc  
microblaze   buildonly-randconfig-r002-20230424   gcc  
microblaze           randconfig-r002-20230423   gcc  
microblaze           randconfig-r002-20230424   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230423   gcc  
openrisc     buildonly-randconfig-r003-20230423   gcc  
openrisc     buildonly-randconfig-r003-20230424   gcc  
parisc       buildonly-randconfig-r002-20230423   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r025-20230423   clang
riscv                randconfig-r042-20230425   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230424   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230425   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r026-20230424   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r003-20230423   gcc  
sparc64              randconfig-r025-20230424   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
xtensa               randconfig-r003-20230424   gcc  
xtensa               randconfig-r021-20230424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
