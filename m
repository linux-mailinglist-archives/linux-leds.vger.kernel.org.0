Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB904D6AF1
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 22:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731590AbfJNUyb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 16:54:31 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37388 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731570AbfJNUya (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 16:54:30 -0400
Received: by mail-pg1-f193.google.com with SMTP id p1so10752189pgi.4
        for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2019 13:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=95ESZvb6hY/1oI03oQhYfYM4zdjk2hIsXx4a/gPdDg0=;
        b=LDIPIlBMzwu89BYY277hY2x1yQ6+BbzLmB02F76DS3jp9EF27RWfpAGf6PCW/Zt6PK
         W3rvy9pT/uJTuI9zriXHphkOreHYFYZ/TccSgt3DupK0Z8liwntFavnqti6aJYmA3auB
         RT2Z7fYZyy133IoITNtgtJbGg4Nv8H/llzUuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=95ESZvb6hY/1oI03oQhYfYM4zdjk2hIsXx4a/gPdDg0=;
        b=GEzqJ/IHZER5QjHDqEtEcLAkaTrOsm6+3tafDA4BBtN39U3t9bPSZrci2G7LPPFnK0
         Y5UbqzgIHZjQxFX8KGoyfHeRsnLclCRm4nM4iSNuss/c3QaUN7c/lyOJuI9K8k0yObV0
         OJcZa9aObCirRi4y8p0zH2F+6IugLUGT1o7/qlirF9X4GZCjnRFMWTn4vQxQ6TuBC9ak
         yL6XmlMj1KCe8BdXIY5cZy3gnGYR9zabNtZXQllXRSP/6otPxppmQdut5IinwLSOd6Tp
         TKJD6eyxz3kW5oX38740g1/NCTK42OAX0UXrBSBknFTzhDh1tiMyO3dRS9MW+sq3KlL7
         Drrg==
X-Gm-Message-State: APjAAAUIyC23vJMpCHFsk7j/os7shdILkBx7RgQOrmGdH9dNI+SZTEDX
        bo0lsdW5sXYGiw10E3uCU6CnbA==
X-Google-Smtp-Source: APXvYqze6dhlWjrga/yBdXEdpzKX+Qt8+IQ23tHt2i0c5hknDE1KOExAQ1qoVzk2cd889pMAIxeHVw==
X-Received: by 2002:a17:90a:5d0f:: with SMTP id s15mr37927966pji.126.1571086469798;
        Mon, 14 Oct 2019 13:54:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 11sm18080943pgd.0.2019.10.14.13.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 13:54:28 -0700 (PDT)
Message-ID: <5da4e084.1c69fb81.567f9.4b9c@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHp75Vebn48hbzqKWzV3aj4NEBCta_Fn7zOQHzsznW4=6cXLsQ@mail.gmail.com>
References: <20191004214334.149976-1-swboyd@chromium.org> <20191004214334.149976-2-swboyd@chromium.org> <CAHp75Vebn48hbzqKWzV3aj4NEBCta_Fn7zOQHzsznW4=6cXLsQ@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
Date:   Mon, 14 Oct 2019 13:54:27 -0700
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Andy Shevchenko (2019-10-14 10:50:06)
> On Sat, Oct 5, 2019 at 12:47 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > This driver can use the of_device_get_match_data() API to simplify the
> > code. Replace calls to of_match_device() with this newer API under the
> > assumption that where it is called will be when we know the device is
> > backed by a DT node. This nicely avoids referencing the match table when
> > it is undefined with configurations where CONFIG_OF=3Dn.
>=20
> > +       devid =3D (int)(uintptr_t)of_device_get_match_data(dev);
>=20
> > +               devid =3D (int)(uintptr_t)of_device_get_match_data(&cli=
ent->dev);
>=20
> This still leaves it OF-centric.
> Better to use device_get_match_data().
>=20
> Also, I'm thinking that following may help to clean a lot of the i2c
> client drivers
>=20
> static inline // perhaps no
> const void *i2c_device_get_match_data(struct i2c_client *client, const
> struct i2c_device_id *id)
> {
>   if (id)
>     return (const void *)id->driver_data;
>   return device_get_match_data(&client->dev);
> }
>=20

Looks alright to me. Maybe device_get_match_data() can look at the bus
and call some bus op if the firmware match isn't present? Then we can
replace a bunch of these calls with device_get_match_data() and it will
"do the right thing" regardless of what bus or firmware the device is
running on.

