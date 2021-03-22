Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA85343E7F
	for <lists+linux-leds@lfdr.de>; Mon, 22 Mar 2021 11:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhCVKyu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Mar 2021 06:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhCVKyf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Mar 2021 06:54:35 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79CAEC061574;
        Mon, 22 Mar 2021 03:54:35 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id i81so11080139oif.6;
        Mon, 22 Mar 2021 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4btGnEyoNuVChZYQdjnSeuZUMKkjapFAE1UjjfFOhXg=;
        b=AXSN3tkM/O+AP8mifoDYebSrDhypdDFA9bIsFvE5KVjYYFhKewHRdSrP2xlEH338Ye
         B5IsGT7pdRwi5OhPQV7ac884568cL/y2GFCGxYTn2VF8nKhN4kPr4P90UQktyRQSiSdC
         lGFPjEETdE3WM9X+q7HbQp1xem8xk+qNsA+H4K7l6F/mdPAY54I8k7Airj4adsZq6hd2
         X1etzfzBj459ebL2L46klon9a2hc9n7ldemCwGtKKuJgc6M50qANR21zXDWY8PklcKDk
         MVzSZGANIzKVZmTLcqGUnbypNtZDlT4vNa1Wl5TIAZIE9f3CBn/FGZrv/XkfrRc9gLY1
         0MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4btGnEyoNuVChZYQdjnSeuZUMKkjapFAE1UjjfFOhXg=;
        b=QqIZYEb/uca2TKuvShb6Ehxg6iYKmvUUQ8c+R4zg5CgqzExfDi7XR2dT1BDB7o93ZH
         kDTc5dXhdm3uJDefLJsEBsH/d8Tym+rn+IpCLEuN/RCbvcLT9Q1pOOmBtJNu1OycdoEf
         aAheLcDd7WeFRuYbIYLgJEr/GVHu+EuQDtL9B7NogLGloTj6V4dzh9+IWeKz+vyDQgr3
         LexTRoWQBGkQOcFR1e8jVKvag7f8cre0Zvq1LbUd25Q65rGpglRRSZDCQs39qP3LDU7S
         ZVDoP9uHT5AA+Khu5w+WgsIwP0rqo+0jow9OeuffKygqfaY6Ko8MiCOfKXetjuU2e0NA
         P9lg==
X-Gm-Message-State: AOAM533pC/QkWESfghyxAzXhVFUs/3b6QkNI/Pb1dllUDJ0cpordvcX5
        ZDZlOmLg+Jc0h1h7INA4VBW7m9L0I4Fl2MGfvpo=
X-Google-Smtp-Source: ABdhPJxiyHeNB8axrMRnudukjDpmAsBj09fDs/WjMXObgtI2684KhRJG7sNOZQx2D4NZTsnAJZgIPi138fY+Ik+P+O4=
X-Received: by 2002:a05:6808:14c8:: with SMTP id f8mr9860256oiw.55.1616410474915;
 Mon, 22 Mar 2021 03:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
 <20210219104724.GC19207@duo.ucw.cz> <CAE+NS36NvH-s_UOR8RUZA_gd+FUZ5oLqb=n0s41dSMYWDn9DnA@mail.gmail.com>
In-Reply-To: <CAE+NS36NvH-s_UOR8RUZA_gd+FUZ5oLqb=n0s41dSMYWDn9DnA@mail.gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Mon, 22 Mar 2021 18:54:23 +0800
Message-ID: <CAE+NS37XOgRotVTBLeFtbLYEksRydOLBHdCfMH9fTFNZ5J+2Dw@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gene Chen <gene.chen.richtek@gmail.com> =E6=96=BC 2021=E5=B9=B43=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:08=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Pavel Machek <pavel@ucw.cz> =E6=96=BC 2021=E5=B9=B42=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:47=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi!
> >
> > > From: Gene Chen <gene_chen@richtek.com>
> > >
> > > Add LED_FUNCTION_MOONLIGHT definitions
> > >
> > > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> >
> > No, sorry, I don't believe we need another define for flash/torch.
> >
>
> As previous discuss,
> > We use term "Moonlight" as reference says
> > "When you are trying to imitate moonlight you need to use low voltage,
> > softer lighting. You don=E2=80=99t want something that=E2=80=99s too br=
ight"
> > which is focus on brightness instead of color.
>
> If any concern about this change, maybe we use LED_FUNCTION_INDICATOR ins=
tead?
> (refs: https://lkml.org/lkml/2020/11/24/1267)

Is there any update?

> > Best regards,
> >                                                                 Pavel
> > --
> > http://www.livejournal.com/~pavelmachek
