Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B42D204146
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 22:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgFVUIu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jun 2020 16:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbgFVUIt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2020 16:08:49 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AE1C061573
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2020 13:08:49 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g1so14665692edv.6
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2020 13:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a2sApbATsaRMXihpj/XGsGSGmNZylnYheOXr6aBSEv0=;
        b=M02LDgC8Cz/RoWF5o0SHRNqba/qKxjFWCPGphFf64SsTqhq/o+p6nqpmyUOxUhqxeU
         VduMq52JNsigARlVafojku6qZFC1hvn5ijW8w3ygTKCkLKjWUeyWCEdZYm1ttxvb73A6
         Zm3S+8bzNUabdnFc6cGPpZWcV5rTx7vnFM9oc5jop8jJQfpNCMq0v85KScJDOaIgsZNr
         iD8WgHYSlFU9GmsZkHluDWH1migMWZFrj7PWK4hMGlyTxWLrUaxDNvt3FsKrMaPFMFFU
         VuDdzv8CFGNRpJwaT/K0a339c9+7NUSCeG1lJzcRaEdTUCaKNg6nqE/01CuVcwiP3cW7
         Fz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a2sApbATsaRMXihpj/XGsGSGmNZylnYheOXr6aBSEv0=;
        b=AsSLKjlADSzK3Vb07ZAgjjOK7xw7wQxPV9dtDHEwBBfMORzIXQrVFERohr+SIow5MY
         rBWrfKBuamoOk1zz/zCHeXqT2FOP9SQr5PbVTgy2atW+g05/jxSORK1lLkhUSlUCZVkD
         PVAB4D3nMe//PctdH5S41REvRmUvOqcLOa6mcIDwGWvasovXEH6uqi88Xrvf9nz4CGRN
         VfSLJ7OvLhxLdGnlHrPCdFSSl6jE0r+LR5R5mefwwnTWMKRyA9ItMkjwfnJma1kve5G8
         2jc6CSIginV2asgvGIQrS8yqA3JqiKb0jukvW6AMCDzqLLTRjupD6XLU0LGaAvOaJraJ
         QNRA==
X-Gm-Message-State: AOAM533+SZTDqABy78e3gwr5hkMzolEWqrbVfwX8MFk6pHjs3DymhuoP
        HECMjeOCUcI8D+EI+9ENSGEinGA8
X-Google-Smtp-Source: ABdhPJw7jDtR8Oq7rnUYYUauYDGzsD8le2MvKYsv7sy2mi35+1jpHIoQvTCb769ytlHsBxRopTfNzA==
X-Received: by 2002:aa7:c254:: with SMTP id y20mr18746878edo.363.1592856528067;
        Mon, 22 Jun 2020 13:08:48 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e0f4:2649:20af:8ec0? ([2a01:110f:b59:fd00:e0f4:2649:20af:8ec0])
        by smtp.gmail.com with ESMTPSA id s2sm13318717edu.39.2020.06.22.13.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 13:08:47 -0700 (PDT)
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>, pavel@ucw.cz
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
 <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
 <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
 <0391e655-d6ef-b459-0c8c-b65d232006c4@gmail.com>
 <C3359491-9196-466B-85FD-C85957F342DE@linux.vnet.ibm.com>
 <346b0a22-12ce-150c-a7a1-fb1d066a4c16@gmail.com>
 <F6E7B2CD-3871-4C41-A7F0-8A77E824D155@linux.vnet.ibm.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <b75787b3-87ae-3a75-14dd-628a10313150@gmail.com>
Date:   Mon, 22 Jun 2020 22:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <F6E7B2CD-3871-4C41-A7F0-8A77E824D155@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/22/20 3:12 PM, Vishwanatha Subbanna wrote:
> Hi Jacek,
> 
>> On 22-Jun-2020, at 5:06 PM, Jacek Anaszewski 
>> <jacek.anaszewski@gmail.com> wrote:
>>
>> On 6/22/20 1:07 PM, Vishwanatha Subbanna wrote:
>>> Hi Jacek,
>>>> On 22-Jun-2020, at 4:24 PM, Jacek Anaszewski 
>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>
>>>> Hi Vishwanatha,
>>>>
>>>> On 6/22/20 8:58 AM, Vishwanatha Subbanna wrote:
>>>>> Thank you very much Jacek.
>>>>>> On 22-Jun-2020, at 3:12 AM, Jacek Anaszewski 
>>>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>>>
>>>>>> Hi Vishwanatha,
>>>>>>
>>>>>> On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
>>>>>>> Hi Jacek,
>>>>>>> Thank you very much for the quick response. Greatly appreciate that.
>>>>>>
>>>>>> You're welcome.
>>>>>>
>>>>>>>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski 
>>>>>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>>>>>
>>>>>>>> Hi Vishwanatha,
>>>>>>>>
>>>>>>>> Please refer to 
>>>>>>>> Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>>>>>>>
>>>>>>>> At first glance I don't get why you have gpio-leds node, which 
>>>>>>>> is for
>>>>>>>> leds-gpio driver.
>>>>>>> Not sure I understood it right.. But if you are asking me why I 
>>>>>>> have "leds {"  and “gpio-leds” in there, then it is to get the 
>>>>>>> entries in /sys/class/leds.
>>>>>>> The GPIOs from PCA9552 are connected to LED. Also, that is how we 
>>>>>>> have had in the past, and that worked.
>>>>>>> Example: 
>>>>>>> https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115
>>>>>>
>>>>>> Thanks. Yeah, that looks OK, I had to take closer look at the driver.
>>>>>>
>>>>>>> The problem I am running into is for : 
>>>>>>> https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>>>>>>
>>>>>>>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>>>>>>>> Hello,
>>>>>>>>> I am Vishwanath, working with IBM and looking for your help on 
>>>>>>>>> one of the issues that I am running into. Would really 
>>>>>>>>> appreciate help on this. I run Linux 5.4.38
>>>>>>>>> I have 2 number of PCA9552 chips, one on the Planar and other 
>>>>>>>>> on the card that is optionally pluggable. The optional card 
>>>>>>>>> must be plugged prior to booting and is not hot pluggable. In 
>>>>>>>>> my experiment, I am running *without* the optional card plugged in.
>>>>>>>>> In the device tree, I have a "leds {" section that looks like 
>>>>>>>>> below for the PCA9552 that is on the planar and everything 
>>>>>>>>> works fine and I can see /sys/class/leds/fan0
>>>>>>>>> leds {
>>>>>>>>>        compatible = "gpio-leds”;
>>>>>>>>>        fan0 {
>>>>>>>>>            retain-state-shutdown;
>>>>>>>>>            default-state = "keep";
>>>>>>>>>            gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>>>>>        };
>>>>>>>>> };
>>>>>>>>> &i2c7 {
>>>>>>>>>    status = "okay”;
>>>>>>>>>    pca0: pca9552@61 {
>>>>>>>>>       compatible = "nxp,pca9552";
>>>>>>>>>        reg = <0x61>;
>>>>>>>>>        #address-cells = <1>;
>>>>>>>>>        #size-cells = <0>;
>>>>>>>>>        gpio-controller;
>>>>>>>>>        #gpio-cells = <2>;
>>>>>>>>>        gpio@0 {
>>>>>>>>>            reg = <0>;
>>>>>>>>>            type = <PCA955X_TYPE_GPIO>;
>>>>>>>>> };
>>>>>>>>>    };
>>>>>>>>> };
>>>>>>>>> Similarly, if I update the device tree entry for PCA9552 for 
>>>>>>>>> the card that is optionally pluggable, then I don’t see any 
>>>>>>>>> leds entries in /sys/class/leds.
>>>>>>>>
>>>>>>>> Please share your DT node after the update.
>>>>>>>>
>>>>>>> Pasting the GPIO_0 entry only here for brevity.
>>>>>>> leds {
>>>>>>>        compatible = "gpio-leds”;
>>>>>>>        fan0 {
>>>>>>>            retain-state-shutdown;
>>>>>>>            default-state = "keep";
>>>>>>>            gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>>>        };
>>>>>>>        nvmeslot0 {
>>>>>>>            retain-state-shutdown;
>>>>>>>            default-state = "keep";
>>>>>>>            gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>>>>>>>        };
>>>>>>> };
>>>>>>> &i2c7 {
>>>>>>>    status = "okay”;
>>>>>>>    pca0: pca9552@61 {
>>>>>>>       compatible = "nxp,pca9552";
>>>>>>>        reg = <0x61>;
>>>>>>>        #address-cells = <1>;
>>>>>>>        #size-cells = <0>;
>>>>>>>        gpio-controller;
>>>>>>>        #gpio-cells = <2>;
>>>>>>>        gpio@0 {
>>>>>>>            reg = <0>;
>>>>>>>            type = <PCA955X_TYPE_GPIO>;
>>>>>>> };
>>>>>>>    };
>>>>>>> };
>>>>>>> &i2c13
>>>>>>> {
>>>>>>>    pca1: pca9552@60 {
>>>>>>>       compatible = "nxp,pca9552";
>>>>>>>       reg = <0x60>;
>>>>>>>       #address-cells = <1>;
>>>>>>>       #size-cells = <0>;
>>>>>>>       gpio-controller;
>>>>>>>       #gpio-cells = <2>;
>>>>>>>       gpio@0 {
>>>>>>>           reg = <0>;
>>>>>>>           type = <PCA955X_TYPE_GPIO>;
>>>>>>>       };
>>>>>>>    };
>>>>>>> };
>>>>>>> Thanks
>>>>>>> !! Vishwa !!
>>>>>>>>> I don’t even see “fan0” that is on the PCA9552 on planar also. 
>>>>>>>>> I was expecting that I should see “/sys/class/leds/fan0”.
>>>>>>>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>>>>>>>> Data from the failure.
>>>>>>>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 
>>>>>>>>> 16-bit LED driver at slave address 0x61
>>>>>>>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
>>>>>>
>>>>>> It is weird that you don't see "fan0" LED since this gpio seems to 
>>>>>> have
>>>>>> been properly registered according to this log.
>>>>>>
>>>>> This is exactly what I don’t understand. I would expect “fan0” to 
>>>>> appear in /sys/class/leds. Is there any reason why this might not 
>>>>> be appearing ?..
>>>>
>>>> OK, now the reason is clear to me. If leds-gpio driver fails to register
>>>> any of the LEDs found in DT node it returns with an error from the
>>>> probe(), which results in unregistering any of the LEDs registered in
>>>> the previous iteration steps.
>>>>
>>>> Look at the function gpio_leds_create() in
>>>> drivers/leds/leds-gpio.c.
>>>>
>>>> Probably it is devm_fwnode_get_gpiod_from_child() that fails
>>>> while parsing nvmeslot0 node.
>>> Is this how it is designed or a bug ?.. From a system standpoint, not 
>>> having an optional card results in not seeing the ones that are 
>>> present on the system.
>>> Would you think it is worthwhile to modify to not chuck off what is 
>>> existing because something optional is not plugged in ?.. I believe 
>>> the I2C driver handles this scenario by putting an error message but 
>>> still consumes what is present.
>>
>> Well, this code is in mainline for some time and we cannot guarantee
>> the someone does not rely on this behavior.
>>
> 
> Should someone assume those behaviours ?.. Would it be okay to put an 
> email to the gpio-leds community ?. Just in my opinion, I see a lot of 
> value in modifying it. Also, is there an IRC where we can discuss this 
> than the email ?

Changing this behavior could break someone's userspace, which is one of
the most vital no-nos in kernel development. Also, there is no such
entity like gpio-leds community - these are two separate kernel
subsystems, but leds-gpio driver is under LED maintainer's jurisdiction.

I don't think we need IRC discussion yet. Let's wait for the other
LED maintainer's opinion. Pavel?

>> You mentioned, that your card is not hot-pluggable so it is even more
>> justified to treat the two hardware setups as demanding a separate DT.
>>
> 
> I mean, it is the same system that can either have a card on the slot or 
> don’t have it. So, it’s not really a different system needing different DT.
> Also, it has 3 slots and we can have multiple combinations :)
> 
>> Otherwise you could probably employ DT overlays mechanism.
>>
> 
> Hmm.. this looks interesting in a quick glance. However, I feel the 
> current leds-gpio driver needs to be updated to not discard the valid ones.
> Besides someone may be counting on the existing behaviour, is there any 
> reason why we want to maintain leds-gpio the way it is and not do what 
> I2C driver does for example.

This is perfectly sufficient reason to not accept such a modification.

-- 
Best regards,
Jacek Anaszewski
