Return-Path: <linux-leds+bounces-2408-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F14948D71
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 13:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D581C20BE3
	for <lists+linux-leds@lfdr.de>; Tue,  6 Aug 2024 11:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32841C0DED;
	Tue,  6 Aug 2024 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGyDNAFD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F06143C4B
	for <linux-leds@vger.kernel.org>; Tue,  6 Aug 2024 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722942481; cv=none; b=h/EIui0gljnem0ZvRy96oQDxuymxYcamXOJKStRkGZP9BB/KwHeKlG4kKkvbUK1sgL8qttm7zx/1FQJHUWT7rW/Ux0eqhj5bdvIFor8iCWlBDvnlW4IbluyLkcjT2v1J/RKpQAlI6ZO8obEpD7BfYTJgfBF/z3p8k7cF16VOUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722942481; c=relaxed/simple;
	bh=WNiuZzUi75+KoFL3ZvJedXoBGI8IFisSaUsdfYTWvvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H2bo24atuKAUIyv9u0zWDWYe0vlGyQ31k4rOxe94uUSqT/pFB/W45o23Ghd/XoSaI5zgrvsO+jS4Q3bpQSiSDmd1Q43enmvwI/t1EGRthts0dVqbBjVPieEdj796Bx17mh2HqojDVO916cqim2HbXZV/2QQCGh+kVhYdOBBjeL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGyDNAFD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722942480; x=1754478480;
  h=date:from:to:cc:subject:message-id;
  bh=WNiuZzUi75+KoFL3ZvJedXoBGI8IFisSaUsdfYTWvvM=;
  b=EGyDNAFDwzvKMzGWZg15jxzBHrOa928VtMsljfoRZhsWg0ZepuNepMer
   g+0XGdWqFsNq6+yPhz4uDr5grG+eGWCDf7U/n1GphL5qGqyvlHa0vRt+G
   O5xRCXS3wEIGUKUR2FVmfpmIyc2q/n/9aBPNDPTeFjufMxj7OSmkIz5pn
   eQQzKzWQVgOs4ZZZpfQkldKIzkrzyComAWGxKJk2nsONykNqTYGVV1Uoe
   lFwmF1sRJcs6B3a5QBPU6Z/AUrt1q2YF1jV624zt/FsMkDkG4rQ0RXbN7
   /iV3m58krNnPmWJ25b04/KvLlXPk+5Yozquq+YNlKA9hB00+1FP6j/6KT
   g==;
X-CSE-ConnectionGUID: 5yzUQxHTS5e8hok+Ns1gzw==
X-CSE-MsgGUID: uSkqYAjOR/25PtAs6WwA9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="46354295"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="46354295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 04:07:59 -0700
X-CSE-ConnectionGUID: i350PDQJQrCQ1gD8d80Rng==
X-CSE-MsgGUID: q0JHfmkPS1KGjFh11E9BHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56177359"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2024 04:07:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbI2m-0004Qv-1B;
	Tue, 06 Aug 2024 11:07:56 +0000
Date: Tue, 06 Aug 2024 19:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 3ec05e5feacdc1e8643e9c84c63e4a370e948d40
Message-ID: <202408061913.clvcDUdK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 3ec05e5feacdc1e8643e9c84c63e4a370e948d40  leds: pca995x: Use device_for_each_child_node() to access device child nodes

elapsed time: 1124m

configs tested: 209
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240806   gcc-13.2.0
arc                   randconfig-002-20240806   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   clang-20
arm                          ixp4xx_defconfig   clang-20
arm                        mvebu_v5_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                         orion5x_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   clang-20
arm                            qcom_defconfig   gcc-13.2.0
arm                   randconfig-001-20240806   gcc-13.2.0
arm                   randconfig-002-20240806   gcc-13.2.0
arm                   randconfig-003-20240806   gcc-13.2.0
arm                   randconfig-004-20240806   gcc-13.2.0
arm                           spitz_defconfig   clang-20
arm64                            alldefconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240806   gcc-13.2.0
arm64                 randconfig-002-20240806   gcc-13.2.0
arm64                 randconfig-003-20240806   gcc-13.2.0
arm64                 randconfig-004-20240806   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240806   gcc-13.2.0
csky                  randconfig-002-20240806   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240806   gcc-11
i386         buildonly-randconfig-002-20240806   gcc-11
i386         buildonly-randconfig-003-20240806   gcc-11
i386         buildonly-randconfig-004-20240806   gcc-11
i386         buildonly-randconfig-005-20240806   gcc-11
i386         buildonly-randconfig-006-20240806   gcc-11
i386                                defconfig   clang-18
i386                  randconfig-001-20240806   gcc-11
i386                  randconfig-002-20240806   gcc-11
i386                  randconfig-003-20240806   gcc-11
i386                  randconfig-004-20240806   gcc-11
i386                  randconfig-005-20240806   gcc-11
i386                  randconfig-006-20240806   gcc-11
i386                  randconfig-011-20240806   gcc-11
i386                  randconfig-012-20240806   gcc-11
i386                  randconfig-013-20240806   gcc-11
i386                  randconfig-014-20240806   gcc-11
i386                  randconfig-015-20240806   gcc-11
i386                  randconfig-016-20240806   gcc-11
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240806   gcc-13.2.0
loongarch             randconfig-002-20240806   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          ath25_defconfig   clang-20
mips                        bcm47xx_defconfig   gcc-13.2.0
mips                         cobalt_defconfig   gcc-13.2.0
mips                 decstation_r4k_defconfig   clang-20
mips                          eyeq5_defconfig   clang-20
mips                      fuloong2e_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                        omega2p_defconfig   gcc-13.2.0
nios2                         10m50_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240806   gcc-13.2.0
nios2                 randconfig-002-20240806   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240806   gcc-13.2.0
parisc                randconfig-002-20240806   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                        cell_defconfig   clang-20
powerpc                       ebony_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                     kmeter1_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   clang-20
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240806   gcc-13.2.0
powerpc               randconfig-003-20240806   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                        warp_defconfig   clang-20
powerpc64             randconfig-001-20240806   gcc-13.2.0
powerpc64             randconfig-002-20240806   gcc-13.2.0
powerpc64             randconfig-003-20240806   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240806   gcc-13.2.0
riscv                 randconfig-002-20240806   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240806   gcc-13.2.0
s390                  randconfig-002-20240806   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240806   gcc-13.2.0
sh                    randconfig-002-20240806   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240806   gcc-13.2.0
sparc64               randconfig-002-20240806   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240806   gcc-13.2.0
um                    randconfig-002-20240806   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240806   clang-18
x86_64       buildonly-randconfig-002-20240806   clang-18
x86_64       buildonly-randconfig-003-20240806   clang-18
x86_64       buildonly-randconfig-004-20240806   clang-18
x86_64       buildonly-randconfig-005-20240806   clang-18
x86_64       buildonly-randconfig-006-20240806   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240806   clang-18
x86_64                randconfig-002-20240806   clang-18
x86_64                randconfig-003-20240806   clang-18
x86_64                randconfig-004-20240806   clang-18
x86_64                randconfig-005-20240806   clang-18
x86_64                randconfig-006-20240806   clang-18
x86_64                randconfig-011-20240806   clang-18
x86_64                randconfig-012-20240806   clang-18
x86_64                randconfig-013-20240806   clang-18
x86_64                randconfig-014-20240806   clang-18
x86_64                randconfig-015-20240806   clang-18
x86_64                randconfig-016-20240806   clang-18
x86_64                randconfig-071-20240806   clang-18
x86_64                randconfig-072-20240806   clang-18
x86_64                randconfig-073-20240806   clang-18
x86_64                randconfig-074-20240806   clang-18
x86_64                randconfig-075-20240806   clang-18
x86_64                randconfig-076-20240806   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                           alldefconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240806   gcc-13.2.0
xtensa                randconfig-002-20240806   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

