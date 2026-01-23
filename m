Return-Path: <linux-leds+bounces-6717-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFqOMmBdc2l3vAAAu9opvQ
	(envelope-from <linux-leds+bounces-6717-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 12:37:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7BC7526A
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 12:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43C3C30202B2
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 11:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AA22BF3DB;
	Fri, 23 Jan 2026 11:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df71MHNy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC027FD5A
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168039; cv=none; b=GB/pAATbF6s+yIbzEf0TwoSaT0aAuPpYCEY9mSDXskaryO7rs6PP7r8UCzuZQKczs+lh2ej326xRzwiHHIwU04EIOVMqlqVnCh+MWSVaf/obwpEOB6CnYab1Yxg83ucOORD5BK3vxOTHQPLC8fUdDGtURFN1ufO5pqZUeU5dhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168039; c=relaxed/simple;
	bh=SFeG8hgC0an27W1ZP6GRXOJg8ypS6cHklsNjC+N5U9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S0MYmUoGRh0SOjOzLApgaaI2+rgW1jZ8NSKohiB4ElZBaK/D6ZYcLEESuLVIg1CfE1r8WbA7LHXf7I40dI2+pW5ZnDV3XuqIN7di744ycD1JVQPzvN5EEnTpVSyYhg/ZnXi76V5ZAy/kA061RVaa2hXj59tEAvT1FjQj/lCfqdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df71MHNy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769168036; x=1800704036;
  h=date:from:to:cc:subject:message-id;
  bh=SFeG8hgC0an27W1ZP6GRXOJg8ypS6cHklsNjC+N5U9U=;
  b=Df71MHNykdPa8MP9ybXkykKhwS2czMm27OURcFzh5q/OadRAIf9G9WpA
   pF57JNYIK1sG0iBE6D4dEcPoOJCGlp3H4Y2qG+/ODGv/I1RF5U7U96EWG
   TC9TraguIwBVDMSXUz/mHQRrETWcmGJapS0uKBOj1X1i9RwlxWTD4uBtE
   wDOV4QVB1fVe/560pZf3XS+nLBYgN9QLQH3fShwJhnyJ3k14OnkybzTYd
   aXSYAvYLPHubQdapPJBi7HI/tfwlFY6l4JSD07PyhAniprtiDrKF+c4UN
   e2WtdcMEjqIBc5j0RnkDx0AILWtwfIcsy/c2wAretiDJ7SrXsS8MoBzhK
   w==;
X-CSE-ConnectionGUID: YT5ST12ZS1eF+4APIcaWFA==
X-CSE-MsgGUID: 6Gc3WbJbTwahlaFkJHUrIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70141273"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70141273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:33:55 -0800
X-CSE-ConnectionGUID: 1Twm+9hPQgi6lD8vdhFWjw==
X-CSE-MsgGUID: 7f4stKcbRpCXTX2AJtxazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="237657452"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 03:33:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjFQE-00000000Ttm-0FBi;
	Fri, 23 Jan 2026 11:33:50 +0000
Date: Fri, 23 Jan 2026 19:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 68d2a846952f81cd01331fffdec9a67299b22319
Message-ID: <202601231923.P1esb76H-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6717-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 9F7BC7526A
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 68d2a846952f81cd01331fffdec9a67299b22319  leds: as3668: Driver for the ams Osram 4-channel i2c LED driver

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202601100247.wetiMFXE-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202601101239.ORkhfLpB-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202601230708.wwFMOXZp-lkp@intel.com

    ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
    ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
    drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    drivers/leds/rgb/leds-lp5860-core.c:72:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- arc-allmodconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- arm64-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- csky-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- hexagon-allmodconfig
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
|-- m68k-allmodconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- microblaze-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- mips-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- nios2-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- openrisc-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- parisc-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- powerpc-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- riscv-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- s390-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- sh-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- sparc64-allmodconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- um-allmodconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- um-allyesconfig
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
|-- x86_64-allmodconfig
|   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
|   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
`-- x86_64-allyesconfig
    `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used

elapsed time: 1215m

configs tested: 220
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260123    gcc-10.5.0
arc                   randconfig-002-20260123    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         assabet_defconfig    clang-22
arm                        clps711x_defconfig    gcc-15.2.0
arm                     davinci_all_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      integrator_defconfig    gcc-15.2.0
arm                          moxart_defconfig    gcc-15.2.0
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260123    gcc-10.5.0
arm                   randconfig-002-20260123    gcc-10.5.0
arm                   randconfig-003-20260123    gcc-10.5.0
arm                   randconfig-004-20260123    gcc-10.5.0
arm                         s5pv210_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260123    gcc-15.2.0
arm64                 randconfig-002-20260123    gcc-13.4.0
arm64                 randconfig-002-20260123    gcc-15.2.0
arm64                 randconfig-003-20260123    gcc-10.5.0
arm64                 randconfig-003-20260123    gcc-15.2.0
arm64                 randconfig-004-20260123    gcc-13.4.0
arm64                 randconfig-004-20260123    gcc-15.2.0
csky                             alldefconfig    gcc-15.2.0
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
hexagon               randconfig-001-20260123    gcc-12.5.0
hexagon               randconfig-002-20260123    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260123    clang-20
i386        buildonly-randconfig-002-20260123    clang-20
i386        buildonly-randconfig-003-20260123    clang-20
i386        buildonly-randconfig-004-20260123    clang-20
i386        buildonly-randconfig-005-20260123    clang-20
i386        buildonly-randconfig-006-20260123    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260123    gcc-14
i386                  randconfig-002-20260123    gcc-14
i386                  randconfig-003-20260123    gcc-14
i386                  randconfig-004-20260123    gcc-14
i386                  randconfig-005-20260123    gcc-14
i386                  randconfig-006-20260123    gcc-14
i386                  randconfig-007-20260123    gcc-14
i386                  randconfig-011-20260123    clang-20
i386                  randconfig-012-20260123    clang-20
i386                  randconfig-013-20260123    clang-20
i386                  randconfig-014-20260123    clang-20
i386                  randconfig-015-20260123    clang-20
i386                  randconfig-016-20260123    clang-20
i386                  randconfig-017-20260123    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260123    gcc-12.5.0
loongarch             randconfig-002-20260123    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-15.2.0
mips                         cobalt_defconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                           ip27_defconfig    gcc-15.2.0
mips                      maltaaprp_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260123    gcc-12.5.0
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
parisc                randconfig-001-20260123    gcc-12.5.0
parisc                randconfig-002-20260123    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    clang-22
powerpc                      mgcoge_defconfig    gcc-15.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260123    gcc-12.5.0
powerpc               randconfig-002-20260123    gcc-12.5.0
powerpc                     taishan_defconfig    clang-22
powerpc64             randconfig-001-20260123    gcc-12.5.0
powerpc64             randconfig-002-20260123    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    clang-22
sh                           se7712_defconfig    gcc-15.2.0
sh                           se7721_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260123    gcc-13.4.0
sparc                 randconfig-002-20260123    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260123    gcc-13.4.0
sparc64               randconfig-002-20260123    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260123    gcc-13.4.0
um                    randconfig-002-20260123    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.2.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260123    clang-20
x86_64      buildonly-randconfig-002-20260123    clang-20
x86_64      buildonly-randconfig-003-20260123    clang-20
x86_64      buildonly-randconfig-004-20260123    clang-20
x86_64      buildonly-randconfig-005-20260123    clang-20
x86_64      buildonly-randconfig-006-20260123    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260123    gcc-14
x86_64                randconfig-002-20260123    gcc-14
x86_64                randconfig-003-20260123    gcc-14
x86_64                randconfig-004-20260123    gcc-14
x86_64                randconfig-005-20260123    gcc-14
x86_64                randconfig-006-20260123    gcc-14
x86_64                randconfig-011-20260123    gcc-14
x86_64                randconfig-012-20260123    gcc-14
x86_64                randconfig-013-20260123    gcc-14
x86_64                randconfig-014-20260123    gcc-14
x86_64                randconfig-015-20260123    gcc-14
x86_64                randconfig-016-20260123    gcc-14
x86_64                randconfig-071-20260123    clang-20
x86_64                randconfig-072-20260123    clang-20
x86_64                randconfig-073-20260123    clang-20
x86_64                randconfig-074-20260123    clang-20
x86_64                randconfig-075-20260123    clang-20
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
xtensa                randconfig-001-20260123    gcc-13.4.0
xtensa                randconfig-002-20260123    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

