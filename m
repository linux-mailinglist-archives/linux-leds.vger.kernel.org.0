Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13972B4065
	for <lists+linux-leds@lfdr.de>; Mon, 16 Nov 2020 11:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgKPKBh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Nov 2020 05:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgKPKBh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2020 05:01:37 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B251C0613CF;
        Mon, 16 Nov 2020 02:01:37 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id c80so18197489oib.2;
        Mon, 16 Nov 2020 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mF19ZwIo780m+wantWBq442Gr3sYDvkJbbMnqZkJcqk=;
        b=Sbn5b/vWMuIEheE9SnWl+WiNU7+9gR8hzT7MVsE1rOGoF9NhdcHWCiJbPyOLqBhvnc
         R5OsDZiwk0ehiZmQfaHm/A7yqhZRsPNIZ02HSGqbjc5TGP9arSxalYOcvyQ4Ndrd15Us
         RNtqPVlAFD+c0+NAvUXluQkLSYvgho/BI00U7fcvp5HnZCAMXYr0GGvYuFjDEmkct1gT
         lsgfIVJ0nmg5+pA4fCA4FyHCKxRjINPaDGgAnfoK+C9nHy7E0jJlLDxL9xwaOQzlbjd/
         VGzZPF7lpR7SUaA9MN/jU0+amcBELWc8lquSLwVr+D8LiJB2eVRN1FmVnE5S8e3/kiYZ
         8SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mF19ZwIo780m+wantWBq442Gr3sYDvkJbbMnqZkJcqk=;
        b=WYHCFEZvUocSL2hVBfu8ILa9OhwzQv17Jz/lJIY39n2Ny0+jkgyiD2qqgkZ2qpa/Br
         eQ3cw/++UCVN87GpoR+p52YxWDT4PcyyMgL82Q6GEkRONaGTFe7B0k+xYahS+xqkd4sg
         KWWl0ZslHzE+XUNFo0YGxQbhP6Sm6Rx4vtO9/S573e1YWJ0KYFPNDpFr/3rfuublJ8k6
         ADX07sphVIP+FQ7YMHLJz6yIOqpIoHdMTMZH0JV9aG776L0BwE1xqP3uARhyhCC/8xo1
         kkytlVqEOlJKkyHoRKxxsflkJG2FbvGh2CodnjWD/lxJdlmwZ25oVsQXZljVMnmZcK30
         qDzw==
X-Gm-Message-State: AOAM53036vJNrMMWNri5bLcwZPvnMk0DOfPiNCkd3ww0eqvMwV4lyqG8
        5f5dl/a8BZhGQxzENN6kbyrwfkYcVk38uNjipeJm2xU/oi0=
X-Google-Smtp-Source: ABdhPJyfEXXi/wTtDJZuiEyBKNQI545S2UU5krCd+c/8mhVnTifSZ4aiQ1TsqAL+nTv6lZmY1GSf68+zI1sopsfuyRM=
X-Received: by 2002:aca:4783:: with SMTP id u125mr9490525oia.23.1605520896546;
 Mon, 16 Nov 2020 02:01:36 -0800 (PST)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com> <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com> <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
 <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com> <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
 <af17141f-23ae-063d-ade2-42dfdf611d81@gmail.com>
In-Reply-To: <af17141f-23ae-063d-ade2-42dfdf611d81@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Mon, 16 Nov 2020 18:01:24 +0800
Message-ID: <CAE+NS37-vQ4LLbCv-1+WsLe7qEQdVvBhhNKK4=oDj5VtWuaeoQ@mail.gmail.com>
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
=9C=8831=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=886:34=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 10/30/20 9:51 AM, Gene Chen wrote:
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=
=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:28=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>
> >> On 10/27/20 10:28 AM, Gene Chen wrote:
> >>> Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B4=
10=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=885:47=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >>>>
> >>>> On 10/20/20 8:44 AM, Gene Chen wrote:
> >>>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=
=B410=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:51=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >>>>>>
> >>>>>> Hi Gene,
> >>>>>>
> >>>>>> On 10/7/20 3:42 AM, Gene Chen wrote:
> >>>>>>> From: Gene Chen <gene_chen@richtek.com>
> >>>>>>>
> >>>>>>> Add MT6360 LED driver include 2-channel Flash LED with torch/stro=
be mode,
> >>>>>>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-chann=
el for
> >>>>>>> moonlight LED.
> >>>>>>>
> >>>>>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> >>>>>>> ---
> >>>>>>>      drivers/leds/Kconfig       |  12 +
> >>>>>>>      drivers/leds/Makefile      |   1 +
> >>>>>>>      drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++=
++++++++++++++++++
> >>>>>>>      3 files changed, 796 insertions(+)
> >>>>>>>      create mode 100644 drivers/leds/leds-mt6360.c
> >>>>>>>
> >>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>>>>>> index 1c181df..c7192dd 100644
> >>>>>>> --- a/drivers/leds/Kconfig
> >>>>>>> +++ b/drivers/leds/Kconfig
> >>>>>>> @@ -271,6 +271,18 @@ config LEDS_MT6323
> >>>>>>>            This option enables support for on-chip LED drivers fo=
und on
> >>>>>>>            Mediatek MT6323 PMIC.
> >>>>>>>
> >>>>>>> +config LEDS_MT6360
> >>>>>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
> >>>>>>> +     depends on LEDS_CLASS_FLASH && OF
> >>>>>>> +     depends on LEDS_CLASS_MULTICOLOR
> >>>>>>
> >>>>>> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to ha=
ve
> >>>>>> below instead:
> >>>>>>
> >>>>>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
> >>
> >> My typo here, should be one "!":
> >>
> >> depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> >>
> >> And you should also have
> >>
> >> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> >>
> >> But to make it work correctly you would have to add registration
> >> stubs to include/linux/led-class-flash.h similarly to LED mc stubs
> >> in include/linux/led-class-multicolor.h.
> >>
> >>>>>>
> >>>>>> Unless you want to prevent enabling the driver without RGB LED,
> >>>>>> but that does not seem to be reasonable at first glance.
> >>>>>>
> >>>>>
> >>>>> May I change to "select LEDS_CLASS_MULTICOLOR"?
> >>>>> I suppose RGB always use multicolor mode.
> >>>>
> >>>> You will also have moonlight LED that will not need multicolor
> >>>> framework. Is it somehow troublesome to keep "depends on"?
> >>>>
> >>>
> >>> If only use ML LED and FLED,  DTSI will only define ML LED and FLED.
> >>> Therefore, the drivers probe will not register rgb multicolor device.
> >>
> >> Please test your use case again with my fixed "depends on".
> >>
> >> In case when there is only ML LED and FLED in the DT it should
> >> register both devices if LEDS_CLASS_FLASH is turned on.
> >> Multicolor framework has nothing to do in this case.
> >>
> >> But if you additionally had MC LED node, then it should
> >> be registered only if LEDS_CLASS_MULTICOLOR is enabled.
> >>
> >> Similarly, when FLED node is present, but LEDS_CLASS_FLASH
> >> is off, and LEDS_CLASS_MULTICOLOR is on, the driver should still
> >> compile, but register only LED MC device (if its node is present).
> >>
> >
> > I think this case only register LED device, not LED "MC" device.
> > Because our FLASH is not a multicolor device.
>
> No, here I was describing following setup:
>
> - DT FLED node is present, CONFIG_LEDS_CLASS_FLASH is off
> - DT MC node is present, CONFIG_LEDS_CLASS_MULTICOLOR is on
>
> ML LED presence in DT is irrelevant in this case.
> It should be always registered if there is corresponding DT node
> and LEDS_CLASS is on.
>

As a long time discussion, we conclude some rules about MT6360 LED driver.
FLED is necessary, so Kconfig depends on LED_CLASS_FLASH
ML LED is optional, which is registered as led class device.
RGB LED can be either simple led class device or multicolor device,
which is decided in DT node
If Multicolor LED DT node is exist, it should be register multicolor
device success.
Maybe it is more specific to send a new patch?

Sample DT as below
LED "red" is simple led class device, LED "green&blue" is multicolor device=
s.
led@0 {
        reg =3D <0>;
        function =3D LED_FUNCTION_INDICATOR;
        color =3D <LED_COLOR_ID_RED>;
        led-max-microamp =3D <24000>;
};
led@6 {
        reg =3D <6>;
        function =3D LED_FUNCTION_INDICATOR;
        color =3D <LED_COLOR_ID_MULTI>;

        led@1 {
                reg =3D <1>;
                function =3D LED_FUNCTION_INDICATOR;
                color =3D <LED_COLOR_ID_GREEN>;
                led-max-microamp =3D <24000>;
        };
        led@2 {
                reg =3D <2>;
                function =3D LED_FUNCTION_INDICATOR;
                color =3D <LED_COLOR_ID_BLUE>;
                led-max-microamp =3D <24000>;
        };
};

> >
> >> Possible should be also the case when both LEDS_CLASS_FLASH
> >> and LEDS_CLASS_MULTICOLOR are off. Then only LED class device
> >> for ML LED will be registered (provided there is ML DT node).
> >> But to make it possible you should have also "depends on LEDS_CLASS"
> >> in the Kconfig entry.
> >>
> >
> > According to your suggestion,
> > depends on LED_CLASS && LEDS_CLASS_FLASH && OF
>
> s/LED_CLASS/LEDS_CLASS/
>
> And you have to remove LEDS_CLASS_FLASH from above line.
>
> > depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>
> s/!!LEDS_CLASS_MULTICOLOR/!LEDS_CLASS_MULTICOLOR/
>
> > depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> > depends on MFD_MT6360
>
> You will need V4L2_FLASH_LED_CLASS dependency as well, to avoid
> build break, when it is set to 'm'.
>
> To recap, following block of dependencies is required:
>
> depends on LEDS_CLASS && OF
> depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> depends on MFD_MT6360
>

LEDS_MT6360 depends on LEDS_CLASS_FLASH, and LEDS_CLASS_FLASH depends
on LEDS_CLASS
Is "depends on LEDS_CLASS" still needed?

> >
> > and source code add constraint
> >
> > #if IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR)
> >      ret =3D devm_led_classdev_multicolor_register_ext(parent, &led->rg=
b,
> > init_data);
> > #endif
> >
> > #if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
> >      ret =3D devm_led_classdev_flash_register_ext(parent, &led->flash, =
init_data);
> > #endif
>
> No, the guards should be in headers. That's why I recommended adding
> no ops for LED flash class registration functions in previous email.
>
> Please compare include/linux/led-class-multicolor.h and do similar
> changes in include/linux/led-class-flash.h.
>

ACK, I will submit a fixed patch about leds-class-flash.h.

By the way, if CONFIG_LED_CLASS_MULTICOLOR is not enabled and we don't
use #if IS_ENABLED,
according to led-class-multicolor.h return -EINVAL,
we will register multicolor device fail and cause probe fail.

> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Or Should I seperate two drivers?
> > one for RGB LED, one for ML LED and FLED
>
> This would incur unnecessary code duplication.
>
> --
> Best regards,
> Jacek Anaszewski
