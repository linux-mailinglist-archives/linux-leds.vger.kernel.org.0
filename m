Return-Path: <linux-leds+bounces-4138-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0AA4CC30
	for <lists+linux-leds@lfdr.de>; Mon,  3 Mar 2025 20:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A68C1740CB
	for <lists+linux-leds@lfdr.de>; Mon,  3 Mar 2025 19:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F180D23312D;
	Mon,  3 Mar 2025 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/EvZNex"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD1D230BCC;
	Mon,  3 Mar 2025 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031332; cv=none; b=CKusIRONI2F0ClMJyhFqNvqPHVOVRzNycqc4NrlqNTLcym0JhP9iOrBQN1vm+22vfAng8F86ygjSflaWlwGeX+6lXRNSPuqnjF/gxR9sQZgrMUP39MwxAENO3fTKiODWdYkGHC5Weiw4R7TF/ziHVdhvq5VlO82+CMPjVfqXo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031332; c=relaxed/simple;
	bh=lBzLxz9LoAQhSV4qYBwW+SfQKCXYH6lsg4FbRLNjFV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+57TDWKOJtKPIixskSipxdTZOPVIekzIRHk30FplaDmgUtlUr89BQ/26gWA4Be3ZFx7FElDGAvoo/yrgkawIoKi7Ohb1RXkDprHPt73264ABhaCnx2GqIAtgRxTB0ODHi+S4xWj90lDmWKBdRtWb0wiV1QQCwQZVgkjrOvqGsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/EvZNex; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741031331; x=1772567331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lBzLxz9LoAQhSV4qYBwW+SfQKCXYH6lsg4FbRLNjFV8=;
  b=X/EvZNexwEYWSYVX+BU+pWcGo20q9FsbxjsrLKb6QIbVOvlCxIVTnxNX
   u1W12iJHaMTTP7IZAITSXFqHp6PY8R0VpC2N35+f+5HvcA7I1yKHKHJG6
   pk2eyBE2zXd4DDzSH3CBO2+Z/tu1L84ghZIMg+v5En9151xNT9A4771kU
   dL4lEMlkM/u7j1k6+zHwlcZjC1N0MqJlKzJNkS8J5HX/x81q1D2UeeiT3
   KbbaHUCQ3oXpjLEKG4DFHUBF5qrMe8JruftINYNdtkYzrVtYcbKxLGaA7
   D5axlfHG0cHRwJ1HxgyJ0X5o+R08zVAGe2pAYjkuchScsWjWVanznNcFp
   w==;
X-CSE-ConnectionGUID: UJd82ISCR3yLqRBfSGQJbA==
X-CSE-MsgGUID: EJMW1Pu4QAOh4tCw48IFuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53329438"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="53329438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 11:48:50 -0800
X-CSE-ConnectionGUID: f0lih0fqSzWhfKMbfsMU2A==
X-CSE-MsgGUID: QIYx0h9mR3CtXinwurqg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118135060"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2025 11:48:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpBmQ-000Isc-0p;
	Mon, 03 Mar 2025 19:48:46 +0000
Date: Tue, 4 Mar 2025 03:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, pavel@kernel.org, lee@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: add new LED driver for TI LP5812
Message-ID: <202503040306.gen0Ui0l-lkp@intel.com>
References: <20250225170601.21334-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225170601.21334-3-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-Add-LP5812-LED-driver-bindings/20250226-011634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250225170601.21334-3-trannamatk%40gmail.com
patch subject: [PATCH v2 2/2] leds: add new LED driver for TI LP5812
config: x86_64-randconfig-006-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040306.gen0Ui0l-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040306.gen0Ui0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040306.gen0Ui0l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i2c_register_driver
   >>> referenced by leds-lp5812.c:2313 (drivers/leds/leds-lp5812.c:2313)
   >>>               vmlinux.o:(lp5812_driver_init)
--
>> ld.lld: error: undefined symbol: i2c_del_driver
   >>> referenced by leds-lp5812.c:2313 (drivers/leds/leds-lp5812.c:2313)
   >>>               vmlinux.o:(lp5812_driver_exit)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

