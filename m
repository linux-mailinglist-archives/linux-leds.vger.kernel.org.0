Return-Path: <linux-leds+bounces-3227-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E74509B8C73
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 08:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A664E283490
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2024 07:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240B71553BB;
	Fri,  1 Nov 2024 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJeCKozZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D814A0BC
	for <linux-leds@vger.kernel.org>; Fri,  1 Nov 2024 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447780; cv=none; b=B3f1xAOgWoWP58Rh72bFzEi4tKTEgwsXubUgW55FDxYpGE/wz72laLGk8SBS/bsV/LRBI6VeSoME17MwbVIVtYU4JSojXoxLzUNLqyR45a7bnlvgw0LMuFkK6p2P59glvbJvob4l7wcEIG3Nz17k0LhBZUNl0fLj3YqwpmkGHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447780; c=relaxed/simple;
	bh=08ycd8bESo/A8G/oO3lMuafubLt9poneXP8A3kxKYWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g1jdJZM56/Ho4UKmouobeEIYc9n5xjmwFmnDEIT8+EwoyqA2L8/sh5qds5DK0Z64nqixVx4/FVs3TwTfvf28qt2kH8xcNSCEV6UYhLgwIpbhP618YBhRkIBNaWDt10H5ZT6iO1m9fCXUTwmLZZxJ7Mpj6N0uAkNhNSRoXK8g2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJeCKozZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730447778; x=1761983778;
  h=date:from:to:cc:subject:message-id;
  bh=08ycd8bESo/A8G/oO3lMuafubLt9poneXP8A3kxKYWs=;
  b=ZJeCKozZd5RNbWn+etbujG+ESsWRlufw4F49xYXkl5gGTDG1H898X5fN
   xRWA3ba2UGkYEzpz1uproXFRbxi0Sl7yGrHVLSNZUn4MlIiWHJ2+zMBSG
   sQGhWxpp4TQKbXcQpQkx91Ok0lYPf+YTTBiOPd9gDIzI3rAamA1gs6fqv
   5U3PgwsXNiL8mHkATZIkwr7y99H+KmKlv7C+5MWmLe4Vu7jp6fnGHxFGs
   WSx+hfKorfvw1A8YDcD7yQa/+in+GmiwA6/x0bIeE93cKlRc+P8MO4rcP
   WN7g6BlZIAnY8kJFZZHhvlvz9Hym2T7y3EzIJZmTi8Y9qETcZIctxOMte
   Q==;
X-CSE-ConnectionGUID: GjyR9abSQqqah+VDx6DTFQ==
X-CSE-MsgGUID: M+vblcqiReG0OX5ICvT+Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30398329"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30398329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:56:17 -0700
X-CSE-ConnectionGUID: YQv+yIYqR0izx4hB177qHw==
X-CSE-MsgGUID: y0MNrfwjQ/ijhaNtfjLksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82784278"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2024 00:56:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6mVx-000hI0-2D;
	Fri, 01 Nov 2024 07:56:13 +0000
Date: Fri, 01 Nov 2024 15:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 99d36eed05e735105e89e0a18877518c08618e52
Message-ID: <202411011558.i63ycnw3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 99d36eed05e735105e89e0a18877518c08618e52  leds: bcm6328: Replace divide condition with comparison for shift value

elapsed time: 864m

configs tested: 148
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241101    gcc-14.1.0
arc                   randconfig-002-20241101    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                       netwinder_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                          pxa3xx_defconfig    gcc-14.1.0
arm                   randconfig-001-20241101    gcc-14.1.0
arm                   randconfig-002-20241101    gcc-14.1.0
arm                   randconfig-003-20241101    gcc-14.1.0
arm                   randconfig-004-20241101    gcc-14.1.0
arm                        spear6xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241101    gcc-14.1.0
arm64                 randconfig-002-20241101    gcc-14.1.0
arm64                 randconfig-003-20241101    gcc-14.1.0
arm64                 randconfig-004-20241101    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241101    gcc-14.1.0
csky                  randconfig-002-20241101    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241101    gcc-14.1.0
hexagon               randconfig-002-20241101    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241101    gcc-12
i386        buildonly-randconfig-002-20241101    gcc-12
i386        buildonly-randconfig-003-20241101    gcc-12
i386        buildonly-randconfig-004-20241101    gcc-12
i386        buildonly-randconfig-005-20241101    gcc-12
i386        buildonly-randconfig-006-20241101    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241101    gcc-12
i386                  randconfig-002-20241101    gcc-12
i386                  randconfig-003-20241101    gcc-12
i386                  randconfig-004-20241101    gcc-12
i386                  randconfig-005-20241101    gcc-12
i386                  randconfig-006-20241101    gcc-12
i386                  randconfig-011-20241101    gcc-12
i386                  randconfig-012-20241101    gcc-12
i386                  randconfig-013-20241101    gcc-12
i386                  randconfig-014-20241101    gcc-12
i386                  randconfig-015-20241101    gcc-12
i386                  randconfig-016-20241101    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241101    gcc-14.1.0
loongarch             randconfig-002-20241101    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           gcw0_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    gcc-14.1.0
mips                         rt305x_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241101    gcc-14.1.0
nios2                 randconfig-002-20241101    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241101    gcc-14.1.0
parisc                randconfig-002-20241101    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   motionpro_defconfig    gcc-14.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241101    gcc-14.1.0
powerpc               randconfig-002-20241101    gcc-14.1.0
powerpc               randconfig-003-20241101    gcc-14.1.0
powerpc64             randconfig-001-20241101    gcc-14.1.0
powerpc64             randconfig-002-20241101    gcc-14.1.0
powerpc64             randconfig-003-20241101    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241101    gcc-14.1.0
riscv                 randconfig-002-20241101    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241101    gcc-14.1.0
s390                  randconfig-002-20241101    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241101    gcc-14.1.0
sh                    randconfig-002-20241101    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241101    gcc-14.1.0
sparc64               randconfig-002-20241101    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241101    gcc-14.1.0
um                    randconfig-002-20241101    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241101    gcc-14.1.0
xtensa                randconfig-002-20241101    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

