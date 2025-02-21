Return-Path: <linux-leds+bounces-4053-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B565A3FC77
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 18:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08FF67AC3F8
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 16:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F602236FD;
	Fri, 21 Feb 2025 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7C1NqjI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C92215F40
	for <linux-leds@vger.kernel.org>; Fri, 21 Feb 2025 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157037; cv=none; b=GV0p+5l24vVO5Z8oI9PwK5qeOpJwsSqJNEtQWQwCE1I8s8wjqSBgpiVBYYczF4mBawoGndcybeKCw6LICrTzSc2oT6bQlcDJcNcuJtLARXUScCo6YpBQHXNUtgq87+C/iRCjfvWWWg6e+yhZEuGYYFNOFEBvU6PuPFzJhB34Br8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157037; c=relaxed/simple;
	bh=2/L/VmdC//JgX2JM7xse1Nb7JxSACLdfj4n44Y8alSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EMDi8dIgxr3PQf6BGBtA+7sn/RijJg3NSn+EUDLcLC5MBjmsqSKJdGV4968XcoVv0fv5CUAjteWR9Lgx7zUu0aJyAkbpZM7DGVpE30ngOAuOUPsvOGdNSmVrL69n/b0qOZkFUAo40Ei72WOpjvvlbPfAtkmjDuEl5Yck+MR7rJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7C1NqjI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740157035; x=1771693035;
  h=date:from:to:cc:subject:message-id;
  bh=2/L/VmdC//JgX2JM7xse1Nb7JxSACLdfj4n44Y8alSc=;
  b=c7C1NqjIs1PxZo6F81DfV2+vofT15CrIqVC1pm+4ow+3lTAe0RswsDUi
   Rks5OjzOspQdub1xDJHbNm/OiYxQZR8pCxH+E0ZThPryLNHNGb5DB0GJp
   LqBezOgW9IhhTyBEzM1NVDyBtm9X62GW22/36fBwWSjPgSq6a6ekmhFV7
   dN9/+eIw+NBRa8/VOr85BQPxpDEWYN7g3008+d9EKvlH7dQHj2ZvS2+WO
   scx+DVMgskKcsUg+XpiAR1FGrVC5HKaHwC7wZMjzfPegRgI/akiLGpR2D
   LV/H+zi6AzghDhD5CnMGHDPfuzSmOwagIYA9hwmsOL7mV4yIiqxfBVfWB
   w==;
X-CSE-ConnectionGUID: 0qzui1cvRfKi5U1nzYAKsg==
X-CSE-MsgGUID: IUZWTLQPRaaxYTn7FcCLCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51622152"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="51622152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:57:13 -0800
X-CSE-ConnectionGUID: FEfBt/3iRDa3DFmS9VSxwA==
X-CSE-MsgGUID: lkE08vu1Qvy5mdo5LQGAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115135443"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2025 08:57:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlWKr-0005lr-1b;
	Fri, 21 Feb 2025 16:57:09 +0000
Date: Sat, 22 Feb 2025 00:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 2f372a5dce6885f1d2647f7add01756bee0fef49
Message-ID: <202502220051.wtVgmvg4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 2f372a5dce6885f1d2647f7add01756bee0fef49  leds: st1202: Refactor st1202_led_set() to use !! operator for boolean conversion

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202502210631.1wjjGDNd-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202502210701.i2fIb4tb-lkp@intel.com

    drivers/leds/leds-pca955x.c:509:15: error: implicit declaration of function 'pca955x_num_led_regs'; did you mean 'pca955x_num_input_regs'? [-Werror=implicit-function-declaration]
    drivers/leds/leds-pca955x.c:509:8: error: call to undeclared function 'pca955x_num_led_regs'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
    drivers/leds/leds-pca955x.c:509:8: error: call to undeclared function 'pca955x_num_led_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arc-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arc-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arc-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arc-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arm-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arm-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arm-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- arm-randconfig-003-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- arm64-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- arm64-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-declaration
|-- arm64-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- arm64-randconfig-003-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- arm64-randconfig-004-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- hexagon-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- i386-buildonly-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- i386-buildonly-randconfig-005-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- loongarch-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- loongarch-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- nios2-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- parisc-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- parisc-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- powerpc-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- powerpc64-randconfig-003-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- riscv-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- s390-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- s390-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- s390-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sh-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sh-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sh-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sh-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sparc-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sparc-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- sparc64-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- um-allmodconfig
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- um-allyesconfig
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- um-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- um-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- x86_64-buildonly-randconfig-001-20250221
|   `-- drivers-leds-leds-pca955x.c:error:implicit-declaration-of-function-pca955x_num_led_regs
|-- x86_64-buildonly-randconfig-002-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- x86_64-buildonly-randconfig-003-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
|-- x86_64-buildonly-randconfig-005-20250221
|   `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations
`-- x86_64-buildonly-randconfig-006-20250221
    `-- drivers-leds-leds-pca955x.c:error:call-to-undeclared-function-pca955x_num_led_regs-ISO-C99-and-later-do-not-support-implicit-function-declarations

elapsed time: 1454m

configs tested: 69
configs skipped: 1

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250221    gcc-13.2.0
arc                  randconfig-002-20250221    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250221    gcc-14.2.0
arm                  randconfig-002-20250221    clang-19
arm                  randconfig-003-20250221    gcc-14.2.0
arm                  randconfig-004-20250221    clang-21
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250221    clang-15
arm64                randconfig-002-20250221    clang-21
arm64                randconfig-003-20250221    clang-21
arm64                randconfig-004-20250221    gcc-14.2.0
csky                 randconfig-001-20250221    gcc-14.2.0
csky                 randconfig-002-20250221    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250221    clang-21
hexagon              randconfig-002-20250221    clang-21
i386       buildonly-randconfig-001-20250221    gcc-12
i386       buildonly-randconfig-002-20250221    gcc-12
i386       buildonly-randconfig-003-20250221    gcc-12
i386       buildonly-randconfig-004-20250221    gcc-12
i386       buildonly-randconfig-005-20250221    clang-19
i386       buildonly-randconfig-006-20250221    clang-19
loongarch            randconfig-001-20250221    gcc-14.2.0
loongarch            randconfig-002-20250221    gcc-14.2.0
nios2                randconfig-001-20250221    gcc-14.2.0
nios2                randconfig-002-20250221    gcc-14.2.0
parisc               randconfig-001-20250221    gcc-14.2.0
parisc               randconfig-002-20250221    gcc-14.2.0
powerpc              randconfig-001-20250221    clang-21
powerpc              randconfig-002-20250221    clang-21
powerpc              randconfig-003-20250221    clang-17
powerpc64            randconfig-001-20250221    clang-21
powerpc64            randconfig-002-20250221    clang-21
powerpc64            randconfig-003-20250221    clang-19
riscv                randconfig-001-20250221    clang-21
riscv                randconfig-002-20250221    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250221    gcc-14.2.0
s390                 randconfig-002-20250221    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250221    gcc-14.2.0
sh                   randconfig-002-20250221    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250221    gcc-14.2.0
sparc                randconfig-002-20250221    gcc-14.2.0
sparc64              randconfig-001-20250221    gcc-14.2.0
sparc64              randconfig-002-20250221    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250221    gcc-12
um                   randconfig-002-20250221    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250221    gcc-12
x86_64     buildonly-randconfig-002-20250221    clang-19
x86_64     buildonly-randconfig-003-20250221    clang-19
x86_64     buildonly-randconfig-004-20250221    clang-19
x86_64     buildonly-randconfig-005-20250221    clang-19
x86_64     buildonly-randconfig-006-20250221    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250221    gcc-14.2.0
xtensa               randconfig-002-20250221    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

