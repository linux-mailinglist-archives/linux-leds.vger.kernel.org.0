Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9128120353F
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 13:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgFVLBu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jun 2020 07:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgFVLBt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2020 07:01:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39447C061794
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2020 04:01:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id cy7so6767548edb.5
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2020 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9zhtqk3RO3KE3ZleqhvT4i3qTyW8i+RWKAVUGyu8QRg=;
        b=UgDA8Vkd4ayo7sHwBeU0RZUncFXKUgKoRHVBL83cK4p5GYJzbrHVef7tLTdmvYtx0J
         kbOZWQYm6ljBLfIyFbgCmF3E3FktVOhpni1nXuAmsBT7acClYR7Tj8Aqa/94Z7InbDMn
         i/01pflPJ6EatnQqIbA+epa5/rE8vKf4w+fMnK0oB20BbgiYR9rrb3y6XsQeVIHT/gBA
         Zvcz1ZN5v2T6vrFRkErlIB1ugypjx81ELiHZo682NOUDZa64i0w/USKhnKF57aJixnlW
         WzCXkp0Gw1AB6CzmqcTcfJkncrcrxFjajOTnmY40D5P8jfTH1C00+Drgh6W0VQKalYqJ
         1FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9zhtqk3RO3KE3ZleqhvT4i3qTyW8i+RWKAVUGyu8QRg=;
        b=n4v3WQthwJvutGcoyGj+nInhcDRmFm1F9u//yzHidmqrawAXOehu+9HTeQvHJex2T2
         3HDjAaN+3sGSeyhPr3nTwZpGjmr7MJ+Lum76OTCSj9s91APpBpAejUQBVfmRPdwbvErM
         AZn45y6rD1mGWS7T55SpTg88Rbe7LJDYzyiB4L0wYpV8/HSigWghomTyvahe5MoTWeZ4
         rtcvA85mUncFiTt/f2U7Z42iVSmfGzkMVF6oSM0c8OWHSYuwOC9UPwNADGnTYapkEKNG
         Zhv9M1+/TgL5p+dllWJwj4WmM2BZE0lI27Wbsge9OvDTfQixX8slXLkdd70EE8iYIHS9
         RCRQ==
X-Gm-Message-State: AOAM532zlDg/7OYcU9dpUTlqvvAGq/eH+qTO537DuAEDrAZL+J/MFtVX
        WaGxoi3woqmLsOWpMetXWPIvmszF
X-Google-Smtp-Source: ABdhPJwhL59C0YExGWyczR5X9Al8B7tEw+WS9fz4gir9M/iVnUdPQ+H0bLgfeYYgppj60hLeO0Kt5A==
X-Received: by 2002:aa7:c69a:: with SMTP id n26mr16146461edq.2.1592823706370;
        Mon, 22 Jun 2020 04:01:46 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a1e8:1586:8683:3d86? ([2a01:110f:b59:fd00:a1e8:1586:8683:3d86])
        by smtp.gmail.com with ESMTPSA id k23sm11460500ejo.120.2020.06.22.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 04:01:45 -0700 (PDT)
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
 <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
 <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
 <0391e655-d6ef-b459-0c8c-b65d232006c4@gmail.com>
Message-ID: <8b34f78e-937d-c693-5167-85070b587193@gmail.com>
Date:   Mon, 22 Jun 2020 13:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0391e655-d6ef-b459-0c8c-b65d232006c4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/22/20 12:54 PM, Jacek Anaszewski wrote:
> Hi Vishwanatha,
> 
> On 6/22/20 8:58 AM, Vishwanatha Subbanna wrote:
>> Thank you very much Jacek.
>>
>>> On 22-Jun-2020, at 3:12 AM, Jacek Anaszewski 
>>> <jacek.anaszewski@gmail.com> wrote:
>>>
>>> Hi Vishwanatha,
>>>
>>> On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
>>>> Hi Jacek,
>>>> Thank you very much for the quick response. Greatly appreciate that.
>>>
>>> You're welcome.
>>>
>>>>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski 
>>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>>
>>>>> Hi Vishwanatha,
>>>>>
>>>>> Please refer to 
>>>>> Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>>>>
>>>>> At first glance I don't get why you have gpio-leds node, which is for
>>>>> leds-gpio driver.
>>>> Not sure I understood it right.. But if you are asking me why I have 
>>>> "leds {"  and “gpio-leds” in there, then it is to get the entries in 
>>>> /sys/class/leds.
>>>> The GPIOs from PCA9552 are connected to LED. Also, that is how we 
>>>> have had in the past, and that worked.
>>>> Example: 
>>>> https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115 
>>>>
>>>
>>> Thanks. Yeah, that looks OK, I had to take closer look at the driver.
>>>
>>>> The problem I am running into is for : 
>>>> https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
>>>>
>>>>>
>>>>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>>>>> Hello,
>>>>>> I am Vishwanath, working with IBM and looking for your help on one 
>>>>>> of the issues that I am running into. Would really appreciate help 
>>>>>> on this. I run Linux 5.4.38
>>>>>> I have 2 number of PCA9552 chips, one on the Planar and other on 
>>>>>> the card that is optionally pluggable. The optional card must be 
>>>>>> plugged prior to booting and is not hot pluggable. In my 
>>>>>> experiment, I am running *without* the optional card plugged in.
>>>>>> In the device tree, I have a "leds {" section that looks like 
>>>>>> below for the PCA9552 that is on the planar and everything works 
>>>>>> fine and I can see /sys/class/leds/fan0
>>>>>>   leds {
>>>>>>          compatible = "gpio-leds”;
>>>>>>          fan0 {
>>>>>>              retain-state-shutdown;
>>>>>>              default-state = "keep";
>>>>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>>          };
>>>>>> };
>>>>>> &i2c7 {
>>>>>>      status = "okay”;
>>>>>>      pca0: pca9552@61 {
>>>>>>         compatible = "nxp,pca9552";
>>>>>>          reg = <0x61>;
>>>>>>          #address-cells = <1>;
>>>>>>          #size-cells = <0>;
>>>>>>          gpio-controller;
>>>>>>          #gpio-cells = <2>;
>>>>>>          gpio@0 {
>>>>>>              reg = <0>;
>>>>>>              type = <PCA955X_TYPE_GPIO>;
>>>>>>           };
>>>>>>      };
>>>>>> };
>>>>>> Similarly, if I update the device tree entry for PCA9552 for the 
>>>>>> card that is optionally pluggable, then I don’t see any leds 
>>>>>> entries in /sys/class/leds.
>>>>>
>>>>> Please share your DT node after the update.
>>>>>
>>>> Pasting the GPIO_0 entry only here for brevity.
>>>> leds {
>>>>          compatible = "gpio-leds”;
>>>>          fan0 {
>>>>              retain-state-shutdown;
>>>>              default-state = "keep";
>>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>          };
>>>>          nvmeslot0 {
>>>>              retain-state-shutdown;
>>>>              default-state = "keep";
>>>>              gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>>>>          };
>>>> };
>>>> &i2c7 {
>>>>      status = "okay”;
>>>>      pca0: pca9552@61 {
>>>>         compatible = "nxp,pca9552";
>>>>          reg = <0x61>;
>>>>          #address-cells = <1>;
>>>>          #size-cells = <0>;
>>>>          gpio-controller;
>>>>          #gpio-cells = <2>;
>>>>          gpio@0 {
>>>>              reg = <0>;
>>>>              type = <PCA955X_TYPE_GPIO>;
>>>>           };
>>>>      };
>>>> };
>>>> &i2c13
>>>> {
>>>>      pca1: pca9552@60 {
>>>>         compatible = "nxp,pca9552";
>>>>         reg = <0x60>;
>>>>         #address-cells = <1>;
>>>>         #size-cells = <0>;
>>>>         gpio-controller;
>>>>         #gpio-cells = <2>;
>>>>         gpio@0 {
>>>>             reg = <0>;
>>>>             type = <PCA955X_TYPE_GPIO>;
>>>>         };
>>>>      };
>>>> };
>>>> Thanks
>>>> !! Vishwa !!
>>>>>> I don’t even see “fan0” that is on the PCA9552 on planar also. I 
>>>>>> was expecting that I should see “/sys/class/leds/fan0”.
>>>>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>>>>> Data from the failure.
>>>>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 
>>>>>> 16-bit LED driver at slave address 0x61
>>>>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
>>>
>>> It is weird that you don't see "fan0" LED since this gpio seems to have
>>> been properly registered according to this log.
>>>
>>
>>
>> This is exactly what I don’t understand. I would expect “fan0” to 
>> appear in /sys/class/leds. Is there any reason why this might not be 
>> appearing ?..
> 
> OK, now the reason is clear to me. If leds-gpio driver fails to register
> any of the LEDs found in DT node it returns with an error from the
> probe(), which results in unregistering any of the LEDs registered in
> the previous iteration steps.
> 
> Look at the function gpio_leds_create() in
> drivers/leds/leds-gpio.c.
> 
> Probably it is devm_fwnode_get_gpiod_from_child() that fails
> while parsing nvmeslot0 node.

IOW you have to have two separate dts files for the arrangement
with the card and without it.

-- 
Best regards,
Jacek Anaszewski
