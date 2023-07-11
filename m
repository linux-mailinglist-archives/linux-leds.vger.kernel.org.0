Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22A074E9ED
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jul 2023 11:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjGKJLK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jul 2023 05:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjGKJLJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jul 2023 05:11:09 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D149093;
        Tue, 11 Jul 2023 02:11:08 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992e22c09edso632931266b.2;
        Tue, 11 Jul 2023 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689066667; x=1691658667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bioKri3FQ7BeFO8IqI3ZyTSAGeYyZhMTZ6J/K92HGIk=;
        b=JrXZcwnd5VUv8aJGqdLl/X4EGBrtF8Silkcm4Tcb3Rd2vXTKqfQLiIyg5tOSRHqzHt
         ghmf1iN49bet1t7qMIQ2smKBHkb9NmWHrwCpLqJ9IQag+j3t9IuPTN/N+FkKvMvEIZ2r
         1luhtQDSCQGm4eUjDox36GBq5ISwsGIxTMFr+ykCrXuuIYJja83mDZWp2zXax26BPB5d
         zz0Rut2/v9ixn1WlD7FycYMvGxqNiYBlg26eFfCEiZldSuEa+vBh+EUoMtez4kxXLSzY
         NiRn5s6vm0MCmtnYmd/LSaA2++S2StZkK7O2yWsB06gRDNw+uK4b6b3FK7ijnLoGfYhd
         Enhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689066667; x=1691658667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bioKri3FQ7BeFO8IqI3ZyTSAGeYyZhMTZ6J/K92HGIk=;
        b=CS+8r1m0Gia7/b7NS2RBmJyJarNtYWoqCboFXhGbC28i55A6eHpnh5hno0UND9ZoV+
         +Wy95dZO6mwK0UMXSnMil4z84M19EqvXS412wClz61tclafme4m0vwTo4nSefisl8ZUS
         ClrJs+hSOwQcrVSXPl714sLB3G9+1KtWoZUUiFNK7N4DIJDtQvCuIzDOjjrEVS+NeNrr
         XiiHokVq7HPZ8sxshIFXmp0Z1979XvX9ElWPsrSnEg1aknFRXu5VDL82MVyuNXA5Tikd
         dSwmPOIcdFlwDN1lrrOneIJaqe5Bxhm68wJp1sR1iYnjY050ttsdGTJEdQd5rifg0xhY
         o3oQ==
X-Gm-Message-State: ABy/qLZ6YMal2i8rvS7EHenz1aUFhXbuWArAoBXBNUlvcMR2cMarOqtA
        ApzSRERn1zDY8N2063a0vL+EobNtmg1AeexHClU=
X-Google-Smtp-Source: APBJJlEvNuzxCogxlN5fdUm0lDfNCY5Dedbo7XssM41cv2Alx0x6Th28VZDmPQPr74DtYlS9E7VjEcr+f1TA6YV80Xc=
X-Received: by 2002:a17:906:d965:b0:98e:1c4b:10bb with SMTP id
 rp5-20020a170906d96500b0098e1c4b10bbmr15300197ejb.35.1689066667179; Tue, 11
 Jul 2023 02:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <a33b981a-b2c4-4dc2-b00a-626a090d2f11@moroto.mountain>
In-Reply-To: <a33b981a-b2c4-4dc2-b00a-626a090d2f11@moroto.mountain>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jul 2023 12:10:31 +0300
Message-ID: <CAHp75VeOGs8zyJpq_ZFQtm+yuS9HKev+o-=xkdmaROPD7KEu-w@mail.gmail.com>
Subject: Re: [PATCH] leds: pwm: Fix error code in led_pwm_create_fwnode()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jul 11, 2023 at 9:13=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Negative -EINVAL was intended, not positive EINVAL.  Fix it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

> Fixes: 95138e01275e ("leds: pwm: Make error handling more robust")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/leds/leds-pwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 29194cc382af..87c199242f3c 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -146,7 +146,7 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
>                         led.name =3D to_of_node(fwnode)->name;
>
>                 if (!led.name) {
> -                       ret =3D EINVAL;
> +                       ret =3D -EINVAL;
>                         goto err_child_out;
>                 }
>
> --
> 2.39.2
>


--=20
With Best Regards,
Andy Shevchenko
