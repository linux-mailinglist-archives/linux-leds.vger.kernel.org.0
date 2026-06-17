Return-Path: <linux-leds+bounces-8654-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gfn2BiYlM2q09wUAu9opvQ
	(envelope-from <linux-leds+bounces-8654-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 00:52:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41B69CBEF
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 00:52:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fBymIsOk;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8654-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8654-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8E10301A722
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 22:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2717C3803F7;
	Wed, 17 Jun 2026 22:48:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A833E35C
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 22:48:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736530; cv=none; b=PNcdKZ87rJ72zXaTflBOqzBwI/XNzWowFaR1OYyDajD624IrC+TCbwhvDqGLm/CrH60Cl4LlsjmQwlzdVl30CdSb+ZBrYGpqYFXWbEX1Jx/f+uSw+yUN8TeBrw60VDmS3YQCrHk/gB0V5nvXl2eV/rCOkH+Nhjdf2pzpJO08tuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736530; c=relaxed/simple;
	bh=Gs9reooADVe24fNKZMqn3MV5fiuzjbyG+eHp9ZuQGhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWQFLSVnNmQcbioFtGmJnEStvAg7BuxPl3MaW/8lhD5vmi59uBd8KaP8rQxZ/mX/BFiz1C58x7U/F9ye02EKLX/Wt02kWNgtl82+cLBY4kZF33K/UvOXTINDXi3wwFI7lMUhA34Cd0UYdThHI2nk8eLg3tLipSnRpLFPGQsf8PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBymIsOk; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781736529; x=1813272529;
  h=date:from:to:cc:subject:message-id;
  bh=Gs9reooADVe24fNKZMqn3MV5fiuzjbyG+eHp9ZuQGhY=;
  b=fBymIsOkTQTeXIuLBMTAZHxqAIqv8isvuTtnwV/+qhipb2+0PQ0Q3d6x
   iO2yuqk6NItHh2788+XyaUlN9EiWq8T+EiSgwpDV1V95K87P3E53YMm3R
   yat5S6vCysAZ4Vpp0A3RHHnn1qqo0yJYy3kUAtC3xQtEv7w90Qf7mguB0
   Nj4JEwu6AYFZNwjUSKNVU/ytKCu3XICnFFGN5o0lM/60Jd+SH92HL/UfQ
   p9gWMtoaa2YuN2jL/4bJjuVaZa2/RjeINiAXEG082hNH+fa8PL9+5Krj7
   Ko24DwPoDgiekRbUiTXtIXyBFxsIqFXeQDP5vi7CTrJEAqyxltpE6D1jQ
   Q==;
X-CSE-ConnectionGUID: eJsRvG62QmuV0y57f/gauw==
X-CSE-MsgGUID: LB15QCybTIKlWKvM67U71Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82653786"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82653786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:48:48 -0700
X-CSE-ConnectionGUID: jEYogDabTbSZpJVGulGoDg==
X-CSE-MsgGUID: gcRE/i7jQha0JZObrJRdwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="248253259"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2026 15:48:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZz3r-00000000V1C-2d2f;
	Wed, 17 Jun 2026 22:48:43 +0000
Date: Thu, 18 Jun 2026 06:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 d43f1d792902ba0a53fd311bff2cf96095c7606d
Message-ID: <202606180614.Q9S5YUW2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8654-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D41B69CBEF

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: d43f1d792902ba0a53fd311bff2cf96095c7606d  leds: tps6131x: Increase overvoltage protection threshold to 6V

elapsed time: 727m

configs tested: 297
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260617    gcc-16.1.0
arc                   randconfig-001-20260618    gcc-15.2.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260617    gcc-16.1.0
arc                   randconfig-002-20260618    gcc-15.2.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                       multi_v4t_defconfig    clang-19
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260617    gcc-16.1.0
arm                   randconfig-001-20260618    gcc-15.2.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260617    gcc-16.1.0
arm                   randconfig-002-20260618    gcc-15.2.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260617    gcc-16.1.0
arm                   randconfig-003-20260618    gcc-15.2.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260617    gcc-16.1.0
arm                   randconfig-004-20260618    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260617    gcc-12.5.0
arm64                 randconfig-001-20260618    gcc-15.2.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260617    gcc-12.5.0
arm64                 randconfig-002-20260618    gcc-15.2.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260617    gcc-12.5.0
arm64                 randconfig-003-20260618    gcc-15.2.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260617    gcc-12.5.0
arm64                 randconfig-004-20260618    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260617    gcc-12.5.0
csky                  randconfig-001-20260618    gcc-15.2.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260617    gcc-12.5.0
csky                  randconfig-002-20260618    gcc-15.2.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260617    clang-17
hexagon               randconfig-001-20260618    clang-23
hexagon               randconfig-002-20260617    clang-17
hexagon               randconfig-002-20260618    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260617    gcc-14
i386        buildonly-randconfig-001-20260618    gcc-14
i386        buildonly-randconfig-002-20260617    gcc-14
i386        buildonly-randconfig-002-20260618    gcc-14
i386        buildonly-randconfig-003-20260617    gcc-14
i386        buildonly-randconfig-003-20260618    gcc-14
i386        buildonly-randconfig-004-20260617    gcc-14
i386        buildonly-randconfig-004-20260618    gcc-14
i386        buildonly-randconfig-005-20260617    gcc-14
i386        buildonly-randconfig-005-20260618    gcc-14
i386        buildonly-randconfig-006-20260617    gcc-14
i386        buildonly-randconfig-006-20260618    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260617    gcc-13
i386                  randconfig-001-20260618    clang-22
i386                  randconfig-002-20260617    gcc-13
i386                  randconfig-002-20260618    clang-22
i386                  randconfig-003-20260617    gcc-13
i386                  randconfig-003-20260618    clang-22
i386                  randconfig-004-20260617    gcc-13
i386                  randconfig-004-20260618    clang-22
i386                  randconfig-005-20260617    gcc-13
i386                  randconfig-005-20260618    clang-22
i386                  randconfig-006-20260617    gcc-13
i386                  randconfig-006-20260618    clang-22
i386                  randconfig-007-20260617    gcc-13
i386                  randconfig-007-20260618    clang-22
i386                  randconfig-011-20260617    clang-22
i386                  randconfig-011-20260618    clang-22
i386                  randconfig-012-20260617    clang-22
i386                  randconfig-012-20260618    clang-22
i386                  randconfig-013-20260617    clang-22
i386                  randconfig-013-20260618    clang-22
i386                  randconfig-014-20260617    clang-22
i386                  randconfig-014-20260618    clang-22
i386                  randconfig-015-20260617    clang-22
i386                  randconfig-015-20260618    clang-22
i386                  randconfig-016-20260617    clang-22
i386                  randconfig-016-20260618    clang-22
i386                  randconfig-017-20260617    clang-22
i386                  randconfig-017-20260618    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260617    clang-17
loongarch             randconfig-001-20260618    clang-23
loongarch             randconfig-002-20260617    clang-17
loongarch             randconfig-002-20260618    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260617    clang-17
nios2                 randconfig-001-20260618    clang-23
nios2                 randconfig-002-20260617    clang-17
nios2                 randconfig-002-20260618    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc         de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260617    gcc-15.2.0
parisc                randconfig-001-20260618    gcc-16.1.0
parisc                randconfig-002-20260617    gcc-15.2.0
parisc                randconfig-002-20260618    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                          g5_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260617    gcc-15.2.0
powerpc               randconfig-001-20260618    gcc-16.1.0
powerpc               randconfig-002-20260617    gcc-15.2.0
powerpc               randconfig-002-20260618    gcc-16.1.0
powerpc64             randconfig-001-20260617    gcc-15.2.0
powerpc64             randconfig-001-20260618    gcc-16.1.0
powerpc64             randconfig-002-20260617    gcc-15.2.0
powerpc64             randconfig-002-20260618    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-16.1.0
riscv                 randconfig-001-20260617    clang-17
riscv                 randconfig-001-20260617    gcc-16.1.0
riscv                 randconfig-001-20260618    gcc-13.4.0
riscv                          randconfig-002    gcc-16.1.0
riscv                 randconfig-002-20260617    clang-23
riscv                 randconfig-002-20260617    gcc-16.1.0
riscv                 randconfig-002-20260618    gcc-13.4.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-16.1.0
s390                  randconfig-001-20260617    gcc-16.1.0
s390                  randconfig-001-20260617    gcc-9.5.0
s390                  randconfig-001-20260618    gcc-13.4.0
s390                           randconfig-002    gcc-16.1.0
s390                  randconfig-002-20260617    clang-23
s390                  randconfig-002-20260617    gcc-16.1.0
s390                  randconfig-002-20260618    gcc-13.4.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-16.1.0
sh                    randconfig-001-20260617    gcc-16.1.0
sh                    randconfig-001-20260618    gcc-13.4.0
sh                             randconfig-002    gcc-16.1.0
sh                    randconfig-002-20260617    gcc-12.5.0
sh                    randconfig-002-20260617    gcc-16.1.0
sh                    randconfig-002-20260618    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260617    gcc-16.1.0
sparc                 randconfig-001-20260618    gcc-14.3.0
sparc                 randconfig-002-20260617    gcc-16.1.0
sparc                 randconfig-002-20260618    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260617    gcc-16.1.0
sparc64               randconfig-001-20260618    gcc-14.3.0
sparc64               randconfig-002-20260617    gcc-16.1.0
sparc64               randconfig-002-20260618    gcc-14.3.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260617    gcc-16.1.0
um                    randconfig-001-20260618    gcc-14.3.0
um                    randconfig-002-20260617    gcc-16.1.0
um                    randconfig-002-20260618    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260617    clang-22
x86_64      buildonly-randconfig-001-20260618    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260617    clang-22
x86_64      buildonly-randconfig-002-20260618    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260617    clang-22
x86_64      buildonly-randconfig-003-20260618    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260617    clang-22
x86_64      buildonly-randconfig-004-20260618    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260617    clang-22
x86_64      buildonly-randconfig-005-20260618    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260617    clang-22
x86_64      buildonly-randconfig-006-20260618    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260617    clang-22
x86_64                randconfig-001-20260618    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260617    clang-22
x86_64                randconfig-002-20260618    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260617    clang-22
x86_64                randconfig-003-20260618    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260617    clang-22
x86_64                randconfig-004-20260618    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260617    clang-22
x86_64                randconfig-005-20260618    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260617    clang-22
x86_64                randconfig-006-20260618    clang-22
x86_64                randconfig-011-20260617    clang-22
x86_64                randconfig-011-20260618    gcc-14
x86_64                randconfig-012-20260617    clang-22
x86_64                randconfig-012-20260618    gcc-14
x86_64                randconfig-013-20260617    clang-22
x86_64                randconfig-013-20260618    gcc-14
x86_64                randconfig-014-20260617    clang-22
x86_64                randconfig-014-20260618    gcc-14
x86_64                randconfig-015-20260617    clang-22
x86_64                randconfig-015-20260618    gcc-14
x86_64                randconfig-016-20260617    clang-22
x86_64                randconfig-016-20260618    gcc-14
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260617    gcc-13
x86_64                randconfig-071-20260618    clang-22
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260617    gcc-13
x86_64                randconfig-072-20260618    clang-22
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260617    gcc-13
x86_64                randconfig-073-20260618    clang-22
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260617    gcc-13
x86_64                randconfig-074-20260618    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260617    gcc-13
x86_64                randconfig-075-20260618    clang-22
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260617    gcc-13
x86_64                randconfig-076-20260618    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260617    gcc-16.1.0
xtensa                randconfig-001-20260618    gcc-14.3.0
xtensa                randconfig-002-20260617    gcc-16.1.0
xtensa                randconfig-002-20260618    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

