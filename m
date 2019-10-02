Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2173C9299
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 21:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfJBTr0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 15:47:26 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38833 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfJBTrZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 15:47:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id w12so371535wro.5;
        Wed, 02 Oct 2019 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XC7LA55iHiUITo+83QzxAVmoetQd0JqQF8Gg112JjJQ=;
        b=TVI8bgL+0zY79i9zDnmSeL3V5D3k8c5dUaQlFSw+o+Pl+hcTUJmnd/icqybX32e1dh
         TORtaW8b7jSpFTeXHCb2O1HtYNoOXm3HbH8iXiujD7iNP1ccqJJSffjeIT0xlusq635f
         cfA8deGNzjEjZq/o4NIiSJJFaxcvGmRcH78w7sCYW7GXST4NXMahA+baJEkX4d8TklGU
         mheCkQdLzryCbjRmYTqzE7hcUOMxGFPWhm7QEJMQ6iAizHChiRlAxyvbuPaakkIpiOIG
         AUZscZUFBJWJim7yRKvDQ2g7++Fsj/guprIlQwbbPVvSOxPy6tQII9qIzAAYuH3kVHy7
         L9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XC7LA55iHiUITo+83QzxAVmoetQd0JqQF8Gg112JjJQ=;
        b=Uo/1HgAHEs5arqyohhnRgYEDV+m4QPAanoDDVIGfZcrk2oYDKuuC2Fm2pbaO+wQvyN
         ZvUpzJmuovHeGPzN5VcxCI7RSdN6UUydGVXqUBizuMXmJTzMpP7gevtRIKjYwe8cZNG+
         g8ctoa4dhf+anA0+o7NC9IxJ6Cu+CMYxqH7vqQs2nEk7CCMKuwdxdk9mmG1RaU0Eh9WO
         PXXsocfxp+1Qiw/aJKz67L9aYYx51Im3P/bpr/SqpYzS5g/jxMB3HIAHifIml640NuXj
         npQtxs4FwnBM/hVipFgSzO/f12t9g6gc716sXnXFBWHwucJL6VhsFR3QwtreyxjK7vmw
         Ya5w==
X-Gm-Message-State: APjAAAUx7qemam1qyXw5nYxfaF/v0JCmD7fbhCZ6LiHjJTRCGTZkq31V
        K6n6HNTUVt/yV0UCFYDAtTw=
X-Google-Smtp-Source: APXvYqxmXlFoHspoGGfhtQtVCMlMyjp0i+wHw/MOyFzuuPKkitH7WZnXt1PsKKhwB8WE33W/gSqlXw==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr3954548wrq.165.1570045641581;
        Wed, 02 Oct 2019 12:47:21 -0700 (PDT)
Received: from [192.168.1.19] (ckh198.neoplus.adsl.tpnet.pl. [83.31.83.198])
        by smtp.gmail.com with ESMTPSA id m62sm141201wmm.35.2019.10.02.12.47.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 12:47:20 -0700 (PDT)
Subject: Re: [PATCH v7 1/5] leds: populate the device's of_node when possible
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-2-jjhiblot@ti.com>
 <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
 <e9588e03-20d4-7e6d-e514-0b79dae12cce@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b7b3409b-97bd-79b4-a712-6c03c6eabd56@gmail.com>
Date:   Wed, 2 Oct 2019 21:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e9588e03-20d4-7e6d-e514-0b79dae12cce@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

On 10/2/19 3:58 PM, Jean-Jacques Hiblot wrote:
> Hi Jacek,
> 
> On 24/09/2019 23:03, Jacek Anaszewski wrote:
>> Hi Jean,
>>
>> Thank you for rebasing the set
>>
>> On 9/18/19 4:57 PM, Jean-Jacques Hiblot wrote:
>>> If initialization data is available and its fwnode is actually a
>>> of_node,
>>> store this information in the led device's structure. This will allow
>>> the
>>> device to use or provide OF-based API such (devm_xxx).
>>>
>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>> ---
>>>   drivers/leds/led-class.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 647b1263c579..c2167b66b61f 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -276,8 +276,11 @@ int led_classdev_register_ext(struct device
>>> *parent,
>>>           mutex_unlock(&led_cdev->led_access);
>>>           return PTR_ERR(led_cdev->dev);
>>>       }
>>> -    if (init_data && init_data->fwnode)
>>> +    if (init_data && init_data->fwnode) {
>>>           led_cdev->dev->fwnode = init_data->fwnode;
>>> +        if (is_of_node(init_data->fwnode))
>>> +            led_cdev->dev->of_node = to_of_node(init_data->fwnode);
>> It would be step backwards. You can do the conversion in the place of
>> use i.e. in devm_led_get().
> 
> Could be done. But it would break another use case I have. I'm also
> working on the regulator support and for this one, of_node needs to be
> populated.

I thought that regulator core can do the conversion to of_node itself,
but this seems not to be the case.

> Is there a problem populating of_node if the LED is indeed described in
> the DT ?

No, if it is not possible to do it otherwise.

-- 
Best regards,
Jacek Anaszewski
