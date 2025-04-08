Return-Path: <linux-leds+bounces-4445-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B49A7F359
	for <lists+linux-leds@lfdr.de>; Tue,  8 Apr 2025 05:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C3A3ADA1D
	for <lists+linux-leds@lfdr.de>; Tue,  8 Apr 2025 03:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE15E25F794;
	Tue,  8 Apr 2025 03:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBb1sDGw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BB81C6B4;
	Tue,  8 Apr 2025 03:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084585; cv=none; b=HCi/8QBgM42PhLylr6BMwevkrAcnaFWduwoJPGRVSeAYAsayZ90sGLK3s4EPYun/8XviPocUoOvkaxONYyLeUryBwb27qKrN/HoRGNJ3ZL5CZTXtZ03Zgf4Cz1L7RSt3IAY91BEz/B0mYQXLpjeeFuD5UVwNyk59JjRownAsFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084585; c=relaxed/simple;
	bh=6nM+a9P+AflVQBvgcnpoJN0HDDMjdC2INdvympzIzCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI+Pk9XssXOZFL6C6faj0oDE9hi5z/9DoKkEzDN3nmmrw3D8gqEDM+iwoZFP+9YtGF7V5oy4Lml2hsq0W3i23l4O4H7xWMWBqVQFxG7XvmRpK2GzfjkvriuFtF6qxyhiRksNpZmv+6BRjq57Jd58w8xL4rOlwvi2xtsY4/eGdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBb1sDGw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744084584; x=1775620584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6nM+a9P+AflVQBvgcnpoJN0HDDMjdC2INdvympzIzCk=;
  b=mBb1sDGw3Pv4FBHowEM7JdJhfQvsOCVxmN5RpkLbdjgiNpRP1QlE09N+
   HEqFWt5nCq7+CnQmqY6f9WDHEHuhrQQ9TvuUv9WfOCtNOVAlxJjk/gPS5
   YBwkLd64u4XpbVDVTegXhr269/dD+/6TEo14dvya2e1ekQMi4uGNXGLVg
   8bMB+ap7czMnhs+Vim7+nhRLLCn/IqWf4fdO+8mq8ozmprTYYcU7/flzK
   gOb27W9h5gb5vfyZGo6MDgG/CqXdlSxft6wk/X8PkZckwQCHGpurjN5lf
   FNXEo1O2QDrIabRCU8/tkTP094Ck+03aLSZXZ5LnGKQv3mhP4XmxxcoMR
   A==;
X-CSE-ConnectionGUID: HUS/AZitQhCa9wi9JAYIAQ==
X-CSE-MsgGUID: hN4kTF0rQoW4CtKit77rqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55684049"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="55684049"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:56:23 -0700
X-CSE-ConnectionGUID: azDhbRetRsqFQc/6skcgwg==
X-CSE-MsgGUID: sbZr6CaxR1mYR5mffhSuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128476400"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 20:56:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u204P-000463-1E;
	Tue, 08 Apr 2025 03:56:17 +0000
Date: Tue, 8 Apr 2025 11:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
	Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Message-ID: <202504081106.mAYfJsQj-lkp@intel.com>
References: <20250407095119.588920-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-4-mitltlatltl@gmail.com>

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next lee-backlight/for-backlight-fixes linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-backlight-kinetic-ktz8866-add-ktz8866-slave-compatible/20250407-175635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250407095119.588920-4-mitltlatltl%40gmail.com
patch subject: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
config: sparc64-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081106.mAYfJsQj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081106.mAYfJsQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081106.mAYfJsQj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/ktz8866.c: In function 'ktz8866_read':
>> drivers/video/backlight/ktz8866.c:73:39: error: passing argument 3 of 'regmap_read' from incompatible pointer type [-Wincompatible-pointer-types]
      73 |         regmap_read(ktz->regmap, reg, &val);
         |                                       ^~~~
         |                                       |
         |                                       unsigned int **
   In file included from drivers/video/backlight/ktz8866.c:17:
   include/linux/regmap.h:1297:69: note: expected 'unsigned int *' but argument is of type 'unsigned int **'
    1297 | int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
         |                                                       ~~~~~~~~~~~~~~^~~


vim +/regmap_read +73 drivers/video/backlight/ktz8866.c

    69	
    70	static inline void ktz8866_read(struct ktz8866 *ktz, unsigned int reg,
    71					unsigned int *val)
    72	{
  > 73		regmap_read(ktz->regmap, reg, &val);
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

