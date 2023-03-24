Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CBF6C7F1A
	for <lists+linux-leds@lfdr.de>; Fri, 24 Mar 2023 14:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjCXNuk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Mar 2023 09:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjCXNuj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Mar 2023 09:50:39 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B23C196A7
        for <linux-leds@vger.kernel.org>; Fri, 24 Mar 2023 06:50:33 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id kc4so1839091plb.10
        for <linux-leds@vger.kernel.org>; Fri, 24 Mar 2023 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1679665833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6TXbrcgFASi0eagDLg5BODte0HiiblG64yHgWKrR0g=;
        b=d3ifWX00W+AV/5ho1Vz/g0q33OWCa3ACzBK2Rvdsex+EQll6WbEOqfWbpfDxavh4Z5
         G/Q7XthcHtrbumuMhwTMa06aolyh5OKbS+lRefBMfMb5WLGRCVdKXk2xziY/jvRSi7c+
         yUMucR2NL9Tc3eOprCefpsiGnootjL9EJVpHdRqu/Gz93tTFbMaJpjSgGAgmGK4oINEO
         +7NC2/cc5zNAX+L1ciYvj2nEm7xbEbEPSyTyMv6JXUCw4OI6sNXJHdUFMHFEoeIMjRWJ
         +6fithdDgrM86knKgsfZFlS/mEd5l8P2mnXuR+Dtbs6tnbIxX9WRc082j+DtcJ9CgkX0
         tIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679665833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6TXbrcgFASi0eagDLg5BODte0HiiblG64yHgWKrR0g=;
        b=g6BgnRVlWw48wWcgqPHAhElDhSo1YEDyjc94v7JTCHfQp1gInmf6B5rTJO1JSeGTzY
         z+BDSuaiAbxs3yOf3D9zc0hYFAeDHOG6zJZ2ivuhmpPlew42U5SDGNgCwB+M4O8VZLmU
         97y4gPFyaBG1rjExTNodsHSArXhP+GbCr6H6rHxlv9l/ogfm2nCFp/2y1/GzQwhgeyQ/
         5azdA5YmK8pkKyU+5ID+Zo8YGulCftogf7/sUFBWAcIwk+HseaviSAl7Wn7ft+x3oIBS
         OSTJ2bZzGkV7Vye7xXOYAuCpu4kIYBvV5ckN+lP/HiyGrSy6BXTmZFnHE8AS9BJ6X26u
         JPww==
X-Gm-Message-State: AAQBX9f6w4kxQxesuRn4FV42rERGxaebJHeYx1Xe+DfgiDqqn9S0nOuJ
        Vj36y1KyliZ/WB6NJ8InmrHKysMnVDzQU530QJACwQ==
X-Google-Smtp-Source: AKy350YuW8GuemG4g81Y6OHq+i0J/Z2VgK3KD+t5Guwl/NXy2YwH1tXP/uZwmMn0dSyKR94PaAb2LA==
X-Received: by 2002:a17:90b:4c4a:b0:23b:bf03:397e with SMTP id np10-20020a17090b4c4a00b0023bbf03397emr3301739pjb.24.1679665832975;
        Fri, 24 Mar 2023 06:50:32 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id d1-20020a656201000000b00512fbdd8c47sm4373240pgv.45.2023.03.24.06.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 06:50:32 -0700 (PDT)
Message-ID: <8b3cb61c-8824-e358-a039-012471d679f2@9elements.com>
Date:   Fri, 24 Mar 2023 19:20:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] leds: max597x: Add support for max597x
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lee Jones <lee@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20230323194550.1914725-1-Naresh.Solanki@9elements.com>
 <20230323194550.1914725-2-Naresh.Solanki@9elements.com>
 <d6463018-ebdf-30b2-ce0e-f2b5198847f1@wanadoo.fr>
 <688423c6-ba98-002c-efe5-7b0997d6af73@9elements.com>
 <ZB2gdvgFR4ZTIegA@duo.ucw.cz>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <ZB2gdvgFR4ZTIegA@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christophe, Pavel,

On 24-03-2023 06:37 pm, Pavel Machek wrote:
> Hi!
> 
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -590,6 +590,17 @@ config LEDS_ADP5520
>>>>          To compile this driver as a module, choose M here: the
>>>> module will
>>>>          be called leds-adp5520.
>>>> +config LEDS_MAX597X
>>>> +    tristate "LED Support for Maxim 597x"
>>>> +    depends on LEDS_CLASS
>>>> +    depends on MFD_MAX597X
>>>> +    help
>>>> +      This option enables support for the Maxim 597x smart switch
>>>> indication LEDs
>>>> +      via the I2C bus.
>>>> +
>>>> +      To compile this driver as a module, choose M here: the module will
>>>> +      be called max597x-led.
>>>
>>> leds-max597x?
>> As per struct max597x_led_driver, driver name is max597x-led
> 
> Please test the modular build and double check the module name.
Thank you for your suggestion, it turns out that you were right. The 
correct module name is leds-max597x(./drivers/leds/leds-max597x.ko).
Will update Kconfig message accordingly. Thanks!
> 
> BR,
> 									Pavel
> 
Regards,
Naresh
