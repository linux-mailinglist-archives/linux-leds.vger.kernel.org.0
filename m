Return-Path: <linux-leds+bounces-1475-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 122458A3B8B
	for <lists+linux-leds@lfdr.de>; Sat, 13 Apr 2024 10:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 878131F21DEE
	for <lists+linux-leds@lfdr.de>; Sat, 13 Apr 2024 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450B81CFBB;
	Sat, 13 Apr 2024 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ET66prf1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A47208A5
	for <linux-leds@vger.kernel.org>; Sat, 13 Apr 2024 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995333; cv=none; b=OmW8WaX6Tw3bfjneu1qSzOqJcTk1EuJfQe/zHhF9gcyhlm4vSpZCAKDJuEGOn6sEwlgf+OwHUKv5meR0ujR9hO5EmD+/PSlbgJWk7iD1CrFFHVhnT/LPvQ09k1dC2FqrTSx5/MsPnNZZE5deKm5d8p6mNGdn1VLVFWxjArBty94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995333; c=relaxed/simple;
	bh=vMCsR3L71hq65uasEASeicd2fvslEo29S24DFSB+gLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSC725qfItMUNuAlvhrutj/IjuMB9GlZIVhviVHWTdU+b+jKRmLeGwO7As2t12DXLSBOyDknYMDGuxVMYrKUb2DQeX8jRypqu7UMP1VXWcCOOtxuyOEInWmXRJA7lOfXRCutysMPSq1pizIBOD6xBPHgj4xeWxyhdOXsQ8DIlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ET66prf1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712995331; x=1744531331;
  h=date:from:to:cc:subject:message-id;
  bh=vMCsR3L71hq65uasEASeicd2fvslEo29S24DFSB+gLg=;
  b=ET66prf193jU5m1nB4Y9+VlUsbUqVG0ftK+BXJ7T+07d6mSc5ogTi/jV
   h9mAMmAjlyrFkFJxIAdM8d0Fmk8w/+LhuLVPhbKXo1pGV14Dq201WWh5a
   gzNpCXfqWnkTpYVwRJjCjcDjLN7kuPesDe4/pUU+b5t8wjQAsUljuIsFO
   x5g+ncc+1F1sycBxZag6dezxKv3UoE5j7bLw+VgYizno2D8krZmeM8dZi
   1BMS8vbQxf/f1QtlmqD73OPZCvsLaoPXzgGw5PNiXhD2570U4uZ8KI/M/
   4HeauSQUecOxqJjbYpUtzo5wOFOCMaHyWb5xMVayYWqbRO3ASYbN5TNEv
   w==;
X-CSE-ConnectionGUID: aMR/poKqTeSR7r8O1ZU9NA==
X-CSE-MsgGUID: ND3R5QpfR2O806xHZ9KQrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19013626"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="19013626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 01:02:11 -0700
X-CSE-ConnectionGUID: mx2dMMbFTkCqM617uVVv6g==
X-CSE-MsgGUID: nvJM1HbzTTqi97QaNwviRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="44705726"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Apr 2024 01:02:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvYKt-00024o-19;
	Sat, 13 Apr 2024 08:02:07 +0000
Date: Sat, 13 Apr 2024 16:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 fd05e3698649f253db5476929675a8cd954cb2b8
Message-ID: <202404131652.Kwvw98pE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: fd05e3698649f253db5476929675a8cd954cb2b8  leds: mt6360: Fix the second LED can not enable torch mode by V4L2

elapsed time: 1388m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240413   gcc  
arc                   randconfig-002-20240413   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240413   clang
arm                   randconfig-002-20240413   gcc  
arm                   randconfig-003-20240413   clang
arm                   randconfig-004-20240413   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240413   clang
arm64                 randconfig-002-20240413   clang
arm64                 randconfig-003-20240413   clang
arm64                 randconfig-004-20240413   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240413   gcc  
csky                  randconfig-002-20240413   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240413   clang
hexagon               randconfig-002-20240413   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240412   gcc  
i386         buildonly-randconfig-002-20240412   clang
i386         buildonly-randconfig-003-20240412   gcc  
i386         buildonly-randconfig-004-20240412   gcc  
i386         buildonly-randconfig-005-20240412   gcc  
i386         buildonly-randconfig-006-20240412   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240412   clang
i386                  randconfig-002-20240412   gcc  
i386                  randconfig-003-20240412   clang
i386                  randconfig-004-20240412   clang
i386                  randconfig-005-20240412   clang
i386                  randconfig-006-20240412   gcc  
i386                  randconfig-011-20240412   clang
i386                  randconfig-012-20240412   gcc  
i386                  randconfig-013-20240412   clang
i386                  randconfig-014-20240412   gcc  
i386                  randconfig-015-20240412   gcc  
i386                  randconfig-016-20240412   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240413   gcc  
loongarch             randconfig-002-20240413   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240413   gcc  
nios2                 randconfig-002-20240413   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240413   gcc  
parisc                randconfig-002-20240413   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240413   clang
powerpc               randconfig-002-20240413   clang
powerpc               randconfig-003-20240413   clang
powerpc64             randconfig-001-20240413   clang
powerpc64             randconfig-002-20240413   gcc  
powerpc64             randconfig-003-20240413   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240413   clang
riscv                 randconfig-002-20240413   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240413   gcc  
s390                  randconfig-002-20240413   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240413   gcc  
sh                    randconfig-002-20240413   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240413   gcc  
sparc64               randconfig-002-20240413   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240413   clang
um                    randconfig-002-20240413   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240413   gcc  
x86_64       buildonly-randconfig-002-20240413   gcc  
x86_64       buildonly-randconfig-003-20240413   gcc  
x86_64       buildonly-randconfig-004-20240413   gcc  
x86_64       buildonly-randconfig-005-20240413   gcc  
x86_64       buildonly-randconfig-006-20240413   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240413   gcc  
x86_64                randconfig-002-20240413   gcc  
x86_64                randconfig-003-20240413   gcc  
x86_64                randconfig-004-20240413   gcc  
x86_64                randconfig-005-20240413   gcc  
x86_64                randconfig-006-20240413   gcc  
x86_64                randconfig-011-20240413   clang
x86_64                randconfig-012-20240413   clang
x86_64                randconfig-013-20240413   clang
x86_64                randconfig-014-20240413   clang
x86_64                randconfig-015-20240413   gcc  
x86_64                randconfig-016-20240413   clang
x86_64                randconfig-071-20240413   gcc  
x86_64                randconfig-072-20240413   gcc  
x86_64                randconfig-073-20240413   clang
x86_64                randconfig-074-20240413   gcc  
x86_64                randconfig-075-20240413   gcc  
x86_64                randconfig-076-20240413   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240413   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

