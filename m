Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3565F293520
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 08:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404459AbgJTGoR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 02:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731178AbgJTGoR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 02:44:17 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6E7C061755;
        Mon, 19 Oct 2020 23:44:17 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id l85so1055085oih.10;
        Mon, 19 Oct 2020 23:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MFOC5MSfgXpVUcpJFvepm9LoCBUyxU58dQ3kENmA2dU=;
        b=rE9NI/S/p9SvnsP2ThZmuLSQCes4KW77g+ZROKqi9zQ4BRyD7j8L3qAXRGY48tDEXB
         DVCVdi+bIimBHadB2S37aNu3DzzFKphM/kG45PJO7l+kd734QFl9innU/HfWG6kCwDzw
         l0HKuSwIx5NEiJnNS2n4U3+DwbVgAhSFfhZpu0uVBWFRBFhlyr7NqU1bbxKl1z/H4UE4
         aTQrp+jajh0mCnsH8CIqNDg7aegBRdbhH6RCkCS4DxseTzhxvjECNzfp2VlQOgAJlpfi
         +uQdkC8pS6xfGU5wiOJx6m5loPyY7Kod6LTMdP+wf3Li0aORhXNL3t+aIHmZBz+TNE7M
         l/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MFOC5MSfgXpVUcpJFvepm9LoCBUyxU58dQ3kENmA2dU=;
        b=gzrUL3DU9akGnOGURI5LOulojmEGWYZ+wRQ+LrRReiDMwFV6UldrH1tTssugaPYxlo
         pnMZ6rnPaV29VdQ2NKedqf3oiO2XRXLezZ3E3hfF3EObBWbqC8WtfhYRR1mzxC6a/Aui
         5QcLfjXtULSaN4nMLndV9nwVmcx50alEiweqjx9n6SZ3ZHMZcNehthZdzODT/8QxMsmj
         vKpS6fusJqSBIrdftakgTpIobTgxxztq3+EnqsO+T9Om4ypvYAp9YVW5MA3ghj8S49F3
         fkDjoLyY8WNWIe7oiRydclNtRwwUnxw6cd559EA5++RBxE3JfGfARzVoqD4RqIbqvnff
         hmdg==
X-Gm-Message-State: AOAM530fvku6PPfer0rxD0JPhPJKDK3JmPOMIqu+gpmzW/9sj1f4ICV5
        b0mc2uddmSx9p5ohPjFkDGFgBw4B0j6dseqTjBM=
X-Google-Smtp-Source: ABdhPJzG7nn0LcryOMolANMp07rqbpB+dGxlfZixfoXAINNXhstjyOp90IJVHVwDvcF55dsz8L/CfOf3slRK9oAkKDo=
X-Received: by 2002:aca:518b:: with SMTP id f133mr920277oib.23.1603176256498;
 Mon, 19 Oct 2020 23:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com> <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
In-Reply-To: <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 20 Oct 2020 14:44:04 +0800
Message-ID: <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
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

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=
=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:51=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Gene,
>
> On 10/7/20 3:42 AM, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mod=
e,
> > 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> > moonlight LED.
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >   drivers/leds/Kconfig       |  12 +
> >   drivers/leds/Makefile      |   1 +
> >   drivers/leds/leds-mt6360.c | 783 ++++++++++++++++++++++++++++++++++++=
+++++++++
> >   3 files changed, 796 insertions(+)
> >   create mode 100644 drivers/leds/leds-mt6360.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 1c181df..c7192dd 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -271,6 +271,18 @@ config LEDS_MT6323
> >         This option enables support for on-chip LED drivers found on
> >         Mediatek MT6323 PMIC.
> >
> > +config LEDS_MT6360
> > +     tristate "LED Support for Mediatek MT6360 PMIC"
> > +     depends on LEDS_CLASS_FLASH && OF
> > +     depends on LEDS_CLASS_MULTICOLOR
>
> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
> below instead:
>
> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>
> Unless you want to prevent enabling the driver without RGB LED,
> but that does not seem to be reasonable at first glance.
>

May I change to "select LEDS_CLASS_MULTICOLOR"?
I suppose RGB always use multicolor mode.

> > +     depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > +     depends on MFD_MT6360
> > +     help
> > +       This option enables support for dual Flash LED drivers found on
> > +       Mediatek MT6360 PMIC.
> > +       Independent current sources supply for each flash LED support t=
orch
> > +       and strobe mode.
> > +
>
> --
> Best regards,
> Jacek Anaszewski
