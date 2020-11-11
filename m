Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5142AF6A1
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 17:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgKKQfN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 11:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgKKQfN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Nov 2020 11:35:13 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FEBC0613D1
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2020 08:35:11 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id i6so4032696lfd.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2020 08:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8IEVA8bCRCAU96dWCYoza+G6UW8AnPuBdvklv4ka/k=;
        b=v8Z8kMHrB5bsK2DMqpdL/Dj7jBcPcG1OAh0AwvMrzed+bHbdCugaMsD+8fpL1lMnKR
         mbJBintvBJcPaGQbcqF1Drchx8ytfW0eED9EZORouIBsfHuGznAGy+Se+hA5+swZtkyH
         0MlxpBvoL5PukWTdKvlZTWnqkcbWdGzWDTh/UGoPImXj4ahQuh1JoRGRxIczJTBdLIZU
         JKO4JFvrwvycCSQxRrWphtMRoumyUWkOoy1LtF9CzT/+4+s5kT1JqLnpDLlDaeAyaGHb
         h6HEL9lI817KTyFxotU9BjxxfD9Bc0iwzQebxRFaBx+syZYO7olzenTuCo0Whlrihikg
         9lvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8IEVA8bCRCAU96dWCYoza+G6UW8AnPuBdvklv4ka/k=;
        b=mInqVjVLaXbRezKjegD9Z3kptLzxdPZ5g5Zo7PWV8TmEmS1yQ8WyAaAxZDNkWdN9wd
         YKVIXATbse0lzYDghwAwt+XsrqPMsA5ySWaLSZq3F5z+Sm+xVEmmMc4hTvkYdCtFEouY
         me7H7k0KU2gCBoey/t7TSdMsBY8yLsMT8co9mmaHkRvzl6xbXYZtN6GtVybXk5BruTnD
         7BpzskMH0NIgs6b9/dbjFdoqqAZCDk0cI5HdkO9YJszS0/cCHl+EpRgZ4jvGCeSq7y2b
         ecJeKH/cVok7MRUl14OvJTaubkgpHK31tibd6UUT5IUsXH9wPjKjE7tRIJLRWpU4hIMp
         zo6A==
X-Gm-Message-State: AOAM533Epes2D742T7eoDFDq36nNzHKnBnbQXHNRtYYpClaQYgwbPFEr
        Sb+hPsVVw6aKRWk1eyk3hY5Z6gzLfXphFsWPgX8yvg==
X-Google-Smtp-Source: ABdhPJyxrsiYjF83rCzducYFrFRt9dD0u8KXBmpojtZxaVFhEZar1+frASCzOv7sdhhC1pjYI2Cn1wgXhWciXS39i4Y=
X-Received: by 2002:ac2:4ac7:: with SMTP id m7mr7576411lfp.572.1605112509849;
 Wed, 11 Nov 2020 08:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
 <20201111011417.2275501-2-linus.walleij@linaro.org> <20201111113848.GX6899@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201111113848.GX6899@valkosipuli.retiisi.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Nov 2020 17:34:58 +0100
Message-ID: <CACRpkdYK+X==Xm3AfymV_HEaZHOvPS-LtCLKZXc2jmzV7KUZoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Nov 11, 2020 at 12:40 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> On Wed, Nov 11, 2020 at 02:14:17AM +0100, Linus Walleij wrote:

> > +     } else if (brightness < RT8515_TORCH_MAX) {
> > +             /* Step it up to movie mode brightness using the flash pin */
> > +             rt8515_gpio_brightness_commit(rt->ent, brightness);
>
> What's the unit of brightness here? If you don't know the unit, you could
> still assume something and fix it later if needed. Or the current could be
> just measured.
>
> It's usually linear but if the number of steps is small then logarithmic
> scale is also not unforeseen.

I will try to come up with something...

> > +     } else {
> > +             /* Max torch brightness requested */
> > +             gpiod_set_value(rt->ent, 1);
>
> What's the current in this case? The maximum really should come from DT to
> avoid frying components.

The way I understand it is that this component contains its own
current regulation electronic. You request a brightness
between 1-100 and it will support this range (no external
current boost). And as a user that is "all you need to know".

Isn't this problem more prevalent when you have some kind of
external current-regulator that you need to program?

This component draws its power directly from VBAT (the main
battery) so regulating how much of that it takes is up to the
component.

I could think of the component brightness being a problem if
the flash is embedded in some kind of plastic that cannot
take the heat though, but I haven't seen any code trying to
hold it down for this reason. I suppose the component
datasheet (that I don't have) specifies all these things...

Yours,
Linus Walleij
