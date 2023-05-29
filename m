Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467B0714525
	for <lists+linux-leds@lfdr.de>; Mon, 29 May 2023 09:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjE2HCk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 May 2023 03:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjE2HCi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2023 03:02:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A692BA3
        for <linux-leds@vger.kernel.org>; Mon, 29 May 2023 00:02:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f4c264f6c6so3283731e87.3
        for <linux-leds@vger.kernel.org>; Mon, 29 May 2023 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1685343753; x=1687935753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJB5+P4xgPilKMJQyTk3eAPDV8GpHyt2fP+7h44nDNs=;
        b=FGhKiz8dBWwr9/+R+reQipeYxNB1gcmYsJ7bZbWgP8vpD+0Js4lgYwersF0bhlBFfx
         AoBv3t60BEjDsQ+//F6gNfJL7TKCuKtbj0JZY91qkazqTzob+IFBzGrNq5fvEJgkX67W
         y+qzGQyohlsogF2BSjAWqXcmUTFY4fEXNADyl2U7gc1c+xNSymu2Tu9tPcquM7DB6a6L
         riSRw20OAF0VAmq08GHr9Kr2aUzUiKiaI/5QFnc7BO7OqnJgspihpwvULSi1tTJvEBf/
         f24Gl6irXXG2dDmzNTQUJOdBeI0zsO6HQViONoOYQkZZs1g9+txWx4YM53xWgvRg43Os
         Z0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685343753; x=1687935753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJB5+P4xgPilKMJQyTk3eAPDV8GpHyt2fP+7h44nDNs=;
        b=fjOZtrlg4lVMr1bwK8oNgROEbp1YeoL4jO0Q2j3HdMTad3RoRCGjif4Xa+740sFJTk
         hZglkuQB5CUYMsef1GTUTP4weFVEF3TncvnCXqesE0mw9DCoHLsotrBsO8Kvvp+x3XAQ
         5dyamfz/SphZGK0as56jl5Bp6RQ3ESnY2XoCOyEs3dKrMjwomnZK/bOk1ggQBTZ15P4e
         1nbNI5ACCGTgTg3WzS0kvmAyCKP3O40HJs/ZtEwDca4xIdSUH+3+eaaM+sP2iRbbBUc6
         IYQcPG5mPGzzjCiI5oQL9E/6HUhxhI855M+OInf7NkSYlzqjRM0mqOvS0GFKMTTomVDE
         5Oww==
X-Gm-Message-State: AC+VfDx81BoJYMD7s7pU30XV+tPdLJ3zF2cA1Zt4Hfh+vEv+5hhcJhhF
        Ly17Ey4HoIxmFz0Eh/kalKyPxHYmM1Fs057kLE1zpg==
X-Google-Smtp-Source: ACHHUZ6dy/tVjeBZf9nbJfVYzPM3W/IXKBY1aEH8eswJWC6FweeAzZtsDZnpj8P70hH4TPm2Olzs1bvP+3NW6NNxhSE=
X-Received: by 2002:a05:6512:40b:b0:4f4:d710:12d4 with SMTP id
 u11-20020a056512040b00b004f4d71012d4mr3426221lfk.17.1685343752776; Mon, 29
 May 2023 00:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230519200520.10657-1-alex@shruggie.ro> <d7fc3df2-aae7-d3b2-ea29-14d266289d1d@foss.st.com>
In-Reply-To: <d7fc3df2-aae7-d3b2-ea29-14d266289d1d@foss.st.com>
From:   Alexandru Ardelean <alex@shruggie.ro>
Date:   Mon, 29 May 2023 10:02:21 +0300
Message-ID: <CAH3L5Qo51dVV_FsYTLKNcmYL5VbD+9S54VYuNbhZUunHOTi_aA@mail.gmail.com>
Subject: Re: [PATCH 1/2] backlight: gpio_backlight: add new property default-brightness-level
To:     Philippe CORNU <philippe.cornu@foss.st.com>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, deller@gmx.de,
        Yannick Fertre <yannick.fertre@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 26, 2023 at 3:04=E2=80=AFPM Philippe CORNU
<philippe.cornu@foss.st.com> wrote:
>
>
> On 5/19/23 22:05, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add new property to set a brightness by default at probe.
> >
> > Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
>
> Hi Alexandru,
>
> Many thanks for your patch.
>
> You have sent a patch originally pushed on the STMicroelectronics github
> as mentioned in your commit message (no problem with that :-). But, the
> "Reviewed-by" inside this github patch is linked to our gerrit STM
> internal server so you can not use it directly for mainlining this patch.
>
> So please, re-send your this patch without my "Reviewed-by".

ack
will do

>
> Many thanks
> Philippe :-)
>
>
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >    https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa1=
4ffd49892c4ce663cdafe98
> >
> >   drivers/video/backlight/gpio_backlight.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/b=
acklight/gpio_backlight.c
> > index 6f78d928f054..d3fa3a8bef4d 100644
> > --- a/drivers/video/backlight/gpio_backlight.c
> > +++ b/drivers/video/backlight/gpio_backlight.c
> > @@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_devic=
e *pdev)
> >       struct backlight_device *bl;
> >       struct gpio_backlight *gbl;
> >       int ret, init_brightness, def_value;
> > +     u32 value;
> >
> >       gbl =3D devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> >       if (gbl =3D=3D NULL)
> > @@ -93,7 +94,11 @@ static int gpio_backlight_probe(struct platform_devi=
ce *pdev)
> >       else
> >               bl->props.power =3D FB_BLANK_UNBLANK;
> >
> > -     bl->props.brightness =3D 1;
> > +     ret =3D device_property_read_u32(dev, "default-brightness-level",=
 &value);
> > +     if (!ret && value <=3D props.max_brightness)
> > +             bl->props.brightness =3D value;
> > +     else
> > +             bl->props.brightness =3D 1;
> >
> >       init_brightness =3D backlight_get_brightness(bl);
> >       ret =3D gpiod_direction_output(gbl->gpiod, init_brightness);
