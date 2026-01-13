Return-Path: <linux-leds+bounces-6631-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BED183F7
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 11:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B1D730194DA
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 10:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC9325702;
	Tue, 13 Jan 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwJZIfjs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576231A044
	for <linux-leds@vger.kernel.org>; Tue, 13 Jan 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301846; cv=none; b=RCgdpBmrjKAmhCeOduOeW/X2L9CPqQR3XcZo7nLWzhs+BRFnxJEQsYf2cO9u0nZ+47ohfJK3hGHHUwIjkHeotfaml68CP2IuMahxmgEsPPAL+uWO7yX2PvcGQZyNO6Qh3kszPWjXTUtgVGkBo111spL7DDM/2Wyp5W3i0VB18a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301846; c=relaxed/simple;
	bh=IVblHcFkJbia1SZQBeaa3qRh5wGJeUrjwOVGqW77Wbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBNAPJPa/Z8yRLFhqy77hYrxUCRzz6ABhmzyyFKZJowyAeS25LhB3/9+6qXeUOtO9Qu7nFdmdzNhfKh6GQDzWlOVklrKjealzA1fzQJ57oqBqTYBUgSnh7Kx7Sb97wOYV8ZyLHA6wxhQ+5vYmuT5x/ME8zPQAvFcN7zjaOPfAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwJZIfjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB42C16AAE;
	Tue, 13 Jan 2026 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301846;
	bh=IVblHcFkJbia1SZQBeaa3qRh5wGJeUrjwOVGqW77Wbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwJZIfjs9bjib2oEBqd2iQQUonT12EDzSq5h2cWeUya2f9tpxVZRbhUxAVgpNgfDX
	 +CQ9F/sL2K4tRCd8DAenmXrgk0BAhfTTES73hNfYFvRkLtU13lTPQm4xARcgKNdlUK
	 khGmfro0AsUdKGk8KIgYDZ8Lhu6IW1ScgGQlADdVoZF1E30oyzauZNHuQ7U7G/I+ZW
	 J4wA2AjvMobZFAKxJVOE4Q6TGsXdZxEnTt5bht7t2OtHEkbOj1v1B/WXmRA/7xpUXc
	 mEqd3UAAbmUB/oVw9BiRH3kbf6xCnz1j9TeutM3f6/xPoHJDT2EK1JViGbEF9mgbrw
	 iw7AXOCxCmX8Q==
Date: Tue, 13 Jan 2026 10:57:22 +0000
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-leds@vger.kernel.org
Subject: Re: [lee-leds:for-leds-next] BUILD REGRESSION
 e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
Message-ID: <20260113105722.GC1902656@google.com>
References: <202601110018.iHp14xac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202601110018.iHp14xac-lkp@intel.com>

+Steffen

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
> branch HEAD: e257dc532c20bd93f0076c18cb5ffd739a5f0bb4  leds: lp55xx: Simplify with scoped for each OF child loop
> 
> Error/Warning (recently discovered and may have been fixed):
> 
>     https://lore.kernel.org/oe-kbuild-all/202601100247.wetiMFXE-lkp@intel.com
>     https://lore.kernel.org/oe-kbuild-all/202601101239.ORkhfLpB-lkp@intel.com
>     https://lore.kernel.org/oe-kbuild/202601101812.j6kBBCPY-lkp@intel.com
>     https://lore.kernel.org/oe-kbuild/202601102106.gMVy9BeS-lkp@intel.com
> 
>     ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
>     ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
>     drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>     drivers/leds/rgb/leds-lp5860-core.c:72:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> 
> Unverified Error/Warning (likely false positive, kindly check if interested):
> 
>     drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant expression
> 
> Error/Warning ids grouped by kconfigs:
> 
> recent_errors
> |-- alpha-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- arc-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- arc-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- arm-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- arm64-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- csky-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- csky-randconfig-r133-20260110
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- hexagon-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- i386-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- i386-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- i386-randconfig-r071-20260110
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- loongarch-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- loongarch-randconfig-r073-20260110
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- m68k-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- m68k-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- microblaze-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- mips-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- mips-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- nios2-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- openrisc-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- openrisc-randconfig-r064-20260110
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- parisc-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- parisc-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- parisc-randconfig-002-20260111
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- parisc-randconfig-r073-20260110
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- powerpc-allmodconfig
> |   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
> |   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- riscv-allmodconfig
> |   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
> |   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- riscv-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- riscv-randconfig-r062-20260110
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- s390-allmodconfig
> |   |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
> |   |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- s390-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- sh-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- sh-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- sh-randconfig-r113-20260110
> |   |-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |   `-- drivers-leds-rgb-leds-lp5860-spi.c:sparse:sparse:bad-integer-constant-expression
> |-- sparc64-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- um-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- um-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- x86_64-allmodconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- x86_64-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |-- x86_64-randconfig-r123-20260110
> |   |-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> |   `-- drivers-leds-rgb-leds-lp5860-spi.c:sparse:sparse:bad-integer-constant-expression
> |-- xtensa-allyesconfig
> |   `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> `-- xtensa-randconfig-r071-20260110
>     |-- ERROR:lp5860_device_init-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
>     |-- ERROR:lp5860_device_remove-drivers-leds-rgb-leds-lp5860-spi.ko-undefined
>     `-- drivers-leds-rgb-leds-lp5860-core.c:warning:variable-ret-set-but-not-used
> 
> elapsed time: 1497m
> 
> configs tested: 236
> configs skipped: 2
> 
> tested configs:
> alpha                            alldefconfig    gcc-15.2.0
> alpha                             allnoconfig    gcc-15.2.0
> alpha                            allyesconfig    gcc-15.2.0
> alpha                               defconfig    gcc-15.2.0
> arc                              allmodconfig    clang-16
> arc                               allnoconfig    gcc-15.2.0
> arc                              allyesconfig    clang-22
> arc                                 defconfig    gcc-15.2.0
> arc                        nsimosci_defconfig    gcc-15.2.0
> arc                 nsimosci_hs_smp_defconfig    clang-22
> arc                   randconfig-001-20260110    clang-22
> arc                   randconfig-001-20260110    gcc-13.4.0
> arc                   randconfig-002-20260110    clang-22
> arc                   randconfig-002-20260110    gcc-8.5.0
> arm                               allnoconfig    gcc-15.2.0
> arm                              allyesconfig    clang-16
> arm                         bcm2835_defconfig    clang-22
> arm                                 defconfig    gcc-15.2.0
> arm                           h3600_defconfig    clang-22
> arm                           imxrt_defconfig    gcc-15.2.0
> arm                          ixp4xx_defconfig    gcc-15.2.0
> arm                         orion5x_defconfig    clang-22
> arm                   randconfig-001-20260110    clang-22
> arm                   randconfig-002-20260110    clang-22
> arm                   randconfig-002-20260110    gcc-12.5.0
> arm                   randconfig-003-20260110    clang-22
> arm                   randconfig-003-20260110    gcc-8.5.0
> arm                   randconfig-004-20260110    clang-22
> arm                        vexpress_defconfig    gcc-15.2.0
> arm64                            allmodconfig    clang-22
> arm64                             allnoconfig    gcc-15.2.0
> arm64                               defconfig    gcc-15.2.0
> arm64                 randconfig-001-20260110    gcc-10.5.0
> arm64                 randconfig-001-20260110    gcc-15.2.0
> arm64                 randconfig-002-20260110    gcc-10.5.0
> arm64                 randconfig-003-20260110    gcc-10.5.0
> arm64                 randconfig-003-20260110    gcc-12.5.0
> arm64                 randconfig-004-20260110    gcc-10.5.0
> arm64                 randconfig-004-20260110    gcc-14.3.0
> csky                             allmodconfig    gcc-15.2.0
> csky                              allnoconfig    gcc-15.2.0
> csky                                defconfig    gcc-15.2.0
> csky                  randconfig-001-20260110    gcc-10.5.0
> csky                  randconfig-001-20260110    gcc-15.2.0
> csky                  randconfig-002-20260110    gcc-10.5.0
> csky                  randconfig-002-20260110    gcc-15.2.0
> hexagon                          allmodconfig    gcc-15.2.0
> hexagon                           allnoconfig    gcc-15.2.0
> hexagon                             defconfig    gcc-15.2.0
> hexagon               randconfig-001-20260110    clang-22
> hexagon               randconfig-002-20260110    clang-22
> i386                             allmodconfig    clang-20
> i386                              allnoconfig    gcc-15.2.0
> i386                             allyesconfig    clang-20
> i386        buildonly-randconfig-001-20260110    gcc-14
> i386        buildonly-randconfig-002-20260110    gcc-14
> i386        buildonly-randconfig-003-20260110    gcc-12
> i386        buildonly-randconfig-003-20260110    gcc-14
> i386        buildonly-randconfig-004-20260110    clang-20
> i386        buildonly-randconfig-004-20260110    gcc-14
> i386        buildonly-randconfig-005-20260110    gcc-14
> i386        buildonly-randconfig-006-20260110    gcc-14
> i386                                defconfig    gcc-15.2.0
> i386                  randconfig-001-20260110    gcc-12
> i386                  randconfig-001-20260110    gcc-14
> i386                  randconfig-002-20260110    gcc-14
> i386                  randconfig-003-20260110    gcc-12
> i386                  randconfig-003-20260110    gcc-14
> i386                  randconfig-004-20260110    clang-20
> i386                  randconfig-004-20260110    gcc-14
> i386                  randconfig-005-20260110    gcc-14
> i386                  randconfig-006-20260110    clang-20
> i386                  randconfig-006-20260110    gcc-14
> i386                  randconfig-007-20260110    gcc-14
> i386                  randconfig-011-20260110    clang-20
> i386                  randconfig-011-20260110    gcc-14
> i386                  randconfig-012-20260110    gcc-14
> i386                  randconfig-013-20260110    gcc-14
> i386                  randconfig-014-20260110    clang-20
> i386                  randconfig-014-20260110    gcc-14
> i386                  randconfig-015-20260110    clang-20
> i386                  randconfig-015-20260110    gcc-14
> i386                  randconfig-016-20260110    clang-20
> i386                  randconfig-016-20260110    gcc-14
> i386                  randconfig-017-20260110    clang-20
> i386                  randconfig-017-20260110    gcc-14
> loongarch                        allmodconfig    clang-22
> loongarch                         allnoconfig    gcc-15.2.0
> loongarch                           defconfig    clang-19
> loongarch             randconfig-001-20260110    clang-22
> loongarch             randconfig-002-20260110    clang-22
> m68k                             allmodconfig    gcc-15.2.0
> m68k                              allnoconfig    gcc-15.2.0
> m68k                             allyesconfig    clang-16
> m68k                                defconfig    clang-19
> microblaze                        allnoconfig    gcc-15.2.0
> microblaze                       allyesconfig    gcc-15.2.0
> microblaze                          defconfig    clang-19
> mips                             allmodconfig    gcc-15.2.0
> mips                              allnoconfig    gcc-15.2.0
> mips                             allyesconfig    gcc-15.2.0
> mips                       bmips_be_defconfig    gcc-15.2.0
> mips                          eyeq6_defconfig    gcc-15.2.0
> mips                malta_qemu_32r6_defconfig    gcc-15.2.0
> nios2                            allmodconfig    clang-22
> nios2                             allnoconfig    clang-22
> nios2                               defconfig    clang-19
> nios2                 randconfig-001-20260110    clang-22
> nios2                 randconfig-001-20260110    gcc-8.5.0
> nios2                 randconfig-002-20260110    clang-22
> nios2                 randconfig-002-20260110    gcc-11.5.0
> openrisc                         allmodconfig    clang-22
> openrisc                          allnoconfig    clang-22
> openrisc                            defconfig    gcc-15.2.0
> parisc                           allmodconfig    gcc-15.2.0
> parisc                            allnoconfig    clang-22
> parisc                           allyesconfig    clang-19
> parisc                              defconfig    gcc-15.2.0
> parisc                generic-64bit_defconfig    clang-22
> parisc                randconfig-001-20260110    gcc-14.3.0
> parisc                randconfig-002-20260110    gcc-13.4.0
> parisc                randconfig-002-20260110    gcc-14.3.0
> parisc64                            defconfig    clang-19
> powerpc                          allmodconfig    gcc-15.2.0
> powerpc                           allnoconfig    clang-22
> powerpc                      katmai_defconfig    clang-22
> powerpc               randconfig-001-20260110    gcc-14.3.0
> powerpc               randconfig-001-20260110    gcc-8.5.0
> powerpc               randconfig-002-20260110    gcc-10.5.0
> powerpc               randconfig-002-20260110    gcc-14.3.0
> powerpc                     taishan_defconfig    gcc-15.2.0
> powerpc                     tqm5200_defconfig    gcc-15.2.0
> powerpc64             randconfig-001-20260110    gcc-14.3.0
> powerpc64             randconfig-002-20260110    clang-22
> powerpc64             randconfig-002-20260110    gcc-14.3.0
> riscv                            allmodconfig    clang-22
> riscv                             allnoconfig    clang-22
> riscv                            allyesconfig    clang-16
> riscv                               defconfig    gcc-15.2.0
> riscv                 randconfig-001-20260110    clang-22
> riscv                 randconfig-001-20260110    gcc-15.2.0
> riscv                 randconfig-002-20260110    clang-22
> riscv                 randconfig-002-20260110    gcc-15.2.0
> s390                             allmodconfig    clang-19
> s390                              allnoconfig    clang-22
> s390                             allyesconfig    gcc-15.2.0
> s390                                defconfig    gcc-15.2.0
> s390                  randconfig-001-20260110    gcc-15.2.0
> s390                  randconfig-001-20260110    gcc-9.5.0
> s390                  randconfig-002-20260110    clang-22
> s390                  randconfig-002-20260110    gcc-15.2.0
> sh                               allmodconfig    gcc-15.2.0
> sh                                allnoconfig    clang-22
> sh                               allyesconfig    clang-19
> sh                                  defconfig    gcc-14
> sh                            hp6xx_defconfig    gcc-15.2.0
> sh                    randconfig-001-20260110    gcc-15.2.0
> sh                    randconfig-002-20260110    gcc-12.5.0
> sh                    randconfig-002-20260110    gcc-15.2.0
> sh                          rsk7203_defconfig    gcc-15.2.0
> sh                   rts7751r2dplus_defconfig    clang-22
> sh                          sdk7786_defconfig    gcc-15.2.0
> sh                           sh2007_defconfig    gcc-15.2.0
> sh                        sh7785lcr_defconfig    gcc-15.2.0
> sh                            titan_defconfig    clang-22
> sparc                             allnoconfig    clang-22
> sparc                               defconfig    gcc-15.2.0
> sparc                 randconfig-001-20260110    clang-22
> sparc                 randconfig-001-20260110    gcc-14.3.0
> sparc                 randconfig-002-20260110    clang-22
> sparc                 randconfig-002-20260110    gcc-15.2.0
> sparc64                          allmodconfig    clang-22
> sparc64                             defconfig    gcc-14
> sparc64               randconfig-001-20260110    clang-22
> sparc64               randconfig-002-20260110    clang-22
> um                               allmodconfig    clang-19
> um                                allnoconfig    clang-22
> um                               allyesconfig    gcc-15.2.0
> um                                  defconfig    gcc-14
> um                             i386_defconfig    gcc-14
> um                    randconfig-001-20260110    clang-22
> um                    randconfig-001-20260110    gcc-14
> um                    randconfig-002-20260110    clang-22
> um                    randconfig-002-20260110    gcc-14
> um                           x86_64_defconfig    gcc-14
> x86_64                           allmodconfig    clang-20
> x86_64                            allnoconfig    clang-22
> x86_64                           allyesconfig    clang-20
> x86_64      buildonly-randconfig-001-20260110    gcc-14
> x86_64      buildonly-randconfig-002-20260110    clang-20
> x86_64      buildonly-randconfig-002-20260110    gcc-14
> x86_64      buildonly-randconfig-003-20260110    clang-20
> x86_64      buildonly-randconfig-003-20260110    gcc-14
> x86_64      buildonly-randconfig-004-20260110    gcc-14
> x86_64      buildonly-randconfig-005-20260110    gcc-14
> x86_64      buildonly-randconfig-006-20260110    gcc-14
> x86_64                              defconfig    gcc-14
> x86_64                                  kexec    clang-20
> x86_64                randconfig-001-20260110    clang-20
> x86_64                randconfig-002-20260110    clang-20
> x86_64                randconfig-002-20260110    gcc-14
> x86_64                randconfig-003-20260110    clang-20
> x86_64                randconfig-004-20260110    clang-20
> x86_64                randconfig-005-20260110    clang-20
> x86_64                randconfig-005-20260110    gcc-14
> x86_64                randconfig-006-20260110    clang-20
> x86_64                randconfig-011-20260110    clang-20
> x86_64                randconfig-012-20260110    clang-20
> x86_64                randconfig-012-20260110    gcc-14
> x86_64                randconfig-013-20260110    clang-20
> x86_64                randconfig-013-20260110    gcc-14
> x86_64                randconfig-014-20260110    clang-20
> x86_64                randconfig-015-20260110    clang-20
> x86_64                randconfig-015-20260110    gcc-14
> x86_64                randconfig-016-20260110    clang-20
> x86_64                randconfig-071-20260110    clang-20
> x86_64                randconfig-072-20260110    clang-20
> x86_64                randconfig-073-20260110    clang-20
> x86_64                randconfig-074-20260110    clang-20
> x86_64                randconfig-075-20260110    clang-20
> x86_64                randconfig-075-20260110    gcc-14
> x86_64                randconfig-076-20260110    clang-20
> x86_64                randconfig-076-20260110    gcc-14
> x86_64                               rhel-9.4    clang-20
> x86_64                           rhel-9.4-bpf    gcc-14
> x86_64                          rhel-9.4-func    clang-20
> x86_64                    rhel-9.4-kselftests    clang-20
> x86_64                         rhel-9.4-kunit    gcc-14
> x86_64                           rhel-9.4-ltp    gcc-14
> x86_64                          rhel-9.4-rust    clang-20
> xtensa                            allnoconfig    clang-22
> xtensa                           allyesconfig    clang-22
> xtensa                randconfig-001-20260110    clang-22
> xtensa                randconfig-001-20260110    gcc-10.5.0
> xtensa                randconfig-002-20260110    clang-22
> xtensa                randconfig-002-20260110    gcc-15.2.0
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Lee Jones [李琼斯]

