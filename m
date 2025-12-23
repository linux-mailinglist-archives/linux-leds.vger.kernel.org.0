Return-Path: <linux-leds+bounces-6462-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EEBCD9B93
	for <lists+linux-leds@lfdr.de>; Tue, 23 Dec 2025 15:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BC7A30062E7
	for <lists+linux-leds@lfdr.de>; Tue, 23 Dec 2025 14:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA39E2737FC;
	Tue, 23 Dec 2025 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHWRQWEF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC391FE47B
	for <linux-leds@vger.kernel.org>; Tue, 23 Dec 2025 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766501838; cv=none; b=uw/qyGjKHvh3RltLsTxy0rWQEMWJ8JVo0wWBEP6UDcc84J2IOWeiXeJP/NBKIZqiKmOQqMJXt41icL611euPtQc3KSiqHRb6pj+YFwZ4jJWX+PSnYLannKXvx3y+6Kh9kcxHydnAyFXo5IhddTwJv5noT8kCM+6/4Ia0SBgmEoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766501838; c=relaxed/simple;
	bh=BAgN7saUUVRbOtlf9InTlstzvkHiSOLb+va1i01jlhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BtgZmxHNouORYwBlFE43vTtoOsLFGcDH1FvPUPe3xsxyCwRi+WBOfYEDlT9ExE82mZT2EvYedyUntJw/GllhLPRHLF0Wv9+n+wmVmGFuK30N1AFQVy3L4Lpn1ChlsaK/0cZapDELPCAXDTVSZJ/E0gLwSPxTIFHij6rRqo1dYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHWRQWEF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766501837; x=1798037837;
  h=date:from:to:cc:subject:message-id;
  bh=BAgN7saUUVRbOtlf9InTlstzvkHiSOLb+va1i01jlhk=;
  b=BHWRQWEFh2yKOGKOq8TVROjG2kAnnDymwb2Qizu9vJsJ/EXxeERv/fCA
   76zUlHqrWx5cctiN2ZpyOeeJuzNIqjWTHzTrovz1LjFBC5IjjeYF33F2s
   STruz6xNm9FlefBjgj0LjTXtaZl6jpz+O6JQlC8cuGs7NVl+x+Di+brXv
   TMRs8wQsypnF8UQZ9Lsbg7filA2B6WIZoQeuYiFALo7lV+Z2Z7th1cjW5
   yu6lfvKUFWI2nlD4M19CluNgqBg1MPNFjeOCTF99ce0sJjxv0iuonxvOu
   vja8Rby70JvlNn6Gb4WUAdXi0blcOdgcRJeSrXUiBnIL9+XSXzgZHEUDc
   g==;
X-CSE-ConnectionGUID: KhrEZl1JTSSUd5RTNLRAMA==
X-CSE-MsgGUID: L+UwAmkuT/OVPgSjDSZAZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="78663300"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="78663300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 06:57:12 -0800
X-CSE-ConnectionGUID: 3A4Jk7ctQWSey8uUB8RH3A==
X-CSE-MsgGUID: fNaYRunVRtKADlzS+5DfPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="198928095"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Dec 2025 06:57:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY3ot-0000000022N-1Ecz;
	Tue, 23 Dec 2025 14:57:06 +0000
Date: Tue, 23 Dec 2025 22:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 8856d7fe1758937ac528770f552ec58c388c255b
Message-ID: <202512232226.kIhlplDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 8856d7fe1758937ac528770f552ec58c388c255b  leds: as3668: Driver for the ams Osram 4-channel i2c LED driver

elapsed time: 1456m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251223    gcc-8.5.0
arc                   randconfig-002-20251223    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251223    clang-22
arm                   randconfig-002-20251223    gcc-10.5.0
arm                   randconfig-003-20251223    clang-20
arm                   randconfig-004-20251223    gcc-8.5.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251223    clang-17
arm64                 randconfig-002-20251223    clang-22
arm64                 randconfig-003-20251223    clang-18
arm64                 randconfig-004-20251223    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251223    gcc-11.5.0
csky                  randconfig-002-20251223    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251223    clang-22
hexagon               randconfig-002-20251223    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251223    clang-20
i386        buildonly-randconfig-002-20251223    gcc-14
i386        buildonly-randconfig-003-20251223    clang-20
i386        buildonly-randconfig-004-20251223    clang-20
i386        buildonly-randconfig-005-20251223    gcc-14
i386        buildonly-randconfig-006-20251223    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251223    clang-20
i386                  randconfig-002-20251223    gcc-14
i386                  randconfig-003-20251223    clang-20
i386                  randconfig-004-20251223    gcc-14
i386                  randconfig-005-20251223    gcc-13
i386                  randconfig-006-20251223    gcc-14
i386                  randconfig-007-20251223    gcc-14
i386                  randconfig-011-20251223    gcc-12
i386                  randconfig-012-20251223    gcc-14
i386                  randconfig-013-20251223    gcc-12
i386                  randconfig-014-20251223    gcc-14
i386                  randconfig-015-20251223    gcc-14
i386                  randconfig-016-20251223    gcc-14
i386                  randconfig-017-20251223    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251223    gcc-15.1.0
loongarch             randconfig-002-20251223    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-11.5.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251223    gcc-11.5.0
nios2                 randconfig-002-20251223    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251223    gcc-8.5.0
parisc                randconfig-002-20251223    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251223    clang-22
powerpc               randconfig-002-20251223    clang-22
powerpc64             randconfig-001-20251223    clang-17
powerpc64             randconfig-002-20251223    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251223    gcc-8.5.0
riscv                 randconfig-002-20251223    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251223    gcc-14.3.0
s390                  randconfig-002-20251223    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251223    gcc-10.5.0
sh                    randconfig-002-20251223    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251223    gcc-15.1.0
sparc                 randconfig-002-20251223    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251223    gcc-8.5.0
sparc64               randconfig-002-20251223    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251223    clang-22
um                    randconfig-002-20251223    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251223    clang-20
x86_64      buildonly-randconfig-002-20251223    clang-20
x86_64      buildonly-randconfig-003-20251223    gcc-14
x86_64      buildonly-randconfig-004-20251223    gcc-14
x86_64      buildonly-randconfig-005-20251223    clang-20
x86_64      buildonly-randconfig-006-20251223    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251223    gcc-14
x86_64                randconfig-012-20251223    clang-20
x86_64                randconfig-013-20251223    clang-20
x86_64                randconfig-014-20251223    clang-20
x86_64                randconfig-015-20251223    gcc-14
x86_64                randconfig-016-20251223    gcc-14
x86_64                randconfig-071-20251223    gcc-14
x86_64                randconfig-072-20251223    clang-20
x86_64                randconfig-073-20251223    clang-20
x86_64                randconfig-074-20251223    gcc-14
x86_64                randconfig-075-20251223    gcc-14
x86_64                randconfig-076-20251223    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251223    gcc-8.5.0
xtensa                randconfig-002-20251223    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

