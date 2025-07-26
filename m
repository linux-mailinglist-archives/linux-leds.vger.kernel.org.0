Return-Path: <linux-leds+bounces-5140-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264FB12CC5
	for <lists+linux-leds@lfdr.de>; Sat, 26 Jul 2025 23:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82661189FD23
	for <lists+linux-leds@lfdr.de>; Sat, 26 Jul 2025 21:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8DD2222A1;
	Sat, 26 Jul 2025 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRu/PbZN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93B21D3E4;
	Sat, 26 Jul 2025 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753566635; cv=none; b=s1qjNOmGyKHLXjW0JxcMnrkYKpowodJR0i/wvVEiTSR+3/hI5uCw9Tvw3gM6SG+uadLGnFjEcgy2G2U7Nve/g4tsRvpZophnqtxO/KHcP/KHmutiSjDeZP8xh7QZxSWkgUWQYFXK1NbnJryweDIxpqk5dKtBUe/BB60inyP5f2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753566635; c=relaxed/simple;
	bh=hSbqujNyJtfgoVzH7Vax+KT9pmAhM1E22Hv7yYf+bQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB3z7H0kKX0IardTUCFOqZZkMeyoWdYmbUaOUvacnikxaiPvy6hg5DoZgofsTmgG/78mUMTx6zjylmG6ZFjZNu/7cQun7GXUms40qZwt5mJZ26Maps0LZqR80MLqrNOn5zlqPklcLIaQDqxaXOQMjSlk0B4k2wyjRDtSz0XqdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRu/PbZN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753566635; x=1785102635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hSbqujNyJtfgoVzH7Vax+KT9pmAhM1E22Hv7yYf+bQ0=;
  b=kRu/PbZN9ATlJCM6RgFcm1KZXVu8/K1qDjSdStQA+7hQFj2vX853tDwQ
   b1Inm0JXVsImfUPmiYHU3wxJsYAC0JOst1ZcD0CVvTWPX9d6LLXoZVgET
   GShMDfaz9J75+4gtWoWs9qckDXsO0Sq152BE8NcklaOfy3M0kc21wTOYe
   O+iuDAlX+585YuLoL39yo65ynCI8q16Mz3st1sar76A/R0rd4WtbWBQLq
   ML2udDvaUKmbt8p15XHzBuyCpWYdjtWRfOnM4J1J94k+kXFUDkDo40Em0
   j/BZ7D9dhVm5r2+sfCjnU4SRiOHmvtX2HnU3kB5hZe3fZtAI7igWvzBh3
   w==;
X-CSE-ConnectionGUID: RtzCWjH3SIGC2rKc8eN8Yw==
X-CSE-MsgGUID: qfffm11BQV2jbdSO2HJ8ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55721665"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55721665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 14:50:34 -0700
X-CSE-ConnectionGUID: YUbCUJRlSDSYtBKh9alZxQ==
X-CSE-MsgGUID: msO8MjvYQuO0CppyXIzicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192644434"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 14:50:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufmmg-000MJH-2B;
	Sat, 26 Jul 2025 21:50:26 +0000
Date: Sun, 27 Jul 2025 05:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>,
	Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Maud Spierings <maudspierings@gocontroll.com>,
	MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH 2/4] backlight: add max25014atg backlight
Message-ID: <202507270543.G0TT6f25-lkp@intel.com>
References: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>

Hi Maud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]

url:    https://github.com/intel-lab-lkp/linux/commits/Maud-Spierings-via-B4-Relay/dt-bindings-backlight-Add-max25014-bindings/20250725-191221
base:   d7af19298454ed155f5cf67201a70f5cf836c842
patch link:    https://lore.kernel.org/r/20250725-max25014-v1-2-0e8cce92078e%40gocontroll.com
patch subject: [PATCH 2/4] backlight: add max25014atg backlight
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250727/202507270543.G0TT6f25-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270543.G0TT6f25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270543.G0TT6f25-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/backlight/max25014.c:86:4: warning: variable 'res' is uninitialized when used here [-Wuninitialized]
      86 |                         res |= 1 << i;
         |                         ^~~
   drivers/video/backlight/max25014.c:82:13: note: initialize the variable 'res' to silence this warning
      82 |         uint8_t res, i;
         |                    ^
         |                     = '\0'
   1 warning generated.


vim +/res +86 drivers/video/backlight/max25014.c

    73	
    74	/**
    75	 * @brief get the bit mask for the DISABLE register.
    76	 *
    77	 * @param strings the led string configuration array.
    78	 * @return uint8_t bits to set in the register.
    79	 */
    80	static uint8_t strings_mask(struct max25014 *maxim)
    81	{
    82		uint8_t res, i;
    83	
    84		for (i = 0; i < 4; i++) {
    85			if (maxim->pdata->strings[i] == 0)
  > 86				res |= 1 << i;
    87		}
    88		return res;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

