Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EE22C1EED
	for <lists+linux-leds@lfdr.de>; Tue, 24 Nov 2020 08:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgKXHdx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Nov 2020 02:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728934AbgKXHdx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Nov 2020 02:33:53 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BB6C0613CF;
        Mon, 23 Nov 2020 23:33:52 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id y74so9427268oia.11;
        Mon, 23 Nov 2020 23:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KKRM9jTf5nSJd59wAkauAXklVp5cT6v6o379KchKHvM=;
        b=jeip3wVPozHymCziewDWg3eWSaxaRVyXd+LKi1graaO9ONwLpqo5ecMwhEtGPw99V3
         IzS9HuNtTFQ+q5p9UsRp7rRUesDybSBLjvsVTROA1c73C0+nLxlShnCKznBEWyoMc1iI
         6plsKOQuQL9W/PGM7q7/4HpWIdEbYlHtyg65bnKgKUWClcXw4B9azE5ccn+ahfOJMqO3
         pSMlMEmxHgJdp/OzoCfduaFszVd9t5mqPPDKVPKoIOl9OqdiV/VHtEdQcfLTa2MuDsMH
         h9NWBsQ5BH5acg2gvhjoiEzxZ3C6TxRZMU0qU45UOdKwLzPek4zTOLJErrKS04EVB/H6
         ymUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KKRM9jTf5nSJd59wAkauAXklVp5cT6v6o379KchKHvM=;
        b=f7gFQ2I+mt2IRR3/F/EHQZ9f8kaFf9mzw9Zr7ANBaiIR5vmp4uT5XWnF4PPQAxezkT
         YFqdE0kGjlojzhxd7tKjkq99V5rwhhVhWh9bCyd5Wyq+Wz+vPGNfEMMvQKDhgJxWMAqw
         r420wc5terKYhrI0lLWwXWXbP/YTOXGhvL5UxpiNZgybFt2DY2fy1Ky6gybpZ3XW4XH2
         IsyPkWcyLaLAiJZpGiGCaRT1UVE7JzLUWKuSG71IE01wRfEZX2uv9PWpEotG4oygWca5
         q0snIMnSDxE/PL8Uqik6jb+ItxKEcIHe24Ls4cj79mNQM+xJudrEg2pUNH1uBYT5e3gw
         Gg1g==
X-Gm-Message-State: AOAM533XM7FrCzAkPk6vMBwDBovuUW740+kRuXXFWOkQf84UMmqv9yr2
        6RPDeMzqMkc+qgMe/Hrg4cy5qOYX/zIU/fBFr/s=
X-Google-Smtp-Source: ABdhPJxa1iV5tDEv3/kW7lm9TC/hZGVpHgpwrvtGKtIBec0//BiHzGgBa4Zwe1/6Ash6iLnYIrY7mkFnhBJRdlOR4j4=
X-Received: by 2002:aca:c209:: with SMTP id s9mr1790607oif.55.1606203232139;
 Mon, 23 Nov 2020 23:33:52 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com> <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
In-Reply-To: <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 24 Nov 2020 15:33:42 +0800
Message-ID: <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
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
=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:52=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 11/23/20 4:00 AM, Gene Chen wrote:
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=
=E6=9C=8820=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=886:26=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>
> >> On 11/19/20 10:57 PM, Pavel Machek wrote:
> >>> On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
> >>>> Hi Pavel, Gene,
> >>>>
> >>>> On 11/18/20 10:37 PM, Pavel Machek wrote:
> >>>>> Hi!
> >>>>>
> >>>>>> From: Gene Chen <gene_chen@richtek.com>
> >>>>>>
> >>>>>> Add LED_COLOR_ID_MOONLIGHT definitions
> >>>>>
> >>>>> Why is moonlight a color? Camera flashes are usually white, no?
> >>>>>
> >>>>> At least it needs a comment...
> >>>>
> >>>> That's my fault, In fact I should have asked about adding
> >>>> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evenin=
g...
> >>>
> >>> Aha, that makes more sense.
> >>>
> >>> But please let's call it "torch" if we do that, as that is already
> >>> used in kernel sources... and probably in the interface, too:
> >>
> >> I'd say that torch is something different that moonlight,
> >> but we would need more input from Gene to learn more about
> >> the nature of light emitted by ML LED on his device.
> >>
> >> Please note that torch is usually meant as the other mode of
> >> flash LED (sometimes it is called "movie mode"), which is already
> >> handled by brightness file of LED class flash device (i.e. its LED cla=
ss
> >> subset), and which also maps to v4l2-flash TORCH mode.
> >>
> >
> > It's used to front camera fill light.
> > More brightness than screen backlight, and more soft light than flash.
> > I think LED_ID_COLOR_WHITE is okay.
>
> So why in v6 you assigned LED_COLOR_ID_AMBER to it?
>
> Regardless of that, now we're talking about LED function - you chose
> LED_FUNCTION_INDICATOR for it, but inferring from your above description
> - it certainly doesn't fit here.
>
> Also register names, containing part "ML" indicate that this LED's
> intended function is moonlinght, which your description somehow
> corroborates.
>
> Moonlight LEDs become ubiquitous nowadays so sooner or later we will
> need to add this function anyway [0].
>
> [0]
> https://landscapelightingoakville.com/what-is-moon-lighting-and-why-does-=
it-remain-so-popular/
>

We use term "Moonlight" as reference says
"When you are trying to imitate moonlight you need to use low voltage,
softer lighting. You don=E2=80=99t want something that=E2=80=99s too bright=
"
which is focus on brightness instead of color.

So we surpose Moonlight can be white or amber.

Should I add LED_FUNCTION_MOONLIGHT and set LED_COLOR_ID_WHITE?

> --
> Best regards,
> Jacek Anaszewski
