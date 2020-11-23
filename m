Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D572BFE7D
	for <lists+linux-leds@lfdr.de>; Mon, 23 Nov 2020 04:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgKWDAV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Nov 2020 22:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgKWDAV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Nov 2020 22:00:21 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3B0C0613CF;
        Sun, 22 Nov 2020 19:00:19 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id f16so14588430otl.11;
        Sun, 22 Nov 2020 19:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X6ea8y+7o1VS2+hJJcwmIepII7pozzGa349DC5946o4=;
        b=O0bCyjkQ/bAlyYl/p3JN/CYCEM/L/vJ4GpfrG23A/z6KykNoJ0gli/NpFZQfNj+czP
         i0o0sQFjZ8RE/zL1dwgb1guZ56q5RD8nsTO0UvvMq751OO8OiGxqJGmY3SonCTQ5Lspn
         XYg6yJmsGkLWVLETDQprpFj4DNoJABK7ArAqKLW42zHl+xnpn/Bu7Jl4x/N17ilhzZwe
         +WJgrpCpIVAxxg+jOcLHmFvQ0OGa4ag0BSPCNfNWxztnDy2ZR3/vPrbEta1KIF+CuicY
         PhU93xVocYP8DlMNsSHS63hBpQhFIk79H4pGuTgLP9A/oooIGopj4i/hhUNDRA4Fq3V/
         WVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X6ea8y+7o1VS2+hJJcwmIepII7pozzGa349DC5946o4=;
        b=k4d8fmP/N+La4DkcKvKmm/I+ezxXIDTqE0ZEvOTTIlyZ819a4GF53Apgg8OEtexh4k
         SpEsLWLiY/MJlHrj++lm6AfhGPPQodteBOmsFR+KSsNzgw8hxvb/qO2G5YVILtcka65f
         US8CHqGyIwXCXRebh5Ibl2gEkSrgDJSyUvImn0z3MRk4aZlVnY4iEWm3xFRZHR0Yvg8X
         zOPuQPqOeBaV7njBj7p/PBlYEazKlHedywPEm/jYQ/GNo+a+fo368gRj784VIafudM8o
         WnOBvvkMe0yGBoAW4Bs+uIQAueltJmszGvjpBc6PmcOlRMwpWS2s/lYSrDl/Yf5KHQpR
         QS1g==
X-Gm-Message-State: AOAM530zh/xr9oxP31c2PVOphuzLvpu8LprlLOSUCUDh3PCWSsxHUHoM
        iFVVe5HxtHdGlRe0rpcbfaBuMsF9kCCtgs2S8Yc=
X-Google-Smtp-Source: ABdhPJxZjezUseMBEoGgj0Bb6+2zeayiCYTxLMkNBbkr2KfxEZ23lfObPxA14lZP64GdkYiIRfDnVIR4/Qm0SWsI+Vc=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr22787464otr.327.1606100418882;
 Sun, 22 Nov 2020 19:00:18 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
In-Reply-To: <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Mon, 23 Nov 2020 11:00:09 +0800
Message-ID: <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
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
=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:26=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 11/19/20 10:57 PM, Pavel Machek wrote:
> > On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
> >> Hi Pavel, Gene,
> >>
> >> On 11/18/20 10:37 PM, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>> From: Gene Chen <gene_chen@richtek.com>
> >>>>
> >>>> Add LED_COLOR_ID_MOONLIGHT definitions
> >>>
> >>> Why is moonlight a color? Camera flashes are usually white, no?
> >>>
> >>> At least it needs a comment...
> >>
> >> That's my fault, In fact I should have asked about adding
> >> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening.=
..
> >
> > Aha, that makes more sense.
> >
> > But please let's call it "torch" if we do that, as that is already
> > used in kernel sources... and probably in the interface, too:
>
> I'd say that torch is something different that moonlight,
> but we would need more input from Gene to learn more about
> the nature of light emitted by ML LED on his device.
>
> Please note that torch is usually meant as the other mode of
> flash LED (sometimes it is called "movie mode"), which is already
> handled by brightness file of LED class flash device (i.e. its LED class
> subset), and which also maps to v4l2-flash TORCH mode.
>

It's used to front camera fill light.
More brightness than screen backlight, and more soft light than flash.
I think LED_ID_COLOR_WHITE is okay.

> > ./arch/arm/mach-pxa/ezx.c:                      .name =3D "a910::torch"=
,
> >
> > Best regards,
> >                                                       Pavel
> >
>
> --
> Best regards,
> Jacek Anaszewski
