Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C828202D3F
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jun 2020 23:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgFUVnC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Jun 2020 17:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgFUVnB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Jun 2020 17:43:01 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED62C061794
        for <linux-leds@vger.kernel.org>; Sun, 21 Jun 2020 14:43:01 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id s28so12043047edw.11
        for <linux-leds@vger.kernel.org>; Sun, 21 Jun 2020 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IDm7u9Bpf+Q2/6B/2rqxVEbNzC131vlGDpJ/XbjSGtI=;
        b=IxM4KF9Z/HiaFwmtfjZly6mlFogG5ruU1SdQXRqg2zqvDuXj8IOWQsbe7fu6pK0BlQ
         Gb2WKk2tkaJpJ05vYFAW6H7rC4szdjNI/eBnbtTNkXiH5gAOTcV8C83I6E3S2Q42Q2Wg
         9cmMLlfZwPLf0TFVk+F7LT0wy1WBrkvPHXRkNZ79LEdqTxGP5E+/uBzFrUanBrsZG8la
         uaZ37nZbBC2lfFdwCgTeVgn88Oi18JJK+Wl45pj2pKyu9QURLDclqXLfXUZfWoz0TM5e
         I3ecxV+QFRtyKCTKUsT/sH5Jl34/xsrTMfUqrJ4CQldIISAR46jEB59PyJBQI5QXTEzS
         bpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IDm7u9Bpf+Q2/6B/2rqxVEbNzC131vlGDpJ/XbjSGtI=;
        b=pshhmK6+KsErChqMXLiWODOqqkVtww62L9qjpEZHuk1qn1SdBvmdwq2j4gymS17kZX
         8GbEtmXWh+ts1o1LgzibNqddzLdt05IXyivJDws1Fwq+NIiHLEihdqqeVylb1NvcbJgN
         A4A6yNoNCMXE31nl6nI0m5hIVVtRRH8gzVExgIEjVJR2b8ZBAfxFV8HvszvCHzjRpL85
         PFAV0UmP1nj5KA769sTFAMxsRdRLf5XbrvmqiOkLmLmfySHaDWUXh+XXtD8oYX36UtzI
         WD1fkmc/xAFD5I6Aa6y8ZLsQBaZS5dKk+NA5f8b1a3o/psH1BH9StRCcj+WInG0NeSa9
         9MOw==
X-Gm-Message-State: AOAM531ZAh437SL0h/YyFPv/LJ4hIbh42P50GW+6SsqPMVV63PmJDxVI
        hnq311spdqp290bcF3bJl6fXDyUf
X-Google-Smtp-Source: ABdhPJyxBjZXfpMtcmfAxD6i3tIarM4U2y51s79DuB4JQ98kkSUWKLoO24k2GJiceWGnhqazadw5Vw==
X-Received: by 2002:a50:c219:: with SMTP id n25mr14246265edf.306.1592775779827;
        Sun, 21 Jun 2020 14:42:59 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:ddd:82d4:b69c:dea5? ([2a01:110f:b59:fd00:ddd:82d4:b69c:dea5])
        by smtp.gmail.com with ESMTPSA id y21sm11012767edl.72.2020.06.21.14.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2020 14:42:59 -0700 (PDT)
Subject: Re: Leds-gpio discarding the entries in /sys/class/leds : Linux
 5.4.38
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
References: <D70F5F6A-ECDB-41DE-AA3C-A2A93C9EC702@linux.vnet.ibm.com>
 <124c90ad-e239-d5e8-4c86-be96e7aa7c26@gmail.com>
 <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <4b7e95e5-0889-1502-2f0b-796874f90083@gmail.com>
Date:   Sun, 21 Jun 2020 23:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6644A4B6-E6DA-413B-97CA-1E4D199D52CE@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Vishwanatha,

On 6/20/20 7:25 PM, Vishwanatha Subbanna wrote:
> Hi Jacek,
> 
> Thank you very much for the quick response. Greatly appreciate that.

You're welcome.

>> On 20-Jun-2020, at 3:27 AM, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>
>> Hi Vishwanatha,
>>
>> Please refer to Documentation/devicetree/bindings/leds/leds-pca955x.txt.
>>
>> At first glance I don't get why you have gpio-leds node, which is for
>> leds-gpio driver.
> 
> Not sure I understood it right.. But if you are asking me why I have "leds {"  and “gpio-leds” in there, then it is to get the entries in /sys/class/leds.
> The GPIOs from PCA9552 are connected to LED. Also, that is how we have had in the past, and that worked.
> 
> Example: https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L115

Thanks. Yeah, that looks OK, I had to take closer look at the driver.

> The problem I am running into is for : https://github.com/openbmc/linux/blob/dev-5.4/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> 
>>
>> On 6/19/20 3:34 PM, Vishwanatha Subbanna wrote:
>>> Hello,
>>> I am Vishwanath, working with IBM and looking for your help on one of the issues that I am running into. Would really appreciate help on this. I run Linux 5.4.38
>>> I have 2 number of PCA9552 chips, one on the Planar and other on the card that is optionally pluggable. The optional card must be plugged prior to booting and is not hot pluggable. In my experiment, I am running *without* the optional card plugged in.
>>> In the device tree, I have a "leds {" section that looks like below for the PCA9552 that is on the planar and everything works fine and I can see /sys/class/leds/fan0
>>>   leds {
>>>          compatible = "gpio-leds”;
>>>          fan0 {
>>>              retain-state-shutdown;
>>>              default-state = "keep";
>>>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
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
>>> Similarly, if I update the device tree entry for PCA9552 for the card that is optionally pluggable, then I don’t see any leds entries in /sys/class/leds.
>>
>> Please share your DT node after the update.
>>
> 
> Pasting the GPIO_0 entry only here for brevity.
> 
> leds {
>          compatible = "gpio-leds”;
> 
>          fan0 {
>              retain-state-shutdown;
>              default-state = "keep";
>              gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
>          };
> 
>          nvmeslot0 {
>              retain-state-shutdown;
>              default-state = "keep";
>              gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
>          };
> };
> 
> &i2c7 {
>      status = "okay”;
>      pca0: pca9552@61 {
>         compatible = "nxp,pca9552";
>          reg = <0x61>;
>          #address-cells = <1>;
>          #size-cells = <0>;
>          gpio-controller;
>          #gpio-cells = <2>;
> 
>          gpio@0 {
>              reg = <0>;
>              type = <PCA955X_TYPE_GPIO>;
>       	};
>      };
> };
> 
> &i2c13
> {
>      pca1: pca9552@60 {
>         compatible = "nxp,pca9552";
>         reg = <0x60>;
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         gpio-controller;
>         #gpio-cells = <2>;
> 
>         gpio@0 {
>             reg = <0>;
>             type = <PCA955X_TYPE_GPIO>;
>         };
>      };
> };
> 
> Thanks
> !! Vishwa !!
> 
>>> I don’t even see “fan0” that is on the PCA9552 on planar also. I was expecting that I should see “/sys/class/leds/fan0”.
>>> However, I could see all the entries in “/proc/device-tree/leds”.
>>> Data from the failure.
>>> [    7.895757] leds-pca955x 7-0061: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x61
>>> [    7.907659] leds-pca955x 7-0061: gpios 168...183

It is weird that you don't see "fan0" LED since this gpio seems to have
been properly registered according to this log.

>>> [    7.913012] leds-pca955x 13-0060: leds-pca955x: Using pca9552 16-bit LED driver at slave address 0x60
>>> [    7.923486] leds-pca955x 13-0060: pca955x_write_pwm: reg 0x0, val 0x80, err -6

This indicates the problem with finding pca955x device at address 0x60
on I2C bus connected to the I2C controller labelled as i2c13.

There are two options:
1) There is a problem with a physical connection with the chip on the
    card
2) You mismatched the I2C controller with the bus that controls the card

-- 
Best regards,
Jacek Anaszewski
