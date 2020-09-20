Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6657271529
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 16:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgITO7G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 10:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITO7G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 10:59:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3BAC061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 07:59:05 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id e23so14329903eja.3
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xUw5J42EuNNc6HZzwJYkg8GEi8S/2W3B+cu2LpQ3GCg=;
        b=jrwu3LYgaLyl6gn688pTlDPVfC8Q7r6KZ2W/l/xMzzNjWf2Y3MSCLxXY5xVhQSt9jG
         ZgzxkiABzDLSfkkkySUinOzeJsvzDT7FxdtRnkpiC3c2ESPhFrEgDan183FsBPjpUgXP
         vVerl5AFWX6S5OPAB9ahq6LCUgs6i4jmR/HJ40U2UnHwdLYviGNkgoUpTU/82524YShQ
         xxVptmAAxEXYj2ba3rKyt8tYTM1xa41eTrxWq42TOq+/TWQSU3xr1MfhZPqloJmC2REP
         tZOE8qVip9j86XyVMLNK4l0x/M1M4sYN1glqPdjDQyGH53AZsRmHP72rhAjrThfi1p3C
         pKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xUw5J42EuNNc6HZzwJYkg8GEi8S/2W3B+cu2LpQ3GCg=;
        b=nYz0I/ShDEKATegIHLzCiCoKyEWq2AHxprhTkYhWSCDqRDlDW1bP6RQ1iAN97u8/KW
         Wzx/VkFWGT2oieRpA+JcyKN31kTZ8VxNk86qDgVffbphYTyeFMxM/EhFBkb1OaKP3qBY
         pdr1knnr4rRjOep/SstB8BFcyE8zvijKCCjg0Yg/qUyPIcDLH5mUPpuLv9hD2s4NuMpb
         LIo767mUGQAKAHxTrZKl9x3fYbu/QJQeGtXVaPicwcDhkKJ7ADokudrU4bn42QKoSL+I
         0YNc0Qv4G/tS49l/CfCQmDhSgRCJkuYF+wIkjKNL5CpeFsSIOuwdCNCjko/6IKso41MH
         ZJtg==
X-Gm-Message-State: AOAM531ApoQcanmToBheSwrCbqZ0yuaIEmunKf0uKDRgaApI92U1xUoJ
        uihA/wZsT0/vr6ZfQzSdwDV18S59AXo=
X-Google-Smtp-Source: ABdhPJyObNhKgLqr8DxIJ+XhdKeBfDtpO6AtRaD6cy6OuYvahnJFmj34j1sLyskoLb2O1GyNM2BlFg==
X-Received: by 2002:a17:906:8245:: with SMTP id f5mr43676495ejx.264.1600613944203;
        Sun, 20 Sep 2020 07:59:04 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id a15sm6667473eje.16.2020.09.20.07.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:59:03 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        linux-leds@vger.kernel.org
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
 <20200919223134.2371459c@nic.cz>
 <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
 <20200920153707.70164720@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5ae6b9f4-3c9b-3a47-5738-585b28d841c5@gmail.com>
Date:   Sun, 20 Sep 2020 16:59:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920153707.70164720@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/20 3:37 PM, Marek Behun wrote:
> On Sun, 20 Sep 2020 15:16:11 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> Hi Marek,
>>
>> On 9/19/20 10:31 PM, Marek Behun wrote:
>>> On Sat, 19 Sep 2020 21:24:26 +0200
>>> Adrian Schmutzler <freifunk@adrianschmutzler.de> wrote:
>>>    
>>>> Many consumer "routers" have dedicated LEDs for specific WiFi bands,
>>>> e.g. one for 2.4 GHz and one for 5 GHz. These LEDs specifically
>>>> indicate the state of the relevant band, so the latter should be
>>>> included in the function name. LED_FUNCTION_WLAN will remain for
>>>> general cases or when the LED is used for more than one band.
>>>>
>>>> This essentially is equivalent to how we use LED_FUNCTION_LAN and
>>>> LED_FUNCTION_WAN instead of just having LED_FUNCTION_ETHERNET.
>>>
>>> Dont. If you want the LED name to inform the user about the WiFi
>>> device it is being triggered on, it instead should come from the
>>> devicename part:
>>>     "wlan0:blue:activity"
>>>
>>> In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g", but
>>> "activity".

I disagree. Activity should be reserved for the activity trigger.
I've had a patch [0] documenting standard LED functions, but it
eventually didn't make to the mainline, I'll try to send an update.

>>> I am going to try to work on this subsystem so that if trigger source
>>> of the LED is set to a WiFi device and function is set to activity, the
>>> LED shall blink on wifi activity.
>>>
>>> This way we can also avoid using the `linux,default-trigger` property
>>> in favour of `function`, i.e. if I have:
>>>
>>>      wlan0: wifi@12300 {
>>>        compatible = "some-wifi";
>>>        #trigger-source-cells = <0>;
>>>      }
>>>
>>>      led {
>>>        color = <LED_COLOR_ID_BLUE>;
>>>        function = LED_FUNCTION_ACTIVITY;
>>>        trigger-sources = <&wlan0>;
>>>      };
>>>
>>> Than this will automatically name the LED as
>>>     wlan0:blue:activity
>>> and if the corresponding trigger is available, it should set the
>>> trigger even if no `linux,default-trigger` property is present.
>>
>> Since wlan0 is DT label, then you will probably not be able to retrieve
>> its name in the driver but only a pointer to the struct device_node
>> associated with the label. And actually from the userspace user POV
>> this name is not too informative. What is informative is
>> unique identifier of the wlan device present in the system, associated
>> with the LED.
>>
>> And wlan drivers broadly use wiphy_name() to get phy identifier and
>> use it for composing associated LED device name.
>>
>> This way we get LED name in the form (here for Mediatek wlan dongle):
>>
>> mt7601u-phy0
>>
>> This is not in alignment with LED naming pattern and there also are
>> other variations for different drivers in
>> drivers/net/wireless, so it would be good to standardize that.
>>
>> While implementing LED core support for LED name composition I created
>> also a script for validating LED name and printing LED hardware
>> related information so that could be a good starting point.
>>
>> The script is in the tree:
>>
>> tools/leds/get_led_device_info.sh
>>
>> and for said Mediatek dongle it gives following output:
>>
>> <quote>
>>
>> $./tools/leds/get_led_device_info.sh /sys/class/leds/mt7601u-phy0
>>
>> #####################################
>> # LED class device hardware details #
>> #####################################
>>
>> bus:			usb
>> idVendor:		148f
>> idProduct:		7601
>> manufacturer:		MediaTek
>> product:		802.11 n WLAN
>> driver:			mt7601u
>>
>> ####################################
>> # LED class device name validation #
>> ####################################
>>
>> ":" delimiter not detected.	[ FAILED ]
>>
>> </quote>
>>
>> And for the LEDs exposed by USB keyboard it prints below stuff:
>>
>> <quote>
>>
>> $./tools/leds/get_led_device_info.sh /sys/class/leds/input1\:\:capslock
>>
>> #####################################
>> # LED class device hardware details #
>> #####################################
>>
>> bus:			usb
>> idVendor:		046d
>> idProduct:		c31c
>> manufacturer:		Logitech
>> product:		USB Keyboard
>> driver:			usbhid
>> associated input node:	input1
>>
>> ####################################
>> # LED class device name validation #
>> ####################################
>>
>> devicename :	input1               [ OK ]
>> function   :	capslock             [ OK ]     Matching definition:
>> LED_FUNCTION_CAPSLOCK
>>
>> </quoute>
>>
>> The script currently detects LEDs associations only with wireless and
>> input devices.
>>
> 
> Thank you Jacek, I will look into this.
> 
> Currently my ideas are as follows:
> - each LED trigger that has settable trigger source (currently only
>    netdev, gpio, phy (in wireless subsystem) and maybe disk in the
>    future) shall implement a method for translating device/node pointer
>    to LED devicename
> - if trigger-sources is given, the LED registration function shall to
>    call this new trigger method for all triggers giving the trigger
>    source as parameter
> - the first of the triggers that returns successfully will decide the
>    devicename part of the LED
> - if none of the triggers return successfully, 2 things can happen, and
>    I am not yet sure which one should:
>      1. the registration fails with -EPROBE_DEFER, because LED name
>         cannot be composed, either trigger module is missing or driver
>         for the trigger source is missing
>      2. the registration succeeds but devicename part of LED will be
>         missing. Since Pavel does not want LED renaming implemented,
>         this can be only solved by forcing LED driver unbind and rebind
> 
> What do you think?

I don't think that initially set trigger source should have any impact
on the LED device name. It is rather the other way round - if the LED
is physically integrated with the device (e.g. wlan dongle case), then
it is justified to add a devicename section to it. This is what current
wlan drivers do, and additionally they register trigger(s) with the same
devicename prefix, and register the LED with one of them.

In case of my mt7601u dongle it looks like below:

/sys/class/leds/mt7601u-phy2$ cat trigger
none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock 
kbd-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock 
kbd-ctrlllock kbd-ctrlrlock usb-gadget usb-host timer disk-activity 
disk-read disk-write ide-disk mtd nand-disk heartbeat cpu cpu0 cpu1 cpu2 
cpu3 cpu4 cpu5 cpu6 cpu7 panic pattern rfkill-any rfkill-none rfkill2 
phy2rx phy2tx phy2assoc phy2radio [phy2tpt]

IMO if LED is not physically integrated with any device, then it should
not be named after the device that is to be initially associated with
via trigger. This association can be later changed in userspace, which
will render the name invalid. And current associated device can be read
by reading triggers sysfs file, provided that the trigger conveys
that information like in case of presented above phy* triggers.

OTOH, a LED with devicename describing its physical location will
not change this location, even after changing the trigger
(or trigger source), thus it proves correct to have fixed devicename
section for the LED, but only if it is a part of some other pluggable
device.

[0] 
https://lore.kernel.org/linux-leds/20190609190803.14815-27-jacek.anaszewski@gmail.com/

-- 
Best regards,
Jacek Anaszewski
