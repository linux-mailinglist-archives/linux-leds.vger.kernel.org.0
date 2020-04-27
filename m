Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F47D1BA15C
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 12:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgD0Kde (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 06:33:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgD0Kde (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 06:33:34 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EB5320735;
        Mon, 27 Apr 2020 10:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587983613;
        bh=aOaIIKszeCrTqlWbseYknAJ8SMIcs8kkPSNhJjQ6u9E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UlRBMPvoNLzTUwJ+zdPpThA5L0s9xRgXLrZ8eoGDZIuwANdtW9I2jCMH1GosymYX+
         tqmIYiXCOMHVIHBBOgjhC3Tg4TVYun5gpZadxN0GAuLqRrOQsaRVpHyxhn9dUns24N
         NfDLQ7IjDJICa6jSUq0JV9hPvXX4Jr7dLl/rSUJk=
Received: by mail-lj1-f171.google.com with SMTP id a21so16998918ljb.9;
        Mon, 27 Apr 2020 03:33:33 -0700 (PDT)
X-Gm-Message-State: AGi0Publ4NBWfABfdbmiUyf5FeYs8Khn0/LXyuaUdfriEYqFoTfqRDj2
        kCs/htPvrI0vbXKTSYd0kIkRJ4DER1uS/bwjp90=
X-Google-Smtp-Source: APiQypIqOK1mjsOHL1arjUsIJmqjBh9f6SaKAQkyQrjJ4yAtDn+rUtD2oFnEgN8nt8ZLYAHmAznVhXsvWd0e3gOKPI0=
X-Received: by 2002:a05:651c:48a:: with SMTP id s10mr13149460ljc.226.1587983611214;
 Mon, 27 Apr 2020 03:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200427073132.29997-3-wens@kernel.org> <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
 <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com> <65d15254-08da-895c-1a0c-ef6ce231b620@gmail.com>
In-Reply-To: <65d15254-08da-895c-1a0c-ef6ce231b620@gmail.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 27 Apr 2020 18:33:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v65fGYguNoksq5Dyx3HTKeYg+U82TiQSL+NO8AUcQJQj5w@mail.gmail.com>
Message-ID: <CAGb2v65fGYguNoksq5Dyx3HTKeYg+U82TiQSL+NO8AUcQJQj5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC
 numbering for LED triggers
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        devicetree <devicetree@vger.kernel.org>, dmurphy@ti.com,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        jacek.anaszewski@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 27, 2020 at 6:09 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> On 4/27/20 11:17 AM, Chen-Yu Tsai wrote:
> > On Mon, Apr 27, 2020 at 4:57 PM Johan Jonker <jbx6244@gmail.com> wrote:
> >>
> >> Hi Chen-Yu,
> >>
> >>> From: Chen-Yu Tsai <wens@csie.org>
> >>>
> >>> With SDIO now enabled, the numbering of the existing MMC host controllers
> >>> gets incremented by 1, as the SDIO host is the first one.
> >>>
> >>> Increment the numbering of the MMC LED triggers to match.
> >>>
> >>> Fixes: cf3c5397835f ("arm64: dts: rockchip: Enable sdio0 and uart0 on rk3399-roc-pc-mezzanine")
> >>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts | 8 ++++++++
> >>>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi          | 4 ++--
> >>>  2 files changed, 10 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> >>> index 2acb3d500fb9..f0686fc276be 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> >>> @@ -38,6 +38,10 @@ vcc3v3_pcie: vcc3v3-pcie {
> >>>       };
> >>>  };
> >>>
> >>> +&diy_led {
>
> >>> +     linux,default-trigger = "mmc2";
>
> If you decide to use a free form trigger that is not a 'standard' one,
> then it becomes a user property.
> User defined properties should not go in a generic dts.
> It's up to the user what function he/she gives to that led!

The original (in the base .dtsi file for this series of boards) trigger
is already a non-standard, i.e. not listed in the bindings, one.

Now I would very much like to get rid of user specific stuff, and I
also mentioned that in the previous round of discussions. No one said
anything.

> >>> +};
> >>> +
> >>>  &pcie_phy {
> >>>       status = "okay";
> >>>  };
> >>> @@ -91,3 +95,7 @@ &uart0 {
> >>>       pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
> >>>       status = "okay";
> >>>  };
> >>> +
> >>> +&yellow_led {
> >>> +     linux,default-trigger = "mmc1";
> >>> +};
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> >>> index 9f225e9c3d54..bc060ac7972d 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> >>> @@ -70,14 +70,14 @@ work-led {
> >>>                       linux,default-trigger = "heartbeat";
> >>>               };
> >>>
> >>
> >>> -             diy-led {
> >>> +             diy_led: diy-led {
> >>
> >> This changes an existing nodename into something that is still not the
>
> Correction:
> It takes an existing nodename and adds a label.

OK.

> >> preferred way. In the current Rockchip dts there are nodenames like
> >> 'work', 'yellow' that causing warnings with the command:
> >
> > This doesn't change the node name at all. It only adds a label.
> > If it doesn't pass the check now, it didn't pass the check before.
> >
> > I just realized that the footnote I added before is gone because I
> > regenerated the patches. The original footnote was something along
> > the lines of:
> >
> > I opted to not change the node names nor the labels as the discussion
> > had not concluded. The other reason being that people may have scripts
> > or device tree overlays depending on the existing node names.
> >
> > Previously I asked the following but got no response:
> >
> >     Is changing this after it has been in some kernel releases OK? Wouldn't
> >     it be considered a break of sysfs ABI?
> >
> >     Also, is there some guideline on how to name the labels? For sunxi we've
> >     been doing "${vendor}:${color}:${function}" since forever.
> >
> >     As far as I can tell, the hardware vendor [1] has no specific uses for
> >     these two (red and yellow) LEDs designed in. And their GPIO lines are
> >     simply labeled "DIY" (for the red one) and "YELLOW". So I'm not sure
> >     if putting "our" interpretations and the default-trigger into the
> >     label is wise.
> >
> >     For reference, the green one has its GPIO line labeled "WORK", and their
> >     intention from [1] is to have it as some sort of power / activity indicator.
> >     Hence it is named / labeled "work".
> >
> >     As for the node names, I think we can keep it as is for now. It's not
> >     the preferred form, but there's really no need to change it either.
> >     And some overlay or script might actually expect that name.
> >
> >> make -k ARCH=arm dtbs_check
> >>
> >> Could you give a generic guide line/example, so all these changes are
> >> treated the same way? As if the naming follows the preferred 'led-0' line.
> >
> > I'm not sure what you are asking for.
>
> Your nodename just happend to contain 'led' to pass the regex.
> There are many other names in use.

Right. So if it passes, what's the problem?

> 'If' the DT maintainer (=Heiko) decides the get rid of all the warnings
> for led nodes then that change would require all nodename to be handled
> to same (=preferred way):
>
> Change this:
>
> diy_led: diy-led
> yellow_led: yellow-led
>
> Into something like:
>
> led_0: led-0
> led_1: led-1

As I already said, if the maintainers want to clean this up, I am happy to
provide patches towards this. That is not the case right now. Furthermore,
that cleanup is not directly related to what I'm trying to fix in this
patch, which is, from the original submitter's point of view, incorrect
triggers are used when the mezzanine board is added.

Also, DT labels "led_0" and "led_1" are useless. They have no relation to
what is used in the schematics, which are "work", "diy", and "yellow". The
board itself doesn't have anything silk-screened on, so on that end the only
thing to go with is the color.

So for fixing up the LED node names, we'd probably want the following:

    diy_led: led-0
    yellow_led: led-1
    work_led: led-2

Is that what you're asking for?


ChenYu

> >
> > ChenYu
> >
> >>>                       label = "red:diy";
> >>>                       gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> >>>                       default-state = "off";
> >>>                       linux,default-trigger = "mmc1";
> >>>               };
> >>>
> >>> -             yellow-led {
> >>> +             yellow_led: yellow-led {
> >>>                       label = "yellow:yellow-led";
> >>>                       gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> >>>                       default-state = "off";
> >>> --
> >>> 2.26.0
> >>
>
