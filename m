Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6193970CD
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jun 2021 11:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhFAKBG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Jun 2021 06:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbhFAKBG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jun 2021 06:01:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DD9C061574
        for <linux-leds@vger.kernel.org>; Tue,  1 Jun 2021 02:59:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j10so20820313lfb.12
        for <linux-leds@vger.kernel.org>; Tue, 01 Jun 2021 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2W6uim/mGDin/FJYZH96yxsKQsl+UwiwSGvJzTSgiW4=;
        b=P0mZDtgnoKk2E9LA8Xx97KeYoyyRE79OQ5TnUfPfYyFya3a6MKnLY0W1ZtUDFUU+11
         RDDsk9f4VFPxuR/ZWjXuwkrCH8jMsT/11H82ifPUW/OU3IwhCQO/Z3Y/0uMvndX7Xu3o
         2C+UFCcvza21W5YDotUFlzhq+ycUOT/pUMFnFT2llRw6wysgxeSqUcUHYIGaIxC3yPSj
         0lTr07owbwPftwWM6loybaiLzRlxlfUKo6tW/GSrFtNfoxIjg+BCCvp+rO1PqeZPpdzU
         JG20KMtedWg8MD2K76uWb0BQX0GnG7Wrj4N+RgUqXHt0YFM6gxWgEGLZzQ32tzb5Rk1e
         w54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2W6uim/mGDin/FJYZH96yxsKQsl+UwiwSGvJzTSgiW4=;
        b=qoeizj5xJXhoNnKkrxMt9oGPrqQ6sp4QYR+w083ernR2oTWB1Rqi/ycRApydDw6h4Z
         hvFGwMm4Bmap7MGvPCTwh8yghxT/pligri8zlkzRbOHdrftmdhoeMcFN/5nMQ1tm4nfg
         Komgd0ez3lHYI1VUlKsotrtgCwVgSMVb/nQqDrbXGmHqyGXmPrKLWxgUJzYW96Gb7z5y
         MZmh3uRSMODlXm0Jsyys6WtanWg5InQcHV/R8Kgq/Vy2lbX9A/giX3yQ99wiCFN5IAf+
         CErfp/BMRIENlk8q4pZlG0x/+8aFPlHAZPjVc/A/HLtNA4N2sLaWHXpDBiV1Am5wjYUj
         wuLQ==
X-Gm-Message-State: AOAM532aLqJ5sIash2ttPz6PI4HAYOIn9egwHXyGOrnpo/NU5Y6qooz6
        3Q3mIm6O6jk4Et4i5H3iPKra65zrC6x+lH/hj6l58Q==
X-Google-Smtp-Source: ABdhPJz7fj9TbUyHQCGTxDF+hC0s+lxk8kvTdqeTswE9X5ltix8EKC8tE/lVya1dFeSqalUK/XrhQ2tps4p5OgHu+oU=
X-Received: by 2002:a05:6512:3241:: with SMTP id c1mr9699263lfr.29.1622541561986;
 Tue, 01 Jun 2021 02:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc> <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com> <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
In-Reply-To: <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 11:59:10 +0200
Message-ID: <CACRpkda+m5mOzMJ8KcPmojFGWkUpCrbmY0ySPTVx72RtWwf89A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sander Vanheule <sander@svanheule.net>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
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

On Sun, May 30, 2021 at 8:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, May 30, 2021 at 7:51 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > Regmap allows you to mark certain ranges as volatile, so that they will not
> > be cached, these GPIO registers containing the current pin value seems like
> > a good candidate for this. This is also necessary to make reading the GPIO
> > work without getting back a stale, cached value.
>
> After all it seems a simple missed proper register configuration in
> the driver for regmap.
> Oh, as usual something easy-to-solve requires tons of time to find it. :-)

This is actually quite interesting.

In the discussion around adding Rust support for the Linux kernel
what I came to realize was that the memory safety that Rust adds is
similar in application and ambition to what e.g. regmap-mmio provides.

One aspect of writing kernel drivers in Rust is to always have
something like regmap between your code and the hardware to
strictly control the memory access pattern.

After all regmap is "memory safety implemented in C".

What we see in cases like this is that not only does that make
things more strict and controlled (after all we have regmap for
a reason) but also makes it possible to generate a whole new
set of bugs by doing an error in how you specify the memory
semantics. As all other paradigms, memory safety thinking
implies that never specify anything wrong.

Just regarding all registers/memory cells in a register page
as default volatile (which is what we do a lot of the time)
has its upsides: bugs like this doesn't happen.

(Just some sidetracking...)

Yours,
Linus Walleij
