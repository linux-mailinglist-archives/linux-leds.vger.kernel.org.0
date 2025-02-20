Return-Path: <linux-leds+bounces-4042-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE47A3E86E
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 00:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00661189FB04
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 23:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA4D1D5CDD;
	Thu, 20 Feb 2025 23:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJol4hIs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803326561A
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094058; cv=none; b=cMk1YAskyU5EJoAYfn8Frn5fRJ+KVUkinLZjmWxA05wEP2jk45rPtCm+JQT0wOA1Nmb26mz6erctxV/8DrUbFTUbbAVPNbTB00XfDZXI7SQI+z86HBXBUfY6DrKYlFqahEwr+/e8bzwTx8Sge9hf9M+i7Lc5DEjNwJEMGD2TITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094058; c=relaxed/simple;
	bh=1Y5KTXu/MwxQ4sILuIxRDeL+/tqtoaj+kiR4shMl7I0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbOYIN9e3DhzE7RlaudnyEX4BWbFHHqDSAMN2X8bbJ0dMEgzdJUYcwOO0zkYTu2A8dPxFIyl6mUkcG89+12JNXC3wkTLRqPRxc3auL5P/s3Yuz7S0qgzdcXu8cVr/3nqonVYET1t7V5bmlNMD2Z26180e4j3FLYIMO0zlKixnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJol4hIs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740094056; x=1771630056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Y5KTXu/MwxQ4sILuIxRDeL+/tqtoaj+kiR4shMl7I0=;
  b=PJol4hIszQKhz0X/T58PDsM9tAAyGmfqO4pLNQGDdRP2AX0crw5MoFx7
   W1UX3H/YDPazgCIPORPwnwzLgsohoV2FUqVBQxkWvJ7nP8AogYgWw9Ge4
   8nKZC7TL1HHFXwgeGueA0fLhmijRmf216YMw958R4w7VqPTeenHeXp7RZ
   UUJuZatlZkBh4NgOWffuZQse6nqUiitjQxfY5b/oXNg//T0cjGy3l0GyB
   HBTqW/x+yu5bVhAkfzyOhcYGdjv7InitXXPL1B+JiUSd6d8JUrXmqihqd
   ZyNSYoDWf8RACJbZqTnojExfoRUW5gOQXk2ZDs1KcSgC5ux0R0yn5Hfz5
   g==;
X-CSE-ConnectionGUID: qdx1XntMRAC4tkA0OriV9w==
X-CSE-MsgGUID: jEFcn7QrSXCymWcLIhFNzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51114850"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="51114850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 15:27:35 -0800
X-CSE-ConnectionGUID: VLr+hPyBRHehOOnSS5xzMA==
X-CSE-MsgGUID: 1fv+cnPuQKyv9nHCMnDSlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115048529"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 15:27:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlFx5-0004rT-1u;
	Thu, 20 Feb 2025 23:27:31 +0000
Date: Fri, 21 Feb 2025 07:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [lee-leds:for-leds-next 7/10] drivers/leds/leds-pca955x.c:509:8:
 error: call to undeclared function 'pca955x_num_led_regs'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202502210701.i2fIb4tb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   2f372a5dce6885f1d2647f7add01756bee0fef49
commit: 14ef0738a31dcecfbba38626884b7d9a60b75cd0 [7/10] leds: pca955x: Optimize probe LED selection
config: i386-buildonly-randconfig-005-20250221 (https://download.01.org/0day-ci/archive/20250221/202502210701.i2fIb4tb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210701.i2fIb4tb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210701.i2fIb4tb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-pca955x.c:509:8: error: call to undeclared function 'pca955x_num_led_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     509 |         nls = pca955x_num_led_regs(chip->bits);
         |               ^
   drivers/leds/leds-pca955x.c:509:8: note: did you mean 'pca955x_num_input_regs'?
   drivers/leds/leds-pca955x.c:135:19: note: 'pca955x_num_input_regs' declared here
     135 | static inline int pca955x_num_input_regs(int bits)
         |                   ^
   1 error generated.


vim +/pca955x_num_led_regs +509 drivers/leds/leds-pca955x.c

   440	
   441	static int pca955x_probe(struct i2c_client *client)
   442	{
   443		struct pca955x *pca955x;
   444		struct pca955x_led *pca955x_led;
   445		const struct pca955x_chipdef *chip;
   446		struct led_classdev *led;
   447		struct led_init_data init_data;
   448		struct i2c_adapter *adapter;
   449		int i, bit, err, nls, reg;
   450		u8 ls1[4];
   451		u8 ls2[4];
   452		struct pca955x_platform_data *pdata;
   453		bool set_default_label = false;
   454		bool keep_pwm = false;
   455		char default_label[8];
   456	
   457		chip = i2c_get_match_data(client);
   458		if (!chip)
   459			return dev_err_probe(&client->dev, -ENODEV, "unknown chip\n");
   460	
   461		adapter = client->adapter;
   462		pdata = dev_get_platdata(&client->dev);
   463		if (!pdata) {
   464			pdata =	pca955x_get_pdata(client, chip);
   465			if (IS_ERR(pdata))
   466				return PTR_ERR(pdata);
   467		}
   468	
   469		/* Make sure the slave address / chip type combo given is possible */
   470		if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
   471		    chip->slv_addr) {
   472			dev_err(&client->dev, "invalid slave address %02x\n",
   473				client->addr);
   474			return -ENODEV;
   475		}
   476	
   477		dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
   478			 "slave address 0x%02x\n", client->name, chip->bits,
   479			 client->addr);
   480	
   481		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
   482			return -EIO;
   483	
   484		if (pdata->num_leds != chip->bits) {
   485			dev_err(&client->dev,
   486				"board info claims %d LEDs on a %d-bit chip\n",
   487				pdata->num_leds, chip->bits);
   488			return -ENODEV;
   489		}
   490	
   491		pca955x = devm_kzalloc(&client->dev, sizeof(*pca955x), GFP_KERNEL);
   492		if (!pca955x)
   493			return -ENOMEM;
   494	
   495		pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
   496					     sizeof(*pca955x_led), GFP_KERNEL);
   497		if (!pca955x->leds)
   498			return -ENOMEM;
   499	
   500		i2c_set_clientdata(client, pca955x);
   501	
   502		mutex_init(&pca955x->lock);
   503		pca955x->client = client;
   504		pca955x->chipdef = chip;
   505	
   506		init_data.devname_mandatory = false;
   507		init_data.devicename = "pca955x";
   508	
 > 509		nls = pca955x_num_led_regs(chip->bits);
   510		/* Use auto-increment feature to read all the LED selectors at once. */
   511		err = i2c_smbus_read_i2c_block_data(client,
   512						    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
   513						    ls1);
   514		if (err < 0)
   515			return err;
   516	
   517		for (i = 0; i < nls; i++)
   518			ls2[i] = ls1[i];
   519	
   520		for (i = 0; i < chip->bits; i++) {
   521			pca955x_led = &pca955x->leds[i];
   522			pca955x_led->led_num = i;
   523			pca955x_led->pca955x = pca955x;
   524			pca955x_led->type = pdata->leds[i].type;
   525	
   526			switch (pca955x_led->type) {
   527			case PCA955X_TYPE_NONE:
   528			case PCA955X_TYPE_GPIO:
   529				break;
   530			case PCA955X_TYPE_LED:
   531				bit = i % 4;
   532				reg = i / 4;
   533				led = &pca955x_led->led_cdev;
   534				led->brightness_set_blocking = pca955x_led_set;
   535				led->brightness_get = pca955x_led_get;
   536	
   537				if (pdata->leds[i].default_state == LEDS_DEFSTATE_OFF)
   538					ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_OFF);
   539				else if (pdata->leds[i].default_state == LEDS_DEFSTATE_ON)
   540					ls2[reg] = pca955x_ledsel(ls2[reg], bit, PCA955X_LS_LED_ON);
   541	
   542				init_data.fwnode = pdata->leds[i].fwnode;
   543	
   544				if (is_of_node(init_data.fwnode)) {
   545					if (to_of_node(init_data.fwnode)->name[0] ==
   546					    '\0')
   547						set_default_label = true;
   548					else
   549						set_default_label = false;
   550				} else {
   551					set_default_label = true;
   552				}
   553	
   554				if (set_default_label) {
   555					snprintf(default_label, sizeof(default_label),
   556						 "%d", i);
   557					init_data.default_label = default_label;
   558				} else {
   559					init_data.default_label = NULL;
   560				}
   561	
   562				err = devm_led_classdev_register_ext(&client->dev, led,
   563								     &init_data);
   564				if (err)
   565					return err;
   566	
   567				set_bit(i, &pca955x->active_pins);
   568	
   569				/*
   570				 * For default-state == "keep", let the core update the
   571				 * brightness from the hardware, then check the
   572				 * brightness to see if it's using PWM1. If so, PWM1
   573				 * should not be written below.
   574				 */
   575				if (pdata->leds[i].default_state == LEDS_DEFSTATE_KEEP) {
   576					if (led->brightness != LED_FULL &&
   577					    led->brightness != LED_OFF &&
   578					    led->brightness != LED_HALF)
   579						keep_pwm = true;
   580				}
   581			}
   582		}
   583	
   584		for (i = 0; i < nls; i++) {
   585			if (ls1[i] != ls2[i]) {
   586				err = pca955x_write_ls(pca955x, i, ls2[i]);
   587				if (err)
   588					return err;
   589			}
   590		}
   591	
   592		/* PWM0 is used for half brightness or 50% duty cycle */
   593		err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
   594		if (err)
   595			return err;
   596	
   597		if (!keep_pwm) {
   598			/* PWM1 is used for variable brightness, default to OFF */
   599			err = pca955x_write_pwm(pca955x, 1, 0);
   600			if (err)
   601				return err;
   602		}
   603	
   604		/* Set to fast frequency so we do not see flashing */
   605		err = pca955x_write_psc(pca955x, 0, 0);
   606		if (err)
   607			return err;
   608		err = pca955x_write_psc(pca955x, 1, 0);
   609		if (err)
   610			return err;
   611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

