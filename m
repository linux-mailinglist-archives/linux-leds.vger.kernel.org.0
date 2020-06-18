Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D831FFE94
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2020 01:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgFRX0j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jun 2020 19:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgFRX0j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jun 2020 19:26:39 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928B8C06174E;
        Thu, 18 Jun 2020 16:26:38 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o15so8178680ejm.12;
        Thu, 18 Jun 2020 16:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b1ePFSpEjfRuc5Jz/YksAGlsS38BVJIQNNSvi2ag+n0=;
        b=NaEemabd59Rt7BQjz9NRDOmOIfKKl1eOiALOjH5y19NHIe6AsigIMHZp7FwrO6OkiC
         8Yk08oCTgq0W+lN96i1himhFKG5kMDUvhV1MeSY67VTC6NbENnNs06KYN4TyRfOTe3iA
         M4MaVoAa48wAGEACk749Ii+5PckBw8YdeAb3UQtBencqK0JsP0CjyZjSQtZJPPsBQJfW
         8m/MA3Be5HmPDBbKyVESJGbQS7fbRBd+aP2zABQ73crXCkYVgnYKijUBR9FOdCyKn9L2
         mxgGUaj/JnBPGcJjyqprGbUACK+IXtXqeIvaqZm7aa44siN0oMKZ93s6ysjLmj99ld5v
         IO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b1ePFSpEjfRuc5Jz/YksAGlsS38BVJIQNNSvi2ag+n0=;
        b=RU9p2n6/qavo7VpMH/6yz1QaUANWb9NpTMcZwJtvqt4Zr8ym1U4TCtJRjmpsiE0Phw
         ezJACkjUKUbWxiwlYEsnyCHtHhUUvJ81JVaKTxk7av6JMbc5Rpf2fZBNzwmDTsd0Gahk
         X1afE09eNVjX/Aq2bRmvJGML9U0u+d1sigITiePy5QT+S6Sg8hto4gyw/VZcHHYAPs3p
         OxTuBmzgERiWLtDnq4Li5+cJ9QHEbdV0DFzDMxSZMw0z+gwNZxMZqcGf8KJF2pMreO62
         zq3tB8nnJKMAy7QGiFPKyJ1w3hFcsOBhSKjf60hPGtboCbDkO1dPEbgfHXd4BO85EBn/
         YA+g==
X-Gm-Message-State: AOAM532xalzV9sUHQciIHBeVo70UmFfEt41/HjH9bAMpjFnmT/niWq9e
        M2nvwie6+tJ2Apqw5M7JSwaI/44o
X-Google-Smtp-Source: ABdhPJwjk0JDxEIu+oUtex60BC37bn/64L5J4sR0B8O/Xe1nww9nDB1t0MJT9fZvatDb7rVNC3xFnA==
X-Received: by 2002:a17:906:fa92:: with SMTP id lt18mr1057247ejb.423.1592522795596;
        Thu, 18 Jun 2020 16:26:35 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d4bd:6bb4:bdf3:651? ([2a01:110f:b59:fd00:d4bd:6bb4:bdf3:651])
        by smtp.gmail.com with ESMTPSA id k22sm3189687edr.93.2020.06.18.16.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 16:26:35 -0700 (PDT)
Subject: Re: [RESEND PATCH v27 11/15] leds: lp55xx: Add multicolor framework
 support to lp55xx
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
Message-ID: <fad98aa3-cec6-3cde-951f-fa2b57c26d03@gmail.com>
Date:   Fri, 19 Jun 2020 01:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bd603f01-2c1b-6167-d88c-3895c1bfdf6c@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/19/20 12:09 AM, Jacek Anaszewski wrote:
> Dan,
> 
> On 6/18/20 11:44 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 6/18/20 4:21 PM, Jacek Anaszewski wrote:
>>> Dan,
>>>
>>> On 6/18/20 12:33 AM, Dan Murphy wrote:
>>>> Jacek
>>>>
>>>> On 6/17/20 4:41 PM, Jacek Anaszewski wrote:
>>>>> Dan,
>>>>>
>>>>> On 6/17/20 9:22 PM, Dan Murphy wrote:
>>>>>> Pavel/Jacek
>>>>>>
>>>>>> On 6/17/20 11:28 AM, kernel test robot wrote:
>>>>>>> Hi Dan,
>>>>>>>
>>>>>>> I love your patch! Yet something to improve:
>>>>>>>
>>>>>>> [auto build test ERROR on pavel-linux-leds/for-next]
>>>>>>> [cannot apply to j.anaszewski-leds/for-next]
>>>>>>> [if your patch is applied to the wrong git tree, please drop us a 
>>>>>>> note to help
>>>>>>> improve the system. BTW, we also suggest to use '--base' option 
>>>>>>> to specify the
>>>>>>> base tree in git format-patch, please see 
>>>>>>> https://stackoverflow.com/a/37406982]
>>>>>>>
>>>>>>> url: 
>>>>>>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>>>>>>
>>>>>>> base: 
>>>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next 
>>>>>>>
>>>>>>> config: ia64-randconfig-r015-20200617 (attached as .config)
>>>>>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>>>>>> reproduce (this is a W=1 build):
>>>>>>>          wget 
>>>>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>>>>> -O ~/bin/make.cross
>>>>>>>          chmod +x ~/bin/make.cross
>>>>>>>          # save the attached .config to linux build tree
>>>>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>>>>> make.cross ARCH=ia64
>>>>>>>
>>>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>
>>>>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>>>>
>>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>>>> `lp55xx_set_mc_brightness':
>>>>>>>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference to 
>>>>>>>>> `led_mc_calc_color_components'
>>>>>>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>>>>>>> `devm_led_classdev_multicolor_register':
>>>>>>>>> include/linux/led-class-multicolor.h:74: undefined reference to 
>>>>>>>>> `devm_led_classdev_multicolor_register_ext'
>>>>>>> vim +146 drivers/leds/leds-lp55xx-common.c
>>>>>>>
>>>>>>>     138
>>>>>>>     139    static int lp55xx_set_mc_brightness(struct 
>>>>>>> led_classdev *cdev,
>>>>>>>     140                        enum led_brightness brightness)
>>>>>>>     141    {
>>>>>>>     142        struct led_classdev_mc *mc_dev = 
>>>>>>> lcdev_to_mccdev(cdev);
>>>>>>>     143        struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
>>>>>>>     144        struct lp55xx_device_config *cfg = led->chip->cfg;
>>>>>>>     145
>>>>>>>   > 146 led_mc_calc_color_components(&led->mc_cdev, brightness);
>>>>>>>     147        return cfg->multicolor_brightness_fn(led);
>>>>>>>     148
>>>>>>
>>>>>> Well this was a mess to figure out.
>>>>>>
>>>>>> The only fix I can figure out here is to remove the
>>>>>>
>>>>>>      depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>>>>
>>>>>> from each child device and add
>>>>>>
>>>>>>      select LEDS_CLASS_MULTI_COLOR
>>>>>>
>>>>>> to the LP55XX_COMMON
>>>>>>
>>>>>> This way the Multi color framework will inherit the symbol that 
>>>>>> was set by the COMMON flag which is inherited by majority from the 
>>>>>> child flags.
>>>>>
>>>>> Did you try this?
>>>>>
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -398,6 +398,7 @@ config LEDS_LP50XX
>>>>>  config LEDS_LP55XX_COMMON
>>>>>         tristate "Common Driver for TI/National 
>>>>> LP5521/5523/55231/5562/8501"
>>>>>         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || 
>>>>> LEDS_LP8501
>>>>> +       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
>>>>>         depends on OF
>>>>>         select FW_LOADER
>>>>>         select FW_LOADER_USER_HELPER
>>>>>
>>>>>
>>>> Yes I did
>>>>
>>>> That gave unmet dependencies.
>>>>
>>>> WARNING: unmet direct dependencies detected for LEDS_LP55XX_COMMON
>>>>    Depends on [m]: NEW_LEDS [=y] && (LEDS_LP5521 [=n] || LEDS_LP5523 
>>>> [=m] || LEDS_LP5562 [=y] || LEDS_LP8501 [=y]) && 
>>>> (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m]) && OF 
>>>> [=y]
>>>>    Selected by [y]:
>>>>    - LEDS_LP5562 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>>>>    - LEDS_LP8501 [=y] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C [=y]
>>>>    Selected by [m]:
>>>>    - LEDS_LP5523 [=m] && NEW_LEDS [=y] && LEDS_CLASS [=y] && I2C 
>>>> [=y] && (LEDS_CLASS_MULTI_COLOR [=m] || !LEDS_CLASS_MULTI_COLOR [=m])
>>>>
>>>
>>> When I was testing that yesterday I also had the same warning at some
>>> point of testing different Kconfig setups, but with what I showed above
>>> it ceased to appear. Now every time I am doing "make oldconfig" the
>>> CONFIG_LEDS_LP55XX_COMMON=y entry gets changed to =m with the config
>>> from the test bot.
>>>
>> That is not what I saw in my testing especially after doing a distclean
> 
> Could you please give your exact steps after "make distclean" and
> copying test bot config to the kernel root directory?
> 
> Also, please share the toolchain you're using for tests.

Actually at this stage the toolchain is of lesser relevance.

I've tried once more and indeed the problem shows up.

It is caused by the driver entries doing

"select LEDS_LP55XX_COMMON".

Select sets config to "y" so it conflicts with
"depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR"
in the "config LEDS_LP55XX_COMMON".

Your proposed fix will block the possibility of building
LED_CLASS_MULTI_COLOR as a module when LP55XX drivers
are enabled so this is also not an option.

Solving this riddle will require some more thinking.
I haven't analyzed it in detail but maybe "imply" statement from
kconfig-language.rst could help somehow here.

-- 
Best regards,
Jacek Anaszewski
