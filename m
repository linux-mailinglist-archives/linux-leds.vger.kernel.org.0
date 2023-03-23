Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA536C6887
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 13:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjCWMhr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 08:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjCWMhj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 08:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A38F28E79
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679575006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FFVYlaHcWLIy/s0glFU53tgR8x8IjmiuR+bZfa8wUVQ=;
        b=A0K/PhIKf1SkSCDbLno6l9gUP0HLHcTfyIit8ykUXfYjW/uTYGqLTZaxphcQqCZkqR7T2v
        +4D495FxYURSOK0OeViyqtP0Q0WUdlpzCx6A0/sMIhthb4+y/T1FmNx8gxw+ibQz2b8ry9
        4E/xCxlgwBdbiPpuidV7N0PWl01j9B8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-GMfCwg39NzyznEt-kljXIA-1; Thu, 23 Mar 2023 08:36:45 -0400
X-MC-Unique: GMfCwg39NzyznEt-kljXIA-1
Received: by mail-ed1-f71.google.com with SMTP id k30-20020a50ce5e000000b00500544ebfb1so22448320edj.7
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 05:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFVYlaHcWLIy/s0glFU53tgR8x8IjmiuR+bZfa8wUVQ=;
        b=o9aFt6wZ20krZuz2ypQvXgpk6PQIo7OMO+fMKTZMERY1dfUZVSP+3OJ6KiBg/tGGZv
         2+KeIzXW6hPmHu4tOHIsCyCTfimgTAscJlcOTmiihDvJh74XyqWY4J7YPyelvegD3SqS
         5KH7f6lW/qHCwPJs6RIy1MNExVduzuOkt7k5gTm/f2oKi4YJdDz+U3u6WnAUsx7mHhi2
         coTfykpaIsd1Km+lKRruPPV1dLaG8Vr3m29XaL793EIDGFvu5RJq03gjBJ5jfkd0OYb7
         Mdl5FQJUoxmvCJ9L3qKvXVDXKAg0cGUlhMIIjA38oOPwG7q41yjGfAlSS8/jnbwHZjWT
         Aq5A==
X-Gm-Message-State: AO0yUKX4wJRBKrbZFHnQhzPd1QkWbiLDDtCE6ZI8kplcdx+CKH+6lxfp
        54aJLaej9nDIYblHMGTv4qOt2BkBnvtkm9BRQYWQ/1i2mK1jqBZrdiA8RZBV+/OYF+RIXpduslP
        bOqegVG+ZMsQsBdDrqgJVTA==
X-Received: by 2002:a17:907:b9da:b0:920:254c:1e2d with SMTP id xa26-20020a170907b9da00b00920254c1e2dmr9807306ejc.39.1679575004062;
        Thu, 23 Mar 2023 05:36:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set8n1FX8BhPQVTH9UTB1eNMkQ5h5Gi/TRNcq0LJyN6Q0bE9fA+WzMVXLC1i5Mi6BzN0jepQHPw==
X-Received: by 2002:a17:907:b9da:b0:920:254c:1e2d with SMTP id xa26-20020a170907b9da00b00920254c1e2dmr9807287ejc.39.1679575003766;
        Thu, 23 Mar 2023 05:36:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rk28-20020a170907215c00b00933b38505f9sm6037623ejb.152.2023.03.23.05.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:36:43 -0700 (PDT)
Message-ID: <40165fe1-9b84-f92b-98bb-5fa6906a5812@redhat.com>
Date:   Thu, 23 Mar 2023 13:36:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US, nl
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
 <ZBw5tSKcw5WELpJ+@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZBw5tSKcw5WELpJ+@duo.ucw.cz>
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

On 3/23/23 12:36, Pavel Machek wrote:
> On Thu 2023-03-23 12:29:29, Hans de Goede wrote:
>> Hi,
>>
>> On 3/23/23 12:26, Pavel Machek wrote:
>>> On Thu 2023-03-23 12:24:05, Hans de Goede wrote:
>>>> Hi Pavel,
>>>>
>>>> On 3/23/23 12:15, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
>>>>>> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
>>>>>> tps68470 provides four levels of power status for LEDB. If the
>>>>>> properties called "ti,ledb-current" can be found, the current will be
>>>>>> set according to the property values. These two LEDs can be controlled
>>>>>> through the LED class of sysfs (tps68470-leda and tps68470-ledb).
>>>>>
>>>>> If the LED can have four different currents, should it have 4
>>>>> brightness levels?
>>>>
>>>> No this was already discussed with an earlier version. This is in
>>>> indicator LED output. The current setting is a one time boot configure
>>>> thing after which the indicator LED is either on or off.
>>>
>>> Current levels are exponential in that driver. That will result in
>>> rather nice four level. Surely LED does not care if you set it during
>>> boot or later?
>>
>> Well for one there is no guarantee the LED can continuously handle
>> the maximum configurable LED current and as you rightly point out
>> elsewhere in the thread we don't want to be blowing up hw.
> 
> hw can support 16mA -> you expose 0, 2mA, 4mA, 8mA, 16mA levels.
> 
> hw can support 4mA -> you expose 0, 2mA, 4mA.

This is just not how this hw is intended to be used. If you look
at the registers there are on/off bits for LEDA and LEDB in a
single register and then there is a current-limit only for LEDB,
where as LEDA has a fixed current.

So clearly the intention here is on/off use with a fixed current
and dimming something like a privacy-LED on a laptop camera
makes no sense and will never be used since we disable userspace
access of the LED when it is used as a privacy-LED.

Regards,

Hans


