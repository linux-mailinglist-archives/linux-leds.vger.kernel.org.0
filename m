Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0E46A6C78
	for <lists+linux-leds@lfdr.de>; Wed,  1 Mar 2023 13:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjCAMiU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Mar 2023 07:38:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjCAMiI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Mar 2023 07:38:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6253BD98
        for <linux-leds@vger.kernel.org>; Wed,  1 Mar 2023 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677674244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zu69AFFuQ5K2KVM9kBkkehEUctqjBFrvorj6/IdoeRs=;
        b=clvs2YBxz2TmoHNrjzGaR1WiZLXXI9JRDb69WoSggum4qjVXO3HkZ+ppelwy1L4JyP3Y/v
        OgTZf8b96vSH1awYkf/+R04eQ94mxO+sHSZ9vj1wNl7wNXgZCARcDXjAdGQvxMtTTu2OfQ
        VyL7fiDKa/chHQQv0Yk7uuHaWBWXcsY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-M2bsvlIaOYKpYdrGvPAjZQ-1; Wed, 01 Mar 2023 07:37:22 -0500
X-MC-Unique: M2bsvlIaOYKpYdrGvPAjZQ-1
Received: by mail-ed1-f69.google.com with SMTP id fj7-20020a0564022b8700b004bbcdf3751bso3423680edb.1
        for <linux-leds@vger.kernel.org>; Wed, 01 Mar 2023 04:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zu69AFFuQ5K2KVM9kBkkehEUctqjBFrvorj6/IdoeRs=;
        b=FD3jMS5qLhURk/B30keKDOpaiUKuRHFXJenzuc5Qf3yAqj7XQZE3UYSz56pqUthO9K
         nig6EWIzFl8tFuOy8+/4EKW8Z0hAa4S+/yBU3UQpKzmId1n6xtAbe+nhxj4pv/DAodFS
         73DDbiWUQTzxjp0rFJmb2LQQ8mzNhnc+OT0LU+n5ravpsM7xcoPIa57GIs6LFGrRXGUj
         6SGivkfxurt7AC7ehy402JEkyo6EHB/BP3kXS9soqowuawYqw/ZNufBCeP8zEjUgnGrJ
         b+I/G9reanp425qdDcZHv/EBmqbUeFvD17yRabt0Phn1KZSRJypO8hU41SvQznqHwcHq
         QOzQ==
X-Gm-Message-State: AO0yUKW+K7pVLibc0oaJyhMSfnOevwZr/zrOtFlWOsQuzNf9YDFmFS7a
        MA8adUFt1JAQd3j9opgjqh5rsNVUiSC0ojwAeV3Piy9F2TLvLxvjZr++MP6iFzWJQWypD+Mkz0b
        gg14BnOv6Y6Wmrv6ZllDu4Q==
X-Received: by 2002:a17:906:4547:b0:888:a72f:1599 with SMTP id s7-20020a170906454700b00888a72f1599mr6232458ejq.11.1677674241827;
        Wed, 01 Mar 2023 04:37:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+1EPt4YnYGmelPqO7salOn2smZGgzHmvQxj9J0DBkN+FIoLXAlDRAKFBZQ/sivU7JhZHDFzw==
X-Received: by 2002:a17:906:4547:b0:888:a72f:1599 with SMTP id s7-20020a170906454700b00888a72f1599mr6232431ejq.11.1677674241520;
        Wed, 01 Mar 2023 04:37:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906358b00b008baeb5c9bdbsm5862683ejb.141.2023.03.01.04.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 04:37:20 -0800 (PST)
Message-ID: <b2781b9e-208f-07be-e618-d1c6f6f9abec@redhat.com>
Date:   Wed, 1 Mar 2023 13:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-4-hpa@redhat.com>
 <2a0f7d36-ef0c-1c29-5f01-6115275e78dd@redhat.com>
 <91a754b4-6bfb-e0a4-7cd1-0a58b3df0ce3@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <91a754b4-6bfb-e0a4-7cd1-0a58b3df0ce3@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 2/24/23 16:14, Dan Scally wrote:
> On 22/02/2023 16:53, Hans de Goede wrote:

<snip>

>>> +
>>> +static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
>>> +{
>>> +    struct tps68470_led_data *data = container_of(led_cdev,
>>> +                              struct tps68470_led_data,
>>> +                              ledb_cdev);
>>
>> This container_of only works for led_b not for led_a.
>>
>>> +
>>> +    if (!strncmp(led_cdev->name, "tps68470-ileda", 14))
>>> +        return data->brightness_a;
>>> +    else if (!strncmp(led_cdev->name, "tps68470-iledb", 14))
>>> +        return data->brightness_b;
>>> +
>>> +    return -EINVAL;
>>> +}
>>
>> Instead of this strcmp magic, please just use 2 separate
>> brightness_get functions (thus also solving the container_of
>> problem above). And please also do the same for brightness_set.
> 
> I don't mind the single function so much but I don't particularly like the strcmp. I'm actually working on this at the moment too trying (but so far mostly failing) to get the WLED that drives the Surface Go's IR LED working properly (I can drive it...for a maximum of 13 seconds); I had modeled the problem as an array of structs for the LEDs and reference them with IDs:
> 
> #define lcdev_to_led(lcdev) \
>     container_of(lcdev, struct tps68470_led, lcdev);
> 
> #define led_to_tps68470(led, index) \
>     container_of(led, struct tps68470_device, leds[index])
> 
> enum tps68470_led_ids {
>     TPS68470_ILED_A,
>     TPS68470_ILED_B,
>     TPS68470_WLED,
>     TPS68470_NUM_LEDS
> };
> 
> static const char *tps68470_led_names[] = {
>     [TPS68470_ILED_A] = "tps68470-iled_a",
>     [TPS68470_ILED_B] = "tps68470-iled_b",
>     [TPS68470_WLED] = "tps68470-wled",
> };
> 
> struct tps68470_led {
>     unsigned int led_id;
>     struct led_classdev lcdev;
> };
> 
> struct tps68470_device {
>     struct device *dev;
>     struct regmap *regmap;
>     struct tps68470_led leds[TPS68470_NUM_LEDS];
> };
> 
> int tps68470_led_brightness_set(...)
> {
>     struct tps68470_led *led = lcdev_to_led(lcdev);
>     struct tps68470_device *tps68470 = led_to_tps68470(led, led->index);

I assume led->index should be led->led_id here ?

> 
>     switch (led->led_id) {
>     case TPS68470_ILED_A:
>         return regmap_update_bits(...);
>     case TPS68470_ILED_B:
>         ...
> 
>     }

But since the indices into the register are not simple a function of
led->led_id, you still need this switch-case here and then a separate
implementation for each LED.

At which point IMHO just having a single set / get function per LED
is much simpler then adding the complications with the struct wrapping
struct led_class_dev to add an index to it.

Anyways there is an easy solution here: Kate you get to choose between
1 set + get function per LED or Dan's solution, but please drop
the strcmp() calls since neither Dan nor I like those.

<snip>

> Regardless of how it ends up being done; I think you need the LED_FUNCTION_INDICATOR part in lcdev->name to match the "devicename:color:function" that the LED subsystem seems to want.

Agreed, Kate please switch to this, e.g.:

tps68470_led->leda_cdev.name = "tps68470::" LED_FUNCTION_INDICATOR;

LED names should always be in the format of "devicename:color:function"
I missed you were not using that before. And since we don't know the
color we just leave it empty (this is allowed).

Note LED_FUNCTION_INDICATOR is defined in include/dt-bindings/leds/common.h .

Regards,

Hans




