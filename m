Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141CE2C1DEA
	for <lists+linux-leds@lfdr.de>; Tue, 24 Nov 2020 07:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbgKXGIc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Nov 2020 01:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729532AbgKXGIb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Nov 2020 01:08:31 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAA3C0613CF;
        Mon, 23 Nov 2020 22:08:31 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 11so5781209oty.9;
        Mon, 23 Nov 2020 22:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZoZU9eeGMyzNoZxXOK3ZAEdDwa+QPOxbaHh7UFCT0wc=;
        b=XU4lpBhv0aFJugQfK3M7VhAgUUnP7WAOSflhvzSNStfOtxkfRXCc33wrAtApXdxuZQ
         0+wviGLOV8JIq5EIbaOxmNue5mn9sLh+kZfbO8g3f0TCCgr2jKigT0nuuc45hcrtFTxu
         KZ+DM9mJxiyKuCSOOWccDSvGb8QlBXakSqTplL7bKxboHoQo8lI+LPpwgYZLCXS3anlJ
         BBsLrHs8tdWFbz6tPEvWlCBXYCdU/kujokGhWELriRgsaKcf/OT/aFgkZoX+N9y4Hz+t
         vitCLLvUCycIjOxCJx6Hj5G6AdT0achcPDXvBthueRW5QnPiMX2niAzlk/fWoHQISdkc
         4H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZoZU9eeGMyzNoZxXOK3ZAEdDwa+QPOxbaHh7UFCT0wc=;
        b=Ahy3KYSL9q0cpcYd1P6pXVbbd2n/RcK3DlOHHnnklBafgf1btjPH3f9nBdd7Nwueow
         yt5UV1aZTSHChDMkM2d1EUyWH9lFM2FmhziXrfcp0HIKO6Bc1rocp/rkUUH2fb+6Pmzu
         2fTXGdwqY4k03n8FH0YHMuwYlL+K4iQl+iZ5DjmSxA8BQBUqvG4D4a1oR1HiIWMGOsEw
         fDnh4L8sZLzQTmKqZqVXI+k5hosJ+tmcRGGHmmzbh8s7Yn5tcZTogQHVDk+/dMnAPkHE
         bphHFildR98wAr9zTm2zIHGqaZmW0orT171ztbh6SOaIQDcg/ZgOdfDyg8/7fmXGmV+s
         cp8w==
X-Gm-Message-State: AOAM530LqDz3vuqB1hNuDXZ7eBUS3M7EV7pNqFAyLtOKDtMa5oEJCXMV
        yuBPxBzEcwluHDfp0hJBwCdRtBNnMjjpx1FtPhg=
X-Google-Smtp-Source: ABdhPJxqWi0nnt7tIixUs46SG2tN319LJI4mJNVEAoecxwy6G+vIYHSn4lvL5dTmY6x9slv4vBfl76GjJMdINAew5y8=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr2342006otr.327.1606198110129;
 Mon, 23 Nov 2020 22:08:30 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
 <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com> <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
 <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
In-Reply-To: <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 24 Nov 2020 14:08:19 +0800
Message-ID: <CAE+NS36yU_ho5eV=j2rd36XqGXBKj3d8KP-bsrCCnWvxzV3Afw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
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

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=E6=
=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=885:07=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 11/23/20 4:20 AM, Gene Chen wrote:
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=
=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:29=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>
> >> Hi Gene,
> >>
> >> On 11/18/20 11:47 AM, Gene Chen wrote:
> >>> From: Gene Chen <gene_chen@richtek.com>
> >>>
> >>> Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
> >>>
> >>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> >>> ---
> >>>    include/linux/led-class-flash.h | 36 +++++++++++++++++++++++++++++=
+++++++
> >>>    1 file changed, 36 insertions(+)
> >>>
> >>> diff --git a/include/linux/led-class-flash.h b/include/linux/led-clas=
s-flash.h
> >>> index 21a3358..4f56c28 100644
> >>> --- a/include/linux/led-class-flash.h
> >>> +++ b/include/linux/led-class-flash.h
> >>> @@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_f=
lcdev(
> >>>        return container_of(lcdev, struct led_classdev_flash, led_cdev=
);
> >>>    }
> >>>
> >>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
> >>>    /**
> >>>     * led_classdev_flash_register_ext - register a new object of LED =
class with
> >>>     *                               init data and with support for fl=
ash LEDs
> >>> @@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_regist=
er(struct device *parent,
> >>>    void devm_led_classdev_flash_unregister(struct device *parent,
> >>>                                        struct led_classdev_flash *fle=
d_cdev);
> >>>
> >>> +#else
> >>> +
> >>> +static inline int led_classdev_flash_register_ext(struct device *par=
ent,
> >>> +                                 struct led_classdev_flash *fled_cde=
v,
> >>> +                                 struct led_init_data *init_data)
> >>> +{
> >>> +     return -EINVAL;
> >>
> >> s/-EINVAL/0/
> >>
> >> The goal here is to assure that client will not fail when using no-op.
> >>
> >>> +}
> >>> +
> >>> +static inline int led_classdev_flash_register(struct device *parent,
> >>> +                                        struct led_classdev_flash *f=
led_cdev)
> >>> +{
> >>> +     return led_classdev_flash_register_ext(parent, fled_cdev, NULL)=
;
> >>> +}
> >>
> >> This function should be placed after #ifdef block because its
> >> shape is the same for both cases.
> >>
> >>> +static inline void led_classdev_flash_unregister(struct led_classdev=
_flash *fled_cdev) {};
> >>> +static inline int devm_led_classdev_flash_register_ext(struct device=
 *parent,
> >>> +                                  struct led_classdev_flash *fled_cd=
ev,
> >>> +                                  struct led_init_data *init_data)
> >>> +{
> >>> +     return -EINVAL;
> >>
> >> /-EINVAL/0/
> >>
> >> Please do the same fix in all no-ops in the led-class-multicolor.h,
> >> as we've discussed.
> >>
> >
> > I think return -EINVAL is correct, because I should register flash
> > light device if I define FLED in DTS node.
>
> I don't quite follow your logic here.
>
> No-op function's purpose is to simplify the code on the caller's side.
> Therefore it should report success.
>
> Please return 0 from it.
>

Just like those functions in led-class-multicolor.h, caller may use
return value to check whether FLED is registered successfully or not.
For this case, is returning 0 a little bit misleading?

> --
> Best regards,
> Jacek Anaszewski
