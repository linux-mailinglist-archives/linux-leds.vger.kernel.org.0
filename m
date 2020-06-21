Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAA5202CB0
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jun 2020 22:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgFUUYs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Jun 2020 16:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730288AbgFUUYr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Jun 2020 16:24:47 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F8CC061794;
        Sun, 21 Jun 2020 13:24:47 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g1so11970380edv.6;
        Sun, 21 Jun 2020 13:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=67qpOvxBqtOuq7BO42AdgklChChgk/RZcCsyjWJw/bM=;
        b=f4F8nif7dNgPw6eIWJYnE/Be+HEGe7Uhs0QRVJDR9OvA6HnJdjlXiJGBpLV/vYr8Mv
         PPX51LLZfWmZP/HahW41377lFPKHRxmJpygHrbNlmofRL3v/+FJs6YdW48YQZVgGpSHo
         vaUkM07Iae+jD7VQbe1NzmOZseX1JaYrAGnfssQbbxtEESiT74k1Tdpc2/QhgadUEZsE
         AX6218EJgOe3BYYPH+N412Qyan7CbynKESiwFoE+eihmSn0g+CSEKf/i5s6zDSaSH3rt
         1sMW4uwhtt1wYEzzOC48zyMdy/BcVRoE7PjaeFzJRTiIxAc21rwb7mh8A4DekvfahLqB
         7nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=67qpOvxBqtOuq7BO42AdgklChChgk/RZcCsyjWJw/bM=;
        b=Nh/VPvxhIR6izofR6+3wxSJytKImg/tU/5NfkJ3aUot3mYkP5X1MazJny5+mX3cUC4
         n/Ib96hnZIJ8pCN0ZcYLlOIOrB+EpTmNQDMC1vv4/sk53yWT8d9mhCXJalNEsUWopRQc
         LyuZmQyHqqW7N6S1i3o3R+52esYyVRlsh0UCQeoqVbOWSaiU0Wf8Vd+wpIlgjDsu2B9t
         34Vi86DyCRqbN5Zrvlq2e3a9gOMj2e79RE4W++Msbn6cS/xTEakxefyhy5rNPS7p4gvu
         BcIMdZLTJ+xVXn7MFAbJpv69H06putNey+N9U/0vPIYgpDEUTWbi1+S4ActNu9a6+vZB
         Q2jw==
X-Gm-Message-State: AOAM5308cX8ynxzVgOhOypy8748mYM7eBTKMxqWgHpyNsLBuu/duJrgr
        g5eEhvCDv6pvh6pUix0XLLAblxCD
X-Google-Smtp-Source: ABdhPJyXJ85xKCpidiakicxcklCVp6Xqxureuu47bz+wAz7PwPrqRAnV/ws21/q1PjwpHkE8H8zJrQ==
X-Received: by 2002:a05:6402:c85:: with SMTP id cm5mr8220495edb.341.1592771085371;
        Sun, 21 Jun 2020 13:24:45 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:ddd:82d4:b69c:dea5? ([2a01:110f:b59:fd00:ddd:82d4:b69c:dea5])
        by smtp.gmail.com with ESMTPSA id cw19sm3892034ejb.39.2020.06.21.13.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2020 13:24:44 -0700 (PDT)
Subject: Re: [RESEND PATCH v27 11/15] leds: lp55xx: Add multicolor framework
 support to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh@kernel.org
Cc:     kbuild-all@lists.01.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
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
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <52d2c06a-d4ab-b9b2-b1d3-d5f81780cd7f@gmail.com>
Date:   Sun, 21 Jun 2020 22:24:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <69c01524-c4a4-55c8-578e-24b26bc863b8@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/21/20 4:12 PM, Dan Murphy wrote:
> Jacek
> 
> On 6/19/20 5:10 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 6/19/20 6:35 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 6/18/20 6:26 PM, Jacek Anaszewski wrote:
>>>> On 6/19/20 12:09 AM, Jacek Anaszewski wrote:
>>>>> Dan,
>>>>>
>>>>> On 6/18/20 11:44 PM, Dan Murphy wrote:
>>>>>> Jacek
>>>>>>
>>>>>> On 6/18/20 4:21 PM, Jacek Anaszewski wrote:
>>>>>>> Dan,
>>>>>>>
>>>>>>> On 6/18/20 12:33 AM, Dan Murphy wrote:
>>>>>>>> Jacek
>>>>>>>>
>>>>>>>> On 6/17/20 4:41 PM, Jacek Anaszewski wrote:
>>>>>>>>> Dan,
>>>>>>>>>
>>>>>>>>> On 6/17/20 9:22 PM, Dan Murphy wrote:
>>>>>>>>>> Pavel/Jacek
>>>>>>>>>>
>>>>>>>>>> On 6/17/20 11:28 AM, kernel test robot wrote:
>>>>>>>>>>> Hi Dan,
>>>>>>>>>>>
>>>>>>>>>>> I love your patch! Yet something to improve:
>>>>>>>>>>>
>>>>>>>>>>> [auto build test ERROR on pavel-linux-leds/for-next]
>>>>>>>>>>> [cannot apply to j.anaszewski-leds/for-next]
>>>>>>>>>>> [if your patch is applied to the wrong git tree, please drop 
>>>>>>>>>>> us a note to help
>>>>>>>>>>> improve the system. BTW, we also suggest to use '--base' 
>>>>>>>>>>> option to specify the
>>>>>>>>>>> base tree in git format-patch, please see 
>>>>>>>>>>> https://stackoverflow.com/a/37406982]
>>>>>>>>>>>
>>>>>>>>>>> url: 
>>>>>>>>>>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>>>>>>>>>>
>>>>>>>>>>> base: 
>>>>>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git 
>>>>>>>>>>> for-next
>>>>>>>>>>> config: ia64-randconfig-r015-20200617 (attached as .config)
>>>>>>>>>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>>>>>>>>>> reproduce (this is a W=1 build):
>>>>>>>>>>>          wget 
>>>>>>>>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>>>>>>>>> -O ~/bin/make.cross
>>>>>>>>>>>          chmod +x ~/bin/make.cross
>>>>>>>>>>>          # save the attached .config to linux build tree
>>>>>>>>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>>>>>>>>> make.cross ARCH=ia64
>>>>>>>>>>>
>>>>>>>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>>>>>
>>>>>>>>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>>>>>>>>
>>>>>>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>>>>>>>> `lp55xx_set_mc_brightness':
>>>>>>>>>>>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference 
>>>>>>>>>>>>> to `led_mc_calc_color_components'
>>>>>>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>>>>>>>> `devm_led_classdev_multicolor_register':
>>>>>>>>>>>>> include/linux/led-class-multicolor.h:74: undefined 
>>>>>>>>>>>>> reference to `devm_led_classdev_multicolor_register_ext'
>>>>>>>>>>> vim +146 drivers/leds/leds-lp55xx-common.c
>>>>>>>>>>>
>>>>>>>>>>>     138
>>>>>>>>>>>     139    static int lp55xx_set_mc_brightness(struct 
>>>>>>>>>>> led_classdev *cdev,
>>>>>>>>>>>     140                        enum led_brightness brightness)
>>>>>>>>>>>     141    {
>>>>>>>>>>>     142        struct led_classdev_mc *mc_dev = 
>>>>>>>>>>> lcdev_to_mccdev(cdev);
>>>>>>>>>>>     143        struct lp55xx_led *led = 
>>>>>>>>>>> mcled_cdev_to_led(mc_dev);
>>>>>>>>>>>     144        struct lp55xx_device_config *cfg = 
>>>>>>>>>>> led->chip->cfg;
>>>>>>>>>>>     145
>>>>>>>>>>>   > 146 led_mc_calc_color_components(&led->mc_cdev, brightness);
>>>>>>>>>>>     147        return cfg->multicolor_brightness_fn(led);
>>>>>>>>>>>     148
>>>>>>>>>>
>>>>>>>>>> Well this was a mess to figure out.
>>>>>>>>>>
>>>>>>>>>> The only fix I can figure out here is to remove the
>>>>>>>>>>
>>>>>>>>>>      depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>>>>>>>>
>>>>>>>>>> from each child device and add
>>>>>>>>>>
>>>>>>>>>>      select LEDS_CLASS_MULTI_COLOR
>>>>>>>>>>
>>>>>>>>>> to the LP55XX_COMMON
>>>>>>>>>>
>>>>>>>>>> This way the Multi color framework will inherit the symbol 
>>>>>>>>>> that was set by the COMMON flag which is inherited by majority 
>>>>>>>>>> from the child flags.
>>>>>>>>>
>>>>>>>>> Did you try this?
>>>>>>>>>
>>>>>>>>> --- a/drivers/leds/Kconfig
>>>>>>>>> +++ b/drivers/leds/Kconfig
>>>>>>>>> @@ -398,6 +398,7 @@ config LEDS_LP50XX
>>>>>>>>>  config LEDS_LP55XX_COMMON
>>>>>>>>>         tristate "Common Driver for TI/National 
>>>>>>>>> LP5521/5523/55231/5562/8501"
>>>>>>>>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || 
>>>>>>>>> LEDS_LP8501
>>>>>>>>> +       depends on LEDS_CLASS_MULTI_COLOR || 
>>>>>>>>> !LEDS_CLASS_MULTI_COLOR
>>>>>>>>>         depends on OF
>>>>>>>>>         select FW_LOADER
>>>>>>>>>         select FW_LOADER_USER_HELPER
>>>>>>>>>
>>>>>>>>>
>>>>>>>> Yes I did
>>>>>>>>
>>>>>>>> That gave unmet dependencies.
>>>>>>>>
>>>>>>>> WARNING: unmet direct dependencies detected for LEDS_LP55XX_COMMON
>>>>>>>>    Depends on [m]: NEW_LEDS [=y] && (LEDS_LP5521 [=n] || 
>>>>>>>> LEDS_LP5523 [=m] || LEDS_LP5562 [=y] || LEDS_LP8501 [=y]) && 
>>>>>>>> (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m]) && 
>>>>>>>> OF [=y]
>>>>>>>>    Selected by [y]:
>>>>>>>>    - LEDS_LP5562 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C 
>>>>>>>> [=y]
>>>>>>>>    - LEDS_LP8501 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C 
>>>>>>>> [=y]
>>>>>>>>    Selected by [m]:
>>>>>>>>    - LEDS_LP5523 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C 
>>>>>>>> [=y] && (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR 
>>>>>>>> [=m])
>>>>>>>>
>>>>>>>
>>>>>>> When I was testing that yesterday I also had the same warning at 
>>>>>>> some
>>>>>>> point of testing different Kconfig setups, but with what I showed 
>>>>>>> above
>>>>>>> it ceased to appear. Now every time I am doing "make oldconfig" the
>>>>>>> CONFIG_LEDS_LP55XX_COMMON=y entry gets changed to =m with the config
>>>>>>> from the test bot.
>>>>>>>
>>>>>> That is not what I saw in my testing especially after doing a 
>>>>>> distclean
>>>>>
>>>>> Could you please give your exact steps after "make distclean" and
>>>>> copying test bot config to the kernel root directory?
>>>>>
>>>>> Also, please share the toolchain you're using for tests.
>>>>
>>>> Actually at this stage the toolchain is of lesser relevance.
>>>>
>>>> I've tried once more and indeed the problem shows up.
>>>>
>>>> It is caused by the driver entries doing
>>>>
>>>> "select LEDS_LP55XX_COMMON".
>>>>
>>>> Select sets config to "y" so it conflicts with
>>>> "depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR"
>>>> in the "config LEDS_LP55XX_COMMON".
>>>>
>>>> Your proposed fix will block the possibility of building
>>>> LED_CLASS_MULTI_COLOR as a module when LP55XX drivers
>>>> are enabled so this is also not an option.
>>>>
>>>> Solving this riddle will require some more thinking.
>>>> I haven't analyzed it in detail but maybe "imply" statement from
>>>> kconfig-language.rst could help somehow here. 
>>>
>>> The multicolor framework will build as a module if the LED_CLASS is 
>>> defined as a module.
>>>
>>> See attached test_defconfig
>>
>> But it will be impossible to enable CONFIG_LEDS_LP50XX without
>> CONFIG_LEDS_CLASS_MULTI_COLOR if you will remove
>>
>> depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR.
>>
> I was not removing the dependency for the LP50xx only the LP55xx.

It was my typo, I meant LP55XX.

> 
>> This is actually why the above entry was needed.
>>
>> LP55XX drivers have to work also without multicolor class.
>>
> Well I am not sure how else to resolve this problem.  Because the LP55xx 
> has multi level dependencies.
> 
> Only the LP55xx_common has the dependency on the MC framework. The 
> device drivers do not.
> 
> The issue is the mixing and matching of the MC fw as a module vs the 
> LP55XX_COMMON as a built-in.

The simplest solution is to avoid selecting LP55XX_COMMON in favor
of making child drivers depending on it. Of course, maybe there exists
some trickier option to keep the selection, but I would have to play
a bit more with it to be sure.

-- 
Best regards,
Jacek Anaszewski
