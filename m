Return-Path: <linux-leds+bounces-5371-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40FB41300
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 05:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E1E4701180
	for <lists+linux-leds@lfdr.de>; Wed,  3 Sep 2025 03:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C15F2C21E4;
	Wed,  3 Sep 2025 03:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMWVH2qo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7E2C187;
	Wed,  3 Sep 2025 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756870419; cv=none; b=So7cXJnODXt34FUwLTGH4TjMCyv05po6QoYTArecn/oRwlHrS95SmaW9RPqbNZEkpNLw2QCWB1cJDByllT2Zme+pM8uquC5UCzEByWLclXM79zTP6ZsQEDBBqVRq7mnkUtwP/2apIA8EoXAObO3X9c/c5tvTMSQPI+qKkeZMzV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756870419; c=relaxed/simple;
	bh=KjJPPPnlF/4cG0K1w0Hbt1M1HCy1yQFWLgfhATomQTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEiSzjwJJwyuaUCTPPW+nZ2l850bu1rAEy6bcFiIdf2vZ9YpElFJQzkCAw6KHlX06Vgz1ZqIhHJ5NJmc22JaZBgCqF9LJO7yjDPyoQ+tSiLKicmaOwM2eH0srHwf31ZzJyU7GudW+qp9Qch7YC9arqbAO0plIR14NsGrK4x9G9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMWVH2qo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756870417; x=1788406417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KjJPPPnlF/4cG0K1w0Hbt1M1HCy1yQFWLgfhATomQTM=;
  b=gMWVH2qoWptkjPEppMMfZi4GTasfX8odRAj61mIeEGIgHa4vrVI4Z4yN
   FuWDtNZCM+ub7A4gEn/Uo+ll/edAkxbkDwSCXMFo4ktltLXWz1rSU/mGQ
   wtPZW4M6NytDFSJ6IUw7pjcY9MaWC1wUjd4zx0fqlLh6LbxpsbLw1Lj05
   gEdviNAeyEYW7MVOVvwRqCy1hznovE95VKB9Rt25KQNfvACy1Qy1UMGlC
   CwtWzMwA0oG9moez4vPUkAz+bWyuAFsUVjLInc8+cI1xNFc8OqT7d6d6q
   j6KYHGrbE0SqO2Ifqkq2zZZ18ayQt2eEIdyivjAO3aanes84Ay9/ZEcna
   g==;
X-CSE-ConnectionGUID: rJbzoJSGR1yoKLECuMZ6tw==
X-CSE-MsgGUID: YIT2tT4xSxa790QpIu3KQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76615094"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="76615094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 20:33:37 -0700
X-CSE-ConnectionGUID: jHvz5aTbTnqG+7nKH56bjQ==
X-CSE-MsgGUID: FdCLDxpbQbKRygIawc8dcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="176720839"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2025 20:33:32 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uteEZ-0003Jb-1x;
	Wed, 03 Sep 2025 03:32:53 +0000
Date: Wed, 3 Sep 2025 11:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
	Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
Message-ID: <202509031142.WBnVOXZW-lkp@intel.com>
References: <010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000@eu-west-1.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000@eu-west-1.amazonses.com>

Hi Aleksandrs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksandrs-Vinarskis/leds-led-class-Add-devicetree-support-to-led_get/20250902-191342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/010201990a1f6559-9e836a40-f534-4535-bd59-5e967d80559a-000000%40eu-west-1.amazonses.com
patch subject: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250903/202509031142.WBnVOXZW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031142.WBnVOXZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509031142.WBnVOXZW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/led-class.c:281:22: warning: no previous prototype for 'of_led_get' [-Wmissing-prototypes]
     281 | struct led_classdev *of_led_get(struct device_node *np, int index)
         |                      ^~~~~~~~~~


vim +/of_led_get +281 drivers/leds/led-class.c

   272	
   273	/**
   274	 * of_led_get() - request a LED device via the LED framework
   275	 * @np: device node to get the LED device from
   276	 * @index: the index of the LED
   277	 *
   278	 * Returns the LED device parsed from the phandle specified in the "leds"
   279	 * property of a device tree node or a negative error-code on failure.
   280	 */
 > 281	struct led_classdev *of_led_get(struct device_node *np, int index)
   282	{
   283		return __of_led_get(np, index, NULL);
   284	}
   285	EXPORT_SYMBOL_GPL(of_led_get);
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

