Return-Path: <linux-leds+bounces-4496-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A464A9134E
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 07:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A0D57AC0DB
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 05:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE971A5BB3;
	Thu, 17 Apr 2025 05:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMij2JAd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909082DFA4B
	for <linux-leds@vger.kernel.org>; Thu, 17 Apr 2025 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744869129; cv=none; b=aUYvWqRPRzm4oe3dk3tDPffv8K6dA482qdcCBlat0u3oAgNGHDrLU7ZYIE5Lso2fr/v2AIzu/tbf876sDXtrWOJr0SNeG2dYzXv6DwHIiyFhhqNQwjpIpTdw4IpxhRQ0XjBvXnKOa7XRFu3gkwYhJuhcssl+7ByzCZsJ6/ew07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744869129; c=relaxed/simple;
	bh=FNsjg02jk+va/EYi8tz9FE5FuarXIWuWCn3wC5Mej4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ch1LLVeujcmGnkK4xGMqfhnkNIq8yo2uHvZuGwUzBNa9igL012DbRgNeewpC57z0T+LYcgv+HD7enIO2wnXGeK7T4rDPn6o4ruSsee1BTGThWmi1+CZupvBCVUtyWhrj1N0qcBC6koeSoeN52kvKKQWO7MGrGtUDKiU/9lUr61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMij2JAd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744869127; x=1776405127;
  h=date:from:to:cc:subject:message-id;
  bh=FNsjg02jk+va/EYi8tz9FE5FuarXIWuWCn3wC5Mej4c=;
  b=OMij2JAdKGDJtufsT8RONBoKBEXm1uqkYy/FupigMsw7ewpwfu72FQ9N
   U1mamJ1evWyuHZA2T9rE8VIj4cnXRhvUDzH+bacUSPKtP7mfMnTy9AikU
   0KhFlKOrmGCuLpTGI0EQ6N3jtGE9Knk027wBdjCYpARan+/M7rH0Dxhua
   leM0P/PBzs6xOngJopINmlMSFY4qDpHU2O6x2jgkakstrCQP5Vww+O9+W
   yOfqhqT+arVng1Bza032kvYx2hRo9m8y+20+26wEEW2bFyMB4AyU+udko
   Lz6/cGFX7du2GvQe5IqGclP5w4xG4YsiAZn3hLLmLpYcawiPj3cUXX5OQ
   Q==;
X-CSE-ConnectionGUID: V6BvfVd7T2iCeg6cJlnp4w==
X-CSE-MsgGUID: cSfGbkbXSiS1gasOAGFGoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56623147"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="56623147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 22:52:06 -0700
X-CSE-ConnectionGUID: sDeTu7DgToSDMgy3B36fjg==
X-CSE-MsgGUID: E+PHm9WRSOi1I7n83UgXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="161651145"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2025 22:52:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5IAM-000LT2-2K;
	Thu, 17 Apr 2025 05:52:02 +0000
Date: Thu, 17 Apr 2025 13:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:ib-leds-base-usb-6.16] BUILD SUCCESS
 08ca89e98620c08d68b7e7aed6c9294698e214e1
Message-ID: <202504171317.4veUWmfn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git ib-leds-base-usb-6.16
branch HEAD: 08ca89e98620c08d68b7e7aed6c9294698e214e1  usb: typec: tcpm: Use fwnode_get_child_node_count()

elapsed time: 1470m

configs tested: 125
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250416    gcc-12.4.0
arc                   randconfig-002-20250416    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-21
arm                          collie_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                          gemini_defconfig    clang-20
arm                       imx_v4_v5_defconfig    clang-21
arm                          moxart_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250416    clang-17
arm                   randconfig-002-20250416    gcc-7.5.0
arm                   randconfig-003-20250416    clang-21
arm                   randconfig-004-20250416    clang-19
arm                           sama7_defconfig    clang-21
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250416    gcc-8.5.0
arm64                 randconfig-002-20250416    clang-21
arm64                 randconfig-003-20250416    gcc-6.5.0
arm64                 randconfig-004-20250416    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250416    clang-21
hexagon               randconfig-002-20250416    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250416    gcc-12
i386        buildonly-randconfig-003-20250416    gcc-12
i386        buildonly-randconfig-004-20250416    gcc-11
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250416    gcc-6.5.0
nios2                 randconfig-002-20250416    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250416    gcc-11.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 canyonlands_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250416    gcc-8.5.0
powerpc               randconfig-002-20250416    clang-21
powerpc               randconfig-003-20250416    clang-21
powerpc64             randconfig-001-20250416    clang-21
powerpc64             randconfig-002-20250416    clang-21
powerpc64             randconfig-003-20250416    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250416    clang-20
riscv                 randconfig-002-20250416    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250416    clang-21
s390                  randconfig-002-20250416    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250416    gcc-6.5.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250416    gcc-11.5.0
sparc                 randconfig-002-20250416    gcc-11.5.0
sparc64               randconfig-001-20250416    gcc-5.5.0
sparc64               randconfig-002-20250416    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250416    clang-21
um                    randconfig-002-20250416    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250416    gcc-12
x86_64      buildonly-randconfig-002-20250416    gcc-12
x86_64      buildonly-randconfig-003-20250416    gcc-12
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250416    gcc-7.5.0
xtensa                randconfig-002-20250416    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

