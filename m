Return-Path: <linux-leds+bounces-6693-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wInUE1iOcGkaYgAAu9opvQ
	(envelope-from <linux-leds+bounces-6693-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 09:29:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D04695392C
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 09:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C93F709EA5
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 08:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ACB44D03C;
	Wed, 21 Jan 2026 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EslCDNft"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5A477E3B
	for <linux-leds@vger.kernel.org>; Wed, 21 Jan 2026 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983767; cv=none; b=EKOQrM6xZBh7Mk+/v4wspU/XE5XXiqsk8Pp3ZX+kmTPG+kMQSgjourbCLg3PKiAued9YA5DjCFzmFlLk54Q+s4+DUp0VdIxW1eJoCDF9lCFVrJnQD1Sw0jN3l6AjGH+IP0dJOZgtGv32mBqDAdiyFcEiNy5coPAUVIQx5KvlaiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983767; c=relaxed/simple;
	bh=0sMgvUBJAIm9FU9BnrtXfHlSDWdO8GIuEICEaF2gHiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKzb0aG1VDGloxtumf7tqpCoxw3LQalNscRrGBqpulcyhxQFfJSTTaSWA3HWVLu5kjDXzUOpDuW3Fbw0PZ+xXJ/mNXFZrSLC7lcjE/irGT8ks4a+6S8JaI8AlJFnUReaQcDANvV87GWlcAfGfvz+lw9rFm/JIjdJtg8lzhlaM9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EslCDNft; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768983765; x=1800519765;
  h=date:from:to:cc:subject:message-id;
  bh=0sMgvUBJAIm9FU9BnrtXfHlSDWdO8GIuEICEaF2gHiY=;
  b=EslCDNft3j52BbOTwQzOLrSUUL911BKCbl7E2oK3k+Nbg/trNFuXLhOW
   0SGt8qrznLj6YWbXDD/1Sh+lpb3hhcq7TdkwTiduACCwKX1zLeaqHWQ4b
   Fv61X9s2+55bNEqVrWLoFLhbrdmAk9/CAGQVukwCFPRk1MbAjVeanUSaY
   AuMMJauSjXCwi34b99cve0bJrNIVwbacvrXwNRxlE5LZhXa5ermpGELVx
   ek3KvpCamYllwUEljJBLAXH8Ri/z7BcJSjMb9k6xXDJnaur502qS2rti7
   M1rkDDURRkPTnCNKIVdwqYe9tmpCHnCY4PeFskii8w5sUTGj4eSSw/JL4
   A==;
X-CSE-ConnectionGUID: lUXZxipeRuegn3ijqUrOvQ==
X-CSE-MsgGUID: kAoI+YPHSGG4jJmDnYQL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70178303"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70178303"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:22:45 -0800
X-CSE-ConnectionGUID: ypcvd/uxRo6w++0cJWcRFQ==
X-CSE-MsgGUID: OQqNa18JT0q+sHVh4I6nUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="237055027"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2026 00:22:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viTU8-00000000QA1-2zTZ;
	Wed, 21 Jan 2026 08:22:40 +0000
Date: Wed, 21 Jan 2026 16:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 974d724e58fd2eee0fe46299901deae6fa9ebad1
Message-ID: <202601211640.IPAC4b7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6693-lists,linux-leds=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D04695392C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 974d724e58fd2eee0fe46299901deae6fa9ebad1  docs: leds: Document TI LP5812 LED driver

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202601100247.wetiMFXE-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202601101239.ORkhfLpB-lkp@intel.com

    ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
    ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
    drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    drivers/leds/rgb/leds-lp5860-core.c:72:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- arm64-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- i386-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- loongarch-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- riscv-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- x86_64-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
`-- x86_64-allyesconfig
    `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used

elapsed time: 902m

configs tested: 190
configs skipped: 1

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260121    clang-18
arc                   randconfig-002-20260121    clang-18
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                        neponset_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    gcc-15.2.0
arm                   randconfig-001-20260121    clang-18
arm                   randconfig-002-20260121    clang-18
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-004-20260121    clang-18
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-002-20260121    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-002-20260121    clang-20
i386        buildonly-randconfig-003-20260121    clang-20
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-013-20260121    gcc-14
i386                  randconfig-014-20260121    gcc-14
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-017-20260121    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.2.0
m68k                           sun3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-002-20260121    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260121    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-002-20260121    clang-16
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-002-20260121    clang-16
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                         apsh4a3a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-002-20260121    clang-16
sh                          rsk7201_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260121    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260121    gcc-8.5.0
um                    randconfig-002-20260121    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-002-20260121    clang-20
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-005-20260121    clang-20
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-071-20260121    clang-20
x86_64                randconfig-072-20260121    clang-20
x86_64                randconfig-073-20260121    clang-20
x86_64                randconfig-074-20260121    clang-20
x86_64                randconfig-075-20260121    clang-20
x86_64                randconfig-076-20260121    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260121    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

