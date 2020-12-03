Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A963E2CCFB1
	for <lists+linux-leds@lfdr.de>; Thu,  3 Dec 2020 07:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgLCGnB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Dec 2020 01:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbgLCGnB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Dec 2020 01:43:01 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2482BC061A52;
        Wed,  2 Dec 2020 22:42:21 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id f11so1139632oij.6;
        Wed, 02 Dec 2020 22:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yO4TsI43MuLziGL33Z3oiOkLAP8j5oHC1iNCg4TI+/s=;
        b=do7maqArbCHRAVqvvu3JPEzYvoePnCjywZhayzI88KuqX/pY/Mk/RUtCE64RPOVfRm
         TgP1176mObueziXjkJE6hqIistnArhXtSoNRwoR1Ig1yMTgbZdczCOMIHKUvAqyLLjMw
         NPlTOCb87S9lxfK1SuC9diY1uJYvQrIIYi0+UsUU94ddIKHVdCSeQuiB6RL7dmh7sE1H
         dvo1pomq2vZEYTPqfk11jw02eHma9nEv6HARLxIGaNyclUPED2HyLEdv5vmHk97OBQ2x
         FRo70IFI7ym0cY0hujL5T49ryJ5IaMK9wzDKW6Kr9TwXCgY3hah7i2iJYLJb0CjeIPm7
         5FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yO4TsI43MuLziGL33Z3oiOkLAP8j5oHC1iNCg4TI+/s=;
        b=fY4/nNibVT+izu2px/u7nOI3zYz/t5kGjXAdQosJGUBAFNGwEzx9EsLYQcQ1ZjetuS
         69aG/P2S/7aDbjMoo4LCrekIjhubjJbg7DxjKXzZGSAeYJRQR5E+blgfgFmRdMLDD4pk
         GL5PZ03zwEjJPWdSpXgwuFxF7jSse5RSFg64VdDgd5VXAyV3/541PK0PljZhvxB8+BdP
         ccv9dSZtWm1DKEi8UrI7Ld7Z8zOmEUh5sq+fDIDMrUlnZ85lqlohuGAWFAarcts8Y37s
         hzTHcrUFY9ZKQrCIRHEXtqIpKeXV9Sv6onSaKZjax3Sdyy5XpQdX59FRrhRmwP2HQ+Zd
         hRng==
X-Gm-Message-State: AOAM532kpzksomXUuW/59D/4jSiw/Lmy9YvPMJbFHdgoGqRe2x+zbYZn
        e4NWCRtHRxVNNce1hLyPgcDZw5tHEisLaAKUANk=
X-Google-Smtp-Source: ABdhPJyZxsbM2i/OH6A7N9hQqS+cFLzd3IgXb6p+JDZhAGOqIiZA9i7J/kWZ06MeDUjjRo9n1my70PTRPfSRt+eQDZE=
X-Received: by 2002:aca:3e84:: with SMTP id l126mr976185oia.55.1606977740583;
 Wed, 02 Dec 2020 22:42:20 -0800 (PST)
MIME-Version: 1.0
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com> <20201202122329.GA30929@duo.ucw.cz>
In-Reply-To: <20201202122329.GA30929@duo.ucw.cz>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 3 Dec 2020 14:42:08 +0800
Message-ID: <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT definitions
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
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B412=E6=9C=882=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:23=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed 2020-12-02 18:46:49, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add LED_FUNCTION_MOONLIGHT definitions
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  include/dt-bindings/leds/common.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/le=
ds/common.h
> > index 52b619d..843e65d 100644
> > --- a/include/dt-bindings/leds/common.h
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -78,6 +78,7 @@
> >  #define LED_FUNCTION_INDICATOR "indicator"
> >  #define LED_FUNCTION_LAN "lan"
> >  #define LED_FUNCTION_MAIL "mail"
> > +#define LED_FUNCTION_MOONLIGHT "moonlight"
>
> There's "torch" function that should be used for this. I guess comment
> should be added with explanation what exactly that is and how should
> the LED be named.
>

According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
LED_COLOR_ID_MOONLIGHT definitions",
The Moonlight LED is LED which maximum current more than torch, but
less than flash. Such as front camera fill light.
I think our channel is moonlight, not torch.
I will add this description to comment.
We can't exactly define moonlight current level, because every vendor
has their own specification.

> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
