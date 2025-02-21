Return-Path: <linux-leds+bounces-4048-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CAEA3F224
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 11:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0483170446
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 10:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADFF204F93;
	Fri, 21 Feb 2025 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWTVpvlT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44173205501;
	Fri, 21 Feb 2025 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133889; cv=none; b=nNcgM1BLZU48K3ol6NF1vWcmXPrEWOhXRVSzX/oU7vlt7XmgUhdIsZvegnVFW9wsZKftUOXIi3KAh4zw8pbqDIk3jdlde1Wjcm85Kt5WmYI5af6i6ZnI4J5K0+PbhEa4zOZLsZK3EWqHeZHdrRYFlAnWy5QKznid3ktjQUqRCYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133889; c=relaxed/simple;
	bh=UOD81SOOv99aZPAdnSzK6KX7d0xxkiZrq3cW/CpKd4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ib5jWq75hpInh50u6lobQk0SMoRlgG83ly4TxnhJ9PKcHaJUcWjcMbhOQcVCctsSoYAf8Hd8tw9powZrga8VluQN5CpxJo3PXSvUqtiPPVVvNw71CQB2hRw3MTH82gNtoJY6ph9hrWjs7A5pFYfgKBpDCMk+DTyAfTrubNy21RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWTVpvlT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740133887; x=1771669887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOD81SOOv99aZPAdnSzK6KX7d0xxkiZrq3cW/CpKd4s=;
  b=LWTVpvlT15dM0Ml+rMQxje4/s4Toz8z4v10FEtj27R3SrEymu1T1BQGe
   AqqMEbtL5Pg/gjHjSdj91ekFVDm/fhVdIiPLXKWkjm5Ne4fhrZ8uTG8uD
   1LyArxKHWuT8yARSzfRKfqX66YcT0JGuOtBpZPE/htka96w2o32DwV4Bx
   e4K22sXYU1vQY7R7gnQzqXyPtAxVkGurzelE3cXfePaPUghh4Ov4fF4rt
   yDXU9TfNRX7lSP9Of4WsGvXzLz4lh+fr3ZnCeIc6hkrKhMObgX8N8VuJR
   eU6rRYPZj0IxG+pjtyCREdjxO+dl+CX8WJn0RXF2f0Tod+vwjoO3JFIZk
   g==;
X-CSE-ConnectionGUID: KV81JenzTwaV42YTdEk0bA==
X-CSE-MsgGUID: SC9NlRrCT1yY5cHdWBgbrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63422850"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="63422850"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 02:31:26 -0800
X-CSE-ConnectionGUID: Wi7D5EgORwu+yzzB+zKGBQ==
X-CSE-MsgGUID: nIAPelcTQEa2ho7+H5+r5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="138555009"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2025 02:31:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlQJW-0005ON-39;
	Fri, 21 Feb 2025 10:31:22 +0000
Date: Fri, 21 Feb 2025 18:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, pavel@kernel.org, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v1 2/2] leds: add new LED driver for TI LP5812
Message-ID: <202502211827.2FKKhUB7-lkp@intel.com>
References: <20250220181541.2341-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220181541.2341-3-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-Add-LP5812-LED-driver-bindings/20250221-021848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250220181541.2341-3-trannamatk%40gmail.com
patch subject: [PATCH v1 2/2] leds: add new LED driver for TI LP5812
reproduce: (https://download.01.org/0day-ci/archive/20250221/202502211827.2FKKhUB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211827.2FKKhUB7-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/leds/leds-lp5812.c: 10 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

