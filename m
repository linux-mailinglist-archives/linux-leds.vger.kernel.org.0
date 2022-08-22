Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C65459BF89
	for <lists+linux-leds@lfdr.de>; Mon, 22 Aug 2022 14:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbiHVMeA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Aug 2022 08:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbiHVMd7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Aug 2022 08:33:59 -0400
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0B7FD3F
        for <linux-leds@vger.kernel.org>; Mon, 22 Aug 2022 05:33:56 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by srv6.fidu.org (Postfix) with ESMTP id 54DB1C8008E;
        Mon, 22 Aug 2022 14:33:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
        by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 8qomwgKOrlfz; Mon, 22 Aug 2022 14:33:54 +0200 (CEST)
Received: from [IPV6:2003:e3:7f25:9300:c3eb:8987:caf5:b513] (p200300E37F259300c3eb8987cAf5B513.dip0.t-ipconnect.de [IPv6:2003:e3:7f25:9300:c3eb:8987:caf5:b513])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: wse@tuxedocomputers.com)
        by srv6.fidu.org (Postfix) with ESMTPSA id 00097C8008D;
        Mon, 22 Aug 2022 14:33:53 +0200 (CEST)
Message-ID: <7100ac63-d52b-6cec-892c-cc47c10331dc@tuxedocomputers.com>
Date:   Mon, 22 Aug 2022 14:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Clarification questions regarding multicolor leds
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
 <20220821181840.GA19796@duo.ucw.cz>
From:   Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20220821181840.GA19796@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

thanks for the answers, comments below.

Am 21.08.22 um 20:18 schrieb Pavel Machek:
> Hi!
>> I'm currently implementing the multicolors sysfs leds interface for several
>> Clevo and Tongfang barebones, but I'm unsure how to actually map the leds to
>> the multicolor interface:
>>
>> The keyboards come in 5 variants:
>>
>> Single zone RGB + Brightness
>>
>> Single Zone RGB
>>
>> 3 Zone RGB + Shared Brightness
>>
>> Per Key RGB
>>
>> Per Key RGB + Shared Brightness
>>
>> First question: How do I map multiple zones or per-key leds?
>>
>> Should I register a seperate ::kbd_backlight for zone/key? resulting in
>> ::kbd_backlight, ::kbd_backlight_1, ::kbd_backlight_2, ::kbd_backlight_3,
>> etc?
> For a zone, yes.
Ok
>
>> Should I give them more desciptive names like ::kbd_backlight_left,
>> ::kbd_backlight_center, ::kbd_backlight_right, ::kbd_backlight_a,
>> ::kbd_backlight_b, ::kbd_backlight_enter?
>>
>> Or Should I only create a single ::kbd_backlight instance and map the
>> different zones to subleds? So there are number of zones * 3 subleds, with
>> each tripplet controlling the rgb values of one zone/key? This would help
>> performance, as for the per-key backlight, the firmware in the backend wants
>> an array for all keys at once. So setting each key seperatly would mean
>> sending the whole array for each key individually. And I think what most
>> people want to do is to set the whole keyboard at once anyway and nit key by
>> key.
> Not sure what to do there. And not sure if LED subsystem is suitable
> for this, actually. This starts to look like a display...

Well, the per-key keyboard actually has a 6x20 grid of leds under it of 
which each can be set to a different color.

So in a kind of way it is a Display? Especially if someone wants to 
program a complex animation to it.

What would be a better place/way to implement this? With the numeration 
implementation you have ::kbd_backlight(_0) up to ::kbd_backlight_119. 
And 120 file accesses for each frame of a potentially custom programmed 
keyboard backlight animation.

Also, userspace has no clear way of knowing how these 120 leds are 
actually placed under the keyboard.

Suggestion for the TODO list: Find a suitable interface for single 
devices with many individually controlable leds (per-key-rgb keyboards, 
led stipes with individually controllable leds, rgb ram with 
individually controllable leds, etc.)

A quick idea: Maybe add a multi_coord and a multi_coord_max entry? The 
first first one giving the coordinate of the led on the device (eg a 
keyboard) in an abstract messuring unit in the form "<x> <y>". Defined 
by 0 0 as the upper left corner of the device and multi_coord_max as the 
lower right. In the case the device is "one-dimensional", e.g. a led 
stripe, the second value of coord_max is 0. Alternativly, no 
multi_coord_max, and multi_coord is just 2 float values between 0 and 100.

>
>> Second question: For the keyboards with shared brightness, is it ok to have
>> the brightness values of ::kbd_backlight, ::kbd_backlight_1 etc. just in
>> sync? I did not see a way to have a ::kbd_backlight without the brightness
>> sysfs entry (then I would have just given the brightness switch to
>> ::kbd_backlight and not to ::kbd_backlight_1 and ::kbd_backlight_2)
> Can we simply ignore shared brightness to get reasonable API?
So not use the brightness parameter of the firmware, but do everything 
with RGB values?
>
>> Third question: The 3 zone RGB and the per-key keyboards have firmware
>> accelerated modes, like breathing and rainbow. How do I make them accessible
>> via the multicolor leds interface? the blinking pattern interface does not
>> really match the usecase as these modes are a simple single value toggle
>> (0=static color, 1=breathing, 2=ignore color settings and play predefined
>> moving rainbow pattern, etc).
> Take a look at drivers/leds/trigger/ledtrig-pattern.c . That's
> interface we'd like.

Isn't that the interface described here 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt 
? That does not really map to the firmware, es the breathing mode for 
example can't be adjusted, it just goes from max to off and back in a 
predefined timeframe.

As far as I see there is no interface for vendor specific modes. So what 
would the correct place be so expose this to userspace? Only thing I can 
think auf atm is just a sysfs entry in the platform driver complementing 
the leds settings. Albeit a little bit ugly because then you have 2 
different places controlling the leds.

>
> Best regards,
> 								Pavel

Kind regards,

Werner

