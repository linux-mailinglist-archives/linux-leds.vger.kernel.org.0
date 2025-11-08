Return-Path: <linux-leds+bounces-6044-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BFC42FE1
	for <lists+linux-leds@lfdr.de>; Sat, 08 Nov 2025 17:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 342C44E1DE8
	for <lists+linux-leds@lfdr.de>; Sat,  8 Nov 2025 16:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F28A18DB26;
	Sat,  8 Nov 2025 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7QvszRh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456134D386
	for <linux-leds@vger.kernel.org>; Sat,  8 Nov 2025 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762619300; cv=none; b=p/zZAyIrpzGeho3NazdOxwo/bpobkWY5THB5Ck9KRHuBa+51nQnSIgpK5CG1dtEpOF1MxGIE1+toNcB6Ol7CarOfhd7jLqLm2AcoNxomLlgFqXPvfLwWeVM8IfaYYiATX7XEPFO5JSgww/YYw3Rm5KWamdDmZFyLO6PC46on9vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762619300; c=relaxed/simple;
	bh=ybhJHcyqYvpHDxuUlc7gPLZgwqMCVW+tw7JVhH/rK9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ggp7myRyS2Nqm2vetfhb9xEesvJ7gMlOrVBx9YznyAXaIZ+5jYULqqQsGrJP7KxcxM9u86wov/eiN1c4nXHUzU3wKPr11/sRWUZkXuQwUkAfKlcc2xaKQI7kETclDbBgrz7yMJIqp1rLy+OPI4Rd3cJrzUiaRWjeSGF20IxrvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7QvszRh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762619299; x=1794155299;
  h=date:from:to:cc:subject:message-id;
  bh=ybhJHcyqYvpHDxuUlc7gPLZgwqMCVW+tw7JVhH/rK9s=;
  b=k7QvszRh/1y0w/BrgGhDXw6nXU2Gu9r3Wkj0ahZN7Y9AmgXZTkmxIfR6
   NTe7T9Ju0tL0v0P3qaGWl17efIkxw8Z7Q8NsF8sM5gOGiMY6S+n/eQh8/
   qeIZ6sR8iSljHjU+MzNb8g0Q+V+0TT6Iu8ncNoL1ePf7c8sdYJHi52Jzd
   OiD8chE4mx0LlfpTjYS37sCVUYgDf/NcnwQvriOKbm4HWh34jLVpcezIz
   78XPl0St8uruJ/gCk/TZt/kLAIXhA8JcS0PkV+RqaQaWl3XfOthoEBZv4
   8D+C5SzrgHdGBUYVtf/d+NPG6txnlhBgFFlCzBGnwrMHHTC4sVZBuIsJr
   w==;
X-CSE-ConnectionGUID: 065uUup3RXayuWA4EbdpMw==
X-CSE-MsgGUID: 5+6WxVGGTYW3LgeUQM0dsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="75850506"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="75850506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 08:28:18 -0800
X-CSE-ConnectionGUID: zQEPee97RRC5ncEyZIHYdA==
X-CSE-MsgGUID: zGlXCIokQFiSbbjHs9JWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="193323867"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2025 08:28:16 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHlnS-0001EU-2K;
	Sat, 08 Nov 2025 16:28:14 +0000
Date: Sun, 09 Nov 2025 00:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 5246e3673eeeccb4f5bf4f42375dd495d465ac15
Message-ID: <202511090044.Yy2MnOAD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 5246e3673eeeccb4f5bf4f42375dd495d465ac15  leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs

elapsed time: 2956m

configs tested: 86
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251107    gcc-8.5.0
arc         randconfig-002-20251107    gcc-9.5.0
arm                    allmodconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm         randconfig-001-20251107    clang-17
arm         randconfig-002-20251107    gcc-13.4.0
arm         randconfig-003-20251107    clang-22
arm         randconfig-004-20251107    gcc-8.5.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64                  allyesconfig    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
hexagon     randconfig-001-20251107    clang-22
hexagon     randconfig-002-20251107    clang-22
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch              allyesconfig    clang-22
loongarch   randconfig-001-20251107    gcc-15.1.0
loongarch   randconfig-002-20251107    clang-19
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    gcc-11.5.0
nios2       randconfig-001-20251107    gcc-11.5.0
nios2       randconfig-002-20251107    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc               allyesconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251107    gcc-8.5.0
parisc      randconfig-002-20251107    gcc-12.5.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc                allyesconfig    clang-22
powerpc     randconfig-001-20251107    clang-22
powerpc     randconfig-002-20251107    clang-22
powerpc64   randconfig-001-20251107    gcc-14.3.0
powerpc64   randconfig-002-20251107    clang-22
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20251107    clang-22
riscv       randconfig-002-20251107    gcc-13.4.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251107    gcc-8.5.0
s390        randconfig-002-20251107    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251107    gcc-13.4.0
sh          randconfig-002-20251107    gcc-11.5.0
sparc                  allmodconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                  allyesconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
sparc64                allyesconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

