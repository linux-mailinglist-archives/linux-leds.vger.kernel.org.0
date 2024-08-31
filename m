Return-Path: <linux-leds+bounces-2560-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E99670E2
	for <lists+linux-leds@lfdr.de>; Sat, 31 Aug 2024 12:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15A7FB22D42
	for <lists+linux-leds@lfdr.de>; Sat, 31 Aug 2024 10:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C8D17C21C;
	Sat, 31 Aug 2024 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKeuWaUn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84D14B06C
	for <linux-leds@vger.kernel.org>; Sat, 31 Aug 2024 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100201; cv=none; b=YH3sHnfT2nW3fgxD0wCTonqRCEO8VirNJacamgTTIf49ViRFVbSn9vtnQOxTjXywNyGSYtG7Shrrc5zYQv5GgwsquHFdv/oF2XOnS0kGg68ya60KzLM0puFyq3fBHlqCXIcYCI96PvulJsz4p+CfCSvGTcc0oNoNtbZMeAMw+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100201; c=relaxed/simple;
	bh=o0z+4FkoKuZsX2V5YDioQNOxLzYN1vkpAAFS39Cezrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jfwBuN+F/KP3VnTfwy6sk/N5zt6xeqWUqkwkcQ96APLQVKcboqE0RkyINLhq0y0/pQ3XBVMxAu3Ca5r4PI7c8gmhLF+LGHZuim3cDqRMEse4YsSGRr4Gs72VDlDpRnn2uKxAd7Rd44LdmJeJRes68iU+89kUKOLYAsW6j8fyrqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKeuWaUn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725100200; x=1756636200;
  h=date:from:to:cc:subject:message-id;
  bh=o0z+4FkoKuZsX2V5YDioQNOxLzYN1vkpAAFS39Cezrg=;
  b=oKeuWaUnXVJMHlkiiU7NZLj8UxijrlPoEODk9f94VtlDSvVW5LELyneo
   p2DFUfGEyvtbraZN1yDtCrcJ0Q4+VTNYJ7cC9gEFnUW3vSaygWtI3Q79B
   BEd6ZjUOhT1mDNrzPgY1i9jlMGXO0jkJDthnt+XVDwpw8uJC7ehSJe8nk
   1XF7dMEajc1E8p7nmz2hO6s6gRs/IKGYQ3kJdnYGI80athyw8H1KmywEF
   NouvJs8ADzWjxvUYBvTHZFa0ABUsSIqWsvRvnIgqciH+3nET9J3s+LBwP
   Yr5hlhNIKWR8Jmq+V+eDHIoG8+WZWzRLvIOpVe39ch8kM5RTrM9IwXJr9
   w==;
X-CSE-ConnectionGUID: dsAd2BOnSOK2gTWL/fEKPw==
X-CSE-MsgGUID: cTMmmxi/Sc+cBPEaw1FMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34405002"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="34405002"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 03:29:59 -0700
X-CSE-ConnectionGUID: FKwL26w4R161XQPCNgmHuA==
X-CSE-MsgGUID: BdQPTiD/TRWo+nDtp0wKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="68971251"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2024 03:29:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skLMg-0002ai-31;
	Sat, 31 Aug 2024 10:29:54 +0000
Date: Sat, 31 Aug 2024 18:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 64c38866500b0bda4363fb994d545557dffb017c
Message-ID: <202408311822.D39ldFr9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 64c38866500b0bda4363fb994d545557dffb017c  leds: turris-omnia: Fix module autoloading with MODULE_DEVICE_TABLE()

elapsed time: 1491m

configs tested: 180
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                        nsimosci_defconfig   clang-20
arc                   randconfig-001-20240831   gcc-14.1.0
arc                   randconfig-002-20240831   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                          ep93xx_defconfig   clang-20
arm                          gemini_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240831   gcc-14.1.0
arm                   randconfig-002-20240831   gcc-14.1.0
arm                   randconfig-003-20240831   gcc-14.1.0
arm                   randconfig-004-20240831   gcc-14.1.0
arm                        realview_defconfig   clang-20
arm                         vf610m4_defconfig   clang-20
arm                    vt8500_v6_v7_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   clang-20
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240831   gcc-14.1.0
arm64                 randconfig-002-20240831   gcc-14.1.0
arm64                 randconfig-003-20240831   gcc-14.1.0
arm64                 randconfig-004-20240831   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240831   gcc-14.1.0
csky                  randconfig-002-20240831   gcc-14.1.0
hexagon                          alldefconfig   clang-20
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240831   gcc-14.1.0
hexagon               randconfig-002-20240831   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240831   clang-18
i386         buildonly-randconfig-002-20240831   clang-18
i386         buildonly-randconfig-003-20240831   clang-18
i386         buildonly-randconfig-004-20240831   clang-18
i386         buildonly-randconfig-005-20240831   clang-18
i386         buildonly-randconfig-006-20240831   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240831   clang-18
i386                  randconfig-002-20240831   clang-18
i386                  randconfig-003-20240831   clang-18
i386                  randconfig-004-20240831   clang-18
i386                  randconfig-005-20240831   clang-18
i386                  randconfig-006-20240831   clang-18
i386                  randconfig-011-20240831   clang-18
i386                  randconfig-012-20240831   clang-18
i386                  randconfig-013-20240831   clang-18
i386                  randconfig-014-20240831   clang-18
i386                  randconfig-015-20240831   clang-18
i386                  randconfig-016-20240831   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240831   gcc-14.1.0
loongarch             randconfig-002-20240831   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                            gpr_defconfig   clang-20
mips                          malta_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                        omega2p_defconfig   clang-20
mips                         rt305x_defconfig   clang-20
nios2                            alldefconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240831   gcc-14.1.0
nios2                 randconfig-002-20240831   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
openrisc                  or1klitex_defconfig   clang-20
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
parisc                generic-64bit_defconfig   clang-20
parisc                randconfig-001-20240831   gcc-14.1.0
parisc                randconfig-002-20240831   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                    adder875_defconfig   clang-20
powerpc                           allnoconfig   clang-20
powerpc                 canyonlands_defconfig   clang-20
powerpc                       ebony_defconfig   clang-20
powerpc                    gamecube_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                    mvme5100_defconfig   clang-20
powerpc               randconfig-001-20240831   gcc-14.1.0
powerpc                  storcenter_defconfig   clang-20
powerpc                     tqm8540_defconfig   clang-20
powerpc64             randconfig-001-20240831   gcc-14.1.0
powerpc64             randconfig-002-20240831   gcc-14.1.0
powerpc64             randconfig-003-20240831   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240831   gcc-14.1.0
riscv                 randconfig-002-20240831   gcc-14.1.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240831   gcc-14.1.0
s390                  randconfig-002-20240831   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240831   gcc-14.1.0
sh                    randconfig-002-20240831   gcc-14.1.0
sh                           se7780_defconfig   clang-20
sh                   secureedge5410_defconfig   clang-20
sh                        sh7763rdp_defconfig   clang-20
sh                        sh7785lcr_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240831   gcc-14.1.0
sparc64               randconfig-002-20240831   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240831   gcc-14.1.0
um                    randconfig-002-20240831   gcc-14.1.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240831   clang-18
x86_64       buildonly-randconfig-002-20240831   clang-18
x86_64       buildonly-randconfig-003-20240831   clang-18
x86_64       buildonly-randconfig-004-20240831   clang-18
x86_64       buildonly-randconfig-005-20240831   clang-18
x86_64       buildonly-randconfig-006-20240831   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240831   clang-18
x86_64                randconfig-002-20240831   clang-18
x86_64                randconfig-003-20240831   clang-18
x86_64                randconfig-004-20240831   clang-18
x86_64                randconfig-005-20240831   clang-18
x86_64                randconfig-006-20240831   clang-18
x86_64                randconfig-011-20240831   clang-18
x86_64                randconfig-012-20240831   clang-18
x86_64                randconfig-013-20240831   clang-18
x86_64                randconfig-014-20240831   clang-18
x86_64                randconfig-015-20240831   clang-18
x86_64                randconfig-016-20240831   clang-18
x86_64                randconfig-071-20240831   clang-18
x86_64                randconfig-072-20240831   clang-18
x86_64                randconfig-073-20240831   clang-18
x86_64                randconfig-074-20240831   clang-18
x86_64                randconfig-075-20240831   clang-18
x86_64                randconfig-076-20240831   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240831   gcc-14.1.0
xtensa                randconfig-002-20240831   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

