Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58596C669D
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 12:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjCWLco (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 07:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjCWLco (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 07:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C242DE49
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679571111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pLohBA849dFvhhdQ/GuKzEUce93KB1x1ibShvJlj5v8=;
        b=dym2qv8UiiXMQeE35MmRMwKPEBGaepoNB/U1SMyuYohpz9jmm+ot/Vicx921Iyu24dBoq8
        69kN38OT8o8OVRa5hQkis8k5sXQKOkh1t6Sa123lPQkHNI4ScHvKnmIKX1/VgziIU2kX2n
        iKic56yBE42RACyd+cPUnj9NOKrlS0w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-6c1n9RvTOeWgYLZIJwH1KA-1; Thu, 23 Mar 2023 07:31:50 -0400
X-MC-Unique: 6c1n9RvTOeWgYLZIJwH1KA-1
Received: by mail-ed1-f71.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso31762707edb.4
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679571109;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLohBA849dFvhhdQ/GuKzEUce93KB1x1ibShvJlj5v8=;
        b=iYdeDAixgig7uTTSq9MOLOApPeVeQaN4M8KGmDMO/PNxYh7t3YL2w15v6WEXyNxg/p
         5OBmxVX2MJP/UWpEPM2/2iJEVimTJpZXyDrP711Zq4vz8hG9OVofE9Nu6oGxkgIDEb8y
         Us6S6lIx42dIrwHGDXKS7vUd3DwXCnR2tPBeTiaAfucCJKMEE9fhnLnM2Xu33q3oXtE1
         VllZiCOUC5NvSKFfpPYYwH5pA8iK0lLk7pifXGdfZjCRXSwLjGm/SLGv7ImwfvSgcMHo
         GiW23ER3vKUyPu+kDFWrQpqWQXOzrjRWjsb6P5kOcacaH+r+dj2P5OsmlrZHqAZbn2QZ
         xY5A==
X-Gm-Message-State: AO0yUKU7XGqZqyeYkJnvLdmJgGIIPFLIaF3IEQoP0KrfsR9E+8i5quUh
        aTJafVc8UqFxegNekitC4HrFwHlemLptdXmfzHlN0qPmE1ViYtvH3wIwYhSBd3fXTrn8HJwDN2Z
        Ex2Mg9aiaonUz4GR87ggiGw==
X-Received: by 2002:a05:6402:4d3:b0:501:ea9b:ef53 with SMTP id n19-20020a05640204d300b00501ea9bef53mr6597175edw.28.1679571109326;
        Thu, 23 Mar 2023 04:31:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set/GveUOUnw8PAQ+e8R32n3KZlg94uXaAah1/N6jq4VAKgvIze4SnV4UuxmoD8MqrwTBpVsYjQ==
X-Received: by 2002:a05:6402:4d3:b0:501:ea9b:ef53 with SMTP id n19-20020a05640204d300b00501ea9bef53mr6597163edw.28.1679571109040;
        Thu, 23 Mar 2023 04:31:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v15-20020a50c40f000000b004d8d2735251sm9136239edf.43.2023.03.23.04.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:31:48 -0700 (PDT)
Message-ID: <c9970c00-3a19-cacf-f292-8ca56860d8a1@redhat.com>
Date:   Thu, 23 Mar 2023 12:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-4-hpa@redhat.com> <ZBw0wiFztPs/LP6r@duo.ucw.cz>
 <c85b376a-e5ff-a2e1-1bea-a9d436b8f42b@redhat.com>
 <ZBw3boAn8j8W8cy7@duo.ucw.cz>
 <1a90d0b8-d82d-a31d-3977-43caed9c7a57@redhat.com>
In-Reply-To: <1a90d0b8-d82d-a31d-3977-43caed9c7a57@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/23/23 12:29, Hans de Goede wrote:
> Hi,
> 
> On 3/23/23 12:26, Pavel Machek wrote:
>> On Thu 2023-03-23 12:24:05, Hans de Goede wrote:
>>> Hi Pavel,
>>>
>>> On 3/23/23 12:15, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
>>>>> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
>>>>> tps68470 provides four levels of power status for LEDB. If the
>>>>> properties called "ti,ledb-current" can be found, the current will be
>>>>> set according to the property values. These two LEDs can be controlled
>>>>> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
>>>>
>>>> If the LED can have four different currents, should it have 4
>>>> brightness levels?
>>>
>>> No this was already discussed with an earlier version. This is in
>>> indicator LED output. The current setting is a one time boot configure
>>> thing after which the indicator LED is either on or off.
>>
>> Current levels are exponential in that driver. That will result in
>> rather nice four level. Surely LED does not care if you set it during
>> boot or later?
> 
> Well for one there is no guarantee the LED can continuously handle
> the maximum configurable LED current and as you rightly point out
> elsewhere in the thread we don't want to be blowing up hw.

Also this LED output as mentioned is especially intended for use
with on/off triggers and those don't use/set different brightness
levels. So it really is best to set the LED current once to
the current which we want when the LED is on to indicate whatever
it is intended to be indicating.

Regards,

Hans

