Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7643972C3
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jun 2021 13:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbhFALuj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Jun 2021 07:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbhFALui (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jun 2021 07:50:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DC4C061574
        for <linux-leds@vger.kernel.org>; Tue,  1 Jun 2021 04:48:56 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f30so21374823lfj.1
        for <linux-leds@vger.kernel.org>; Tue, 01 Jun 2021 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6zj02qXAAuk1QMJQIoOzaeU/P0x5I8fbdsNIO3pGtyM=;
        b=GCM7TqzsCQfMbmkRYl1ltBptIKp+x5Qk014ppmBUTtp150nlx088axbmbXi54EYEJs
         6mEGIZOKLnyzs1jt1wMaf4KOlMe3yCHfXXpLFdWB+VhWAzC9DsYKfmOK9iyh4uiW9ZXM
         UPffTgBYvAeMgv1MSPKtvFAFcI20GiYHjJh02wNDnOTqk7XsXL8h7+73mOVpvHrrBe1z
         7yuT6pmonFwXsXn0DW1jC03q3BXXuZKSUl+XfSVgxFiTvAWmSadKCkguWLltWa75Gk+F
         HVlyOLt2dlf1Ogd0HGlSc2b+Ev3Qlp9roPuwyJV0Pze1yj3rTINevD5wK5+QYs2AKeRa
         SjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6zj02qXAAuk1QMJQIoOzaeU/P0x5I8fbdsNIO3pGtyM=;
        b=D1FJqVfehAUtdsYyl+xol1DORiLg/FBDy5WkHWYYqLd5a4MOXebc6UrIriN7CdNL54
         1np6c0EM+5NY0AqLuoO8oyIIbELZ3ty1xovzcwiHph7a1f5M7YJOL79i7/NBZZMm2In6
         0lDzkiKWbkLWUjDqk3Fjgw0WlSp32xgYmrlHDNfyvilQo8oBDUjEtwKExUOa7eDbLHIW
         9LaS6dj8hom/YWlKwbR+K9rf1vITEbIuO82UEu7kK82Lv4KF+KaehW7gbR6PP2g79Go5
         P3CJ8RI0qx0mGIMJrKS+a6HRfgoFmDn4qjefn+REwDU+bzTJ+9XaOPfwp5ZMQdfyWV1i
         fMLg==
X-Gm-Message-State: AOAM533LSiNrsly1KXenTT25HzDZqK25jG1uyYl7wQCBm3X/XYkX/YDF
        9RqvTQCCiYU+6xYWrYvh2xipB0Aomx1p7h2OPLZwgw==
X-Google-Smtp-Source: ABdhPJzF8H83uaZnzZpe08/0yXw6XupwStZHCxUKdO+/s/bThQc8z/xGZtqpykumfoLGGvPGtwEdFRNbALwP1zVytAM=
X-Received: by 2002:a19:f616:: with SMTP id x22mr18138502lfe.291.1622548135157;
 Tue, 01 Jun 2021 04:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc> <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com> <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <CACRpkda+m5mOzMJ8KcPmojFGWkUpCrbmY0ySPTVx72RtWwf89A@mail.gmail.com>
 <e10c8ef7f758b4f7fa0fcbc992c84125@walle.cc> <CACRpkdb4j6krXwdZGtth9b2W2bAdy9_StGbse_YbBY86-AWdLg@mail.gmail.com>
 <401805ef27bb273d7aca4f3377b53b07@walle.cc>
In-Reply-To: <401805ef27bb273d7aca4f3377b53b07@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 13:48:43 +0200
Message-ID: <CACRpkdYSMjDaRY2chbFyBTJ4jeAjPtXX3+VW7MHu-wH2QoAfPA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sander Vanheule <sander@svanheule.net>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 1, 2021 at 1:41 PM Michael Walle <michael@walle.cc> wrote:
> Am 2021-06-01 12:51, schrieb Linus Walleij:
> > On Tue, Jun 1, 2021 at 12:18 PM Michael Walle <michael@walle.cc> wrote:
> >> Am 2021-06-01 11:59, schrieb Linus Walleij:
> >
> >> > Just regarding all registers/memory cells in a register page
> >> > as default volatile (which is what we do a lot of the time)
> >> > has its upsides: bugs like this doesn't happen.
> >>
> >> I don't think this is the bug here. If it is really a write-only
> >> register
> >> the problem is the read in RMW. Because reading the register will
> >> return
> >> the input value instead of the (previously written) output value.
> >
> > True that. Write and read semantics differ on the register.
> >
> > Volatile is used for this and some other things,
> > like for example interrupts being cleared when a register
> > is read so it is strictly read-once.
>
> Isn't that what precious is for?

I never figured that one out. But I assume you are right.

Proper regmap semantics documentation is forthcoming! ;)

Yours,
Linus Walleij
