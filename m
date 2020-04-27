Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CB51BA0CA
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 12:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgD0KJE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 06:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726349AbgD0KJD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 06:09:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1830C0610D5;
        Mon, 27 Apr 2020 03:09:02 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so19806795wrb.8;
        Mon, 27 Apr 2020 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qcspjBGVZxocuiJzSFh7wsE2tv0Go4/T/FP6I0OkrlE=;
        b=RjtiLI2EVZAssgGj2WwvJfJK2t7gOoC4qqSpkwvw+nPhFFUOdGmZ9yQBeCi+C4eb5h
         ECMtJBcnUK2P2u+QIT0lsViuUTDp7oMJwvbmLuvPZVHbxjYFZVERmkXD4WpAthgdvE3D
         5YPP52pnEv9EBgUMGbsitayPEQ8dyLUGtmoB1chdsKgAiSXddnGXM8AqhQ+BU0uY93Ui
         Asx5nTXYz6FykQ5mS1ITFaomJgVOspO0a8SAPLfM6kNtzpOXZ8iC5G6hqp9fqABf9mBC
         2CrIq0sl86Hy3bHx+pEfZt2t19YofrAWAvHzKnsI0G1Hw4V7+nkupeRRkPFHwnQam03N
         /JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qcspjBGVZxocuiJzSFh7wsE2tv0Go4/T/FP6I0OkrlE=;
        b=Zg2Joxpw7CV88Mlti6hBnna2BWenZ6fB0iunN642x/3wvK+Hw6wYWByCaB5OVxJrgQ
         3zodjSjn/Tpge7xhYDn1sNHE76j+qfr7oq6Cm9+Eyq31McU35uYJamJzffuUKf8tm3jG
         Ud0SkZMhEZy3XVhjoxnWm+fvUUPFDdaLW1L1ZvPzXF5OUACn4N+bilpkJ+fZMSo7rxps
         1y7f8PF7d7h9VYbFyR5EI7dA3vVgP+oOQ2FQKR0x0iR1k3BPWniQmuNnBLnk22Xo5MED
         Ed9j6B8C/I5a2y2hBCyMo9SXNoPuTuHLzR/iISFpMpWVpMnSI+W1SM9DTqs4bCQI2pDa
         3+rw==
X-Gm-Message-State: AGi0PuZlHPKVCWtAcKvrfe/5iqQmifI4A6YagZI/gJlQYxQHcAGML/Eu
        YnLv+6PujzQd3Z3Z/O0YOjs=
X-Google-Smtp-Source: APiQypJrScIJUNHBYR71zdqUyKpvYWTJM9XGtBmSKd7PelGVAfOJGGDlE5drsq3ChuDFkafv+oYaFQ==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr26135247wru.258.1587982141506;
        Mon, 27 Apr 2020 03:09:01 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id p16sm20013661wro.21.2020.04.27.03.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 03:09:00 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC
 numbering for LED triggers
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>, dmurphy@ti.com,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        jacek.anaszewski@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
References: <20200427073132.29997-3-wens@kernel.org>
 <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
 <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <65d15254-08da-895c-1a0c-ef6ce231b620@gmail.com>
Date:   Mon, 27 Apr 2020 12:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/27/20 11:17 AM, Chen-Yu Tsai wrote:
> On Mon, Apr 27, 2020 at 4:57 PM Johan Jonker <jbx6244@gmail.com> wrote:
>>
>> Hi Chen-Yu,
>>
>>> From: Chen-Yu Tsai <wens@csie.org>
>>>
>>> With SDIO now enabled, the numbering of the existing MMC host controllers
>>> gets incremented by 1, as the SDIO host is the first one.
>>>
>>> Increment the numbering of the MMC LED triggers to match.
>>>
>>> Fixes: cf3c5397835f ("arm64: dts: rockchip: Enable sdio0 and uart0 on rk3399-roc-pc-mezzanine")
>>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts | 8 ++++++++
>>>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi          | 4 ++--
>>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
>>> index 2acb3d500fb9..f0686fc276be 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
>>> @@ -38,6 +38,10 @@ vcc3v3_pcie: vcc3v3-pcie {
>>>       };
>>>  };
>>>
>>> +&diy_led {

>>> +     linux,default-trigger = "mmc2";

If you decide to use a free form trigger that is not a 'standard' one,
then it becomes a user property.
User defined properties should not go in a generic dts.
It's up to the user what function he/she gives to that led!

>>> +};
>>> +
>>>  &pcie_phy {
>>>       status = "okay";
>>>  };
>>> @@ -91,3 +95,7 @@ &uart0 {
>>>       pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
>>>       status = "okay";
>>>  };
>>> +
>>> +&yellow_led {
>>> +     linux,default-trigger = "mmc1";
>>> +};
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
>>> index 9f225e9c3d54..bc060ac7972d 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
>>> @@ -70,14 +70,14 @@ work-led {
>>>                       linux,default-trigger = "heartbeat";
>>>               };
>>>
>>
>>> -             diy-led {
>>> +             diy_led: diy-led {
>>
>> This changes an existing nodename into something that is still not the

Correction:
It takes an existing nodename and adds a label.

>> preferred way. In the current Rockchip dts there are nodenames like
>> 'work', 'yellow' that causing warnings with the command:
> 
> This doesn't change the node name at all. It only adds a label.
> If it doesn't pass the check now, it didn't pass the check before.
> 
> I just realized that the footnote I added before is gone because I
> regenerated the patches. The original footnote was something along
> the lines of:
> 
> I opted to not change the node names nor the labels as the discussion
> had not concluded. The other reason being that people may have scripts
> or device tree overlays depending on the existing node names.
> 
> Previously I asked the following but got no response:
> 
>     Is changing this after it has been in some kernel releases OK? Wouldn't
>     it be considered a break of sysfs ABI?
> 
>     Also, is there some guideline on how to name the labels? For sunxi we've
>     been doing "${vendor}:${color}:${function}" since forever.
> 
>     As far as I can tell, the hardware vendor [1] has no specific uses for
>     these two (red and yellow) LEDs designed in. And their GPIO lines are
>     simply labeled "DIY" (for the red one) and "YELLOW". So I'm not sure
>     if putting "our" interpretations and the default-trigger into the
>     label is wise.
> 
>     For reference, the green one has its GPIO line labeled "WORK", and their
>     intention from [1] is to have it as some sort of power / activity indicator.
>     Hence it is named / labeled "work".
> 
>     As for the node names, I think we can keep it as is for now. It's not
>     the preferred form, but there's really no need to change it either.
>     And some overlay or script might actually expect that name.
> 
>> make -k ARCH=arm dtbs_check
>>
>> Could you give a generic guide line/example, so all these changes are
>> treated the same way? As if the naming follows the preferred 'led-0' line.
> 
> I'm not sure what you are asking for.

Your nodename just happend to contain 'led' to pass the regex.
There are many other names in use.
'If' the DT maintainer (=Heiko) decides the get rid of all the warnings
for led nodes then that change would require all nodename to be handled
to same (=preferred way):

Change this:

diy_led: diy-led
yellow_led: yellow-led

Into something like:

led_0: led-0
led_1: led-1

> 
> ChenYu
> 
>>>                       label = "red:diy";
>>>                       gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
>>>                       default-state = "off";
>>>                       linux,default-trigger = "mmc1";
>>>               };
>>>
>>> -             yellow-led {
>>> +             yellow_led: yellow-led {
>>>                       label = "yellow:yellow-led";
>>>                       gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
>>>                       default-state = "off";
>>> --
>>> 2.26.0
>>

