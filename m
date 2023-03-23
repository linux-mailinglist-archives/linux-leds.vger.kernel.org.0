Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E00B6C6421
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 10:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjCWJyQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 05:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjCWJxi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 05:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6446D9776
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 02:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679565130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OmSTNPpOoq9vQpt6rSTHs2phlb2weD2+1NaDlz4La0E=;
        b=fjDVEtz3c71N4RYywf6TBxJqmKqPMHUSHfynyhs9vMYvZvaakI6TsHF8F7xsSv30S0cRBM
        BEkmtxt+FSyFPeQeK8ei3Jw+Njc7lzc6RRroaM/ROx6q63hS9IQlWkJvNX0nYUyzcXkxsM
        uZSyNTNxqX5VX/ZlwiyauNtBXf3AvbU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-RZ6DFX3GOAqaFOu3TSa4Kg-1; Thu, 23 Mar 2023 05:52:09 -0400
X-MC-Unique: RZ6DFX3GOAqaFOu3TSa4Kg-1
Received: by mail-ed1-f69.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so31810024edc.11
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 02:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmSTNPpOoq9vQpt6rSTHs2phlb2weD2+1NaDlz4La0E=;
        b=ZWYcWJDjDvVyDYoUBCTmY5l46v0WklEJQM9FX5p9tMK/rt/PxMpqBmNxeT7iaaq4w7
         QAmJQH6oPVeVuLbCE3HerQGD8WFd/la7Zx+hOiBmF5FFhzLHMo4oV8DM48hhTyTWsrmz
         FinpDOXHneqsdfq55MFLogth5VoMDISERC9aoxkDfqaIXifULrWHcS1eieZ+RJR+l94n
         RUB0M66T0ZWptsBmny2zbT6x33xAg0BI6Ya/2tbqTYm+YVnP4gsq8dnMnv4d59BgNfWW
         mauB1LB7m/YZXRBTaLrwh8a5y9OU7DycEbsjnwS+OFYCjQD7fGI2LeaIm9T8iSxfwGmg
         StEw==
X-Gm-Message-State: AO0yUKXNPJJJN6p6zzJwkmBYpq0IphYun9Csafy9cu/SNnJaIOoYJPpP
        uDLDFp2I/QErpzIyqu6n6GpxN/p3cXJrvYi+qEimDogpoQIn4lvjRkcJfopZI32dWCAByeGVSzk
        kQ4eeWeVPgBDX9fDhwlftvg==
X-Received: by 2002:a17:906:46d0:b0:933:3a65:67ed with SMTP id k16-20020a17090646d000b009333a6567edmr11730837ejs.75.1679565128127;
        Thu, 23 Mar 2023 02:52:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+2Y7D5lY7burdz3bkjWy2MCm5EEaPXEoBZAk2crBJz4T/JZjrPswFMW4KQcKzN+/Z+Lrnw1A==
X-Received: by 2002:a17:906:46d0:b0:933:3a65:67ed with SMTP id k16-20020a17090646d000b009333a6567edmr11730827ejs.75.1679565127836;
        Thu, 23 Mar 2023 02:52:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cd11-20020a170906b34b00b0093009bc5825sm8469152ejb.2.2023.03.23.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:52:07 -0700 (PDT)
Message-ID: <ac0d584d-0d80-981d-e2eb-b68f03e333a9@redhat.com>
Date:   Thu, 23 Mar 2023 10:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] leds: tps68470: Refactor tps68470_brightness_get()
To:     Dan Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-6-dan.scally@ideasonboard.com>
 <15dfc66b-83f7-4abf-1bc3-3bd9a2666aa1@redhat.com>
 <14b8e3e2-1a29-04c7-18a1-0eda82ec97fa@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <14b8e3e2-1a29-04c7-18a1-0eda82ec97fa@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/23/23 08:43, Dan Scally wrote:
> Morning Hans
> 
> On 22/03/2023 17:22, Hans de Goede wrote:
>> Hi,
>>
>> On 3/22/23 17:09, Daniel Scally wrote:
>>> We want to extend tps68470_brightness_get() to be usable with the
>>> other LEDs supplied by the IC; refactor it to make that easier.
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>>   drivers/leds/leds-tps68470.c | 17 +++++++++--------
>>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
>>> index d2060fe4259d..44df175d25de 100644
>>> --- a/drivers/leds/leds-tps68470.c
>>> +++ b/drivers/leds/leds-tps68470.c
>>> @@ -77,23 +77,24 @@ static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev
>>>       int ret = 0;
>>>       int value = 0;
>>>   -    ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
>>> -    if (ret)
>>> -        return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading register\n");
>>> -
>>>       switch (led->led_id) {
>>>       case TPS68470_ILED_A:
>>> -        value = value & TPS68470_ILEDCTL_ENA;
>>> -        break;
>>>       case TPS68470_ILED_B:
>>> -        value = value & TPS68470_ILEDCTL_ENB;
>>> +        ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
>>> +        if (ret)
>>> +            return dev_err_probe(led_cdev->dev, ret,
>>> +                         "failed to read LED status\n");
>> I realize this is a pre-existing problem, but I don't think we should
>> be using dev_err_probe() in functions which are used outside the probe()
>> path?
> 
> 
> I had thought that this was being encouraged because of the standard formatting, but actually now I re-read the comment's function it's just "OK to use in .probe() even if it can't return -EPROBE_DEFER". My bad; I'll fix it.
> 
>>
>> So maybe fix this up while at it and make this:
>>
>>         if (ret) {
>>             dev_err(led_cdev->dev, ""failed to read LED status: %d\n", ret);
>>             return ret;
>>         }
>>
>>> +
>>> +        value &= led->led_id == TPS68470_ILED_A ? TPS68470_ILEDCTL_ENA :
>>> +                    TPS68470_ILEDCTL_ENB;
>>>           break;
>>> +    default:
>>> +        return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");
>> idem.
> 
> 
> idem? Sorry, I'm not following here.

My bad I though this was something which most people understand / know:

https://en.wikipedia.org/wiki/Idem

So what I was trying to say is:

"the same (don't use dev_err_probe()) applies here".

Regards,

Hans





> 
>>
>> With those fixed:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>       }
>>>         return value ? LED_ON : LED_OFF;
>>>   }
>>>   -
>>>   static int tps68470_ledb_current_init(struct platform_device *pdev,
>>>                         struct tps68470_device *tps68470)
>>>   {
> 

