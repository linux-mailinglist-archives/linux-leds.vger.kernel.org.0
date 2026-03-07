Return-Path: <linux-leds+bounces-7146-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI06NlC4q2n7fwEAu9opvQ
	(envelope-from <linux-leds+bounces-7146-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 06:32:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E022A459
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 06:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51A29301F9EE
	for <lists+linux-leds@lfdr.de>; Sat,  7 Mar 2026 05:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F8D7DA66;
	Sat,  7 Mar 2026 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vq2yFx+3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B7280018
	for <linux-leds@vger.kernel.org>; Sat,  7 Mar 2026 05:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861446; cv=none; b=JsDeclWJ0NVS5rCXW9uWPgMfWT7fyrftdg5rWbr/XxtPNnD6Ittc7bm30sA/sEluD2iX/m3FiKZ3TDdRiTDC0AdBQzFHUeMI3TGvkp92Jumb6ZV4i0TdRbg+N+ucnSvr3IxsQqYWDE+7bcU2x/lh1RXluEj3Y9kCpCKo8cwYcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861446; c=relaxed/simple;
	bh=da2mSaXL10EZheeDBe5Gaf3HatOEAeGPsSAU3imVSIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oCuUFsnNLJpyqoPoPGOQ+zXSACwlz5s7XZCD3BFFznNY8LoGqYh3soiCfrqWrD84brY8nKpODRleAJQb6IqdqBBp3Vr/+TADwIU9UDMqJSHoB4TB/VpnoSFgTUXdOtSLoY02f78Q3KFql76LkU5jNJf+XrTw7/oEKFEesrRKOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vq2yFx+3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772861446; x=1804397446;
  h=date:from:to:cc:subject:message-id;
  bh=da2mSaXL10EZheeDBe5Gaf3HatOEAeGPsSAU3imVSIA=;
  b=Vq2yFx+3CzXCXTKujhLqIUsZXVI1HIwEuAItbfqgYG2awWBJgbkA6Pog
   Wy1qs78BpBtCA4eR3+KSnp3I51QMsbop/q5Q6nbTKc8fGxEhttjuEYNdy
   3T3Jdi3J/V7fEXwG3gOz1dHqvi+CDdV7WE06VzAHnMcLtJd6ZpHvhybVf
   HBCZ/ixDbOSO6vIsQevg6eyqYWIZEhZx9bZ2Bw8SeJ+o0kZAor/SMQHgc
   p1MY50q2R7YbFBR64x8Ax4W2GSY3xtfwP0ZCXjfDibQ0ZB2jUyZSd5NE0
   29mN5dh4w0vGydMbiT6vq4edS5EScx/VD1fEih95Wh913gRnfopMySGlj
   g==;
X-CSE-ConnectionGUID: jIOy0xjEQ9ig1M1alVJcKw==
X-CSE-MsgGUID: QV8WRHhjTaOp/v/Xd2qAxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73870493"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73870493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:30:45 -0800
X-CSE-ConnectionGUID: Ej1hFcgAR5uk3PEfqh6ocA==
X-CSE-MsgGUID: Ntak0kEKTEyHttFIUvZU9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2026 21:30:43 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykFN-000000001iZ-15kJ;
	Sat, 07 Mar 2026 05:30:41 +0000
Date: Sat, 07 Mar 2026 13:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 894480de5bf35e2b9c3b4ffccef17150f52513ca
Message-ID: <202603071316.POzL18sF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 4F7E022A459
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7146-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 894480de5bf35e2b9c3b4ffccef17150f52513ca  leds: lgm-sso: Remove duplicate assignments for priv->mmap

elapsed time: 922m

configs tested: 169
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260307    gcc-15.2.0
arc                   randconfig-002-20260307    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260307    gcc-15.2.0
arm                   randconfig-002-20260307    gcc-15.2.0
arm                   randconfig-003-20260307    gcc-15.2.0
arm                   randconfig-004-20260307    gcc-15.2.0
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260307    gcc-8.5.0
arm64                 randconfig-002-20260307    gcc-8.5.0
arm64                 randconfig-003-20260307    gcc-8.5.0
arm64                 randconfig-004-20260307    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260307    gcc-8.5.0
csky                  randconfig-002-20260307    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260307    gcc-15.2.0
hexagon               randconfig-002-20260307    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260307    gcc-14
i386        buildonly-randconfig-002-20260307    gcc-14
i386        buildonly-randconfig-003-20260307    gcc-14
i386        buildonly-randconfig-004-20260307    gcc-14
i386        buildonly-randconfig-005-20260307    gcc-14
i386        buildonly-randconfig-006-20260307    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260307    clang-20
i386                  randconfig-002-20260307    clang-20
i386                  randconfig-003-20260307    clang-20
i386                  randconfig-004-20260307    clang-20
i386                  randconfig-005-20260307    clang-20
i386                  randconfig-006-20260307    clang-20
i386                  randconfig-007-20260307    clang-20
i386                  randconfig-011-20260307    gcc-14
i386                  randconfig-012-20260307    gcc-14
i386                  randconfig-013-20260307    gcc-14
i386                  randconfig-014-20260307    gcc-14
i386                  randconfig-015-20260307    gcc-14
i386                  randconfig-016-20260307    gcc-14
i386                  randconfig-017-20260307    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260307    gcc-15.2.0
loongarch             randconfig-002-20260307    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260307    gcc-15.2.0
nios2                 randconfig-002-20260307    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260307    gcc-12.5.0
parisc                randconfig-002-20260307    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260307    gcc-12.5.0
powerpc               randconfig-002-20260307    gcc-12.5.0
powerpc64             randconfig-001-20260307    gcc-12.5.0
powerpc64             randconfig-002-20260307    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260307    clang-23
riscv                 randconfig-002-20260307    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260307    clang-23
s390                  randconfig-002-20260307    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260307    clang-23
sh                    randconfig-002-20260307    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260307    gcc-8.5.0
sparc                 randconfig-002-20260307    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260307    gcc-8.5.0
sparc64               randconfig-002-20260307    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260307    gcc-8.5.0
um                    randconfig-002-20260307    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260307    clang-20
x86_64      buildonly-randconfig-002-20260307    clang-20
x86_64      buildonly-randconfig-003-20260307    clang-20
x86_64      buildonly-randconfig-004-20260307    clang-20
x86_64      buildonly-randconfig-005-20260307    clang-20
x86_64      buildonly-randconfig-006-20260307    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260307    gcc-14
x86_64                randconfig-002-20260307    gcc-14
x86_64                randconfig-003-20260307    gcc-14
x86_64                randconfig-004-20260307    gcc-14
x86_64                randconfig-005-20260307    gcc-14
x86_64                randconfig-006-20260307    gcc-14
x86_64                randconfig-011-20260307    gcc-14
x86_64                randconfig-012-20260307    gcc-14
x86_64                randconfig-013-20260307    gcc-14
x86_64                randconfig-014-20260307    gcc-14
x86_64                randconfig-015-20260307    gcc-14
x86_64                randconfig-016-20260307    gcc-14
x86_64                randconfig-071-20260307    gcc-14
x86_64                randconfig-072-20260307    gcc-14
x86_64                randconfig-073-20260307    gcc-14
x86_64                randconfig-074-20260307    gcc-14
x86_64                randconfig-075-20260307    gcc-14
x86_64                randconfig-076-20260307    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260307    gcc-8.5.0
xtensa                randconfig-002-20260307    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

