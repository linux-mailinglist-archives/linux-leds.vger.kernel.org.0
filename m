Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BECC6C6651
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbjCWLQi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbjCWLQh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB727FF3C
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679570129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4vQy9FIb5CxZMqSl+k8hHQh/v/HhUVqg5T2Cb4K6fAg=;
        b=PEPy1VaAoTteljvOdueaycxPQhSQG4NtIc1x5ZtOAGD9BHDkhipXYEt74/P4I0lYOHIQVo
        bJPJ30RqzrzE6ahHJsneOThXpgoCQ2pVAw0hcMz6YiQP4a8MUC7aT7Q2MDwwOI4o+GC+Cn
        IR6xcyiCCtHJ2TQPjHDQth+LSw4XMzc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-kxaFBVQFMI-LL4uW_brBGA-1; Thu, 23 Mar 2023 07:15:27 -0400
X-MC-Unique: kxaFBVQFMI-LL4uW_brBGA-1
Received: by mail-ed1-f72.google.com with SMTP id dn8-20020a05640222e800b004bd35dd76a9so32030775edb.13
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vQy9FIb5CxZMqSl+k8hHQh/v/HhUVqg5T2Cb4K6fAg=;
        b=f16tPFw0pi/BnoA/02b29sf21dm/iOax+7n48kbLlk3Uby0kgsbtndWj6UO9yDCR8n
         9DfZPIOjddPXVmOjGczDRnUltv54rFmiilpeRc5dWg8QHbWqW+tsiGNm72e2+yzG7HYS
         bXGdIw9s4oXOjoeV7eYIxXp/kbkE1K1bITk7FUEJyr9jSMHsykN4YGtxvqPF5nIpnz7z
         uBo5yTHLD3pZph6r/jJPQ2mtvtmo7OBhUB3Lq3MC+gUFF6Y5qwg9IozcWJiYotE57zCB
         oFB5IiuGOL3uqFtFTgxfFhX6V1OUIryLyZ8Qoy3FFaG5g2tZpFJ3Eg6M5x7Z30d/5WYU
         ljxg==
X-Gm-Message-State: AO0yUKV0SznnvG78v5dhz3MDAkCk4teKZwFBgk2bq767R5sZCkGD1IRO
        0AH8Vc0xcBVB62Fr2IjV21TubF6qEPSn8XvebDGtshb0e4weP30WQUGw9ZJLehFstbDuABma49x
        0JcVLfAH/JEhw33O6kRg7Yw==
X-Received: by 2002:a17:907:7ba0:b0:93c:847d:a456 with SMTP id ne32-20020a1709077ba000b0093c847da456mr3244376ejc.22.1679570126854;
        Thu, 23 Mar 2023 04:15:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set8uDDM/ZEig9lfljGumLl7A2Vh1bsUUrOjjDV8Sb+6pxUygVjDMpvr54caZGVrO21m9Q9XqQw==
X-Received: by 2002:a17:907:7ba0:b0:93c:847d:a456 with SMTP id ne32-20020a1709077ba000b0093c847da456mr3244356ejc.22.1679570126580;
        Thu, 23 Mar 2023 04:15:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i1-20020a170906444100b0092178941cb6sm8543719ejp.39.2023.03.23.04.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:15:25 -0700 (PDT)
Message-ID: <e79b18cd-2f5b-05b5-37d9-98e103330993@redhat.com>
Date:   Thu, 23 Mar 2023 12:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] platform/x86: int3472: Define LED lookup data for MS
 Surface Go
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-9-dan.scally@ideasonboard.com>
 <ed161532-1f4b-74b2-1391-95d06e4c8200@redhat.com>
 <ebd90301-bc84-3810-3633-041978b8056d@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ebd90301-bc84-3810-3633-041978b8056d@ideasonboard.com>
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

On 3/23/23 11:31, Dan Scally wrote:
> Hi Hans
> 
> On 22/03/2023 17:34, Hans de Goede wrote:
>> Hi,
>>
>> On 3/22/23 17:09, Daniel Scally wrote:
>>> Add LED lookup data to tps68470_board_data.c for the Microsoft
>>> Surface Go line of devices.
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>>   .../x86/intel/int3472/tps68470_board_data.c    | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>>> index 0d46a238b630..e2c53319e112 100644
>>> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>>> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>>> @@ -157,10 +157,27 @@ static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
>>>       .wledctl_disled2 = false,
>>>   };
>>>   +static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
>>> +    .n_lookups = 2,
>>> +    .lookup_table = {
>>> +        {
>>> +            .provider = "tps68470-iled_a::indicator",
>>> +            .dev_id = "i2c-INT347A:00",
>>> +            .con_id = "privacy-led",
>>> +        },
>>> +        {
>>> +            .provider = "tps68470-wled::indicator",
>>> +            .dev_id = "i2c-INT347E:00",
>>> +            .con_id = "privacy-led",
>>> +        },
>> So this feels wrong to me in 2 ways:
>>
>> 1. It is abusing .con_id = "privacy-led" to enable the WLED
>>
>> 2. You are not activating the front privacy LED for the IR projector. I have noticed on IPU6 devices that the _DSM listing GPIOs for the discrete INT3472 device lists a privacy-LED GPIO for the IR sensor too, which I so far have been guessing activates the actual privacy-LED. As I'm typing this I'm wondering if instead this is doing the same hack as you are doing here ?
> 
> 
> Oh interesting; on IPU3 devices with the discrete INT3472 the IR cameras don't seem to have an LED GPIO in _DSM so we're not sure how to turn them on yet. I also have a Pro7 which is an IPU4 device, but that has the same problem as on the IPU3 ones - there's no privacy-led GPIO defined in _DSM and the _ON method for the camera's _PR0 resource just prints "PR Not Supported"...so we don't know how to use those yet. So interesting that the IPU6 ones work differently.
> 
> 
>>
>> Regardless I think it would be best to turn on the front privacy LED when the IR camera is used too, right ?
> 
> 
> That does make a certain amount of sense yes - My only thought would be that this would be difficult to replicate to platforms that use _only_ discrete versions of the INT3472, because each sensor depends on a separate INT3472, so there wouldn't be an obvious way to automatically assign the privacy LED for the user facing camera to the IR camera since we couldn't use the board data method below. It might be surmountable using the location information in DSDT to decide whether it's on the same face as another camera which DOES have a privacy LED maybe...

Right, I realize turning on the front privacy LED when the front ir-sensor is on is not always going to be (easily) doable. But IMHO we should at least do it on platforms where we can do this.

>> IMHO this should look like this (with either the media-core or the driver consuming "ir-led"):
> 
> 
> The general principle of moving the IR led away from being treated as a privacy LED is ok by me - I'll work on that.

Thanks.

Regards,

Hans


> 
>>
>> static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
>>     .n_lookups = 3,
>>     .lookup_table = {
>>         {
>>             .provider = "tps68470-iled_a::indicator",
>>             .dev_id = "i2c-INT347A:00",
>>             .con_id = "privacy-led",
>>         },
>>         {
>>             /* Use regular front-sensor privacy LED for ir-sensor too */
>>             .provider = "INT33BE_00::privacy_led",
>>             .dev_id = "i2c-INT347E:00",
>>             .con_id = "privacy-led",
>>         },
>>         {
>>             .provider = "tps68470-wled::indicator",
>>             .dev_id = "i2c-INT347E:00",
>>             .con_id = "ir-led",
>>         },
>>     }
>>
>> Regards,
>>
>> Hans
>>
>>
> 

