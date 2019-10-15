Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 036D0D83E2
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 00:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733142AbfJOWmD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Oct 2019 18:42:03 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42105 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732531AbfJOWmC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Oct 2019 18:42:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id f14so7905143pgi.9
        for <linux-leds@vger.kernel.org>; Tue, 15 Oct 2019 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=bY4WLKZuYm7r5kccTCHQ1+60A/9r66Bg59bVdf+D598=;
        b=VIdBkU40lpBV/n+y//tvo+VS1Szf+kABQrt6SkfGopYS2Y+XzhbtZGXCMuoEsCg9E8
         zJ+8/q9jAJ6ElijzskUeYsp73t3AEKwZi63F+C2wiFcOHh1xzKejbhvrwmR2gbQLndiU
         5GfeMSUEgTqFCrrCKW2Cr7xvejd3/q2XX/AuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=bY4WLKZuYm7r5kccTCHQ1+60A/9r66Bg59bVdf+D598=;
        b=L037uKH6SAKlH2xFl6pvVs/QoCoht7W/SG7J3ctusXhAa8/4SkhEqWh4MOXKIAAtSI
         DEk6pGLreiT0K8KiQmmbB5mgR6tieCgJQPeRWUYVulFIxvmu/nXAlWD4OGt1+77Uyj2c
         BLbsaDLxOgtmDRMQgwKnGZOpQPIit5EZERmdPafPqsasGu1aCQsELCCdKZEeSRMJY7mh
         Br01z0QezzstvfOXX/0vBYUXmQlDaSSeXYcSJ4AndIfHhVGLwPI3mcgJMVBcKIF667g4
         XW+2U4vU5Y7oYIZoSVLSXkV+CboBTg48LBU4e6yzQW/HGB1qdIs1VXborrRkmpQ3wKxY
         bwXw==
X-Gm-Message-State: APjAAAVftviguaSvD2Cl/Wrhp14flQ5wxdc+Iv9FWK333VENrOfO7A8u
        QI/dY3Rxz7PkZy5C11SAWtritw==
X-Google-Smtp-Source: APXvYqyF7qw9obm6BuwG+SzFxtlYDM9MAZ5yMCdEO7H+3Es4TpBOze7Eyyiz0HIqNJcdZBYqKjhSAg==
X-Received: by 2002:a65:638a:: with SMTP id h10mr3250371pgv.388.1571179320077;
        Tue, 15 Oct 2019 15:42:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b5sm25864038pfp.38.2019.10.15.15.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:41:59 -0700 (PDT)
Message-ID: <5da64b37.1c69fb81.fbe6e.51ad@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHp75Vcht2S7j64vUGw+DQdSEAyxuyBJ9oVwHyXxnL9bM1-wFA@mail.gmail.com>
References: <20191004214334.149976-1-swboyd@chromium.org> <20191004214334.149976-2-swboyd@chromium.org> <CAHp75Vebn48hbzqKWzV3aj4NEBCta_Fn7zOQHzsznW4=6cXLsQ@mail.gmail.com> <5da4e084.1c69fb81.567f9.4b9c@mx.google.com> <CAHp75Vcht2S7j64vUGw+DQdSEAyxuyBJ9oVwHyXxnL9bM1-wFA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH 01/10] leds: pca953x: Use of_device_get_match_data()
User-Agent: alot/0.8.1
Date:   Tue, 15 Oct 2019 15:41:58 -0700
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Andy Shevchenko (2019-10-15 02:02:01)
> On Mon, Oct 14, 2019 at 11:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > Quoting Andy Shevchenko (2019-10-14 10:50:06)
> > > On Sat, Oct 5, 2019 at 12:47 AM Stephen Boyd <swboyd@chromium.org> wr=
ote:
> > > >
> > > > This driver can use the of_device_get_match_data() API to simplify =
the
> > > > code. Replace calls to of_match_device() with this newer API under =
the
> > > > assumption that where it is called will be when we know the device =
is
> > > > backed by a DT node. This nicely avoids referencing the match table=
 when
> > > > it is undefined with configurations where CONFIG_OF=3Dn.
> > >
> > > > +       devid =3D (int)(uintptr_t)of_device_get_match_data(dev);
> > >
> > > > +               devid =3D (int)(uintptr_t)of_device_get_match_data(=
&client->dev);
> > >
> > > This still leaves it OF-centric.
> > > Better to use device_get_match_data().
> > >
> > > Also, I'm thinking that following may help to clean a lot of the i2c
> > > client drivers
> > >
> > > static inline // perhaps no
> > > const void *i2c_device_get_match_data(struct i2c_client *client, const
> > > struct i2c_device_id *id)
> > > {
> > >   if (id)
> > >     return (const void *)id->driver_data;
> > >   return device_get_match_data(&client->dev);
> > > }
> > >
> >
> > Looks alright to me. Maybe device_get_match_data() can look at the bus
> > and call some bus op if the firmware match isn't present? Then we can
> > replace a bunch of these calls with device_get_match_data() and it will
> > "do the right thing" regardless of what bus or firmware the device is
> > running on.
>=20
> It will be something ugly like
>=20
> buses {
> #ifdef I2C
> &i2c_bus_type,
> #endif
> ...
> }
>=20
> in the code. I won't do this.
>=20
> See generic_match_buses[] for example.

Why is it like generic_match_buses[]? I thought it would look at
struct device::of_node or struct device::fw_node and try to extract
device data out that and if that fails it would fallback to some new
function like struct bus_type::get_match_data() that does the right
thing for the bus. In the case of i2c it would extract the i2c_client's
i2c_device_id pointer and return it onwards.

