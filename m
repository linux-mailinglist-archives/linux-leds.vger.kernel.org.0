Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFDB45453B
	for <lists+linux-leds@lfdr.de>; Wed, 17 Nov 2021 11:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbhKQK4C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Nov 2021 05:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbhKQK4C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Nov 2021 05:56:02 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF6DC061570;
        Wed, 17 Nov 2021 02:53:03 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id o4so5452716oia.10;
        Wed, 17 Nov 2021 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wIIT6/ePIyMUBZgvwPlMAbfK34sVLGh7GgquvsLE084=;
        b=cSytHkCzD13jEuMPLeN1fKQZoR/1NY3pe/zNd5KzepItAPyUCztHvPyI/Bhm0FwBBP
         MSj+jfDd2fxU0th/ADKVbG2l09WgyUc/8UosqhaB6PtljhAHtAnpPuGUfI0mpJTLVbrZ
         n2CDYNwNZihCC5BKwmiFdamPVvUkm/xceZwZ1JRTbA0dlRn/g6s81oVQxxYmg6yR/uow
         eX2SDlMwz5u2bDwFhEWFJlhzqTDfAK7c0CpCsUz58qtbX/exHHflmqVLFUxGLtwK6UmX
         701WHdKsG5+f5o9/RU07CiAolx/W39PgpdPoOfG4WbelnlOwe9DyioY3z+gI3Yo9ZqUi
         VJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wIIT6/ePIyMUBZgvwPlMAbfK34sVLGh7GgquvsLE084=;
        b=Kv4rHmihqjgqQi24LUfGzi9P2kblIOiphGJ3HwUeMWa0EZtgBoT8hoHdooM36qliK8
         WkR3P+LnT7qvrV0l//UM7u5ODoT4wLhGupGjBbOcN4Wv93t7uuD7hp81GCutc4qQmtQo
         ZgN6XiTBLsr98/Rh1uGPamTalVZS8CoufChBpW3eU89aMmHRzGoQl/CxLiLSIhEahgmj
         L/pIhUGkRGYKl2XWyNAbsQ76WDNCRGjLv575+Y0dMiHVHdiNSlhN3zG1lQpUdSSWDLZ3
         bTf5Cdtn5QcG9dOnInChUi2S3hvKSYUyfr/873ldapCePC0N4eEgYp4o25yXkqXc+0QK
         qmUQ==
X-Gm-Message-State: AOAM530M3zdjBkZJKZielZPIFoelvXrWYeSYJ4M3qWLxKzYw1NAjgPZN
        rjjdZ7U2JRsnAoS4vCYDNZuPajim12zPowhuGMk=
X-Google-Smtp-Source: ABdhPJxlARpq3W7ryl+eHHGyYfKPeP0uoWKZGjdn3QYa+VuCU6DhRnPI/OTqygHbwGKYA4ZRJK0EPjK6nt7LBA+wRas=
X-Received: by 2002:aca:bb45:: with SMTP id l66mr13523131oif.51.1637146383235;
 Wed, 17 Nov 2021 02:53:03 -0800 (PST)
MIME-Version: 1.0
References: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Wed, 17 Nov 2021 18:52:52 +0800
Message-ID: <CAE+NS37eLbnTZtv5pO59XWrWVKEJEA+J8DE=H1NwZr+u71WwfQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Replace moonlight with indicator in
 mt6360 example
To:     cy_huang <u0084500@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, wilma.wu@mediatek.com,
        benjamin.chao@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

cy_huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B411=E6=9C=8817=E6=97=A5=
 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Replace moonlight with indicator in mt6360 example to prevent the below
> build error:
>
> Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114=
.24-25
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
> Error 1
>
> Link: https://lore.kernel.org/lkml/CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+s=
D3ukce_xQF+gA@mail.gmail.com/
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Hi, Gene:
>
> I saw you have removed LED_FUNCTION_MOONLIGHT in v14.
> But you may forget to remove it from the binding example.
>
> Please help to review this change.
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-mt6360.yaml
> index 2353155..b2fe6eb 100644
> --- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> @@ -133,7 +133,7 @@ examples:
>       };
>       led@3 {
>         reg =3D <3>;
> -       function =3D LED_FUNCTION_MOONLIGHT;
> +       function =3D LED_FUNCTION_INDICATOR;
>         color =3D <LED_COLOR_ID_WHITE>;
>         led-max-microamp =3D <150000>;
>       };
> --
> 2.7.4
>

Reviewed-by: Gene Chen <gene_chen@richtek.com>
Thanks
