Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C3020371B
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 14:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgFVMpX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jun 2020 08:45:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50482 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgFVMpX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2020 08:45:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05MCjGnI050630;
        Mon, 22 Jun 2020 07:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592829916;
        bh=3qiTHTUoV+ImJn1zB5Z98MyZpLyre6vaDs2W/lCmdUk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ikx1sffSBezR/katsE55TDSHJ95a6SQDgM0iYLOihxKlvAmva7oSPq51GajDl1QQN
         wi7dmUaVvPlibESpHOR77FbDVJGiTnfUpOiySEslDbDmiqLPl8KAS7aVwq66fsEpR7
         AeVVmB54xfAWmHSya+8r/mv5saFom07zHDxdjpFc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05MCjGte095964
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Jun 2020 07:45:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Jun 2020 07:45:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Jun 2020 07:45:16 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05MCjFQZ060372;
        Mon, 22 Jun 2020 07:45:15 -0500
Subject: Re: [RESEND PATCH v27 11/15] leds: lp55xx: Add multicolor framework
 support to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <robh@kernel.org>
CC:     <kbuild-all@lists.01.org>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200615201522.19677-12-dmurphy@ti.com>
 <202006180032.JW0i39C6%lkp@intel.com>
 <0a8a6f57-678d-b1b9-41e5-5e58c15cfe6b@ti.com>
 <58ad7723-131f-6930-00d7-1144c993110c@gmail.com>
 <fc1ae702-0734-973d-9e3c-22b8f8d5c873@ti.com>
 <fc410dfb-70d1-1b8b-3b6d-0de1c6c84ec2@gmail.com>
 <56823113-4875-4813-8627-84b0d1792391@ti.com>
 <bd603f01-2c1b-6167-d88c-3895c1bfdf6c@gmail.com>
 <fad98aa3-cec6-3cde-951f-fa2b57c26d03@gmail.com>
 <04473d1d-5cd8-7d1f-7c5d-8d8b582df464@ti.com>
 <1f5dd2f9-01c7-1f74-9b93-0ae2a6dac915@gmail.com>
 <69c01524-c4a4-55c8-578e-24b26bc863b8@ti.com>
 <52d2c06a-d4ab-b9b2-b1d3-d5f81780cd7f@gmail.com>
 <9a396176-c6e8-c403-df10-ee94ff5f0ebd@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2c692161-e7ee-7f03-51f0-568bc03e7c7b@ti.com>
Date:   Mon, 22 Jun 2020 07:45:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9a396176-c6e8-c403-df10-ee94ff5f0ebd@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 6/22/20 7:42 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 6/21/20 10:24 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 6/21/20 4:12 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 6/19/20 5:10 PM, Jacek Anaszewski wrote:
>>>> Dan,
>>>>
>>>> On 6/19/20 6:35 PM, Dan Murphy wrote:
>>>>> Jacek
>>>>>
>>>>> On 6/18/20 6:26 PM, Jacek Anaszewski wrote:
>>>>>> On 6/19/20 12:09 AM, Jacek Anaszewski wrote:
>>>>>>> Dan,
>>>>>>>
>>>>>>> On 6/18/20 11:44 PM, Dan Murphy wrote:
>>>>>>>> Jacek
>>>>>>>>
>>>>>>>> On 6/18/20 4:21 PM, Jacek Anaszewski wrote:
>>>>>>>>> Dan,
>>>>>>>>>
>>>>>>>>> On 6/18/20 12:33 AM, Dan Murphy wrote:
>>>>>>>>>> Jacek
>>>>>>>>>>
>>>>>>>>>> On 6/17/20 4:41 PM, Jacek Anaszewski wrote:
>>>>>>>>>>> Dan,
>>>>>>>>>>>
>>>>>>>>>>> On 6/17/20 9:22 PM, Dan Murphy wrote:
>>>>>>>>>>>> Pavel/Jacek
>>>>>>>>>>>>
>>>>>>>>>>>> On 6/17/20 11:28 AM, kernel test robot wrote:
>>>>>>>>>>>>> Hi Dan,
>>>>>>>>>>>>>
>>>>>>>>>>>>> I love your patch! Yet something to improve:
>>>>>>>>>>>>>
>>>>>>>>>>>>> [auto build test ERROR on pavel-linux-leds/for-next]
>>>>>>>>>>>>> [cannot apply to j.anaszewski-leds/for-next]
>>>>>>>>>>>>> [if your patch is applied to the wrong git tree, please 
>>>>>>>>>>>>> drop us a note to help
>>>>>>>>>>>>> improve the system. BTW, we also suggest to use '--base' 
>>>>>>>>>>>>> option to specify the
>>>>>>>>>>>>> base tree in git format-patch, please see 
>>>>>>>>>>>>> https://stackoverflow.com/a/37406982]
>>>>>>>>>>>>>
>>>>>>>>>>>>> url: 
>>>>>>>>>>>>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>>>>>>>>>>>>
>>>>>>>>>>>>> base: 
>>>>>>>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git 
>>>>>>>>>>>>> for-next
>>>>>>>>>>>>> config: ia64-randconfig-r015-20200617 (attached as .config)
>>>>>>>>>>>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>>>>>>>>>>>> reproduce (this is a W=1 build):
>>>>>>>>>>>>>          wget 
>>>>>>>>>>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>>>>>>>>>>> -O ~/bin/make.cross
>>>>>>>>>>>>>          chmod +x ~/bin/make.cross
>>>>>>>>>>>>>          # save the attached .config to linux build tree
>>>>>>>>>>>>>          COMPILER_INSTALL_PATH=$HOME/0day 
>>>>>>>>>>>>> COMPILER=gcc-9.3.0 make.cross ARCH=ia64
>>>>>>>>>>>>>
>>>>>>>>>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>>>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> All errors (new ones prefixed by >>, old ones prefixed by 
>>>>>>>>>>>>> <<):
>>>>>>>>>>>>>
>>>>>>>>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in 
>>>>>>>>>>>>> function `lp55xx_set_mc_brightness':
>>>>>>>>>>>>>>> drivers/leds/leds-lp55xx-common.c:146: undefined 
>>>>>>>>>>>>>>> reference to `led_mc_calc_color_components'
>>>>>>>>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in 
>>>>>>>>>>>>> function `devm_led_classdev_multicolor_register':
>>>>>>>>>>>>>>> include/linux/led-class-multicolor.h:74: undefined 
>>>>>>>>>>>>>>> reference to `devm_led_classdev_multicolor_register_ext'
>>>>>>>>>>>>> vim +146 drivers/leds/leds-lp55xx-common.c
>>>>>>>>>>>>>
>>>>>>>>>>>>>     138
>>>>>>>>>>>>>     139    static int lp55xx_set_mc_brightness(struct 
>>>>>>>>>>>>> led_classdev *cdev,
>>>>>>>>>>>>>     140                        enum led_brightness 
>>>>>>>>>>>>> brightness)
>>>>>>>>>>>>>     141    {
>>>>>>>>>>>>>     142        struct led_classdev_mc *mc_dev = 
>>>>>>>>>>>>> lcdev_to_mccdev(cdev);
>>>>>>>>>>>>>     143        struct lp55xx_led *led = 
>>>>>>>>>>>>> mcled_cdev_to_led(mc_dev);
>>>>>>>>>>>>>     144        struct lp55xx_device_config *cfg = 
>>>>>>>>>>>>> led->chip->cfg;
>>>>>>>>>>>>>     145
>>>>>>>>>>>>>   > 146 led_mc_calc_color_components(&led->mc_cdev, 
>>>>>>>>>>>>> brightness);
>>>>>>>>>>>>>     147        return cfg->multicolor_brightness_fn(led);
>>>>>>>>>>>>>     148
>>>>>>>>>>>>
>>>>>>>>>>>> Well this was a mess to figure out.
>>>>>>>>>>>>
>>>>>>>>>>>> The only fix I can figure out here is to remove the
>>>>>>>>>>>>
>>>>>>>>>>>>      depends on LEDS_CLASS_MULTI_COLOR || 
>>>>>>>>>>>> !LEDS_CLASS_MULTI_COLOR
>>>>>>>>>>>>
>>>>>>>>>>>> from each child device and add
>>>>>>>>>>>>
>>>>>>>>>>>>      select LEDS_CLASS_MULTI_COLOR
>>>>>>>>>>>>
>>>>>>>>>>>> to the LP55XX_COMMON
>>>>>>>>>>>>
>>>>>>>>>>>> This way the Multi color framework will inherit the symbol 
>>>>>>>>>>>> that was set by the COMMON flag which is inherited by 
>>>>>>>>>>>> majority from the child flags.
>>>>>>>>>>>
>>>>>>>>>>> Did you try this?
>>>>>>>>>>>
>>>>>>>>>>> --- a/drivers/leds/Kconfig
>>>>>>>>>>> +++ b/drivers/leds/Kconfig
>>>>>>>>>>> @@ -398,6 +398,7 @@ config LEDS_LP50XX
>>>>>>>>>>>  config LEDS_LP55XX_COMMON
>>>>>>>>>>>         tristate "Common Driver for TI/National 
>>>>>>>>>>> LP5521/5523/55231/5562/8501"
>>>>>>>>>>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 
>>>>>>>>>>> || LEDS_LP8501
>>>>>>>>>>> +       depends on LEDS_CLASS_MULTI_COLOR || 
>>>>>>>>>>> !LEDS_CLASS_MULTI_COLOR
>>>>>>>>>>>         depends on OF
>>>>>>>>>>>         select FW_LOADER
>>>>>>>>>>>         select FW_LOADER_USER_HELPER
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>> Yes I did
>>>>>>>>>>
>>>>>>>>>> That gave unmet dependencies.
>>>>>>>>>>
>>>>>>>>>> WARNING: unmet direct dependencies detected for 
>>>>>>>>>> LEDS_LP55XX_COMMON
>>>>>>>>>>    Depends on [m]: NEW_LEDS [=y] && (LEDS_LP5521 [=n] || 
>>>>>>>>>> LEDS_LP5523 [=m] || LEDS_LP5562 [=y] || LEDS_LP8501 [=y]) && 
>>>>>>>>>> (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m]) 
>>>>>>>>>> && OF [=y]
>>>>>>>>>>    Selected by [y]:
>>>>>>>>>>    - LEDS_LP5562 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && 
>>>>>>>>>> I2C [=y]
>>>>>>>>>>    - LEDS_LP8501 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && 
>>>>>>>>>> I2C [=y]
>>>>>>>>>>    Selected by [m]:
>>>>>>>>>>    - LEDS_LP5523 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && 
>>>>>>>>>> I2C [=y] && (LEDS_CLASS_MULTI_COLOR [=m] || 
>>>>>>>>>> !LEDS_CLASS_MULTI_COLOR [=m])
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> When I was testing that yesterday I also had the same warning 
>>>>>>>>> at some
>>>>>>>>> point of testing different Kconfig setups, but with what I 
>>>>>>>>> showed above
>>>>>>>>> it ceased to appear. Now every time I am doing "make 
>>>>>>>>> oldconfig" the
>>>>>>>>> CONFIG_LEDS_LP55XX_COMMON=y entry gets changed to =m with the 
>>>>>>>>> config
>>>>>>>>> from the test bot.
>>>>>>>>>
>>>>>>>> That is not what I saw in my testing especially after doing a 
>>>>>>>> distclean
>>>>>>>
>>>>>>> Could you please give your exact steps after "make distclean" and
>>>>>>> copying test bot config to the kernel root directory?
>>>>>>>
>>>>>>> Also, please share the toolchain you're using for tests.
>>>>>>
>>>>>> Actually at this stage the toolchain is of lesser relevance.
>>>>>>
>>>>>> I've tried once more and indeed the problem shows up.
>>>>>>
>>>>>> It is caused by the driver entries doing
>>>>>>
>>>>>> "select LEDS_LP55XX_COMMON".
>>>>>>
>>>>>> Select sets config to "y" so it conflicts with
>>>>>> "depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR"
>>>>>> in the "config LEDS_LP55XX_COMMON".
>>>>>>
>>>>>> Your proposed fix will block the possibility of building
>>>>>> LED_CLASS_MULTI_COLOR as a module when LP55XX drivers
>>>>>> are enabled so this is also not an option.
>>>>>>
>>>>>> Solving this riddle will require some more thinking.
>>>>>> I haven't analyzed it in detail but maybe "imply" statement from
>>>>>> kconfig-language.rst could help somehow here. 
>>>>>
>>>>> The multicolor framework will build as a module if the LED_CLASS 
>>>>> is defined as a module.
>>>>>
>>>>> See attached test_defconfig
>>>>
>>>> But it will be impossible to enable CONFIG_LEDS_LP50XX without
>>>> CONFIG_LEDS_CLASS_MULTI_COLOR if you will remove
>>>>
>>>> depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR.
>>>>
>>> I was not removing the dependency for the LP50xx only the LP55xx.
>>
>> It was my typo, I meant LP55XX.
>>
>>>
>>>> This is actually why the above entry was needed.
>>>>
>>>> LP55XX drivers have to work also without multicolor class.
>>>>
>>> Well I am not sure how else to resolve this problem.  Because the 
>>> LP55xx has multi level dependencies.
>>>
>>> Only the LP55xx_common has the dependency on the MC framework. The 
>>> device drivers do not.
>>>
>>> The issue is the mixing and matching of the MC fw as a module vs the 
>>> LP55XX_COMMON as a built-in.
>>
>> The simplest solution is to avoid selecting LP55XX_COMMON in favor
>> of making child drivers depending on it. Of course, maybe there exists
>> some trickier option to keep the selection, but I would have to play
>> a bit more with it to be sure.
>
> Yep, this seems to be the only viable solution.
>
> My proposed change to the Kconfig:
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index adfa762cb291..10de7d237ffd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -397,10 +397,10 @@ config LEDS_LP50XX
>
>  config LEDS_LP55XX_COMMON
>         tristate "Common Driver for TI/National 
> LP5521/5523/55231/5562/8501"
> -       depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || 
> LEDS_LP8501
>         depends on OF
>         select FW_LOADER
>         select FW_LOADER_USER_HELPER
> +       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>         help
>           This option supports common operations for 
> LP5521/5523/55231/5562/8501
>           devices.
> @@ -408,8 +408,7 @@ config LEDS_LP55XX_COMMON
>  config LEDS_LP5521
>         tristate "LED Support for N.S. LP5521 LED driver chip"
>         depends on LEDS_CLASS && I2C
> -       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
> -       select LEDS_LP55XX_COMMON
> +       depends on LEDS_LP55XX_COMMON
>         help
>           If you say yes here you get support for the National 
> Semiconductor
>           LP5521 LED driver. It is 3 channel chip with programmable 
> engines.
> @@ -419,8 +418,7 @@ config LEDS_LP5521
>  config LEDS_LP5523
>         tristate "LED Support for TI/National LP5523/55231 LED driver 
> chip"
>         depends on LEDS_CLASS && I2C
> -       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
> -       select LEDS_LP55XX_COMMON
> +       depends on LEDS_LP55XX_COMMON
>         help
>           If you say yes here you get support for TI/National 
> Semiconductor
>           LP5523/55231 LED driver.
> @@ -431,7 +429,7 @@ config LEDS_LP5523
>  config LEDS_LP5562
>         tristate "LED Support for TI LP5562 LED driver chip"
>         depends on LEDS_CLASS && I2C
> -       select LEDS_LP55XX_COMMON
> +       depends on LEDS_LP55XX_COMMON
>         help
>           If you say yes here you get support for TI LP5562 LED driver.
>           It is 4 channels chip with programmable engines.
> @@ -441,7 +439,7 @@ config LEDS_LP5562
>  config LEDS_LP8501
>         tristate "LED Support for TI LP8501 LED driver chip"
>         depends on LEDS_CLASS && I2C
> -       select LEDS_LP55XX_COMMON
> +       depends on LEDS_LP55XX_COMMON
>         help
>           If you say yes here you get support for TI LP8501 LED driver.
>           It is 9 channel chip with programmable engines.
>
>
I made the same exact change and I am testing this now.  Need to see how 
the u8500_defconfig builds as that is the only defconfig that uses the 
LP5521 in tree.

I will need to add the LP55XX_COMMON in that defconfig but verifying the 
build works once I do.

Dan

