Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892D7203525
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 12:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgFVKyw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jun 2020 06:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbgFVKyv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2020 06:54:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21919C061794
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2020 03:54:51 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k8so13267495edq.4
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2020 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wsqlP7sr6OupJvUseyQe84blP+K5g6RaNLD6GuExq2A=;
        b=cS20mHeH7kjjo4kbsZ+XvL+0zvg7VLx9kk60nemfiMy1Z/H+c3lHwRrBQABPQghNiV
         pYF3glIUyMD/doB/ELaxVPpRZphj3wCNbbmQVQ+i9yZK9n4xTuaOfBLdvMGZxQOZOswF
         vyMConapkutIu84RZeifxDSikRRHV9hSYAYI0uezvAAguY3lPXqEGz+WLwSDKf/h0zzQ
         BGids5DRhow87jNzvaPcCg4JrheutTa3mvaI6ANTWxtZsgDPdVwIr9yN8Sxm3SVnd7WZ
         fL8rYPuIPk237w1vioumBfaivNeOnWbhBiV8ewBMAoXm9iUF+elOkoiEOLFv7RKMPZZ0
         0pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wsqlP7sr6OupJvUseyQe84blP+K5g6RaNLD6GuExq2A=;
        b=YY/UJZYmOniTItEnLI8vgS0Fx63eUstE/oGgtb/xL2/RHPn7wFqwN+jU1utBqMFBUb
         FYud/xVeW1PEHnRAcsmlgzFe1k7F+KKZz8SuwVB8QMuO0z5JfF29YzXwxwM74SOgtEZ6
         zGXNQDJ23Astsa8mdOnJdUl6Ht7iF5GWQNADkvMXBc7K+EybDgyNvQJx6WB2wGvTTUvm
         r4Y7eZZnogMtfW60tZr0cB65I908M5MCsMA0sbiCbuKksN03n1hk35LiR3hLnlVjxz+m
         UkldmyadQIjhjpsn94cY6btbOGyo+DxL423YtdgFtLf5MVp5Y/Ctwgbsp9YIXfAj9+Am
         ebEQ==
X-Gm-Message-State: AOAM530o4p+/nxqptJ3gHSVHSE6lGcG8tRIBJNpW1umPTjlaSyB1yJWa
        L8mBCEJV68YsxSSxWw1j5CRarmWX
X-Google-Smtp-Source: ABdhPJwqsIsAqCXS6v84NpKxMZHTDbkV2vHhMCHXsyiwnZhMzXWTjGOoSOvsMWpS9ZuLLKnwDr4HVg==
X-Received: by 2002:aa7:c358:: with SMTP id j24mr1371289edr.59.1592823289598;
        Mon, 22 Jun 2020 03:54:49 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a1e8:1586:8683:3d86? ([2a01:110f:b59:fd00:a1e8:1586:8683:3d86])
        by smtp.gmail.com with ESMTPSA id dm1sm12154684ejc.99.2020.06.22.03.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 03:54:49 -0700 (PDT)
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
 <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
 <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0391e655-d6ef-b459-0c8c-b65d232006c4@gmail.com>
Date:   Mon, 22 Jun 2020 12:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1084104E-3840-4BCE-A58F-8447DFC214FD@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Vishwanatha,

On 6/22/20 8:58 AM, Vishwanatha Subbanna wrote:
> Thank you very much Jacek.
> 
>> On 22-Jun-2020, at 3:12 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>
>> Hi Vishwanatha,
>>
>> On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
>>> Hi Jacek,
>>> Thank you very much for the quick response. Greatly appreciate that.
>>
>> You're welcome.
>>
>>>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>>
>>>> Hi Vishwanatha,
>>>>
>>>> Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>>>
>>>> At first glance I don't get why you have gpio-leds node, which is for
>>>> leds-gpio driver.
>>> Not sure I understood it right.. But if you are asking me why I have "leds {"  and “gpio-leds” in there, then it is to get the entries in /sys/class/leds.
>>> The GPIOs from PCA9552 are connected to LED. Also, that is how we have had in the past, and that worked.
>>> Example: https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115
>>
>> Thanks. Yeah, that looks OK, I had to take closer look at the driver.
>>
>>> The problem I am running into is for : https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>>
>>>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>>>> Hello,
>>>>> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
>>>>> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
>>>>> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
>>>>>   leds {
>>>>>          compatible = "gpio-leds”;
>>>>>          fan0 {
>>>>>              retain-state-shutdown;
>>>>>              default-state = "keep";
>>>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>>>          };
>>>>> };
>>>>> &i2c7 {
>>>>>      status = "okay”;
>>>>>      pca0: pca9552@61 {
>>>>>         compatible = "nxp,pca9552";
>>>>>          reg = <0x61>;
>>>>>          #address-cells = <1>;
>>>>>          #size-cells = <0>;
>>>>>          gpio-controller;
>>>>>          #gpio-cells = <2>;
>>>>>          gpio@0 {
>>>>>              reg = <0>;
>>>>>              type = <PCA955X_TYPE_GPIO>;
>>>>>       	};
>>>>>      };
>>>>> };
>>>>> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.
>>>>
>>>> Please share your DT node after the update.
>>>>
>>> Pasting the GPIO_0 entry only here for brevity.
>>> leds {
>>>          compatible = "gpio-leds”;
>>>          fan0 {
>>>              retain-state-shutdown;
>>>              default-state = "keep";
>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>>>          };
>>>          nvmeslot0 {
>>>              retain-state-shutdown;
>>>              default-state = "keep";
>>>              gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>>>          };
>>> };
>>> &i2c7 {
>>>      status = "okay”;
>>>      pca0: pca9552@61 {
>>>         compatible = "nxp,pca9552";
>>>          reg = <0x61>;
>>>          #address-cells = <1>;
>>>          #size-cells = <0>;
>>>          gpio-controller;
>>>          #gpio-cells = <2>;
>>>          gpio@0 {
>>>              reg = <0>;
>>>              type = <PCA955X_TYPE_GPIO>;
>>>       	};
>>>      };
>>> };
>>> &i2c13
>>> {
>>>      pca1: pca9552@60 {
>>>         compatible = "nxp,pca9552";
>>>         reg = <0x60>;
>>>         #address-cells = <1>;
>>>         #size-cells = <0>;
>>>         gpio-controller;
>>>         #gpio-cells = <2>;
>>>         gpio@0 {
>>>             reg = <0>;
>>>             type = <PCA955X_TYPE_GPIO>;
>>>         };
>>>      };
>>> };
>>> Thanks
>>> !! Vishwa !!
>>>>> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
>>>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>>>> Data from the failure.
>>>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
>>>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183
>>
>> It is weird that you don't see "fan0" LED since this gpio seems to have
>> been properly registered according to this log.
>>
> 
> 
> This is exactly what I don’t understand. I would expect “fan0” to appear in /sys/class/leds. Is there any reason why this might not be appearing ?..

OK, now the reason is clear to me. If leds-gpio driver fails to register
any of the LEDs found in DT node it returns with an error from the
probe(), which results in unregistering any of the LEDs registered in
the previous iteration steps.

Look at the function gpio_leds_create() in
drivers/leds/leds-gpio.c.

Probably it is devm_fwnode_get_gpiod_from_child() that fails
while parsing nvmeslot0 node.

-- 
Best regards,
Jacek Anaszewski
