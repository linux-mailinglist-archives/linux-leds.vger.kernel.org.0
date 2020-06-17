Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4881FD7B3
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2020 23:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgFQVlt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jun 2020 17:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgFQVls (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jun 2020 17:41:48 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50961C06174E;
        Wed, 17 Jun 2020 14:41:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p20so4150855ejd.13;
        Wed, 17 Jun 2020 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cf3kkLok1ZPnk0qEHa7HqMsxq6OFGLjYN5CTh27kkEo=;
        b=Z9gVA7VKLdv6qupqkJF1jLR6nSPpqDZ9dLJibhVqvReijtfSFJfbMdD9PPYoNR6Tze
         RbNj3wNVh5qWZ58cHeGm/tPi67KC9UJ0B1PterfqQDQvd20UXdogvFirRp3tmI7HqQzg
         iQS01DNZ+O+/W7fQHQCp9xwNcFqWRSTxMqs4DtQQ+Fg+yfOPG99s3ZEUUSz1z/Wd5vjm
         6kHdTNW4Xj/eqi4Du//LWLvhFRtcH2kBQvBwnTo+apUAPg73yqAAF7pdk/QczBSj3s1x
         atLgfXz10KMKNxp/2m4ce/a/g/fO52fzXlX6ZrY9D61gh1tN02apgIcxWZZ9LaaxU8i6
         gYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cf3kkLok1ZPnk0qEHa7HqMsxq6OFGLjYN5CTh27kkEo=;
        b=c5uRaUJHkzCWvWPT6nZgKLOqiVwtQBiKH4JFlduUSOn073avGnBCU8VyAQnRouK1aJ
         OCuOBp51Ry60Vu9+9c8bDBRkq2UqTOEamkfY2MuaaaCtUbHBc0V3N9o+SogzdsywPHr5
         iv1p6RVnTJ9mA82VIdgjgJZBmZ51ExQvyDbIM4FCGZeZ3V28PKZmnGVkmHvOyriuJS6Q
         1Vv25n4gUlW73opPrt3YsxjT14C7q2u8Q/JlNOljcNs0pyzPE93Z4ZYHHsAcWaQ1URYq
         +yMgYl1FGZwSWbPt7p1RY9MwmprgLNHcOWtrC6CKdTySh8/n5kJ3SUZoHFMVj/dnX2XJ
         3gMw==
X-Gm-Message-State: AOAM530mjuFzE/znz8+sCkzSeuP9vYKDkCYoONpnd7gmJaSL03miGAfN
        DMOzlVzYKwb+wp09+bvys8090pMo
X-Google-Smtp-Source: ABdhPJz56pKG6gDWHVpqU/LtOwYyWyJ8Rz6y88kGeZInLamhVFQw3fPUi/5NzxgQ4IpK0I9gooSf5w==
X-Received: by 2002:a17:906:cede:: with SMTP id si30mr1128605ejb.315.1592430106800;
        Wed, 17 Jun 2020 14:41:46 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:54e4:c127:a142:2ade? ([2a01:110f:b59:fd00:54e4:c127:a142:2ade])
        by smtp.gmail.com with ESMTPSA id b11sm743222eju.91.2020.06.17.14.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 14:41:46 -0700 (PDT)
Subject: Re: [RESEND PATCH v27 11/15] leds: lp55xx: Add multicolor framework
 support to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, kernel test robot <lkp@intel.com>,
        pavel@ucw.cz, robh@kernel.org
Cc:     kbuild-all@lists.01.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200615201522.19677-12-dmurphy@ti.com>
 <202006180032.JW0i39C6%lkp@intel.com>
 <0a8a6f57-678d-b1b9-41e5-5e58c15cfe6b@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <58ad7723-131f-6930-00d7-1144c993110c@gmail.com>
Date:   Wed, 17 Jun 2020 23:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0a8a6f57-678d-b1b9-41e5-5e58c15cfe6b@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/17/20 9:22 PM, Dan Murphy wrote:
> Pavel/Jacek
> 
> On 6/17/20 11:28 AM, kernel test robot wrote:
>> Hi Dan,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on pavel-linux-leds/for-next]
>> [cannot apply to j.anaszewski-leds/for-next]
>> [if your patch is applied to the wrong git tree, please drop us a note 
>> to help
>> improve the system. BTW, we also suggest to use '--base' option to 
>> specify the
>> base tree in git format-patch, please see 
>> https://stackoverflow.com/a/37406982]
>>
>> url:    
>> https://github.com/0day-ci/linux/commits/Dan-Murphy/Multicolor-Framework-v27/20200616-042217 
>>
>> base:   
>> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git 
>> for-next
>> config: ia64-randconfig-r015-20200617 (attached as .config)
>> compiler: ia64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>> make.cross ARCH=ia64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>> `lp55xx_set_mc_brightness':
>>>> drivers/leds/leds-lp55xx-common.c:146: undefined reference to 
>>>> `led_mc_calc_color_components'
>> ia64-linux-ld: drivers/leds/leds-lp55xx-common.o: in function 
>> `devm_led_classdev_multicolor_register':
>>>> include/linux/led-class-multicolor.h:74: undefined reference to 
>>>> `devm_led_classdev_multicolor_register_ext'
>> vim +146 drivers/leds/leds-lp55xx-common.c
>>
>>     138
>>     139    static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
>>     140                        enum led_brightness brightness)
>>     141    {
>>     142        struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
>>     143        struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
>>     144        struct lp55xx_device_config *cfg = led->chip->cfg;
>>     145
>>   > 146        led_mc_calc_color_components(&led->mc_cdev, brightness);
>>     147        return cfg->multicolor_brightness_fn(led);
>>     148
> 
> Well this was a mess to figure out.
> 
> The only fix I can figure out here is to remove the
> 
>      depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
> 
> from each child device and add
> 
>      select LEDS_CLASS_MULTI_COLOR
> 
> to the LP55XX_COMMON
> 
> This way the Multi color framework will inherit the symbol that was set 
> by the COMMON flag which is inherited by majority from the child flags.

Did you try this?

--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -398,6 +398,7 @@ config LEDS_LP50XX
  config LEDS_LP55XX_COMMON
         tristate "Common Driver for TI/National 
LP5521/5523/55231/5562/8501"
         depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
+       depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
         depends on OF
         select FW_LOADER
         select FW_LOADER_USER_HELPER


-- 
Best regards,
Jacek Anaszewski
