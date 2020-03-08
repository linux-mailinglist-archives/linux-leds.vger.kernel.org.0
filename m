Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFCA17D534
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2020 18:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCHRVP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Mar 2020 13:21:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35857 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgCHRVO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Mar 2020 13:21:14 -0400
Received: by mail-wm1-f66.google.com with SMTP id g62so2840716wme.1;
        Sun, 08 Mar 2020 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qzsxqhegd7VOxV+LmHb3kKEhWvUPEvJLG/AsAJYRHG0=;
        b=MV4/0JIsQpDgpy+PUteYVcjSySw1KR1NEm/7AjMjS4OQbwYHuP1H3dk+pb4jHc/rhL
         97rXzp+XrLrHY1sQOy28bqRCq8QbgA1EIhmZUEzQ11ORTwLQRvSu8DAY1IDJVJ2MtRGM
         N/Hzm+l3NyyPs3TUH16sVL+UtkvyHmCNPh+BxJRBhxziiGetAb/cdmFh3ExgNe+od7VV
         ukxjAakNqSyFWWZZQKiwed8B7p9pItKORr3+Of4n3FAF//LfTG0zJ5VPq9uR5YYt5SYR
         Ed70cCuJOXCKofwP8w+IDNgjl3OY0iJIPltU66PgjQBreCtCtZy7WxdR9yaSbjSyLujr
         goCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qzsxqhegd7VOxV+LmHb3kKEhWvUPEvJLG/AsAJYRHG0=;
        b=rUGto0bqyaJd20y3KXh1uqTaNRLWkmiUoYs95rPg1uqm44W/JckWDuqRGGuPnWVx6O
         yGTrNPUR/wUFoE7cJouUbfUPkeFk/zgBI5SFbbIbKAsq2pmKcToK27xm/vGDiPNrwttR
         bMu5GW/ce0wNvtgyCmoLCWKJcXki4ZOHWV5SqkiHmmzWXuzE8ofzxaJ5WmLSWRGMce/O
         sNv3Wf27d5043tn8/sL87wzIcJtNU2gsX5Bi/qeTBAS82y5toKYR8ZcHZGM3IBZsS7kP
         wT6xpnhJ50vH238O3PJlc57ZEwhyxQp6kUW6+ldupgBq2EXOiVaWSQI2EK80qBNlPtN/
         RgLA==
X-Gm-Message-State: ANhLgQ3MnQKxCBeN7qWsYJbFmjmwk84Qoc/nK0riEXDsjpZhDUVGAbGQ
        lRxsnzodkIr3ZuerrjC2vKIvsIEq
X-Google-Smtp-Source: ADFU+vsFOzHmtglSWZ/5yvy4V6BOFlaguplG7NARDOQxwykN/6G8AS2hZ/udz7bG9BXy1ZlIt8so1g==
X-Received: by 2002:a1c:5457:: with SMTP id p23mr16141965wmi.45.1583688071539;
        Sun, 08 Mar 2020 10:21:11 -0700 (PDT)
Received: from [192.168.1.23] (affz13.neoplus.adsl.tpnet.pl. [95.49.155.13])
        by smtp.gmail.com with ESMTPSA id x9sm17472030wrx.0.2020.03.08.10.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2020 10:21:10 -0700 (PDT)
Subject: Re: [RFC PATCH] leds: add sgm3140 driver
To:     Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org
References: <20200227185015.212479-1-luca@z3ntu.xyz>
 <4539487.31r3eYUQgx@g550jk> <b58ddefc-b282-5a85-9dca-824e513705de@gmail.com>
 <1832610.usQuhbGJ8B@g550jk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <568b079a-0a42-4eed-d2d7-12f0feef35e6@gmail.com>
Date:   Sun, 8 Mar 2020 18:21:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1832610.usQuhbGJ8B@g550jk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/8/20 5:55 PM, Luca Weiss wrote:
> Hi Jacek,
> 
> On Sonntag, 8. März 2020 17:47:17 CET Jacek Anaszewski wrote:
>> Hi Luca,
>>
>> On 3/8/20 12:32 PM, Luca Weiss wrote:
>>> Hi Jacek,
>>>
>>> Thanks for your review! Replies are inline below.
>>>
>>> I'm wondering if I should implement support for the flash-max-timeout-us
>>> dt
>>> property ("Maximum timeout in microseconds after which the flash LED is
>>> turned off.") to configure the timeout to turn the flash off as I've
>>> currently hardcoded 250ms but this might not be ideal for all uses of the
>>> sgm3140. The datasheet> 
>>> states:
>>>> Flash mode is usually used with a pulse of about 200 to 300 milliseconds
>>>> to
>>>> generate a high intensity Flash.
>>>
>>> so it might be useful to have this configurable in the devicetree. The
>>> value of 250ms works fine for my use case.
>>
>> Yeah, I was to mentioned that.
>>
>>> Theoretically also the .timeout_set op could be implemented but I'm not
>>> sure if this fits nicely into the existing "timeout" API and if it even
>>> makes sense to implement that.
>>
>> Why wouldn't it fit? You can implement timeout_set op and cache flash
>> timeout value in it. Then that cached value would be passed in
>> strobe_set to mod_timer() in place of currently hard coded 250.
>>
> 
> I'll implement that then.
> 
>>> Regards,
>>> Luca
>>>
>>> On Donnerstag, 5. März 2020 22:09:16 CET Jacek Anaszewski wrote:
>>>> Hi Luca,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On 2/27/20 7:50 PM, Luca Weiss wrote:
>>>>> Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.
>>>>>
>>>>> This device is controller by two GPIO lines, one for enabling the LED
>>>>> and the second one for switching between torch and flash mode.
>>>>>
>>>>> The device will automatically switch to torch mode after being in flash
>>>>> mode for about 250-300ms, so after that time the driver will turn the
>>>>> LED off again automatically.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>>>> ---
>>>>> Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
>>>>> in Documentation/leds/leds-class-flash.rst).
>>>>>
>>>>> The following is possible:
>>>>>
>>>>> # Torch on
>>>>> echo 1 > /sys/class/leds/white\:flash/brightness
>>>>> # Torch off
>>>>> echo 0 > /sys/class/leds/white\:flash/brightness
>>>>> # Activate flash
>>>>> echo 1 > /sys/class/leds/white\:flash/flash_strobe
>>>>>
>>>>> # Torch on
>>>>> v4l2-ctl -d /dev/video1 -c led_mode=2
>>>>> # Torch off
>>>>> v4l2-ctl -d /dev/video1 -c led_mode=0
>>>>> # Activate flash
>>>>> v4l2-ctl -d /dev/video1 -c strobe=1
>>>>
>>>> What is /dev/video1 ? Did you register vl42 flash subdev
>>>> in some v4l2 media controller device?
>>>
>>> On the Allwinner A64 SoC /dev/video0 is the node for cedrus (video
>>> encoder/
>>> decoder), so the sun6i-csi driver gets to be /dev/video1
>>>
>>> # v4l2-ctl --list-devices
>>>
>>> cedrus (platform:cedrus):
>>>         /dev/video0
>>>         /dev/media0
>>>
>>> sun6i-csi (platform:csi):
>>>         /dev/video1
>>>
>>> Allwinner Video Capture Device (platform:sun6i-csi):
>>>         /dev/media1
>>>
>>> Here's the relevant part from my dts:
>>>
>>> sgm3140 {
>>>
>>>     compatible = "sgmicro,sgm3140";
>>>     flash-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* FLASH_TRIGOUT: PD24 */
>>>     enable-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* FLASH_EN: PC3 */
>>>     
>>>     sgm3140_flash: led {
>>>     
>>>         function = LED_FUNCTION_FLASH;
>>>         color = <LED_COLOR_ID_WHITE>;
>>>     
>>>     };
>>>
>>> };
>>
>> This needs to be documented in DT bindings for this driver.
>>
> 
> I have already written some yesterday, will post them with my v1 :)

Good :-)

> 
>>> /* as subnode of csi (compatible: allwinner,sun50i-a64-csi) */
>>> ov5640: rear-camera@4c {
>>>
>>>     compatible = "ovti,ov5640";
>>>     <snip>
>>>     flash-leds = <&sgm3140_flash>;
>>>
>>> };
>>
>> And this in camera bindings.
> 
> This is documented at 
> Documentation/devicetree/bindings/media/video-interfaces.txt:
> 
> - flash-leds: An array of phandles, each referring to a flash LED, a sub-node
>   of the LED driver device node.
> 
> Without referencing the flash device in a camera node, the v4l2 controls won't 
> even show up from what I saw.
> The binding is apparently only used in omap3-n9 and omap3-n950 currently; only 
> phones have flash leds normally and the phones that are currently in mainline 
> Linux don't have camera support yet.

I was rather thinking of mentioning this e.g. in
Documentation/devicetree/bindings/media/i2c/ov5640.txt in the form like
below (copied other occurrences thereof):

- flash-leds: See ../video-interfaces.txt

-- 
Best regards,
Jacek Anaszewski
