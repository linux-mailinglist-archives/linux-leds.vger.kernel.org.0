Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87365281D2
	for <lists+linux-leds@lfdr.de>; Mon, 16 May 2022 12:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbiEPKWe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 May 2022 06:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbiEPKW1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 May 2022 06:22:27 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C88DF28;
        Mon, 16 May 2022 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652696537; x=1684232537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1wcjLqj/Sl4OKFLkc9eIfGdzT4pWqw1XQuQzqw/g7sk=;
  b=imgqVhREsR9TCl+G14jSzcAMLHlZJLz4iqOMF0rdstYInmFhXv971wMk
   CFIexkuGHrsShecOR8VTkOFVg4Rj+XUr82bu0otjmQ8d6Y9prbAScyKDx
   YmhxbtqH6BiVDv+3CAPpeZjLPLdtjzh5H3MHxd+5eOGC+4QVc5y4mpvhu
   Y+xA5iE+MTsP7TyNwHJ1BrnjFePNRZ7rKfOnov9260yvTae7SGkY8k80k
   qKcm/oTe5smuE3B9UuKnEmsXxiedNIvnob1Z0uSoetG0U0JwWl0xCowp2
   vGQsnigZEjiAkOxj/zYSqcgOrOH7++OmeQdzrK9PJeeA+FNSqhX3jPskz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="331415899"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="331415899"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="522388244"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:22:13 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqXrg-0002K9-VY;
        Mon, 16 May 2022 10:22:12 +0000
Date:   Mon, 16 May 2022 18:21:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kyle Swenson <kyle.swenson@est.tech>, pavel@ucw.cz,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>
Subject: Re: [PATCH 1/2] leds: aw21024: Add support for Awinic's AW21024
Message-ID: <202205161802.8WYsbizM-lkp@intel.com>
References: <20220513190409.3682501-1-kyle.swenson@est.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513190409.3682501-1-kyle.swenson@est.tech>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Kyle,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on robh/for-next v5.18-rc7 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Swenson/leds-aw21024-Add-support-for-Awinic-s-AW21024/20220514-030705
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: mips-randconfig-r006-20220516 (https://download.01.org/0day-ci/archive/20220516/202205161802.8WYsbizM-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/38eeda60299918b5599f4a58714dc91f9741677c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kyle-Swenson/leds-aw21024-Add-support-for-Awinic-s-AW21024/20220514-030705
        git checkout 38eeda60299918b5599f4a58714dc91f9741677c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/leds/leds-aw21024.c: In function 'aw21024_led_brightness_set':
>> drivers/leds/leds-aw21024.c:64:31: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Werror=implicit-function-declaration]
      64 |                         ret = i2c_smbus_write_byte_data(parent->client,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-aw21024.c: In function 'aw21024_configure':
>> drivers/leds/leds-aw21024.c:213:15: error: implicit declaration of function 'i2c_smbus_read_byte_data' [-Werror=implicit-function-declaration]
     213 |         ret = i2c_smbus_read_byte_data(client, AW21024_REG_SW_RESET);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-aw21024.c: At top level:
>> drivers/leds/leds-aw21024.c:310:1: warning: data definition has no type or storage class
     310 | module_i2c_driver(aw21024_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/leds/leds-aw21024.c:310:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
>> drivers/leds/leds-aw21024.c:310:1: warning: parameter names (without types) in function declaration
   drivers/leds/leds-aw21024.c:301:26: warning: 'aw21024_driver' defined but not used [-Wunused-variable]
     301 | static struct i2c_driver aw21024_driver = {
         |                          ^~~~~~~~~~~~~~
   drivers/leds/leds-aw21024.c:295:34: warning: 'of_aw21024_leds_match' defined but not used [-Wunused-const-variable=]
     295 | static const struct of_device_id of_aw21024_leds_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_smbus_write_byte_data +64 drivers/leds/leds-aw21024.c

    51	
    52	static int aw21024_led_brightness_set(struct led_classdev *led_cdev,
    53						enum led_brightness brightness)
    54	{
    55		struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
    56		struct aw21024_led_data *led = container_of(mc_cdev, struct aw21024_led_data, mc_cdev);
    57		struct aw21024 *parent = led->parent;
    58		int i;
    59		int ret = 0;
    60	
    61		mutex_lock(&parent->lock);
    62		if (mc_cdev->num_colors && mc_cdev->subled_info) {
    63			for (i = 0; i < led->nregs; i++) {
  > 64				ret = i2c_smbus_write_byte_data(parent->client,
    65						AW21024_REG_DC_CURRENT(led->regs[i]),
    66						mc_cdev->subled_info[i].intensity);
    67				if (ret < 0)
    68					goto unlock_ret;
    69	
    70				ret = i2c_smbus_write_byte_data(parent->client,
    71						AW21024_REG_BRIGHTNESS(led->regs[i]),
    72						brightness);
    73				if (ret < 0)
    74					goto unlock_ret;
    75			}
    76		} else {
    77			ret = i2c_smbus_write_byte_data(parent->client,
    78						AW21024_REG_DC_CURRENT(led->regs[0]), 0xFF);
    79			if (ret < 0)
    80				goto unlock_ret;
    81	
    82			ret = i2c_smbus_write_byte_data(parent->client,
    83						AW21024_REG_BRIGHTNESS(led->regs[0]),
    84						brightness);
    85			if (ret < 0)
    86				goto unlock_ret;
    87		}
    88		ret = i2c_smbus_write_byte_data(parent->client, AW21024_REG_UPDATE, 0x0);
    89	unlock_ret:
    90		mutex_unlock(&parent->lock);
    91		return ret;
    92	}
    93	
    94	static int aw21024_probe_dt(struct aw21024 *data)
    95	{
    96		struct device *dev = &data->client->dev;
    97		struct fwnode_handle *child = NULL;
    98		struct fwnode_handle *led_node = NULL;
    99		struct led_init_data init_data = {};
   100		u32 color_id;
   101		int  ret, num_colors;
   102		unsigned int nleds = 0;
   103		struct aw21024_led_data *led;
   104		struct led_classdev *led_cdev;
   105		struct mc_subled *mc_led_info;
   106	
   107		nleds = device_get_child_node_count(dev);
   108	
   109		data->leds = devm_kcalloc(dev, nleds, sizeof(*(data->leds)), GFP_KERNEL);
   110		if (!data->leds)
   111			return -ENOMEM;
   112	
   113		device_for_each_child_node(dev, child) {
   114			led = devm_kzalloc(dev, sizeof(struct aw21024_led_data), GFP_KERNEL);
   115			if (!led) {
   116				ret = -ENOMEM;
   117				goto ret_put_child;
   118			}
   119			led->parent = data;
   120			led_cdev = &led->mc_cdev.led_cdev;
   121			init_data.fwnode = child;
   122	
   123			led_cdev->brightness_set_blocking = aw21024_led_brightness_set;
   124			data->leds[data->nleds] = led;
   125	
   126			ret = fwnode_property_count_u32(child, "reg");
   127			if (ret < 0) {
   128				dev_err(dev, "reg property is invalid in node %s\n",
   129						fwnode_get_name(child));
   130				goto ret_put_child;
   131			}
   132	
   133			led->regs = devm_kcalloc(dev, ret, sizeof(*(led->regs)), GFP_KERNEL);
   134			led->nregs = ret;
   135			if (!led->regs) {
   136				ret = -ENOMEM;
   137				goto ret_put_child;
   138			}
   139	
   140			ret = fwnode_property_read_u32_array(child, "reg", led->regs, led->nregs);
   141			if (ret) {
   142				dev_err(dev, "Failed to read reg array, error=%d\n", ret);
   143				goto ret_put_child;
   144			}
   145	
   146			if (led->nregs > 1) {
   147				mc_led_info = devm_kcalloc(dev, led->nregs,
   148							    sizeof(*mc_led_info), GFP_KERNEL);
   149				if (!mc_led_info) {
   150					ret = -ENOMEM;
   151					goto ret_put_child;
   152				}
   153	
   154				num_colors = 0;
   155				fwnode_for_each_child_node(child, led_node) {
   156					if (num_colors > led->nregs) {
   157						ret = -EINVAL;
   158						fwnode_handle_put(led_node);
   159						goto ret_put_child;
   160					}
   161	
   162					ret = fwnode_property_read_u32(led_node, "color",
   163								       &color_id);
   164					if (ret) {
   165						fwnode_handle_put(led_node);
   166						goto ret_put_child;
   167					}
   168					mc_led_info[num_colors].color_index = color_id;
   169					num_colors++;
   170				}
   171	
   172				led->mc_cdev.num_colors = num_colors;
   173				led->mc_cdev.subled_info = mc_led_info;
   174				ret = devm_led_classdev_multicolor_register_ext(dev,
   175									&led->mc_cdev,
   176									&init_data);
   177				if (ret < 0) {
   178					dev_warn(dev, "Failed to register multicolor LED %s, err=%d\n",
   179							    fwnode_get_name(child), ret);
   180					goto ret_put_child;
   181				}
   182			} else {
   183				ret = devm_led_classdev_register_ext(dev,
   184								    &led->mc_cdev.led_cdev, &init_data);
   185				if (ret < 0) {
   186					dev_warn(dev, "Failed to register LED %s, err=%d\n",
   187							fwnode_get_name(child), ret);
   188					goto ret_put_child;
   189				}
   190			}
   191			data->nleds++;
   192		}
   193	
   194		return 0;
   195	
   196	ret_put_child:
   197		fwnode_handle_put(child);
   198		return ret;
   199	}
   200	
   201	/* Expected to be called prior to registering with the LEDs class */
   202	static int aw21024_configure(struct aw21024 *priv)
   203	{
   204		int ret = 0;
   205		struct i2c_client *client = priv->client;
   206	
   207		ret = i2c_smbus_write_byte_data(client, AW21024_REG_GCR0, AW21024_GCR0_CHIPEN);
   208		if (ret < 0) {
   209			dev_err(&client->dev, "Failed to write chip enable\n");
   210			return -ENODEV;
   211		}
   212	
 > 213		ret = i2c_smbus_read_byte_data(client, AW21024_REG_SW_RESET);
   214		if (ret < 0) {
   215			dev_err(&client->dev, "Failed to read chip id\n");
   216			return -ENODEV;
   217		}
   218	
   219		if (ret != AW21024_CHIP_ID) {
   220			dev_err(&client->dev, "Chip ID 0x%02X doesn't match expected (0x%02X)\n",
   221									ret, AW21024_CHIP_ID);
   222			return -ENODEV;
   223		}
   224	
   225		ret = i2c_smbus_read_byte_data(client, AW21024_REG_VERSION);
   226		if (ret < 0) {
   227			dev_err(&client->dev, "Failed to read chip version\n");
   228			return -ENODEV;
   229		}
   230		if (ret != AW21024_CHIP_VERSION)
   231			dev_warn(&client->dev, "Chip version 0x%02X doesn't match expected 0x%02X\n",
   232									ret, AW21024_CHIP_VERSION);
   233	
   234		i2c_smbus_write_byte_data(client, AW21024_REG_SW_RESET, 0x00);
   235		mdelay(2);
   236		i2c_smbus_write_byte_data(client, AW21024_REG_GCR0, AW21024_GCR0_CHIPEN);
   237		i2c_smbus_write_byte_data(client, AW21024_REG_GCC, 0xFF);
   238	
   239		return 0;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
