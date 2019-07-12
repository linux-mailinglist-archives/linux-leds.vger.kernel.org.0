Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E87806711C
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jul 2019 16:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfGLOPp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Jul 2019 10:15:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42896 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfGLOPp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jul 2019 10:15:45 -0400
Received: by mail-oi1-f196.google.com with SMTP id s184so7364966oie.9
        for <linux-leds@vger.kernel.org>; Fri, 12 Jul 2019 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+xhY1iQZVADsG6bDZXcD0RjT9azsZsVbqRi0ICVvP/s=;
        b=Wt1CmtcUHGYfAhNuacvPQtYHgOUNbxMHcAtlD+9SmhDPnHOtX3Y3oRth38vThfFe7f
         NNauXdEa3y4Q8ZNGu1fjNEokl6kX26XeqEC62WrboHLVkh+6lVM5Ppzx+1JjOF5SbJdl
         R+PO8zg5ZAmUp1/voNlqJuJj8zGW2aaDhPt2yCllnnrgL+i4GxzKb3fISudZMoKXqTcL
         fFZchiadqvoljW7Ft6HOO2m3zJUeMbNYy93VeBP+TouZTYGv0WtiwHCVboczDTI0hgwh
         dds82pFJgcI0LjRhyG2RLTJ3Vw3VyT+TUCvCCMbNmiErtVr0tc2fOS1tagvmdInlfEfO
         na7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+xhY1iQZVADsG6bDZXcD0RjT9azsZsVbqRi0ICVvP/s=;
        b=PjwMJIDA/InoZ0QceFN0hOTncraaDtcNfg1PBmkogC2Ly2akJyeSuqssCZ+pHs2x8L
         7pq4zyajh9XQ7ih2C9izKzTqg6PXWp62xVAR4R2vyVyj/QOqT8eYrt3w/2hcvbcVykSc
         3xO/TODKc8SC90NL6Puz2YU2g2q015CILnxpKrb/lBQsqgjt555rxy9BcvKqzRVq4DTX
         nUMIDNtsbgRpEKdvIQ1CPMrj5xu3snQrTTWaVUz9fJhAtPsYZYORRgFJwivFx04bwwJ9
         3ihPmfGXI5YgNslJX848N9UxrIAXT24kzWoOD4Cb1ac+wH/QGEyd4LR4EeHT4sfkZcOY
         LsQQ==
X-Gm-Message-State: APjAAAXRoSB0T7pWtAp8R+xVKjY/Ua5faVApnWDaG9z2sY11eHmBaLAb
        mYYVBQuacz1ndNwPT3hdTAg5bVU5a6mdAUiCShPmxmks
X-Google-Smtp-Source: APXvYqzZ6aTD0cmbNiLp6OKrw8bHCv3oUOm/V/sZopvnrsB2tyeYyrj1M3px+0Z/uqF57iIPuHsrWWD5bCK9bg4zr/0=
X-Received: by 2002:a05:6808:f:: with SMTP id u15mr6213795oic.21.1562940944231;
 Fri, 12 Jul 2019 07:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190711074402.12257-1-nishkadg.linux@gmail.com> <20190711075405.12634-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190711075405.12634-1-nishkadg.linux@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Jul 2019 16:15:33 +0200
Message-ID: <CAMpxmJX_be51b7cTbuoBdA-pn37XbunYm13zdPVZt1rk4afYEA@mail.gmail.com>
Subject: Re: [PATCH v3] leds: max77650: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

czw., 11 lip 2019 o 09:54 Nishka Dasgupta <nishkadg.linux@gmail.com> napisa=
=C5=82(a):
>
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak.
> Hence create a new label, err_node_put, which puts the previous node and
> returns variable rv. Modify the mid-loop return statements to instead
> store the return value in rv and jump to err_node_put.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
> Changes in v3:
> - Add change log.
> Changes in v2:
> - Change subject line to match previous patches on the same file.
> - Merge the of_node_put calls into a single call in a label at the end
>   of the function instead of calling it separately for each return
>   statement.
>
>  drivers/leds/leds-max77650.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
> index 6b74ce9cac12..1eb9998899e4 100644
> --- a/drivers/leds/leds-max77650.c
> +++ b/drivers/leds/leds-max77650.c
> @@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *=
pdev)
>
>         for_each_child_of_node(of_node, child) {
>                 rv =3D of_property_read_u32(child, "reg", &reg);
> -               if (rv || reg >=3D MAX77650_LED_NUM_LEDS)
> -                       return -EINVAL;
> +               if (rv || reg >=3D MAX77650_LED_NUM_LEDS) {
> +                       rv =3D -EINVAL;
> +                       goto err_node_put;
> +               }
>
>                 led =3D &leds[reg];
>                 led->map =3D map;
> @@ -109,8 +111,10 @@ static int max77650_led_probe(struct platform_device=
 *pdev)
>                 } else {
>                         led->cdev.name =3D devm_kasprintf(dev, GFP_KERNEL=
,
>                                                         "max77650:%s", la=
bel);
> -                       if (!led->cdev.name)
> -                               return -ENOMEM;
> +                       if (!led->cdev.name) {
> +                               rv =3D -ENOMEM;
> +                               goto err_node_put;
> +                       }
>                 }
>
>                 of_property_read_string(child, "linux,default-trigger",
> @@ -118,20 +122,23 @@ static int max77650_led_probe(struct platform_devic=
e *pdev)
>
>                 rv =3D devm_of_led_classdev_register(dev, child, &led->cd=
ev);
>                 if (rv)
> -                       return rv;
> +                       goto err_node_put;
>
>                 rv =3D regmap_write(map, led->regA, MAX77650_LED_A_DEFAUL=
T);
>                 if (rv)
> -                       return rv;
> +                       goto err_node_put;
>
>                 rv =3D regmap_write(map, led->regB, MAX77650_LED_B_DEFAUL=
T);
>                 if (rv)
> -                       return rv;
> +                       goto err_node_put;
>         }
>
>         return regmap_write(map,
>                             MAX77650_REG_CNFG_LED_TOP,
>                             MAX77650_LED_TOP_DEFAULT);
> +err_node_put:
> +       of_node_put(child);
> +       return rv;
>  }
>
>  static struct platform_driver max77650_led_driver =3D {
> --
> 2.19.1
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
