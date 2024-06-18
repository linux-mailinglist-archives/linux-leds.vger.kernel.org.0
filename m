Return-Path: <linux-leds+bounces-1992-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8AD90C3E2
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 08:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5F68285247
	for <lists+linux-leds@lfdr.de>; Tue, 18 Jun 2024 06:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E46960B96;
	Tue, 18 Jun 2024 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIdFyYF/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C76DDC5
	for <linux-leds@vger.kernel.org>; Tue, 18 Jun 2024 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718693021; cv=none; b=lf4j4uf4UozSWxc17RBJ0/mvul0St6FIy1SS1Dq1JDeXo1l54vCk3NX1D7xFEd5H3cGLPnqDIklZKb8kIwEB7UYrCGEH3EyGPV8RQi2ugIErXyl/Lp59DbewdOsv0ut2TA/oZzpmedDW/Q1VEI8w6KDdqgWKPqsBLApfrkbhyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718693021; c=relaxed/simple;
	bh=zgl/PtzbMzhfbrjLV8VgLysoAMdNdFDwt4RqY8d0pWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YzxpWk9sRxo6LUn1IZZQVtmBmd+zK1GE5jpAun/sL51tJcrJygS7OR5dT/CZ69MPCCO9DJPg9oriz7G3LiNv0+j+9MraMV982DVbCJDF6NMY/c5riYgTAGOfui/KionB8DWR3SOeweEue7TkhJX21+Rjk/Kxqkufl/SAObMjJmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIdFyYF/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718693019; x=1750229019;
  h=date:from:to:cc:subject:message-id;
  bh=zgl/PtzbMzhfbrjLV8VgLysoAMdNdFDwt4RqY8d0pWA=;
  b=JIdFyYF/J1KPzcdAmFk2p1QlLY8rmGRBCHWoBzDAu4ELJ8N0+0nULfxS
   Taikt6UvZAEh1EWUg71+Ojzsa24upU8NromiTCOEOBK32WX7CUFsW5roO
   eof+BgmgebqpwjjytBbov1SLoxCaHy7AG1uZ8tkqWTNB1x4y5MQc1MKZw
   x8Es+szeP3ErfCi5xKGu+pjCKHT0qANPnryRkixq8OkfrKP6NL8cgS73w
   xjyY2UhoQJGPD/RziCIdY3m0v1jS/HvI1dBehyvtfcBfZqICgOJtiUBJB
   4IN8P+jvjigPhaUynHFGoPUD5c9+4bMmHU6iFyIz7gsN6OxLA3TdprFwN
   Q==;
X-CSE-ConnectionGUID: Hyj82DeuT6uljVsR8n28dQ==
X-CSE-MsgGUID: Rba/8sRgQyyLT+5McmRoPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26129086"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26129086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:43:38 -0700
X-CSE-ConnectionGUID: YT8XowPyRp+yxaoZuBEmrA==
X-CSE-MsgGUID: qMP1Yhh+RI+Phg95CxwzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41301418"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2024 23:43:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJSZ5-0005Ha-0S;
	Tue, 18 Jun 2024 06:43:35 +0000
Date: Tue, 18 Jun 2024 14:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 7c85503b6d597b84ea58fe3dd95cd9eaeb1f3206
Message-ID: <202406181437.x79VYgAv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 7c85503b6d597b84ea58fe3dd95cd9eaeb1f3206  leds: powernv: Replace of_node_put to __free

elapsed time: 5548m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   clang-14
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                             allmodconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                             allyesconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

