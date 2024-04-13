Return-Path: <linux-leds+bounces-1474-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9A8A3B3E
	for <lists+linux-leds@lfdr.de>; Sat, 13 Apr 2024 08:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A368B2159A
	for <lists+linux-leds@lfdr.de>; Sat, 13 Apr 2024 06:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1C91CAB5;
	Sat, 13 Apr 2024 06:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReQJhf61"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65891BC41
	for <linux-leds@vger.kernel.org>; Sat, 13 Apr 2024 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712988574; cv=none; b=I2HNaGQYu4lpj7vV9+D04iKjBllUKhUtlwkZn75U7AQDVbw8HW/0GwRpakffKalvY4y8QN+2rmMOhrC1mtGLEZKjezcGTgHGiLyR3BqGYLmbpfKhhsr/XVbP65FsS2vir8lEhToGTZyk+5XTfiw3942ciB1S02G/gOruPDm96Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712988574; c=relaxed/simple;
	bh=Pmz2KtVqR/93cF2cOCehKHBbzpbs8gngpfRBFYjnMaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sDFR/8kGWFtficmAycerhyahLwPYrwSlTRgNzxBD7zkk0OcPWjcpcyPfx7ZmzaEPrxCAcsUkdUBbQ53Sk4NMjt0CP30aZpfV20xl6whhSnvrM8gOA66TRCGzYgUEgBKKnbYiijSKp/HuTAByzfjOkS8BaUO7SnvQdKSWaIAva2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReQJhf61; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712988573; x=1744524573;
  h=date:from:to:cc:subject:message-id;
  bh=Pmz2KtVqR/93cF2cOCehKHBbzpbs8gngpfRBFYjnMaU=;
  b=ReQJhf61E6IZlCqD4bEpHezmzzxqv3GgDiGQtUI1nlJqfIY9l6lZJXfe
   Uhx1ZV41Ze2moiBYy6Y9TM5QaqdUOTOe5vdHBTABsFKldn3wZ7caWLtRb
   a2TW0Jb3gxGBBa1pPNK7dGGzRMcQqxV6QgyXhomSB/FhLWZJnsNRvlrTB
   COaOxbZvZp9oD2nBhzbZ+QeKJDd9fOmzDRgnoGq1V5YbsEX6G1+Nxx+BR
   xyI0F9sFO0fUQuL8gygTdXkJ8tYpiKuM2IO635dfofblDj5MXtk244e81
   BG88mzjJCEaUyWwo4RtCd8eQ07c6li5GZHr1HMuuhVyjps/1LRRLSVz/h
   w==;
X-CSE-ConnectionGUID: 5V6mAnyCRuyeBrT8Y9yACw==
X-CSE-MsgGUID: oSTbOZs3TZ2Q/VPaKx/6hQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25913306"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="25913306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 23:09:32 -0700
X-CSE-ConnectionGUID: uVlwq7sBSRyChnOTlvTIeQ==
X-CSE-MsgGUID: 5BfxH1JyQIeygiuT7FRmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="26078653"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2024 23:09:29 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvWZr-0001wS-07;
	Sat, 13 Apr 2024 06:09:27 +0000
Date: Sat, 13 Apr 2024 14:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:ib-leds-locking-6.10] BUILD SUCCESS
 c382e2e3eccb6b7ca8c7aff5092c1668428e7de6
Message-ID: <202404131437.t5fPf7RL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git ib-leds-locking-6.10
branch HEAD: c382e2e3eccb6b7ca8c7aff5092c1668428e7de6  leds: an30259a: Use devm_mutex_init() for mutex initialization

elapsed time: 1275m

configs tested: 164
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
arm64                            allyesconfig   clang
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
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240413   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

