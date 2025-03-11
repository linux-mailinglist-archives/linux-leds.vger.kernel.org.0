Return-Path: <linux-leds+bounces-4231-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B6A5BECB
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 12:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A032E3A97DF
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 11:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC4C2505AC;
	Tue, 11 Mar 2025 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3HAGsCR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34C225776;
	Tue, 11 Mar 2025 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741692080; cv=none; b=K7Rhu20Uxp6nGvY7zzKPmSzyx/0MFYl0acdvbFACH6h9aiSVExj2iah2jcUC0liFfsR/8Zyu54Gf2tB0T2NVZtgnpLZw1/cFBCow9/CtJI8p8wamSsOI4WQDMrpP9TFiUecDDLhIPnQwqOMQR2A4kW6lkUhnS5RjgYQUWm81NWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741692080; c=relaxed/simple;
	bh=nnIQqMrvpootJdeosqnzjSHdzPQS3AA2sGWdn9jPN9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daOezmBwuQRsu0P1L1EC1Tk3M7BjhsGzWNxTcBNbe0Sdj8dVm8E213NiEgqIhbRqfJbCrGS1KNAXSpNWMqKTElHyny7J+VjdQasKvDL8ZLwbonsqBwk5c05hjmVZExKLLnM+xk5LmTUfs4FR4ZOvjZ8du9GlUK+iFpHvYgR+Qag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3HAGsCR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741692079; x=1773228079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nnIQqMrvpootJdeosqnzjSHdzPQS3AA2sGWdn9jPN9Y=;
  b=P3HAGsCRRycGYd+qbk0Vhu4hcTV9qmIauxfMaUpeLdMjauv4paYwTw7s
   erHoSS096xFOWofu48jWK66ItDYoCz/yUb6ZRgDLGVzdprO0xt2+WoSFi
   lumx+V1AsYFOOL3IMrFTuOZPZqatrhsmyC4KjAA5s8LBDS1oMzWsIsioz
   3hBJxekgKjQIZeyg4EWZvubWJ+SKYUXzdlpzzERq2+QW1IYh+PU6mWi5N
   ju8iA6joQ2gdM19iaHer4bZyMmMhAOJmM+MHEzKVTU2OHm9zAz7QuxeuP
   HsFOkTHj/99YcQKRj415spKvcntaulHl8ddgyKlbhHXJAMDFUTQecD75B
   g==;
X-CSE-ConnectionGUID: Af1Vl8VtTmqI2YtJm7scgg==
X-CSE-MsgGUID: kJMyY+SmRgmWb+4rVs6iGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53350823"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="53350823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 04:21:18 -0700
X-CSE-ConnectionGUID: AARiflbFSIGPsZWc9OUZnw==
X-CSE-MsgGUID: tjfMSEz4RMK62L9a6p2iMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="121000004"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Mar 2025 04:21:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trxfX-0006bg-18;
	Tue, 11 Mar 2025 11:21:09 +0000
Date: Tue, 11 Mar 2025 19:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, pavel@kernel.org, lee@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
Message-ID: <202503111910.ko7pwUem-lkp@intel.com>
References: <20250306172126.24667-4-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306172126.24667-4-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.14-rc6 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-Add-LP5812-LED-driver/20250307-012604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250306172126.24667-4-trannamatk%40gmail.com
patch subject: [PATCH v3 3/3] leds: add new LED driver for TI LP5812
config: x86_64-randconfig-077-20250310 (https://download.01.org/0day-ci/archive/20250311/202503111910.ko7pwUem-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111910.ko7pwUem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111910.ko7pwUem-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "lp5812_disable_all_leds" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_enable_disable" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_set_pwm_dimming_scale" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_get_pwm_dimming_scale" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_read" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_set_phase_align" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_get_phase_align" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_read_aep_status" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_read_auto_pwm_value" [drivers/leds/leds-lp5812.ko] undefined!
>> ERROR: modpost: "lp5812_read_lsd_status" [drivers/leds/leds-lp5812.ko] undefined!
WARNING: modpost: suppressed 23 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

