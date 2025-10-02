Return-Path: <linux-leds+bounces-5636-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F0BB3A13
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 12:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86D20189DF80
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 10:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D512E764E;
	Thu,  2 Oct 2025 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dR8f8rw7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE6272E7B
	for <linux-leds@vger.kernel.org>; Thu,  2 Oct 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400936; cv=none; b=dTWK1josS7L5GkzekyZI9j8b6P1ccpIHXTrzN2+Ap4OdR/744rTDwX4Hb3VRM+Z11fGgSzSCaUckR0iA1xaMCs8vuldMUZ5DXHhBDFLNZgOLixyovOfWg/NKJEq6sG/66+aZBpARHFI3lcFho6oaW+IQH99khbN5oFmqo0eBRns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400936; c=relaxed/simple;
	bh=r7Bf2wuPsDRc3UBRBSYgUzuNa4JPYrTpR3vtz/fbBas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WvEAu+D9SXLp9GnWWi1SLdeR8GchFiDEO97SKZWh96wtQF8cu4rFQucyfVeL80N6SnEvNKj8kFsna6n5pp6dRgXaE0DyRDeSuVlo3W36dxT6LY6bx8PVt/DfsadE9RZvdR07sNrq0zzjD1+NtNbmgJE57Nb4XD5ZlJ7BPL/4yEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dR8f8rw7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759400935; x=1790936935;
  h=date:from:to:cc:subject:message-id;
  bh=r7Bf2wuPsDRc3UBRBSYgUzuNa4JPYrTpR3vtz/fbBas=;
  b=dR8f8rw7+zsKMrDEm9asqbNZnTnuwK8Exotbyu/0m5UdRipVlcWgtC5P
   parGvV49dsqpAbzyd83CkPxc3ZCxJ9hpACR17h/auLA9gn1SE2+XfWTtr
   FXtx/47NpxWTM4IZeCMhcPBqB7PFLkS+NoSPbRluZljrN4GeJN7vQniqC
   zr49eZ1igRdfuTr+gs6iH7i1Xw2cUrC0BNVUpnLXhT0NdyXLbe5+EwXV8
   yvAREVayxFOtVelhXt7HECLc4jxYB1VAlzg9pgz685yIC/VVE0vW7XqSa
   soiqH4sbmYdPyzz1Hm6YJ3UoJJQ3nv9G70mHaKSOipRBDwyin8icd+Wuw
   g==;
X-CSE-ConnectionGUID: vzoV9pKXTxqYu33bKBr4SA==
X-CSE-MsgGUID: N6fKPBjbSe6h53C5tQ/xFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61591498"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="61591498"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:28:54 -0700
X-CSE-ConnectionGUID: 8LAJGx/sRoGTIzvhAKUCcA==
X-CSE-MsgGUID: wY43kFncT6OZHbp1NJPT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="202752700"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2025 03:28:53 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4GYM-0003kJ-1Z;
	Thu, 02 Oct 2025 10:28:50 +0000
Date: Thu, 02 Oct 2025 18:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 64826db1e2e177b58dcbc7cf1e1379527be2185a
Message-ID: <202510021848.vecqvRa6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 64826db1e2e177b58dcbc7cf1e1379527be2185a  dt-bindings: leds: as3645: Convert to DT schema

elapsed time: 1453m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251001    gcc-8.5.0
arc                   randconfig-002-20251001    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20251001    gcc-14.3.0
arm                   randconfig-002-20251001    clang-22
arm                   randconfig-003-20251001    gcc-12.5.0
arm                   randconfig-004-20251001    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251001    clang-22
arm64                 randconfig-002-20251001    gcc-9.5.0
arm64                 randconfig-003-20251001    gcc-8.5.0
arm64                 randconfig-004-20251001    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251001    gcc-13.4.0
csky                  randconfig-002-20251001    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251001    clang-22
hexagon               randconfig-002-20251001    clang-22
i386        buildonly-randconfig-001-20251001    clang-20
i386        buildonly-randconfig-002-20251001    clang-20
i386        buildonly-randconfig-003-20251001    gcc-14
i386        buildonly-randconfig-004-20251001    clang-20
i386        buildonly-randconfig-005-20251001    clang-20
i386        buildonly-randconfig-006-20251001    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251001    gcc-13.4.0
loongarch             randconfig-002-20251001    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251001    gcc-11.5.0
nios2                 randconfig-002-20251001    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251001    gcc-8.5.0
parisc                randconfig-002-20251001    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc               randconfig-001-20251001    gcc-8.5.0
powerpc               randconfig-002-20251001    clang-22
powerpc               randconfig-003-20251001    clang-22
powerpc64             randconfig-001-20251001    gcc-8.5.0
powerpc64             randconfig-002-20251001    clang-22
powerpc64             randconfig-003-20251001    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251001    clang-22
riscv                 randconfig-002-20251001    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251001    clang-22
s390                  randconfig-002-20251001    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251001    gcc-13.4.0
sh                    randconfig-002-20251001    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251001    gcc-15.1.0
sparc                 randconfig-002-20251001    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251001    gcc-8.5.0
sparc64               randconfig-002-20251001    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251001    gcc-14
um                    randconfig-002-20251001    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251001    clang-20
x86_64      buildonly-randconfig-002-20251001    clang-20
x86_64      buildonly-randconfig-003-20251001    clang-20
x86_64      buildonly-randconfig-004-20251001    clang-20
x86_64      buildonly-randconfig-005-20251001    clang-20
x86_64      buildonly-randconfig-006-20251001    clang-20
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251001    gcc-15.1.0
xtensa                randconfig-002-20251001    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

