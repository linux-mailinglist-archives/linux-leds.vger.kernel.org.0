Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3BCCAD82
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 19:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731650AbfJCRnY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 13:43:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54125 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbfJCRnX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 13:43:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so2896736wmd.3;
        Thu, 03 Oct 2019 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rRvMcMSWx0eNOiyY2f6VwI9/J7XajfhW8oNLH2wDae0=;
        b=VZvPsn2Mu+UCzPwHTGseHR4HPGFl+zSIMuU7IU4TucizRq4Li23XCOlydW7JXezhuy
         OMm3twmNKkdVkQng3v43tcvf6tDGd8mAMDitoAvh6JSJNwaExh9EE/0Djy9ZQViWoDH5
         dD7LbQ2jlQwBeb7oPC9KMmsPFgS7zdRjEhMBUEmAf+fo8jfqKvVFbS9klLT4ieyiINQc
         OKArUjfvt0L87SENq46bcecONdjNtusTJDxv2ZrXGlF+TDMQ2D+f6m6Um32EyxyNKJvV
         e08LD8vxnI3AhkjTafy8oPfzeCYB81y66IrCv8jQ0JV3W2VBpwu7YINvGbEoqux16ng3
         daqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rRvMcMSWx0eNOiyY2f6VwI9/J7XajfhW8oNLH2wDae0=;
        b=cUYgSHiR3R+MxPvZg2uechK9Yi80oggsBFAqZEEE8BLa3eWegFdMd0WIdXqIxJCX5x
         g5jqkH3lNRft6qkiH4C8CMLKMDf/Q5un4kJMn5+lfd3bTICoSjvucnGKXUTfwh+bJAXq
         Yw9Nwiw/hdfURvgsDuxxAoogP1Bh/QjidpLvdea2awGS81FIhhRyRV8gWvIz73zSoY0t
         7Wr2n7w/vxk2w+0788KDyKIw6BxoXPSdSXmrZQBIpuMWeusvXBevkvQBrCaZFm5Fd7JC
         n3rDZ+LUBT3prSR4N1K7WHKwFNty28fCagXNPFVeAXW5KxnVyXRu81zEEqdelRlEbo7v
         RMCg==
X-Gm-Message-State: APjAAAU+XxC0NDSgFGurz19AJCmvkfclyrGhyvYiv1MvyWNRKFC46XSN
        b+BVlJU0w+4lK+Y0OuBsyzo=
X-Google-Smtp-Source: APXvYqxWnK7Fm1KS7o4d9ncOw65MrbR6WO3bQ2ghPhOQsNCMtxU/yeODhxDpgbtWK3HhBarOkTDeJw==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr7893729wmc.140.1570124601372;
        Thu, 03 Oct 2019 10:43:21 -0700 (PDT)
Received: from [192.168.1.19] (civ244.neoplus.adsl.tpnet.pl. [83.31.45.244])
        by smtp.gmail.com with ESMTPSA id g3sm6709471wro.14.2019.10.03.10.43.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 10:43:20 -0700 (PDT)
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        lee.jones@linaro.org, daniel.thompson@linaro.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
Date:   Thu, 3 Oct 2019 19:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

On 10/3/19 2:47 PM, Jean-Jacques Hiblot wrote:
> Hi Sebastian,
> 
> On 03/10/2019 12:42, Sebastian Reichel wrote:
>> Hi,
>>
>> On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:
>>> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>>
>>> This patch adds basic support for a kernel driver to get a LED device.
>>> This will be used by the led-backlight driver.
>>>
>>> Only OF version is implemented for now, and the behavior is similar to
>>> PWM's of_pwm_get() and pwm_put().
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>> ---
>>>   drivers/leds/led-class.c | 44 ++++++++++++++++++++++++++++++++++++++++
>>>   include/linux/leds.h     |  4 ++++
>>>   2 files changed, 48 insertions(+)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index c2167b66b61f..455545f5d663 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -19,6 +19,7 @@
>>>   #include <linux/spinlock.h>
>>>   #include <linux/timer.h>
>>>   #include <uapi/linux/uleds.h>
>>> +#include <linux/of.h>
>>>   #include "leds.h"
>>>     static struct class *leds_class;
>>> @@ -214,6 +215,49 @@ static int led_resume(struct device *dev)
>>>     static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend,
>>> led_resume);
>>>   +/**
>>> + * of_led_get() - request a LED device via the LED framework
>>> + * @np: device node to get the LED device from
>>> + * @index: the index of the LED
>>> + *
>>> + * Returns the LED device parsed from the phandle specified in the
>>> "leds"
>>> + * property of a device tree node or a negative error-code on failure.
>>> + */
>>> +struct led_classdev *of_led_get(struct device_node *np, int index)
>>> +{
>>> +    struct device *led_dev;
>>> +    struct led_classdev *led_cdev;
>>> +    struct device_node *led_node;
>>> +
>>> +    led_node = of_parse_phandle(np, "leds", index);
>>> +    if (!led_node)
>>> +        return ERR_PTR(-ENOENT);
>>> +
>>> +    led_dev = class_find_device_by_of_node(leds_class, led_node);
>> If you convert led_node into a fwnode, you can use
>> class_find_device_by_fwnode() instead. That way the
>> first patch can just be dropped.
> 
> Thanks for the reviews.
> 
> The first patch could be dropped  indeed, but it would break something
> else I'm working on: getting regulator support in the LED core.
> 
> This has been discussed during the v7 iteration of this series.

I wonder if it wouldn't make sense to add support for fwnode
parsing to regulator core. Or maybe it is either somehow supported
or not supported on purpose?

These are questions to regulator maintainers.

Adding Liam and Mark.

-- 
Best regards,
Jacek Anaszewski
