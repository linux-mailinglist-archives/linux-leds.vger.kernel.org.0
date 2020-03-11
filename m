Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22D81824FD
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 23:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387537AbgCKWdi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 18:33:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42275 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387532AbgCKWdi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2020 18:33:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id v11so4840205wrm.9;
        Wed, 11 Mar 2020 15:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jw6UCiCydeO4KF/Q8KfSpqCFNzU1dmNNKP1SZvobL4U=;
        b=hnN7AJZPaFUb1Jy+JW/x5fMGN3m5G19Nsp8hYlFGz0eTWdNO5y0DeY+8YviMX2mt02
         uVv07LR6e/pnlF0l/M4nFD63AMfG5cLCTsEsnr/tPOzY4kZAErQbBFMnoxi9hWbfFETN
         VX5WDB4fNGQDojtYPVNw2CWpLZshjDcDdaeg7l8EuEfCYjMfTv11cIwRCFeugyVdENUS
         irhTOY06h96QAmiW2YayLiYnc55Io9Tp10WSapr3v1F1MEEctJKgohZeWE1eFFQUkWYM
         bWZ9O123xs6uSrIIvJkS534r0YnoevSqlVCnndIX/ZiTYGQIhYepN8NhDm6ZZ5a2+xqP
         FKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jw6UCiCydeO4KF/Q8KfSpqCFNzU1dmNNKP1SZvobL4U=;
        b=OHyBDEPQkhazJyxRm/Mk777LUtXHLtCIBWve7JwTbPtEuahfrZRXGnRlwBnf61UY45
         u8Wg57RsLOrlDQecvWgNbNfSfoI6U3Qe8D8JiMfPiXlaDYP+TdfK0Xy1fxagrKbYbJD0
         Gcy8UI5EACKqMYAE0DR7XlHEls9tkIiVI6aDGjlbzfC7o+XwtxoD7b2w2F7gymqdTYjY
         Q34MwaGLzAlAT40RytA/2PctsCnvOshZBqN0z6EvLHnIJesvi84MiawPvSKHS0u9hDgg
         WGirplUdxK8xUHfLHHdSYHvuuPox94WkMbRDowvpxSPoG8Vp+CBs2qUj71FZScbYwB5N
         SP0w==
X-Gm-Message-State: ANhLgQ0pyUIIu8wyhOHbDTaOvQ1A34kYaVFBiMfKqLRhet1O1ovNj2TS
        G1pJaCgagEJx1GV09BAmvwi4yGnp
X-Google-Smtp-Source: ADFU+vufIjAMfxMytOORgQy4PkfyyvhPWp/PzUbUNoAAaVBEdbOQl0/oU0PE+FfDcxgnOlZH4ooWZA==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr6427611wru.83.1583966015599;
        Wed, 11 Mar 2020 15:33:35 -0700 (PDT)
Received: from [192.168.1.23] (afcs84.neoplus.adsl.tpnet.pl. [95.49.70.84])
        by smtp.gmail.com with ESMTPSA id m25sm9410574wml.35.2020.03.11.15.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 15:33:34 -0700 (PDT)
Subject: Re: [PATCH v2] leds: pwm: add support for default-state device
 property
To:     Denis Osterland-Heim <denis.osterland@diehl.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200310123126.4709-1-Denis.Osterland@diehl.com>
 <4c16da22994de29c2fbb23c877d55685bcbf8993.camel@diehl.com>
 <ccb718b2-d0e5-20d8-f30a-95f8f31a10ef@gmail.com>
 <9e4bd43d14d00266bab4695dd37019bb1a103dd2.camel@diehl.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c8c23a9b-b468-b88b-17b2-4726de1f6ae3@gmail.com>
Date:   Wed, 11 Mar 2020 23:33:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9e4bd43d14d00266bab4695dd37019bb1a103dd2.camel@diehl.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Denis,

On 3/11/20 7:45 AM, Denis Osterland-Heim wrote:
> Hi Jacek,
> 
> Am Dienstag, den 10.03.2020, 22:15 +0100 schrieb Jacek Anaszewski:
>> Hi Denis,
>>
>> Thank you for the update. Please find my remarks below.
>>
>> On 3/10/20 4:19 PM, Denis Osterland-Heim wrote:
>>> Hi,
>>>
> ...
>>>> --- a/drivers/leds/leds-pwm.c
>>>> +++ b/drivers/leds/leds-pwm.c
>>>> @@ -75,7 +75,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>>>>  	led_data->active_low = led->active_low;
>>>>  	led_data->cdev.name = led->name;
>>>>  	led_data->cdev.default_trigger = led->default_trigger;
>>>> -	led_data->cdev.brightness = LED_OFF;
>>>> +	ret = led->default_state == LEDS_GPIO_DEFSTATE_ON;
>>
>> ret is for return value and it should not be used for anything
>> else just because it is at hand. Also LEDS_GPIO* definitions have
>> nothing to do with pwm leds. This is legacy because default-state
>> property was primarily specific to leds-gpio bindings and only
>> later was made common.
>>
>> Please introduce corresponding LEDS_PWM definitions, but in leds-pwm.c.
> will change
> 
>>
>>>> +	led_data->cdev.brightness = ret ? led->max_brightness : LED_OFF;
>>
>> Instead of above two changes I'd add below:
>>
>> if (led->default_state == LEDS_PWM_DEFSTATE_ON) {
>> 	led_data->cdev.brightness = led->max_brightness;
>> } else if (led->default_state == LEDS_PWM_DEFSTATE_KEEP)) {
>> 	// here put what you're adding below, but please use
>> 	// pwm_get_state() instead of accessing ops directly
>> }
>>
>> LED_OFF case is covered by kzalloc() in led_pwm_probe().
> Looks very elegant, I will apply this.
> pwm_get_state() is not sufficient here because it only returns the values from structure,
> which were not read read from registers at pwm_device_request().
> Something like pwm_get_state_uncached() would be required, which I have not found yet.
> 
> I looked at the atomic PWM API (5ec803edcb703fe379836f13560b79dfac79b01d),
> which claims to provide a smooth handover from bootloader to kernel.
> So it seems it would be better to fix the FIXME first, in a first patch.

I missed that it's been recently done. You've got to rebase onto Pavel's
for-next branch [0].

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/log/?h=for-next

-- 
Best regards,
Jacek Anaszewski
