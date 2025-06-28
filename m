Return-Path: <linux-leds+bounces-4907-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C794DAEC75B
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 15:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A63177A8A
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 13:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513703595B;
	Sat, 28 Jun 2025 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP0onz9w"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61212629C
	for <linux-leds@vger.kernel.org>; Sat, 28 Jun 2025 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751116821; cv=none; b=hC3/kS19wY/C5KgompbWstR3Lbful4ZF3xLBAlSWWWZRECU/8+r2sx7j5Hah6vzymGJXHiLSMpl49g8/1zujCJmRxKOwpSbc2Zp9l4q8x9ja72Y++rr5rVTSRPjyNY9t8GsFgEFKObLBTuZrltSWQXrepL6GXj5JqShCJMIiTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751116821; c=relaxed/simple;
	bh=Rm9IHVU4RN588lDny01CeDdULLPZ+gIOFmQPIU+KB0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JGkphaOF/PX9bQm0ge2I7aeuvbOI3+EZM9OeR5W/M+cTabuDUy7CEqfZIwBQ5e40h85tIhca1Dck4tkLCB0H0KRuGU4gQnMH/BxbHANku60n8dCLmiDmJMosJDWjaaJPDQfxCeelWsC6oAt03Kvrc+kwMNHbB0QCHumyB7jDx6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP0onz9w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751116820; x=1782652820;
  h=date:from:to:cc:subject:message-id;
  bh=Rm9IHVU4RN588lDny01CeDdULLPZ+gIOFmQPIU+KB0I=;
  b=WP0onz9wjrgt0qMKtPjNy2ykm6k2kKY79gepOJxhkKFwlZ2lftKrhTmh
   naAn96SQrBSNV8BNXItzddQysWhssKRdvj3r+wPsip2AtjNcO9nH6sfml
   xq0K5ygXid2kNaifx9mHnRv3yMlOLknT0ZmodHG11sk3FLY7phMyM9d01
   mawaCGJxKiv0oiF5YW4qWGEHnr4Yi4ge71Yoo4gIJ6cbt6QLFdtjWAUml
   fJwEjEmToGFhsBZCJBlfhOcHd+j28SActMQH+SeWCTfw3KBzs07V8Im3z
   /sU+oGdG1IYvkQDEKTdMDZJyHq4CqUXu/ZyMseoxwzgsewa+gbKrEYOcG
   g==;
X-CSE-ConnectionGUID: U9wwrqoUTbCqdyciMKEBrg==
X-CSE-MsgGUID: p4k7uqmqQvaMzgSbhOVL5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53278043"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53278043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 06:20:19 -0700
X-CSE-ConnectionGUID: 4OWW5mjeTPOsS5v/ymufkg==
X-CSE-MsgGUID: uFVgBIYGRd6CzbvQtvmUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153213504"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2025 06:20:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVVTc-000X4I-09;
	Sat, 28 Jun 2025 13:20:16 +0000
Date: Sat, 28 Jun 2025 21:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 1d7a74dfba583a9e8dde1f0234e91a5b49032863
Message-ID: <202506282118.AujXoRHM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 1d7a74dfba583a9e8dde1f0234e91a5b49032863  dt-bindings: leds: lp50xx: Document child reg, fix example

elapsed time: 1454m

configs tested: 119
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250627    gcc-8.5.0
arc                   randconfig-002-20250627    gcc-12.4.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                            dove_defconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-21
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250627    gcc-15.1.0
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250627    clang-21
arm                   randconfig-004-20250627    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250627    clang-17
arm64                 randconfig-002-20250627    gcc-10.5.0
arm64                 randconfig-003-20250627    gcc-12.3.0
arm64                 randconfig-004-20250627    clang-19
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250628    gcc-14.3.0
csky                  randconfig-002-20250628    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250628    clang-21
hexagon               randconfig-002-20250628    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250627    gcc-12
i386        buildonly-randconfig-002-20250627    gcc-12
i386        buildonly-randconfig-003-20250627    gcc-12
i386        buildonly-randconfig-004-20250627    gcc-12
i386        buildonly-randconfig-005-20250627    clang-20
i386        buildonly-randconfig-006-20250627    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-002-20250628    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250628    gcc-8.5.0
nios2                 randconfig-002-20250628    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250628    gcc-8.5.0
parisc                randconfig-002-20250628    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    clang-21
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250628    gcc-8.5.0
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-003-20250628    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250628    clang-20
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250628    clang-21
riscv                 randconfig-002-20250628    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250628    clang-21
s390                  randconfig-002-20250628    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250628    gcc-15.1.0
sh                    randconfig-002-20250628    gcc-9.3.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250628    gcc-8.5.0
sparc                 randconfig-002-20250628    gcc-12.4.0
sparc64               randconfig-001-20250628    gcc-8.5.0
sparc64               randconfig-002-20250628    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250628    gcc-12
um                    randconfig-002-20250628    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250627    gcc-12
x86_64      buildonly-randconfig-006-20250627    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250628    gcc-11.5.0
xtensa                randconfig-002-20250628    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

