Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55417C1095
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2019 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfI1K3O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Sep 2019 06:29:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34013 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfI1K3O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Sep 2019 06:29:14 -0400
Received: by mail-wm1-f67.google.com with SMTP id y135so10330036wmc.1;
        Sat, 28 Sep 2019 03:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9Dwre/L+ieT/XxIVjOPLPPe4F/irNf6EoQVH8e6iN3w=;
        b=bXUodu772GoN0O5h+WYhD1MhiqCcVH+fZJtiL5J2sp+x4LNg5lCw44vqPs0XaZ1asA
         rARbQlHwOrwnJr9CVCJnqtSfhjuQ/Pc355y2QNt4mt8bJ4XLIf+CFinXu6yFss1C3cSR
         A7opKvGyKcMPOPleK7yVMOc4ftW+GpLoD7ScQ0fHn9j4c67FipQ76OVxs9zX69OEUGLw
         1jtTvdERCfPbHdsAfWS8of4zvt6mlDAIaXWW92w+zXJgF8lWfMGzC39XIVCFfku0aMfm
         s8EwtgcGSzRw4BDjxVcatdwLOJ6QTFOTNlc/Xdy392ZNlRqsXAAcXWimM7ZECYCphBjT
         4MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9Dwre/L+ieT/XxIVjOPLPPe4F/irNf6EoQVH8e6iN3w=;
        b=k8SVo10hbUz8rycM8yJUu7FcXxYR4nW9AOfaBNPpx+2rXZtwj/bQpLq7Ptxhsz8cCT
         HmHsmhr3dQAAWHqwBItjfX1b5mc5MauxuSJrVg66BbumXLUJ/182vbhIco9z1De9VBuw
         Z6DO2e8oIl1zb+PpfazHJ8X0GStRTzQKnVS7x/dyoT6hQIC0/2pSNd0XDST+DSVMhfo9
         yMYX5sIuuaLfICIKGglkvandXc23nRaimOMWUHuFQjclqj+Cuc/CgSE+IVN0rcNKcTGB
         VmB++X/FvWyC/gM+Py6nS6WUXf9yM32WSPSuMKTqUKZP776BeKhWo+k1TXfN8WVCy/sk
         Fgsg==
X-Gm-Message-State: APjAAAU3u3dITWkkrsSJ6Zm0RZoXRvBNQixrep4gqE6GNmf0VujAH7S8
        pWqGrhyuMe4bq+B04yq/RZ76Wcsl
X-Google-Smtp-Source: APXvYqz7X5XoPd34s1mwgNPJMymPbNr9WfSwOSNHks+jRmEyhWHixID6KOXx67N3Wdgs2wjlYvtfEQ==
X-Received: by 2002:a05:600c:20a:: with SMTP id 10mr11150024wmi.75.1569666549516;
        Sat, 28 Sep 2019 03:29:09 -0700 (PDT)
Received: from [192.168.1.19] (chs80.neoplus.adsl.tpnet.pl. [83.31.16.80])
        by smtp.gmail.com with ESMTPSA id t13sm10968963wra.70.2019.09.28.03.29.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Sep 2019 03:29:08 -0700 (PDT)
Subject: Re: [PATCH v9 07/15] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-8-dmurphy@ti.com>
 <4293530f-70ae-0796-e7a7-0c6564e71132@gmail.com>
 <d4126720-25ea-7c15-2424-b7f16b25c3b4@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4186e454-48fd-1578-cd26-083b54c707ab@gmail.com>
Date:   Sat, 28 Sep 2019 12:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d4126720-25ea-7c15-2424-b7f16b25c3b4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/26/19 1:59 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/25/19 4:27 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/25/19 7:46 PM, Dan Murphy wrote:
> 
> <big_snip>
> 
>>> +
>>> +static int lp50xx_brightness_set(struct led_classdev *cdev,
>>> +                 enum led_brightness brightness)
>>> +{
>>> +    struct lp50xx_led *led = container_of(cdev, struct lp50xx_led,
>>> led_dev);
>>> +    const struct lp50xx_chip_info *led_chip = led->priv->chip_info;
>>> +    struct led_mc_color_entry *color_data;
>>> +    u8 led_offset, reg_val, reg_color_offset;
>>> +    int ret = 0;
>>> +
>>> +    mutex_lock(&led->priv->lock);
>>> +
>>> +    if (led->ctrl_bank_enabled)
>>> +        reg_val = led_chip->bank_brt_reg;
>>> +    else
>>> +        reg_val = led_chip->led_brightness0_reg +
>>> +              led->led_number;
>>> +
>>> +    ret = regmap_write(led->priv->regmap, reg_val, brightness);
>>> +    if (ret) {
>>> +        dev_err(&led->priv->client->dev,
>>> +            "Cannot write brightness value %d\n", ret);
>>> +        goto out;
>>> +    }
>>> +
>>> +    list_for_each_entry(color_data, &led->mc_cdev.color_list, list) {
>>> +        if (color_data->led_color_id == LED_COLOR_ID_RED)
>>> +            reg_color_offset = 0;
>>> +        else if (color_data->led_color_id == LED_COLOR_ID_GREEN)
>>> +            reg_color_offset = 1;
>>> +        else if (color_data->led_color_id == LED_COLOR_ID_BLUE)
>>> +            reg_color_offset = 2;
>>> +        else
>>> +            continue;
>> This else case is quite erroneous. Sheer continue is just ignoring
>> serious problem. I'd log the problem and return -EINVAL.
> Ack.
>>
>> Also, you could have a macro for mapping color_id to offset.
> If the code needed to do this more then once I could justify a macro. 
> But this is the only instance of this check.

OK, at first glance I thought we could have a formula for that,
but this is not the case.

-- 
Best regards,
Jacek Anaszewski
