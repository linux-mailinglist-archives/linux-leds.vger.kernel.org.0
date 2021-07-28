Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFAA3D8C87
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jul 2021 13:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhG1LMm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 07:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhG1LMl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 07:12:41 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10C6C061757;
        Wed, 28 Jul 2021 04:12:38 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso9453138pjb.1;
        Wed, 28 Jul 2021 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ugHrZkH5yHI7raJHKj9/+KIt8SmSoN6uw4EDLlfPZz0=;
        b=aDC3gks3C5r3PrYur6CSGheLd1n3Vwm1DcgdMEOM8TyMj06Ya2tDyuRh4QcAvfeWJr
         BT8P1ceYGGO9sIiGWbGfLdjBuViIUMb0XXDqbHnCluFRCZVNy86Mi+TaDCOxKZBMJ2WX
         S/2SNO/VAlBs6AHxZz6Gl528a+Z15oMN1HDUahz/xahcCCFfpFEYABUasmtIW5DUofAt
         okffevpOxhtZjYE0SZ3GCAM0cetEBL0IoSSpjDDjdJDIqw8/J+HGRX4ZHy5O74zp5v1K
         B1PsxFCYx+G2bu4e8wdIO76xNLppT8ob5KYFj+kZwvIkDsfwzeQwfP4ZEtBiLDOW6mjJ
         Y47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ugHrZkH5yHI7raJHKj9/+KIt8SmSoN6uw4EDLlfPZz0=;
        b=cpOuOMJVmjRQpkhPyc+tLOaYvIEikabSLHw6rEqqvmz92zs2exg8nZ8S7IxGUl7ldl
         fySSUUQ4dCgta2mM3pkiNmIsavAKHp9MdupktMYWWrwWrbgXAaxjCJXrHFhaQv/8JEFl
         bcdYyoc5UYRNKiH40GXDRItjZG77BNhjnbzKbVoI4JTLnmFHeWxonQCWzgDVS5+QNTL8
         6jxdScOacjrRTwVkZVPtYY5gDQ51h/4jVJYHRkatDqVSS2Q2NvDbY+t4Ds+96xcSYX1Q
         Fyr6xyDzV12MKX7dVYjR1wuhANF24ScsKFVW70tSbN1VTv6iE4ibaN52cm14WGIOWjCU
         Fuiw==
X-Gm-Message-State: AOAM533QEs7qQRhsW+i6fGVlen9ZiUL/YpSFaSGJaprJn17WmBiJveTc
        D34RgiAEM0Ir5x/nIScHwN0WN7lRlv7AVyFwgv0=
X-Google-Smtp-Source: ABdhPJwU2podufKEDasFWHwD69f7udQIweP2R+vOukOX0giXitA7f0/ds//JCCpEKfGc0Hsz865CCgtTVK10qSf5w3c=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr9336327pjq.129.1627470758324;
 Wed, 28 Jul 2021 04:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
 <YQEzFYPWVdZFqLVC@kroah.com>
In-Reply-To: <YQEzFYPWVdZFqLVC@kroah.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Jul 2021 14:11:58 +0300
Message-ID: <CAHp75VeDR7NLwhXqBC59EekWK+yp--xe6yhdmn4qH+3L+w88uA@mail.gmail.com>
Subject: Re: LED subsystem lagging maintenance
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 28, 2021 at 1:36 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Jul 28, 2021 at 01:26:20PM +0300, Andy Shevchenko wrote:
> > Hi!
> >
> > I have noticed that in the last couple of cycles the LED subsystem is
> > a bit laggish in terms of maintenance (*). I think it's time that
> > someone can help Pavel to sort things out.
> >
> > In any case, I wonder if we have any kind of procedure for what to do
> > in such cases. Do we need to assume that the subsystem is in a
> > (pre-)orphaned state? If so, who is the best to take care of patch
> > flow?
>
> What outstanding patches have not been handled?  Have you talked to
> Pavel about this?

Pavel has known about them I believe. But just for your convenience
https://lore.kernel.org/linux-leds/20210529111935.3849707-1-andy.shevchenko@gmail.com/T/#u

> > *) e.g. I have a series against a few drivers in LED with actual fixes
> > and it is missed v5.13 (okay, that time Pavel had comments which I
> > have addressed at ~rc7 time frame), missed v5.14 and seems on the
> > curve to miss v5.15.
>
> If you address something at -rc7 you should not expect the changes to be
> merged in time for the next release, what would you do if you were on
> the other end?

Yes, that's why skipping v5.13 is okay, but v5.14 is completely out after that.

> > P.S. I Cc'ed lately active, AFAICS, in that area people + Greg for his opinion.
>
> I think that Pavel should be the one asking for help here if he needs
> it.

I hope so. And we won't see the series dangling for 2 month without
any single word from a maintainer. Thanks for your reply!

-- 
With Best Regards,
Andy Shevchenko
