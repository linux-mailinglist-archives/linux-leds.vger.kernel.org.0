Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13D0747A61
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jul 2023 01:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjGDXbL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jul 2023 19:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjGDXbJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jul 2023 19:31:09 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E20E7A;
        Tue,  4 Jul 2023 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688513468; x=1720049468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/C1Y+lxkTyN+kkBIpYhP3CMcKBqhJlI9zm3rmb7ICE4=;
  b=C9sSy1tXyC9CHrp42oqsyNMTk5huOve/+e7vY8OgrN81TKzdhK7bBQAI
   KchQuYnR7rKtKNHwC6ACehVuCQyVGa8yvwEWqk7etDLAyypuCvnTHnRtT
   /kyZh57o6aQEBrOMC0X9LfKtFFKu/MoCP/DgcbaxBu0Shp5938SJ8zRs8
   uOze0a4mFsj7aBwtrArqIi0o6VInLI2DByrzEOY5U4skco3s823dKnpou
   C3yRb5SqOXj7MOifxdNHmG9sWfmUeKTHh9X3JQZGpA4/qdBEsl0yeoZls
   OpjBxLsRPX8PWkv5VgX6hfum0sm0BMb8pvTK3PTjbvNbcbNr/+UhNmmev
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366692372"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="366692372"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 16:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="892974234"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="892974234"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jul 2023 16:31:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGpU8-000IdT-1N;
        Tue, 04 Jul 2023 23:31:04 +0000
Date:   Wed, 5 Jul 2023 07:30:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Marek Vasut <marex@denx.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: pca995x: Add support for PCA995X chips
Message-ID: <202307050752.XBy4Li9L-lkp@intel.com>
References: <20230704202843.91867-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704202843.91867-2-marex@denx.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on krzk-dt/for-next pavel-leds/for-next linus/master v6.4 next-20230704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/leds-pca995x-Add-support-for-PCA995X-chips/20230705-043046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20230704202843.91867-2-marex%40denx.de
patch subject: [PATCH 2/2] leds: pca995x: Add support for PCA995X chips
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230705/202307050752.XBy4Li9L-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050752.XBy4Li9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050752.XBy4Li9L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-pca995x.c: In function 'pca995x_probe':
>> drivers/leds/leds-pca995x.c:103:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     103 |         btype = (int)device_get_match_data(&client->dev);
         |                 ^
   drivers/leds/leds-pca995x.c: At top level:
   drivers/leds/leds-pca995x.c:190:18: error: initialization of 'int (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *, const struct i2c_device_id *)' [-Werror=incompatible-pointer-types]
     190 |         .probe = pca995x_probe,
         |                  ^~~~~~~~~~~~~
   drivers/leds/leds-pca995x.c:190:18: note: (near initialization for 'pca995x_driver.<anonymous>.probe')
   cc1: some warnings being treated as errors


vim +103 drivers/leds/leds-pca995x.c

    93	
    94	static int pca995x_probe(struct i2c_client *client, const struct i2c_device_id *id)
    95	{
    96		struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
    97		struct fwnode_handle *np, *child;
    98		struct device *dev = &client->dev;
    99		struct pca995x_chip *chip;
   100		struct pca995x_led *led;
   101		int i, btype, reg, ret;
   102	
 > 103		btype = (int)device_get_match_data(&client->dev);
   104	
   105		np = dev_fwnode(dev);
   106		if (!np)
   107			return -ENODEV;
   108	
   109		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
   110		if (!chip)
   111			return -ENOMEM;
   112	
   113		chip->btype = btype;
   114		chip->regmap = devm_regmap_init_i2c(client, &pca995x_regmap);
   115		if (IS_ERR(chip->regmap))
   116			return PTR_ERR(chip->regmap);
   117	
   118		i2c_set_clientdata(client, chip);
   119	
   120		fwnode_for_each_available_child_node(np, child) {
   121			ret = fwnode_property_read_u32(child, "reg", &reg);
   122			if (ret) {
   123				fwnode_handle_put(child);
   124				return ret;
   125			}
   126	
   127			if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg]) {
   128				fwnode_handle_put(child);
   129				return -EINVAL;
   130			}
   131	
   132			led = &chip->leds[reg];
   133			led_fwnodes[reg] = child;
   134			led->chip = chip;
   135			led->led_no = reg;
   136			led->ldev.brightness_set_blocking = pca995x_brightness_set;
   137			led->ldev.max_brightness = 255;
   138		}
   139	
   140		for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
   141			struct led_init_data init_data = {};
   142	
   143			if (!led_fwnodes[i])
   144				continue;
   145	
   146			init_data.fwnode = led_fwnodes[i];
   147	
   148			ret = devm_led_classdev_register_ext(dev,
   149							     &chip->leds[i].ldev,
   150							     &init_data);
   151			if (ret < 0) {
   152				fwnode_handle_put(child);
   153				return dev_err_probe(dev, ret,
   154						     "Could not register LED %s\n",
   155						     chip->leds[i].ldev.name);
   156			}
   157		}
   158	
   159		/* Disable LED all-call address and set normal mode */
   160		ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE_1_CFG);
   161		if (ret)
   162			return ret;
   163	
   164		/* IREF Output current value for all LEDn outputs */
   165		return regmap_write(chip->regmap,
   166				    btype ? PCA9955B_IREFALL : PCA9952_IREFALL,
   167				    PCA995X_IREFALL_CFG);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
