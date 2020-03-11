Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1223C18165F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 11:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgCKK7N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 06:59:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36405 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgCKK7N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2020 06:59:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id g62so1587476wme.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2020 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kCS+1sLJfkNmtrDqbLKhqmBKwHpSmpxxIFeW4H0Igeg=;
        b=lEq8rjs2ecgf9BJlDNq+O4fwcEnDMUw3PLvlfcRCqaJtY0TZPcNsgPm0XRA91XY608
         S+TE1IjT+v9ysLmFZFnmEIAMHtIfH2pxviL0aObdU7/+lcbbPXs9C636Rf3OYNYq6iwI
         PdyPYCP2riCnGrzrWRan8mBENuk8AcG3B0mt9tvReamlX/E6/ELmZLevMFkBn8EAi6s8
         mD/MeH8ZSiBO0QciQwKuDdbrcOed9vCcHNAVy0X+RVLpwi8Dj4RYGR27kZDuk1JGXiFH
         Ckk5MSEhnLDxANP+4KRhBtNYL9L7TyGJFvZVM0q3cIzzXIMvsCurMeL0FXE0PzeZu9e4
         AJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kCS+1sLJfkNmtrDqbLKhqmBKwHpSmpxxIFeW4H0Igeg=;
        b=CNLXqjHAIW8p7+58FXZr9eWpa7xiXedyC5RvJX3rgDt3UJvuzrPzlOTTJhTIu/beyk
         YV+HeBtu7O/+JGuTSvvJcE+kE24xvtx3bl6m0fTSEyMza201Z8M1Cpbu7tghrzTo6oo5
         CLUl+YvADVKkxNEp4O8diL7kK1Q+X4mGfxPLbs/s1IL1E1d0dmfHlumAPANs4+LTLDuX
         7ULqHpdxaBh7dswDQakAjul1gHjtT8LczygowBF33BFvxCs8tkiwFdwttDA7jzWfBTJm
         /YPWyDLK766uHoc7reJyVAFkM7pZ+m+rPTKQSp9ZdvdfjsanPhtPRQpUlXzN1Pd++7Cz
         XOSw==
X-Gm-Message-State: ANhLgQ0bKz6Qu2+o63Of58DpyiAKAKBwnL9muyhED63jXCIaNQG8FezK
        OoclRPao3Cr4S9x0YA+czNM=
X-Google-Smtp-Source: ADFU+vtRV6ATZfacFL9YudX81MEvb5cD06FOM4hN+Pq7N0jfSur9NFLmVnkMsQ9+D3K7cOOpZJ9/Dw==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr3044719wmh.143.1583924349639;
        Wed, 11 Mar 2020 03:59:09 -0700 (PDT)
Received: from [192.168.1.23] (acga191.neoplus.adsl.tpnet.pl. [83.9.228.191])
        by smtp.gmail.com with ESMTPSA id s2sm7673263wmj.15.2020.03.11.03.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 03:59:09 -0700 (PDT)
Subject: Re: turris omnia leds again: question
To:     Marek Behun <kabel@blackhole.sk>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
References: <20200310183824.1e4ad91d@blackhole.sk>
 <8f481aa4-463c-30cc-df69-d1f630e848a2@gmail.com>
 <20200310232340.763cdaaa@blackhole.sk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <325ae880-2325-e002-77e9-d853b84c6393@gmail.com>
Date:   Wed, 11 Mar 2020 11:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310232340.763cdaaa@blackhole.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/10/20 11:23 PM, Marek Behun wrote:
> On Tue, 10 Mar 2020 22:48:09 +0100
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> Hi Marek,
>>
>> On 3/10/20 6:38 PM, Marek Behun wrote:
>>> Hi,
>>>
>>> I am going to try to send driver for Omnia LEDs again. The last time
>>> there was a problem: on 05/01/2019 Jacek wrote:
>>>   
>>>> I wonder if we're doing right merging this driver in this form.
>>>> We break the rule one-led-class-device-per-one-channel. We don't
>>>> have LED multi color support yet, so this should support RGB LEDs
>>>> in the old manner. Or switch to using LED multi color class.  
>>>   
>>>> Once we will have LED multi color class, we will be able to add the
>>>> support for it to the driver and make the driver configurable to be
>>>> able to expose old interface or the LED multi color one.  
>>>   
>>>> Moreover, the bindings should use led-sources property for grouping
>>>> three channels under single LED class device. This is certainly to be
>>>> fixed.  
>>>
>>> So I am going to try to modify the driver so that each channel creates
>>> one LED class device. Do I understand this correctly then, that this
>>> way when there are three channels (RGB) on one LED, all the 3 device
>>> tree nodes for should have the same reg property, but different
>>> led-sources property? Eg:
>>>
>>>   led@0,0 {
>>>     reg = <0>;
>>>     led-sources = <0>;
>>>     label = "omnia::heartbeat::red";
>>>   };
>>>
>>>   led@0,1 {
>>>     reg = <0>;
>>>     led-sources = <1>;
>>>     label = "omnia::heartbeat::green";
>>>   };
>>>
>>>   led@0,2 {
>>>     reg = <0>;
>>>     led-sources = <2>;
>>>     label = "omnia::heartbeat::blue";
>>>   };
>>>
>>> Or did I misinterpret the led-sources property?  
>>
>> This is what I proposed back then, strangely that message wasn't
>> archived by bots, or maybe it resides only in my outbox...
>>
>> --------------
>>
>> LED sub-node properties:
>>  - reg :                Must be from 0x0 to 0xb, since there are 12 RGB
>> LEDs on this
>>                         controller.
>>  - label :              (optional)
>>    see Documentation/devicetree/bindings/leds/common.txt
>>  - linux,default-trigger : (optional)
>>    see Documentation/devicetree/bindings/leds/common.txt
>>  - led-sources : Each child node should describe RGB LED it controls,
>>                  by listing corresponding iout identifiers:
>>         0 - RGB LED 0: red
>>         1 - RGB LED 0: green
>>         2 - RGB LED 0: blue
>>         3 - RGB LED 1: red
>>         4 - RGB LED 1: green
>>         5 - RGB LED 1: blue
>>         6 - RGB LED 2: red
>>         7 - RGB LED 2: green
>>         8 - RGB LED 2: blue
>>         9 - RGB LED 3: red
>>         10 - RGB LED 3: green
>>         11 - RGB LED 3: blue
>>     ... and list all the iouts, maybe other names will be more
>>             appropriate for this device, feel free to propose something
>>
>>
>>
>> Example:
>>
>>         led-controller@2b {
>>                 compatible = "cznic,turris-omnia-leds";
>>                 reg = <0x2b>;
>>                 #address-cells = <1>;
>>                 #size-cells = <0>;
>>
>>                 led@0 {
>>                         reg = <0x0>;
>>                         label = "userB";
>>                         linux,default-trigger = "heartbeat";
>>                         led-sources = <0 1 2>;
>>                 };
>>
>>                 led@1 {
>>                         reg = <0x1>;
>>                         label = "userA";
>>                         led-sources = <3 4 5>;
>>                 };
>>
>>                 led@2 {
>>                         reg = <0x2>;
>>                         label = "pci3";
>>                         led-sources = <6 7 8>;
>>                 };
>>
>>                 led@3 {
>>                         reg = <0x3>;
>>                         label = "pci2";
>>                         led-sources = <9 10 11>;
>>                 };
>>                 ...
>> --------------
>>
>>
>> Of course now label should be replaced with color and function
>> properties. I've just reviewed that patch set and realized that
>> we agreed upon setting max_brightness to 1 for all LEDs, right?
>>
> 
> No, there were subsequent patches which added support for
> max_brightness = 255.

Right.

> So the driver will register one LED class device per node, with color
> ID = WHITE. Once RGB LED class is merged, the driver can be remade, but
> the device tree won't need to be changed.

Device Tree will need to be changed to LED mc specific bindings,
which at current state introduces one more level or nesting
and LED_COLOR_ID_MULTI for the top level DT node.

And the driver will need to still support this approach as well
as the new LED mc class.

-- 
Best regards,
Jacek Anaszewski
