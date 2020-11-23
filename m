Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495202BFEB0
	for <lists+linux-leds@lfdr.de>; Mon, 23 Nov 2020 04:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgKWDUO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Nov 2020 22:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgKWDUN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Nov 2020 22:20:13 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8A8C0613CF;
        Sun, 22 Nov 2020 19:20:13 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id 11so2104897oty.9;
        Sun, 22 Nov 2020 19:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rmUZ/LefwZKjwq5aooyNQE4MC8myDjdpN3Ckl6d1zcs=;
        b=oEv9koOsTJ2WOd46od2F9FFUSIWNHZbckGQwAdsWs4zZMift70bSlIYBmW6NcPSNFI
         XpztoiWYbYV4m3jqG/OSoeB49QZPVIVn1jiLAcm2csSnc4bHTOWrW8d453rNs0noabG2
         N9o/EKno/E5fZ+6BIt8xTEaw/LaiJtng4+KFNXdVeBgw6zS+hb6qvK+adFKA6sIt8QFx
         jlkzXUFzQYGTCQkjDv/FNFx2zTgvGDOeE7Gat+aUkF8/kdRpzB6wC1M6749W2c9E+2D3
         nneZ9pEgN3CQxCAfAxeHc+2iJk4t+dxHC7/BX/8RZXi3VcnoAF2F5Y6xD2e6y3z/QGlu
         5s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rmUZ/LefwZKjwq5aooyNQE4MC8myDjdpN3Ckl6d1zcs=;
        b=ToZQ+3B9i90jH7uyNGAjC0X3KspVDwxZWTHpWCJDouF7YS5YsebPhg8I/pmsNmplsF
         bASPKJ39pefGQsfpfvXJRG0I5UBZ/vPYKiaz4ME77fYYbzYKKNG3C6C3klZe9zVkiNh4
         x4clRNeyQ8IxPJZq9AUZBP5WrTsH1Mwd42YFqLR0jUuXUkGaUzBJjeB/rNzVpcfeRezJ
         1E7P4ZQ7TX6DKIx/gB9N4b2aj1NAUK8u4Cbznu9cW3Hyd/lBOS40swIqcPtfYJInDT5g
         ig5z+toyKDoVcZRjCbh3m2TycvhRnSdb61OXYv2pAklX4TGUuyW2APcd/E7Z6FYiBnCF
         yEeg==
X-Gm-Message-State: AOAM531Oh+DuLHrndtuvsquRNY8HOz6XHt4zJmcW1lUYMhpxBaFo88g2
        NYbHDf3QctRNefaZyO5nVqDLxJanNHuVHNWxzzwozvr3
X-Google-Smtp-Source: ABdhPJwmZ+yhrflagrOqYCRNj7dnimh/KjhNwCI/2kJH//K6O8faeNXSzM1EAjFZjsIHMzoNWnfnz6XIjOoFTw0qmLY=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr22827600otr.327.1606101613081;
 Sun, 22 Nov 2020 19:20:13 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com> <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
In-Reply-To: <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Mon, 23 Nov 2020 11:20:03 +0800
Message-ID: <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
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
=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:29=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Gene,
>
> On 11/18/20 11:47 AM, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >   include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++=
++++
> >   1 file changed, 36 insertions(+)
> >
> > diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-=
flash.h
> > index 21a3358..4f56c28 100644
> > --- a/include/linux/led-class-flash.h
> > +++ b/include/linux/led-class-flash.h
> > @@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flc=
dev(
> >       return container_of(lcdev, struct led_classdev_flash, led_cdev);
> >   }
> >
> > +#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
> >   /**
> >    * led_classdev_flash_register_ext - register a new object of LED cla=
ss with
> >    *                               init data and with support for flash=
 LEDs
> > @@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register=
(struct device *parent,
> >   void devm_led_classdev_flash_unregister(struct device *parent,
> >                                       struct led_classdev_flash *fled_c=
dev);
> >
> > +#else
> > +
> > +static inline int led_classdev_flash_register_ext(struct device *paren=
t,
> > +                                 struct led_classdev_flash *fled_cdev,
> > +                                 struct led_init_data *init_data)
> > +{
> > +     return -EINVAL;
>
> s/-EINVAL/0/
>
> The goal here is to assure that client will not fail when using no-op.
>
> > +}
> > +
> > +static inline int led_classdev_flash_register(struct device *parent,
> > +                                        struct led_classdev_flash *fle=
d_cdev)
> > +{
> > +     return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> > +}
>
> This function should be placed after #ifdef block because its
> shape is the same for both cases.
>
> > +static inline void led_classdev_flash_unregister(struct led_classdev_f=
lash *fled_cdev) {};
> > +static inline int devm_led_classdev_flash_register_ext(struct device *=
parent,
> > +                                  struct led_classdev_flash *fled_cdev=
,
> > +                                  struct led_init_data *init_data)
> > +{
> > +     return -EINVAL;
>
> /-EINVAL/0/
>
> Please do the same fix in all no-ops in the led-class-multicolor.h,
> as we've discussed.
>

I think return -EINVAL is correct, because I should register flash
light device if I define FLED in DTS node.

> > +}
> > +
> > +static inline int devm_led_classdev_flash_register(struct device *pare=
nt,
> > +                                  struct led_classdev_flash *fled_cdev=
)
> > +{
> > +     return devm_led_classdev_flash_register_ext(parent, fled_cdev, NU=
LL);
> > +}
>
>
> This function should also be placed after #ifdef block.
> Please make the same optimizations in the led-class-multicolor.h as you
> are at it.
>
> > +
> > +void devm_led_classdev_flash_unregister(struct device *parent,
>
> s/void/static inline void/
>
> That's the reason why you got warning from buildbot.
>

ACK

> > +                                     struct led_classdev_flash *fled_c=
dev)
> > +{};
> > +
> > +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
> > +
> >   /**
> >    * led_set_flash_strobe - setup flash strobe
> >    * @fled_cdev: the flash LED to set strobe on
> >
>
> --
> Best regards,
> Jacek Anaszewski
