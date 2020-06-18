Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6B21FFDB7
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2020 00:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgFRWJR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jun 2020 18:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgFRWJQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jun 2020 18:09:16 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6BEC06174E;
        Thu, 18 Jun 2020 15:09:16 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so8092494ejd.0;
        Thu, 18 Jun 2020 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ntjOPxpOr0fkDu+VLYNC66SPAXYocHE8OegUSm/oe8Y=;
        b=eCBDo7pxBFIK8E6E/Jkm+SYzueB+dzJMgyH6wWfrWLfsG2FwLYAtH0ilxxcoVDSPdv
         +COjYLfqyB7BXwki+Z6KHXRUELK8xPMe5Ji3bUIH8qoP1kN8fDVnGXwOk8vEEWOYKSKW
         bSKLycqd8OUf3Ill2p1/ix2K0QIw/dmeUeRhVvD+0JYp052XJL6BPf2Aems2gIiYD3QW
         tgCetDWmEiljOJ74lz9DOzALfrK5tPFVyiWhMIlRSSdKHF+OnJnb8hnloi37tLCkmuRk
         SxtSmkpCXCTMyp//+a8X8+DCqpybJF3EwhwNym1tHhvfktGezTrqZIJJh3ySUvQrphrq
         umfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ntjOPxpOr0fkDu+VLYNC66SPAXYocHE8OegUSm/oe8Y=;
        b=qLZ9HMY2CitaKXoEJnixccS+GOYns2QZAWIHTzlyEdcCpdM9T05S+eVRkvkVEvZ60r
         /XoPqpspRNiVLIaVak+rkKl/l0EKSfELXTg0k+x96eeetZwb/Biy14l9+OLzV4axtrDx
         XrFfGEARnE5IWHJZlW2Te0r1j6bpC7Vpk36Ob4cqMevhy4Xi8DSH5rvjTCUeCYp7sKg4
         Th6NN5GT+Be7oWvT2diR7zAqy6ry2kyNDXRON6bjytC4yFepmNd6SwTpg4yt5eTXP+vu
         Nw0dZFs5akZWAaDNEQwAhQCwVUU4frfxV2VOVgwpSQDaXtjBfPGRQMchhWrHMA1t+W+C
         hHLg==
X-Gm-Message-State: AOAM530Bw09bUDPr/Dbhz2gjHeFgp6V5wXRGT3Nji5TQxN826UcF77FJ
        ec+otXcRgsXqAQIork+B8nIvHLxv
X-Google-Smtp-Source: ABdhPJyZgo40VWDBKp1cYeVkpXv4v3GZUzkAG6GzwK9HNTtxi4GEivwow8gJ2kXFUcFAvzNvqy6MEw==
X-Received: by 2002:a17:906:cd03:: with SMTP id oz3mr791251ejb.391.1592518154347;
        Thu, 18 Jun 2020 15:09:14 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d835:117d:5af6:d9c? ([2a01:110f:b59:fd00:d835:117d:5af6:d9c])
        by smtp.gmail.com with ESMTPSA id b11sm3203237eju.91.2020.06.18.15.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 15:09:13 -0700 (PDT)
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
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <bd603f01-2c1b-6167-d88c-3895c1bfdf6c@gmail.com>
Date:   Fri, 19 Jun 2020 00:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <56823113-4875-4813-8627-84b0d1792391@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/18/20 11:44 PM, Dan Murphy wrote:
> Jacek
> 
> On 6/18/20 4:21 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 6/18/20 12:33 AM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 6/17/20 4:41 PM, Jacek Anaszewski wrote:
>>>> Dan,
>>>>
>>>> On 6/17/20 9:22 PM, Dan Murphy wrote:
>>>>> Pavel/Jacek
>>>>>
>>>>> On 6/17/20 11:28 AM, kernel test robot wrote:
>>>>>> Hi Dan,
>>>>>>
>>>>>> I love your patch! Yet something to improve:
>>>>>>
>>>>>> [auto build test ERROR on pavel-linux-leds/for-next]
>>>>>> [cannot apply to j.anaszewski-leds/for-next]
>>>>>> [if your patch is applied to the wrong git tree, please drop us a 
>>>>>> note to help
>>>>>> improve the system. BTW, we also suggest to use '--base' option to 
>>>>>> specify the
>>>>>> base tree in git format-patch, please see 
>>>>>> https://stackoverflow.com/a/37406982]
>>>>>>
>>>>>> url: 
>>>>>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>>>>>
>>>>>> base: 
>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git 
>>>>>> for-next
>>>>>> config: ia64-randconfig-r015-20200617 (attached as .config)
>>>>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>>>>> reproduce (this is a W=1 build):
>>>>>>          wget 
>>>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>>>> -O ~/bin/make.cross
>>>>>>          chmod +x ~/bin/make.cross
>>>>>>          # save the attached .config to linux build tree
>>>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>>>> make.cross ARCH=ia64
>>>>>>
>>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>
>>>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>>>
>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>>> `lp55xx_set_mc_brightness':
>>>>>>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference to 
>>>>>>>> `led_mc_calc_color_components'
>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>>> `devm_led_classdev_multicolor_register':
>>>>>>>> include/linux/led-class-multicolor.h:74: undefined reference to 
>>>>>>>> `devm_led_classdev_multicolor_register_ext'
>>>>>> vim +146 drivers/leds/leds-lp55xx-common.c
>>>>>>
>>>>>>     138
>>>>>>     139    static int lp55xx_set_mc_brightness(struct led_classdev 
>>>>>> *cdev,
>>>>>>     140                        enum led_brightness brightness)
>>>>>>     141    {
>>>>>>     142        struct led_classdev_mc *mc_dev = 
>>>>>> lcdev_to_mccdev(cdev);
>>>>>>     143        struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
>>>>>>     144        struct lp55xx_device_config *cfg = led->chip->cfg;
>>>>>>     145
>>>>>>   > 146 led_mc_calc_color_components(&led->mc_cdev, brightness);
>>>>>>     147        return cfg->multicolor_brightness_fn(led);
>>>>>>     148
>>>>>
>>>>> Well this was a mess to figure out.
>>>>>
>>>>> The only fix I can figure out here is to remove the
>>>>>
>>>>>      depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>>>
>>>>> from each child device and add
>>>>>
>>>>>      select LEDS_CLASS_MULTI_COLOR
>>>>>
>>>>> to the LP55XX_COMMON
>>>>>
>>>>> This way the Multi color framework will inherit the symbol that was 
>>>>> set by the COMMON flag which is inherited by majority from the 
>>>>> child flags.
>>>>
>>>> Did you try this?
>>>>
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -398,6 +398,7 @@ config LEDS_LP50XX
>>>>  config LEDS_LP55XX_COMMON
>>>>         tristate "Common Driver for TI/National 
>>>> LP5521/5523/55231/5562/8501"
>>>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || 
>>>> LEDS_LP8501
>>>> +       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>>         depends on OF
>>>>         select FW_LOADER
>>>>         select FW_LOADER_USER_HELPER
>>>>
>>>>
>>> Yes I did
>>>
>>> That gave unmet dependencies.
>>>
>>> WARNING: unmet direct dependencies detected for LEDS_LP55XX_COMMON
>>>    Depends on [m]: NEW_LEDS [=y] && (LEDS_LP5521 [=n] || LEDS_LP5523 
>>> [=m] || LEDS_LP5562 [=y] || LEDS_LP8501 [=y]) && 
>>> (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m]) && OF [=y]
>>>    Selected by [y]:
>>>    - LEDS_LP5562 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>>>    - LEDS_LP8501 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>>>    Selected by [m]:
>>>    - LEDS_LP5523 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y] 
>>> && (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m])
>>>
>>
>> When I was testing that yesterday I also had the same warning at some
>> point of testing different Kconfig setups, but with what I showed above
>> it ceased to appear. Now every time I am doing "make oldconfig" the
>> CONFIG_LEDS_LP55XX_COMMON=y entry gets changed to =m with the config
>> from the test bot.
>>
> That is not what I saw in my testing especially after doing a distclean

Could you please give your exact steps after "make distclean" and
copying test bot config to the kernel root directory?

Also, please share the toolchain you're using for tests.

-- 
Best regards,
Jacek Anaszewski
