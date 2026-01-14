Return-Path: <linux-leds+bounces-6642-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 577BCD1C000
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 02:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57834300E47B
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jan 2026 01:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6C4215077;
	Wed, 14 Jan 2026 01:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m70jliic"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30FD1A9F96
	for <linux-leds@vger.kernel.org>; Wed, 14 Jan 2026 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355764; cv=none; b=qS2AV8IsQBiAM7KZU5Asu8TPxuZlgysTT4KFeKEc7fB/Ih6B+OMXClx9OdakMw/5Wg2vuywOVbUG9VeUY+eOFVWgH8V2tdQbfxYeaw6sybaFq8CPD0TgsRKFT2rrVuC/1bt/6iEg8WEpMBwb+s5QzBdMIMwp/A1v8ytt6gYnh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355764; c=relaxed/simple;
	bh=sILwidF7kJhFlOq6aE1TA+u+iPsY64Y+t1mIBHhCs2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZP4W4W/m7FJ+7GW154XX0cGsoh95RldoOGE4zS9BJBDqRgmk/gIWMNEdnzYJbyRKwkmTL15Rw8EGLSdFlGiIiEXS2pPppnfZl3jWBJZqb73Z96DxlCJcAtz3dYBqBFIwDnb1v5erwiqW7XvRZItFcxrxeoXoVNeqs+R2zeTy5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m70jliic; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768355763; x=1799891763;
  h=date:from:to:cc:subject:message-id;
  bh=sILwidF7kJhFlOq6aE1TA+u+iPsY64Y+t1mIBHhCs2Y=;
  b=m70jliicPGcxJrc1CzjSY5D+HstxPRKLWv0l9SRc3opiMWPTFQBR+8ae
   7PEedyVl7o4kPi4ZebqBgCUaMVzZ9kwgjM980tPcrKiC4wLXgW/cajAub
   BliPfdvj1/m4o4euscuWwLrqMB9LsFUYcx3sKcOX7oHo4C0S6iSO7X3ct
   C24vFMkHOcFye5RNBmGMvhupIOqnfimGjKDEPziXHcRXvy7YAuGzYU/LL
   80apBiTeqqD/tW1t5zamO9rKfad7F1BuM3Clxob4XHkCK2wdkMYzdBFow
   Bv3Kgn6zlsZtToPeMqpHSNSOht/0qLsonYrMpfb47VlMh/Vd8DSFYpcnU
   Q==;
X-CSE-ConnectionGUID: ez3Bwyg6SWiG6Guhs+Pu7Q==
X-CSE-MsgGUID: z0xN+I5VRoKJ3pi6r0MvDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="79949810"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="79949810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 17:56:02 -0800
X-CSE-ConnectionGUID: 9iK6iDQgQCWzxnuYUvWIwQ==
X-CSE-MsgGUID: QF4PS29eRGC8JeBzF3JgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="208702732"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 17:56:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfq74-00000000Fe8-1h6X;
	Wed, 14 Jan 2026 01:55:58 +0000
Date: Wed, 14 Jan 2026 09:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 33e822f6f4eba2cfbd09ffd080af221cf8c542b2
Message-ID: <202601140958.EfMcGNh7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 33e822f6f4eba2cfbd09ffd080af221cf8c542b2  leds: qcom-lpg: Check the return value of regmap_bulk_write()

elapsed time: 776m

configs tested: 300
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    clang-22
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-001-20260114    gcc-10.5.0
arc                   randconfig-002-20260113    clang-22
arc                   randconfig-002-20260114    gcc-10.5.0
arc                           tb10x_defconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                        clps711x_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    clang-22
arm                       imx_v6_v7_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-22
arm                             pxa_defconfig    gcc-15.2.0
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-001-20260114    gcc-10.5.0
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-002-20260114    gcc-10.5.0
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-003-20260114    gcc-10.5.0
arm                   randconfig-004-20260113    clang-22
arm                   randconfig-004-20260114    gcc-10.5.0
arm                        shmobile_defconfig    clang-22
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           stm32_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm                         wpcm450_defconfig    clang-22
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-001-20260114    clang-22
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-002-20260114    clang-22
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-003-20260114    clang-22
arm64                 randconfig-004-20260113    clang-22
arm64                 randconfig-004-20260114    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-001-20260114    clang-22
csky                  randconfig-002-20260113    clang-22
csky                  randconfig-002-20260114    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260113    clang-22
hexagon               randconfig-001-20260114    clang-22
hexagon               randconfig-002-20260113    clang-22
hexagon               randconfig-002-20260114    clang-22
i386                             alldefconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-001-20260114    gcc-14
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-002-20260114    gcc-14
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-003-20260114    gcc-14
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-004-20260114    gcc-14
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-005-20260114    gcc-14
i386        buildonly-randconfig-006-20260113    clang-20
i386        buildonly-randconfig-006-20260114    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260113    clang-20
i386                  randconfig-001-20260114    gcc-14
i386                  randconfig-002-20260113    clang-20
i386                  randconfig-002-20260114    gcc-14
i386                  randconfig-003-20260113    clang-20
i386                  randconfig-003-20260114    gcc-14
i386                  randconfig-004-20260113    clang-20
i386                  randconfig-004-20260114    gcc-14
i386                  randconfig-005-20260113    clang-20
i386                  randconfig-005-20260114    gcc-14
i386                  randconfig-006-20260113    clang-20
i386                  randconfig-006-20260114    gcc-14
i386                  randconfig-007-20260113    clang-20
i386                  randconfig-007-20260114    gcc-14
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-011-20260114    gcc-14
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-012-20260114    gcc-14
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-013-20260114    gcc-14
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-014-20260114    gcc-14
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-015-20260114    gcc-14
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-016-20260114    gcc-14
i386                  randconfig-017-20260113    gcc-14
i386                  randconfig-017-20260114    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260113    clang-22
loongarch             randconfig-001-20260114    clang-22
loongarch             randconfig-002-20260113    clang-22
loongarch             randconfig-002-20260114    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                           gcw0_defconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
mips                           rs90_defconfig    gcc-15.2.0
mips                        vocore2_defconfig    clang-22
nios2                         10m50_defconfig    gcc-15.2.0
nios2                         3c120_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260113    clang-22
nios2                 randconfig-001-20260114    clang-22
nios2                 randconfig-002-20260113    clang-22
nios2                 randconfig-002-20260114    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260113    clang-19
parisc                randconfig-001-20260114    gcc-14.3.0
parisc                randconfig-002-20260113    clang-19
parisc                randconfig-002-20260114    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      chrp32_defconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    gcc-15.2.0
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc               randconfig-001-20260113    clang-19
powerpc               randconfig-001-20260114    gcc-14.3.0
powerpc               randconfig-002-20260113    clang-19
powerpc               randconfig-002-20260114    gcc-14.3.0
powerpc                    sam440ep_defconfig    clang-22
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260113    clang-19
powerpc64             randconfig-001-20260114    gcc-14.3.0
powerpc64             randconfig-002-20260113    clang-19
powerpc64             randconfig-002-20260114    gcc-14.3.0
riscv                            alldefconfig    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    clang-22
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-001-20260114    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-15.2.0
riscv                 randconfig-002-20260114    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-001-20260114    gcc-15.2.0
s390                  randconfig-002-20260113    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                             espt_defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          landisk_defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-001-20260114    gcc-15.2.0
sh                    randconfig-002-20260113    gcc-15.2.0
sh                    randconfig-002-20260114    gcc-15.2.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sh                           se7619_defconfig    clang-22
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260113    gcc-14.3.0
sparc                 randconfig-001-20260114    clang-20
sparc                 randconfig-002-20260113    gcc-14.3.0
sparc                 randconfig-002-20260114    clang-20
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260113    gcc-14.3.0
sparc64               randconfig-001-20260114    clang-20
sparc64               randconfig-002-20260113    gcc-14.3.0
sparc64               randconfig-002-20260114    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260113    gcc-14.3.0
um                    randconfig-001-20260114    clang-20
um                    randconfig-002-20260113    gcc-14.3.0
um                    randconfig-002-20260114    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-001-20260114    clang-20
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-002-20260114    clang-20
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-003-20260114    clang-20
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-004-20260114    clang-20
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-005-20260114    clang-20
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64      buildonly-randconfig-006-20260114    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-001-20260114    gcc-14
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-002-20260114    gcc-14
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-003-20260114    gcc-14
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-004-20260114    gcc-14
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-005-20260114    gcc-14
x86_64                randconfig-006-20260113    gcc-14
x86_64                randconfig-006-20260114    gcc-14
x86_64                randconfig-011-20260113    clang-20
x86_64                randconfig-011-20260114    gcc-14
x86_64                randconfig-012-20260113    clang-20
x86_64                randconfig-012-20260114    gcc-14
x86_64                randconfig-013-20260113    clang-20
x86_64                randconfig-013-20260114    gcc-14
x86_64                randconfig-014-20260113    clang-20
x86_64                randconfig-014-20260114    gcc-14
x86_64                randconfig-015-20260113    clang-20
x86_64                randconfig-015-20260114    gcc-14
x86_64                randconfig-016-20260113    clang-20
x86_64                randconfig-016-20260114    gcc-14
x86_64                randconfig-071-20260113    clang-20
x86_64                randconfig-071-20260114    clang-20
x86_64                randconfig-072-20260113    clang-20
x86_64                randconfig-072-20260114    clang-20
x86_64                randconfig-073-20260113    clang-20
x86_64                randconfig-073-20260114    clang-20
x86_64                randconfig-074-20260113    clang-20
x86_64                randconfig-074-20260114    clang-20
x86_64                randconfig-075-20260113    clang-20
x86_64                randconfig-075-20260114    clang-20
x86_64                randconfig-076-20260113    clang-20
x86_64                randconfig-076-20260114    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    clang-22
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                  nommu_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260113    gcc-14.3.0
xtensa                randconfig-001-20260114    clang-20
xtensa                randconfig-002-20260113    gcc-14.3.0
xtensa                randconfig-002-20260114    clang-20
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

