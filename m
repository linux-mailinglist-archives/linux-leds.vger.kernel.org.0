Return-Path: <linux-leds+bounces-3782-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB22A13EAC
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2025 17:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE7EC16A357
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2025 16:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831B322BAC1;
	Thu, 16 Jan 2025 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH6Fpa0a"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1641DDA17
	for <linux-leds@vger.kernel.org>; Thu, 16 Jan 2025 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043358; cv=none; b=md+7XYOAqt7JkCbi2/3fLsCDkQKHKj1vw6UjfoHl04EDN3fBGpiuToRZBKuK/vxTs7jljD7O2eVsAQFda869f+aV2NtXMTdBifKCpI8e8V5dFe4OcnPjy016GyX2XtXoT4koon0/mBkdAPu1kjdImDX/hSH+DDjjnW6cSOPPa/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043358; c=relaxed/simple;
	bh=tAcvKCnAJBJt471xgOJavJ2MYD+ZBx77kZNJSJ0Q2eQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IEY+Uyfk65bgXBlW24IBcZMvNy27JECF9/Mu+Q6Z+gzlMBiSzTXl64MVJHs17M/ZkbFU/AVFUvbMWToXOQIq8P4qR1pVKtfzJS6Vjg8HT6ZUHU/T4ayaGGy+Kh2L0TR84eOS573KJLROV2KZ2IWCn7rO5SaWqTbyuVO6FCeT/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH6Fpa0a; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737043357; x=1768579357;
  h=date:from:to:cc:subject:message-id;
  bh=tAcvKCnAJBJt471xgOJavJ2MYD+ZBx77kZNJSJ0Q2eQ=;
  b=SH6Fpa0arGDQmTFwKKsdTClEnS6XayErFQD9cEoOVSAoa5rv290iTAWd
   acVJ6GT5sr+iy2utwHmhXaX+Bb4UIdz/Vw6Gdz9nmLx2CbwVCs1VOJnL5
   RSpL6vwIx2oe67qd6w9GrrRv0Lay/REtUpgOpVt/fEPRaXgRjHW5iKxsK
   bqx7lMzySXjk4KY7RayC7pJW2g39MnUyDdMUQgQXCEswT4GcrJECnyiw1
   gt/CE69Y3bi0Aj1XU11MiALNCkbsUlzp8Y4SjzTQPO1Jr8ZZPSQks/uLZ
   XrAMZf6Il/rZBLrgQArjFN6i5mOLy1N8TTk/Q0E/drSjE5XC/wXsV1zUg
   g==;
X-CSE-ConnectionGUID: e3slAHD+QF2lEgkVMwWcnA==
X-CSE-MsgGUID: GnKpaPgQQPKeCxRQa/UpaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37357201"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37357201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 08:02:36 -0800
X-CSE-ConnectionGUID: VnC846j3QXqasgQQduc8pA==
X-CSE-MsgGUID: Qe/3WdJHS6eL1NMUqZP6OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="105491463"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 08:02:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYSK5-000S79-0w;
	Thu, 16 Jan 2025 16:02:21 +0000
Date: Fri, 17 Jan 2025 00:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS WITH WARNING
 daefd7fbd544671ad0b9c2a815d7f5e3d2f0365c
Message-ID: <202501170017.NY6l2lmb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: daefd7fbd544671ad0b9c2a815d7f5e3d2f0365c  leds: triggers: Constify 'struct bin_attribute'

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202501160322.jk8PObOP-lkp@intel.com

    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allnoconfig
    `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-leds-backlight-ti-lp8864.yaml

elapsed time: 1452m

configs tested: 99
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250116    gcc-13.2.0
arc                   randconfig-002-20250116    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250116    gcc-14.2.0
arm                   randconfig-002-20250116    clang-15
arm                   randconfig-003-20250116    gcc-14.2.0
arm                   randconfig-004-20250116    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250116    gcc-14.2.0
arm64                 randconfig-002-20250116    gcc-14.2.0
arm64                 randconfig-003-20250116    clang-15
arm64                 randconfig-004-20250116    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250116    gcc-14.2.0
csky                  randconfig-002-20250116    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250116    clang-20
hexagon               randconfig-002-20250116    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250116    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250116    gcc-14.2.0
loongarch             randconfig-002-20250116    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250116    gcc-14.2.0
nios2                 randconfig-002-20250116    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250116    gcc-14.2.0
parisc                randconfig-002-20250116    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-19
powerpc               randconfig-001-20250116    clang-20
powerpc               randconfig-002-20250116    gcc-14.2.0
powerpc               randconfig-003-20250116    clang-20
powerpc64             randconfig-001-20250116    clang-19
powerpc64             randconfig-002-20250116    clang-20
powerpc64             randconfig-003-20250116    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250116    gcc-14.2.0
riscv                 randconfig-002-20250116    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250116    gcc-14.2.0
s390                  randconfig-002-20250116    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250116    gcc-14.2.0
sh                    randconfig-002-20250116    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250116    gcc-14.2.0
sparc                 randconfig-002-20250116    gcc-14.2.0
sparc64               randconfig-001-20250116    gcc-14.2.0
sparc64               randconfig-002-20250116    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250116    clang-19
um                    randconfig-002-20250116    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250116    gcc-12
x86_64      buildonly-randconfig-002-20250116    gcc-12
x86_64      buildonly-randconfig-003-20250116    gcc-12
x86_64      buildonly-randconfig-004-20250116    clang-19
x86_64      buildonly-randconfig-005-20250116    clang-19
x86_64      buildonly-randconfig-006-20250116    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250116    gcc-14.2.0
xtensa                randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

