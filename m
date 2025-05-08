Return-Path: <linux-leds+bounces-4599-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 184DFAAF23B
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 06:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2760C1B66FDB
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 04:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87C119D080;
	Thu,  8 May 2025 04:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPP+QrXN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9C020299E
	for <linux-leds@vger.kernel.org>; Thu,  8 May 2025 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680095; cv=none; b=BXqeluLJgdjQyF/T4owJPbG7YeAA11Q6YAXFH5MQkoHQotCvjamJ7lK2o0YRgVcrwTCnJpkmV4k16as2VQPOQhA5tD2raj2zhiZuT89Ub4XXfS4YKY+eIYjgzH8z1o9kGKdyY1LEHC5NVhdQVVafF0a31DVMXi9Fakat/J21aSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680095; c=relaxed/simple;
	bh=CKiSuTII2KDpHli6UnyhDsYDtwVfbsHvSdwFstg55Ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfKn2B/KYMSGHGvqpTvwwXfRRuYFIM9Lg9TD/Yq/ZJ4MIPv3/uweI5JhxCGewSUfB/LvWSlrHJlOr6ZsALRJYCotmab5IctRyle8psJEw4zPHHJPeS7HNsc/sAfpkfCmK8ADOI/De5Cm9qx1WZuhNxFwZMQV8scjfjnzKaNPaps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPP+QrXN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746680094; x=1778216094;
  h=date:from:to:cc:subject:message-id;
  bh=CKiSuTII2KDpHli6UnyhDsYDtwVfbsHvSdwFstg55Ok=;
  b=EPP+QrXNN9E22iQhf57+tyD2saIMz4oAhb+pYL8t/8yYEct5Fy2u2Te+
   Oi8gBKKWFPf9s+SGpc5nCirvmzjkh+rAvUqBBATKob45b02nIvfKEJdEh
   aWNUyEL7434D3d8JbuaNg7AN23CVbWEK/IVzjDX4UGgSjUdPXJo/6rCqy
   egGWpHDLIGZKdnTr/OrEEIXVbJAGoBhNzS+XkFBK/lFEmAdMv8QKq3nsn
   +W0J/F93VClLjqrudCp99pzw49SXOrH2EBDWesR2wdIQp0afFuMuslkt5
   nALMigdMUFh9KJnxYCi+NVlfGkZk22Yi1Qm5fHdcfw4ITY3CqOvsaKYw3
   g==;
X-CSE-ConnectionGUID: fZ22qTPRQOK7AHyXwxhlbw==
X-CSE-MsgGUID: a2VmXmqbSeaiGD3uh3i58A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48551908"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48551908"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:54:53 -0700
X-CSE-ConnectionGUID: ajroFku4SZ2yGyu3/FnR+g==
X-CSE-MsgGUID: ahz7M74BRSSMNOZlDud9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136109511"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 21:54:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtHV-000AB2-1R;
	Thu, 08 May 2025 04:54:49 +0000
Date: Thu, 08 May 2025 12:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 9062209d453b9755f7bc09724167f21c3c64bb62
Message-ID: <202505081234.uhhsrM46-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 9062209d453b9755f7bc09724167f21c3c64bb62  leds: pca995x: Fix typo in pca995x_of_match's of_device_id entry

elapsed time: 8476m

configs tested: 263
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250502    gcc-14.2.0
arc                   randconfig-002-20250502    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                          pxa910_defconfig    clang-21
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-002-20250502    gcc-7.5.0
arm                   randconfig-003-20250502    gcc-7.5.0
arm                   randconfig-004-20250502    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    clang-21
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250502    clang-21
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-004-20250502    gcc-6.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-12.4.0
csky                  randconfig-001-20250503    gcc-8.5.0
csky                  randconfig-002-20250502    gcc-10.5.0
csky                  randconfig-002-20250503    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250502    clang-21
hexagon               randconfig-001-20250503    gcc-8.5.0
hexagon               randconfig-002-20250502    clang-21
hexagon               randconfig-002-20250503    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    clang-20
i386        buildonly-randconfig-001-20250506    gcc-12
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    clang-20
i386        buildonly-randconfig-002-20250506    gcc-12
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    clang-20
i386        buildonly-randconfig-003-20250506    gcc-12
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250502    gcc-12
i386        buildonly-randconfig-005-20250503    clang-20
i386        buildonly-randconfig-005-20250506    gcc-12
i386        buildonly-randconfig-006-20250502    gcc-12
i386        buildonly-randconfig-006-20250503    clang-20
i386        buildonly-randconfig-006-20250506    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250503    clang-20
i386                  randconfig-001-20250506    gcc-12
i386                  randconfig-002-20250503    clang-20
i386                  randconfig-002-20250506    gcc-12
i386                  randconfig-003-20250503    clang-20
i386                  randconfig-003-20250506    gcc-12
i386                  randconfig-004-20250503    clang-20
i386                  randconfig-004-20250506    gcc-12
i386                  randconfig-005-20250503    clang-20
i386                  randconfig-005-20250506    gcc-12
i386                  randconfig-006-20250503    clang-20
i386                  randconfig-006-20250506    gcc-12
i386                  randconfig-007-20250503    clang-20
i386                  randconfig-007-20250506    gcc-12
i386                  randconfig-011-20250503    clang-20
i386                  randconfig-011-20250506    gcc-12
i386                  randconfig-012-20250503    clang-20
i386                  randconfig-012-20250506    gcc-12
i386                  randconfig-013-20250503    clang-20
i386                  randconfig-013-20250506    gcc-12
i386                  randconfig-014-20250503    clang-20
i386                  randconfig-014-20250506    gcc-12
i386                  randconfig-015-20250503    clang-20
i386                  randconfig-015-20250506    gcc-12
i386                  randconfig-016-20250503    clang-20
i386                  randconfig-016-20250506    gcc-12
i386                  randconfig-017-20250503    clang-20
i386                  randconfig-017-20250506    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-14.2.0
loongarch             randconfig-001-20250503    gcc-8.5.0
loongarch             randconfig-002-20250502    gcc-14.2.0
loongarch             randconfig-002-20250503    gcc-8.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    clang-21
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                      maltaaprp_defconfig    clang-21
mips                         rt305x_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250502    gcc-14.2.0
nios2                 randconfig-001-20250503    gcc-8.5.0
nios2                 randconfig-002-20250502    gcc-6.5.0
nios2                 randconfig-002-20250503    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250502    gcc-5.5.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250502    gcc-5.5.0
parisc                randconfig-002-20250503    gcc-8.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250502    clang-21
powerpc               randconfig-001-20250503    gcc-8.5.0
powerpc               randconfig-002-20250502    clang-19
powerpc               randconfig-002-20250503    gcc-8.5.0
powerpc               randconfig-003-20250502    clang-21
powerpc               randconfig-003-20250503    gcc-8.5.0
powerpc                    socrates_defconfig    clang-21
powerpc64             randconfig-001-20250502    clang-21
powerpc64             randconfig-001-20250503    gcc-8.5.0
powerpc64             randconfig-002-20250502    clang-17
powerpc64             randconfig-002-20250503    gcc-8.5.0
powerpc64             randconfig-003-20250502    clang-21
powerpc64             randconfig-003-20250503    gcc-8.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250502    clang-19
riscv                 randconfig-001-20250503    gcc-10.5.0
riscv                 randconfig-002-20250502    gcc-14.2.0
riscv                 randconfig-002-20250503    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250502    clang-21
s390                  randconfig-001-20250503    gcc-10.5.0
s390                  randconfig-002-20250502    clang-21
s390                  randconfig-002-20250503    gcc-10.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-21
sh                    randconfig-001-20250502    gcc-14.2.0
sh                    randconfig-001-20250503    gcc-10.5.0
sh                    randconfig-002-20250502    gcc-14.2.0
sh                    randconfig-002-20250503    gcc-10.5.0
sh                          rsk7269_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250502    gcc-10.3.0
sparc                 randconfig-001-20250503    gcc-10.5.0
sparc                 randconfig-002-20250502    gcc-11.5.0
sparc                 randconfig-002-20250503    gcc-10.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250502    gcc-5.5.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250502    gcc-5.5.0
sparc64               randconfig-002-20250503    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250502    clang-21
um                    randconfig-001-20250503    gcc-10.5.0
um                    randconfig-002-20250502    gcc-11
um                    randconfig-002-20250503    gcc-10.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250502    gcc-12
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250502    gcc-12
x86_64      buildonly-randconfig-005-20250503    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250503    clang-20
x86_64                randconfig-002-20250503    clang-20
x86_64                randconfig-003-20250503    clang-20
x86_64                randconfig-004-20250503    clang-20
x86_64                randconfig-005-20250503    clang-20
x86_64                randconfig-006-20250503    clang-20
x86_64                randconfig-007-20250503    clang-20
x86_64                randconfig-008-20250503    clang-20
x86_64                randconfig-071-20250503    clang-20
x86_64                randconfig-071-20250506    clang-20
x86_64                randconfig-072-20250503    clang-20
x86_64                randconfig-072-20250506    clang-20
x86_64                randconfig-073-20250503    clang-20
x86_64                randconfig-073-20250506    clang-20
x86_64                randconfig-074-20250503    clang-20
x86_64                randconfig-074-20250506    clang-20
x86_64                randconfig-075-20250503    clang-20
x86_64                randconfig-075-20250506    clang-20
x86_64                randconfig-076-20250503    clang-20
x86_64                randconfig-076-20250506    clang-20
x86_64                randconfig-077-20250503    clang-20
x86_64                randconfig-077-20250506    clang-20
x86_64                randconfig-078-20250503    clang-20
x86_64                randconfig-078-20250506    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250502    gcc-11.5.0
xtensa                randconfig-002-20250503    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

