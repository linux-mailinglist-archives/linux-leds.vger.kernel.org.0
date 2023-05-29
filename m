Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E65714532
	for <lists+linux-leds@lfdr.de>; Mon, 29 May 2023 09:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjE2HEq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 May 2023 03:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjE2HEp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2023 03:04:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934C7F3
        for <linux-leds@vger.kernel.org>; Mon, 29 May 2023 00:03:40 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3137920e87.2
        for <linux-leds@vger.kernel.org>; Mon, 29 May 2023 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1685343818; x=1687935818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktk43I3ESCcl+4luTfcpacoXkK0rOIgacSkU1dOgQfA=;
        b=EzVaURV3PRKZ1IXRJ20SKWyI2R3+cbBKjkEDiWxGuhXDEs4tYnYXxcmcG5TWdUw+q1
         JlEeNlM+mHBU7+DOoZqm+tBjhkOifHP1AsCo1tDsqPHHr/XlHBr9QoOqORH4P+lZw+5O
         dmHKET4mthkLuOTwi0yJJ+Mcz4uyXC4TIvQaAlE7AD0k5LaBcXXifSf8/pbPE7aUh26Z
         ZA3c8gDgyVhDf24nQQyh8Bf99q1L0NtrjfeBqJT+FQHgJO6VGJrqIFrJMCMnnVBA1KjI
         1HfSoT34FV/E0bjV7QblXJA1taCMNKAHRREduGMGSHwxb7KqkhCubTTC6w6jYdNcnJxf
         Erzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685343818; x=1687935818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktk43I3ESCcl+4luTfcpacoXkK0rOIgacSkU1dOgQfA=;
        b=kzp+8RMFqG3r3WnQ3A2uUAca1wUdBlEcfHoaZ7S5QPu6aOzURN6R2REJFPFZUFLlzh
         u+UZq6k8tkScH1mfqQ5/mpXSQrr83vEFqTd3dRXUY+jwZX6uL7/mINS9CmzgQ3wy0S7j
         ruhKuNvPqAijnuF8CXPxPSxn3rKeNn+TBlxF1woOSnT6jmWlGGi76G3YPHEyYHWtSgdW
         FgAE9ki+tgwFZVlOAioDlGRlrjrx7X2zMFBv68bZ8USV7+b2XeSBTcBt1CvmYefPYsNW
         YDFvQnvUlyIoN7P25GMef5PmI8f8b2X0PGn0p/pY06C6BddsGuK7m0KTVvZv3LxNhiSQ
         PN5Q==
X-Gm-Message-State: AC+VfDxLNtdipIb4lJJ3NTGC307W5Rweh+q5KWHNvCAJ/jRQGzdqyPIk
        zcfqC5Q7s7DDNlSdOU6Fn6nCikEqW3SgcRTJXDxRzg==
X-Google-Smtp-Source: ACHHUZ4VkOxh0fNxPG1zh86fdppD/WvIcYVQsx7Tso8mCQBz019IqnPTS//0K6ZRb1vNKJxSPmxN81F9XNk7zNJRGYk=
X-Received: by 2002:ac2:46d2:0:b0:4f1:3d7d:409e with SMTP id
 p18-20020ac246d2000000b004f13d7d409emr3772539lfo.0.1685343818417; Mon, 29 May
 2023 00:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230519200520.10657-1-alex@shruggie.ro> <20230519200520.10657-2-alex@shruggie.ro>
 <9faab8c9-a38b-3f06-c2fb-6c7803b22eb1@foss.st.com>
In-Reply-To: <9faab8c9-a38b-3f06-c2fb-6c7803b22eb1@foss.st.com>
From:   Alexandru Ardelean <alex@shruggie.ro>
Date:   Mon, 29 May 2023 10:03:27 +0300
Message-ID: <CAH3L5Qpo6j9XdpfY5dPbYM3prLRPbrFPODPubnaNqu_4pQeaow@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: backlight: document new property default-brightness-level
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
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 26, 2023 at 3:05=E2=80=AFPM Philippe CORNU
<philippe.cornu@foss.st.com> wrote:
>
>
>
> On 5/19/23 22:05, Alexandru Ardelean wrote:
> > From: Yannick Fertre <yannick.fertre@foss.st.com>
> >
> > Add documentation for new default-brightness-level property.
> >
> > Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
>
> Hi Alexandru,
> same comments as for the 1/2 patch.

Ack

Will do
Thanks
Alexandru

> Many thanks
> Philippe :-)
>
> > Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >
> > Link to original patch:
> >    https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa1=
4ffd49892c4ce663cdafe98
> >
> >   .../bindings/leds/backlight/gpio-backlight.yaml          | 9 ++++++++=
+
> >   1 file changed, 9 insertions(+)
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
> >       description: enable the backlight at boot.
> >       type: boolean
> >
> > +  default-brightness-level:
> > +    description:
> > +      The default brightness level (index into the array defined by th=
e
> > +      "brightness-levels" property).
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +dependencies:
> > +  default-brightness-level: [ "brightness-levels" ]
> > +
> >   required:
> >     - compatible
> >     - gpios
