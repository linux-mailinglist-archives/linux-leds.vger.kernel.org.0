Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5243A1FFD84
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2020 23:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbgFRVo3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jun 2020 17:44:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53486 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbgFRVo3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jun 2020 17:44:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05ILiLG6099619;
        Thu, 18 Jun 2020 16:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592516661;
        bh=NtFYYf22CUq2Y656mDj/xXRVHdSM/x6MXTmqwdRqKiA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hCDyykgvkONfsqJ83Szw/CKpRVlltRvLNr/9xu/2Lo+BE+7qaOUG9dx/Uh26jPoNo
         P0RJtVeJTaTfgSW5P5VYQFaioZ3hx43bcKnzBED35gOPsdx/LBi/d/jQ60aaRxYJmC
         TX7paIFNPQqofAS0MCn1NumoQcVz42AC+ljlJObM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05ILiL17051337
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Jun 2020 16:44:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 16:44:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 16:44:20 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05ILiKqL096589;
        Thu, 18 Jun 2020 16:44:20 -0500
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
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <56823113-4875-4813-8627-84b0d1792391@ti.com>
Date:   Thu, 18 Jun 2020 16:44:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fc410dfb-70d1-1b8b-3b6d-0de1c6c84ec2@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 6/18/20 4:21 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 6/18/20 12:33 AM, Dan Murphy wrote:
>> Jacek
>>
>> On 6/17/20 4:41 PM, Jacek Anaszewski wrote:
>>> Dan,
>>>
>>> On 6/17/20 9:22 PM, Dan Murphy wrote:
>>>> Pavel/Jacek
>>>>
>>>> On 6/17/20 11:28 AM, kernel test robot wrote:
>>>>> Hi Dan,
>>>>>
>>>>> I love your patch! Yet something to improve:
>>>>>
>>>>> [auto build test ERROR on pavel-linux-leds/for-next]
>>>>> [cannot apply to j.anaszewski-leds/for-next]
>>>>> [if your patch is applied to the wrong git tree, please drop us a 
>>>>> note to help
>>>>> improve the system. BTW, we also suggest to use '--base' option to 
>>>>> specify the
>>>>> base tree in git format-patch, please see 
>>>>> https://stackoverflow.com/a/37406982]
>>>>>
>>>>> url: 
>>>>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>>>>
>>>>> base: 
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git 
>>>>> for-next
>>>>> config: ia64-randconfig-r015-20200617 (attached as .config)
>>>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>>>> reproduce (this is a W=1 build):
>>>>>          wget 
>>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>>> -O ~/bin/make.cross
>>>>>          chmod +x ~/bin/make.cross
>>>>>          # save the attached .config to linux build tree
>>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>>> make.cross ARCH=ia64
>>>>>
>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>
>>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>>
>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>> `lp55xx_set_mc_brightness':
>>>>>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference to 
>>>>>>> `led_mc_calc_color_components'
>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>> `devm_led_classdev_multicolor_register':
>>>>>>> include/linux/led-class-multicolor.h:74: undefined reference to 
>>>>>>> `devm_led_classdev_multicolor_register_ext'
>>>>> vim +146 drivers/leds/leds-lp55xx-common.c
>>>>>
>>>>>     138
>>>>>     139    static int lp55xx_set_mc_brightness(struct led_classdev 
>>>>> *cdev,
>>>>>     140                        enum led_brightness brightness)
>>>>>     141    {
>>>>>     142        struct led_classdev_mc *mc_dev = 
>>>>> lcdev_to_mccdev(cdev);
>>>>>     143        struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
>>>>>     144        struct lp55xx_device_config *cfg = led->chip->cfg;
>>>>>     145
>>>>>   > 146 led_mc_calc_color_components(&led->mc_cdev, brightness);
>>>>>     147        return cfg->multicolor_brightness_fn(led);
>>>>>     148
>>>>
>>>> Well this was a mess to figure out.
>>>>
>>>> The only fix I can figure out here is to remove the
>>>>
>>>>      depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>>
>>>> from each child device and add
>>>>
>>>>      select LEDS_CLASS_MULTI_COLOR
>>>>
>>>> to the LP55XX_COMMON
>>>>
>>>> This way the Multi color framework will inherit the symbol that was 
>>>> set by the COMMON flag which is inherited by majority from the 
>>>> child flags.
>>>
>>> Did you try this?
>>>
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -398,6 +398,7 @@ config LEDS_LP50XX
>>>  config LEDS_LP55XX_COMMON
>>>         tristate "Common Driver for TI/National 
>>> LP5521/5523/55231/5562/8501"
>>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || 
>>> LEDS_LP8501
>>> +       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>         depends on OF
>>>         select FW_LOADER
>>>         select FW_LOADER_USER_HELPER
>>>
>>>
>> Yes I did
>>
>> That gave unmet dependencies.
>>
>> WARNING: unmet direct dependencies detected for LEDS_LP55XX_COMMON
>>    Depends on [m]: NEW_LEDS [=y] && (LEDS_LP5521 [=n] || LEDS_LP5523 
>> [=m] || LEDS_LP5562 [=y] || LEDS_LP8501 [=y]) && 
>> (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m]) && OF [=y]
>>    Selected by [y]:
>>    - LEDS_LP5562 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>>    - LEDS_LP8501 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>>    Selected by [m]:
>>    - LEDS_LP5523 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y] 
>> && (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m])
>>
>
> When I was testing that yesterday I also had the same warning at some
> point of testing different Kconfig setups, but with what I showed above
> it ceased to appear. Now every time I am doing "make oldconfig" the
> CONFIG_LEDS_LP55XX_COMMON=y entry gets changed to =m with the config
> from the test bot.
>
That is not what I saw in my testing especially after doing a distclean

Dan

