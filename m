Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6245173B137
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jun 2023 09:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjFWHUZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 23 Jun 2023 03:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjFWHUS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Jun 2023 03:20:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EF52683
        for <linux-leds@vger.kernel.org>; Fri, 23 Jun 2023 00:20:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so1846914e87.0
        for <linux-leds@vger.kernel.org>; Fri, 23 Jun 2023 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1687504809; x=1690096809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImZnIaT63i6HYM9TPUGnMEDuzzS3iTPlc0kdGdrlb5A=;
        b=3Yhpu9WhcwMjEy5oQYEaH2RAw8HdPk8Sv/n2Q8JSF6EqCQEVVxXprA1frXJEgGN1U9
         hVOp0nvyddcDIqhQ50PyHfp5iFb75PLHASG4IVuZCJ4BPUW2/hgLHtYRZokHtp6ol4lI
         +G8YXJ22ryzI8Piz96B/lLyl2J0Nd44LIkFaMAAd3oKphqY+ZSFbEhJt1XzFVZlGZO/+
         mGi5MoKNowW0VaLuUZnrEkoAUeVt2ccKfKi7aiTIU5hUYtQISqtl1oPMM7WPKTeWKfFd
         s9J5O34Z2RnllHP+kfAoFIyyOoWvAD7s/rSkz4XT08y9TKiJbr/7fc72bOACPdS21NgY
         KuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687504809; x=1690096809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImZnIaT63i6HYM9TPUGnMEDuzzS3iTPlc0kdGdrlb5A=;
        b=UNXLNWC1VIETHI8mQAQjNIcF8SaImp/4/ic61DqNwB0fw3WmKERJu8BvIK24WGdF/n
         WbocVFEZ88+jYXPe6QeVibor8whxO6lhVjQ1zYZEFtXg4mw2WS2f6HWC7yuBhTL0Qjkf
         p0dvaCZf4biX9NA0/r+4bCfiVYDazoZKoRskOTgFxvqrUvKrwkhXUDw8J/rYRvOXof4c
         3A+l/1CtgFI5wESEVJCvixG+WQhMo3TmUoJr/W2za92aXOspYwVxxgYxM2vloZFA9ceq
         H4yK4HroVihrR9+Q8onNSmdlNefc/EiG8KJz4VbTfy2tW+lQjFm6Ulxs57ul1/I5s2Qb
         KB8g==
X-Gm-Message-State: AC+VfDyWd9CeFSkNz36hVs3y1Ahumamvc7TvSPxIXPfP3cluP+/S69q2
        PLuiiszGz0lNn7FdGaj0saMMsTmZ+eZfgF2pAmL1rw==
X-Google-Smtp-Source: ACHHUZ4bflw+9FBpnbPDHod6ikRPIK3fJONA4szxg89SYbr1d0RYYS1tjPE/1SywatKL1fnzbFURrYMfl8Iwm3F9A30=
X-Received: by 2002:ac2:4e0a:0:b0:4f6:56ca:36fc with SMTP id
 e10-20020ac24e0a000000b004f656ca36fcmr9407801lfr.6.1687504808812; Fri, 23 Jun
 2023 00:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230621215457.11297-1-alex@shruggie.ro> <20230622021303.GA68330-robh@kernel.org>
In-Reply-To: <20230622021303.GA68330-robh@kernel.org>
From:   Alexandru Ardelean <alex@shruggie.ro>
Date:   Fri, 23 Jun 2023 10:19:57 +0300
Message-ID: <CAH3L5Qp3q=K5w+LbccZBJqvkz98WgFLqg__y7Be_=-2GsWQs+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: document new property default-brightness-level
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        deller@gmx.de, Yannick Fertre <yannick.fertre@foss.st.com>
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

On Thu, Jun 22, 2023 at 5:13=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Jun 22, 2023 at 12:54:56AM +0300, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add documentation for new default-brightness-level property.
>
> Why?

I'll admit, I liked the fact that the "default-brightness-level" is
more uniform in the space of backlights.
The "default-on" property is more specific to the gpio-backlight driver.
And then there's gpio hogging that could also work.

>
> >
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >   https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14=
ffd49892c4ce663cdafe98
> >
> > Changelog v1 -> v2:
> > * https://lore.kernel.org/dri-devel/20230519200520.10657-2-alex@shruggi=
e.ro/
> > * removed 'brightness-levels' reference
> > * updated doc-text for 'default-brightness-level'
> > * updated doc-text for 'default-on'
> > * added 'minimum' & 'maximum' to 'default-brightness-level' property
> > * removed 'Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>' as
> >   requested
> > * patch is first in series of 2 patches (was second patch)
> >
> >  .../bindings/leds/backlight/gpio-backlight.yaml    | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-back=
light.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backligh=
t.yaml
> > index 584030b6b0b9..2da6552a207c 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.y=
aml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.y=
aml
> > @@ -20,9 +20,21 @@ properties:
> >      maxItems: 1
> >
> >    default-on:
> > -    description: enable the backlight at boot.
> > +    description:
> > +      The default power state of the backlight at boot.
> >      type: boolean
> >
> > +  default-brightness-level:
> > +    description:
> > +      The default brightness level on device init. The value can be 0 =
or 1.
> > +      If omitted, the value is 1. In the context of the "gpio-backligh=
t" driver
> > +      the effect of this setting will be that the backlight is on/off.
> > +      The difference between this setting and "default-on" is that thi=
s handles
> > +      brightness, while "default-on" handles the power setting of the =
device.
>
> What power setting? You only have 1 GPIO to control here which is 2
> states. I fail to see why you need 6 possible states with all the
> combinations of 2 properties.

So, the "default-on" bool gets converted to backlight power settings,
which eventually gets converted back to GPIO values (at some point).
Which sounds quirky (when saying/writing it).

But, yeah.
That's one thing that also made me a bit undecided to send this.
On the one hand I like the uniformity it brings.
On the other hand, because there is the legacy behavior (the
"default-on" property, and the fact that we can use the GPIO DT
settings to control this) just explodes complexity/quirks.

We can probably just drop this.
I'll also admit that my doc-writing skills aren't too great.

Thanks
Alex

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 1
> > +
> >  required:
> >    - compatible
> >    - gpios
> > --
> > 2.40.1
> >
