Return-Path: <linux-leds+bounces-4811-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C18ADB8F6
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 20:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C6263A3412
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 18:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B48289826;
	Mon, 16 Jun 2025 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzXkPhF/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE32BEFF3;
	Mon, 16 Jun 2025 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099070; cv=none; b=igrP1VreqMU7JGyfek/c16Duad3+0HKOUoH/6Rf+sZOV0ZBoKFqZPywm8rgVHt9VKuS5wv61MjPfjzmaEfNRFoilxSigvqdABDIt2EAOQXWcArfkqduLyJvYgKoCy4HsjGppyThkM8lNg0qEOENjdMjLNayKI0ZEOIFQv3sgbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099070; c=relaxed/simple;
	bh=8A2beXL8j8YQfoz2s4KHAo2M+g98Dcra7JcIdezlX9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIt0nyQsDfzFJC9zvf07sjlN+x3yIxaQTznSR5fJVi/2B2Cp/cxqypcHphGS7cvt38nFRtg8qnIFV7jQbEhDxzqOsNITNWUcmDAQCH5+1wIhYhtGJJ39XuiYSj/ptQuDt8CqHqlQ0oYASxDZROSk+eLcX4nztcTuPsC8bWXlhso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzXkPhF/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750099069; x=1781635069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8A2beXL8j8YQfoz2s4KHAo2M+g98Dcra7JcIdezlX9U=;
  b=TzXkPhF/w4QxPtTvA9fhVBfMQxkZ3SYONFCIXmGMNozTe+AG98eyjAGn
   cxnPmGsn7PeP+0msghiHIPYXPzlm/U8WcRG6K8r4sryTx/LxFm+9exuzJ
   i8oFKEBr/0VPZHWuuZw7oGKUdQn4eGOijXlxIj3yFZhzM91hIjzp+iuKi
   Ys3hx04xYeAalLwtYiPmxmOBYUs8NlDcZjt6L9jlV0TG3vGUNULd74dvC
   zYLOm3YuglbuiZOuGyFhj56BKDXof8Y/MBVeDCB+x3nNFiMw58KDnfRfI
   kDgaC9v3EsZ60wvb0nzXOSawlrYWmn56ZKkjxahZj+vu3wTqhUx74ViOv
   w==;
X-CSE-ConnectionGUID: YqcgIxToT5u+sVnoVx+A7g==
X-CSE-MsgGUID: 5cJsI05lSPiVU0wLVPQo/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69833203"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="69833203"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:37:47 -0700
X-CSE-ConnectionGUID: HZw3yzM3SmuTKkSqv5kS6g==
X-CSE-MsgGUID: o+AmPQ9MSGiOGnnu5L7ZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148442887"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 11:37:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uREiD-000FGO-38;
	Mon, 16 Jun 2025 18:37:41 +0000
Date: Tue, 17 Jun 2025 02:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: Re: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED
 Driver
Message-ID: <202506170238.VtqmOKaK-lkp@intel.com>
References: <20250610174319.183375-4-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610174319.183375-4-trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f09079bd04a924c72d555cd97942d5f8d7eca98c]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-add-TI-National-Semiconductor-LP5812-LED-Driver/20250611-100314
base:   f09079bd04a924c72d555cd97942d5f8d7eca98c
patch link:    https://lore.kernel.org/r/20250610174319.183375-4-trannamatk%40gmail.com
patch subject: [PATCH v9 2/4] leds: add TI/National Semiconductor LP5812 LED Driver
config: x86_64-randconfig-002-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170238.VtqmOKaK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170238.VtqmOKaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170238.VtqmOKaK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/rgb/leds-lp5812.c: In function 'lp5812_init_led.isra':
>> drivers/leds/rgb/leds-lp5812.c:1585:57: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 5 and 24 [-Wformat-truncation=]
    1585 |                 snprintf(name, sizeof(name), "%s:channel%d",
         |                                                         ^~
   drivers/leds/rgb/leds-lp5812.c:1585:46: note: directive argument in the range [0, 2147483647]
    1585 |                 snprintf(name, sizeof(name), "%s:channel%d",
         |                                              ^~~~~~~~~~~~~~
   drivers/leds/rgb/leds-lp5812.c:1585:17: note: 'snprintf' output between 10 and 38 bytes into a destination of size 32
    1585 |                 snprintf(name, sizeof(name), "%s:channel%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1586 |                          pdata->label ? : chip->i2c_cl->name, chan);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1585 drivers/leds/rgb/leds-lp5812.c

  1572	
  1573	static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
  1574	{
  1575		struct lp5812_data *pdata = chip->pdata;
  1576		struct device *dev = &chip->i2c_cl->dev;
  1577		struct mc_subled *mc_led_info;
  1578		struct led_classdev *led_cdev;
  1579		char name[32];
  1580		int i, ret = 0;
  1581	
  1582		if (pdata->led_config[chan].name) {
  1583			led->cdev.name = pdata->led_config[chan].name;
  1584		} else {
> 1585			snprintf(name, sizeof(name), "%s:channel%d",
  1586				 pdata->label ? : chip->i2c_cl->name, chan);
  1587			led->cdev.name = name;
  1588		}
  1589	
  1590		if (pdata->led_config[chan].is_sc_led == 0) {
  1591			mc_led_info = devm_kcalloc(dev,
  1592						   pdata->led_config[chan].num_colors,
  1593						   sizeof(*mc_led_info), GFP_KERNEL);
  1594			if (!mc_led_info)
  1595				return -ENOMEM;
  1596	
  1597			led_cdev = &led->mc_cdev.led_cdev;
  1598			led_cdev->name = led->cdev.name;
  1599			led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
  1600			led->mc_cdev.num_colors = pdata->led_config[chan].num_colors;
  1601			for (i = 0; i < led->mc_cdev.num_colors; i++) {
  1602				mc_led_info[i].color_index =
  1603					pdata->led_config[chan].color_id[i];
  1604				mc_led_info[i].channel =
  1605						pdata->led_config[chan].led_id[i];
  1606			}
  1607	
  1608			led->mc_cdev.subled_info = mc_led_info;
  1609		} else {
  1610			led->cdev.brightness_set_blocking = lp5812_set_brightness;
  1611		}
  1612	
  1613		led->cdev.groups = lp5812_led_groups;
  1614		led->chan_nr = chan;
  1615	
  1616		if (pdata->led_config[chan].is_sc_led) {
  1617			ret = devm_led_classdev_register(dev, &led->cdev);
  1618			if (ret == 0) {
  1619				led->cdev.dev->platform_data = devm_kstrdup(dev, LP5812_SC_LED, GFP_KERNEL);
  1620				if (!led->cdev.dev->platform_data)
  1621					return -ENOMEM;
  1622			}
  1623		} else {
  1624			ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
  1625			if (ret == 0) {
  1626				led->mc_cdev.led_cdev.dev->platform_data =
  1627					devm_kstrdup(dev, LP5812_MC_LED, GFP_KERNEL);
  1628				if (!led->mc_cdev.led_cdev.dev->platform_data)
  1629					return -ENOMEM;
  1630	
  1631				ret = sysfs_create_groups(&led->mc_cdev.led_cdev.dev->kobj,
  1632							  lp5812_led_groups);
  1633				if (ret)
  1634					dev_err(dev, "sysfs_create_groups failed\n");
  1635			}
  1636		}
  1637	
  1638		if (ret) {
  1639			dev_err(dev, "led register err: %d\n", ret);
  1640			return ret;
  1641		}
  1642	
  1643		return 0;
  1644	}
  1645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

