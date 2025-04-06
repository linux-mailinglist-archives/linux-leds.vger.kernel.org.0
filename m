Return-Path: <linux-leds+bounces-4421-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E9A7CDEB
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 14:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286E13A7BA2
	for <lists+linux-leds@lfdr.de>; Sun,  6 Apr 2025 12:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B30821770D;
	Sun,  6 Apr 2025 12:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1MP2YPR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08238FA3;
	Sun,  6 Apr 2025 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743943064; cv=none; b=HMtiLh27bJvBgp7Fjdiuk3HLcUHhtGUNrnoGVdU6iOdefq/sFAPcX2Ft4e9Ds5giv4E0i6MHqjNvz3ybZ30PcsUIF8+sp8Rj1byXoJ6q5wIxqSrefnFTTKrgoM2zGWcd5U4RPH2kJoJzl/F82XkKXNFBZEKfZrQkVWCpwdYf/JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743943064; c=relaxed/simple;
	bh=sXA9qv75igJGtLZcRB/vSFTExIhtqUFpo52VyF6a9wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMhAGeH04KHSZW/iKiXJd7B85rlKHQ5szeESt1tz7ZEvuSCdsyl90Y3Q4Cn8ESBR/1yVCQwTH59Y3RG+zGoSn4gS0wA3V13x3qh0VpWVlDL8abMG/cvbgsdLxxIG3VgIIionM5ba0WpCIq1pqFfjpVIO4XUBsenQOlME5sy+gzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1MP2YPR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743943063; x=1775479063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sXA9qv75igJGtLZcRB/vSFTExIhtqUFpo52VyF6a9wQ=;
  b=A1MP2YPRAGG9two5HcWixo7k27aYmwdw4RgqPpzJCPsh/lakzq0zLj5u
   2yIyq4h5y47a2IMSZfsVYFdAv8izyij3pqRQ6slQZFuIFte9KNojL4EFm
   vk1TKqXHObxluyBppit3y1xfo5RRet5Lx9auYgLtDaMRMp/P+/U9Dtv4A
   s3XtI1voaVgevtTDZC0nENXva9pqKb09UiC6Y5iEYAwzze0UhejvPRDeM
   ztHkAjbFaBz6KM7KEmrRC6uhHRM85NNPCHFUSgPSg7FsySBsLtopmK7y5
   xq3mxfErsgsGNe6tMH5fxGNMGExEbiOgtVogg2HPLrC5jqC5iSPO8UYC4
   g==;
X-CSE-ConnectionGUID: prbVtzyySiidnH9ijzMBPw==
X-CSE-MsgGUID: NRJFVEziSIO56BhjFlz7Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45348430"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45348430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:37:43 -0700
X-CSE-ConnectionGUID: yvoGIRNCR8KJj21q9gKvDw==
X-CSE-MsgGUID: E09wiPGEQSCfreJE5TRGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="164900186"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:37:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1PFp-00000009kLi-2xzN;
	Sun, 06 Apr 2025 15:37:37 +0300
Date: Sun, 6 Apr 2025 15:37:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v1 1/1] leds: pca955x: Avoid potential overflow when
 filling default_label
Message-ID: <Z_J1kV6P3CgaE5WF@smile.fi.intel.com>
References: <20250404162849.3650361-1-andriy.shevchenko@linux.intel.com>
 <202504050256.SYq06TxB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504050256.SYq06TxB-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 05, 2025 at 02:58:17AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on v6.14]
> [cannot apply to lee-leds/for-leds-next linus/master next-20250404]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-pca955x-Avoid-potential-overflow-when-filling-default_label/20250405-003054
> base:   v6.14
> patch link:    https://lore.kernel.org/r/20250404162849.3650361-1-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v1 1/1] leds: pca955x: Avoid potential overflow when filling default_label
> config: powerpc-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050256.SYq06TxB-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050256.SYq06TxB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504050256.SYq06TxB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/leds/leds-pca955x.c: In function 'pca955x_probe':
> >> drivers/leds/leds-pca955x.c:554:53: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
>         snprintf(default_label, sizeof(default_label), "%u", i);
>                                                         ^~
>    drivers/leds/leds-pca955x.c:554:52: note: directive argument in the range [0, 4294967294]
>         snprintf(default_label, sizeof(default_label), "%u", i);
>                                                        ^~~~
>    drivers/leds/leds-pca955x.c:554:5: note: 'snprintf' output between 2 and 11 bytes into a destination of size 8
>         snprintf(default_label, sizeof(default_label), "%u", i);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Nice, different GCC have different level of issue here. I will address this
in v2.

-- 
With Best Regards,
Andy Shevchenko



