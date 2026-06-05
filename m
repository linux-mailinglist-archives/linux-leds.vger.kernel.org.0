Return-Path: <linux-leds+bounces-8509-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6q7XBwUeI2qniwEAu9opvQ
	(envelope-from <linux-leds+bounces-8509-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 21:05:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32064AD4A
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 21:05:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fFZD6dEA;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8509-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8509-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C70273045446
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 19:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DDE40BCB2;
	Fri,  5 Jun 2026 19:05:07 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1540BCC4
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 19:05:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686307; cv=none; b=j8VXg/UCuENnYiMNW6sa6tgk1ptcIQvuWdpF8nF8SCKwWVQUG/vtkYjwwXbv+0N6uUk8YJEdszXG1577Ip0EKnzMirhw9ixGZLxr8TslHBAjUwjIqaQP1kb/HlAhBdeETqsdgdDs1xUDKL8TANdd34/nE1pDu+K0jUlBCDu8hMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686307; c=relaxed/simple;
	bh=CIHKEZ2xR6fQczveaOeAQsmaogRfZs1kBnFZsOqeKTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=piB4YPGM8HpEYNQzW0bbhuPhu7n9dWFwEXwd9whQM3CiTvhA4sh4CBPBc89aMGL15L5uigBZfh+Bpmm08PyGA4ebUg1b0oqyr7dndzMkUP02ITzscdtvJn6fBcAzragPVgk31HbtjMPtt//XsP84JkGD2BwNqTKOv3f63+QDEW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFZD6dEA; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780686304; x=1812222304;
  h=date:from:to:cc:subject:message-id;
  bh=CIHKEZ2xR6fQczveaOeAQsmaogRfZs1kBnFZsOqeKTA=;
  b=fFZD6dEAnrTjp9PMR8+VP1Stjrsqvtx0WwpcKUThf1bX9sdAdylDDyIn
   +H341ioaA0zGH1DXfVNtMzanVzlHAEsedNjNKSVkUfcouKAGBJtyAhH5h
   zMk71EBfgPnM5GVgr9Cc8OtgPnmCpvUNOGbMcCnrhI2X+P+v92VmFZS9c
   O8PEXyeor/+nBUzfiWygBzx9kwl4XeGr7XQ66XcNlVnP/BFzuAxFJg1Ly
   pttACTL9D7eYqVOygdAZHG1DxuWvZm8A06uaSNKzD1qtaQONaOSs2TH56
   lT52xoE6BlFx6hUw23YVYy7N/GFwbN1Wca3nQE4olfXbMw62MnBHXAmEl
   Q==;
X-CSE-ConnectionGUID: NgpvEYcmT4GphiBUKPG1hQ==
X-CSE-MsgGUID: 3f3hTHTlSv2zZ5pdlYUiyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81434738"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="81434738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 12:05:03 -0700
X-CSE-ConnectionGUID: hO+q+5O2TcOYHkluJXbOyg==
X-CSE-MsgGUID: ud1nj1m/Tka6BMZntEF9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="244076793"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jun 2026 12:05:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVZqk-00000000GNy-0I2Z;
	Fri, 05 Jun 2026 19:04:58 +0000
Date: Sat, 06 Jun 2026 03:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 a2263676302a4eec40af93b3829f1d3d5aade93c
Message-ID: <202606060318.bOVBWepW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8509-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:mid,intel.com:from_mime,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A32064AD4A

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: a2263676302a4eec40af93b3829f1d3d5aade93c  leds: Fix CONFIG_OF dependency for LEDS_LP5860_CORE

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606052113.SVU1F2CZ-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202606052139.rVWUP0Hn-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202606052213.CzcS7Ap7-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202606052337.5WHsvu5q-lkp@intel.com

    drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
    drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
    drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
    drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- arc-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- arm-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- arm64-allmodconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- csky-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- hexagon-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- i386-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- i386-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- m68k-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- m68k-allyesconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- microblaze-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- microblaze-randconfig-r073-20260605
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- mips-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- mips-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- nios2-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- openrisc-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- parisc-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- parisc-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- powerpc-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- riscv-allmodconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- riscv-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- s390-allmodconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- s390-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- sh-allmodconfig
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- sh-allyesconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- sparc64-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- um-allmodconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- um-allyesconfig
|   `-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
|-- x86_64-allmodconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|-- x86_64-allyesconfig
|   |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
|   `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h-file-not-found
`-- xtensa-allyesconfig
    |-- drivers-leds-flash-leds-s2m-flash.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory
    `-- drivers-leds-rgb-leds-s2m-rgb.c:fatal-error:linux-mfd-samsung-s2mu005.h:No-such-file-or-directory

elapsed time: 1298m

configs tested: 162
configs skipped: 10

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260605    gcc-8.5.0
arc                   randconfig-002-20260605    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260605    gcc-10.5.0
arm                   randconfig-002-20260605    gcc-13.4.0
arm                   randconfig-003-20260605    clang-23
arm                   randconfig-004-20260605    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260605    gcc-9.5.0
arm64                 randconfig-002-20260605    gcc-10.5.0
arm64                 randconfig-003-20260605    gcc-11.5.0
arm64                 randconfig-004-20260605    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260605    gcc-16.1.0
csky                  randconfig-002-20260605    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260605    clang-20
hexagon               randconfig-002-20260605    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260605    clang-22
i386        buildonly-randconfig-002-20260605    clang-22
i386        buildonly-randconfig-003-20260605    clang-22
i386        buildonly-randconfig-004-20260605    clang-22
i386        buildonly-randconfig-005-20260605    gcc-12
i386        buildonly-randconfig-006-20260605    gcc-14
i386                                defconfig    clang-22
i386                  randconfig-001-20260605    clang-20
i386                  randconfig-002-20260605    clang-20
i386                  randconfig-003-20260605    gcc-14
i386                  randconfig-004-20260605    gcc-14
i386                  randconfig-005-20260605    clang-20
i386                  randconfig-006-20260605    gcc-14
i386                  randconfig-007-20260605    clang-20
i386                  randconfig-011-20260605    clang-22
i386                  randconfig-012-20260605    clang-22
i386                  randconfig-013-20260605    clang-22
i386                  randconfig-014-20260605    clang-22
i386                  randconfig-015-20260605    clang-22
i386                  randconfig-016-20260605    clang-22
i386                  randconfig-017-20260605    clang-22
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260605    clang-18
loongarch             randconfig-002-20260605    gcc-16.1.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260605    gcc-8.5.0
nios2                 randconfig-002-20260605    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260605    gcc-8.5.0
parisc                randconfig-002-20260605    gcc-11.5.0
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260605    gcc-8.5.0
powerpc               randconfig-002-20260605    gcc-9.5.0
powerpc64             randconfig-001-20260605    clang-23
powerpc64             randconfig-002-20260605    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260605    gcc-8.5.0
riscv                 randconfig-002-20260605    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260605    clang-23
s390                  randconfig-002-20260605    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260605    gcc-16.1.0
sh                    randconfig-002-20260605    gcc-10.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260605    gcc-8.5.0
sparc                 randconfig-002-20260605    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-23
sparc64               randconfig-001-20260605    clang-23
sparc64               randconfig-002-20260605    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260605    clang-23
um                    randconfig-002-20260605    clang-22
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260605    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260605    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260605    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260605    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260605    gcc-14
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260605    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-004-20260605    gcc-13
x86_64                randconfig-011-20260605    clang-20
x86_64                randconfig-012-20260605    gcc-14
x86_64                randconfig-013-20260605    clang-20
x86_64                randconfig-014-20260605    clang-20
x86_64                randconfig-015-20260605    gcc-14
x86_64                randconfig-016-20260605    clang-20
x86_64                randconfig-071-20260605    gcc-14
x86_64                randconfig-072-20260605    gcc-14
x86_64                randconfig-073-20260605    clang-22
x86_64                randconfig-074-20260605    gcc-14
x86_64                randconfig-075-20260605    gcc-12
x86_64                randconfig-076-20260605    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260605    gcc-12.5.0
xtensa                randconfig-002-20260605    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

