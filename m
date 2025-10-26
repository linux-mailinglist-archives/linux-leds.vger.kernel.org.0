Return-Path: <linux-leds+bounces-5877-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D33AC0A155
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 02:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D1164E05B5
	for <lists+linux-leds@lfdr.de>; Sun, 26 Oct 2025 00:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597A121B9D2;
	Sun, 26 Oct 2025 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8ChoaYI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE201C54A9
	for <linux-leds@vger.kernel.org>; Sun, 26 Oct 2025 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761439970; cv=none; b=bIif044I7kVU8B5ic5v9/OiY9iGrCMijGoKG0rhydFNy82Q9yShmKcu+f1vkLRENc05hfA1XcL2bxBx99mP1y8IlcbYWAIrFvTp0H30p8P78bBrUFrJsPckEHPmSvYXxW6whhQ7W2AqTWQ2FOeP0GsAVrWyUVKjpUmoOEAfyRag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761439970; c=relaxed/simple;
	bh=e+QRRPFHGX9NxawtDLLDHahNaiV0SY+GDdJWJsZ13u4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GG+LBvlpJ9rJPa4CnGjvpZ1fml5SIMj3mHROdxHcz2GoU+pzSY/IQQC2aiDOpCwmiJKuPxgLHXEC+M31w5MWS2sZ1be4qIO6/lT6YXKLl2Re2j3toGmiGlLkQA8uEpwc3ItwoIBDZrRn4Epe0CB3euYwzcrzTqfoAVKepWV5RGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8ChoaYI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761439968; x=1792975968;
  h=date:from:to:cc:subject:message-id;
  bh=e+QRRPFHGX9NxawtDLLDHahNaiV0SY+GDdJWJsZ13u4=;
  b=j8ChoaYITPeaHWFOGYw+LrvCgyHlVXvDn395TN25SuoAIAFmXeHpgsil
   UsxrDPF3NkddSHolNReeel6fXNoc+bdaqH8h4glBQgcjRDKYL6OfsrAjE
   MvTcFf5wayCZFYsP2vr4RBJksl4i4wNwUexLw7pT/ih+52e/9bi0xQKX7
   Sd8piLHVXeKK7PPpEQwbsLm3CAbaNmqu6qxKKh1BGD1hmNBfma5O56kEW
   m9qzIiUEfI3m8TI6Rnx0h03JfQZFCQ+f3a+VGsDqkLXgduFWEK9S6ybEK
   cyQpqsO56DlEH1uBwMZvlN6fBeDv9G3lqnwHwOgrJnspesocJ083bquXT
   Q==;
X-CSE-ConnectionGUID: dxUxkU2MQy2Di0PMwsy4QA==
X-CSE-MsgGUID: JV9SOV1pQhCULCT5GgCZgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62776381"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="62776381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 17:52:47 -0700
X-CSE-ConnectionGUID: jL4baM8gTha5OAjsyAXUzg==
X-CSE-MsgGUID: To8+DarbRgGcvCM5YnvO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185489378"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2025 17:52:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCozu-000FkL-1B;
	Sun, 26 Oct 2025 00:52:41 +0000
Date: Sun, 26 Oct 2025 08:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 c06a017439110debd335b6864bc2d69835624235
Message-ID: <202510260807.Jz4gRHxW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: c06a017439110debd335b6864bc2d69835624235  leds: upboard: Fix module alias

elapsed time: 724m

configs tested: 133
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251025    gcc-10.5.0
arc                   randconfig-002-20251025    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          ep93xx_defconfig    clang-22
arm                   randconfig-001-20251025    clang-22
arm                   randconfig-002-20251025    gcc-10.5.0
arm                   randconfig-003-20251025    clang-22
arm                   randconfig-004-20251025    clang-22
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251025    gcc-14.3.0
arm64                 randconfig-002-20251025    gcc-11.5.0
arm64                 randconfig-003-20251025    gcc-9.5.0
arm64                 randconfig-004-20251025    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251025    gcc-11.5.0
csky                  randconfig-002-20251025    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251025    clang-18
hexagon               randconfig-002-20251025    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251025    gcc-14
i386        buildonly-randconfig-002-20251025    gcc-14
i386        buildonly-randconfig-003-20251025    clang-20
i386        buildonly-randconfig-004-20251025    clang-20
i386        buildonly-randconfig-005-20251025    clang-20
i386        buildonly-randconfig-006-20251025    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251025    clang-22
loongarch             randconfig-002-20251025    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251025    gcc-11.5.0
nios2                 randconfig-002-20251025    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251025    gcc-14.3.0
parisc                randconfig-002-20251025    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251025    gcc-11.5.0
powerpc               randconfig-002-20251025    clang-16
powerpc               randconfig-003-20251025    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251025    clang-17
powerpc64             randconfig-002-20251025    clang-16
powerpc64             randconfig-003-20251025    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251025    clang-22
riscv                 randconfig-002-20251025    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251025    gcc-11.5.0
s390                  randconfig-002-20251025    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251025    gcc-11.5.0
sh                    randconfig-002-20251025    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251025    gcc-11.5.0
sparc                 randconfig-002-20251025    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251025    clang-22
sparc64               randconfig-002-20251025    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251025    clang-22
um                    randconfig-002-20251025    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251025    gcc-14
x86_64      buildonly-randconfig-002-20251025    gcc-14
x86_64      buildonly-randconfig-003-20251025    gcc-14
x86_64      buildonly-randconfig-004-20251025    clang-20
x86_64      buildonly-randconfig-005-20251025    clang-20
x86_64      buildonly-randconfig-006-20251025    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251025    gcc-15.1.0
xtensa                randconfig-002-20251025    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

