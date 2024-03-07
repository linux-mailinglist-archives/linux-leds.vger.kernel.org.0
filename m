Return-Path: <linux-leds+bounces-1193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE28759FC
	for <lists+linux-leds@lfdr.de>; Thu,  7 Mar 2024 23:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123E928369F
	for <lists+linux-leds@lfdr.de>; Thu,  7 Mar 2024 22:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D11913DBBF;
	Thu,  7 Mar 2024 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgqooJ6O"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD80139597
	for <linux-leds@vger.kernel.org>; Thu,  7 Mar 2024 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709849366; cv=none; b=i/+2OQ5lwj55hwXwRjvZUJ3wnsHsD55C/495Us13oeFEYqG4u6F7/d+R34vdzdmrv+5TJQ4UmPJGTLyLeXMYDKF5xViKLhih0m1Ocr8H0w8jQkXh4PWQTQWStt/SFGCrSBe6oq/+znryDzhvJ7a+Jma+z0WK2TMVWgrmDLkzSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709849366; c=relaxed/simple;
	bh=n7P3GNxY8K4iHSE1JoPXsHQ7c7TUSVh8xib+dCPNzB8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eYXb1cLjRe2iOb2QAgITGfuLkw4/iK1myRyyy9pwSOugN2jlHw9GcyDEBo4kyM2+iYY8ujK/FaIOIX4NwCl1k4Vz6j9i2iwBK8GsWtZBVlLE8OFiysnyaQ0CJhfSfjQzDe/QE+Ef/izrVvErwBRv8u5k66qebm1gXBUq7kTnKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgqooJ6O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709849365; x=1741385365;
  h=date:from:to:cc:subject:message-id;
  bh=n7P3GNxY8K4iHSE1JoPXsHQ7c7TUSVh8xib+dCPNzB8=;
  b=JgqooJ6O0sos+/QTc0IBYYjofdIKcquE9D/svQne19Ve+S6RDFwTTtOk
   xKR33DtumXWz+ZZOFD11R0MfEHcZTaU8jas5EwDVfOgOLqU0XL9hn4ItX
   GN2Qz0QdhwDZkLNz061RcnzOP2cpAuKUarGfjuSVqM/PdOkuNoVR1Y7eK
   sPakqf/ZGFc9A7Vm+4i/OthvdQD0tfIOGp6guAYIfflWEgxFF0EWcJ/1D
   sBwaooxJeNlKxxQOEnOPaVGbPc7zADQYs9T/vr8l1zWLo6ap65nPJVtih
   gJnx1YjgqBE8VKLqrmPdEzoAieXYgtmmJS9NksnzUnkpZl8Wpp0HdpGJs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15119794"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="15119794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 14:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10355340"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2024 14:09:22 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riLvU-0005kU-1e;
	Thu, 07 Mar 2024 22:09:20 +0000
Date: Fri, 08 Mar 2024 06:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 45066c4bbe8ca25f9f282245b84568116c783f1d
Message-ID: <202403080607.cJGPZK4p-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 45066c4bbe8ca25f9f282245b84568116c783f1d  leds: ncp5623: Add MS suffix to time defines

elapsed time: 746m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240307   clang
i386         buildonly-randconfig-002-20240307   gcc  
i386         buildonly-randconfig-003-20240307   clang
i386         buildonly-randconfig-004-20240307   gcc  
i386         buildonly-randconfig-005-20240307   gcc  
i386         buildonly-randconfig-006-20240307   clang
i386                                defconfig   clang
i386                  randconfig-001-20240307   gcc  
i386                  randconfig-002-20240307   gcc  
i386                  randconfig-003-20240307   clang
i386                  randconfig-004-20240307   gcc  
i386                  randconfig-005-20240307   gcc  
i386                  randconfig-006-20240307   clang
i386                  randconfig-011-20240307   clang
i386                  randconfig-012-20240307   gcc  
i386                  randconfig-013-20240307   clang
i386                  randconfig-014-20240307   clang
i386                  randconfig-015-20240307   clang
i386                  randconfig-016-20240307   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

