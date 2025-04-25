Return-Path: <linux-leds+bounces-4545-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD8A9CC0A
	for <lists+linux-leds@lfdr.de>; Fri, 25 Apr 2025 16:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1387A3A9FC6
	for <lists+linux-leds@lfdr.de>; Fri, 25 Apr 2025 14:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022542571B8;
	Fri, 25 Apr 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qt9/rT0s"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310E28EC
	for <linux-leds@vger.kernel.org>; Fri, 25 Apr 2025 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745592569; cv=none; b=hu2CanmXSDutiDywROqL576PcVXhnMna/cisv2T3AuqP0RQ4xMb9gbATTmwy8Tp6an5ZNMDYwePB1yDJ64Ka0lLEZrhG0aH9ZC9muS4LyiabHYiJfnHrUEvAVfdaBUBj4YYMFOJb6mbmabpmoLFVIzqua74c/STtLVBiFfJ7T1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745592569; c=relaxed/simple;
	bh=YZz88KPiti6JtWxqcOrBy8XmPMTwLZtVXAzAdqpNKOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LFAgmyWKTF+uPdu8V5NWFpFAg4i0XbE/rGL3DWk1KPKvfMcwv+vJFVFRTGLMhVt+T7B4cM4jiskauHxGaMPhHiVOm/Ss8ZvrQdxLYveb5LgAc/eMC/UgmRUmXna4cQnOUUVF2K7rIkbTc/8B0sl4OMlhKWwqtxxiJa8XHqcnyfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qt9/rT0s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745592568; x=1777128568;
  h=date:from:to:cc:subject:message-id;
  bh=YZz88KPiti6JtWxqcOrBy8XmPMTwLZtVXAzAdqpNKOU=;
  b=Qt9/rT0sFvKR7hEMMvL/GuyT2AqqRt/MDCnqdr/9ROArIxwFUC3ASn/E
   4eJA5dV4BivlB3d/+TqLamsLnUKQ1H0LpS/mq0pqfPGAMl/lTpwXx+CUl
   lIqngW37tP7R3gjBsgZPWqxG6ngffOul4kNiBoojOlwJoYt5qqWpuW5WX
   BaqXmlHu2sGfKcY3WB43QLJ+Nzhxblf0ZPkhSfv0OPb4bBBt8KoIU80lQ
   DfcZFPiKGtY7UZDyvbPpgrimzC6FkQWErcJzV3nodAKib3Av31c0eFx/A
   ODIJ9ymBSi+ZcEP3llOtttYdNWXZYTbb+c6/dtr9YIGq9O0iZpJ6dwiiV
   w==;
X-CSE-ConnectionGUID: o6/hDLldSQOZE77ZfoNWew==
X-CSE-MsgGUID: 6CPshD++QF6r/eiKuKuezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64673453"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="64673453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 07:49:28 -0700
X-CSE-ConnectionGUID: /4e9jE69R+i9gf+K/Wy4vg==
X-CSE-MsgGUID: Gfwj75hBSzmx9jmweUIKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="138014680"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 07:49:26 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8KMl-0005Hh-2O;
	Fri, 25 Apr 2025 14:49:23 +0000
Date: Fri, 25 Apr 2025 22:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 c5b44f3d3b177ae8e4a59fa522e21cbd6af3faa7
Message-ID: <202504252258.8TiPnpbL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: c5b44f3d3b177ae8e4a59fa522e21cbd6af3faa7  leds: turris-omnia: Drop commas in the terminator entries

elapsed time: 1458m

configs tested: 102
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250425    gcc-14.2.0
arc                   randconfig-002-20250425    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250425    clang-21
arm                   randconfig-002-20250425    gcc-6.5.0
arm                   randconfig-003-20250425    clang-21
arm                   randconfig-004-20250425    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250425    clang-21
arm64                 randconfig-002-20250425    gcc-7.5.0
arm64                 randconfig-003-20250425    gcc-7.5.0
arm64                 randconfig-004-20250425    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250425    gcc-13.3.0
csky                  randconfig-002-20250425    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250425    clang-21
hexagon               randconfig-002-20250425    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250425    gcc-12
i386        buildonly-randconfig-002-20250425    gcc-12
i386        buildonly-randconfig-003-20250425    clang-20
i386        buildonly-randconfig-004-20250425    gcc-12
i386        buildonly-randconfig-005-20250425    gcc-12
i386        buildonly-randconfig-006-20250425    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250425    gcc-14.2.0
loongarch             randconfig-002-20250425    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250425    gcc-5.5.0
nios2                 randconfig-002-20250425    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250425    gcc-10.5.0
parisc                randconfig-002-20250425    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250425    clang-21
powerpc               randconfig-002-20250425    gcc-9.3.0
powerpc               randconfig-003-20250425    gcc-9.3.0
powerpc64             randconfig-001-20250425    clang-21
powerpc64             randconfig-002-20250425    gcc-7.5.0
powerpc64             randconfig-003-20250425    gcc-10.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250425    gcc-14.2.0
riscv                 randconfig-002-20250425    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250425    clang-17
s390                  randconfig-002-20250425    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250425    gcc-7.5.0
sh                    randconfig-002-20250425    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250425    gcc-8.5.0
sparc                 randconfig-002-20250425    gcc-14.2.0
sparc64               randconfig-001-20250425    gcc-10.5.0
sparc64               randconfig-002-20250425    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250425    clang-21
um                    randconfig-002-20250425    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250425    gcc-12
x86_64      buildonly-randconfig-002-20250425    clang-20
x86_64      buildonly-randconfig-003-20250425    gcc-12
x86_64      buildonly-randconfig-004-20250425    gcc-12
x86_64      buildonly-randconfig-005-20250425    clang-20
x86_64      buildonly-randconfig-006-20250425    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250425    gcc-6.5.0
xtensa                randconfig-002-20250425    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

