Return-Path: <linux-leds+bounces-4464-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C686EA86C52
	for <lists+linux-leds@lfdr.de>; Sat, 12 Apr 2025 12:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F2977B4879
	for <lists+linux-leds@lfdr.de>; Sat, 12 Apr 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F561A317E;
	Sat, 12 Apr 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8ixEzbD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85884192D77
	for <linux-leds@vger.kernel.org>; Sat, 12 Apr 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452180; cv=none; b=CGN13I+QfquDNPfDwHmMhioNzVAHFNGCLVYLeljrxtvoOysWaSbgXk+xYY5PJftxHeCtSX9f7Z+y2+mz8IY+Zh9oiVGIbl38WJMzXo59dZCK+2F/5dekbnQYg2tgZTqgKs3K/UOn35tzjZK6gzG1RQ0tZ97QJBL/ZALUrzo1+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452180; c=relaxed/simple;
	bh=C/hnj1Yout9drVtV8j5a/rYwQ2mZY5qJiAh4JinqGKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVobegEqgtogrPQwmCjxhmv9R6AxE3nMfCahnVTZLHFgOPTtJa+R/zo6T1TYZtHCZWfqrATF5H4E0VE2hQSKKDjSHUvMA6yLZ0NohcqpAB6Ijqb59PzDQKOT3d4mVem8DFo95ilsW9Z5kgiEgXYzgoCvWCfVjFfGK2W0jXW6QDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8ixEzbD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744452178; x=1775988178;
  h=date:from:to:cc:subject:message-id;
  bh=C/hnj1Yout9drVtV8j5a/rYwQ2mZY5qJiAh4JinqGKA=;
  b=a8ixEzbDUzv6dz6FLwObiS/RP6NZV3YBxeRaAcSikI0U0sctYn72Q4tS
   wndBuZgdry/gOhTdpe/UdF6/P2ygWKz5+7tQjGF5z7EpZF0NY+Ezu18Fs
   eg7kpa/PbAQIUUA1HL9mRJAgD7d7fgPNcd2UU7+NR4O5/LswRpm0o06fW
   XH0P1iuoFsHTsyzBrippezvAefj6IVtsVIJejuH/NECfFp2SP6NJqOKD0
   7b0rqja14G55FjdJWCn9SBzt4BsdX3qm9DYrKI66kFQ6Z6YKfpR4pUCeS
   vJkJGolBLt7lB/s3HL4FP+2Rx5en3UyTzcoyVUfRrO0xUjk09PK2Gc8yv
   w==;
X-CSE-ConnectionGUID: 2Uo20OFFShizDczTNGvnVA==
X-CSE-MsgGUID: tU9hXrCOSjuuBpS+N1rsMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71375301"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="71375301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 03:02:57 -0700
X-CSE-ConnectionGUID: glrmRP4CT7a2gajrAV89QA==
X-CSE-MsgGUID: ifq5+As+TzmnLwZszDl6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129956768"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Apr 2025 03:02:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3XhO-000Bhs-0m;
	Sat, 12 Apr 2025 10:02:54 +0000
Date: Sat, 12 Apr 2025 18:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS WITH WARNING
 e9bde6230972ad76fc91279850edd8dbc6f1cb4d
Message-ID: <202504121832.zFWOV037-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: e9bde6230972ad76fc91279850edd8dbc6f1cb4d  leds: lp8860: Disable GPIO with devm action

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202504111959.7WtsLney-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202504112024.AFtTNUuX-lkp@intel.com

    drivers/leds/leds-lp8860.c:102: warning: Excess struct member 'enable_gpio' description in 'lp8860_led'
    drivers/leds/leds-lp8860.c:102: warning: Excess struct member 'regulator' description in 'lp8860_led'
    drivers/leds/leds-lp8860.c:103: warning: Excess struct member 'regulator' description in 'lp8860_led'

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- alpha-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- arc-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- arc-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- arm-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- arm-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- arm-randconfig-002-20250411
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- arm64-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- hexagon-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- hexagon-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- i386-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- i386-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- loongarch-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- loongarch-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- loongarch-randconfig-002-20250411
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- m68k-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- m68k-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- microblaze-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- microblaze-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- mips-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- mips-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- openrisc-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- parisc-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- parisc-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- parisc-randconfig-002-20250411
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- powerpc-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- powerpc-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- powerpc64-randconfig-003-20250411
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- riscv-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- riscv-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- riscv-randconfig-002-20250412
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- s390-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- s390-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- sh-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- sh-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- sparc-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- um-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- um-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- x86_64-allmodconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
|-- x86_64-allyesconfig
|   |-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-enable_gpio-description-in-lp8860_led
|   `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led
`-- x86_64-buildonly-randconfig-006-20250411
    `-- drivers-leds-leds-lp8860.c:warning:Excess-struct-member-regulator-description-in-lp8860_led

elapsed time: 1446m

configs tested: 108
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250411    gcc-14.2.0
arc                   randconfig-002-20250411    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250411    clang-21
arm                   randconfig-002-20250411    clang-21
arm                   randconfig-003-20250411    gcc-6.5.0
arm                   randconfig-004-20250411    gcc-6.5.0
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250411    gcc-9.5.0
arm64                 randconfig-002-20250411    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250411    gcc-14.2.0
csky                  randconfig-002-20250411    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250411    clang-21
hexagon               randconfig-002-20250411    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250411    gcc-12
i386        buildonly-randconfig-002-20250411    gcc-12
i386        buildonly-randconfig-003-20250411    gcc-12
i386        buildonly-randconfig-004-20250411    clang-20
i386        buildonly-randconfig-005-20250411    gcc-11
i386        buildonly-randconfig-006-20250411    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250411    gcc-14.2.0
loongarch             randconfig-002-20250411    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250411    gcc-9.3.0
nios2                 randconfig-002-20250411    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250411    gcc-14.2.0
parisc                randconfig-002-20250411    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250411    gcc-9.3.0
powerpc               randconfig-002-20250411    clang-21
powerpc               randconfig-003-20250411    clang-21
powerpc                     tqm8548_defconfig    clang-21
powerpc64             randconfig-001-20250411    gcc-5.5.0
powerpc64             randconfig-002-20250411    gcc-5.5.0
powerpc64             randconfig-003-20250411    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-002-20250412    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250412    clang-18
s390                  randconfig-002-20250412    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250412    gcc-14.2.0
sh                    randconfig-002-20250412    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc64               randconfig-002-20250412    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250411    gcc-11
x86_64      buildonly-randconfig-002-20250411    gcc-11
x86_64      buildonly-randconfig-003-20250411    clang-20
x86_64      buildonly-randconfig-004-20250411    gcc-12
x86_64      buildonly-randconfig-005-20250411    clang-20
x86_64      buildonly-randconfig-006-20250411    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

