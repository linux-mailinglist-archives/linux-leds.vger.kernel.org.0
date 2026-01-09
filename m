Return-Path: <linux-leds+bounces-6608-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 273BCD0BFB6
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 19:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C121300A9EA
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 18:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A058B2DFA5B;
	Fri,  9 Jan 2026 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+jPJPgM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C52D1911
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985120; cv=none; b=RI+lSOG/5QX3TW+mxx9UBRRI9KwUHthjrY7CMcbnTYSRkqY3JR+xzoBhdb7IZ2FJgiw8bZTNwQSGLkBvTQrozP9NipaCHqPtjRIhDVywAWfhkv0FCcJ2FwXpEpaVk/V4OsPJVkoAE9zrRf0vVrrkQRB5DgrInkCCDGbZhOfvSQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985120; c=relaxed/simple;
	bh=KhDhzgN5zs7DionbTDi9/i7am+KuJRZmOhJaXtQS38A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cfM4Y+8mkrIdgMSbtg39+3GJVfZt+uBAoYaBxkgc7jxD3rnFO0xKKQF8b4gp0+72B7nOqG8xbz7LMTKi/kFGL/Oo6blWIPCHRNCuoLv3PpF+mvJr4gpY0LEWpxiMCrjfgwvsOLO4B8poWLgcpgMZFpPWtHqc9OcDeNEsIrvW5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+jPJPgM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767985119; x=1799521119;
  h=date:from:to:cc:subject:message-id;
  bh=KhDhzgN5zs7DionbTDi9/i7am+KuJRZmOhJaXtQS38A=;
  b=H+jPJPgMzywTbllofuWoS1K6h04Q30dtRp6dl1CBNc5pkHQJXBMRJX2/
   10vqDHf/wKMbSj24tbfnH4o7YbDdlsundB5dUIj5lJ8fLY5vPsl1VFe4C
   mHfEoI75kstj1d582T41FezjenoI8kTWuvYFrovrFRTpYIK9S5/792xTL
   2Iup4gRFWZXFCxYtf3+FoXOIIAwe9YdcWACX6T110v2d04IX0bcYMCqI9
   8Rwa3BaQvfiCvh3Mc77cIMXIecvDY2Xvps8+k0PV3wI7WLey1NwhnDcjd
   03gOdqjgIhb9CxxcJGtkugUwtF2TyTLsDU3jY4EktwRuU1AqdZolKPvs/
   A==;
X-CSE-ConnectionGUID: deOClUMYRXKYwQGNmgzueA==
X-CSE-MsgGUID: enedio2ITh6T+7IITyjIBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80088364"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80088364"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:58:39 -0800
X-CSE-ConnectionGUID: 0IOF3bQCR2iU4ECEzZZxcA==
X-CSE-MsgGUID: OYu+wpvGR5CaxZ/tumQ+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="226896075"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2026 10:58:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veHgx-000000007do-071R;
	Fri, 09 Jan 2026 18:58:35 +0000
Date: Sat, 10 Jan 2026 02:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 3/10]
 drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but
 not used
Message-ID: <202601100247.wetiMFXE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
commit: 51f7560294c911e9394357a903ffa28eebe4b253 [3/10] leds: Add support for TI LP5860 LED driver chip
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260110/202601100247.wetiMFXE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100247.wetiMFXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100247.wetiMFXE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/rgb/leds-lp5860-core.c: In function 'lp5860_led_init':
>> drivers/leds/rgb/leds-lp5860-core.c:72:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      72 |         int ret;
         |             ^~~


vim +/ret +72 drivers/leds/rgb/leds-lp5860-core.c

    66	
    67	static int lp5860_led_init(struct lp5860_led *led, struct fwnode_handle *fwnode,
    68				   unsigned int channel)
    69	{
    70		enum led_default_state default_state;
    71		unsigned int brightness;
  > 72		int ret;
    73	
    74		ret = regmap_read(led->chip->regmap, LP5860_REG_PWM_BRI_START + channel, &brightness);
    75	
    76		default_state = led_init_default_state_get(fwnode);
    77	
    78		switch (default_state) {
    79		case LEDS_DEFSTATE_ON:
    80			led->brightness = LP5860_MAX_BRIGHTNESS;
    81			break;
    82		case LEDS_DEFSTATE_KEEP:
    83			led->brightness = min(brightness, LP5860_MAX_BRIGHTNESS);
    84			break;
    85		default:
    86			led->brightness = 0;
    87			break;
    88		}
    89	
    90		return lp5860_set_mc_brightness(&led->mc_cdev.led_cdev, led->brightness);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

