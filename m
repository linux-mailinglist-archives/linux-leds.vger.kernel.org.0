Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BD0D92D5
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 15:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732892AbfJPNqe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 09:46:34 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44497 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732469AbfJPNqe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 09:46:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so10344346pgd.11;
        Wed, 16 Oct 2019 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncCyY5ytiHiEAR1np3tL8iphuGviQnsLSxNouTgbLyM=;
        b=MwNXWdee7Y6s3miaadCIFDLNyyt03avG08rzXRJCgbM0qQ8jjkewPCC7TOyA2SEdEm
         w4Q537UpPEJ97LQRLM1Zm2hEaqCcfcwfbUi7ybJEkbWSiqRA/gtyHjlbCjnk5csr+CNQ
         twMTTrk8JQRdHsOjyBPQwdoVL8ev1WAvoTUPJjls0blRzNWLeQtz9whid01WWG5JAm9+
         ctLuVZJMQn0M4HUG35gLMAoNZDLFo9ewXziTYE/B+MiFYVN/NTNpk5zsyIIiyWzhn3y9
         eOKGLN2hyZq7m4S+B3+wS1OqehaWyIZiQTJP4xBCD0aRHqHM5yoNLEkgjqWnISv8OBUT
         YekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncCyY5ytiHiEAR1np3tL8iphuGviQnsLSxNouTgbLyM=;
        b=G+LGVInUpo1ONmccGnJeJ9XHcHLyHIGsYCGya60wz6I9HY+fVqmCYVdnBgJz7Tyck+
         0WY5fMDuIhlzpv9Sf2Gsmb5WpdN0nK86n0rgSiForzpLNMH/PtYBh+3bQ/cDAWykuJWW
         SZz8zvLTs65RyXdptuByVFcd3Z8jQib7TxYKlGaH1ChZ9kDEvZ1vwbjXQCk1pH5xuYoV
         xlW/iV4CY13vj5B5B0xyLmdU+mybC7/vfSFxMrjr/1W7agqSGLYk9Cna+U7Le2it6rzS
         xiA4rK4cYVWBuCYvxwUE5HnKSdf2n2AmEA5vgOKnznMi2T68m6KKyZvyLSLIPHndaSmQ
         Bp2g==
X-Gm-Message-State: APjAAAVnHtEPrBTCuw+IwM3pQESTmgVy5p9T6Zd32+DHC+loV5Rujyfi
        wJhMJZ0gRwb88c8iKwYyulw+Ckdi0vmR2j6w9ow=
X-Google-Smtp-Source: APXvYqzV40mPGZJzdonw39l4l21zPDDUEjEkouQFfk1omtfrghJB7x7udeFVF+D+HDvDN9+9bYAlrmkWMprQ4RT9pC4=
X-Received: by 2002:aa7:8b02:: with SMTP id f2mr43669555pfd.151.1571233593607;
 Wed, 16 Oct 2019 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191004214334.149976-1-swboyd@chromium.org> <20191004214334.149976-2-swboyd@chromium.org>
 <CAHp75Vebn48hbzqKWzV3aj4NEBCta_Fn7zOQHzsznW4=6cXLsQ@mail.gmail.com>
 <5da4e084.1c69fb81.567f9.4b9c@mx.google.com> <CAHp75Vcht2S7j64vUGw+DQdSEAyxuyBJ9oVwHyXxnL9bM1-wFA@mail.gmail.com>
 <5da64b37.1c69fb81.fbe6e.51ad@mx.google.com>
In-Reply-To: <5da64b37.1c69fb81.fbe6e.51ad@mx.google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Oct 2019 16:46:22 +0300
Message-ID: <CAHp75VfZU-s2+cY5kpRTSDjc0TC1Xe4hnmY3bLBUPFqWMmo4wA@mail.gmail.com>
Subject: Re: [PATCH 01/10] leds: pca953x: Use of_device_get_match_data()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 16, 2019 at 1:42 AM Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Andy Shevchenko (2019-10-15 02:02:01)
> > On Mon, Oct 14, 2019 at 11:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > Quoting Andy Shevchenko (2019-10-14 10:50:06)
> > > > On Sat, Oct 5, 2019 at 12:47 AM Stephen Boyd <swboyd@chromium.org> wrote:

> > > > Also, I'm thinking that following may help to clean a lot of the i2c
> > > > client drivers
> > > >
> > > > static inline // perhaps no
> > > > const void *i2c_device_get_match_data(struct i2c_client *client, const
> > > > struct i2c_device_id *id)
> > > > {
> > > >   if (id)
> > > >     return (const void *)id->driver_data;
> > > >   return device_get_match_data(&client->dev);
> > > > }
> > > >
> > >
> > > Looks alright to me. Maybe device_get_match_data() can look at the bus
> > > and call some bus op if the firmware match isn't present? Then we can
> > > replace a bunch of these calls with device_get_match_data() and it will
> > > "do the right thing" regardless of what bus or firmware the device is
> > > running on.
> >
> > It will be something ugly like
> >
> > buses {
> > #ifdef I2C
> > &i2c_bus_type,
> > #endif
> > ...
> > }
> >
> > in the code. I won't do this.
> >
> > See generic_match_buses[] for example.
>
> Why is it like generic_match_buses[]? I thought it would look at
> struct device::of_node or struct device::fw_node and try to extract
> device data out that and if that fails it would fallback to some new
> function like struct bus_type::get_match_data() that does the right
> thing for the bus. In the case of i2c it would extract the i2c_client's
> i2c_device_id pointer and return it onwards.

Can you send a patch for review?

-- 
With Best Regards,
Andy Shevchenko
