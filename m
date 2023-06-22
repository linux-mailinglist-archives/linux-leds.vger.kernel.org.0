Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2772573A64A
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jun 2023 18:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjFVQn1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Jun 2023 12:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjFVQnW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Jun 2023 12:43:22 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC611FDF
        for <linux-leds@vger.kernel.org>; Thu, 22 Jun 2023 09:43:21 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-62fff19e8fdso4270806d6.1
        for <linux-leds@vger.kernel.org>; Thu, 22 Jun 2023 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687452201; x=1690044201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrONLN/REMiuQT2Yimaa69qiporYZStCugEiXaogr0Y=;
        b=HSI+RQ19TyKIFcVVeotYCRRwjmdvEvijNEdWnYgeoBvzAyyDQqcTNS4Euvmn0vJwPK
         vIwlL5OOTi3B51iGOW9voraG/N03EZKJoC6gVetjCzJCpiLucig3gNCE6uRUD0KkHmog
         MJgzJP9P5E10F1+aA03nhb2NY1KeXZQ+G0lrv1aONEOI/73o7w19QxVFEwmcQw9mZz/S
         ejbDyEh95GmBWbiUmUyi6yL0vy1Ng15jgPn9R8y7NxzxYVZCACXj3HetZOnp3buRWMVS
         0vIFK+PhcDMvnFZDLdwBDRDgq6wquSHg6Hn7FWoLVNLrifvUvcVTqVKgwEFwgGVIOyLy
         nMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687452201; x=1690044201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrONLN/REMiuQT2Yimaa69qiporYZStCugEiXaogr0Y=;
        b=NpPgzdEe3d1N/HTwwTtigdgUhx+8bYUg4LrIy9of+NiDOSwDuyGtgBwObtBIps0CGK
         IMeeQmDDd/CY2WqbUPiMrtmRoAL/gDqP6qax7POlGNllsTBtM7Y71i9GMUTb+OPcS8fa
         ePBExeqHTdwUi67qVVH6RCUJIaoS+udDVyI7KEjrFCLfsqCRwntw4XtqNbiatC8EseTW
         6r6c/o/MhnMVx5exk9WdrsNWMs85jHNwUGiKbs4cpf9IuX4YK8caYefJ9am+I27fHYDa
         2FqLlUTpvreY7h8VwOXjXLgjQCTw62x19f87t/gbfPYpIQbl5Kp4jcQyBrff8KaYWQyo
         4k7Q==
X-Gm-Message-State: AC+VfDxN1hb4AjsV9l18H1pYBdqNfFmzalbx7UhcZXOczR61YXpCVjf4
        xb6nsbpslwAkxXiaAG0Zs94VfLq4nlWvYBPq3tJRyA==
X-Google-Smtp-Source: ACHHUZ6BFvG2rG919DwPpwgfT8eIG2EtUWKeiSoeDrkEQmPSIYypWcVYxXU2D5Py2XFBNbLOMdPmAKQD10ZoCfvm4N0=
X-Received: by 2002:a05:6214:c64:b0:62d:ed86:154b with SMTP id
 t4-20020a0562140c6400b0062ded86154bmr17002515qvj.5.1687452200595; Thu, 22 Jun
 2023 09:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230622-mt6323-wled-wincompatible-function-pointer-types-strict-v1-1-6ad256f220e8@kernel.org>
In-Reply-To: <20230622-mt6323-wled-wincompatible-function-pointer-types-strict-v1-1-6ad256f220e8@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 22 Jun 2023 09:43:09 -0700
Message-ID: <CAKwvOd=jHrch4a-AZgXmScGKW2Fs4MHwH0iaW_8PgR=iYfvrEg@mail.gmail.com>
Subject: Re: [PATCH] leds: leds-mt6323: Adjust return/parameter types in wled
 get/set callbacks
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     lee@kernel.org, sean.wang@mediatek.com, pavel@ucw.cz,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        trix@redhat.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 22, 2023 at 9:12=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Clang's kernel Control Flow Integrity (kCFI) is a compiler-based
> security mitigation that ensures the target of an indirect function call
> matches the expected type of the call and trapping if they do not match
> exactly. The warning -Wincompatible-function-pointer-types-strict aims
> to catch these issues at compile time, which reveals:
>
>  drivers/leds/leds-mt6323.c:598:49: error: incompatible function pointer =
types assigning to 'int (*)(struct led_classdev *, enum led_brightness)' fr=
om 'int (struct led_classdev *, unsigned int)' [-Werror,-Wincompatible-func=
tion-pointer-types-strict]
>    598 |                         leds->led[reg]->cdev.brightness_set_bloc=
king =3D
>        |                                                                 =
     ^
>    599 |                                                 mt6323_wled_set_=
brightness;
>        |                                                 ~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>  drivers/leds/leds-mt6323.c:600:40: error: incompatible function pointer =
types assigning to 'enum led_brightness (*)(struct led_classdev *)' from 'u=
nsigned int (struct led_classdev *)' [-Werror,-Wincompatible-function-point=
er-types-strict]
>    600 |                         leds->led[reg]->cdev.brightness_get =3D
>        |                                                             ^
>    601 |                                                 mt6323_get_wled_=
brightness;
>        |                                                 ~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>  2 errors generated.
>
> While 'unsigned int' is ABI compatible with 'enum led_brightness' (hence
> no warning from -Wincompatible-function-pointer-types) and the callers
> of these callbacks use/pass the values as 'unsigned int', the mismatch
> between the prototype and the called function will trip kCFI at runtime.
>
> Change the types in the implementations to match the prototypes, clearing
> up the warning and avoiding kCFI failures.
>
> Fixes: 9bb0a9e0626c ("leds: leds-mt6323: Add support for WLEDs and MT6332=
")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch! Consider additionally having
mt6323_get_wled_brightness return LED_OFF rather than 0 in its
ternary.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


> ---
>  drivers/leds/leds-mt6323.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
> index e8fecfc2e90a..24f35bdb55fb 100644
> --- a/drivers/leds/leds-mt6323.c
> +++ b/drivers/leds/leds-mt6323.c
> @@ -76,7 +76,7 @@ struct mt6323_led {
>         int                     id;
>         struct mt6323_leds      *parent;
>         struct led_classdev     cdev;
> -       unsigned int            current_brightness;
> +       enum led_brightness     current_brightness;
>  };
>
>  /**
> @@ -451,7 +451,7 @@ static int mtk_wled_hw_off(struct led_classdev *cdev)
>         return 0;
>  }
>
> -static unsigned int mt6323_get_wled_brightness(struct led_classdev *cdev=
)
> +static enum led_brightness mt6323_get_wled_brightness(struct led_classde=
v *cdev)
>  {
>         struct mt6323_led *led =3D container_of(cdev, struct mt6323_led, =
cdev);
>         struct mt6323_leds *leds =3D led->parent;
> @@ -471,7 +471,7 @@ static unsigned int mt6323_get_wled_brightness(struct=
 led_classdev *cdev)
>  }
>
>  static int mt6323_wled_set_brightness(struct led_classdev *cdev,
> -                                     unsigned int brightness)
> +                                     enum led_brightness brightness)
>  {
>         struct mt6323_led *led =3D container_of(cdev, struct mt6323_led, =
cdev);
>         struct mt6323_leds *leds =3D led->parent;
>
> ---
> base-commit: 7bd932d9adbcc5c5370d968bdb0b00385606bf3a
> change-id: 20230621-mt6323-wled-wincompatible-function-pointer-types-stri=
ct-334f06d92ffb
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers
