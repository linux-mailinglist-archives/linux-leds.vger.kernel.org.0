Return-Path: <linux-leds+bounces-6842-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGrxNpEyhGkw0wMAu9opvQ
	(envelope-from <linux-leds+bounces-6842-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Feb 2026 07:02:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54937EED86
	for <lists+linux-leds@lfdr.de>; Thu, 05 Feb 2026 07:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 233033010481
	for <lists+linux-leds@lfdr.de>; Thu,  5 Feb 2026 06:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC3828002B;
	Thu,  5 Feb 2026 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxrhQD06"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12557C9F
	for <linux-leds@vger.kernel.org>; Thu,  5 Feb 2026 06:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770271374; cv=none; b=csKz0/YWuTDXLravAj9rtQOVlSCPVXWNwH4TtgWPntf2/rX/GRE3rxrYn3iKdmt0rzaNNUUyLoYs3C1k8zhAS7B8vvTpb3hhCVofuc7MtQkumrdp2KqiX97vKNeOYgTfuqHJuNieWmPyv8Qp+M+rz2JOw8do/sq7punFb87O6/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770271374; c=relaxed/simple;
	bh=S4TpNnmiU3meiGHhuEfRynWm0D1lTHHTc4uwji1j8FE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iAZfdK5JkNkz3LfZbnh66/OKBLz0ByTK8jMdJhTKsNgLOCCU4stJd7YTzoO4NqHVZoB168rQFH+dsItVNEtxSO4InEhtCBTXlcdwrzuO9pSa9uCneXl+dK5XU8dYrGyFmaOSqb6srXceApJ2Ovwk/3SjntflX4Gd+19V8Cq8AXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxrhQD06; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770271373; x=1801807373;
  h=date:from:to:cc:subject:message-id;
  bh=S4TpNnmiU3meiGHhuEfRynWm0D1lTHHTc4uwji1j8FE=;
  b=WxrhQD06lsIgGhK/Ycm3l64kTdTR1wgVYSnfa0tbfv07gNRt0DaFrNH4
   3sU9dN9866Lu0HHNd8mI6XK296/J3HpoN76qdzw8u5BIMsd8GhQedx7d+
   r7+qFj5Ma6Xcso2O71fbk9ANkOoTE7lKBZ8vM4ESxERpPRbMWfStT5bhl
   hh603088oQBVwyNJvPTBESB9PiRlBllRvc8hSFRdUjHoaWp0pdyWe9gNP
   pGnxYKM/TL46cpZRYx4EPUX/lYXfLAMU3dyOYPdf2pvxz6Bds5sT5TD1X
   Mq4YpwzxH5hZNUCRac/hHzRKwS2TgzT2Oq6KW9Y/8dPSHjXjwijM3Q1K9
   Q==;
X-CSE-ConnectionGUID: HgsLEeDBSK28wxgJ3vsaaA==
X-CSE-MsgGUID: oiZsBoUKQKiXo4LR/aEfqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82581726"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="82581726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 22:02:53 -0800
X-CSE-ConnectionGUID: 9IHNavy5SDiIFsqB1R84IQ==
X-CSE-MsgGUID: dCQHS/r+QmuQ0ALDOCYGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="209762248"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 22:02:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnsS0-00000000jTw-3lSu;
	Thu, 05 Feb 2026 06:02:48 +0000
Date: Thu, 05 Feb 2026 14:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 b2c87f5e98cd88095dbc6802197526703d5e4e48
Message-ID: <202602051411.gY7pVeR0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6842-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 54937EED86
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: b2c87f5e98cd88095dbc6802197526703d5e4e48  dt-bindings: leds: Convert ti,lm3697 to DT schema

elapsed time: 969m

configs tested: 245
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                      axs103_smp_defconfig    clang-18
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260204    gcc-8.5.0
arc                   randconfig-001-20260205    gcc-8.5.0
arc                   randconfig-002-20260204    gcc-8.5.0
arc                   randconfig-002-20260205    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           imxrt_defconfig    gcc-15.2.0
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260204    gcc-8.5.0
arm                   randconfig-001-20260205    gcc-8.5.0
arm                   randconfig-002-20260204    gcc-8.5.0
arm                   randconfig-002-20260205    gcc-8.5.0
arm                   randconfig-003-20260204    gcc-8.5.0
arm                   randconfig-003-20260205    gcc-8.5.0
arm                   randconfig-004-20260204    gcc-8.5.0
arm                   randconfig-004-20260205    gcc-8.5.0
arm                           sunxi_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260205    gcc-10.5.0
arm64                 randconfig-002-20260205    gcc-10.5.0
arm64                 randconfig-003-20260205    gcc-10.5.0
arm64                 randconfig-004-20260205    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260205    gcc-10.5.0
csky                  randconfig-002-20260205    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260205    gcc-15.2.0
hexagon               randconfig-002-20260205    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260205    gcc-14
i386        buildonly-randconfig-002-20260205    gcc-14
i386        buildonly-randconfig-003-20260205    gcc-14
i386        buildonly-randconfig-004-20260205    gcc-14
i386        buildonly-randconfig-005-20260205    gcc-14
i386        buildonly-randconfig-006-20260205    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260204    gcc-14
i386                  randconfig-001-20260205    gcc-13
i386                  randconfig-002-20260204    gcc-14
i386                  randconfig-002-20260205    gcc-13
i386                  randconfig-003-20260204    gcc-14
i386                  randconfig-003-20260205    gcc-13
i386                  randconfig-004-20260204    gcc-14
i386                  randconfig-004-20260205    gcc-13
i386                  randconfig-005-20260204    gcc-14
i386                  randconfig-005-20260205    gcc-13
i386                  randconfig-006-20260204    gcc-14
i386                  randconfig-006-20260205    gcc-13
i386                  randconfig-007-20260204    gcc-14
i386                  randconfig-007-20260205    gcc-13
i386                  randconfig-011-20260205    clang-20
i386                  randconfig-012-20260205    clang-20
i386                  randconfig-013-20260205    clang-20
i386                  randconfig-014-20260205    clang-20
i386                  randconfig-015-20260205    clang-20
i386                  randconfig-016-20260205    clang-20
i386                  randconfig-017-20260205    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260205    gcc-15.2.0
loongarch             randconfig-002-20260205    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    clang-18
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                     loongson2k_defconfig    clang-18
mips                      loongson3_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-18
mips                         rt305x_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260205    gcc-15.2.0
nios2                 randconfig-002-20260205    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260205    gcc-9.5.0
parisc                randconfig-002-20260205    gcc-8.5.0
parisc                randconfig-002-20260205    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                 mpc834x_itx_defconfig    gcc-15.2.0
powerpc                      ppc6xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260205    gcc-15.2.0
powerpc               randconfig-001-20260205    gcc-9.5.0
powerpc               randconfig-002-20260205    clang-16
powerpc               randconfig-002-20260205    gcc-9.5.0
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc64                        alldefconfig    clang-18
powerpc64             randconfig-001-20260205    clang-22
powerpc64             randconfig-001-20260205    gcc-9.5.0
powerpc64             randconfig-002-20260205    clang-22
powerpc64             randconfig-002-20260205    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260205    clang-19
riscv                 randconfig-002-20260205    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260205    clang-19
s390                  randconfig-002-20260205    clang-19
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-18
sh                    randconfig-001-20260205    clang-19
sh                    randconfig-002-20260205    clang-19
sh                          rsk7201_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                             shx3_defconfig    clang-18
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260204    gcc-8.5.0
sparc                 randconfig-001-20260205    gcc-12.5.0
sparc                 randconfig-002-20260204    gcc-8.5.0
sparc                 randconfig-002-20260205    gcc-12.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260204    gcc-8.5.0
sparc64               randconfig-001-20260205    gcc-12.5.0
sparc64               randconfig-002-20260204    gcc-8.5.0
sparc64               randconfig-002-20260205    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-15.2.0
um                    randconfig-001-20260204    gcc-8.5.0
um                    randconfig-001-20260205    gcc-12.5.0
um                    randconfig-002-20260204    gcc-8.5.0
um                    randconfig-002-20260205    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260204    gcc-12
x86_64      buildonly-randconfig-001-20260205    gcc-14
x86_64      buildonly-randconfig-002-20260204    gcc-14
x86_64      buildonly-randconfig-002-20260205    gcc-14
x86_64      buildonly-randconfig-003-20260204    clang-20
x86_64      buildonly-randconfig-003-20260205    gcc-14
x86_64      buildonly-randconfig-004-20260204    gcc-14
x86_64      buildonly-randconfig-004-20260205    gcc-14
x86_64      buildonly-randconfig-005-20260204    clang-20
x86_64      buildonly-randconfig-005-20260205    gcc-14
x86_64      buildonly-randconfig-006-20260204    gcc-14
x86_64      buildonly-randconfig-006-20260205    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260204    gcc-14
x86_64                randconfig-001-20260205    clang-20
x86_64                randconfig-002-20260204    gcc-14
x86_64                randconfig-002-20260205    clang-20
x86_64                randconfig-003-20260204    gcc-14
x86_64                randconfig-003-20260205    clang-20
x86_64                randconfig-004-20260204    gcc-14
x86_64                randconfig-004-20260205    clang-20
x86_64                randconfig-005-20260204    gcc-14
x86_64                randconfig-005-20260205    clang-20
x86_64                randconfig-006-20260204    gcc-14
x86_64                randconfig-006-20260205    clang-20
x86_64                randconfig-011-20260204    clang-20
x86_64                randconfig-011-20260205    clang-20
x86_64                randconfig-012-20260204    clang-20
x86_64                randconfig-012-20260205    clang-20
x86_64                randconfig-013-20260204    clang-20
x86_64                randconfig-013-20260205    clang-20
x86_64                randconfig-014-20260204    clang-20
x86_64                randconfig-014-20260205    clang-20
x86_64                randconfig-015-20260204    clang-20
x86_64                randconfig-015-20260205    clang-20
x86_64                randconfig-016-20260204    clang-20
x86_64                randconfig-016-20260205    clang-20
x86_64                randconfig-071-20260205    clang-20
x86_64                randconfig-072-20260205    clang-20
x86_64                randconfig-073-20260205    clang-20
x86_64                randconfig-074-20260205    clang-20
x86_64                randconfig-075-20260205    clang-20
x86_64                randconfig-076-20260205    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260204    gcc-8.5.0
xtensa                randconfig-001-20260205    gcc-12.5.0
xtensa                randconfig-002-20260204    gcc-8.5.0
xtensa                randconfig-002-20260205    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

