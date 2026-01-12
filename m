Return-Path: <linux-leds+bounces-6625-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0FD141F8
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jan 2026 17:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5907030B0284
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jan 2026 16:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE936366DC1;
	Mon, 12 Jan 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crpvPHEn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95582DA771;
	Mon, 12 Jan 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235921; cv=none; b=Jq9Iqp0sve4Ej33nFG8kVQsi0QTd0tbtNJbP1pjv25OWiSKxD6WMG5v9i1BI5r0dULZ1IjtQmQKw1tz3rw69mSo5iN2d66IUVcnPy7pB7v/VNDG4Zt/OBs+2fol9nqmDdFVjtO5LpsWkQw0aCKkjf+owYlTbgVprJGxv5s3jXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235921; c=relaxed/simple;
	bh=1BjozNva2gaBLg6k04odG9/IkL7rt3VXY1ysguxcyVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGXn4oMSNcXkVchHUL4UM2lx7gsjKStPwQR3H0qEZxAAEfdMIGPlMqCZ4WHSVJV4vtuhwqYyc78kDF8aEqWTIuOEQTX7IhBeY+C2QWAEIGT+7lq1G2g0aRNy5N9k4otYEVLSrgvlLDzCLFmRk0gqJVMTl6JOceYYxlsqTOGexMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crpvPHEn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768235919; x=1799771919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1BjozNva2gaBLg6k04odG9/IkL7rt3VXY1ysguxcyVI=;
  b=crpvPHEnvBSlYueAZfi88snxOKiR6c/CkAWb93qKVekRZJ7oeVr9qjx4
   8/CkRW3GaQE/Fk3r9nFZPXDjpZq1fwpvTlYnLnhy8k1C5ICvGDHmTqNRK
   0OpYW4tcAx8fxtUOP/YiZiEDd8X0U+TrVUhy/It+AcuTRe0eHXQtnsKS0
   Zb82hcqnmTGoGjgHMWodpxxjoSlnYE0rA5x7OC6x6OarC73ccYp1kW7Mf
   4Q+loaovBAgfvGTMOUu2xIJviW1u7YROe7VtxYHOPzm+8GW+jwxEcUVne
   GrScjSdFDL1GARMt70ij7vHKz1WzNAGjdUBrbCddKwryFvWR1DJosG83b
   g==;
X-CSE-ConnectionGUID: /7E2OMO3SkmJ9KAsIuyWQw==
X-CSE-MsgGUID: e+tZzl08R5uPNMZ6Inyt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69439347"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69439347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:38:39 -0800
X-CSE-ConnectionGUID: HjepE92rSi+YewpXaVU9aA==
X-CSE-MsgGUID: Wz3E33p6RWSK5dS3rQ16Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="235372759"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2026 08:38:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfKw5-00000000DaI-409o;
	Mon, 12 Jan 2026 16:38:33 +0000
Date: Tue, 13 Jan 2026 00:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Edelweise Escala <edelweise.escala@analog.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Edelweise Escala <edelweise.escala@analog.com>
Subject: Re: [PATCH v2 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Message-ID: <202601122335.DZgiMBky-lkp@intel.com>
References: <20260112-ltc3220-driver-v2-2-d043058fc4df@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-ltc3220-driver-v2-2-d043058fc4df@analog.com>

Hi Edelweise,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8856d7fe1758937ac528770f552ec58c388c255b]

url:    https://github.com/intel-lab-lkp/linux/commits/Edelweise-Escala/dt-bindings-leds-Add-LTC3220-18-channel-LED-Driver/20260112-170223
base:   8856d7fe1758937ac528770f552ec58c388c255b
patch link:    https://lore.kernel.org/r/20260112-ltc3220-driver-v2-2-d043058fc4df%40analog.com
patch subject: [PATCH v2 2/2] leds: ltc3220: Add Support for LTC3220 18 channel LED Driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260112/202601122335.DZgiMBky-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122335.DZgiMBky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601122335.DZgiMBky-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-ltc3220.c:348:12: warning: 'ltc3220_resume' defined but not used [-Wunused-function]
     348 | static int ltc3220_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/leds/leds-ltc3220.c:340:12: warning: 'ltc3220_suspend' defined but not used [-Wunused-function]
     340 | static int ltc3220_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/ltc3220_resume +348 drivers/leds/leds-ltc3220.c

   339	
 > 340	static int ltc3220_suspend(struct device *dev)
   341	{
   342		struct i2c_client *client = to_i2c_client(dev);
   343		struct ltc3220_state *ltc3220_state = i2c_get_clientdata(client);
   344	
   345		return ltc3220_shutdown(ltc3220_state);
   346	}
   347	
 > 348	static int ltc3220_resume(struct device *dev)
   349	{
   350		struct i2c_client *client = to_i2c_client(dev);
   351		struct ltc3220_state *ltc3220_state = i2c_get_clientdata(client);
   352	
   353		return ltc3220_resume_from_shutdown(ltc3220_state);
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

