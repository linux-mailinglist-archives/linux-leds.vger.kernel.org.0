Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEEC1FFD52
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2020 23:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgFRVVu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jun 2020 17:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFRVVt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jun 2020 17:21:49 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E47C06174E;
        Thu, 18 Jun 2020 14:21:49 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g1so5979956edv.6;
        Thu, 18 Jun 2020 14:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S00DplogylNiA0T4Pe75roWISOkz/iw7/rEJT8hejec=;
        b=CpdV418D2hQQ6t/RwsOXzuKBkNmHAGVkqH5yLsCfZZz55gn3s3Gn/WS7WuW8jY7pGg
         CHZWk7AXatPUDoZ0+DWQV4J/C2Nw7JdOzfbpsQTIp6hlct2IxFtZczS3L7jvNxyQyB8V
         sBkW7/eVwOiyIo5qOkAsuuYBX/NxbiyU3Lx80/s/q93Z66i9Pc2h9eAUcB0Omrd0sSKJ
         5x2FwWdcXSFg5lPAXT1BaVKH33c8U9tFypsdCp408Y9HRS6YGAUe+J7g1YTsFzTz+4Xi
         8lfs1lvoxDS1DD8IWr001slLru0kB7AKSuA0+r8gG8Dvn434YNtsFCEstX83RTCT7eSF
         WH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S00DplogylNiA0T4Pe75roWISOkz/iw7/rEJT8hejec=;
        b=RAQ5KfL5C7hghzyHCh0HaAhOzfK92glP8tr5tU4xwKVvkAzrpr+u/dGx55ia++13Xy
         /Z2x9J4r0KyjHNlaHylS4cIqg4t2ADFKZaePERdWE1cP9Sgl09im4QOPJcNuKLKlbsV7
         HYZjM7kmvHbrPOYIWoUPf81hi64+RqB68RPV7Y9Byw7IqrWl/4UTvBttg68UETMWpw8z
         LmCaYVWrQ1quNI2j2QAUBKhh8qBtu9yxzXEkuNXJVj5UmdTEoDosPhOxoH2ImQzgqEir
         DcHTJ0qYVsR91mxe7YboWfv4hDo/uYLUiuvuxaqoo+KGUv8w5JzO1Oc1vaxAV34StHMs
         LHbg==
X-Gm-Message-State: AOAM533HPrszmPTZdSocqZgXV7Rb6sPO+FhK0j69rhftHv2xHp4izGqp
        mSxHWbkSEnA97qzq/0OSrUV/E89Q
X-Google-Smtp-Source: ABdhPJwspAvjjYU4Nki8mod9pnSftP3TwRynoN/XZgkn5cZG9yobGJW3W/s2RhKWUcFLTZYxSuAGzg==
X-Received: by 2002:aa7:da4f:: with SMTP id w15mr182828eds.384.1592515307830;
        Thu, 18 Jun 2020 14:21:47 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d835:117d:5af6:d9c? ([2a01:110f:b59:fd00:d835:117d:5af6:d9c])
        by smtp.gmail.com with ESMTPSA id oq28sm3137415ejb.12.2020.06.18.14.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 14:21:47 -0700 (PDT)
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
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <fc410dfb-70d1-1b8b-3b6d-0de1c6c84ec2@gmail.com>
Date:   Thu, 18 Jun 2020 23:21:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fc1ae702-0734-973d-9e3c-22b8f8d5c873@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/18/20 12:33 AM, Dan Murphy wrote:
> Jacek
> 
> On 6/17/20 4:41 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 6/17/20 9:22 PM, Dan Murphy wrote:
>>> Pavel/Jacek
>>>
>>> On 6/17/20 11:28 AM, kernel test robot wrote:
>>>> Hi Dan,
>>>>
>>>> I love your patch! Yet something to improve:
>>>>
>>>> [auto build test ERROR on pavel-linux-leds/for-next]
>>>> [cannot apply to j.anaszewski-leds/for-next]
>>>> [if your patch is applied to the wrong git tree, please drop us a 
>>>> note to help
>>>> improve the system. BTW, we also suggest to use '--base' option to 
>>>> specify the
>>>> base tree in git format-patch, please see 
>>>> https://stackoverflow.com/a/37406982]
>>>>
>>>> url: 
>>>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>>>
>>>> base: 
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git 
>>>> for-next
>>>> config: ia64-randconfig-r015-20200617 (attached as .config)
>>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>>> reproduce (this is a W=1 build):
>>>>          wget 
>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>> -O ~/bin/make.cross
>>>>          chmod +x ~/bin/make.cross
>>>>          # save the attached .config to linux build tree
>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>> make.cross ARCH=ia64
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>
>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>> `lp55xx_set_mc_brightness':
>>>>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference to 
>>>>>> `led_mc_calc_color_components'
>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>> `devm_led_classdev_multicolor_register':
>>>>>> include/linux/led-class-multicolor.h:74: undefined reference to 
>>>>>> `devm_led_classdev_multicolor_register_ext'
>>>> vim +146 drivers/leds/leds-lp55xx-common.c
>>>>
>>>>     138
>>>>     139    static int lp55xx_set_mc_brightness(struct led_classdev 
>>>> *cdev,
>>>>     140                        enum led_brightness brightness)
>>>>     141    {
>>>>     142        struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
>>>>     143        struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
>>>>     144        struct lp55xx_device_config *cfg = led->chip->cfg;
>>>>     145
>>>>   > 146 led_mc_calc_color_components(&led->mc_cdev, brightness);
>>>>     147        return cfg->multicolor_brightness_fn(led);
>>>>     148
>>>
>>> Well this was a mess to figure out.
>>>
>>> The only fix I can figure out here is to remove the
>>>
>>>      depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>
>>> from each child device and add
>>>
>>>      select LEDS_CLASS_MULTI_COLOR
>>>
>>> to the LP55XX_COMMON
>>>
>>> This way the Multi color framework will inherit the symbol that was 
>>> set by the COMMON flag which is inherited by majority from the child 
>>> flags.
>>
>> Did you try this?
>>
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -398,6 +398,7 @@ config LEDS_LP50XX
>>  config LEDS_LP55XX_COMMON
>>         tristate "Common Driver for TI/National 
>> LP5521/5523/55231/5562/8501"
>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || 
>> LEDS_LP8501
>> +       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>         depends on OF
>>         select FW_LOADER
>>         select FW_LOADER_USER_HELPER
>>
>>
> Yes I did
> 
> That gave unmet dependencies.
> 
> WARNING: unmet direct dependencies detected for LEDS_LP55XX_COMMON
>    Depends on [m]: NEW_LEDS [=y] && (LEDS_LP5521 [=n] || LEDS_LP5523 
> [=m] || LEDS_LP5562 [=y] || LEDS_LP8501 [=y]) && (LEDS_CLASS_MULTI_COLOR 
> [=m] || !LEDS_CLASS_MULTI_COLOR [=m]) && OF [=y]
>    Selected by [y]:
>    - LEDS_LP5562 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>    - LEDS_LP8501 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>    Selected by [m]:
>    - LEDS_LP5523 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y] && 
> (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m])
> 

When I was testing that yesterday I also had the same warning at some
point of testing different Kconfig setups, but with what I showed above
it ceased to appear. Now every time I am doing "make oldconfig" the
CONFIG_LEDS_LP55XX_COMMON=y entry gets changed to =m with the config
from the test bot.

-- 
Best regards,
Jacek Anaszewski
