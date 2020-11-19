Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9512B8A08
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 03:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgKSCUO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 21:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgKSCUO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 21:20:14 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F5DC0613D4;
        Wed, 18 Nov 2020 18:20:14 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t16so4620652oie.11;
        Wed, 18 Nov 2020 18:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XjBMwrDZzoeC8VosEzb1gr+r3X/1K8TK9pR44LwP/2E=;
        b=H6kewgR2F5mSUim/w79oE5EZ5DUjQGIR1DL/OmwQK9EfEZ19ySwWBzLGIOpJW6E1F/
         c2wAhjT0H0Gafrp6CrHPIw1d5EDiu4YZpJY8W4Rs3iy7ggWvQYT+TR75rnNoW1En7ltO
         Viz8Wu0hubCYizW31+h7r97d4qaT07uW/lG74oN06r+kJhenK3uFepHkkyXuXGOrVSES
         LHtrCy5g4Gj9bPCSRxWOZEixdaW4j6mlQRTdNiooOxCjNA+kdizdIHdIG9d7f3Psvsrb
         YRZJZNqspocK77Lm055CMXGb15Ow3+kMcLPDbOtKd3e+w2toi8IodjwTlAOaXkU35ms5
         d3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XjBMwrDZzoeC8VosEzb1gr+r3X/1K8TK9pR44LwP/2E=;
        b=WVjyToWb1rJAmtIF0usOe+Fr+biLc4cTDPgqtR9HIYa4vqwn9o9eSvjtaPRKx7woeQ
         ih1tekE9JXo8j6iM2trh78J99YDGOw+3tcVCXcYE86aIYJ4A6PoUxfIEl1BFsEHlj0hc
         H2bu4MbEYKKKBXT1TYyK3uIbxPXS2ZRIWAdpd7xFR4Pdus3KmZs5Tidij3jAgSiyyaDt
         8Jv8heaM88S3Z0kehuX23iFEm5sAPZTfKPEVwDdNdK6GErldyblNXiw/DVsUIFfnVkrP
         sRZG6Por7dPemEDsbIWniyi7stTPfAKibgQM3Rm7vw87K1T8mrWxos79Ur488YCaou+r
         BoHg==
X-Gm-Message-State: AOAM533gNgiOcgSd672WQU/c3BiKTGPhN6DYRZ8zDopaUdeCqnxCYKM8
        +bXk2E74qhg6lqZP3HV0GMbhDaw2NmwPqnkjst0=
X-Google-Smtp-Source: ABdhPJyzrAG22iqVzKYFTPE8VWe8HwfhcZ9N+mEhbSWm0JtgZ1x17Pi8KRNgmf9ES+kWyCvLyghbUcWeTNlooGIBx8c=
X-Received: by 2002:aca:ac96:: with SMTP id v144mr1378226oie.51.1605752414058;
 Wed, 18 Nov 2020 18:20:14 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com> <20201118213712.GA22371@amd>
In-Reply-To: <20201118213712.GA22371@amd>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 19 Nov 2020 10:20:02 +0800
Message-ID: <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
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

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B411=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=885:37=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add LED_COLOR_ID_MOONLIGHT definitions
>
> Why is moonlight a color? Camera flashes are usually white, no?
>
> At least it needs a comment...
>
> Best regards,
>                                                                 Pavel
>

Moonlight has more current level(150mA) from general RGB LED (24mA).
It can be used as night-light and usually use color AMBER.
Camera flashes are usually use two flash LED. One is YELLOW, and one is WHI=
TE.

>
>
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >  include/dt-bindings/leds/common.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/le=
ds/common.h
> > index 52b619d..1409e9a 100644
> > --- a/include/dt-bindings/leds/common.h
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -33,7 +33,8 @@
> >  #define LED_COLOR_ID_MULTI   8       /* For multicolor LEDs */
> >  #define LED_COLOR_ID_RGB     9       /* For multicolor LEDs that can d=
o arbitrary color,
> >                                          so this would include RGBW and=
 similar */
> > -#define LED_COLOR_ID_MAX     10
> > +#define LED_COLOR_ID_MOONLIGHT       10
> > +#define LED_COLOR_ID_MAX     11
> >
> >  /* Standard LED functions */
> >  /* Keyboard LEDs, usually it would be input4::capslock etc. */
>
> --
> http://www.livejournal.com/~pavelmachek
