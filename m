Return-Path: <linux-leds+bounces-4433-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C5A7E2C1
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 16:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906321885D15
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 14:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED65E1E5B80;
	Mon,  7 Apr 2025 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtblmip+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8441DF731;
	Mon,  7 Apr 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037392; cv=none; b=DqAiYswSv2fSf9w8MGorS8FTnQDNRC3daYMiDCBn1NinHKup2h1zK8hUOUwiF467RJi2z5IztXOtumJc1y1YRrcyBa1U+0+DzrDb/8z77lVXe+ztNPxQoBLYclzV6Rg4n8yPmbFYFuhjQR4+trcYQu4SvPmDGtJ7wxDLHuiYDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037392; c=relaxed/simple;
	bh=slNcmtMSWtZm97ocEecZkuAVb+yFRv33O53uq54gA7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEzP4Ps3Is/hW1I/Sye1U5PP+ipWMpB31PrwmXriKk+RujDexe67r8QpZnLZC+TxpDlOaXV9yA0DdRJ1gaOCmzztfgxezpMd/8fGkAVWspwnDvlYr+ZQXfJBVsDvKuaOyFBpu3V8hZjrbrzOUU+YyLnniTw58Ulnd8/DsXY0NqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtblmip+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744037391; x=1775573391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=slNcmtMSWtZm97ocEecZkuAVb+yFRv33O53uq54gA7g=;
  b=jtblmip+RzQ9cv4RDdZAvhb+29Qxl0NTxnEpb0JBD1chNHjYLN2Z8Jra
   dSmYB9ITEmA7vGWrZo/DsjFc+XIinrczMthbTynYCGlDjZGUAQvaGr16v
   LVwDEGPbx1QnYJhm8mI6BoJ6R/Avp7L2HOZjRhPdCYoW7ZZubd6TEFa6m
   +svBEcnTdYtrhQ7xpu3ENceGe81skT9QTqoZSVm3hkw/08D3L6JQsNCrX
   O4QT/7/Rl92CUnqNoB2ilnyz23yQXXNVebt4FOBFQcYGK+ojS+1uqKKLr
   hMmhcFkEODDuZQ1aDYOi6zOnnUttzr5nbJ1j3aP50OOWIFoYYHBPiT1dk
   w==;
X-CSE-ConnectionGUID: Q+i60EadRV2a8+hnxBwNBg==
X-CSE-MsgGUID: lXJo7gA9SCqIjxDnrVDcgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44573741"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44573741"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:49:50 -0700
X-CSE-ConnectionGUID: MSsLouzSS26qKXjV5inDoA==
X-CSE-MsgGUID: hKXXvbF1R1eLwNtVC6GtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158965169"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 07:49:48 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1nnF-0003Ut-2l;
	Mon, 07 Apr 2025 14:49:45 +0000
Date: Mon, 7 Apr 2025 22:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Eddie James <eajames@linux.ibm.com>, Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v2 1/1] leds: pca955x: Avoid potential overflow when
 filling default_label
Message-ID: <202504072230.RoQhKH5y-lkp@intel.com>
References: <20250407105033.324789-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407105033.324789-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-pca955x-Avoid-potential-overflow-when-filling-default_label/20250407-185316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250407105033.324789-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 1/1] leds: pca955x: Avoid potential overflow when filling default_label
config: hexagon-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072230.RoQhKH5y-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072230.RoQhKH5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072230.RoQhKH5y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca955x.c:698:60: warning: format specifies type 'unsigned char' but the argument has type 'unsigned int' [-Wformat]
                                   snprintf(default_label, sizeof(default_label), "%hhu", i);
                                                                                   ~~~~   ^
                                                                                   %u
   1 warning generated.


vim +698 drivers/leds/leds-pca955x.c

   575	
   576	static int pca955x_probe(struct i2c_client *client)
   577	{
   578		struct pca955x *pca955x;
   579		struct pca955x_led *pca955x_led;
   580		const struct pca955x_chipdef *chip;
   581		struct led_classdev *led;
   582		struct led_init_data init_data;
   583		struct i2c_adapter *adapter;
   584		u8 ls1[4];
   585		u8 ls2[4];
   586		struct pca955x_platform_data *pdata;
   587		u8 psc0;
   588		bool keep_psc0 = false;
   589		bool set_default_label = false;
   590		char default_label[8];
   591		int bit, nls, reg;
   592		unsigned int i;
   593		int err;
   594	
   595		chip = i2c_get_match_data(client);
   596		if (!chip)
   597			return dev_err_probe(&client->dev, -ENODEV, "unknown chip\n");
   598	
   599		adapter = client->adapter;
   600		pdata = dev_get_platdata(&client->dev);
   601		if (!pdata) {
   602			pdata =	pca955x_get_pdata(client, chip);
   603			if (IS_ERR(pdata))
   604				return PTR_ERR(pdata);
   605		}
   606	
   607		/* Make sure the slave address / chip type combo given is possible */
   608		if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
   609		    chip->slv_addr) {
   610			dev_err(&client->dev, "invalid slave address %02x\n",
   611				client->addr);
   612			return -ENODEV;
   613		}
   614	
   615		dev_info(&client->dev, "Using %s %u-bit LED driver at slave address 0x%02x\n",
   616			 client->name, chip->bits, client->addr);
   617	
   618		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
   619			return -EIO;
   620	
   621		if (pdata->num_leds != chip->bits) {
   622			dev_err(&client->dev,
   623				"board info claims %d LEDs on a %u-bit chip\n",
   624				pdata->num_leds, chip->bits);
   625			return -ENODEV;
   626		}
   627	
   628		pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
   629		if (!pca955x)
   630			return -ENOMEM;
   631	
   632		pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
   633					     sizeof(*pca955x_led), GFP_KERNEL);
   634		if (!pca955x->leds)
   635			return -ENOMEM;
   636	
   637		i2c_set_clientdata(client, pca955x);
   638	
   639		mutex_init(&pca955x->lock);
   640		pca955x->client = client;
   641		pca955x->chipdef = chip;
   642		pca955x->blink_period = PCA955X_BLINK_DEFAULT_MS;
   643	
   644		init_data.devname_mandatory = false;
   645		init_data.devicename = "pca955x";
   646	
   647		nls = pca955x_num_led_regs(chip->bits);
   648		/* Use auto-increment feature to read all the LED selectors at once. */
   649		err = i2c_smbus_read_i2c_block_data(client,
   650						    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
   651						    ls1);
   652		if (err < 0)
   653			return err;
   654	
   655		for (i = 0; i < nls; i++)
   656			ls2[i] = ls1[i];
   657	
   658		for (i = 0; i < chip->bits; i++) {
   659			pca955x_led = &pca955x->leds[i];
   660			pca955x_led->led_num = i;
   661			pca955x_led->pca955x = pca955x;
   662			pca955x_led->type = pdata->leds[i].type;
   663	
   664			switch (pca955x_led->type) {
   665			case PCA955X_TYPE_NONE:
   666			case PCA955X_TYPE_GPIO:
   667				break;
   668			case PCA955X_TYPE_LED:
   669				bit = i % 4;
   670				reg = i / 4;
   671				led = &pca955x_led->led_cdev;
   672				led->brightness_set_blocking = pca955x_led_set;
   673				led->brightness_get = pca955x_led_get;
   674				led->blink_set = pca955x_led_blink;
   675	
   676				if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
   677					ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
   678				else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
   679					ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
   680				else if (pca955x_ledstate(ls2[reg], bit) == PCA955X_LS_BLINK0) {
   681					keep_psc0 = true;
   682					set_bit(i, &pca955x->active_blink);
   683				}
   684	
   685				init_data.fwnode = pdata->leds[i].fwnode;
   686	
   687				if (is_of_node(init_data.fwnode)) {
   688					if (to_of_node(init_data.fwnode)->name[0] ==
   689					    '\0')
   690						set_default_label = true;
   691					else
   692						set_default_label = false;
   693				} else {
   694					set_default_label = true;
   695				}
   696	
   697				if (set_default_label) {
 > 698					snprintf(default_label, sizeof(default_label), "%hhu", i);
   699					init_data.default_label = default_label;
   700				} else {
   701					init_data.default_label = NULL;
   702				}
   703	
   704				err = devm_led_classdev_register_ext(&client->dev, led,
   705								     &init_data);
   706				if (err)
   707					return err;
   708	
   709				set_bit(i, &pca955x->active_pins);
   710			}
   711		}
   712	
   713		for (i = 0; i < nls; i++) {
   714			if (ls1[i] != ls2[i]) {
   715				err = pca955x_write_ls(pca955x, i, ls2[i]);
   716				if (err)
   717					return err;
   718			}
   719		}
   720	
   721		if (keep_psc0) {
   722			err = pca955x_read_psc(pca955x, 0, &psc0);
   723		} else {
   724			psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
   725			err = pca955x_write_psc(pca955x, 0, psc0);
   726		}
   727	
   728		if (err)
   729			return err;
   730	
   731		pca955x->blink_period = pca955x_psc_to_period(pca955x, psc0);
   732	
   733		/* Set PWM1 to fast frequency so we do not see flashing */
   734		err = pca955x_write_psc(pca955x, 1, 0);
   735		if (err)
   736			return err;
   737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

