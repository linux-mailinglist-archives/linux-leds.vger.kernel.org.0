Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805F7715E28
	for <lists+linux-leds@lfdr.de>; Tue, 30 May 2023 13:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjE3L51 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 May 2023 07:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjE3L50 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 May 2023 07:57:26 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D70B1B6
        for <linux-leds@vger.kernel.org>; Tue, 30 May 2023 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447808; x=1716983808;
  h=date:from:to:cc:subject:message-id;
  bh=GDgWHDoxHB8+eC37i93oj46xz+9r+Al2hsPV5uRvcLQ=;
  b=jhHAIWp3p/in6iYdDCS824Yz/Z7txIWpairBcDFPsvnoPzhblKQCjXFw
   zEEziw3U3k26TphjIE0pIlcRwj1N/SrFesOzzVrkz3ROgOFXbeBLWm9+J
   5bq0cHbHb+Gzc7ATU18I56nIUhxkprAg7xf9LHHpdD6XJibncL15QhBYp
   nb53fIoBtTMJWQpvbyiNBK1JNkqosrG7BxkJA2nIS65jC7NHBcpL6iOqm
   i28LmOgY+NBbknMGhLDAD5J4Fmvzc4SXyKKtDy8PqM7nisXcYv7NT0Wpo
   Z+tCK/jATvy5IMj2hG1GTf1OuC9XWyD3vuTAwvk4pkwUuVTnIIaqRLD8Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334514636"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="334514636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796251529"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="796251529"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 May 2023 04:56:11 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3xxS-0000Mz-2D;
        Tue, 30 May 2023 11:56:10 +0000
Date:   Tue, 30 May 2023 19:56:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS WITH WARNING
 8f38f8fa7261819eb7d4fb369dc3bfab72259033
Message-ID: <20230530115606.c4EDH%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 8f38f8fa7261819eb7d4fb369dc3bfab72259033  led: qcom-lpg: Fix resource leaks in for_each_available_child_of_node() loops

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305260008.QCRrKILf-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/leds/leds-cht-wcove.c:144:21: warning: no previous prototype for 'cht_wc_leds_brightness_get' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
|-- i386-allyesconfig
|   `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
`-- x86_64-allyesconfig
    `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get

elapsed time: 5418m

configs tested: 180
configs skipped: 6

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r031-20230526   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230526   gcc  
arc                  randconfig-r032-20230526   gcc  
arc                  randconfig-r043-20230526   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                          gemini_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                  randconfig-r046-20230526   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230526   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230526   gcc  
arm64                randconfig-r003-20230526   gcc  
arm64                randconfig-r023-20230526   clang
arm64                randconfig-r035-20230526   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230526   gcc  
hexagon              randconfig-r022-20230526   clang
hexagon              randconfig-r041-20230526   clang
hexagon              randconfig-r045-20230526   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230526   gcc  
i386                 randconfig-i002-20230526   gcc  
i386                 randconfig-i003-20230526   gcc  
i386                 randconfig-i004-20230526   gcc  
i386                 randconfig-i005-20230526   gcc  
i386                 randconfig-i006-20230526   gcc  
i386                 randconfig-i011-20230526   clang
i386                 randconfig-i012-20230526   clang
i386                 randconfig-i013-20230526   clang
i386                 randconfig-i014-20230526   clang
i386                 randconfig-i015-20230526   clang
i386                 randconfig-i016-20230526   clang
i386                 randconfig-i051-20230526   gcc  
i386                 randconfig-i052-20230526   gcc  
i386                 randconfig-i053-20230526   gcc  
i386                 randconfig-i054-20230526   gcc  
i386                 randconfig-i055-20230526   gcc  
i386                 randconfig-i056-20230526   gcc  
i386                 randconfig-i061-20230526   gcc  
i386                 randconfig-i062-20230526   gcc  
i386                 randconfig-i063-20230526   gcc  
i386                 randconfig-i064-20230526   gcc  
i386                 randconfig-i065-20230526   gcc  
i386                 randconfig-i066-20230526   gcc  
i386                 randconfig-i071-20230526   clang
i386                 randconfig-i072-20230526   clang
i386                 randconfig-i073-20230526   clang
i386                 randconfig-i074-20230526   clang
i386                 randconfig-i075-20230526   clang
i386                 randconfig-i076-20230526   clang
i386                 randconfig-i081-20230526   clang
i386                 randconfig-i082-20230526   clang
i386                 randconfig-i083-20230526   clang
i386                 randconfig-i084-20230526   clang
i386                 randconfig-i085-20230526   clang
i386                 randconfig-i086-20230526   clang
i386                 randconfig-i091-20230526   gcc  
i386                 randconfig-i092-20230526   gcc  
i386                 randconfig-i093-20230526   gcc  
i386                 randconfig-i094-20230526   gcc  
i386                 randconfig-i095-20230526   gcc  
i386                 randconfig-i096-20230526   gcc  
i386                 randconfig-r024-20230526   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                           ip27_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                          malta_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
nios2        buildonly-randconfig-r003-20230526   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230526   gcc  
openrisc     buildonly-randconfig-r002-20230526   gcc  
openrisc     buildonly-randconfig-r006-20230526   gcc  
parisc       buildonly-randconfig-r004-20230526   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc85xx_cds_defconfig   gcc  
powerpc              randconfig-r005-20230526   gcc  
powerpc                  storcenter_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230526   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230526   clang
s390                 randconfig-r016-20230526   clang
s390                 randconfig-r044-20230526   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230526   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230526   gcc  
sparc                randconfig-r025-20230526   gcc  
sparc                randconfig-r036-20230526   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230526   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230526   gcc  
x86_64               randconfig-a002-20230526   gcc  
x86_64               randconfig-a003-20230526   gcc  
x86_64               randconfig-a004-20230526   gcc  
x86_64               randconfig-a005-20230526   gcc  
x86_64               randconfig-a006-20230526   gcc  
x86_64               randconfig-a011-20230526   clang
x86_64               randconfig-a012-20230526   clang
x86_64               randconfig-a013-20230526   clang
x86_64               randconfig-a014-20230526   clang
x86_64               randconfig-a015-20230526   clang
x86_64               randconfig-a016-20230526   clang
x86_64               randconfig-k001-20230529   gcc  
x86_64               randconfig-x051-20230526   clang
x86_64               randconfig-x052-20230526   clang
x86_64               randconfig-x053-20230526   clang
x86_64               randconfig-x054-20230526   clang
x86_64               randconfig-x055-20230526   clang
x86_64               randconfig-x056-20230526   clang
x86_64               randconfig-x061-20230526   clang
x86_64               randconfig-x062-20230526   clang
x86_64               randconfig-x063-20230526   clang
x86_64               randconfig-x064-20230526   clang
x86_64               randconfig-x065-20230526   clang
x86_64               randconfig-x066-20230526   clang
x86_64               randconfig-x071-20230526   gcc  
x86_64               randconfig-x072-20230526   gcc  
x86_64               randconfig-x073-20230526   gcc  
x86_64               randconfig-x074-20230526   gcc  
x86_64               randconfig-x075-20230526   gcc  
x86_64               randconfig-x076-20230526   gcc  
x86_64               randconfig-x081-20230526   gcc  
x86_64               randconfig-x082-20230526   gcc  
x86_64               randconfig-x083-20230526   gcc  
x86_64               randconfig-x084-20230526   gcc  
x86_64               randconfig-x085-20230526   gcc  
x86_64               randconfig-x086-20230526   gcc  
x86_64               randconfig-x091-20230526   clang
x86_64               randconfig-x092-20230526   clang
x86_64               randconfig-x093-20230526   clang
x86_64               randconfig-x094-20230526   clang
x86_64               randconfig-x095-20230526   clang
x86_64               randconfig-x096-20230526   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230526   gcc  
xtensa               randconfig-r014-20230526   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
