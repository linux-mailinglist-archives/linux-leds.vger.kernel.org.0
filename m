Return-Path: <linux-leds+bounces-1952-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59030909B9C
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 06:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F184C282A56
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 04:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF3316C85F;
	Sun, 16 Jun 2024 04:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fqx8h6pE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C5F4AEFA;
	Sun, 16 Jun 2024 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718513480; cv=none; b=p/F8FP/rS6I78hNyksj8YwnScuLvYqZpCSh0eVnXttQFu44pWXR8YBQrp7ufRnol7z5ZvdAMdWm4LHVgNuEFNR76TFLqJkYkBPoitTSjxK15949Xf7xoVrTEAhsvMLEd10nEsdcG7RKC9+lJ0COBoOuWtQMsSlpcWLx30SwuoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718513480; c=relaxed/simple;
	bh=/InjF29MPf8V3lC77yLOAVursW6djt/o+LT6CnjYmH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wr9YcDhtwcQ0dTl+ObvsHBTqIilUwmYIz0lKG/ylon4rPYgpSM+I6Vg+OTobSOcDKSSdlTUudAx8mPieZn3YC6yqmP3eXGxx6IFhFvrWjW7+Bb5wK1FvQbvSUcNaEN4NlQYrJmhS0Hw/MM3DJIY71cxXIDDHq0lc9JamBQAmxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fqx8h6pE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718513480; x=1750049480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/InjF29MPf8V3lC77yLOAVursW6djt/o+LT6CnjYmH0=;
  b=Fqx8h6pEH6KwEoObLX4sxQnYFhmPuHsXZqS2YvMFvGJAAfhatdUf56AW
   Q2s0khsFAm1ODYu615A8O6NYxBOXmT7eeUzj3YqhiDa02mkXRTazIJNQV
   ewjvytuPBeQog8tkrmEzoF0JovgTiRZ9PSXh+muW/k75g1zzc1XJm6qX4
   b167fdCdn0cvLVhxKu+DTiuELODdNYpCodwvNY8tL9kkT1Qd5wwCgxW5m
   0t3oEZHxQl4qJ2qXxMmBbXCFrYBww+pAAIp3zzwlFov5llsMjsYC1wQv8
   ePLTG7AsAjtkSX/JVAoTudqbikMJsYCzRM9S1V/Dy0QXQY8EfFnUxexAF
   g==;
X-CSE-ConnectionGUID: p1aSEMvlTuGLz76PiSTZ3Q==
X-CSE-MsgGUID: sI8yH49nSKafJ9uN++QvYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="26481084"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="26481084"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 21:51:19 -0700
X-CSE-ConnectionGUID: Cvb//OswRxCb5G2Z0TMUJA==
X-CSE-MsgGUID: O65UMOOkSAumAr76i7zO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45427789"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2024 21:51:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIhrG-0000tK-0e;
	Sun, 16 Jun 2024 04:51:14 +0000
Date: Sun, 16 Jun 2024 12:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 03/20] leds: leds-lp55xx: generalize stop_all_engine OP
Message-ID: <202406161215.GdZijN9e-lkp@intel.com>
References: <20240615231152.28201-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615231152.28201-4-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc3 next-20240613]
[cannot apply to lee-leds/for-leds-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-limit-pwr-sel-property-to-ti-lp8501/20240616-071915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240615231152.28201-4-ansuelsmth%40gmail.com
patch subject: [PATCH v5 03/20] leds: leds-lp55xx: generalize stop_all_engine OP
config: i386-buildonly-randconfig-004-20240616 (https://download.01.org/0day-ci/archive/20240616/202406161215.GdZijN9e-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161215.GdZijN9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161215.GdZijN9e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_wait_opmode_done':
>> drivers/leds/leds-lp55xx-common.c:53:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~


vim +/ret +53 drivers/leds/leds-lp55xx-common.c

    49	
    50	static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
    51	{
    52		struct lp55xx_device_config *cfg = chip->cfg;
  > 53		int ret;
    54		u8 val;
    55	
    56		/*
    57		 * Recent chip supports BUSY bit for engine.
    58		 * Check support by checking if val is not 0.
    59		 * For legacy device, sleep at least 153 us.
    60		 */
    61		if (cfg->engine_busy.val)
    62			read_poll_timeout(lp55xx_read, ret, !(val & cfg->engine_busy.mask),
    63					  LP55XX_CMD_SLEEP, LP55XX_CMD_SLEEP * 10, false,
    64					  chip, cfg->engine_busy.addr, &val);
    65		else
    66			usleep_range(LP55XX_CMD_SLEEP, LP55XX_CMD_SLEEP * 2);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

