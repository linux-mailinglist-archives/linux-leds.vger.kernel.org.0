Return-Path: <linux-leds+bounces-3322-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C109BFA82
	for <lists+linux-leds@lfdr.de>; Thu,  7 Nov 2024 00:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A33284151
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 23:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FB81E04AC;
	Wed,  6 Nov 2024 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjr/KScv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172D20D4FE
	for <linux-leds@vger.kernel.org>; Wed,  6 Nov 2024 23:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730937405; cv=none; b=W9DexxQRm9/Z8tikkGo4Qh2DiSOVAhgOWTX2eLqZLqxiNoV87gnRfxvu546PYLga0wlknizcntKzgr2YuLrkcKJuUjRWgm6+TjiCkkNZj75PbZJuGWazWGBPYo5fU9Sw9vjXuAKGCx+10vzj0GE63mdQ4/Imzr0DVGItompiFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730937405; c=relaxed/simple;
	bh=O9eQwiGCKUmmJLEU76H85P/AlexB61PIq5S2+0taxio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XlsIS8zrv02iKIw74UawtHdf9o59t0FYF1/kfv1u6fDeusGF1YdJ+X5A4DIUSSl+L+uX40ueMaP2ckjlEs/mmjMDsDqjlqBGdTjD6EFjK3gR8bK2PErngZoE6HpMXTmPLOdvWydy5hkO+y49Pe1sj0pjiZuFTb80RNjdP5lg19U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjr/KScv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730937404; x=1762473404;
  h=date:from:to:cc:subject:message-id;
  bh=O9eQwiGCKUmmJLEU76H85P/AlexB61PIq5S2+0taxio=;
  b=hjr/KScvJzCzwk5mOLnV6tFDAvARIuQEPhrq/2JF1FanFxK+qW7+mHPM
   WY/AzBWO5jgHHs2Z1pqxd+LwVNsCbUCFkDpLJJYBtdHTN0DkKdd7KLVzX
   9eeE52yhIftO29t9RjqNJPjJjDILhkpB+YhOx5CW7aIWHJ/WnOFLXFxL4
   +7TJY96Pd3Sdt8ODmZz+b6tLA0wi83UZA27Bwdo3/TunlzUGI2j3xMqh8
   ZgEATv/oKym4uNPDQhWNknwgJbGqDd83VHVhianw7A2E9b9GIrUrTr6+F
   7TG1ApwP20sAk/AxP1PauB3n1d2CfX03CZ/KBlBcZZTbuxDpf4v12iPuT
   w==;
X-CSE-ConnectionGUID: NwMQxtCKRmSd59ZlTcYmVQ==
X-CSE-MsgGUID: chk/YWD5TxC+T9QCywABuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48223978"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48223978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:56:44 -0800
X-CSE-ConnectionGUID: jg3DQ/ejRbKIAKB/c0eMlA==
X-CSE-MsgGUID: yMJdqw3qT6mASEFVTn+i0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="89352987"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 15:56:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ptA-000pXq-0X;
	Wed, 06 Nov 2024 23:56:40 +0000
Date: Thu, 07 Nov 2024 07:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 4ca7cd938725a4050dcd62ae9472e931d603118d
Message-ID: <202411070710.TptqzANK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 4ca7cd938725a4050dcd62ae9472e931d603118d  leds: class: Protect brightness_show() with led_cdev->led_access mutex

elapsed time: 723m

configs tested: 277
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241106    gcc-14.2.0
arc                   randconfig-001-20241107    gcc-14.2.0
arc                   randconfig-002-20241106    gcc-14.2.0
arc                   randconfig-002-20241107    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.2.0
arm                            hisi_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-001-20241107    gcc-14.2.0
arm                   randconfig-002-20241106    gcc-14.2.0
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-003-20241106    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-004-20241106    gcc-14.2.0
arm                   randconfig-004-20241107    gcc-14.2.0
arm                             rpc_defconfig    clang-20
arm                       spear13xx_defconfig    clang-20
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-003-20241106    gcc-14.2.0
arm64                 randconfig-003-20241107    gcc-14.2.0
arm64                 randconfig-004-20241106    gcc-14.2.0
arm64                 randconfig-004-20241107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    gcc-14.2.0
hexagon               randconfig-001-20241107    gcc-14.2.0
hexagon               randconfig-002-20241106    gcc-14.2.0
hexagon               randconfig-002-20241107    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-001-20241107    clang-19
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-002-20241107    clang-19
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-003-20241107    clang-19
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-004-20241107    clang-19
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-006-20241106    gcc-12
i386        buildonly-randconfig-006-20241107    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-002-20241107    clang-19
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-003-20241107    clang-19
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-004-20241107    clang-19
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-005-20241107    clang-19
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-011-20241107    clang-19
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-014-20241107    clang-19
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-016-20241106    gcc-12
i386                  randconfig-016-20241107    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                          amiga_defconfig    clang-20
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    clang-20
mips                            gpr_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                        cell_defconfig    clang-20
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                      pcm030_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-001-20241107    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-002-20241107    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc                     tqm8555_defconfig    clang-20
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241106    gcc-14.2.0
powerpc64             randconfig-002-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-002-20241106    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-001-20241107    gcc-14.2.0
s390                  randconfig-002-20241106    gcc-14.2.0
s390                  randconfig-002-20241107    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-20
sh                        edosk7760_defconfig    clang-20
sh                     magicpanelr2_defconfig    clang-20
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                           se7721_defconfig    clang-20
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-20
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    gcc-14.2.0
um                    randconfig-001-20241107    gcc-14.2.0
um                    randconfig-002-20241106    gcc-14.2.0
um                    randconfig-002-20241107    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    gcc-11
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241106    gcc-11
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-003-20241106    gcc-11
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-004-20241106    gcc-11
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241106    gcc-11
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-006-20241106    gcc-11
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    gcc-11
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-003-20241106    gcc-11
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-004-20241106    gcc-11
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-005-20241106    gcc-11
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-012-20241106    gcc-11
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-013-20241106    gcc-11
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-014-20241106    gcc-11
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-015-20241106    gcc-11
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-016-20241106    gcc-11
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-071-20241106    gcc-11
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-072-20241106    gcc-11
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-073-20241106    gcc-11
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-074-20241106    gcc-11
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-075-20241106    gcc-11
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-076-20241106    gcc-11
x86_64                randconfig-076-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

