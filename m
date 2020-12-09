Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9682D4B07
	for <lists+linux-leds@lfdr.de>; Wed,  9 Dec 2020 20:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgLITyU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Dec 2020 14:54:20 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42756 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgLITyU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2020 14:54:20 -0500
Received: by mail-oi1-f194.google.com with SMTP id l200so3016935oig.9;
        Wed, 09 Dec 2020 11:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bWf259ujDoB2ZIyMFOsodZPaeqbO0l1sTiL/ZFlI8PI=;
        b=WZ5aur4ekNLLrkhPqB5BIQRhXnA8l31A7T1sZJKkvT3JVZuIQ1Xmc6339MJFULLmuQ
         LpIhDCI7c/tAyJZTEmXA/LwUmGQbQhWmqyw8EqYxW4KYcuKckM6jyTWDjVfZJuaobUE8
         0u2M3uET3fgXPNWCE6xx1TrEJ54sdeQLv8Dpt8C29ZL9+vgDVZ53/ZKJ5jkHZghl47HE
         ElHdnBgpR8saJWeqRhq7qyp8ttLvKS+BJjSW7pyAPelYDDtMaY7izKm6LqWGByiCd6Eb
         BU4Ip9Mc6DCj5QRXiGZbeYI5HwRLNDg5cMgyy3YqDIb4PnfspzjVd4gqvmzivdJa5HB7
         0BSg==
X-Gm-Message-State: AOAM5303ODFpuNdbsydjW6d9hkWet42/LT2nyIL42xOspK834lmNRWey
        QIg61k1OpUw6801FMa20jA==
X-Google-Smtp-Source: ABdhPJy8vklabGU+56dHaK8G6GlcdfFVaLlc7sCI0zIneIbykIjFdWm2aF1K2lnvNRsZQAKviqY2qQ==
X-Received: by 2002:aca:5cc1:: with SMTP id q184mr3042479oib.46.1607543619166;
        Wed, 09 Dec 2020 11:53:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u15sm493924oiv.28.2020.12.09.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 11:53:38 -0800 (PST)
Received: (nullmailer pid 837413 invoked by uid 1000);
        Wed, 09 Dec 2020 19:53:36 -0000
Date:   Wed, 9 Dec 2020 13:53:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Gene Chen <gene.chen.richtek@gmail.com>,
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
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201209195336.GB826766@robh.at.kernel.org>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
 <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
 <20201203114044.GA9061@duo.ucw.cz>
 <87a4f0b9-1450-cd9f-70ea-dd5b408893f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4f0b9-1450-cd9f-70ea-dd5b408893f3@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Dec 03, 2020 at 09:06:42PM +0100, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 12/3/20 12:40 PM, Pavel Machek wrote:
> > Hi!
> > 
> > > > > +++ b/include/dt-bindings/leds/common.h
> > > > > @@ -78,6 +78,7 @@
> > > > >   #define LED_FUNCTION_INDICATOR "indicator"
> > > > >   #define LED_FUNCTION_LAN "lan"
> > > > >   #define LED_FUNCTION_MAIL "mail"
> > > > > +#define LED_FUNCTION_MOONLIGHT "moonlight"
> > > > 
> > > > There's "torch" function that should be used for this. I guess comment
> > > > should be added with explanation what exactly that is and how should
> > > > the LED be named.
> > > > 
> > > 
> > > According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
> > > LED_COLOR_ID_MOONLIGHT definitions",
> > > The Moonlight LED is LED which maximum current more than torch, but
> > > less than flash. Such as front camera fill light.
> > > I think our channel is moonlight, not torch.
> > > I will add this description to comment.
> > > We can't exactly define moonlight current level, because every vendor
> > > has their own specification.
> > 
> > So... what is the timelimit on moonlight?
> > 
> > But if it is used for camera illumination, I believe it should be
> > simply called flash.
> 
> Let's keep FLASH reserved for LED flash class devices.
> This device has already two other flash iouts.
> 
> Also iouts amperage gives clue that they have three different
> functions.

Perhaps there should just be a table of currents and max times rather 
than trying to continually expand this while tied to function.

One could simply want an LED brighter when blinking than steady state 
would allow for.

Rob
