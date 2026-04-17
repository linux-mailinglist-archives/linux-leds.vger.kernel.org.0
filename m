Return-Path: <linux-leds+bounces-7753-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCeBDXcD4mna0QAAu9opvQ
	(envelope-from <linux-leds+bounces-7753-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:55:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C11419A6F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3093303085A
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30DD35F607;
	Fri, 17 Apr 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hebXqIeO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED1371888
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419670; cv=none; b=sOdB2VzZ6yoTZ7U0wFgeXKihoBADuC8zagwWLiqYng/PQXb6O07GE/teyzXWy/1wyuxJys+XpLp63/y/bXe+aW5/q4D6BDLTq2CPBhzmzrsJTjSiYqeLx20qZBHx7xxxDG05/Gi3AS+XfJV/ZIs8SKHqYJNA2DnB+Fu8sNczumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419670; c=relaxed/simple;
	bh=8yw8IR8DGLouaabGDmI2/Xl9VymTBWq8IzKLzjy+GbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b3YjcZXfzl0gmgMHQ4ZMxoX5NGhS70Jd8hFkpfpxx88tcFft7wcS6VhBWfDzZ1A5fp9rYbPEe9sK53G1vprQPCNFr+8PzISOZU2DI0JE8B9jvSq7Wo8+Sh8QXdreWp3vkgOBCR1fb0HFU8DTdRMsqQnSzyVoyvJA1GY2APWUCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hebXqIeO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776419669; x=1807955669;
  h=date:from:to:cc:subject:message-id;
  bh=8yw8IR8DGLouaabGDmI2/Xl9VymTBWq8IzKLzjy+GbM=;
  b=hebXqIeO4ahiqNxfbMNSIby7gdLikU2reU+s99R4M15U0pmwNdUxctCz
   tCA6Z5LW2w7FlQcgIBq5xvG+j9WYtGSIukLcamev7dLapliQkw/kI7Uv7
   +X17eqBsOWn1pgFJVHy+KKFYOzO+cEAgmjredD21AC3fiWoq6wCfFyYHp
   oukorbSB7NS+YeAU7CBi079GCzntpF+aRs2itYx7e01R7DcCGL51zQCvQ
   IsjxtNpyOofqSmVAgflYjsFOAM2HdZA2vaAZi0HWjiy3PRIMGsiNFJQYO
   YK5FrXxC8mr5Y9JqgOALG9g9w1CBVhzuYQWTsjAXi8w6A2F9+Y6gtzihb
   A==;
X-CSE-ConnectionGUID: nYMy4ZQkSHC05jj4p/6aWA==
X-CSE-MsgGUID: 1K7Ko5OAR2S97rBF4FKX7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77553702"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77553702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:54:28 -0700
X-CSE-ConnectionGUID: nnGoOhNeQRuUnFDhQpKcIA==
X-CSE-MsgGUID: VXjW4NQ7RSSAQQH+qeKOIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="234986262"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Apr 2026 02:54:26 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDfu3-000000000CN-3kP9;
	Fri, 17 Apr 2026 09:54:23 +0000
Date: Fri, 17 Apr 2026 17:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 7a43ccf85dfe06eef483c034e68b81ff326741aa
Message-ID: <202604171728.gkUy5sYQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7753-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06C11419A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 7a43ccf85dfe06eef483c034e68b81ff326741aa  leds: class: Make led_remove_lookup() NULL-aware

elapsed time: 740m

configs tested: 215
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260417    gcc-8.5.0
arc                   randconfig-002-20260417    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260417    gcc-10.5.0
arm                   randconfig-001-20260417    gcc-8.5.0
arm                   randconfig-002-20260417    clang-23
arm                   randconfig-002-20260417    gcc-8.5.0
arm                   randconfig-003-20260417    clang-23
arm                   randconfig-003-20260417    gcc-8.5.0
arm                   randconfig-004-20260417    clang-23
arm                   randconfig-004-20260417    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260417    clang-19
arm64                 randconfig-002-20260417    clang-23
arm64                 randconfig-003-20260417    clang-23
arm64                 randconfig-004-20260417    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260417    gcc-13.4.0
csky                  randconfig-002-20260417    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260417    clang-18
hexagon               randconfig-001-20260417    clang-23
hexagon               randconfig-002-20260417    clang-18
hexagon               randconfig-002-20260417    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260417    clang-20
i386        buildonly-randconfig-002-20260417    clang-20
i386        buildonly-randconfig-003-20260417    clang-20
i386        buildonly-randconfig-004-20260417    clang-20
i386        buildonly-randconfig-005-20260417    clang-20
i386        buildonly-randconfig-005-20260417    gcc-14
i386        buildonly-randconfig-006-20260417    clang-20
i386                  randconfig-011-20260417    gcc-14
i386                  randconfig-012-20260417    gcc-14
i386                  randconfig-013-20260417    clang-20
i386                  randconfig-014-20260417    gcc-14
i386                  randconfig-015-20260417    gcc-14
i386                  randconfig-016-20260417    clang-20
i386                  randconfig-017-20260417    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260417    clang-18
loongarch             randconfig-002-20260417    clang-18
loongarch             randconfig-002-20260417    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260417    clang-18
nios2                 randconfig-001-20260417    gcc-11.5.0
nios2                 randconfig-002-20260417    clang-18
nios2                 randconfig-002-20260417    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260417    gcc-12.5.0
parisc                randconfig-001-20260417    gcc-8.5.0
parisc                randconfig-002-20260417    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260417    gcc-8.5.0
powerpc               randconfig-002-20260417    clang-23
powerpc               randconfig-002-20260417    gcc-8.5.0
powerpc64             randconfig-001-20260417    clang-23
powerpc64             randconfig-001-20260417    gcc-8.5.0
powerpc64             randconfig-002-20260417    clang-23
powerpc64             randconfig-002-20260417    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260417    clang-19
riscv                 randconfig-001-20260417    clang-23
riscv                 randconfig-002-20260417    clang-19
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260417    clang-19
s390                  randconfig-001-20260417    gcc-14.3.0
s390                  randconfig-002-20260417    clang-19
s390                  randconfig-002-20260417    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260417    clang-19
sh                    randconfig-001-20260417    gcc-15.2.0
sh                    randconfig-002-20260417    clang-19
sh                    randconfig-002-20260417    gcc-15.2.0
sh                              ul2_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260417    clang-23
sparc                 randconfig-001-20260417    gcc-12.5.0
sparc                 randconfig-002-20260417    clang-23
sparc                 randconfig-002-20260417    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260417    clang-20
sparc64               randconfig-001-20260417    clang-23
sparc64               randconfig-002-20260417    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260417    clang-23
um                    randconfig-001-20260417    gcc-13
um                    randconfig-002-20260417    clang-23
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260417    gcc-14
x86_64      buildonly-randconfig-002-20260417    gcc-14
x86_64      buildonly-randconfig-003-20260417    gcc-14
x86_64      buildonly-randconfig-004-20260417    gcc-14
x86_64      buildonly-randconfig-005-20260417    gcc-14
x86_64      buildonly-randconfig-006-20260417    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260417    gcc-14
x86_64                randconfig-002-20260417    clang-20
x86_64                randconfig-003-20260417    gcc-14
x86_64                randconfig-004-20260417    gcc-12
x86_64                randconfig-005-20260417    clang-20
x86_64                randconfig-006-20260417    clang-20
x86_64                randconfig-011-20260417    gcc-14
x86_64                randconfig-012-20260417    clang-20
x86_64                randconfig-012-20260417    gcc-14
x86_64                randconfig-013-20260417    clang-20
x86_64                randconfig-013-20260417    gcc-14
x86_64                randconfig-014-20260417    clang-20
x86_64                randconfig-014-20260417    gcc-14
x86_64                randconfig-015-20260417    clang-20
x86_64                randconfig-015-20260417    gcc-14
x86_64                randconfig-016-20260417    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260417    clang-23
xtensa                randconfig-001-20260417    gcc-9.5.0
xtensa                randconfig-002-20260417    clang-23
xtensa                randconfig-002-20260417    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

