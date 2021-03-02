Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44AB132B18E
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCCC2I (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835644AbhCBGJI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Mar 2021 01:09:08 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187C8C061756;
        Mon,  1 Mar 2021 22:08:28 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id z126so20876063oiz.6;
        Mon, 01 Mar 2021 22:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C19cOmvXJnbprBsxYo6fNevVqPz+le4Pn/VUf3uem0I=;
        b=Kf8td8+mDqzkq/7SM8w4qjPMc1KK311qIsXMdPIYdmOMgBC8UQY7XzByFqs70585hC
         iowVQmK4mlLCr2eXf5FvDUk+calrVOUsmVzUvIGfZolYMfqRS2VW0oDTqaK7fG9hjGM8
         hFwPoYRycK0XVZN76fiHHmuuN/ZUfqMrWzHYl/oVOCRY1gOeqBx2IfO2PeB4sT6T/kS3
         7eK27CO4mOLC0OAXXX6slJLssqTlr3MulWeYxeQVfmr97lDC4Hxwcpvdlj1SUYRvz8jH
         4wOoD091V6jKlkiTd9y82rxmHlT75iepJZIf0ZSJc3UYJ88H4pHdzC/l0+VcjYZwAVz0
         sxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C19cOmvXJnbprBsxYo6fNevVqPz+le4Pn/VUf3uem0I=;
        b=F2PkhTDdwyyA637ZseVOBo/M8v2bRiu6puMrskho5jXpiTOksDjmu9DBKHlfK4V5g5
         7ckHwOOSYYHNU41rzmLY3C5ZxV+PppPC3p23apttVkrR4SB1HjlbRVpApgPfbZ0D29XN
         IauXoWZ8BujhIOTCZJlK9ZSdHwpQQrmeAsMsg+lQI8/1WtHMEkXk3zTfOJeFhSzLofaI
         UdeUpFgkL1muCfkiEqQfktbZCiT0DURZIwkjP4ic4V5WXRoIrT6W9UlrLM2GGMpxziq6
         jwP8/gKSyf9syWfpRstWQK+mg/F0NEqXgGGpguJ4YbGiSoYv6Xo/gc7bvR6bVMjJHvtC
         Cjaw==
X-Gm-Message-State: AOAM533qSlxk2RT8YbetppZxkg3/Wjw+5aRMBrqLciggI5jdCwm/buuu
        ZQzoNTlmYQlDU/bWpdy4KwEiVQR/i1D+uyiWnAA=
X-Google-Smtp-Source: ABdhPJy8wziwmYMPu/9/w+eXOxWojzCtW8JGO//mmOEQX/Ss1bf0j5WQzo4DDP/cRs89vYzM7K15EQqJuFgdnHDH40E=
X-Received: by 2002:aca:4d55:: with SMTP id a82mr2086651oib.23.1614665307388;
 Mon, 01 Mar 2021 22:08:27 -0800 (PST)
MIME-Version: 1.0
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com> <20210219104724.GC19207@duo.ucw.cz>
In-Reply-To: <20210219104724.GC19207@duo.ucw.cz>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 2 Mar 2021 14:08:18 +0800
Message-ID: <CAE+NS36NvH-s_UOR8RUZA_gd+FUZ5oLqb=n0s41dSMYWDn9DnA@mail.gmail.com>
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

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2021=E5=B9=B42=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add LED_FUNCTION_MOONLIGHT definitions
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Acked-by: Rob Herring <robh@kernel.org>
>
> No, sorry, I don't believe we need another define for flash/torch.
>

As previous discuss,
> We use term "Moonlight" as reference says
> "When you are trying to imitate moonlight you need to use low voltage,
> softer lighting. You don=E2=80=99t want something that=E2=80=99s too brig=
ht"
> which is focus on brightness instead of color.

If any concern about this change, maybe we use LED_FUNCTION_INDICATOR inste=
ad?
(refs: https://lkml.org/lkml/2020/11/24/1267)


> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
