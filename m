Return-Path: <linux-leds+bounces-4-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B617E8F96
	for <lists+linux-leds@lfdr.de>; Sun, 12 Nov 2023 12:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2BBB1F20ECB
	for <lists+linux-leds@lfdr.de>; Sun, 12 Nov 2023 11:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B742679CF;
	Sun, 12 Nov 2023 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVUtGAPp"
X-Original-To: linux-leds@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3479F1;
	Sun, 12 Nov 2023 11:22:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE147D54;
	Sun, 12 Nov 2023 03:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699788149; x=1731324149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YumjCao4NfDMti/9onGh5cRCBZAETxJB4XFxJqLYREk=;
  b=CVUtGAPpDdJWf55ITx+yrPq83ZTtGASa1fJaQPAsHz/C2AXSG3jkAkpg
   hIeHIHn0z5jABe2+UTJaJQyD8/oVK7eFGqYisSb1KTWrli4Id2zW1jPdx
   Cz/lqfDP2umlebBuYzzWbStp23A0nYbJ9oQUAXcuufFiwDp8MoROClc0i
   amNhdXjFtSxBF1zMif3ZOKR0JEkVWvW8ryhWzJ747RFLrxBjMdGL//puF
   TL0rj0JCMDwHcAw4vmYcNRhNhFwO8AulReuCxb3kFlY5waDR8qPaEgbxW
   dXi5ZliAD7qi0ugVreYXysRZBP7fMPJ8KvALZqH5xG9PefIQYqnG5u7+o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="476548234"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="476548234"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 03:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="1095518711"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="1095518711"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Nov 2023 03:22:26 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r28Xn-000B74-2t;
	Sun, 12 Nov 2023 11:22:23 +0000
Date: Sun, 12 Nov 2023 19:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yuxi Wang <wyx137120466@gmail.com>, pavel@ucw.cz, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, Yuxi.Wang@monolithicpower.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: add mp3326 driver
Message-ID: <202311121908.Kyj8FdWx-lkp@intel.com>
References: <20231108032921.3134115-3-wyx137120466@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108032921.3134115-3-wyx137120466@gmail.com>

Hi Yuxi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next pavel-leds/for-next linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuxi-Wang/dt-bindings-leds-add-mps-mp3326-LED/20231108-113235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20231108032921.3134115-3-wyx137120466%40gmail.com
patch subject: [PATCH 2/2] leds: add mp3326 driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231112/202311121908.Kyj8FdWx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121908.Kyj8FdWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121908.Kyj8FdWx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-mp3326.c:490:9: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     490 |                         info[i].color_index = color;
         |                              ^
   drivers/leds/leds-mp3326.c:449:7: note: initialize the variable 'i' to silence this warning
     449 |         int i;
         |              ^
         |               = 0
   drivers/leds/leds-mp3326.c:546:37: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     546 |                 ret = mp3326_add_led(chip, child, i);
         |                                                   ^
   drivers/leds/leds-mp3326.c:542:7: note: initialize the variable 'i' to silence this warning
     542 |         int i;
         |              ^
         |               = 0
   2 warnings generated.


vim +/i +490 drivers/leds/leds-mp3326.c

   440	
   441	static int mp3326_add_led(struct mp3326 *chip, struct device_node *np, int index)
   442	{
   443		struct mp3326_led *led = &chip->leds[index];
   444		struct mc_subled *info;
   445		struct device_node *child;
   446		struct led_classdev *cdev;
   447		struct led_init_data init_data = {};
   448		int ret;
   449		int i;
   450		int count;
   451		u32 color = 0;
   452		u32 reg = 0;
   453	
   454		ret = of_property_read_u32(np, "color", &color);
   455		if (ret) {
   456			dev_err(&chip->client->dev, "Miss color in the node\n");
   457			return ret;
   458		}
   459		led->private_data = chip;
   460		if (color == LED_COLOR_ID_RGB) {
   461			count = of_get_child_count(np);
   462			if (count != 3) {
   463				dev_err(&chip->client->dev, "RGB must have three node.\n");
   464				return -EINVAL;
   465			}
   466	
   467			info = devm_kcalloc(&chip->client->dev, 3, sizeof(*info), GFP_KERNEL);
   468			if (!info)
   469				return -ENOMEM;
   470	
   471			for_each_available_child_of_node(np, child) {
   472				ret = of_property_read_u32(child, "reg", &reg);
   473				if (ret || reg > MAX_CHANNEL) {
   474					dev_err(&chip->client->dev,
   475					"reg must less or equal than %d\n", MAX_CHANNEL);
   476					return -EINVAL;
   477				}
   478	
   479				ret = of_property_read_u32(child, "color", &color);
   480				if (ret) {
   481					dev_err(&chip->client->dev, "color must have value\n");
   482					return ret;
   483				}
   484	
   485				if (color > 3 || !color) {
   486					dev_err(&chip->client->dev,
   487					"color must be Red, Green and Blue. The color is %d\n", color);
   488					return ret;
   489				}
 > 490				info[i].color_index = color;
   491				info[i].channel = reg - 1;
   492				info[i].brightness = 0;
   493				i++;
   494			}
   495	
   496			led->subled_info = info;
   497			led->num_colors = 3;
   498			cdev = &led->cdev;
   499			cdev->max_brightness = MAX_BRIGHTNESS;
   500			cdev->brightness_set_blocking = led_brightness_set;
   501			cdev->groups = led_sysfs_groups;
   502			init_data.fwnode = &np->fwnode;
   503	
   504			ret = devm_led_classdev_register_ext(&chip->client->dev, &led->cdev, &init_data);
   505	
   506			if (ret) {
   507				dev_err(&chip->client->dev, "Unable register multicolor:%s\n", cdev->name);
   508				return ret;
   509			}
   510		} else {
   511			ret = of_property_read_u32(np, "reg", &reg);
   512			if (ret || reg > MAX_CHANNEL) {
   513				dev_err(&chip->client->dev,
   514				"reg must less or equal than %d\n", MAX_CHANNEL);
   515				return -EINVAL;
   516			}
   517			info = devm_kcalloc(&chip->client->dev, 1, sizeof(*info), GFP_KERNEL);
   518			led->num_colors = 1;
   519			info[i].color_index = LED_COLOR_ID_WHITE;
   520			info[i].channel = reg - 1;
   521			info[i].brightness = 0;
   522			led->subled_info = info;
   523			cdev = &led->cdev;
   524			cdev->max_brightness = MAX_BRIGHTNESS;
   525			cdev->brightness_set_blocking = led_brightness_set;
   526			cdev->groups = led_sysfs_groups;
   527			init_data.fwnode = &np->fwnode;
   528			ret = devm_led_classdev_register_ext(&chip->client->dev, &led->cdev, &init_data);
   529			if (ret) {
   530				dev_err(&chip->client->dev, "Unable register led:%s\n", cdev->name);
   531				return ret;
   532			}
   533		}
   534		return ret;
   535	}
   536	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

