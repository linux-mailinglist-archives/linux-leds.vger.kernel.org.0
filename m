Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7769A6C6860
	for <lists+linux-leds@lfdr.de>; Thu, 23 Mar 2023 13:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjCWMc3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Mar 2023 08:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjCWMcY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Mar 2023 08:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DE010278
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679574695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B1JzqlzlczfbqCW+Xdhr3J5IAcKC6bLvtLMBxiLds70=;
        b=W+xQEf8WUn1k7xT2FcNUOTTaxH2Rm48G2Sp6xEcVX2tunK2JMSKwlnhk6Q7KZhNJrdCBPx
        BRxZ+F0E9k9H1sRBkZyj7bDtZ/7rU4crnYoG0oQeqcmtp2FLf0CmtPm0YHNCgI2hdZLhm0
        w2ULtFneF9vpBK7WEhhKecRRNlf1os0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-vCJjAvFDNf-LY6W0Q9zScQ-1; Thu, 23 Mar 2023 08:31:33 -0400
X-MC-Unique: vCJjAvFDNf-LY6W0Q9zScQ-1
Received: by mail-ed1-f71.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso25957201edb.19
        for <linux-leds@vger.kernel.org>; Thu, 23 Mar 2023 05:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1JzqlzlczfbqCW+Xdhr3J5IAcKC6bLvtLMBxiLds70=;
        b=LdurKK2QWBQbN1PZmg8kiZ+C7zMrxWW4oP+7uIKzDcvrI0ENYL1vPRkjeuoKP4TXxw
         XerbTHnvKZ62Dtis8qPS/ENINFaTcgILrP5xFoWJiJqG5WLgDha+MgJlPU49x1jKSDUv
         i+zVy7b7HcWMykhT0ll1E5heJISVABH5huXAhusAfBSUbdoSdhPIrTrFAd54NTMslij5
         Qj5VetcY2tcFVoqcOuyA5hRAnZm4MKG5IT9aUZ3OiMCq1KwhN8gCcRXy8x7rIu6j4Cas
         3920Xyt5XfCrAPrKTO7Bu0OBsOxh0/Y6gPkJ4xU7XHNcwLiXFVAxMh8qXWz/uchhMfiZ
         jgmA==
X-Gm-Message-State: AO0yUKWNUu7Hq6o0duN7SIdL2QDRraefLuwnNtEAxLmRzvTaL2DNREq4
        LwfDKfvwlzvEzQzKzn7SNgR2BSx7QPJSHV5NQcFEFTLAJkXnYbrd7Y5MdY1HdUL6o6ht+QPj/QB
        4kufSknFcsJ1dHD+AdlD4lQ==
X-Received: by 2002:a17:906:22d4:b0:931:a0cb:1ef1 with SMTP id q20-20020a17090622d400b00931a0cb1ef1mr10039079eja.7.1679574692686;
        Thu, 23 Mar 2023 05:31:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set9yplZ7DVvBWlIq3iD/jqdBa/6TZBZhT+ErPDuVTdCVtuA2C/ZsoPuK/nOdtoUT0sqi8964lw==
X-Received: by 2002:a17:906:22d4:b0:931:a0cb:1ef1 with SMTP id q20-20020a17090622d400b00931a0cb1ef1mr10039056eja.7.1679574692397;
        Thu, 23 Mar 2023 05:31:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z8-20020a17090655c800b00930569e6910sm8760904ejp.16.2023.03.23.05.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:31:31 -0700 (PDT)
Message-ID: <d2c6af4b-218c-96a7-a2d8-87f90e856c7c@redhat.com>
Date:   Thu, 23 Mar 2023 13:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/3] platform: x86: int3472: Add MFD cell for tps68470
 LED
Content-Language: en-US, nl
To:     Lee Jones <lee@kernel.org>, Kate Hsuan <hpa@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
References: <20230321153718.1355511-1-hpa@redhat.com>
 <20230321153718.1355511-2-hpa@redhat.com>
 <20230323122327.GJ2673958@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230323122327.GJ2673958@google.com>
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

On 3/23/23 13:23, Lee Jones wrote:
> On Tue, 21 Mar 2023, Kate Hsuan wrote:
> 
>> Add MFD cell for tps68470-led.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>>  drivers/platform/x86/intel/int3472/tps68470.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
>> index 5b8d1a9620a5..82ef022f8916 100644
>> --- a/drivers/platform/x86/intel/int3472/tps68470.c
>> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
>> @@ -17,7 +17,7 @@
>>  #define DESIGNED_FOR_CHROMEOS		1
>>  #define DESIGNED_FOR_WINDOWS		2
>>
>> -#define TPS68470_WIN_MFD_CELL_COUNT	3
>> +#define TPS68470_WIN_MFD_CELL_COUNT	4
>>
>>  static const struct mfd_cell tps68470_cros[] = {
>>  	{ .name = "tps68470-gpio" },
>> @@ -193,7 +193,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>>  		cells[1].name = "tps68470-regulator";
>>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>> -		cells[2].name = "tps68470-gpio";
>> +		cells[2].name = "tps68470-led";
>> +		cells[3].name = "tps68470-gpio";
> 
> The question is, why is the MFD API being used out side of drivers/mfd?

Because Intel made a big mess about how they describe camera sensors + the matching clks / regulators / GPIOs and the optional PMIC in ACPI.

The drivers/platform/x86/intel/int3472/ code untangles this mess and in some cases it instantiates MFD cells (with a whole bunch of derived platform_data per cell) for a TPS68470 PMIC.

And sometimes while binding to an INT3472 ACPI device-node it does not instantiate any MFD cells at all since the INT3472 ACPI device-node does not always describe such a PMIC.

Oh and also depending on of the ACPI tables are targetting ChromeOS or Windows a different set of MFD cells needs to be instantiated. On ChromeOS most of the PMIC poking is done through ACPI through a ChomeOS specific custom ACPI OpRegion, so there there are only cells for GPIO and a driver providing the OpRegion are created.

So lots of ugly x86 platform specific handling, ACPI parsing, etc. which is why this landed under drivers/platform/x86/ . IIRC you were even involved in the original merge since there once was a much simpler MFD driver under driver/mfd which only supported the ChromeOS setup.

(but my memory may be deceiving me here).

Regards,

Hans





> 
>>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
>> --
>> 2.39.2
>>
> 
> --
> Lee Jones [李琼斯]
> 

