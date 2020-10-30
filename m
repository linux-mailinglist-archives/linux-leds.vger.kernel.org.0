Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DA12A00A0
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 10:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgJ3JBH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Oct 2020 05:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgJ3JBG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Oct 2020 05:01:06 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DF0C0613CF;
        Fri, 30 Oct 2020 01:51:51 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id y186so5960391oia.3;
        Fri, 30 Oct 2020 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EYFsizROf5nBI3vjm3lc9058B7pQE1IZ4TMUM0yjHO0=;
        b=nrNLVNGDC4oTXZzPTuj6ZR2IgS0RpSwQa6MzJT2M14RHlHusbs8N/KdjeQODIa69Fq
         ZdSQ2+n4cipmdbZwOOHTgWsz/9K9056sO7RK6KwOPOg+CNEjITywQSQxgEzCZVFDmooV
         HfjseyEiG122IWq13MGtUc3gpURvmvQ23oFXZkO5bAqMj/eti7fpL3VJlmHzrj8Pn0ul
         i804miWfazPue1rTOMFnYjkM6PYEAdPsvCvCHy1x0R06Zywbj8icMgN6LLZiNdHdDmN3
         TBV/YXettblZhpCdF0/9QtbjT4Td9+kE5uNNmlverT0JjOhrhQlVOJUhUeQjtTwsEBH6
         IsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EYFsizROf5nBI3vjm3lc9058B7pQE1IZ4TMUM0yjHO0=;
        b=np6zQhoEhZBwPw8HVpj1zcqWcN2YPjLlotfli4QdgX3N5Ei/gjPiWiT/6DsilXHCBQ
         9B3mFM2NPo6bLmHjRYQI6TO3ooyzp3zZ9A6ydiLZU93LuaZzjvZ5Oesc0heSnTtV62th
         dFaT2Z3ZgEPhQ5i6zqh6MTfFoAnz7OI8EmRFzrDUVK1sGsSKBv/JXor9Q12fKPMUdU2g
         oVJ+MF0oAKNgDmTlUFoARY1SHbKsVQpK3M+ex4Rv5iopdVqXWEuVrKrC2G0Yj4NT6/3a
         dHLNSyAOZ0XBNEx8SmWOnQDO8MJ902aEdsHXKPnYswwGzvxDnDPKSlxPbjHXdoh3npMn
         6RPQ==
X-Gm-Message-State: AOAM5329oAdMDbWI6jWDRe6MimL1pwIZeVTY4EGjVIzMc6KP+1Ljx3BG
        /SgEQbDOadQb2KXWohg6OSFtpofW9uzmargoxncxuPdtkXI=
X-Google-Smtp-Source: ABdhPJx9L8WP509ApHzlkJwOOPZ2gkvUW+8ERNKkSL/KG2e7sSxeTIuKtZ55i3auP6YV2QGpiqwTKhXntRWz+/14P6I=
X-Received: by 2002:aca:4c8d:: with SMTP id z135mr891137oia.23.1604047910543;
 Fri, 30 Oct 2020 01:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com> <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com> <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
 <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
In-Reply-To: <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Fri, 30 Oct 2020 16:51:38 +0800
Message-ID: <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=
=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:28=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 10/27/20 10:28 AM, Gene Chen wrote:
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=885:47=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>
> >> On 10/20/20 8:44 AM, Gene Chen wrote:
> >>> Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B4=
10=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:51=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>>>
> >>>> Hi Gene,
> >>>>
> >>>> On 10/7/20 3:42 AM, Gene Chen wrote:
> >>>>> From: Gene Chen <gene_chen@richtek.com>
> >>>>>
> >>>>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe=
 mode,
> >>>>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel=
 for
> >>>>> moonlight LED.
> >>>>>
> >>>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> >>>>> ---
> >>>>>     drivers/leds/Kconfig       |  12 +
> >>>>>     drivers/leds/Makefile      |   1 +
> >>>>>     drivers/leds/leds-mt6360.c | 783 ++++++++++++++++++++++++++++++=
+++++++++++++++
> >>>>>     3 files changed, 796 insertions(+)
> >>>>>     create mode 100644 drivers/leds/leds-mt6360.c
> >>>>>
> >>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>>>> index 1c181df..c7192dd 100644
> >>>>> --- a/drivers/leds/Kconfig
> >>>>> +++ b/drivers/leds/Kconfig
> >>>>> @@ -271,6 +271,18 @@ config LEDS_MT6323
> >>>>>           This option enables support for on-chip LED drivers found=
 on
> >>>>>           Mediatek MT6323 PMIC.
> >>>>>
> >>>>> +config LEDS_MT6360
> >>>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
> >>>>> +     depends on LEDS_CLASS_FLASH && OF
> >>>>> +     depends on LEDS_CLASS_MULTICOLOR
> >>>>
> >>>> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
> >>>> below instead:
> >>>>
> >>>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>
> My typo here, should be one "!":
>
> depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
>
> And you should also have
>
> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
>
> But to make it work correctly you would have to add registration
> stubs to include/linux/led-class-flash.h similarly to LED mc stubs
> in include/linux/led-class-multicolor.h.
>
> >>>>
> >>>> Unless you want to prevent enabling the driver without RGB LED,
> >>>> but that does not seem to be reasonable at first glance.
> >>>>
> >>>
> >>> May I change to "select LEDS_CLASS_MULTICOLOR"?
> >>> I suppose RGB always use multicolor mode.
> >>
> >> You will also have moonlight LED that will not need multicolor
> >> framework. Is it somehow troublesome to keep "depends on"?
> >>
> >
> > If only use ML LED and FLED,  DTSI will only define ML LED and FLED.
> > Therefore, the drivers probe will not register rgb multicolor device.
>
> Please test your use case again with my fixed "depends on".
>
> In case when there is only ML LED and FLED in the DT it should
> register both devices if LEDS_CLASS_FLASH is turned on.
> Multicolor framework has nothing to do in this case.
>
> But if you additionally had MC LED node, then it should
> be registered only if LEDS_CLASS_MULTICOLOR is enabled.
>
> Similarly, when FLED node is present, but LEDS_CLASS_FLASH
> is off, and LEDS_CLASS_MULTICOLOR is on, the driver should still
> compile, but register only LED MC device (if its node is present).
>

I think this case only register LED device, not LED "MC" device.
Because our FLASH is not a multicolor device.

> Possible should be also the case when both LEDS_CLASS_FLASH
> and LEDS_CLASS_MULTICOLOR are off. Then only LED class device
> for ML LED will be registered (provided there is ML DT node).
> But to make it possible you should have also "depends on LEDS_CLASS"
> in the Kconfig entry.
>

According to your suggestion,
depends on LED_CLASS && LEDS_CLASS_FLASH && OF
depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
depends on MFD_MT6360

and source code add constraint

#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR)
    ret =3D devm_led_classdev_multicolor_register_ext(parent, &led->rgb,
init_data);
#endif

#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
    ret =3D devm_led_classdev_flash_register_ext(parent, &led->flash, init_=
data);
#endif

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Or Should I seperate two drivers?
one for RGB LED, one for ML LED and FLED

> > I will remove "depends", use "select" instead.
>
> --
> Best regards,
> Jacek Anaszewski
