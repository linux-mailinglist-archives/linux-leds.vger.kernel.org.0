Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5B421806B
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2020 09:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgGHHIS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jul 2020 03:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729225AbgGHHIR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jul 2020 03:08:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA9EC061755
        for <linux-leds@vger.kernel.org>; Wed,  8 Jul 2020 00:08:17 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f5so37052790ljj.10
        for <linux-leds@vger.kernel.org>; Wed, 08 Jul 2020 00:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uPtUOLC7CmbWglkow01KEGsFdTlT5m8x2yfRI4QBTkQ=;
        b=agDK8/jx0Tmm2Du/gTV8D7RWg9/uugyJMLsPLylok0jYet8BAVeJzi4obV6MvQzXjx
         otsRhuioABtdf2/OEOW1SN9k+d+VS3hwvbjKZSJWf/UfPtb6MjyQXEuJNbFEg43Ltqfk
         uH7/FQf40FiXVRX0d+4NJ7QVZIKN0lYl3O+XpzUgEkyUvSfkahnhvfJ5h8NVf8d0XipH
         nm04u29aviPzIYHszP9oL39PYGa4EZUAFI7EFHI9DdQBcahNJ8rn5+ec2d/8fuNABxmD
         asVV5xfjVu7uv7bfobb5et9b+RjNo606X8/+oIM0pFJi6SYgbzpzqCfmXIt8WwRq+fND
         pSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uPtUOLC7CmbWglkow01KEGsFdTlT5m8x2yfRI4QBTkQ=;
        b=HdCQhCy2XH22Lm7TpY5ljOJpDCVv35N4iRpiYkiLis1/3WlbXp6lNAUM6rJHrLatHd
         ilPAg08g+CNy1VSUhkcxdSaPtNsXEmX7UtfPn5JsbtRaZWfX3nzIesyVSQS9nFhanAkX
         S+mUOb6EB/D1tpRbFrTqKS0H1i56TFtAYo59Wr+cudoHJtwWKJ2OZN6pOrdorBbcgn2v
         pEGzW+3IPW6QwYcHQkvBd7b7g6tnszjKqw7sa4dAxCA/wCUXIVzIxLMyT1YWDH9rjK4r
         AGH8yxaCHE+xoJdagGOf2aPJxIXXtphsqMfb51pZqB0u7S67/z3T9DZjL96AYFsbcYLa
         FUXw==
X-Gm-Message-State: AOAM530QBfDcMgaoyXjen7WF7Fxlw016fSvdMywAE//SCzAmAScYKXEG
        anjdmDFg4KCyusT07yOGYcD7ITZmA3/Z0+lxIOX6YA==
X-Google-Smtp-Source: ABdhPJwBozSMW7jVPJ9gDUfo1Or2o+vl8D5+x3lIHjgmMTBSkeUFOrPqJZv6zCo/Fbc/WGeltQ9aO3Yc5lZvHgaK1+A=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr31525891ljc.286.1594192096003;
 Wed, 08 Jul 2020 00:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200627001015.427376-1-linus.walleij@linaro.org> <d0937cb8-69c8-8442-33b3-6f44bcb79f99@gmail.com>
In-Reply-To: <d0937cb8-69c8-8442-33b3-6f44bcb79f99@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:08:04 +0200
Message-ID: <CACRpkdZ2F8LF8qeJgsJzweGHUL2bN63sDhYueLW1W7zfitOgAQ@mail.gmail.com>
Subject: Re: [PATCH] leds: s3c24xx: Convert to use GPIO descriptors
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jun 29, 2020 at 11:49 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> > +static struct gpiod_lookup_table mini2440_led4_gpio_table = {
> > +     .dev_id = "s3c24xx_led.4",
> > +     .table = {
> > +             GPIO_LOOKUP("GPB", 8, NULL, GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN),
> > +             { },
> > +     },
> > +};
> > +
> > +static struct gpiod_lookup_table mini2440_led5_gpio_table = {
>
> Why not backlight for consistency with pdata?
>
> s/led5/led_backlight/

This platform boardfile is already using a confusion of "backlight"
and "led" for this device. The platform device is named s3c24xx_led
with .id 5 and gets named "s3c24xx_led.5". But I changed the
name of the lookup so it is a bit clearer.

> > +     .dev_id = "s3c24xx_led.5",
>
> s/led.5/led_backlight/

That will not work because this lookup is tied to the platform device
name, not the LED name, which I don't change in this patch.

I fixed the rest of the comments!

Thanks,
Linus Walleij
