Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77293CD024
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jul 2021 11:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234816AbhGSI3D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Jul 2021 04:29:03 -0400
Received: from mail-qv1-f43.google.com ([209.85.219.43]:33340 "EHLO
        mail-qv1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhGSI3D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Jul 2021 04:29:03 -0400
Received: by mail-qv1-f43.google.com with SMTP id h9so8050137qvs.0;
        Mon, 19 Jul 2021 02:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvRFsTZWHUBtfjypkwrQKZFWUxIibSU0lyg1+VUtg3o=;
        b=j0bGFns5Ac3BxtVOjHAryaoX9TzjRmVc+Bb8oyKZYmB+1rRqQ0Krb6wrQvnuE3Imnl
         9HzSLDHurtZjAcRlzXENZJmpFZLQTW+36lqYLs0S0BYTFuCFKpeK/VJ2ZCeUBkygdqOQ
         71ODkqrMjCihexkcceWyeaX+BxV221udNoPLFrPb5q29LbfVxqj+G5DZXzKG5J5cgEGE
         Hf7Yy+xitn4bF49ZESiXseH0wsowhDRVyOc3aUWG2BCyfJDCUSuJrgodcbusWCMLQcHh
         sZwSiyRB7LtvIaukE9sIsWaCVgFHu1BSuyMJYEmXeMB/vWWjhnINz9LVodL1uQfKpBe5
         HDnQ==
X-Gm-Message-State: AOAM5328SYVW6WmIyuh2evRGYJkn0yrLxhYgvXS3L+PzP7FRKm4Mnh2X
        ADetPEmEDWUD9dyzd3fZ2JYn3teLOPLFWHKqssoqwCx6
X-Google-Smtp-Source: ABdhPJwzsz6tgCn138Wv0TTHdZGLVQIes9AbYd5clSec/oNFY1H5H69RrugV3uvyOApiMcAqUtYYJvmBeEEACUg8xbI=
X-Received: by 2002:ac5:cd9b:: with SMTP id i27mr20830596vka.1.1626684043244;
 Mon, 19 Jul 2021 01:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626383424.git.apark0006@student.cerritos.edu>
 <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
 <alpine.DEB.2.22.394.2107190912320.178229@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2107190912320.178229@ramsan.of.borg>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Jul 2021 10:40:32 +0200
Message-ID: <CAMuHMdXZcaR28fUuiNWF8jv-NnOYkAXxR8z+vOQ2rY3BqQMWTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
To:     Amy Parker <apark0006@student.cerritos.edu>
Cc:     Pavel Machek <pavel@ucw.cz>,
        linux-leds <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 19, 2021 at 9:18 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 15 Jul 2021, Amy Parker wrote:
> > This commit changes how led_brightness, declared in header file
> > include/linux/leds.h, works throughout the kernel, and updates other
> > files in accordance.
> >
> > The TODO located at drivers/leds/TODO requests:
> >
> > * Get rid of led_brightness
> >
> > It is really an integer, as maximum is configurable. Get rid of it, or
> > make it into typedef or something.
> >
> > This patch changes the declaration of led_brightness from an enum to a
> > typedef. In order to hold the currently existing enum values, macro
> > definitions are provided. Files which use led_brightness are updated to
> > conform to the new types.
> >
> > Signed-off-by: Amy Parker <apark0006@student.cerritos.edu>
>
> Thanks for your patch!
>
> > 207 files changed, 437 insertions(+), 438 deletions(-)
>
> This touches a lot of files, so we better get it right.
>
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -26,12 +26,11 @@ struct device_node;
> >  */
> >
> > /* This is obsolete/useless. We now support variable maximum brightness. */
> > -enum led_brightness {
> > -     LED_OFF         = 0,
> > -     LED_ON          = 1,
> > -     LED_HALF        = 127,
> > -     LED_FULL        = 255,
> > -};
> > +typedef u8 led_brightness;
>
> In general, typedefs are frowned upon in the kernel, but there can be a
> good reason to use one.
> What if the maximum brightness is larger than 255?
> Using "unsigned int" sounds better to me, but let's wait for Pavel...

And as Dan just pointed out, "signed int" would be even better, as it
would allow a function to return an error code.

> > +#define LED_OFF 0
> > +#define LED_ON 1
> > +#define LED_HALF 127
> > +#define LED_FULL 255

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
