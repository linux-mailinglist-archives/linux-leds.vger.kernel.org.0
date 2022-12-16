Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B969F64EE51
	for <lists+linux-leds@lfdr.de>; Fri, 16 Dec 2022 16:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbiLPP5K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Dec 2022 10:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbiLPP4c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2022 10:56:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9E06F0D5
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 07:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671206104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l1QGKShqesb195W0tX6sBqmv6YRitL8LGR0dkY2RdTU=;
        b=BNCdrkydZpq7rM5jrXdMvR5AwvQ1b+fONGUgX1YjOqk04LvRQ9DnrXsT2OgbEBiMpm1CJp
        gJbNJtHMfj8WDgmzXbgyq8YFq+/Ov+kGhnz9AGyUqthoWejlVzpZx/XuODOL0AV7t2NUvW
        xi3C4VGleQ9T+1nWpEDg0Mz4MmZW8gQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-vBQBPx_YNUuAF5ArUksGSQ-1; Fri, 16 Dec 2022 10:55:03 -0500
X-MC-Unique: vBQBPx_YNUuAF5ArUksGSQ-1
Received: by mail-ej1-f71.google.com with SMTP id dn11-20020a17090794cb00b007c14ea70afcso2118868ejc.0
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 07:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1QGKShqesb195W0tX6sBqmv6YRitL8LGR0dkY2RdTU=;
        b=tP6cFsxWzuuzLwAb8gzm0OZJ1mfJqvD/wTwi6TXHEajySJaKIUsj6hUKTsWAw0orZA
         F9rK7g/lTZbT1e5vysZz/ihTPii0CQvP+UDZGnQMrETLZfNfgwjANke9IM8ZZ5H7lNAd
         1eLPOe6ewJCD0iOHSX7M3vfEV9J3zHSz+OHFVWwcddVvA+hgXM5qI6BeYQBCZQvXz9jX
         Et6ISl4iW3k2KwtcquhzZzYftalRSFbQN7gP6qetpoGnfu00GBeLfkEdJaqRo1Qoe0z3
         ohi+QQYrWzw6XCvipgZ9e03E9kW3P2LXkasYG8j1CzmTYLYHNdAHFBJlVc8scFPNqqCM
         6z8A==
X-Gm-Message-State: ANoB5pmBUSAbH6Wb+GTGOSA2FZye35x6BynXOcQTgginVxExbiFapIhw
        28BMe/uvupP1CwAp2FuvJEYbWQuYy4G8G02PTTDBzuvmx/5Sm38jB4+sQGVk2GwTG0VfMH4/01Y
        u8vpvWEaDHxqTZxM68DfurA==
X-Received: by 2002:a05:6402:5289:b0:461:d042:80db with SMTP id en9-20020a056402528900b00461d04280dbmr27070812edb.0.1671206101545;
        Fri, 16 Dec 2022 07:55:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7QbDhbO4XcaW+bgU1aN5jMBlXLtn9msxNPRATAilH/NuUh97gK5a1eQUyRItPBH/8WHTI47g==
X-Received: by 2002:a05:6402:5289:b0:461:d042:80db with SMTP id en9-20020a056402528900b00461d04280dbmr27070785edb.0.1671206101319;
        Fri, 16 Dec 2022 07:55:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id w6-20020a50fa86000000b004616b006871sm982387edr.82.2022.12.16.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:55:00 -0800 (PST)
Message-ID: <d329fa91-a913-a0ab-a7a9-50069c1c834c@redhat.com>
Date:   Fri, 16 Dec 2022 16:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 05/11] leds: led-class: Add generic [devm_]led_get()
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-6-hdegoede@redhat.com>
 <Y5x17PKiPnMLMfMg@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x17PKiPnMLMfMg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 12/16/22 14:43, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:07PM +0100, Hans de Goede wrote:
>> Add a generic [devm_]led_get() method which can be used on both devicetree
>> and non devicetree platforms to get a LED classdev associated with
>> a specific function on a specific device, e.g. the privacy LED associated
>> with a specific camera sensor.
>>
>> Note unlike of_led_get() this takes a string describing the function
>> rather then an index. This is done because e.g. camera sensors might
>> have a privacy LED, or a flash LED, or both and using an index
>> approach leaves it unclear what the function of index 0 is if there is
>> only 1 LED. The existing of support is extended to also support
>> getting a LED by function-name using the standard devicetree pattern
>> of adding a -names string array to map names to the indexes.
>>
>> For non devicetree platforms a lookup-table mechanism is added to
>> allow the platform code to map specific LED class_dev-s to specific
>> device,function combinations this way.
> 
> ...
> 
>> +	list_for_each_entry(lookup, &leds_lookup_list, list) {
>> +		if (!strcmp(lookup->consumer_dev_name, dev_name(dev)) &&
>> +		    !strcmp(lookup->consumer_function, function)) {
>> +			led_name = kstrdup(lookup->led_name, GFP_KERNEL);
> 
> kstrdup_const() ?

Ack.

> 
>> +			break;
>> +		}
>> +	}
> 
>> +	if (!led_name)
>> +		return ERR_PTR(-ENOENT);
>> +
>> +	led_dev = class_find_device_by_name(leds_class, led_name);
>> +	kfree(led_name);
> 
> kfree_const() ?

Ack, will change for v4.

> 
>> +	return __led_get(led_dev);
>> +}
> 
> ...
> 
>> +EXPORT_SYMBOL_GPL(led_add_lookup);
> 
>> +EXPORT_SYMBOL_GPL(led_remove_lookup);
> 
> Wondering why we can't make at least those two to be namespaced from day 1,

switching the LED subsystem code to use module namespaces is
a RFE which is independent of / orthogonal to this patchset.

Regards,

Hans

