Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146B127146E
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 15:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgITNQR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 09:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgITNQR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 09:16:17 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4E3C061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 06:16:17 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id i26so14057412ejb.12
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YNW6YvmLisfEgsC1l9PeTBBRnvAoIvMFiaba+Il2Ld4=;
        b=nStqQGCi1T436098PWnbijqBIQPEp61PIiK2KbEzvZI3NMLIlYmV7rn+oPSVtuaa+R
         AkeVXvHVitqtwQaKHfEgx4eax0EhjW7sheyyk19j1EJiM31wfe09MtrXoSDuanFEVx3V
         KtfuosOMZHqPaBFgfD36KHKugdXjLjO4R8pFJ4lQ8lhlvPqO7M2l6DBnPw8PB9ESnnql
         uQKe/FCXEHvxV+IR87z5M1V9pcuXRZKmrAqnQWxm3EOiOw6oTo28bPlPH0wxoaoQkqZE
         87kX3leDFt37fYEjhm05hlAoKhEFCEu+2u2Zzx63eVCNjIWLh3XwWERcm1j69U6+w+vR
         +CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YNW6YvmLisfEgsC1l9PeTBBRnvAoIvMFiaba+Il2Ld4=;
        b=WPzMdINEFfZr5C9/v2YXZPSXyudgL3AMeX2YT58X5/EPUefAObl973KdgomJkaWvOA
         86LLU2s8OZ6HiwJFdTGkUlR3fXieoM/MFIhJYRC9mmAMn7jdz1y7CgEta+bhUREey/AW
         sKSyLXUO1Okh17CZ1iAoOs2esrkO5fUtFhyJNf9EcUcgV1RQWc4i2vR74kn5bfF0SvB+
         RXE3wMj8AurHNz0cBj7ME3zl67Alyzy/4Y0n/+7M1x7hvoOtxepmF0HgfasAKjiQLkcr
         Unugt+xNU8bcVS8O4DkCKqiR8wFTNiQB0K7JejI6XkfKpb7MzTU94LPYckHvhcSftVS+
         BMzw==
X-Gm-Message-State: AOAM531xcw9lvRf8t+f35Cl7gG5XMIW+oWk5tOH/vN+/KYcp4ELqQBLo
        Nrb6qD7E3HKmoDz1YotsgyaRzgyscGg=
X-Google-Smtp-Source: ABdhPJyRdLKW24Bd9Tf2DItYQ/y51qY3khi1cmvb+BtUerHI7X+dS8xgNAVKBNhUmTnvWEZRva6Fcw==
X-Received: by 2002:a17:906:556:: with SMTP id k22mr44296863eja.369.1600607775411;
        Sun, 20 Sep 2020 06:16:15 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id z4sm6578752ede.65.2020.09.20.06.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 06:16:14 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
To:     Marek Behun <marek.behun@nic.cz>,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     linux-leds@vger.kernel.org
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
 <20200919223134.2371459c@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
Date:   Sun, 20 Sep 2020 15:16:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200919223134.2371459c@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 9/19/20 10:31 PM, Marek Behun wrote:
> On Sat, 19 Sep 2020 21:24:26 +0200
> Adrian Schmutzler <freifunk@adrianschmutzler.de> wrote:
> 
>> Many consumer "routers" have dedicated LEDs for specific WiFi bands,
>> e.g. one for 2.4 GHz and one for 5 GHz. These LEDs specifically
>> indicate the state of the relevant band, so the latter should be
>> included in the function name. LED_FUNCTION_WLAN will remain for
>> general cases or when the LED is used for more than one band.
>>
>> This essentially is equivalent to how we use LED_FUNCTION_LAN and
>> LED_FUNCTION_WAN instead of just having LED_FUNCTION_ETHERNET.
> 
> Dont. If you want the LED name to inform the user about the WiFi
> device it is being triggered on, it instead should come from the
> devicename part:
>    "wlan0:blue:activity"
> 
> In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g", but
> "activity".
> 
> I am going to try to work on this subsystem so that if trigger source
> of the LED is set to a WiFi device and function is set to activity, the
> LED shall blink on wifi activity.
> 
> This way we can also avoid using the `linux,default-trigger` property
> in favour of `function`, i.e. if I have:
> 
>     wlan0: wifi@12300 {
>       compatible = "some-wifi";
>       #trigger-source-cells = <0>;
>     }
> 
>     led {
>       color = <LED_COLOR_ID_BLUE>;
>       function = LED_FUNCTION_ACTIVITY;
>       trigger-sources = <&wlan0>;
>     };
> 
> Than this will automatically name the LED as
>    wlan0:blue:activity
> and if the corresponding trigger is available, it should set the
> trigger even if no `linux,default-trigger` property is present.

Since wlan0 is DT label, then you will probably not be able to retrieve
its name in the driver but only a pointer to the struct device_node
associated with the label. And actually from the userspace user POV
this name is not too informative. What is informative is
unique identifier of the wlan device present in the system, associated
with the LED.

And wlan drivers broadly use wiphy_name() to get phy identifier and
use it for composing associated LED device name.

This way we get LED name in the form (here for Mediatek wlan dongle):

mt7601u-phy0

This is not in alignment with LED naming pattern and there also are
other variations for different drivers in
drivers/net/wireless, so it would be good to standardize that.

While implementing LED core support for LED name composition I created
also a script for validating LED name and printing LED hardware
related information so that could be a good starting point.

The script is in the tree:

tools/leds/get_led_device_info.sh

and for said Mediatek dongle it gives following output:

<quote>

$./tools/leds/get_led_device_info.sh /sys/class/leds/mt7601u-phy0

#####################################
# LED class device hardware details #
#####################################

bus:			usb
idVendor:		148f
idProduct:		7601
manufacturer:		MediaTek
product:		802.11 n WLAN
driver:			mt7601u

####################################
# LED class device name validation #
####################################

":" delimiter not detected.	[ FAILED ]

</quote>

And for the LEDs exposed by USB keyboard it prints below stuff:

<quote>

$./tools/leds/get_led_device_info.sh /sys/class/leds/input1\:\:capslock

#####################################
# LED class device hardware details #
#####################################

bus:			usb
idVendor:		046d
idProduct:		c31c
manufacturer:		Logitech
product:		USB Keyboard
driver:			usbhid
associated input node:	input1

####################################
# LED class device name validation #
####################################

devicename :	input1               [ OK ]
function   :	capslock             [ OK ]     Matching definition: 
LED_FUNCTION_CAPSLOCK

</quoute>

The script currently detects LEDs associations only with wireless and
input devices.

-- 
Best regards,
Jacek Anaszewski
