Return-Path: <linux-leds+bounces-1294-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7482886994
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 10:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB8E31C21468
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 09:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1F922606;
	Fri, 22 Mar 2024 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF+Vsg+6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8E224F2
	for <linux-leds@vger.kernel.org>; Fri, 22 Mar 2024 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711100665; cv=none; b=T63aCaHKJj+hcoFOet6eig4ska+EjsgGe9pYDqHCKCTm//Ilcu+Tank1bgRbBSqFBB7+3EONFilVDka85AG5wwX4wstkbaTgF27Y/TiXxZ8bXmhm8BBte4Mp8WuwLD1JSQId6I9Y8bD5yRGWiSyPpnkRNPPc8Rs95qPvsOWJxHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711100665; c=relaxed/simple;
	bh=k3GfKaM+IF0toPHCxzE1Mp4l57GVNt8VNtZk/sMfyhE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qwf065vCW9Yu0CwBYsDDXhvMbAtQiuO2IP1L2fYTrqpnnTbenLjztpQfbAMmjoLLpROTxQAg767yf8r/oMRcyPUxQnVXO7Oku4dYkAT/65lz5QRgUCaTjizY+tIZedQSvmGKFy8u28XklMA3noynPawVt32rqeHCsNopmqgE4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF+Vsg+6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711100663; x=1742636663;
  h=date:from:to:cc:subject:message-id;
  bh=k3GfKaM+IF0toPHCxzE1Mp4l57GVNt8VNtZk/sMfyhE=;
  b=dF+Vsg+6OwsRnFS8curFBvWhnEDXEXGnvBBeq4ULMoAeMXdYv94P9IDz
   OMLgJ6CEGjx1oBjwX9cXYpQ5e7DZ5CodsH9cNdivx+BzTZmaaeVtllggG
   7duzQO5IOMbm9MgX61pGesVScZT9N3IoLHLgFcRk6d/588SnKu+Ymo5j4
   T5+65zuzNgjJ04MG9qZRzKySnLrqeMwH+JJcF8bAYAISjAexZm4+hM1US
   ucdnS36eRo7YavBhPyAr0Kvr0EQMCgs71vEoTozHPu+X4qVNT72siHwnd
   3jcrA62xfskQBMsOlSNNW/Ie8k6kDSeFwht2+WbHOl5LXI1Btcsfq4u6X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6748446"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6748446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 02:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="19322736"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Mar 2024 02:44:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnbRg-000KDJ-1F;
	Fri, 22 Mar 2024 09:44:16 +0000
Date: Fri, 22 Mar 2024 17:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next-next] BUILD SUCCESS
 ca66b10a11da3c445c9c0ca1184f549bbe9061f2
Message-ID: <202403221739.Vq98KN5X-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
branch HEAD: ca66b10a11da3c445c9c0ca1184f549bbe9061f2  leds: simatic-ipc-leds-gpio: Add support for module BX-59A

elapsed time: 919m

configs tested: 159
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240322   gcc  
arc                   randconfig-002-20240322   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   clang
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                          moxart_defconfig   gcc  
arm                   randconfig-001-20240322   gcc  
arm                   randconfig-004-20240322   gcc  
arm                         s3c6400_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240322   gcc  
arm64                 randconfig-003-20240322   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240322   gcc  
csky                  randconfig-002-20240322   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240322   gcc  
i386         buildonly-randconfig-002-20240322   gcc  
i386         buildonly-randconfig-003-20240322   clang
i386         buildonly-randconfig-004-20240322   clang
i386         buildonly-randconfig-005-20240322   gcc  
i386         buildonly-randconfig-006-20240322   clang
i386                                defconfig   clang
i386                  randconfig-001-20240322   clang
i386                  randconfig-002-20240322   clang
i386                  randconfig-003-20240322   gcc  
i386                  randconfig-004-20240322   gcc  
i386                  randconfig-005-20240322   clang
i386                  randconfig-006-20240322   clang
i386                  randconfig-011-20240322   gcc  
i386                  randconfig-012-20240322   clang
i386                  randconfig-013-20240322   clang
i386                  randconfig-014-20240322   clang
i386                  randconfig-015-20240322   gcc  
i386                  randconfig-016-20240322   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240322   gcc  
loongarch             randconfig-002-20240322   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                         rt305x_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240322   gcc  
nios2                 randconfig-002-20240322   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240322   gcc  
parisc                randconfig-002-20240322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                     asp8347_defconfig   clang
powerpc               randconfig-002-20240322   gcc  
powerpc64             randconfig-002-20240322   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240322   gcc  
riscv                 randconfig-002-20240322   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240322   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240322   gcc  
sh                    randconfig-002-20240322   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240322   gcc  
sparc64               randconfig-002-20240322   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240322   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240322   gcc  
xtensa                randconfig-002-20240322   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

