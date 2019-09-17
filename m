Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23CF8B5409
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 19:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfIQRXJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 13:23:09 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37496 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbfIQRXJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 13:23:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id r195so4102236wme.2;
        Tue, 17 Sep 2019 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mPHpq8YPW2F/OPmOouNmbbs+nx+Pj46y/j0nBKtb7Y4=;
        b=W4mX3B4prqLfOFOChDYNwukMYuXOW2OYpXrgEtb9O+ge0iqs4H2k2FgmeuBKd7SHBy
         WbGtbKniB3vYNuOLhg04nMP7ZZsa1s+38AyLXq5JLgW8X6xWE9D+Rwxh3s1yJYhdxHJz
         UPo6dY5xwDC8fglgjKGqBufQ9qPj6+nT69OwVO4+cn/Nky6EPvtzevMhgUY2+0ikQbpI
         Bc2sjXi+EsLGUciPMGTHjGA/RcMsPom+RNdBjllO7opdBVcei6OsuHUHcUTub5ikyKNo
         KKYeYICGqIuKo9aY9N2vi4KoExl/ZFi3jm3QgJEcCYQK0rzA77kDF01YdJ2+uc9J+K3o
         tZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mPHpq8YPW2F/OPmOouNmbbs+nx+Pj46y/j0nBKtb7Y4=;
        b=rNSim74EEGRf0gqFBiIR0RyaCWJ7jLZisUxS1BYrNpT5ZPhF2UWMhcpkjqQ0jMcNsB
         tK2WlP/xU7DqtStX+L/3DUTUxsjinhWpym8yyAeH8DJqIpEJCfA1Ip0v7km39nc64lv2
         b8cbFrod4afNiyM3ZdQ4EhjeC81qVZH0Khn4NJclQaqALR46zakZH5Nv6nVcfY19f/qy
         4kFv7+o53wGtXsU6e3Iy0XnlmUpXn1M7qGtLxojn/ot1ZprJWEEyV5JM98lmivZb6xT+
         N/Yqvd0TvWvtUUsrFPkiCLwXMr6xrwYeoxi+xfdBZPep+ohmJDC+0Uva23+B1O72VKfX
         x/gg==
X-Gm-Message-State: APjAAAVOYMKBki4T+deaqBaVUbC4vtj6xA4/e1taK9SCsvnnBiAvcPI8
        jn6nbdC3i+9FMGqPiGDhkVgaBB5o
X-Google-Smtp-Source: APXvYqxJiN0jkEytHfzKUig1XsDJcjfiHAXy+baWSVaEsQ4Vp2hSu7RNl0tLQFfxdLd5XuKv4NKqXA==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr4531267wmg.53.1568740985533;
        Tue, 17 Sep 2019 10:23:05 -0700 (PDT)
Received: from [192.168.1.19] (chq132.neoplus.adsl.tpnet.pl. [83.31.14.132])
        by smtp.gmail.com with ESMTPSA id q10sm6747905wrd.39.2019.09.17.10.23.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 10:23:04 -0700 (PDT)
Subject: Re: [FYI] lm3532: right registration to work with LED-backlight
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190827215205.59677-1-tony@atomide.com>
 <20190828085339.GB2923@amd> <c3ac1863-9cdb-1ba6-d5a4-df1c4cfecbe1@gmail.com>
 <20190908080305.GC25459@amd> <390760c1-de39-9328-bb23-cbf791094718@gmail.com>
 <20190917124210.GB27465@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <747f9567-e8c8-6816-7668-9eda4497cc54@gmail.com>
Date:   Tue, 17 Sep 2019 19:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917124210.GB27465@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/17/19 2:42 PM, Pavel Machek wrote:
> Hi!
> 
>>>>> +++ b/drivers/leds/leds-lm3532.c
>>>>> @@ -629,7 +629,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>>>>>  
>>>>>  		lm3532_init_registers(led);
>>>>>  
>>>>> -		ret = devm_led_classdev_register(priv->dev, &led->led_dev);
>>>>> +		ret = devm_of_led_classdev_register(priv->dev, to_of_node(child), &led->led_dev);
>>>>
>>>> We no longer have devm_of_led_classdev_register(). You must use
>>>> devm_led_classdev_register_ext().
>>>
>>> Something like this (untested)?
> 
>> If you want to properly switch to the new extended LED registration
>> API, then you need:
>>
>> .default_label = ":",
>> .devicename = led->client->name;
>>
>> and in addition to that you need to remove old way of composing
>> the LED name. Something like patch [0] for leds-lm3692x.c.
>> And also patch for DT for consistency would be needed (like [1]).
>>
>> However it will not change anything in LED naming in comparison
>> to the existing code, except that it will enable the possibility
>> of using 'function' and 'color' DT properties instead of deprecated
>> 'label'.
>>
>> I suppose that you expected some extra bonus by passing
>> DT node, but I'm not sure what exactly. Possibly you confused
>> this with the patch set [2] that allows for instantiating
>> backlight device on top of LED class device (it has been forgotten
>> btw and will miss 5.4).
> 
> Yes, it is for LED backlight. Thanks for hints, you have corrected
> version in your inbox.

You need also below cleanups. Please compare my patches reworking
existing drivers in the for-next branch.

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 0507c6575c08..fc166f1a1789 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -9,7 +9,6 @@
 #include <linux/types.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
-#include <uapi/linux/uleds.h>
 #include <linux/gpio/consumer.h>

 #define LM3532_NAME "lm3532-led"
@@ -128,7 +127,6 @@ struct lm3532_als_data {
  * @full_scale_current - The full-scale current setting for the current
sink.
  * @led_strings - The LED strings supported in this array
  * @enabled - Enabled status
- * @label - LED label
  */
 struct lm3532_led {
        struct led_classdev led_dev;
@@ -141,7 +139,6 @@ struct lm3532_led {
        int full_scale_current;
        int enabled:1;
        u32 led_strings[LM3532_MAX_CONTROL_BANKS];
-       char label[LED_MAX_NAME_SIZE];
 };

 /**
@@ -639,16 +636,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
                fwnode_property_read_string(child, "linux,default-trigger",
                                            &led->led_dev.default_trigger);

-               ret = fwnode_property_read_string(child, "label", &name);
-               if (ret)
-                       snprintf(led->label, sizeof(led->label),
-                               "%s::", priv->client->name);
-               else
-                       snprintf(led->label, sizeof(led->label),
-                                "%s:%s", priv->client->name, name);
-
                led->priv = priv;
-               led->led_dev.name = led->label;
                led->led_dev.brightness_set_blocking =
lm3532_brightness_set;

                ret = devm_led_classdev_register(priv->dev, &led->led_dev);

-- 
Best regards,
Jacek Anaszewski
