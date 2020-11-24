Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F652C200F
	for <lists+linux-leds@lfdr.de>; Tue, 24 Nov 2020 09:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbgKXIcu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Nov 2020 03:32:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730476AbgKXIcu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Nov 2020 03:32:50 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2E3C0613CF;
        Tue, 24 Nov 2020 00:32:50 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id y24so13053979otk.3;
        Tue, 24 Nov 2020 00:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Q2PJe5i+0yyqNpuz8z7kTzoUZGPUVSZ0K1hVFCIENc=;
        b=EJEK4my6XgGJ/dD2WIbE+x9yKt34U2S0NfxAtf5UDkh51GwKec1scrVlUnkhzirfpj
         ACu7SVoyXDQ3dn20K1VkpyaZKTiy4KM7d/rgkjoXnlhXcokGAHw0Te0SbpYyWJ1gk4xP
         pbfS9bVFHR6ywMivsTXNTXKwimCbOTWnR6PELgCQlrVA7fVXMLUU22SBxBFwxOIGSE7H
         f1AJUIhUs0ENqLK5yEeNQ3WIrEG2JvAclEr5sFeqKhVN2BKnc8pxyvb1qawpYvBhoKaM
         QcZ1GS9W/IsKJGOBBDbZDHIdqQWwks9p35WVKUxD5lJSr56hJQ2nRIeqsXbVnT9uzxl/
         wwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Q2PJe5i+0yyqNpuz8z7kTzoUZGPUVSZ0K1hVFCIENc=;
        b=gddak34R2v4AGETcF4KL1/PVRmJYt1lYSrr50cRoniWywTHGaRQMKuDe3+gtozSfu9
         97Jy/2KONs23IlB1r7kHWSju2P57voxytKdTBahVvG+6790JIGFcpHaceFefc3lEDW0h
         iSaKc3WAK+bi8nPjwiJ4wrptVKAjUU53nLrnhslpu6LDbfcwjzld+HVe2HZNtWpUsD0Q
         6tbdXFPzhwdVH40Kk12KAtSInZf3Hpj5lJD8CbD/woU0z2lsmA6F157L6uspavaL6x+t
         BH1paaLoqZHyVR1F5puMWs2b4m+yvcueO0bYFpEytUikYmU3tNjR2r4CshBLOCuyr6mF
         SrZA==
X-Gm-Message-State: AOAM533yDrW6WbwOOg3YKc0HdJlnVTMMgOG/RggR0hWOOPDvT4cOEJCr
        BpWjJV+5aViiuhJPVoOv7+vcu5rWZmtUjKeyKog=
X-Google-Smtp-Source: ABdhPJxV3Rl2vkNvuvxyPEAKWiZ7f5Gc/SAbQGhC5bCF06tKppvMDBbCfOiBqV/xmGcTl3wCltcJ1C9xb6fCvvAH6bo=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr2645011otr.327.1606206769728;
 Tue, 24 Nov 2020 00:32:49 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
 <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com> <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
In-Reply-To: <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 24 Nov 2020 16:32:40 +0800
Message-ID: <CAE+NS34-oU3FnfBsHD3W+z-4QNr3LgnEjXhDbNrVf+KJg_bDEw@mail.gmail.com>
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

Fix Typo.

Gene Chen <gene.chen.richtek@gmail.com> =E6=96=BC 2020=E5=B9=B411=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:33=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=
=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:52=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >
> > On 11/23/20 4:00 AM, Gene Chen wrote:
> > > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B4=
11=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:26=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > >>
> > >> On 11/19/20 10:57 PM, Pavel Machek wrote:
> > >>> On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
> > >>>> Hi Pavel, Gene,
> > >>>>
> > >>>> On 11/18/20 10:37 PM, Pavel Machek wrote:
> > >>>>> Hi!
> > >>>>>
> > >>>>>> From: Gene Chen <gene_chen@richtek.com>
> > >>>>>>
> > >>>>>> Add LED_COLOR_ID_MOONLIGHT definitions
> > >>>>>
> > >>>>> Why is moonlight a color? Camera flashes are usually white, no?
> > >>>>>
> > >>>>> At least it needs a comment...
> > >>>>
> > >>>> That's my fault, In fact I should have asked about adding
> > >>>> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that even=
ing...
> > >>>
> > >>> Aha, that makes more sense.
> > >>>
> > >>> But please let's call it "torch" if we do that, as that is already
> > >>> used in kernel sources... and probably in the interface, too:
> > >>
> > >> I'd say that torch is something different that moonlight,
> > >> but we would need more input from Gene to learn more about
> > >> the nature of light emitted by ML LED on his device.
> > >>
> > >> Please note that torch is usually meant as the other mode of
> > >> flash LED (sometimes it is called "movie mode"), which is already
> > >> handled by brightness file of LED class flash device (i.e. its LED c=
lass
> > >> subset), and which also maps to v4l2-flash TORCH mode.
> > >>
> > >
> > > It's used to front camera fill light.
> > > More brightness than screen backlight, and more soft light than flash=
.
> > > I think LED_ID_COLOR_WHITE is okay.
> >
> > So why in v6 you assigned LED_COLOR_ID_AMBER to it?
> >

we suppose Moonlight can be white or amber.

> > Regardless of that, now we're talking about LED function - you chose
> > LED_FUNCTION_INDICATOR for it, but inferring from your above descriptio=
n
> > - it certainly doesn't fit here.
> >
> > Also register names, containing part "ML" indicate that this LED's
> > intended function is moonlinght, which your description somehow
> > corroborates.
> >
> > Moonlight LEDs become ubiquitous nowadays so sooner or later we will
> > need to add this function anyway [0].
> >
> > [0]
> > https://landscapelightingoakville.com/what-is-moon-lighting-and-why-doe=
s-it-remain-so-popular/
> >
>
> According to reference,
> "When you are trying to imitate moonlight you need to use low voltage,
> softer lighting. You don=E2=80=99t want something that=E2=80=99s too brig=
ht"
> which is focus on brightness instead of color.
>
> So we suppose Moonlight can be white or amber.
>
> Should I add LED_FUNCTION_MOONLIGHT and set LED_COLOR_ID_WHITE?
>
> > --
> > Best regards,
> > Jacek Anaszewski
