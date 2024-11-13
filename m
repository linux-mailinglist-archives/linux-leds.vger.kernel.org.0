Return-Path: <linux-leds+bounces-3402-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B822A9C67F2
	for <lists+linux-leds@lfdr.de>; Wed, 13 Nov 2024 04:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49AB81F2382D
	for <lists+linux-leds@lfdr.de>; Wed, 13 Nov 2024 03:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E240157A41;
	Wed, 13 Nov 2024 03:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXZaXtb9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0692AD16
	for <linux-leds@vger.kernel.org>; Wed, 13 Nov 2024 03:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731470369; cv=none; b=NTZLMaDiyOrrXlnVks3z+Q2DxDSR9VyVuiYxkLI/qnpOH+4S6xTUPQ/RDSdmQ5pPSdKoQfjicQszVR5quApFj9LzKhLVS6u6TNTqjM5Z748SWRik4J38SBM9LqbQYxYdoSV+b9guO25Luzfa+SIRjJXdnJmNZ0NwXa2LCrOSGek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731470369; c=relaxed/simple;
	bh=sXaOPHiV01aBAOCJUIfRVNTkOKA78UuwgxlHIZGtYBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jUATstPpgAuTtyfj6vWYGONMn0BWnPI8I7vm9ovlgkJAyTJJsiOKPoZgKXqmW8Jrxyh9RGG6naqRvF3HIUejAnIwrP28CORvdb5UB5GylWmBkyrxD1+6kQRwif+t25tBDu6td+EexbAtAFiONUKDaGmJdPnSTxrga3ycgcSLzxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXZaXtb9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731470368; x=1763006368;
  h=date:from:to:cc:subject:message-id;
  bh=sXaOPHiV01aBAOCJUIfRVNTkOKA78UuwgxlHIZGtYBM=;
  b=nXZaXtb9Z2YNwDdM2z3LpdtqiM2QcCzL5Vg5K8NM84LwnaoWKuqZROy4
   ayBSyi1IGUb2TkXVztjq7ty5AePlpo0ePrIxl+RotGYvh6Bp3MO+tRpVg
   p0qpArrEouhTTHqo9mXlntmV4vRDZ/X45s5n3gkHj4Q7egGmRJ7uz7pp9
   tuyHjebND6Q1WXvH4XbNhX7kMFtJmJ10v7npmscGG9kM8upUS0+J2ZFa6
   5Ik7TAUqEhPoxv+0lqPo4spCZXb7hbLCsoDWGiB1yp5J0hjVX+SKSCw1Q
   rYEXV1b2XfqETV9u2nHy3CeRB0lTAwPHhyuNvHVuyqtsuO2rw3HQ7LeBR
   w==;
X-CSE-ConnectionGUID: ER18XDF5QcWCGgaKGqlPxw==
X-CSE-MsgGUID: EAkgXN0JQSGmVMpLpcMxCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31309126"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31309126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:59:19 -0800
X-CSE-ConnectionGUID: v5XKCxZZQxqRUSE3WyYQHQ==
X-CSE-MsgGUID: elQVMBlUQ+mwFadCRXoa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87309289"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2024 19:59:15 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB4XB-00002t-19;
	Wed, 13 Nov 2024 03:59:13 +0000
Date: Wed, 13 Nov 2024 11:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 e8501858035b1f95468da525e7357c8c33811b88
Message-ID: <202411131121.SxiZCx4K-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: e8501858035b1f95468da525e7357c8c33811b88  leds: ss4200: Fix the wrong format specifier for 'blinking'

elapsed time: 727m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                       allnoconfig    gcc-14.2.0
alpha                      allyesconfig    clang-20
alpha                         defconfig    gcc-14.2.0
arc                        allmodconfig    clang-20
arc                        allmodconfig    gcc-13.2.0
arc                         allnoconfig    gcc-14.2.0
arc                        allyesconfig    clang-20
arc                        allyesconfig    gcc-13.2.0
arc                           defconfig    gcc-14.2.0
arm                        allmodconfig    clang-20
arm                        allmodconfig    gcc-14.2.0
arm                         allnoconfig    gcc-14.2.0
arm                        allyesconfig    clang-20
arm                        allyesconfig    gcc-14.2.0
arm                   at91_dt_defconfig    clang-20
arm                           defconfig    gcc-14.2.0
arm                integrator_defconfig    clang-20
arm                 netwinder_defconfig    clang-20
arm                      qcom_defconfig    clang-20
arm64                      allmodconfig    clang-20
arm64                       allnoconfig    gcc-14.2.0
arm64                         defconfig    clang-20
arm64                         defconfig    gcc-14.2.0
csky                        allnoconfig    gcc-14.2.0
csky                          defconfig    gcc-14.2.0
hexagon                    allmodconfig    clang-20
hexagon                     allnoconfig    gcc-14.2.0
hexagon                    allyesconfig    clang-20
hexagon                       defconfig    gcc-14.2.0
i386                       allmodconfig    clang-19
i386                        allnoconfig    clang-19
i386                       allyesconfig    clang-19
i386                          defconfig    clang-19
loongarch                  allmodconfig    gcc-14.2.0
loongarch                   allnoconfig    gcc-14.2.0
loongarch                     defconfig    gcc-14.2.0
m68k                       allmodconfig    gcc-14.2.0
m68k                        allnoconfig    gcc-14.2.0
m68k                       allyesconfig    gcc-14.2.0
m68k                          defconfig    gcc-14.2.0
m68k                 m5475evb_defconfig    clang-20
microblaze                 allmodconfig    gcc-14.2.0
microblaze                  allnoconfig    gcc-14.2.0
microblaze                 allyesconfig    gcc-14.2.0
microblaze                    defconfig    gcc-14.2.0
mips                        allnoconfig    gcc-14.2.0
mips                     xway_defconfig    clang-20
nios2                       allnoconfig    gcc-14.2.0
nios2                         defconfig    gcc-14.2.0
openrisc                    allnoconfig    clang-20
openrisc                   allyesconfig    gcc-14.2.0
openrisc                      defconfig    gcc-12
parisc                     allmodconfig    gcc-14.2.0
parisc                      allnoconfig    clang-20
parisc                     allyesconfig    gcc-14.2.0
parisc                        defconfig    gcc-12
parisc64                      defconfig    gcc-14.2.0
powerpc              adder875_defconfig    clang-20
powerpc                    allmodconfig    gcc-14.2.0
powerpc                     allnoconfig    clang-20
powerpc                    allyesconfig    gcc-14.2.0
powerpc                  cell_defconfig    clang-20
powerpc               mpc5200_defconfig    clang-20
powerpc           mpc836x_rdk_defconfig    clang-20
powerpc            mpc866_ads_defconfig    clang-20
powerpc                pcm030_defconfig    clang-20
riscv                      allmodconfig    gcc-14.2.0
riscv                       allnoconfig    clang-20
riscv                      allyesconfig    gcc-14.2.0
riscv                         defconfig    gcc-12
s390                       allmodconfig    clang-20
s390                       allmodconfig    gcc-14.2.0
s390                        allnoconfig    clang-20
s390                       allyesconfig    gcc-14.2.0
s390                          defconfig    gcc-12
sh                         allmodconfig    gcc-14.2.0
sh                          allnoconfig    gcc-14.2.0
sh                         allyesconfig    gcc-14.2.0
sh                            defconfig    gcc-12
sh          ecovec24-romimage_defconfig    clang-20
sh             secureedge5410_defconfig    clang-20
sh             sh7724_generic_defconfig    clang-20
sh                       shx3_defconfig    clang-20
sparc                      allmodconfig    gcc-14.2.0
sparc64                       defconfig    gcc-12
um                         allmodconfig    clang-20
um                          allnoconfig    clang-20
um                         allyesconfig    clang-20
um                            defconfig    gcc-12
um                       i386_defconfig    gcc-12
um                     x86_64_defconfig    gcc-12
x86_64                      allnoconfig    clang-19
x86_64                     allyesconfig    clang-19
x86_64                        defconfig    clang-19
x86_64                            kexec    clang-19
x86_64                            kexec    gcc-12
x86_64                         rhel-8.3    gcc-12
xtensa                      allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

