Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A635E53C1
	for <lists+linux-leds@lfdr.de>; Wed, 21 Sep 2022 21:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiIUTXj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Sep 2022 15:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiIUTXi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Sep 2022 15:23:38 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A0352DE4
        for <linux-leds@vger.kernel.org>; Wed, 21 Sep 2022 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663788217; x=1695324217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ERyonbATb1utZ4VmAiMKCrs3293BRfFd7n92XhQ7SVo=;
  b=jnUVr0OoTHAvozWiHC6HNrgj6PbSBFrJKEkEocfijfveow6GyIrH37GY
   V1RWENu1DpfGApCvMPdGQk91V6ABrwh38oNfwTo7HHgqwEhqnLKz7Uy2O
   5GN7uL5uim+yC/UG5gXnj8N3qi7oZnvOrHt3UhVxVE9ZNugYsgKaSRzMw
   HUVararQNSpUl9GD5KZAcQUnnOLxRP+xOv1Bhu6tr/oStOMCrrylfF/oE
   rzTBBrg2Fnl4arPFtJOAmkLLWjnTsH78Bj5omOzLn4nwZi8YG1bO+rtME
   X8FQfW14lAvcrOwyQePJ6U3+mWnGd6H7p/1URB1JYOyA8KbpYix318AI4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="364080038"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="364080038"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 12:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="650207620"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Sep 2022 12:23:34 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ob5Jm-0003su-0A;
        Wed, 21 Sep 2022 19:23:34 +0000
Date:   Thu, 22 Sep 2022 03:23:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bernardo Rodrigues <bernardocrodrigues@live.com>
Cc:     kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: [pavel-leds:for-next 1/2] drivers/leds/leds-pca963x.c:355:17:
 warning: this 'if' clause does not guard...
Message-ID: <202209220336.c0YyjeJh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
head:   31fd7108302388d732973c58470d4be559d352ec
commit: fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277 [1/2] leds: pca963x: fix blink with hw acceleration
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220922/202209220336.c0YyjeJh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?id=fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277
        git remote add pavel-leds git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
        git fetch --no-tags pavel-leds for-next
        git checkout fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/leds/leds-pca963x.c: In function 'pca963x_register_leds':
>> drivers/leds/leds-pca963x.c:355:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     355 |                 if (hw_blink)
         |                 ^~
   drivers/leds/leds-pca963x.c:357:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     357 |                         led->blinking = false;
         |                         ^~~


vim +/if +355 drivers/leds/leds-pca963x.c

8465b01827b7a1 drivers/leds/leds-pca9633.c Mark A. Greer      2013-07-25  301  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  302  static int pca963x_register_leds(struct i2c_client *client,
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  303  				 struct pca963x *chip)
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  304  {
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  305  	struct pca963x_chipdef *chipdef = chip->chipdef;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  306  	struct pca963x_led *led = chip->leds;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  307  	struct device *dev = &client->dev;
0b6034d84b0077 drivers/leds/leds-pca963x.c Andy Shevchenko    2019-03-25  308  	struct fwnode_handle *child;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  309  	bool hw_blink;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  310  	s32 mode2;
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  311  	u32 reg;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  312  	int ret;
0b6034d84b0077 drivers/leds/leds-pca963x.c Andy Shevchenko    2019-03-25  313  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  314  	if (device_property_read_u32(dev, "nxp,period-scale",
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  315  				     &chipdef->scaling))
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  316  		chipdef->scaling = 1000;
0b6034d84b0077 drivers/leds/leds-pca963x.c Andy Shevchenko    2019-03-25  317  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  318  	hw_blink = device_property_read_bool(dev, "nxp,hw-blink");
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  319  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  320  	mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  321  	if (mode2 < 0)
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  322  		return mode2;
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  323  
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  324  	/* default to open-drain unless totem pole (push-pull) is specified */
39118499a62623 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  325  	if (device_property_read_bool(dev, "nxp,totem-pole"))
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  326  		mode2 |= PCA963X_MODE2_OUTDRV;
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  327  	else
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  328  		mode2 &= ~PCA963X_MODE2_OUTDRV;
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  329  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  330  	/* default to non-inverted output, unless inverted is specified */
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  331  	if (device_property_read_bool(dev, "nxp,inverted-out"))
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  332  		mode2 |= PCA963X_MODE2_INVRT;
8465b01827b7a1 drivers/leds/leds-pca9633.c Mark A. Greer      2013-07-25  333  	else
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  334  		mode2 &= ~PCA963X_MODE2_INVRT;
8465b01827b7a1 drivers/leds/leds-pca9633.c Mark A. Greer      2013-07-25  335  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  336  	ret = i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  337  	if (ret < 0)
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  338  		return ret;
35c7d30179fbc1 drivers/leds/leds-pca963x.c Matt Ranostay      2016-10-13  339  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  340  	device_for_each_child_node(dev, child) {
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  341  		struct led_init_data init_data = {};
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  342  		char default_label[32];
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  343  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  344  		ret = fwnode_property_read_u32(child, "reg", &reg);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  345  		if (ret || reg >= chipdef->n_leds) {
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  346  			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  347  				child);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  348  			ret = -EINVAL;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  349  			goto err;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  350  		}
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  351  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  352  		led->led_num = reg;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  353  		led->chip = chip;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  354  		led->led_cdev.brightness_set_blocking = pca963x_led_set;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20 @355  		if (hw_blink)
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  356  			led->led_cdev.blink_set = pca963x_blink_set;
fd6dd9584ed3ee drivers/leds/leds-pca963x.c Bernardo Rodrigues 2021-12-05  357  			led->blinking = false;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  358  
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  359  		init_data.fwnode = child;
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  360  		/* for backwards compatibility */
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  361  		init_data.devicename = "pca963x";
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  362  		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  363  			 client->adapter->nr, client->addr, reg);
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  364  		init_data.default_label = default_label;
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  365  
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  366  		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
564ead1280d759 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  367  						     &init_data);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  368  		if (ret) {
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  369  			dev_err(dev, "Failed to register LED for node %pfw\n",
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  370  				child);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  371  			goto err;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  372  		}
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  373  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  374  		++led;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  375  	}
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  376  
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  377  	return 0;
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  378  err:
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  379  	fwnode_handle_put(child);
85fc8efe85d405 drivers/leds/leds-pca963x.c Marek Behún        2020-09-20  380  	return ret;
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  381  }
81d22878092fea drivers/leds/leds-pca9633.c Tony Lindgren      2013-06-26  382  

:::::: The code at line 355 was first introduced by commit
:::::: 85fc8efe85d405b80904f73e4e23184a84283753 leds: pca963x: register LEDs immediately after parsing, get rid of platdata

:::::: TO: Marek Behún <marek.behun@nic.cz>
:::::: CC: Pavel Machek <pavel@ucw.cz>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
