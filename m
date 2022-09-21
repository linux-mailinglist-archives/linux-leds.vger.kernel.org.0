Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7BA5E54CD
	for <lists+linux-leds@lfdr.de>; Wed, 21 Sep 2022 22:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiIUU5q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Sep 2022 16:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiIUU5p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Sep 2022 16:57:45 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40469F743
        for <linux-leds@vger.kernel.org>; Wed, 21 Sep 2022 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663793864; x=1695329864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KYNMEDQg5iJU1NijMu9qBx+OZB+wuVO10rhA/f+8AQg=;
  b=L5iKF7oTSVWDwNzh5fHoGxLVKH+WofYWosEeGwwfp4nOTI9p1Frvbz92
   8s4JDdDlxrHbPxvt9EjoyvJUqPlH7rh+Ule6laNMKgeaXnFT7zp8tz9Vg
   ZZhrUjnvlvJYWnJP0RqgnD+enWKG93qNxBO040Dk1qvPCT4pWCX3+1lYc
   XLsakTXiTwz2HOlCyKmyhlXjfD6oUApllSU8rTXAhq+GcOqbUt3o15s8f
   FiyAe0ohL3YLzyMcfZncIQiq/yjTyhqDL36yumTsKdoRi0ReNYmnTgOmI
   1xdu4e3RbXosYJY0PCLAEvEYAtg6vzPJhYusP8v565IUiy/VFn9IFabWi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="280495713"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="280495713"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 13:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="794830307"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2022 13:57:42 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ob6mr-0003yN-2o;
        Wed, 21 Sep 2022 20:57:41 +0000
Date:   Thu, 22 Sep 2022 04:56:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bernardo Rodrigues <bernardocrodrigues@live.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: [pavel-leds:for-next 1/2] drivers/leds/leds-pca963x.c:357:4:
 warning: misleading indentation; statement is not part of the previous 'if'
Message-ID: <202209220459.9iyIqtgv-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
head:   31fd7108302388d732973c58470d4be559d352ec
commit: fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277 [1/2] leds: pca963x: fix blink with hw acceleration
config: hexagon-randconfig-r041-20220921 (https://download.01.org/0day-ci/archive/20220922/202209220459.9iyIqtgv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?id=fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277
        git remote add pavel-leds git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
        git fetch --no-tags pavel-leds for-next
        git checkout fd6dd9584ed3ee6debf2e7f9c9e69ef09b368277
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca963x.c:357:4: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
                           led->blinking = false;
                           ^
   drivers/leds/leds-pca963x.c:355:3: note: previous statement is here
                   if (hw_blink)
                   ^
   1 warning generated.


vim +/if +357 drivers/leds/leds-pca963x.c

   301	
   302	static int pca963x_register_leds(struct i2c_client *client,
   303					 struct pca963x *chip)
   304	{
   305		struct pca963x_chipdef *chipdef = chip->chipdef;
   306		struct pca963x_led *led = chip->leds;
   307		struct device *dev = &client->dev;
   308		struct fwnode_handle *child;
   309		bool hw_blink;
   310		s32 mode2;
   311		u32 reg;
   312		int ret;
   313	
   314		if (device_property_read_u32(dev, "nxp,period-scale",
   315					     &chipdef->scaling))
   316			chipdef->scaling = 1000;
   317	
   318		hw_blink = device_property_read_bool(dev, "nxp,hw-blink");
   319	
   320		mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
   321		if (mode2 < 0)
   322			return mode2;
   323	
   324		/* default to open-drain unless totem pole (push-pull) is specified */
   325		if (device_property_read_bool(dev, "nxp,totem-pole"))
   326			mode2 |= PCA963X_MODE2_OUTDRV;
   327		else
   328			mode2 &= ~PCA963X_MODE2_OUTDRV;
   329	
   330		/* default to non-inverted output, unless inverted is specified */
   331		if (device_property_read_bool(dev, "nxp,inverted-out"))
   332			mode2 |= PCA963X_MODE2_INVRT;
   333		else
   334			mode2 &= ~PCA963X_MODE2_INVRT;
   335	
   336		ret = i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
   337		if (ret < 0)
   338			return ret;
   339	
   340		device_for_each_child_node(dev, child) {
   341			struct led_init_data init_data = {};
   342			char default_label[32];
   343	
   344			ret = fwnode_property_read_u32(child, "reg", &reg);
   345			if (ret || reg >= chipdef->n_leds) {
   346				dev_err(dev, "Invalid 'reg' property for node %pfw\n",
   347					child);
   348				ret = -EINVAL;
   349				goto err;
   350			}
   351	
   352			led->led_num = reg;
   353			led->chip = chip;
   354			led->led_cdev.brightness_set_blocking = pca963x_led_set;
   355			if (hw_blink)
   356				led->led_cdev.blink_set = pca963x_blink_set;
 > 357				led->blinking = false;
   358	
   359			init_data.fwnode = child;
   360			/* for backwards compatibility */
   361			init_data.devicename = "pca963x";
   362			snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
   363				 client->adapter->nr, client->addr, reg);
   364			init_data.default_label = default_label;
   365	
   366			ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
   367							     &init_data);
   368			if (ret) {
   369				dev_err(dev, "Failed to register LED for node %pfw\n",
   370					child);
   371				goto err;
   372			}
   373	
   374			++led;
   375		}
   376	
   377		return 0;
   378	err:
   379		fwnode_handle_put(child);
   380		return ret;
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
