Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED48571452E
	for <lists+linux-leds@lfdr.de>; Mon, 29 May 2023 09:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjE2HDf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 May 2023 03:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjE2HDc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2023 03:03:32 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF04DA
        for <linux-leds@vger.kernel.org>; Mon, 29 May 2023 00:03:19 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f37b860173so3359068e87.2
        for <linux-leds@vger.kernel.org>; Mon, 29 May 2023 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1685343798; x=1687935798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYSmjUHKY13e/olgfNCe2jCtnFDy/mhRCAgKdXqqosc=;
        b=qQt0qUfGjmzTSnZ0DVjIHfM3Dz6z6pXCAgSw3KcgmtqPxppthlZqYCiFywwtPwNAT2
         hJNruzSJeHsISwuAjYUxtoZZP6EDSVvYqUXV3Z+VjYkmZDwacyEQTw4JItQBL38LThIe
         Rj0kAh0lYssXHSmIIW80Rt8szL+kdeEX4Bw/IdqWCXeZadudPPR9devrh3IwfKVSGjuK
         hOtN+g0wmjGlu4gCvMBM4OwD5996boLxO2E0vl+7vo1cpFQ1/3QIaVvy6TS5Bk0a3GFa
         iCyzwddv8vJRzibyFBfP+nJ1NnvlG8iycusk325s+0y+CHC7HTsEj32jterZVkQvqYe4
         fupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685343798; x=1687935798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYSmjUHKY13e/olgfNCe2jCtnFDy/mhRCAgKdXqqosc=;
        b=KYJCItmRjyUbmRRrT68EGjSG0K6aerfXcla3lmmvljsf78oxTJV1V6GDLUDg7GKDS2
         TBIOs2X+r2YyzoyAy9pEs/eRyAPp4C7Gs2qidOM75QqHONqzFZ4mYWiTi7QrXmci30Il
         W7vh+eclw3G5X1hI0/ex3RoeIaDNyW6KkXw08bx0tSHPlS6o/n/yUSAj3LNejL5seZiz
         +pDsJwytxe3sPiUA0ZAVmwSN/9YMJPfQN5dhoI9y+T3N1jZ7v5NZM/EjEnzhC+TlY2gy
         EE+MgiSV4RGEVUWl9Qbzl3QFKX/ZunNyWeaWq2iIFOjF4LChuV/ZBkzE4U55LPSgC4rM
         X6pw==
X-Gm-Message-State: AC+VfDwDfh1PPfler6x9iAPR1G2lYOh1kkjk7gE1qTs1PRBdG2s1MEoJ
        UhhToUcauuec6FGPV+AwC6ojDP980Y2lLSruwj45Sg==
X-Google-Smtp-Source: ACHHUZ5wC3rgKOLiDrLuAPCrJCUl5/yB6pE43oPiLauQYVLp4+RCulNBNMME5l03e12kJhRacmxRp/xSpacnqmp4pzQ=
X-Received: by 2002:ac2:5dfc:0:b0:4e8:44e3:f3da with SMTP id
 z28-20020ac25dfc000000b004e844e3f3damr3631341lfq.39.1685343797813; Mon, 29
 May 2023 00:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230519200520.10657-1-alex@shruggie.ro> <20230519200520.10657-2-alex@shruggie.ro>
 <20230526102032.GB626291@aspen.lan>
In-Reply-To: <20230526102032.GB626291@aspen.lan>
From:   Alexandru Ardelean <alex@shruggie.ro>
Date:   Mon, 29 May 2023 10:03:06 +0300
Message-ID: <CAH3L5QpPPhCZb5nzfAnunL1qP4Vw_xk_1ovNXaFixa8-aQ3QMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: document new property default-brightness-level
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, lee@kernel.org, jingoohan1@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        deller@gmx.de, Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 26, 2023 at 1:20=E2=80=AFPM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, May 19, 2023 at 11:05:20PM +0300, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add documentation for new default-brightness-level property.
> >
> > Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >   https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14=
ffd49892c4ce663cdafe98
> >
> >  .../bindings/leds/backlight/gpio-backlight.yaml          | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-back=
light.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backligh=
t.yaml
> > index 584030b6b0b9..b96c08cff0f0 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.y=
aml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.y=
aml
> > @@ -23,6 +23,15 @@ properties:
> >      description: enable the backlight at boot.
> >      type: boolean
> >
> > +  default-brightness-level:
> > +    description:
> > +      The default brightness level (index into the array defined by th=
e
> > +      "brightness-levels" property).
>
> gpio-backlight does not have a brightness-levels array property!
>
> I think it is also necessary to improve the docs of both properties to
> distinguish between the meaning of default-on and
> default-brightness-level. The result of setting default-on and
> default-brightness level to zero is that the GPIO will be off (this is
> correct behaviour but hard to figure out from the current text).
>
> default-on is a control that can "enable" the backlight at boot when it
> is not linked to a display in the DT (e.g. it is mostly for legacy
> cases). When the backlight is linked to a display then the backlight
> enable state will be automatically linked to the display enable state
> instead.
>
> default-brightness-level is useful for handling displays that
> are still readable with the backlight off (e-ink, reflective/
> transflexive LCD, etc), otherwise is should be absent or set to 1.

ack
will do in V2

thanks

>
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +dependencies:
> > +  default-brightness-level: [ "brightness-levels" ]
>
> As above, depending on brightness-levels doesn't make any sense here.
>
>
> Daniel.
