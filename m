Return-Path: <linux-leds+bounces-6708-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJF+CgHVcmnKpgAAu9opvQ
	(envelope-from <linux-leds+bounces-6708-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 02:55:13 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 898056F66C
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 02:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E713002A0C
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 01:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336DF26AE5;
	Fri, 23 Jan 2026 01:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oB7atEGJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452630CD85
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769133171; cv=none; b=JnUyXBUpXJJuw7Xc6G92BJwLp7EpMEJDMvkgrmg3QGgNG21W39v/d+KT/bsk4tOLwrnVLqRMQ5ghuWE4F0xe4iya52cwSCoofTTlMEYSDleNJE6BZWZ+zXgUa20emc2NKz6E0px5MDH9LMb2dmM/1Wornnnu0/xfRI41fboPJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769133171; c=relaxed/simple;
	bh=dkR1y/panqU9hfAU/lDeQin3jVuR2/Rpz+fSgG55Chs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/HfKSjjba+RjxuvUm8qA85vZMc4rRxm2bVWgAXay7qP8Ka//umiMhLjpS8srpdfLgjysOa/BMjNcdXRHKEa4706QQa4lfV954fR8aeYSRxXtGXNjLak0az9rFRC4X3Erv7Pq6HXZVCY491pps+y29hZ+A7RSF00iyE5zviH6x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oB7atEGJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769133154; x=1800669154;
  h=date:from:to:cc:subject:message-id;
  bh=dkR1y/panqU9hfAU/lDeQin3jVuR2/Rpz+fSgG55Chs=;
  b=oB7atEGJuICJ4SvypXF/Cuzczh5BKxTiEFoy+t7M9BOecAK41CzmxO7n
   Thqm7ZBxEkRNzsbkWJOGGZuIQvgDNJ0kVasccqL0u+YyTJyPCwQsY74FF
   DGgCkD3xprGt64v9tBjGwVuQ7+4WHoQMtipkZDFA0+Ff1vpM03Z9F0B3/
   E7qs8qLaUlKEPk13Vp53qI4oRq6BW4DQga4agzbUekBvMD9AzsoByZ+Pj
   UIv+oDgiVVrnUeGX0dMv71gNSq1MPkCTUbwW95bn8icY+Q2/Y2fn+GYcd
   pPjCAQ0Ys16xjJ4RT7FuxMcmgM1kVW/ftzALZZ3P1CZBJ3PAh583xrDre
   w==;
X-CSE-ConnectionGUID: 4wmXOCaUQwWom3LwUlYPuw==
X-CSE-MsgGUID: zwe23wEpQ0uZUpFrtZcbwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74238343"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="74238343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 17:52:29 -0800
X-CSE-ConnectionGUID: 5T3Z3uDaQzqjiFPZDQVCYQ==
X-CSE-MsgGUID: P7eT/eoGSeC5FqsC3kCw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207321465"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 17:52:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj6LZ-00000000TQA-37BB;
	Fri, 23 Jan 2026 01:52:25 +0000
Date: Fri, 23 Jan 2026 09:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-fixes] BUILD SUCCESS
 d1883cefd31752f0504b94c3bcfa1f6d511d6e87
Message-ID: <202601230937.jR6m5UbJ-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6708-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 898056F66C
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-fixes
branch HEAD: d1883cefd31752f0504b94c3bcfa1f6d511d6e87  leds: led-class: Only Add LED to leds_list when it is fully ready

elapsed time: 845m

configs tested: 300
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260122    gcc-14.3.0
arc                   randconfig-001-20260122    gcc-15.2.0
arc                   randconfig-001-20260123    gcc-10.5.0
arc                   randconfig-002-20260122    gcc-15.2.0
arc                   randconfig-002-20260123    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                        clps711x_defconfig    gcc-15.2.0
arm                     davinci_all_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      integrator_defconfig    gcc-15.2.0
arm                          moxart_defconfig    gcc-15.2.0
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                         nhk8815_defconfig    clang-22
arm                           omap1_defconfig    clang-22
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260122    clang-22
arm                   randconfig-001-20260122    gcc-15.2.0
arm                   randconfig-001-20260123    gcc-10.5.0
arm                   randconfig-002-20260122    gcc-11.5.0
arm                   randconfig-002-20260122    gcc-15.2.0
arm                   randconfig-002-20260123    gcc-10.5.0
arm                   randconfig-003-20260122    gcc-15.2.0
arm                   randconfig-003-20260123    gcc-10.5.0
arm                   randconfig-004-20260122    gcc-13.4.0
arm                   randconfig-004-20260122    gcc-15.2.0
arm                   randconfig-004-20260123    gcc-10.5.0
arm                         s5pv210_defconfig    gcc-15.2.0
arm                           sama7_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260123    gcc-15.2.0
arm64                 randconfig-002-20260123    gcc-15.2.0
arm64                 randconfig-003-20260123    gcc-15.2.0
arm64                 randconfig-004-20260123    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260123    gcc-15.2.0
csky                  randconfig-002-20260123    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260122    clang-20
hexagon               randconfig-001-20260123    gcc-12.5.0
hexagon               randconfig-002-20260122    clang-22
hexagon               randconfig-002-20260123    gcc-12.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260122    clang-20
i386        buildonly-randconfig-001-20260123    clang-20
i386        buildonly-randconfig-002-20260122    clang-20
i386        buildonly-randconfig-002-20260123    clang-20
i386        buildonly-randconfig-003-20260122    clang-20
i386        buildonly-randconfig-003-20260123    clang-20
i386        buildonly-randconfig-004-20260122    clang-20
i386        buildonly-randconfig-004-20260123    clang-20
i386        buildonly-randconfig-005-20260122    clang-20
i386        buildonly-randconfig-005-20260123    clang-20
i386        buildonly-randconfig-006-20260122    clang-20
i386        buildonly-randconfig-006-20260123    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260122    gcc-14
i386                  randconfig-001-20260123    gcc-14
i386                  randconfig-002-20260122    clang-20
i386                  randconfig-002-20260122    gcc-14
i386                  randconfig-002-20260123    gcc-14
i386                  randconfig-003-20260122    gcc-12
i386                  randconfig-003-20260122    gcc-14
i386                  randconfig-003-20260123    gcc-14
i386                  randconfig-004-20260122    gcc-14
i386                  randconfig-004-20260123    gcc-14
i386                  randconfig-005-20260122    gcc-14
i386                  randconfig-005-20260123    gcc-14
i386                  randconfig-006-20260122    gcc-14
i386                  randconfig-006-20260123    gcc-14
i386                  randconfig-007-20260122    gcc-14
i386                  randconfig-007-20260123    gcc-14
i386                  randconfig-011-20260122    clang-20
i386                  randconfig-011-20260123    clang-20
i386                  randconfig-012-20260122    clang-20
i386                  randconfig-012-20260123    clang-20
i386                  randconfig-013-20260122    clang-20
i386                  randconfig-013-20260123    clang-20
i386                  randconfig-014-20260122    clang-20
i386                  randconfig-014-20260123    clang-20
i386                  randconfig-015-20260122    clang-20
i386                  randconfig-015-20260123    clang-20
i386                  randconfig-016-20260122    clang-20
i386                  randconfig-016-20260123    clang-20
i386                  randconfig-017-20260122    clang-20
i386                  randconfig-017-20260123    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260122    gcc-15.2.0
loongarch             randconfig-001-20260123    gcc-12.5.0
loongarch             randconfig-002-20260122    gcc-15.2.0
loongarch             randconfig-002-20260123    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                          eyeq5_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260122    gcc-11.5.0
nios2                 randconfig-001-20260123    gcc-12.5.0
nios2                 randconfig-002-20260122    gcc-8.5.0
nios2                 randconfig-002-20260123    gcc-12.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260122    gcc-10.5.0
parisc                randconfig-001-20260123    gcc-12.5.0
parisc                randconfig-002-20260122    gcc-10.5.0
parisc                randconfig-002-20260122    gcc-12.5.0
parisc                randconfig-002-20260123    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc               randconfig-001-20260122    gcc-10.5.0
powerpc               randconfig-001-20260122    gcc-14.3.0
powerpc               randconfig-001-20260123    gcc-12.5.0
powerpc               randconfig-002-20260122    clang-22
powerpc               randconfig-002-20260122    gcc-10.5.0
powerpc               randconfig-002-20260123    gcc-12.5.0
powerpc64             randconfig-001-20260122    clang-18
powerpc64             randconfig-001-20260122    gcc-10.5.0
powerpc64             randconfig-001-20260123    gcc-12.5.0
powerpc64             randconfig-002-20260122    gcc-10.5.0
powerpc64             randconfig-002-20260122    gcc-12.5.0
powerpc64             randconfig-002-20260123    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260122    clang-18
riscv                 randconfig-002-20260122    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260122    clang-18
s390                  randconfig-002-20260122    clang-18
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                        edosk7705_defconfig    gcc-15.2.0
sh                    randconfig-001-20260122    clang-18
sh                    randconfig-002-20260122    clang-18
sh                           se7206_defconfig    clang-22
sh                             sh03_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260122    gcc-8.5.0
sparc                 randconfig-001-20260123    gcc-13.4.0
sparc                 randconfig-002-20260122    gcc-8.5.0
sparc                 randconfig-002-20260123    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260122    gcc-8.5.0
sparc64               randconfig-001-20260123    gcc-13.4.0
sparc64               randconfig-002-20260122    gcc-8.5.0
sparc64               randconfig-002-20260123    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260122    gcc-8.5.0
um                    randconfig-001-20260123    gcc-13.4.0
um                    randconfig-002-20260122    gcc-8.5.0
um                    randconfig-002-20260123    gcc-13.4.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260122    clang-20
x86_64      buildonly-randconfig-001-20260123    clang-20
x86_64      buildonly-randconfig-002-20260122    clang-20
x86_64      buildonly-randconfig-002-20260123    clang-20
x86_64      buildonly-randconfig-003-20260122    clang-20
x86_64      buildonly-randconfig-003-20260123    clang-20
x86_64      buildonly-randconfig-004-20260122    clang-20
x86_64      buildonly-randconfig-004-20260123    clang-20
x86_64      buildonly-randconfig-005-20260122    clang-20
x86_64      buildonly-randconfig-005-20260123    clang-20
x86_64      buildonly-randconfig-006-20260122    clang-20
x86_64      buildonly-randconfig-006-20260123    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260122    clang-20
x86_64                randconfig-001-20260123    gcc-14
x86_64                randconfig-002-20260122    clang-20
x86_64                randconfig-002-20260123    gcc-14
x86_64                randconfig-003-20260122    clang-20
x86_64                randconfig-003-20260123    gcc-14
x86_64                randconfig-004-20260122    clang-20
x86_64                randconfig-004-20260123    gcc-14
x86_64                randconfig-005-20260122    clang-20
x86_64                randconfig-005-20260123    gcc-14
x86_64                randconfig-006-20260122    clang-20
x86_64                randconfig-006-20260123    gcc-14
x86_64                randconfig-011-20260122    clang-20
x86_64                randconfig-011-20260122    gcc-14
x86_64                randconfig-011-20260123    gcc-14
x86_64                randconfig-012-20260122    clang-20
x86_64                randconfig-012-20260122    gcc-14
x86_64                randconfig-012-20260123    gcc-14
x86_64                randconfig-013-20260122    clang-20
x86_64                randconfig-013-20260123    gcc-14
x86_64                randconfig-014-20260122    clang-20
x86_64                randconfig-014-20260123    gcc-14
x86_64                randconfig-015-20260122    clang-20
x86_64                randconfig-015-20260123    gcc-14
x86_64                randconfig-016-20260122    clang-20
x86_64                randconfig-016-20260122    gcc-14
x86_64                randconfig-016-20260123    gcc-14
x86_64                randconfig-071-20260122    clang-20
x86_64                randconfig-071-20260123    clang-20
x86_64                randconfig-072-20260122    clang-20
x86_64                randconfig-072-20260123    clang-20
x86_64                randconfig-073-20260122    gcc-14
x86_64                randconfig-073-20260123    clang-20
x86_64                randconfig-074-20260122    clang-20
x86_64                randconfig-074-20260123    clang-20
x86_64                randconfig-075-20260122    gcc-14
x86_64                randconfig-075-20260123    clang-20
x86_64                randconfig-076-20260122    clang-20
x86_64                randconfig-076-20260123    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260122    gcc-8.5.0
xtensa                randconfig-001-20260123    gcc-13.4.0
xtensa                randconfig-002-20260122    gcc-8.5.0
xtensa                randconfig-002-20260123    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

