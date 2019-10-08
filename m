Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBC5CFF9D
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 19:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfJHRRh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 13:17:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34108 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfJHRRg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 13:17:36 -0400
Received: by mail-wr1-f65.google.com with SMTP id j11so14537135wrp.1;
        Tue, 08 Oct 2019 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZE8PGEIi76YGMsXY8il0PtLXvzSxK3hR1oe5Tgh3d28=;
        b=Cu35hN4/32NXTftmvQFvaafUTxd+iPBleiXiw2Ks90GzL30vMoWvDweANUS8D9JqlC
         mwMIbnX7h19b95PsHYAOQ2qP6wjwLRf5+ZQWojwf/07NznY4AF4Q9lpo1jCyMC0K6mmA
         A0tHJFLGCONzrPvtzsJu5lyImqH4odlEr5NoGNiVr/OcKrlIvV0gutSashqEfWpY4SBb
         eYE9/ODb5Rgsut9KNYw+7LXDWvwcunScgV5MW1P10IN1BJgAui4R8kAcQshqcuPnsD0Y
         hSdx794zEJs2pAIsQusO1VDxDz0PQQlPToOyGvQ60vCdyaiQ9bPQxm4DxlmFJ/F5VOvB
         endA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZE8PGEIi76YGMsXY8il0PtLXvzSxK3hR1oe5Tgh3d28=;
        b=H+2UdIyXRfvr8Hj9WRBn/K3z/0IGxpyRFBtyS0kljSVVteGtiEdfazL8Ocwv1V6o0G
         HV9wHw+u0x5TOYm0LghrNujN61QWezU9z4C6HEyMl/d+0isOpOcWnDdgTu3Iy491E5Us
         arG39/zRU9DQO2U3HdnE1hoSawJtHdSoMbQcFHOSzrC0GXCwIyyW7aILGz+H20CS6qW5
         yJdWNuRclvDsIw6qcJ//oGe7KmZ9J+d3JVEsn8jFzdWkja4LEqW4oxrn3x17N6bEhxfe
         YPYVAF11LY7zGhIuk6ixOZq17D1i5adcxxr8+n/znWMuFfTAtLEbjDGy8eyZtcMW91co
         FnWg==
X-Gm-Message-State: APjAAAVugW9mCBOlv+vT+dlsZkw8uxkk6t430BO4I9DiqEFmNGIxo6wm
        OAAFFIvinoNyadh7Ll8Rq84=
X-Google-Smtp-Source: APXvYqwdvHBwsG2mR58wj08mieKyPRIn3OlKuHJNjL0SDJXT3RQKCGDdtrc6V1G1wPnCYqtirzLW8Q==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr6371932wrw.294.1570555053468;
        Tue, 08 Oct 2019 10:17:33 -0700 (PDT)
Received: from [192.168.1.19] (bgs228.neoplus.adsl.tpnet.pl. [83.28.82.228])
        by smtp.gmail.com with ESMTPSA id t123sm4621928wma.40.2019.10.08.10.17.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 10:17:32 -0700 (PDT)
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To:     Rob Herring <robh+dt@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
 <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
 <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <80378f6c-24ed-ff6b-fef5-1865c3f84b60@gmail.com>
Date:   Tue, 8 Oct 2019 19:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/8/19 5:00 PM, Rob Herring wrote:
> On Tue, Oct 8, 2019 at 8:30 AM Jean-Jacques Hiblot <jjhiblot@ti.com> wrote:
>>
>> Rob,
>>
>> On 08/10/2019 14:51, Jean-Jacques Hiblot wrote:
>>> Hi Rob,
>>>
>>> On 07/10/2019 18:15, Rob Herring wrote:
>>>> Please send DT bindings to DT list or it's never in my queue. IOW,
>>>> send patches to the lists that get_maintainers.pl tells you to.
>>>>
>>>> On Mon, Oct 7, 2019 at 7:45 AM Jean-Jacques Hiblot <jjhiblot@ti.com>
>>>> wrote:
>>>>> Add DT binding for led-backlight.
>>>>>
>>>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>>>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>>>>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>>> ---
>>>>>   .../bindings/leds/backlight/led-backlight.txt | 28
>>>>> +++++++++++++++++++
>>>>>   1 file changed, 28 insertions(+)
>>>>>   create mode 100644
>>>>> Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>>> Please make this a DT schema.
>>>
>>> OK.
>>>
>>> BTW I used "make dt_binding_check" but had to fix a couple of YAMLs
>>> file to get it to work. Do you have a kernel tree with already all the
>>> YAML files in good shape ? Or do you want me to post the changes to
>>> devicetree@vger.kernel.org ?
>>>
>>>
>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>>>> b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>>>> new file mode 100644
>>>>> index 000000000000..4c7dfbe7f67a
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>>>>> @@ -0,0 +1,28 @@
>>>>> +led-backlight bindings
>>>>> +
>>>>> +This binding is used to describe a basic backlight device made of
>>>>> LEDs.
>>>>> +It can also be used to describe a backlight device controlled by
>>>>> the output of
>>>>> +a LED driver.
>>>>> +
>>>>> +Required properties:
>>>>> +  - compatible: "led-backlight"
>>>>> +  - leds: a list of LEDs
>>>> 'leds' is already used as a node name and mixing is not ideal.

for the record: child node names (if that was what you had on mind)
have singular form 'led'.

>>>> We already have 'flash-leds' in use and with the same definition, so
>>>> lets continue that and use 'backlight-leds'.
>>> OK
>>
>> I am taking that back. I have added of_get_led() and devm_of_get_led()
>> to the LED core to make it easier to get a LED from the DT. I modeled
>> the interface like it is done for PWM, PHYs or clocks. The property
>> containing list/array of phandle  is always named the same. To get one
>> particular PWM/PHY/clock, a identifier (name or integer) must be provided.
> 
> It can be done as we do support that with '-gpios', but yes, it is a
> bit more painful to deal with.
> 
>> So unless there is a strong incentive to do otherwise I's rather keep
>> this name here.
> 
> In that case, this needs to be documented as a common LED binding, not
> something hidden away in this binding.
> 
> Rob
> 

-- 
Best regards,
Jacek Anaszewski
