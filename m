Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A2B6A6D72
	for <lists+linux-leds@lfdr.de>; Wed,  1 Mar 2023 14:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjCANwp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Mar 2023 08:52:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjCANwP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Mar 2023 08:52:15 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA923E0B5;
        Wed,  1 Mar 2023 05:52:14 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id a4so10728611ljr.9;
        Wed, 01 Mar 2023 05:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbe5Xyw9hdycHKfoEbmsBbkpC2Q0lfetKqNaiXmbCuQ=;
        b=OjzAKDS2avw18lizzsgXCBV0hmF5lTeFKeY/nYTURzkQQR7lwlJA94CIbAsj5KCL1F
         2a8euI36E9mwYDkVictGsWAm38Jn57fy2qF1OpO79QfBDQFSG92Xm0ewyN0RZewJyCIN
         8nxQWDdiuOVGUB0QkwGC3DgIeDUXxIAcJmVwzqSYHqFh7Fis9LsU9FVM2r62ewCmU0cX
         9N9vaFzzyF1RFhRXPz7TGnGd7l7GM8qEplaIKfOaCT6qa3ca9PttIJlcE0Jq4uw+Z64t
         GRDIWhI56OjvKWRNkjFC3SmBDFt7CvocyyoJ/9XcQW9LRtmWul2DKTOKB7ylKEW2CToq
         Q/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jbe5Xyw9hdycHKfoEbmsBbkpC2Q0lfetKqNaiXmbCuQ=;
        b=hRWXY4FdCM9a8D8shixKz8yzU3XfLie0h1z3xAUXUcTYgzfyexWUaAMtWPXv8YZdNv
         pWM6WVAs/Eq3ZyZIkhuzxpXtV+N+Z/ZmuNeZF2q9zwcm5vj6jSaH+l4FYUaOIQBuh0Au
         3pJI7S2KGRsU3xryUua995bjCBuX4n/Vs7YnWHRwRBUSgc2DzSOxbbMTygQ6hPbVWM6v
         jYtaoPihE/IKntcFhf4pzNrSq4iMtVzRz8j2C5C2zV77D/1mksvDPP459Bm4evUiz1ms
         mBKLix7/Gn29Ozh1lR2jwZgb0R1VqrXMN7c0HdU1X6GaJ86A4wrkMMhGqeOEag40GXQH
         2OtQ==
X-Gm-Message-State: AO0yUKWrUgzqMXI2mbH6WPesv1a2gV1+prw+up1+emLIKz99398KlrYJ
        Kh6EurQe3/6iPeZL78IpqXc=
X-Google-Smtp-Source: AK7set9v0kvTf1iw4VEAIUGmm7hrhgSxL38IqbkVpzRBy1lezUFYvjbinQeCZtfQggiw5Ct94SzLkA==
X-Received: by 2002:a2e:86d7:0:b0:295:8f5c:3de9 with SMTP id n23-20020a2e86d7000000b002958f5c3de9mr1800126ljj.40.1677678732680;
        Wed, 01 Mar 2023 05:52:12 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id bg40-20020a05651c0ba800b002946f95b359sm1646134ljb.105.2023.03.01.05.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:52:11 -0800 (PST)
Message-ID: <6426345d-783e-007d-79db-2b376bcea12d@gmail.com>
Date:   Wed, 1 Mar 2023 14:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] dt-bindings: leds: add "usbport" trigger
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230228144933.22614-1-zajec5@gmail.com>
 <20230301000236.GA20893-robh@kernel.org>
 <e3b20703-f2d4-76b8-ccfb-11cf42d459fd@gmail.com>
 <CAL_JsqJzrgS1PH77RkAiqAs=QqXPGG04sCG3X_i-GKWSqPORSQ@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAL_JsqJzrgS1PH77RkAiqAs=QqXPGG04sCG3X_i-GKWSqPORSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 1.03.2023 14:43, Rob Herring wrote:
> On Wed, Mar 1, 2023 at 1:27 AM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>> On 1.03.2023 01:02, Rob Herring wrote:
>>> On Tue, Feb 28, 2023 at 03:49:33PM +0100, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> It's a trigger used on many home routers that have LEDs to indicate
>>>> specific USB port state.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>    Documentation/devicetree/bindings/leds/common.yaml | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
>>>> index 15e3f6645682..95b316ee3146 100644
>>>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>>>> @@ -99,6 +99,7 @@ properties:
>>>>              - pattern
>>>>              - usb-gadget
>>>>              - usb-host
>>>> +          - usbport
>>>
>>> Can we stop adding entries which are clearly likely to have multiple
>>> instances. We have a better binding to map the trigger source...
>>
>> I'm sorry, I really don't understand this.
>> I'm not sure what do you mean by multuple "usbport" instances.
>> Could you point me to that better place, please?
> 
> Suppose I have a device with 4 USB ports and 4 LEDs for each one. How
> would one define the connection of LEDs to USB ports? Extend this to
> usbport[0-9]? No.
> 
>> This is probably something obvious but I really can't figure it out
>> since yesterday.
> 
> "trigger-sources"

Ah, I suppose that "usbport" LED trigger in Linux can be confusing.

So: no matter how many USB ports you have, Linux *doesn't* create one
trigger per USB port. There is only one trigger. It's called exactly
"usbport".

Once you choose "usbport" trigger in Linux, you can choose which ports
should it "monitor". That can be done using procfs (ABI). The default
set of ports to monitor can be specified using "trigger-sources".

For decision details behind this see 0f247626cbbf ("usb: core: Introduce
a USB port LED trigger").

So Linux on home routers needs both:
1. linux,default-trigger (for selecting default trigger)
2. trigger-sources (for providing default set of ports to monitor)

Does it make more sense? Should I improve commit description and resend
it? Or should we still rework it somehow?
