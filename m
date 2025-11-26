Return-Path: <linux-leds+bounces-6314-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C38EFC8792C
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 01:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 708CD34B798
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 00:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CECE188735;
	Wed, 26 Nov 2025 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdNI1NrK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660345C0B
	for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764116366; cv=none; b=Hsu9rrMMJeaFQyA61cHlCPC47Elj0MbYl4n+D0sSbGa9N7BDIsURBo9Y+MJspTO6Bg46oDG2QmKpOKfojp9F2zaI9iGh4VLAOTORMpy0FXJyVhq/bIkvXtionyIejota/tMfz02S84nuGvmCbFtS/bu/2rdDbfgag+sJSngv2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764116366; c=relaxed/simple;
	bh=MNPChoMZYYGdrJ/8NS3zLiH9wE4ZPgS1bEZjk2lxMPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iNKtNtF7jFh3S4VLW/x+9gJbNqYFsULuNOmtFuOd2JX7ITWH2XHpn6yiL6r2xtvIfrYUKrkjcElvt3kXxnZh4RH1sewu2iwlaybdRuxdu1T8TRVspeCVnYYg/hDMS4iFPkYDdiC2487qWxi8wc6qPPEKSLpXcSz2+VEEUsnFPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdNI1NrK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764116365; x=1795652365;
  h=date:from:to:cc:subject:message-id;
  bh=MNPChoMZYYGdrJ/8NS3zLiH9wE4ZPgS1bEZjk2lxMPY=;
  b=QdNI1NrKvp+mF6cFEnvYeMRF7RNMUDH1eBvkPCw3/tp3jno5SCevdBvB
   kv+uWL3ro92eofzgljkZ9qjJ9dDlWHZC7KOZA5RbqA7RQ28vzovCckKOr
   FQt4/dVCupUbDgSCb9kBJIK3tBCPyHtP5bhhL3/Q1i3/7KOUzV1G8wrrw
   iMyDtoEucXEfCm2K+9fZhFzihtAAwVJcYfukigTqOCqMmNqMhEJX20BtO
   Kw5wwc5IhtOr7MvJMklCj+8KuUK6WZcuozMhkIP1tinO7WWvfJcFY+aqz
   uaUZth8WHpOn23drh9FiYkvDLff14Zf/K2ivIZbkPzurRr3ud3VcEh3hX
   g==;
X-CSE-ConnectionGUID: 0ZzQE61dQRSIaI0GEV8hKw==
X-CSE-MsgGUID: 0u/TbpuKS/C7DiVjtu3Pcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66030280"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="66030280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 16:19:25 -0800
X-CSE-ConnectionGUID: Adw2/WpYQPmCDLb//fVCyg==
X-CSE-MsgGUID: hGgFLImKTMyDh0ERqGPoug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="192802715"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2025 16:19:24 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO3Fh-000000002Nh-3TL1;
	Wed, 26 Nov 2025 00:19:21 +0000
Date: Wed, 26 Nov 2025 08:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 072cd5f458d76b9e15d89ebdaea8b5cb1312eeef
Message-ID: <202511260847.rnMWoYYW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 072cd5f458d76b9e15d89ebdaea8b5cb1312eeef  leds: rgb: leds-qcom-lpg: Don't enable TRILED when configuring PWM

elapsed time: 7581m

configs tested: 54
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.1.0
alpha        allyesconfig    gcc-15.1.0
arc          allmodconfig    gcc-15.1.0
arc           allnoconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm           allnoconfig    clang-22
arm          allyesconfig    gcc-15.1.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.1.0
csky         allmodconfig    gcc-15.1.0
csky          allnoconfig    gcc-15.1.0
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.1.0
m68k          allnoconfig    gcc-15.1.0
m68k         allyesconfig    gcc-15.1.0
microblaze    allnoconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
mips         allmodconfig    gcc-15.1.0
mips          allnoconfig    gcc-15.1.0
mips         allyesconfig    gcc-15.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.1.0
openrisc      allnoconfig    gcc-15.1.0
parisc       allmodconfig    gcc-15.1.0
parisc        allnoconfig    gcc-15.1.0
parisc       allyesconfig    gcc-15.1.0
powerpc      allmodconfig    gcc-15.1.0
powerpc       allnoconfig    gcc-15.1.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.1.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-22
s390         allyesconfig    gcc-15.1.0
sh           allmodconfig    gcc-15.1.0
sh            allnoconfig    gcc-15.1.0
sh           allyesconfig    gcc-15.1.0
sparc         allnoconfig    gcc-15.1.0
sparc64      allmodconfig    clang-22
um           allmodconfig    clang-19
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.1.0
xtensa       allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

