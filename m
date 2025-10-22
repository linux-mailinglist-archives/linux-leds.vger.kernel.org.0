Return-Path: <linux-leds+bounces-5856-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A8BFB5E3
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 12:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9A8425688
	for <lists+linux-leds@lfdr.de>; Wed, 22 Oct 2025 10:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519DA2472A8;
	Wed, 22 Oct 2025 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/ON4gVP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD8F320A0C
	for <linux-leds@vger.kernel.org>; Wed, 22 Oct 2025 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128325; cv=none; b=SXAUcZ78DpJ1otegFcvh6m01TRVHW0pnOnzZmC9I1o1fFA8ZUDhJyoLbl/LWZatLqvvocFmolzwae/UXQKqjeNWftud5IeEY0ivSaJ+hvRn/TPqtf/ceCEgQuBvL/oGtKIXrOxiFuk4gR2zz2hhTIek0VJgiNPMsV4beGS5/lTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128325; c=relaxed/simple;
	bh=97mlnXS4EPnyi2HXooYRXIphKPmIJhkDW9PaeyvTt0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N6iw2X6s9qbVbf7i5iOmzulc8aXJBUOPxVDLAL5rz86S/Dn6MDrXEICrS94S7auEKpEwygJ+ng7L503aECVNTEnyw/Jb0RsnRKQXox6vm98GxIEraIIClXtIPuDLAPa/eJSEH4UvnBq2k7zVdZk/tuFXXo53BaE8Oa9GZO9rPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/ON4gVP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761128323; x=1792664323;
  h=date:from:to:cc:subject:message-id;
  bh=97mlnXS4EPnyi2HXooYRXIphKPmIJhkDW9PaeyvTt0A=;
  b=G/ON4gVPCVf8zywwu7AbVkF330+OqHkTaYHCXYoPDaZ07K9YNjpi6Cdd
   bd1iG3AGXPrhiqEYQ99+szHWfixzwFsuSEJwHb6gxJmIqXb+aRkNzQMVv
   +svOkvb5YRICRmSsJ9Yu+WWzjHBijH+8yeYzx5Kcbn6PrgbWN99vB2+T2
   UH58zqgMYb/e94pGXdQ1IrpwuN9Ug97LhXYrMYd3m5pnZ6pRcW7pLPiCy
   NVLFH6mzYsBLzJ1P6UKanHJIN/o4XTv/FKnFMz1MPx4wmzZrHJ8WrY4go
   9lC3U4m4oxkR5slSaHRk4JEcm2LSyE878RNMlgl0uy/JgCBQ2rqHCDAZX
   w==;
X-CSE-ConnectionGUID: KJbotX/hScSt4cFxtdt6ew==
X-CSE-MsgGUID: +8L7sw5zRwecjZeFZd6+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73876397"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73876397"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 03:18:43 -0700
X-CSE-ConnectionGUID: 3CnGYXynSGmROwdfdagnlg==
X-CSE-MsgGUID: eS7SabdESE6atw9I4+r+sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="214478798"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Oct 2025 03:18:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBVvN-000CF7-2u;
	Wed, 22 Oct 2025 10:18:33 +0000
Date: Wed, 22 Oct 2025 18:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 7afd5335d6fffa21dddd6a80859dd038988422e7
Message-ID: <202510221840.Pkp02ZDT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 7afd5335d6fffa21dddd6a80859dd038988422e7  leds: lp55xx_common: Enable use without FW_LOADER_USER_HELPER

elapsed time: 1443m

configs tested: 248
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251021    gcc-8.5.0
arc                   randconfig-001-20251022    clang-22
arc                   randconfig-002-20251021    gcc-9.5.0
arc                   randconfig-002-20251022    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-001-20251022    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-002-20251022    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-003-20251022    clang-22
arm                   randconfig-004-20251021    clang-22
arm                   randconfig-004-20251022    clang-22
arm                        spear6xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251021    gcc-15.1.0
arm64                 randconfig-001-20251022    clang-22
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-002-20251022    clang-22
arm64                 randconfig-003-20251021    gcc-12.5.0
arm64                 randconfig-003-20251022    clang-22
arm64                 randconfig-004-20251021    clang-18
arm64                 randconfig-004-20251022    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251021    gcc-15.1.0
csky                  randconfig-001-20251022    clang-22
csky                  randconfig-002-20251021    gcc-11.5.0
csky                  randconfig-002-20251022    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251021    clang-22
hexagon               randconfig-001-20251022    clang-22
hexagon               randconfig-002-20251021    clang-17
hexagon               randconfig-002-20251022    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-001-20251022    gcc-14
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-002-20251022    gcc-14
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-003-20251022    gcc-14
i386        buildonly-randconfig-004-20251021    gcc-14
i386        buildonly-randconfig-004-20251022    gcc-14
i386        buildonly-randconfig-005-20251021    gcc-14
i386        buildonly-randconfig-005-20251022    gcc-14
i386        buildonly-randconfig-006-20251021    clang-20
i386        buildonly-randconfig-006-20251022    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251022    gcc-14
i386                  randconfig-002-20251022    gcc-14
i386                  randconfig-003-20251022    gcc-14
i386                  randconfig-004-20251022    gcc-14
i386                  randconfig-005-20251022    gcc-14
i386                  randconfig-006-20251022    gcc-14
i386                  randconfig-007-20251022    gcc-14
i386                  randconfig-011-20251022    gcc-13
i386                  randconfig-012-20251022    gcc-13
i386                  randconfig-013-20251022    gcc-13
i386                  randconfig-014-20251022    gcc-13
i386                  randconfig-015-20251022    gcc-13
i386                  randconfig-016-20251022    gcc-13
i386                  randconfig-017-20251022    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251021    clang-22
loongarch             randconfig-001-20251022    clang-22
loongarch             randconfig-002-20251021    clang-22
loongarch             randconfig-002-20251022    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251021    gcc-10.5.0
nios2                 randconfig-001-20251022    clang-22
nios2                 randconfig-002-20251021    gcc-8.5.0
nios2                 randconfig-002-20251022    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-001-20251022    clang-22
parisc                randconfig-002-20251021    gcc-15.1.0
parisc                randconfig-002-20251022    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251021    clang-22
powerpc               randconfig-001-20251022    clang-22
powerpc               randconfig-002-20251021    clang-19
powerpc               randconfig-002-20251022    clang-22
powerpc               randconfig-003-20251021    clang-22
powerpc               randconfig-003-20251022    clang-22
powerpc64             randconfig-001-20251021    clang-22
powerpc64             randconfig-001-20251022    clang-22
powerpc64             randconfig-002-20251021    gcc-12.5.0
powerpc64             randconfig-002-20251022    clang-22
powerpc64             randconfig-003-20251021    gcc-8.5.0
powerpc64             randconfig-003-20251022    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-001-20251022    gcc-14.3.0
riscv                 randconfig-002-20251021    clang-22
riscv                 randconfig-002-20251022    gcc-14.3.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251021    clang-22
s390                  randconfig-001-20251022    gcc-14.3.0
s390                  randconfig-002-20251021    gcc-11.5.0
s390                  randconfig-002-20251022    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251021    gcc-9.5.0
sh                    randconfig-001-20251022    gcc-14.3.0
sh                    randconfig-002-20251021    gcc-10.5.0
sh                    randconfig-002-20251022    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-001-20251022    gcc-14.3.0
sparc                 randconfig-002-20251021    gcc-14.3.0
sparc                 randconfig-002-20251022    gcc-14.3.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-001-20251022    gcc-14.3.0
sparc64               randconfig-002-20251021    gcc-10.5.0
sparc64               randconfig-002-20251022    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251021    gcc-14
um                    randconfig-001-20251022    gcc-14.3.0
um                    randconfig-002-20251021    gcc-14
um                    randconfig-002-20251022    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251021    gcc-13
x86_64      buildonly-randconfig-001-20251022    clang-20
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-002-20251022    clang-20
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-003-20251022    clang-20
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-004-20251022    clang-20
x86_64      buildonly-randconfig-005-20251021    gcc-14
x86_64      buildonly-randconfig-005-20251022    clang-20
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64      buildonly-randconfig-006-20251022    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251022    clang-20
x86_64                randconfig-002-20251022    clang-20
x86_64                randconfig-003-20251022    clang-20
x86_64                randconfig-004-20251022    clang-20
x86_64                randconfig-005-20251022    clang-20
x86_64                randconfig-006-20251022    clang-20
x86_64                randconfig-007-20251022    clang-20
x86_64                randconfig-008-20251022    clang-20
x86_64                randconfig-071-20251022    clang-20
x86_64                randconfig-072-20251022    clang-20
x86_64                randconfig-073-20251022    clang-20
x86_64                randconfig-074-20251022    clang-20
x86_64                randconfig-075-20251022    clang-20
x86_64                randconfig-076-20251022    clang-20
x86_64                randconfig-077-20251022    clang-20
x86_64                randconfig-078-20251022    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-001-20251022    gcc-14.3.0
xtensa                randconfig-002-20251021    gcc-13.4.0
xtensa                randconfig-002-20251022    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

