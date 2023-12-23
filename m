Return-Path: <linux-leds+bounces-485-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9A81D417
	for <lists+linux-leds@lfdr.de>; Sat, 23 Dec 2023 13:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A815B2196B
	for <lists+linux-leds@lfdr.de>; Sat, 23 Dec 2023 12:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A302FD293;
	Sat, 23 Dec 2023 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8N0YKAJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA3D264
	for <linux-leds@vger.kernel.org>; Sat, 23 Dec 2023 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703336100; x=1734872100;
  h=date:from:to:cc:subject:message-id;
  bh=vY6wt2Pgxpo1OokxIQLHMcip+wmcEyBHhq7xCyM9hwA=;
  b=m8N0YKAJbTjl3wYjjeoDQxpRNqolbDwjuX47lttXYf9ZKaryWX98OEb1
   2eCFkzRb1PmIl07I7msjl1PHTbIhuj4z/6yhQDtkRfvf/V7AuPOjxmpX2
   q1lJm+M2RRfqDiYWj7ccPLGw6MlGHQ/QwqKrd4Mcl19K4h4dc72JuhC6n
   EuW1T85fF61mux7qffmokP0bBmhuJ3/vvpMPP9Kahhng0d5VvEPyN8IeI
   ZosIGr565pykM4n2nZI7UYVbix9i/JbwF9k6OJqO5Mr/9M1tS1nbGD2nA
   a5gSuVUb8E6e+EbgFhsQdt78ws9ZVpCSsGOtnHmlcL1N6WiG1wqz9WrIk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="462633138"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600"; 
   d="scan'208";a="462633138"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 04:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="727122752"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600"; 
   d="scan'208";a="727122752"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Dec 2023 04:54:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rH1Wq-000B2S-06;
	Sat, 23 Dec 2023 12:54:56 +0000
Date: Sat, 23 Dec 2023 20:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 4289e434c46c8cbd32cf8b67fa7689b3d2ca4361
Message-ID: <202312232054.Y6pyLrQ2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 4289e434c46c8cbd32cf8b67fa7689b3d2ca4361  leds: trigger: netdev: Add core support for hw not supporting fallback to LED sw control

elapsed time: 2661m

configs tested: 90
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231223   gcc  
arc                   randconfig-002-20231223   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231223   clang
arm                   randconfig-002-20231223   clang
arm                   randconfig-003-20231223   clang
arm                   randconfig-004-20231223   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231223   clang
arm64                 randconfig-002-20231223   clang
arm64                 randconfig-003-20231223   clang
arm64                 randconfig-004-20231223   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231223   gcc  
csky                  randconfig-002-20231223   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231223   clang
hexagon               randconfig-002-20231223   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231223   clang
i386         buildonly-randconfig-002-20231223   clang
i386         buildonly-randconfig-003-20231223   clang
i386         buildonly-randconfig-004-20231223   clang
i386         buildonly-randconfig-005-20231223   clang
i386         buildonly-randconfig-006-20231223   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231223   clang
i386                  randconfig-002-20231223   clang
i386                  randconfig-003-20231223   clang
i386                  randconfig-004-20231223   clang
i386                  randconfig-005-20231223   clang
i386                  randconfig-006-20231223   clang
i386                  randconfig-011-20231223   gcc  
i386                  randconfig-012-20231223   gcc  
i386                  randconfig-013-20231223   gcc  
i386                  randconfig-014-20231223   gcc  
i386                  randconfig-015-20231223   gcc  
i386                  randconfig-016-20231223   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch             randconfig-001-20231223   gcc  
loongarch             randconfig-002-20231223   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
nios2                 randconfig-001-20231223   gcc  
nios2                 randconfig-002-20231223   gcc  
parisc                randconfig-001-20231223   gcc  
parisc                randconfig-002-20231223   gcc  
powerpc               randconfig-001-20231223   clang
powerpc               randconfig-002-20231223   clang
powerpc               randconfig-003-20231223   clang
powerpc64             randconfig-001-20231223   clang
powerpc64             randconfig-002-20231223   clang
powerpc64             randconfig-003-20231223   clang
riscv                 randconfig-001-20231223   clang
riscv                 randconfig-002-20231223   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231223   gcc  
s390                  randconfig-002-20231223   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20231223   gcc  
sh                    randconfig-002-20231223   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231223   gcc  
sparc64               randconfig-002-20231223   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231223   clang
um                    randconfig-002-20231223   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231223   gcc  
xtensa                randconfig-002-20231223   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

