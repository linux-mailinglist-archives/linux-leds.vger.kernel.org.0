Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228AF64EEC6
	for <lists+linux-leds@lfdr.de>; Fri, 16 Dec 2022 17:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbiLPQQL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Dec 2022 11:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbiLPQQK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2022 11:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6C38FF1
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 08:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671207319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5V0gWTiQyHM7Bkjc6mb6/qdGnHbUKRPQL2E0IfTa8tU=;
        b=jRCe7N1DN9j2xyuEQncugXwg9IF0SZ6LUT0lud3LXEeZpppdsoI9492FGfXbRchyxZ7Vst
        FEnf+xSfUPkkTZ//RcrxU4DQpdC9qcDpfEugIVLf2hSUZTJmClo8M5ch1ZLhNUSSZwJ49N
        IBRwYdH6jmqehq7c1p8AJYtSBtV/TTU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-LUAHB9MmPL6pA-4_JeiK1A-1; Fri, 16 Dec 2022 11:15:17 -0500
X-MC-Unique: LUAHB9MmPL6pA-4_JeiK1A-1
Received: by mail-ed1-f72.google.com with SMTP id b18-20020a056402351200b004761159f677so1207607edd.6
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 08:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V0gWTiQyHM7Bkjc6mb6/qdGnHbUKRPQL2E0IfTa8tU=;
        b=Ab6IfGceqkU4lvjgLAO16qVu0O73xlg2JbtEHGwUzUYJgxDP1d1jbvT7/RKDARjag9
         +glXTAF5my5cWlxYzmbPsECrmdBsu6ynWHTUMYXSzxkAmwf1igtch96dydW2ooDjAsWN
         eDXCz1iOfnN/XZx0hjRCj81Qr38fI0CkqkbWkiLX3dqkKnGcPQHzbAaRULtTx4cJEdhI
         t35B5jOrdU/poTrG1MlI0gnvZk7upuK3pvvIEJcxrihlug4nbdzsrCONAX1ZmdpbcZ6d
         bfBBWxT6enjdbdq/FOINNMkAzc2pqxEaCh5zGpQ5PMF5nlQ74x0rlMAjVYQU136//taX
         ah+g==
X-Gm-Message-State: ANoB5pkBK7qTidDfkKOnAlDvIRzKHs6yHJRNC8hpKHllfIFbhNRh9tgB
        0PW2x2bAvjQelwLPOyVfWFleARLaFR7pLaScsZCUM+qLzWfOQBTZCqkEw/WGBMrUK9ykIbtIucl
        vTT622ds19mgyikdw8nsbBQ==
X-Received: by 2002:a17:906:57c6:b0:7c1:7226:c936 with SMTP id u6-20020a17090657c600b007c17226c936mr16584428ejr.64.1671207316583;
        Fri, 16 Dec 2022 08:15:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43QQciG3j7+a7kDftvMmjITlOaHkoDe7H9MPuKyYsxjIIjCTSbfwSvJKdA6PtrKPcQpkkZoA==
X-Received: by 2002:a17:906:57c6:b0:7c1:7226:c936 with SMTP id u6-20020a17090657c600b007c17226c936mr16584410ejr.64.1671207316430;
        Fri, 16 Dec 2022 08:15:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id fr33-20020a170906892100b007c09da0d773sm1002074ejc.100.2022.12.16.08.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:15:15 -0800 (PST)
Message-ID: <233166c0-eb2d-8b41-68f3-d9613218fc16@redhat.com>
Date:   Fri, 16 Dec 2022 17:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 07/11] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
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
 <20221216113013.126881-8-hdegoede@redhat.com>
 <Y5x5XmIa9nsi8raY@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x5XmIa9nsi8raY@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 12/16/22 14:57, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:09PM +0100, Hans de Goede wrote:
>> Add a helper function to map the type returned by the _DSM
>> method to a function name + the default polarity for that function.
>>
>> And fold the INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN
>> cases into a single generic case.
>>
>> This is a preparation patch for further GPIO mapping changes.
> 
> ...
> 
>> +static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> 
> I find a bit strange not making this a function that returns func:
> 
> static const char *int3472_get_func_and_polarity(u8 type, u32 *polarity)

Why make it return func and not polarity ?

Since there are 2 values to return it makes sense to be
consistent and return both by reference.

Also this sort of comments really get into the territory
of bikeshedding which is not helpful IMHO.

Regards,

Hans




> 
>> +{
>> +	switch (type) {
>> +	case INT3472_GPIO_TYPE_RESET:
>> +		*func = "reset";
>> +		*polarity = GPIO_ACTIVE_LOW;
> 
> 		return "reset";
> 
> etc.
> 
>> +		break;
>> +	case INT3472_GPIO_TYPE_POWERDOWN:
>> +		*func = "powerdown";
>> +		*polarity = GPIO_ACTIVE_LOW;
>> +		break;
>> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
>> +		*func = "clk-enable";
>> +		*polarity = GPIO_ACTIVE_HIGH;
>> +		break;
>> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
>> +		*func = "privacy-led";
>> +		*polarity = GPIO_ACTIVE_HIGH;
>> +		break;
>> +	case INT3472_GPIO_TYPE_POWER_ENABLE:
>> +		*func = "power-enable";
>> +		*polarity = GPIO_ACTIVE_HIGH;
>> +		break;
>> +	default:
>> +		*func = "unknown";
>> +		*polarity = GPIO_ACTIVE_HIGH;
>> +		break;
>> +	}
>> +}
> 

