Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642E61B9F9B
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 11:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgD0JRc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 05:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:55482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726815AbgD0JRc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 05:17:32 -0400
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0E8D2075B;
        Mon, 27 Apr 2020 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587979051;
        bh=0JQfGwBPW8HjbVmB+3oeIbQiiUMVtZ8rLy7VFh6Z++Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wFnNaMz3e85JoZrGYy0P3ue0v6+HWvyEG+x7gf1XtsPRx/14qvkvLyidqZmrJYh6y
         3DybE5nYwAfsVLsbXy3YYIMf+hXIL9+GrYq/BJ3WR7bPiIbl/l0eUDDEG2tbIp/xPN
         iWK73XUxIvpIbvyfbZJ6KyHK00ORj++O9r87ap1g=
Received: by mail-lf1-f47.google.com with SMTP id m2so13175365lfo.6;
        Mon, 27 Apr 2020 02:17:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuY0NPHUTg0GmRmwD8bmGA4C7/JaP4JdS+mECHgEWecX9IC8VJpp
        o1XDpxQwZ5AtLUgnoRFZW4hkRf8CYpy0cHJ3KkA=
X-Google-Smtp-Source: APiQypJtNE14qxYJUDlD1WTj8JHtL5qxZwtuov5fG7rWvNuBd12rJqXBM0FEM99dbe7wu5CMLVlzgmD7014xwvl4734=
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr14131057lfp.4.1587979048894;
 Mon, 27 Apr 2020 02:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200427073132.29997-3-wens@kernel.org> <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
In-Reply-To: <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 27 Apr 2020 17:17:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
Message-ID: <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
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

On Mon, Apr 27, 2020 at 4:57 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > With SDIO now enabled, the numbering of the existing MMC host controllers
> > gets incremented by 1, as the SDIO host is the first one.
> >
> > Increment the numbering of the MMC LED triggers to match.
> >
> > Fixes: cf3c5397835f ("arm64: dts: rockchip: Enable sdio0 and uart0 on rk3399-roc-pc-mezzanine")
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts | 8 ++++++++
> >  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi          | 4 ++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> > index 2acb3d500fb9..f0686fc276be 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
> > @@ -38,6 +38,10 @@ vcc3v3_pcie: vcc3v3-pcie {
> >       };
> >  };
> >
> > +&diy_led {
> > +     linux,default-trigger = "mmc2";
> > +};
> > +
> >  &pcie_phy {
> >       status = "okay";
> >  };
> > @@ -91,3 +95,7 @@ &uart0 {
> >       pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
> >       status = "okay";
> >  };
> > +
> > +&yellow_led {
> > +     linux,default-trigger = "mmc1";
> > +};
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> > index 9f225e9c3d54..bc060ac7972d 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> > @@ -70,14 +70,14 @@ work-led {
> >                       linux,default-trigger = "heartbeat";
> >               };
> >
>
> > -             diy-led {
> > +             diy_led: diy-led {
>
> This changes an existing nodename into something that is still not the
> preferred way. In the current Rockchip dts there are nodenames like
> 'work', 'yellow' that causing warnings with the command:

This doesn't change the node name at all. It only adds a label.
If it doesn't pass the check now, it didn't pass the check before.

I just realized that the footnote I added before is gone because I
regenerated the patches. The original footnote was something along
the lines of:

I opted to not change the node names nor the labels as the discussion
had not concluded. The other reason being that people may have scripts
or device tree overlays depending on the existing node names.

Previously I asked the following but got no response:

    Is changing this after it has been in some kernel releases OK? Wouldn't
    it be considered a break of sysfs ABI?

    Also, is there some guideline on how to name the labels? For sunxi we've
    been doing "${vendor}:${color}:${function}" since forever.

    As far as I can tell, the hardware vendor [1] has no specific uses for
    these two (red and yellow) LEDs designed in. And their GPIO lines are
    simply labeled "DIY" (for the red one) and "YELLOW". So I'm not sure
    if putting "our" interpretations and the default-trigger into the
    label is wise.

    For reference, the green one has its GPIO line labeled "WORK", and their
    intention from [1] is to have it as some sort of power / activity indicator.
    Hence it is named / labeled "work".

    As for the node names, I think we can keep it as is for now. It's not
    the preferred form, but there's really no need to change it either.
    And some overlay or script might actually expect that name.

> make -k ARCH=arm dtbs_check
>
> Could you give a generic guide line/example, so all these changes are
> treated the same way? As if the naming follows the preferred 'led-0' line.

I'm not sure what you are asking for.

ChenYu

> >                       label = "red:diy";
> >                       gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> >                       default-state = "off";
> >                       linux,default-trigger = "mmc1";
> >               };
> >
> > -             yellow-led {
> > +             yellow_led: yellow-led {
> >                       label = "yellow:yellow-led";
> >                       gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> >                       default-state = "off";
> > --
> > 2.26.0
>
