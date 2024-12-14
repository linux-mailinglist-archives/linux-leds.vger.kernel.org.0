Return-Path: <linux-leds+bounces-3606-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 356AF9F208D
	for <lists+linux-leds@lfdr.de>; Sat, 14 Dec 2024 20:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB01F1887EF1
	for <lists+linux-leds@lfdr.de>; Sat, 14 Dec 2024 19:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5294813C3F6;
	Sat, 14 Dec 2024 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldAECSot"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4511119A
	for <linux-leds@vger.kernel.org>; Sat, 14 Dec 2024 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734203564; cv=none; b=B8buvnUfdKGydyhc8XynNqXS4obRRCtSAWmop3JVQFv94JPbFH5Wasei0kDx5SpdOWGsuOdJPtuGSVgNPY8ROTbuQmobIyGD0aZf+178GlvUsen7jJp3gc0jjJDb6FW30dCQqF4PlddcwaEiK+/VtrprPVeSYhkSEoLr8612/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734203564; c=relaxed/simple;
	bh=KlsaQf3B+rOa6hKo6maeVF0t+S9Npg/WPe0I5qMmEbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=innDH1A3dyHBNDHK+7YaaNkJN0SvT0U+1UXunWRHmNbworfH2eG283ffGoI2e0Moxqs5MOmxJ0jmfueUJAAbCIpxlX/0lkXOZ6Gw+XIosn5UHzIwQ5HwrQ+GY5b86IyckfA40EbDnK0k+/Wb+Eys3SjJZ60bHx3EW6ZKHynxd6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldAECSot; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734203562; x=1765739562;
  h=date:from:to:cc:subject:message-id;
  bh=KlsaQf3B+rOa6hKo6maeVF0t+S9Npg/WPe0I5qMmEbE=;
  b=ldAECSotlofhzakEqS1rgxUSwZhxJx2s3YtJxWpre4S4FowjIt7h5uxg
   ddZfWRl2Hsh5SvTWrNGgmx0/JlvdagJxi3ifOr8mpOZBYxxxpMtwJULbn
   sB4ThRSdnJrd9oGnzEdlDXb6NfRzy6SdiLFhHEJKFzerIAhECef1Y+U65
   wdUbJnyKFvW+Ln9i8EE6ebZrD0p/7EbpkU3eJWJgyHiz/ywXKiwAW0gDw
   FHrATV5fSw2v7uAcvY8wM+ISQlliENSY1kPSOacBFkImDJpfA2jL1kjDr
   PNVGVW29h0oeQuSlAXDmwM/lzxJYy3WGdgyppMVlWw8Nuq0kPJWSnWlkP
   w==;
X-CSE-ConnectionGUID: pU6qHa+zRfSNDixJHeayjA==
X-CSE-MsgGUID: 5rxawCyUS9WABsOE+oInmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38415329"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="38415329"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:12:41 -0800
X-CSE-ConnectionGUID: NO0k1S5sScSriKRz3cbh2w==
X-CSE-MsgGUID: 5YYFnq2sRvacVVbYwSHUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101922838"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2024 11:12:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMXZ8-000DA5-03;
	Sat, 14 Dec 2024 19:12:38 +0000
Date: Sun, 15 Dec 2024 03:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 4cc40bf45b6f6b6ae350e1f75ee0af49b81f9b1f
Message-ID: <202412150329.x1dgsVKc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 4cc40bf45b6f6b6ae350e1f75ee0af49b81f9b1f  leds: turris-omnia: Use uppercase first letter in all comments

elapsed time: 1446m

configs tested: 56
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241214    gcc-13.2.0
arc                  randconfig-002-20241214    gcc-13.2.0
arm                  randconfig-001-20241214    gcc-14.2.0
arm                  randconfig-002-20241214    clang-15
arm                  randconfig-003-20241214    gcc-14.2.0
arm                  randconfig-004-20241214    gcc-14.2.0
arm64                randconfig-001-20241214    clang-15
arm64                randconfig-002-20241214    clang-20
arm64                randconfig-003-20241214    clang-15
arm64                randconfig-004-20241214    gcc-14.2.0
csky                 randconfig-001-20241214    gcc-14.2.0
csky                 randconfig-002-20241214    gcc-14.2.0
hexagon              randconfig-001-20241214    clang-20
hexagon              randconfig-002-20241214    clang-14
i386       buildonly-randconfig-001-20241214    gcc-12
i386       buildonly-randconfig-002-20241214    gcc-12
i386       buildonly-randconfig-003-20241214    clang-19
i386       buildonly-randconfig-004-20241214    clang-19
i386       buildonly-randconfig-005-20241214    gcc-11
i386       buildonly-randconfig-006-20241214    gcc-12
loongarch            randconfig-001-20241214    gcc-14.2.0
loongarch            randconfig-002-20241214    gcc-14.2.0
nios2                randconfig-001-20241214    gcc-14.2.0
nios2                randconfig-002-20241214    gcc-14.2.0
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                randconfig-001-20241214    clang-20
riscv                randconfig-002-20241214    clang-20
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241214    gcc-14.2.0
s390                 randconfig-002-20241214    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241214    gcc-14.2.0
sh                   randconfig-002-20241214    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241214    gcc-14.2.0
sparc                randconfig-002-20241214    gcc-14.2.0
sparc64              randconfig-001-20241214    gcc-14.2.0
sparc64              randconfig-002-20241214    gcc-14.2.0
um                   randconfig-001-20241214    clang-20
um                   randconfig-002-20241214    clang-17
x86_64     buildonly-randconfig-001-20241214    gcc-11
x86_64     buildonly-randconfig-002-20241214    clang-19
x86_64     buildonly-randconfig-003-20241214    gcc-12
x86_64     buildonly-randconfig-004-20241214    gcc-12
x86_64     buildonly-randconfig-005-20241214    gcc-12
x86_64     buildonly-randconfig-006-20241214    clang-19
xtensa               randconfig-001-20241214    gcc-14.2.0
xtensa               randconfig-002-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

