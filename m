Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C8CFDE7E
	for <lists+linux-leds@lfdr.de>; Fri, 15 Nov 2019 14:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfKONCD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Nov 2019 08:02:03 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43759 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfKONCC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Nov 2019 08:02:02 -0500
Received: by mail-oi1-f193.google.com with SMTP id l20so8499427oie.10;
        Fri, 15 Nov 2019 05:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fFCEymgW22IOXjAfj44wBlKSuJ/Vx7mcifImk+2KKVg=;
        b=ER/EhUYC5QkiYAW0NuWXmHh3nGBEqMeczo7bfaQfML9i+NLruK4Gh5CXsQ1oHEis+0
         IE8o0YLOYLJEgxb+3fcFgTtNYhpBxdbhZ2FU1wH74ngVny8isWEvKLeOM1EUp6IuQsyR
         sa0MRyDWpN+kwfVPNtsG1o0E1//U7Hlwu78BeVNbuGpyIbBfyOxvWvXUZjB1yvVO7M8/
         RDioRr0MoDzQ/tz29Ggt1O30Q8GVzat1zaR+ApOHFm758kPj8fhguBvsclrvWsHN+jew
         7VLz1NV9tYGbCnsdLjloB99a32LB5kA3JRDiwx9BLhg4TLrXqIQMWmvaDx4osSx0r6c6
         TNJA==
X-Gm-Message-State: APjAAAVrrtTmotSUsASqlWR6dyihUZRYtS0teQXGqlO9QGlhyuhg7PI8
        CTzsWhJH7RePDyd49gStBA7jm8I1NLYgxGcliD0=
X-Google-Smtp-Source: APXvYqwDJnmXPh1+p0V9jnah9Cftz47hQsDfVVyH6+VKTuHFMEr5sJTTgNmBTMY4L5m3/E6+pM7lmaFLG66wGDKmJn0=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr7493713oia.148.1573822921804;
 Fri, 15 Nov 2019 05:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com> <20190609190803.14815-4-jacek.anaszewski@gmail.com>
In-Reply-To: <20190609190803.14815-4-jacek.anaszewski@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Nov 2019 14:01:50 +0100
Message-ID: <CAMuHMdXkQCVXdsbS1Tf+7wkafJ4JxhxXeh4R7OWOz5uGs-jL5Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/26] dt-bindings: leds: Add LED_FUNCTION definitions
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
        dtor@google.com, Guenter Roeck <linux@roeck-us.net>,
        Dan Murphy <dmurphy@ti.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On Sun, Jun 9, 2019 at 9:09 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Add initial set of common LED function definitions.
>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,4 +31,45 @@
>  #define LED_COLOR_ID_IR                7
>  #define LED_COLOR_ID_MAX       8
>
> +/* Standard LED functions */
> +#define LED_FUNCTION_ACTIVITY "activity"

What's the appropriate function for "general purpose" or "user" LEDs on
development boards, where the LEDs don't have fixed functions, unlike
on real products?
Perhaps just LED_FUNCTION_INDICATOR?

I noticed your very initial submission defined LED_FUNCTION_USER "user".
I couldn't find an explanation for the rationale behind its removal in later
revisions, or any discussion asking for that.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
