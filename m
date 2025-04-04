Return-Path: <linux-leds+bounces-4407-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629FA7C35A
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 20:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B13547A8E82
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 18:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB9F20E6E0;
	Fri,  4 Apr 2025 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbP6iZKW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E51B4242;
	Fri,  4 Apr 2025 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793138; cv=none; b=WtJifV2HZVw5iE/WsRW0FQq3qa1BYnUmMxJ1PZ7GLr+Sa7o1v0RhTh7+Oyu+FqSXDm6HhwtnGy1zSQ0/UcD6wD7nookZ7sSCMA0hNGJY1JHthev/vG33fedyT/J8Syrt0Vi7WTCrEWGVt58f7MDW4YvGfV2+nrHDSr9CJPAG/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793138; c=relaxed/simple;
	bh=AWwijYRw7YUcMRIIsF8D4h/R9ylAWro6iDUPnZ9Rl0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGR64Y58fGKbNXqNdNPG8mJZgfEPouCNTHSjOOuQwJwjxDf4qoSAhGfed3uRLTiWphJP0lg1LQ3fLQ1xzOFgWNbeKWZmCTcfOKFRWP4hHusjAVvRzaVkpjH3nEVxvSjv5KAIECRXcX0/rVhsFembwDkIlwVfuzWHfKpng478ISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbP6iZKW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743793136; x=1775329136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AWwijYRw7YUcMRIIsF8D4h/R9ylAWro6iDUPnZ9Rl0Q=;
  b=BbP6iZKW1JNXlSpXeexcs3PNPUezPFbXQXJe3HVCx5JsnWCIoTla300y
   ILXg0KZoYnc0TR6BQg0WhhA4PtAhAxWM71GiX+CRsdStGy9mNE62dlRvT
   ZFiUeGOUfi49tVtd71udTSUWy/bvkhcC0T45tlvkz7keKabCF9bYb6jsb
   0GAWI7mBcQkCeB+YrK33uoW8Dh6FXbmkDMwQAV8WKzuCm4p3UKeeNJH0F
   7uEemGiu7jAAtRBzKj02IE2KyIZHq6mwgoKbxuxcRkQ/NXW8HfjqI3DRk
   pQ2DFpP4P3Fle7/KL6GeE2qdA/TY+p7uKvqPs1sX+f21TBZfHWHhuoeF3
   A==;
X-CSE-ConnectionGUID: ExGzGMI1SReRvKf8pg33/w==
X-CSE-MsgGUID: stE8JEm1RneyKnAnNt7/YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62643091"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="62643091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 11:58:55 -0700
X-CSE-ConnectionGUID: Rwwtf8PoRr6sWzn9mNse1w==
X-CSE-MsgGUID: OIRq1tC0SdinwHg2zpCu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="150602652"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2025 11:58:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0mFf-0001TD-1U;
	Fri, 04 Apr 2025 18:58:51 +0000
Date: Sat, 5 Apr 2025 02:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v1 1/1] leds: pca955x: Avoid potential overflow when
 filling default_label
Message-ID: <202504050256.SYq06TxB-lkp@intel.com>
References: <20250404162849.3650361-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404162849.3650361-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.14]
[cannot apply to lee-leds/for-leds-next linus/master next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/leds-pca955x-Avoid-potential-overflow-when-filling-default_label/20250405-003054
base:   v6.14
patch link:    https://lore.kernel.org/r/20250404162849.3650361-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] leds: pca955x: Avoid potential overflow when filling default_label
config: powerpc-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050256.SYq06TxB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050256.SYq06TxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050256.SYq06TxB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-pca955x.c: In function 'pca955x_probe':
>> drivers/leds/leds-pca955x.c:554:53: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
        snprintf(default_label, sizeof(default_label), "%u", i);
                                                        ^~
   drivers/leds/leds-pca955x.c:554:52: note: directive argument in the range [0, 4294967294]
        snprintf(default_label, sizeof(default_label), "%u", i);
                                                       ^~~~
   drivers/leds/leds-pca955x.c:554:5: note: 'snprintf' output between 2 and 11 bytes into a destination of size 8
        snprintf(default_label, sizeof(default_label), "%u", i);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +554 drivers/leds/leds-pca955x.c

   449	
   450	static int pca955x_probe(struct i2c_client *client)
   451	{
   452		struct pca955x *pca955x;
   453		struct pca955x_led *pca955x_led;
   454		const struct pca955x_chipdef *chip;
   455		struct led_classdev *led;
   456		struct led_init_data init_data;
   457		struct i2c_adapter *adapter;
   458		struct pca955x_platform_data *pdata;
   459		bool set_default_label = false;
   460		bool keep_pwm = false;
   461		char default_label[8];
   462		unsigned int i;
   463		int err;
   464	
   465		chip = i2c_get_match_data(client);
   466		if (!chip)
   467			return dev_err_probe(&client->dev, -ENODEV, "unknown chip\n");
   468	
   469		adapter = client->adapter;
   470		pdata = dev_get_platdata(&client->dev);
   471		if (!pdata) {
   472			pdata =	pca955x_get_pdata(client, chip);
   473			if (IS_ERR(pdata))
   474				return PTR_ERR(pdata);
   475		}
   476	
   477		/* Make sure the slave address / chip type combo given is possible */
   478		if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
   479		    chip->slv_addr) {
   480			dev_err(&client->dev, "invalid slave address %02x\n",
   481				client->addr);
   482			return -ENODEV;
   483		}
   484	
   485		dev_info(&client->dev, "Using %s %u-bit LED driver at slave address 0x%02x\n",
   486			 client->name, chip->bits, client->addr);
   487	
   488		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
   489			return -EIO;
   490	
   491		if (pdata->num_leds != chip->bits) {
   492			dev_err(&client->dev,
   493				"board info claims %d LEDs on a %u-bit chip\n",
   494				pdata->num_leds, chip->bits);
   495			return -ENODEV;
   496		}
   497	
   498		pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
   499		if (!pca955x)
   500			return -ENOMEM;
   501	
   502		pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
   503					     sizeof(*pca955x_led), GFP_KERNEL);
   504		if (!pca955x->leds)
   505			return -ENOMEM;
   506	
   507		i2c_set_clientdata(client, pca955x);
   508	
   509		mutex_init(&pca955x->lock);
   510		pca955x->client = client;
   511		pca955x->chipdef = chip;
   512	
   513		init_data.devname_mandatory = false;
   514		init_data.devicename = "pca955x";
   515	
   516		for (i = 0; i < chip->bits; i++) {
   517			pca955x_led = &pca955x->leds[i];
   518			pca955x_led->led_num = i;
   519			pca955x_led->pca955x = pca955x;
   520			pca955x_led->type = pdata->leds[i].type;
   521	
   522			switch (pca955x_led->type) {
   523			case PCA955X_TYPE_NONE:
   524			case PCA955X_TYPE_GPIO:
   525				break;
   526			case PCA955X_TYPE_LED:
   527				led = &pca955x_led->led_cdev;
   528				led->brightness_set_blocking = pca955x_led_set;
   529				led->brightness_get = pca955x_led_get;
   530	
   531				if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF) {
   532					err = pca955x_led_set(led, LED_OFF);
   533					if (err)
   534						return err;
   535				} else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON) {
   536					err = pca955x_led_set(led, LED_FULL);
   537					if (err)
   538						return err;
   539				}
   540	
   541				init_data.fwnode = pdata->leds[i].fwnode;
   542	
   543				if (is_of_node(init_data.fwnode)) {
   544					if (to_of_node(init_data.fwnode)->name[0] ==
   545					    '\0')
   546						set_default_label = true;
   547					else
   548						set_default_label = false;
   549				} else {
   550					set_default_label = true;
   551				}
   552	
   553				if (set_default_label) {
 > 554					snprintf(default_label, sizeof(default_label), "%u", i);
   555					init_data.default_label = default_label;
   556				} else {
   557					init_data.default_label = NULL;
   558				}
   559	
   560				err = devm_led_classdev_register_ext(&client->dev, led,
   561								     &init_data);
   562				if (err)
   563					return err;
   564	
   565				set_bit(i, &pca955x->active_pins);
   566	
   567				/*
   568				 * For default-state == "keep", let the core update the
   569				 * brightness from the hardware, then check the
   570				 * brightness to see if it's using PWM1. If so, PWM1
   571				 * should not be written below.
   572				 */
   573				if (pdata->leds[i].default_state == LEDS_DEFSTATE_KEEP) {
   574					if (led->brightness != LED_FULL &&
   575					    led->brightness != LED_OFF &&
   576					    led->brightness != LED_HALF)
   577						keep_pwm = true;
   578				}
   579			}
   580		}
   581	
   582		/* PWM0 is used for half brightness or 50% duty cycle */
   583		err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
   584		if (err)
   585			return err;
   586	
   587		if (!keep_pwm) {
   588			/* PWM1 is used for variable brightness, default to OFF */
   589			err = pca955x_write_pwm(client, 1, 0);
   590			if (err)
   591				return err;
   592		}
   593	
   594		/* Set to fast frequency so we do not see flashing */
   595		err = pca955x_write_psc(client, 0, 0);
   596		if (err)
   597			return err;
   598		err = pca955x_write_psc(client, 1, 0);
   599		if (err)
   600			return err;
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

