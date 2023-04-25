Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8136EE33A
	for <lists+linux-leds@lfdr.de>; Tue, 25 Apr 2023 15:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbjDYNip (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Apr 2023 09:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbjDYNio (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Apr 2023 09:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E840013C19
        for <linux-leds@vger.kernel.org>; Tue, 25 Apr 2023 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682429874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F0NXFla26l08ayk1xwYTvvvgy9onxuW/1gwR6K6EQvo=;
        b=Ez37c7Zy4IZ4JzKOZTFmp18j3Q0pyb/JQmQ0HfIz2rAz5J33QipUJGKadJ10Dq/v9cUAN/
        JwqcyhImmtL4FXSELrA4DHhfMxVvWg3w1Y+Tw+kiruHfnN4+v71j2KaN9KX+d0a1BX20iy
        T3CyPIPt6zQuCzFQglB9XGGi92G5jGM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-cAogOHDnPYK_TQxwc_iANA-1; Tue, 25 Apr 2023 09:37:52 -0400
X-MC-Unique: cAogOHDnPYK_TQxwc_iANA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso660976266b.2
        for <linux-leds@vger.kernel.org>; Tue, 25 Apr 2023 06:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429872; x=1685021872;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0NXFla26l08ayk1xwYTvvvgy9onxuW/1gwR6K6EQvo=;
        b=CF1EMGS0hVCP4nA+7IkTEqK3as7ww30vYGF6lC5+LJ/G3dvUKEyvg7di+sXggDhs6c
         cT7acurK+JK+t03zrx7MoEmSUOvDqRalSFY9wHui/hPXYc6SDOGFmeycNwQTuyC5RFaZ
         KjY7onzzu4uyXWRnQFJ7K6bx/zMNSq9PipWgoG+f8KHm4GQqmofzEc6h+zfwKaKBgL6i
         1nB+qT/WgQbNYYqA1G8+y7w+uU/OJYM1JIH3VMhMedQOrsDvTXppnEkOmnA324+qrk0v
         ihtJRtmA3HnzVUbVxETTm2gMSn/6kN8+JYpfNW+/UTgA3pHXIyIjFJpKhvLJ6m7rPwRC
         1FGA==
X-Gm-Message-State: AAQBX9d4NY3HTfc37D7K0/vVIuZWz21siT8+y3+66kjMbUJBk2I4Thn1
        XfNM6/mTsQtDJjryLbZq9jfWllOV/DDfY8ir1AuDvvvQMNIpfzF5bWpo8m5LZDAHHjS41RWuJTw
        6TKH60tudy9Mtw0xnTJzvvA==
X-Received: by 2002:a17:906:1b08:b0:94f:9f76:c74d with SMTP id o8-20020a1709061b0800b0094f9f76c74dmr12565345ejg.23.1682429871880;
        Tue, 25 Apr 2023 06:37:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjjU8PcgzMNhNqGgJLm/6gp5IV+BXOiUT5LLhUzW07/d5ijGtUgJOG+NY2TJKSteQA/zKEew==
X-Received: by 2002:a17:906:1b08:b0:94f:9f76:c74d with SMTP id o8-20020a1709061b0800b0094f9f76c74dmr12565325ejg.23.1682429871498;
        Tue, 25 Apr 2023 06:37:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id tk5-20020a170907c28500b0095004c87676sm6672838ejc.199.2023.04.25.06.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 06:37:50 -0700 (PDT)
Message-ID: <ece24674-a42b-efb7-0337-b94b2628c56c@redhat.com>
Date:   Tue, 25 Apr 2023 15:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <ZDsJ6oH1/15gpAr0@jeknote.loshitsa1.net>
 <ab04d6ed-ee83-ea89-c668-f9958d9cc400@redhat.com>
In-Reply-To: <ab04d6ed-ee83-ea89-c668-f9958d9cc400@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Yauhen,

On 4/16/23 15:04, Hans de Goede wrote:
> Hi Yauhen,
> 
> On 4/15/23 22:32, Yauhen Kharuzhy wrote:
>> On Thu, Apr 13, 2023 at 05:18:03PM +0200, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Here is a patch series to add support for the LED controller on
>>> Intel Cherry Trail Whiskey Cove PMICs.
>>>
>>> This is based on the original patch for this from Yauhen Kharuzhy,
>>> with additional work on top by me.
>>>
>>> This addresses the review remarks on the v2 posting from Yauhen:
>>> - Since the PMIC is connected to the battery any changes we make to
>>>   the LED settings are permanent, even surviving reboot / poweroff.
>>>   Save LED1 register settings on probe() and if auto-/hw-control was
>>>   enabled on probe() restore the settings on remove() and shutdown().
>>> - Add support for the pattern trigger to select breathing mode
>>>
>>> This makes the charging LED on devices with these PMICs properly
>>> reflect the charging status (this relies on sw control on most
>>> devices) and this also allows control of the LED behind the pen
>>> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
>>> 1 models.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>> Hans de Goede (4):
>>>   leds: cht-wcove: Add suspend/resume handling
>>>   leds: cht-wcove: Add support for breathing mode use hw_pattern sysfs
>>>     API
>>>   leds: cht-wcove: Set default trigger for charging LED
>>>   leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
>>>
>>> Yauhen Kharuzhy (1):
>>>   leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
>>>
>>>  Documentation/leds/index.rst          |   1 +
>>>  Documentation/leds/leds-cht-wcove.rst |  29 ++
>>>  drivers/leds/Kconfig                  |  11 +
>>>  drivers/leds/Makefile                 |   1 +
>>>  drivers/leds/leds-cht-wcove.c         | 466 ++++++++++++++++++++++++++
>>>  5 files changed, 508 insertions(+)
>>>  create mode 100644 Documentation/leds/leds-cht-wcove.rst
>>>  create mode 100644 drivers/leds/leds-cht-wcove.c
>>
>> Hi Hans,
>>
>> Thanks for reviving this patch!
> 
> You're welcome.
> 
>> I haven't tested it on linux-next yet but on v6.2.11 (with few patches for
>> Yoabook) I catched following trace. I will investigate it later but maybe you
>> can take a look also?
> 
> Right, this is an unrelated pre-existing kernel bug when using
> led_trigger_blink().
> 
> I already hit that myself and I have a fix for it, see this series:
> https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@redhat.com/

Lee is asking for testers of this series, if you have time it would be
good if you can give this series a try in combination with this new
leds-cht-wcove driver.

Assuming the other series fixed the oops/backtrace for you can you
please reply with your Tested-by to that series:

https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@redhat.com/

(or even better give your Tested-by for both series)

Regards,

Hans

