Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA81FD55D
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2020 21:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgFQTWd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jun 2020 15:22:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45232 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFQTWc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jun 2020 15:22:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05HJMJ0T074159;
        Wed, 17 Jun 2020 14:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592421739;
        bh=Bkn+lQ7tZTYAmQ+YAHSjbAZtH5GQl0iS1nrW8ZoWpTo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=P2cQuGD/oBIZXT7KVhuJSwqLsVKQT7n0b+rIdMBvgLV56NSUHJCUln3AI4NgOkioC
         u3MsHavBkDxTnvb7TryTbVYZUTUr99SKLM+Wmj2uLOS2mM04d0R8R+2i2km3kHtSZ7
         7l3YvvihLokfoeh5SRMlO6gQlrjP23xU3XLVt7mQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05HJMJUj075690
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Jun 2020 14:22:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 14:22:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 17 Jun 2020 14:22:18 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HJMIGC110715;
        Wed, 17 Jun 2020 14:22:18 -0500
Subject: Re: [RESEND PATCH v27 11/15] leds: lp55xx: Add multicolor framework
 support to lp55xx
To:     kernel test robot <lkp@intel.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh@kernel.org>
CC:     <kbuild-all@lists.01.org>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200615201522.19677-12-dmurphy@ti.com>
 <202006180032.JW0i39C6%lkp@intel.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0a8a6f57-678d-b1b9-41e5-5e58c15cfe6b@ti.com>
Date:   Wed, 17 Jun 2020 14:22:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <202006180032.JW0i39C6%lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel/Jacek

On 6/17/20 11:28 AM, kernel test robot wrote:
> Hi Dan,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on pavel-linux-leds/for-next]
> [cannot apply to j.anaszewski-leds/for-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217
> base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
> config: ia64-randconfig-r015-20200617 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=ia64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function `lp55xx_set_mc_brightness':
>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference to `led_mc_calc_color_components'
> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function `devm_led_classdev_multicolor_register':
>>> include/linux/led-class-multicolor.h:74: undefined reference to `devm_led_classdev_multicolor_register_ext'
> vim +146 drivers/leds/leds-lp55xx-common.c
>
>     138	
>     139	static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
>     140					    enum led_brightness brightness)
>     141	{
>     142		struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
>     143		struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
>     144		struct lp55xx_device_config *cfg = led->chip->cfg;
>     145	
>   > 146		led_mc_calc_color_components(&led->mc_cdev, brightness);
>     147		return cfg->multicolor_brightness_fn(led);
>     148	

Well this was a mess to figure out.

The only fix I can figure out here is to remove the

     depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR

from each child device and add

     select LEDS_CLASS_MULTI_COLOR

to the LP55XX_COMMON

This way the Multi color framework will inherit the symbol that was set 
by the COMMON flag which is inherited by majority from the child flags.

Dan

