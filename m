Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C268B64EF45
	for <lists+linux-leds@lfdr.de>; Fri, 16 Dec 2022 17:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbiLPQgn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Dec 2022 11:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbiLPQgm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Dec 2022 11:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9AF1FF9C
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 08:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671208555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YQPB7ApNf2Us0w5pUrbx7THbawUeM0KoKtar2TVXL7w=;
        b=HqTOfVhYcvXnGyLjOYqChuOXfghwqGAU2jkFOcm81T7J2zbJHhDkK8tdz62wWrWkG0DYkP
        4SlXBGRt+H2U4ceLF+0OT+K8HGGrtQULQWpJmHNlujeVNUDkgZkeSHstIww/VVZY9CyGZt
        7yhDMVAlKPImUX+PZPvQvjuWGqV5chU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-_vW2IxpRN0uqS2Nved_Dwg-1; Fri, 16 Dec 2022 11:35:54 -0500
X-MC-Unique: _vW2IxpRN0uqS2Nved_Dwg-1
Received: by mail-ej1-f70.google.com with SMTP id sa20-20020a1709076d1400b007bbe8699c2eso2164118ejc.6
        for <linux-leds@vger.kernel.org>; Fri, 16 Dec 2022 08:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQPB7ApNf2Us0w5pUrbx7THbawUeM0KoKtar2TVXL7w=;
        b=RHD+2UEo2QmVu+Cq4rAdTym0cGJohhrvS7PnHPQe+fgccbvlo2P9BczTD5zvSnS43+
         oBFVamdGU5Dt/l5xIYYEIt6gr5TEKYeGipOdi0G3bOFTNbWWWu87Gp0owWR7I9sNmD33
         HvT4J68dOi4HRSHwQQUhU5SWYUe+GG13zMs/cWyU6iiv9l9UOB1U+DGS6nySc0x+k/ou
         mHdIz9qgUjFVfc6p7b/vF6mEiZPCk+XW5/LZwn/OkDZ64lc+nkjUTDly44U9TSt1fjHA
         53P1UvdMGVmDik7ltxanfWvY8e4Ao2Hn+NZCgL0WiTmC9HFCj6uzWdeuqvhC+njAfsOH
         7+DQ==
X-Gm-Message-State: ANoB5pnX59SDR7sR/hNeASOPjwiBTEUs+pg8ekK4gaXjcvYbAt7gRV3o
        HOZ8ll/brVXAl7tXTJJQOxKfq3mwSZ8x1OtjJEpf3D77ug1+bIknSHjUcvnAomcJGO78M1DJ8yR
        ZdZkw+nKV2XjKQhndjd9wVA==
X-Received: by 2002:a17:906:bccf:b0:7c1:11fd:9b98 with SMTP id lw15-20020a170906bccf00b007c111fd9b98mr28528581ejb.27.1671208553067;
        Fri, 16 Dec 2022 08:35:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rxB5YdpCAaMSwz+AxL1cWV5RrUhOzzwLeyw7ME8K70ZX/kL8XFqe7tTEnbTPdRZ48PrVfxQ==
X-Received: by 2002:a17:906:bccf:b0:7c1:11fd:9b98 with SMTP id lw15-20020a170906bccf00b007c111fd9b98mr28528568ejb.27.1671208552939;
        Fri, 16 Dec 2022 08:35:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id f4-20020a17090631c400b007adf2e4c6f7sm1009313ejf.195.2022.12.16.08.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 08:35:52 -0800 (PST)
Message-ID: <e1dd47ef-51fd-b6b3-4649-4dc6781c5e35@redhat.com>
Date:   Fri, 16 Dec 2022 17:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 09/11] platform/x86: int3472/discrete: Move GPIO
 request to skl_int3472_register_clock()
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
 <20221216113013.126881-10-hdegoede@redhat.com>
 <Y5x+oFAFNz05Trxn@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x+oFAFNz05Trxn@smile.fi.intel.com>
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

On 12/16/22 15:20, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:11PM +0100, Hans de Goede wrote:
>> Move the requesting of the clk-enable GPIO to skl_int3472_register_clock()
>> (and move the gpiod_put to unregister).
>>
>> This mirrors the GPIO handling in skl_int3472_register_regulator() and
>> allows removing skl_int3472_map_gpio_to_clk() from discrete.c .
> 
> Extra space.

Fixed in my local tree.

> 
> ...
> 
>> +	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
>> +							     "int3472,clk-enable");
>> +	if (IS_ERR(int3472->clock.ena_gpio)) {
> 
> 	return dev_err_probe(...); ?

That would make the line longer then 100 chars.

Regards,

Hans


> 
>> +		ret = PTR_ERR(int3472->clock.ena_gpio);
>> +		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
>> +	}
> 

