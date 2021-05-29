Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBB9394C83
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 16:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhE2OcX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 10:32:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:31862 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229681AbhE2OcX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 10:32:23 -0400
IronPort-SDR: SYVXzUcJ5Jm4O/oBaRge+lks1JQEeGaDSmUo0WNxhk3Dw4NErTWZx3/IA76r9RV1zK5V9qrVqx
 NSIHaR4/9mVA==
X-IronPort-AV: E=McAfee;i="6200,9189,9999"; a="200091344"
X-IronPort-AV: E=Sophos;i="5.83,233,1616482800"; 
   d="gz'50?scan'50,208,50";a="200091344"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2021 07:30:46 -0700
IronPort-SDR: YIAuI1DUY5+6F8V/d17rDM3Um57U1+MDefrty7X5o0u0/KPSNXGYtQJOWOni+g7ny4eHToTGEK
 ujK7bs6D0drw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,233,1616482800"; 
   d="gz'50?scan'50,208,50";a="398462921"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 May 2021 07:30:44 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lmzz9-0003mE-7p; Sat, 29 May 2021 14:30:43 +0000
Date:   Sat, 29 May 2021 22:30:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>
Subject: [pavel-linux-leds:for-next 24/30] drivers/leds/leds-lm36274.c:77:6:
 error: implicit declaration of function 'device_get_child_node_count'
Message-ID: <202105292204.dVIuHCEm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
head:   e1012160bbbca92d67c729f68108734b7d679db9
commit: e2e8e4e8187509a77cb6328d876d9c09c07c2e82 [24/30] leds: lm36274: Correct headers (of*.h -> mod_devicetable.h)
config: m68k-randconfig-r032-20210529 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?id=e2e8e4e8187509a77cb6328d876d9c09c07c2e82
        git remote add pavel-linux-leds git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
        git fetch --no-tags pavel-linux-leds for-next
        git checkout e2e8e4e8187509a77cb6328d876d9c09c07c2e82
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/leds/leds-lm36274.c: In function 'lm36274_parse_dt':
>> drivers/leds/leds-lm36274.c:77:6: error: implicit declaration of function 'device_get_child_node_count' [-Werror=implicit-function-declaration]
      77 |  if (device_get_child_node_count(dev) != 1)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lm36274.c:80:10: error: implicit declaration of function 'device_get_next_child_node' [-Werror=implicit-function-declaration]
      80 |  child = device_get_next_child_node(dev, NULL);
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lm36274.c:80:8: warning: assignment to 'struct fwnode_handle *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      80 |  child = device_get_next_child_node(dev, NULL);
         |        ^
>> drivers/leds/leds-lm36274.c:87:19: error: implicit declaration of function 'fwnode_property_count_u32' [-Werror=implicit-function-declaration]
      87 |  chip->num_leds = fwnode_property_count_u32(child, "led-sources");
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lm36274.c:93:8: error: implicit declaration of function 'fwnode_property_read_u32_array' [-Werror=implicit-function-declaration]
      93 |  ret = fwnode_property_read_u32_array(child, "led-sources",
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/leds-lm36274.c:102:2: error: implicit declaration of function 'fwnode_handle_put' [-Werror=implicit-function-declaration]
     102 |  fwnode_handle_put(child);
         |  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/device_get_child_node_count +77 drivers/leds/leds-lm36274.c

11e1bbc116a75d Dan Murphy  2019-06-05   68  
1aeef38c6a4a87 Marek Behún 2020-09-19   69  static int lm36274_parse_dt(struct lm36274 *chip,
1aeef38c6a4a87 Marek Behún 2020-09-19   70  			    struct led_init_data *init_data)
11e1bbc116a75d Dan Murphy  2019-06-05   71  {
5c0d20a968ae87 Marek Behún 2020-09-19   72  	struct device *dev = chip->dev;
1aeef38c6a4a87 Marek Behún 2020-09-19   73  	struct fwnode_handle *child;
a448fcf19c9c5d Marek Behún 2020-09-19   74  	int ret;
11e1bbc116a75d Dan Murphy  2019-06-05   75  
11e1bbc116a75d Dan Murphy  2019-06-05   76  	/* There should only be 1 node */
a448fcf19c9c5d Marek Behún 2020-09-19  @77  	if (device_get_child_node_count(dev) != 1)
11e1bbc116a75d Dan Murphy  2019-06-05   78  		return -EINVAL;
11e1bbc116a75d Dan Murphy  2019-06-05   79  
a448fcf19c9c5d Marek Behún 2020-09-19  @80  	child = device_get_next_child_node(dev, NULL);
a448fcf19c9c5d Marek Behún 2020-09-19   81  
1aeef38c6a4a87 Marek Behún 2020-09-19   82  	init_data->fwnode = child;
1aeef38c6a4a87 Marek Behún 2020-09-19   83  	init_data->devicename = chip->pdev->name;
1aeef38c6a4a87 Marek Behún 2020-09-19   84  	/* for backwards compatibility when `label` property is not present */
1aeef38c6a4a87 Marek Behún 2020-09-19   85  	init_data->default_label = ":";
11e1bbc116a75d Dan Murphy  2019-06-05   86  
d3ab963cf98015 Marek Behún 2020-09-19  @87  	chip->num_leds = fwnode_property_count_u32(child, "led-sources");
1aeef38c6a4a87 Marek Behún 2020-09-19   88  	if (chip->num_leds <= 0) {
1aeef38c6a4a87 Marek Behún 2020-09-19   89  		ret = -ENODEV;
1aeef38c6a4a87 Marek Behún 2020-09-19   90  		goto err;
1aeef38c6a4a87 Marek Behún 2020-09-19   91  	}
11e1bbc116a75d Dan Murphy  2019-06-05   92  
11e1bbc116a75d Dan Murphy  2019-06-05  @93  	ret = fwnode_property_read_u32_array(child, "led-sources",
a448fcf19c9c5d Marek Behún 2020-09-19   94  					     chip->led_sources, chip->num_leds);
11e1bbc116a75d Dan Murphy  2019-06-05   95  	if (ret) {
11e1bbc116a75d Dan Murphy  2019-06-05   96  		dev_err(dev, "led-sources property missing\n");
1aeef38c6a4a87 Marek Behún 2020-09-19   97  		goto err;
11e1bbc116a75d Dan Murphy  2019-06-05   98  	}
11e1bbc116a75d Dan Murphy  2019-06-05   99  
11e1bbc116a75d Dan Murphy  2019-06-05  100  	return 0;
1aeef38c6a4a87 Marek Behún 2020-09-19  101  err:
1aeef38c6a4a87 Marek Behún 2020-09-19 @102  	fwnode_handle_put(child);
1aeef38c6a4a87 Marek Behún 2020-09-19  103  	return ret;
11e1bbc116a75d Dan Murphy  2019-06-05  104  }
11e1bbc116a75d Dan Murphy  2019-06-05  105  

:::::: The code at line 77 was first introduced by commit
:::::: a448fcf19c9c5d3ddd9066accbd8d28c4950bb9f leds: lm36274: don't iterate through children since there is only one

:::::: TO: Marek Behún <marek.behun@nic.cz>
:::::: CC: Pavel Machek <pavel@ucw.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ZPt4rx8FFjLCG7dd
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ZPt4rx8FFjLCG7dd--
