Return-Path: <linux-leds+bounces-2179-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF7091EABA
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jul 2024 00:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46477B21B29
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2024 22:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719698120F;
	Mon,  1 Jul 2024 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="No6jPOOe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F34F602
	for <linux-leds@vger.kernel.org>; Mon,  1 Jul 2024 22:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719871961; cv=none; b=szO96ql+3HBiA3pP4Ty67p2uUJL8Q6UI+ATizF7TFbXHH7pviWtdjmBYnYkRfbfyBftVbaYQQVAFowvpd9RzF1uyshZJaUFaWDDVh7dK/C2OKkBISoIzLLITpOZKNMMXsI8HJPQjGzUidYozgAA6uAeQklTw/WkSCqfFKxi/Pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719871961; c=relaxed/simple;
	bh=NzIFIFpipWYu790jj2E+wl6JSdJpNtLo8bI/v7gbrUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QkP4B2fvTlMzYG/yIRMlTKHmoglXQ77lQo5gnWCxBUScmvLYorO7DPq9xewHrUDky0q107zaPssnl880b3xolJzCbye3ITrPT9RKYa/DyOHz0ys1KQwpr9jrZyS1pwC1kv45p+meB6mObG5chUQAJ5wVGMbzeZ1AzXNw5aoK5do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=No6jPOOe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719871959; x=1751407959;
  h=date:from:to:cc:subject:message-id;
  bh=NzIFIFpipWYu790jj2E+wl6JSdJpNtLo8bI/v7gbrUc=;
  b=No6jPOOeCFXVfJvybBWB7BjofCE1PXfS4/j3NYYFoQOBjTDzLoAJk6NA
   qUUm19tXtKha556XXuadCWg2awSKbIH1Ka8M9J8r47wfwTLRHEut/WQOQ
   BK53CAEG9VyXABjVStcuTYwQZnNB+iGQdkbr4CBspVEYYnoP8pePdzMEQ
   Bix7Ou9ncGYgoyI0+p2ukY6MEccx7BF1wGTeicOf5KpJZL5DMphyYB0lQ
   /4M0yXwISocShJJKh4K3GihI4F1EmSadH1gGVeiIxB4x4DZzeb51Zh7Jn
   kduo9CXXVw3EA+1qVi1noGnntP6cBfyDaWb8NlHsjiH953cagUCovJ9c3
   Q==;
X-CSE-ConnectionGUID: oNW+XDkkRJu++yPJiudjzg==
X-CSE-MsgGUID: eCjfm0aEQk+En9xWAVEXXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17239570"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="17239570"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:12:39 -0700
X-CSE-ConnectionGUID: fn8ZepApQ0GyD1r7oosFSA==
X-CSE-MsgGUID: PmWErhJ3RHe5gt4wwy022w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="45751522"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2024 15:12:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOPGG-000NQS-0I;
	Mon, 01 Jul 2024 22:12:36 +0000
Date: Tue, 02 Jul 2024 06:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:ib-leds-mfd-6.11] BUILD SUCCESS
 b107093f433c3afb83a46af43c830e578e2ba54d
Message-ID: <202407020612.hwSmlPb1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git ib-leds-mfd-6.11
branch HEAD: b107093f433c3afb83a46af43c830e578e2ba54d  mfd: cros_ec: Register LED subdevice

elapsed time: 15054m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-002-20240621   gcc-7
i386                                defconfig   clang-18
i386                  randconfig-002-20240621   gcc-13
i386                  randconfig-003-20240621   gcc-9
i386                  randconfig-004-20240621   gcc-13
i386                  randconfig-011-20240621   gcc-13
i386                  randconfig-012-20240621   gcc-13
i386                  randconfig-013-20240621   gcc-13
i386                  randconfig-015-20240621   gcc-13
i386                  randconfig-016-20240621   gcc-12
loongarch                        allmodconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
riscv                            allmodconfig   clang-19
riscv                            allyesconfig   clang-19
s390                             allmodconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allyesconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240622   gcc-8
x86_64       buildonly-randconfig-003-20240622   gcc-12
x86_64       buildonly-randconfig-004-20240622   gcc-13
x86_64       buildonly-randconfig-006-20240622   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-011-20240622   gcc-12
x86_64                randconfig-012-20240622   gcc-8
x86_64                randconfig-014-20240622   gcc-8
x86_64                randconfig-016-20240622   gcc-12
x86_64                randconfig-072-20240622   gcc-8
x86_64                randconfig-074-20240622   gcc-12
x86_64                randconfig-075-20240622   gcc-13
x86_64                randconfig-076-20240622   gcc-10
x86_64                          rhel-8.3-rust   clang-18

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

