Return-Path: <linux-leds+bounces-7536-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGZ7JEA+xmm7HgUAu9opvQ
	(envelope-from <linux-leds+bounces-7536-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 09:22:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EC340DF6
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 09:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B87AD3010801
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 08:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553723016EB;
	Fri, 27 Mar 2026 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlcQ4rVq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38970372EE4
	for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2026 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599735; cv=none; b=fvO+hcfHfRwJqKVYuFizZCxmFZMte2KPWDGzYeSRxQo0bfWpmg6eEFLZrsC3LWuTlxIhW8fQ8u3yAUa+HDKm4qI7+2Pb4uwBT/zqh9DGSxAom5wT0RfDc21t6oEFtLIUdrrSnb/M72VM5I3veTBKTPopFitDmha3rgFf94Tbd1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599735; c=relaxed/simple;
	bh=aTnAjOOHExtCnd6s6wSemNnFWPAqd7bBzO9MA50lZaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e5ZPjGfI37WVRVgwEO6XsPbOzW6JwX9mEtsYGVLaStgbGuPUoyLRvw7zj6x72InE9Gu1ndyZ4HiTbudxdYJXjNGh0XR0qT4mDDftgPmyfBT2Cu290uRMqJXrY8FVS7okMThBJNxkj2RDk1nkkxESCoSomCdCE/nF+jQlL9pgBSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlcQ4rVq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774599731; x=1806135731;
  h=date:from:to:cc:subject:message-id;
  bh=aTnAjOOHExtCnd6s6wSemNnFWPAqd7bBzO9MA50lZaA=;
  b=IlcQ4rVqzH7wQxXw7DgcaFpVvsaOJ5gpgXjqMWvVGIJtaL3kuHqeXNSk
   QZKdXFVB/x7GiSS1wvaQfbdsg8CzDjnfx9bjNjea+MXZ/vgkBfi4oKo1V
   Ojph6thGeX/3k7Xlm/5InvlAAGDyy4mULZFvGoURTw+4D/o7AKg/nYYvc
   yDI536LG/RZL4YZNbW6whBOffOJ0lmwfTaatf16MaADdK8xfvQU6eyKRO
   1a0t3swiYof2j3QtQHxIgoji+upIMABoqmPz1om/rL330IoPnG37dr/64
   FzyHEa7UVUapEZevmxxWsIgo+rng6Kxlwd1wfU5DJIqT4Yt1ZMsugmn9c
   A==;
X-CSE-ConnectionGUID: enPK3n0ORhSDkFVWlGP8PA==
X-CSE-MsgGUID: zLiq+wShTo6RvgHKx/D+mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75784865"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75784865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 01:22:10 -0700
X-CSE-ConnectionGUID: 5ED4h8ibQxOjycKXowDYnA==
X-CSE-MsgGUID: tZXudxb/RaS9ptXk0mOVvA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2026 01:22:09 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w62SE-000000009xh-3aVM;
	Fri, 27 Mar 2026 08:22:06 +0000
Date: Fri, 27 Mar 2026 16:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 b727ba2560a8a806680b45c9acc5a49bc39b8e43
Message-ID: <202603271609.kCEAoez0-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7536-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C07EC340DF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: b727ba2560a8a806680b45c9acc5a49bc39b8e43  leds: Kconfig: Drop unneeded dependency on OF_GPIO

elapsed time: 748m

configs tested: 170
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
arc                   randconfig-001-20260327    gcc-8.5.0
arc                   randconfig-002-20260327    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260327    gcc-8.5.0
arm                   randconfig-002-20260327    gcc-8.5.0
arm                   randconfig-003-20260327    gcc-8.5.0
arm                   randconfig-004-20260327    gcc-8.5.0
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260327    clang-23
arm64                 randconfig-002-20260327    clang-23
arm64                 randconfig-003-20260327    clang-23
arm64                 randconfig-004-20260327    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260327    clang-23
csky                  randconfig-002-20260327    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260327    gcc-8.5.0
hexagon               randconfig-002-20260327    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260327    clang-20
i386        buildonly-randconfig-002-20260327    clang-20
i386        buildonly-randconfig-003-20260327    clang-20
i386        buildonly-randconfig-004-20260327    clang-20
i386        buildonly-randconfig-005-20260327    clang-20
i386        buildonly-randconfig-006-20260327    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260327    clang-20
i386                  randconfig-002-20260327    clang-20
i386                  randconfig-003-20260327    clang-20
i386                  randconfig-004-20260327    clang-20
i386                  randconfig-005-20260327    clang-20
i386                  randconfig-006-20260327    clang-20
i386                  randconfig-007-20260327    clang-20
i386                  randconfig-011-20260327    gcc-14
i386                  randconfig-012-20260327    gcc-14
i386                  randconfig-013-20260327    gcc-14
i386                  randconfig-014-20260327    gcc-14
i386                  randconfig-015-20260327    gcc-14
i386                  randconfig-016-20260327    gcc-14
i386                  randconfig-017-20260327    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260327    gcc-8.5.0
loongarch             randconfig-002-20260327    gcc-8.5.0
m68k                             alldefconfig    gcc-15.2.0
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260327    gcc-8.5.0
nios2                 randconfig-002-20260327    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260327    clang-18
parisc                randconfig-002-20260327    clang-18
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260327    clang-18
powerpc               randconfig-002-20260327    clang-18
powerpc64             randconfig-001-20260327    clang-18
powerpc64             randconfig-002-20260327    clang-18
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260327    gcc-12.5.0
riscv                 randconfig-002-20260327    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260327    gcc-12.5.0
s390                  randconfig-002-20260327    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260327    gcc-12.5.0
sh                    randconfig-002-20260327    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260327    gcc-14
sparc                 randconfig-002-20260327    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260327    gcc-14
sparc64               randconfig-002-20260327    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260327    gcc-14
um                    randconfig-002-20260327    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260327    clang-20
x86_64      buildonly-randconfig-002-20260327    clang-20
x86_64      buildonly-randconfig-003-20260327    clang-20
x86_64      buildonly-randconfig-004-20260327    clang-20
x86_64      buildonly-randconfig-005-20260327    clang-20
x86_64      buildonly-randconfig-006-20260327    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260327    gcc-14
x86_64                randconfig-002-20260327    gcc-14
x86_64                randconfig-003-20260327    gcc-14
x86_64                randconfig-004-20260327    gcc-14
x86_64                randconfig-005-20260327    gcc-14
x86_64                randconfig-006-20260327    gcc-14
x86_64                randconfig-011-20260327    gcc-14
x86_64                randconfig-012-20260327    gcc-14
x86_64                randconfig-013-20260327    gcc-14
x86_64                randconfig-014-20260327    gcc-14
x86_64                randconfig-015-20260327    gcc-14
x86_64                randconfig-016-20260327    gcc-14
x86_64                randconfig-071-20260327    gcc-13
x86_64                randconfig-072-20260327    gcc-13
x86_64                randconfig-073-20260327    gcc-13
x86_64                randconfig-074-20260327    gcc-13
x86_64                randconfig-075-20260327    gcc-13
x86_64                randconfig-076-20260327    gcc-13
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                  nommu_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260327    gcc-14
xtensa                randconfig-002-20260327    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

