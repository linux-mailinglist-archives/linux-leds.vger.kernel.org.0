Return-Path: <linux-leds+bounces-8358-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJVnDKabGGr+lQgAu9opvQ
	(envelope-from <linux-leds+bounces-8358-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 21:46:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B05F7494
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 21:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668B93014110
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 19:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B592E92BA;
	Thu, 28 May 2026 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSWfNBIL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD8333711D
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779997443; cv=none; b=JuH7MtXgojlvJw6xnxyNwlsBzbK04TNBhrXzmXZw0hexHJ/yxiGQoUBkFq+0CZp6U0xzDdRHxmyidn1dZ1SMDIX18XE0ogkCY8GCvdPNcQ1p1y5Mmmt9Z1DE477o/moAwUlDR7Xd0MkEXfwNJKCCUYrS7H5Zl1pVitEDx+ALg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779997443; c=relaxed/simple;
	bh=KoS3sBJcmshNDL2STQd9jKIXZLBviIKGH9+6GG0SX7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HJQrWgDKAQHEGmaX71SIVEa6uDxBVklZhFB6qFrPhlgYuVijS0c6gEzkIDrv7zd7GP9EGU/2LL92ZfEzh3nLl9uHBeHgVHN6pVC81yvme6+JDwp2RsWQxgwpZhuntsR/D5uhmszoW2vagYHfmx2ITygy36KmL1UrjrbpWioFtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSWfNBIL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779997443; x=1811533443;
  h=date:from:to:cc:subject:message-id;
  bh=KoS3sBJcmshNDL2STQd9jKIXZLBviIKGH9+6GG0SX7c=;
  b=OSWfNBILuURW9dgydQgHsKFpG+vRTZijRCPsIYF0NDxwFlj2l1xC9M0+
   amnmx0APf7nmwGbPcljx5BhTWUReI7VkJvyx4ohxkp5WAMhMCKHh9firn
   N3+7mEoEkrrNxetYpzNV09c3XQ5ZupuCiUzr7lr0LfrMUhOStbEWxNnHM
   IcKC00lLy7ExOUVFt4iNfDx221mJ5jtPOKNABCr0oOL14ONFP7VQSEXKV
   o3b+uSAcjtTQuqTr95xrdIKiDDQbuGbhKGWoLPiiUvb7R6opvW47vYBGO
   IK5rfOcuVM0HnfxJ2CJmxgwlX2ACSSgYP+CfjZcHpFu8+i62BrAVxwR7v
   g==;
X-CSE-ConnectionGUID: uNMh4bOKRPqQodjQmoVGjA==
X-CSE-MsgGUID: eFxN/9SdTQCewonUWaKZVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80748928"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80748928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:44:02 -0700
X-CSE-ConnectionGUID: aQEnJc9mSUejcbq8vE7T7g==
X-CSE-MsgGUID: 19Sym6WGRZqy4x5RbQUq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238450248"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2026 12:44:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSge6-000000006Nm-0p2l;
	Thu, 28 May 2026 19:43:58 +0000
Date: Fri, 29 May 2026 03:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
Message-ID: <202605290351.9iAed8tQ-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8358-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 828B05F7494
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5  Documentation: leds: Document pattern behavior of Samsung S2M series PMIC RGB LEDs

elapsed time: 1658m

configs tested: 185
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
arc                   randconfig-001-20260528    clang-23
arc                   randconfig-002-20260528    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260528    clang-23
arm                   randconfig-002-20260528    clang-23
arm                   randconfig-003-20260528    clang-23
arm                   randconfig-004-20260528    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260528    gcc-15.2.0
arm64                 randconfig-002-20260528    gcc-15.2.0
arm64                 randconfig-003-20260528    gcc-15.2.0
arm64                 randconfig-004-20260528    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260528    gcc-15.2.0
csky                  randconfig-002-20260528    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260528    gcc-11.5.0
hexagon               randconfig-002-20260528    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260528    clang-20
i386        buildonly-randconfig-002-20260528    clang-20
i386        buildonly-randconfig-003-20260528    clang-20
i386        buildonly-randconfig-004-20260528    clang-20
i386        buildonly-randconfig-005-20260528    clang-20
i386        buildonly-randconfig-006-20260528    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260528    gcc-14
i386                  randconfig-002-20260528    gcc-14
i386                  randconfig-003-20260528    gcc-14
i386                  randconfig-004-20260528    gcc-14
i386                  randconfig-005-20260528    gcc-14
i386                  randconfig-006-20260528    gcc-14
i386                  randconfig-007-20260528    gcc-14
i386                  randconfig-011-20260528    clang-20
i386                  randconfig-012-20260528    clang-20
i386                  randconfig-013-20260528    clang-20
i386                  randconfig-014-20260528    clang-20
i386                  randconfig-015-20260528    clang-20
i386                  randconfig-016-20260528    clang-20
i386                  randconfig-017-20260528    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260528    gcc-11.5.0
loongarch             randconfig-002-20260528    gcc-11.5.0
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
mips                           gcw0_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260528    gcc-11.5.0
nios2                 randconfig-002-20260528    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-23
parisc                randconfig-001-20260528    clang-23
parisc                         randconfig-002    clang-23
parisc                randconfig-002-20260528    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-23
powerpc               randconfig-001-20260528    clang-23
powerpc                        randconfig-002    clang-23
powerpc               randconfig-002-20260528    clang-23
powerpc64                      randconfig-001    clang-23
powerpc64             randconfig-001-20260528    clang-23
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260528    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260528    gcc-13.4.0
riscv                 randconfig-002-20260528    gcc-13.4.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260528    gcc-13.4.0
s390                  randconfig-002-20260528    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260528    gcc-13.4.0
sh                    randconfig-002-20260528    gcc-13.4.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260528    gcc-15.2.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260528    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260528    gcc-15.2.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260528    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260528    gcc-15.2.0
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260528    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260528    gcc-14
x86_64      buildonly-randconfig-002-20260528    gcc-14
x86_64      buildonly-randconfig-003-20260528    gcc-14
x86_64      buildonly-randconfig-004-20260528    gcc-14
x86_64      buildonly-randconfig-005-20260528    gcc-14
x86_64      buildonly-randconfig-006-20260528    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260528    gcc-14
x86_64                randconfig-002-20260528    gcc-14
x86_64                randconfig-003-20260528    gcc-14
x86_64                randconfig-004-20260528    gcc-14
x86_64                randconfig-005-20260528    gcc-14
x86_64                randconfig-006-20260528    gcc-14
x86_64                randconfig-011-20260528    gcc-14
x86_64                randconfig-012-20260528    gcc-14
x86_64                randconfig-013-20260528    gcc-14
x86_64                randconfig-014-20260528    gcc-14
x86_64                randconfig-015-20260528    gcc-14
x86_64                randconfig-016-20260528    gcc-14
x86_64                randconfig-071-20260528    gcc-14
x86_64                randconfig-072-20260528    gcc-14
x86_64                randconfig-073-20260528    gcc-14
x86_64                randconfig-074-20260528    gcc-14
x86_64                randconfig-075-20260528    gcc-14
x86_64                randconfig-076-20260528    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260528    gcc-15.2.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260528    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

