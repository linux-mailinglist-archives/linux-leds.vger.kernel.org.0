Return-Path: <linux-leds+bounces-5950-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1DC21B45
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 19:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F48188025F
	for <lists+linux-leds@lfdr.de>; Thu, 30 Oct 2025 18:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1260736CE12;
	Thu, 30 Oct 2025 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR5mAwN1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CC36E35B;
	Thu, 30 Oct 2025 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847683; cv=none; b=tmsNNmd9cOlDIxGaiUqthaY/cRfMls1TSTrhtqvN5O8MusOTWiWRnBcFw6XkyE7DGio4BeSlgFdtSHoafBiAyHXLWZbAwH7MeCmLO0zC1PV/b/MvnkA0BBtq1aa+0BOs4GcOu6rGkG0VwdAe1MLUIvQMcJQdj9d3GAR2v058SjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847683; c=relaxed/simple;
	bh=srnTyop+o8WgWjPePpQqFtHWyTRYfI2Cb3A5JDGJp7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0n8Qb/2eDgkDU4pIb508/wud+va45b9KEA6MXkowT8o442V+5TFnwZ7ZW1UGY3PytyTtVHDhgRYUWemXohHg5drooeVdo5M9sV+T9md7UUm6cT9DGYtLaxddtA9Z4TtMt3Btqi8UTQPTjPiXZn1+yC6IDaZ0IPDlG+M0E3xjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR5mAwN1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761847680; x=1793383680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=srnTyop+o8WgWjPePpQqFtHWyTRYfI2Cb3A5JDGJp7U=;
  b=AR5mAwN1weK/b97A/Aw1NQ9w1BwsouPGYG7X+tWzpAiyfXVRqX3PsGaK
   CdzkogySmTMqNEw7R3k3SGWLVCfGvkRWPQ0bLZR2WVZFwzxt+6UCniOUh
   lCJI7vjMuK0GSx4HGzLxZC5zlQZrYlPg5VdxDDGQzg+RJ31gpqrMNkJFW
   /OEih+xIrajrsVfEP8154uuQNiXfvsBnmInvwA5nMI8snWuKtIl4skpyd
   BdLx0cmYRP1FNSQ1cPcUDXQz54mOkE2vpD5/3ZM+DZIEo+Hrp8tJXZTrC
   f7HL5vW7ic2S5RW1itQaZJ3qLjIpzr5JjX5HypcWDtVZ8/QI0I/W5ucMX
   A==;
X-CSE-ConnectionGUID: CjqpuL+BSwSfcBkxBYdwDA==
X-CSE-MsgGUID: RM2PryAgS4eMCkvmQyyU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67861538"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="67861538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 11:07:59 -0700
X-CSE-ConnectionGUID: 3PRBBtEaQ9GXRaTReU7tag==
X-CSE-MsgGUID: UTFciI0HQLWZEXadIIwWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="190366715"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2025 11:07:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEX3u-000MNz-0g;
	Thu, 30 Oct 2025 18:07:51 +0000
Date: Fri, 31 Oct 2025 02:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Markus.Elfring@web.de
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] leds: netxbig: fix GPIO descriptor leak in error paths
Message-ID: <202510310145.tlVMfaP8-lkp@intel.com>
References: <20251030025312.1623-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030025312.1623-1-vulab@iscas.ac.cn>

Hi Haotian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/leds-netxbig-fix-GPIO-descriptor-leak-in-error-paths/20251030-105705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251030025312.1623-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] leds: netxbig: fix GPIO descriptor leak in error paths
config: nios2-randconfig-r072-20251030 (https://download.01.org/0day-ci/archive/20251031/202510310145.tlVMfaP8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310145.tlVMfaP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310145.tlVMfaP8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-netxbig.c: In function 'netxbig_gpio_ext_get':
>> drivers/leds/leds-netxbig.c:428:1: warning: label 'err_free_data' defined but not used [-Wunused-label]
     428 | err_free_data:
         | ^~~~~~~~~~~~~


vim +/err_free_data +428 drivers/leds/leds-netxbig.c

   335	
   336	/**
   337	 * netxbig_gpio_ext_get() - Obtain GPIO extension device data
   338	 * @dev: main LED device
   339	 * @gpio_ext_dev: the GPIO extension device
   340	 * @gpio_ext: the data structure holding the GPIO extension data
   341	 *
   342	 * This function walks the subdevice that only contain GPIO line
   343	 * handles in the device tree and obtains the GPIO descriptors from that
   344	 * device.
   345	 */
   346	static int netxbig_gpio_ext_get(struct device *dev,
   347					struct device *gpio_ext_dev,
   348					struct netxbig_gpio_ext *gpio_ext)
   349	{
   350		struct gpio_desc **addr, **data;
   351		int num_addr, num_data;
   352		struct gpio_desc *gpiod;
   353		int ret;
   354		int i;
   355	
   356		ret = gpiod_count(gpio_ext_dev, "addr");
   357		if (ret < 0) {
   358			dev_err(dev,
   359				"Failed to count GPIOs in DT property addr-gpios\n");
   360			return ret;
   361		}
   362		num_addr = ret;
   363		addr = devm_kcalloc(dev, num_addr, sizeof(*addr), GFP_KERNEL);
   364		if (!addr)
   365			return -ENOMEM;
   366	
   367		gpio_ext->addr = addr;
   368		gpio_ext->num_addr = 0;
   369	
   370		/*
   371		 * We cannot use devm_ managed resources with these GPIO descriptors
   372		 * since they are associated with the "GPIO extension device" which
   373		 * does not probe any driver. The device tree parser will however
   374		 * populate a platform device for it so we can anyway obtain the
   375		 * GPIO descriptors from the device.
   376		 */
   377		for (i = 0; i < num_addr; i++) {
   378			gpiod = gpiod_get_index(gpio_ext_dev, "addr", i,
   379						GPIOD_OUT_LOW);
   380			if (IS_ERR(gpiod)) {
   381				ret = PTR_ERR(gpiod);
   382				goto err_free_addr;
   383			}
   384			gpiod_set_consumer_name(gpiod, "GPIO extension addr");
   385			addr[i] = gpiod;
   386			gpio_ext->num_addr++;
   387		}
   388	
   389		ret = gpiod_count(gpio_ext_dev, "data");
   390		if (ret < 0) {
   391			dev_err(dev,
   392				"Failed to count GPIOs in DT property data-gpios\n");
   393			goto err_free_addr;
   394		}
   395		num_data = ret;
   396		data = devm_kcalloc(dev, num_data, sizeof(*data), GFP_KERNEL);
   397		if (!data) {
   398			ret = -ENOMEM;
   399			goto err_free_addr;
   400		}
   401	
   402		gpio_ext->data = data;
   403		gpio_ext->num_data = 0;
   404	
   405		for (i = 0; i < num_data; i++) {
   406			gpiod = gpiod_get_index(gpio_ext_dev, "data", i,
   407						GPIOD_OUT_LOW);
   408			if (IS_ERR(gpiod))
   409				goto err_gpiod_put;
   410			gpiod_set_consumer_name(gpiod, "GPIO extension data");
   411			data[i] = gpiod;
   412			gpio_ext->num_data++;
   413		}
   414	
   415		gpiod = gpiod_get(gpio_ext_dev, "enable", GPIOD_OUT_LOW);
   416		if (IS_ERR(gpiod)) {
   417			dev_err(dev,
   418				"Failed to get GPIO from DT property enable-gpio\n");
   419			goto err_gpiod_put;
   420		}
   421		gpiod_set_consumer_name(gpiod, "GPIO extension enable");
   422		gpio_ext->enable = gpiod;
   423	
   424		return devm_add_action_or_reset(dev, netxbig_gpio_ext_remove, gpio_ext);
   425	
   426	err_gpiod_put:
   427		ret = PTR_ERR(gpiod);
 > 428	err_free_data:
   429		for (i = 0; i < gpio_ext->num_data; i++)
   430			gpiod_put(gpio_ext->data[i]);
   431	err_free_addr:
   432		for (i = 0; i < gpio_ext->num_addr; i++)
   433			gpiod_put(gpio_ext->addr[i]);
   434		return ret;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

