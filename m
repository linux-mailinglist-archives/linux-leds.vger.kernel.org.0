Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB42B1C72A9
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 16:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgEFOUG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 May 2020 10:20:06 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52635 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgEFOUF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2020 10:20:05 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Miqzy-1itiIJ17Qq-00er3s; Wed, 06 May 2020 16:20:03 +0200
Received: by mail-qt1-f170.google.com with SMTP id s30so1576546qth.2;
        Wed, 06 May 2020 07:20:03 -0700 (PDT)
X-Gm-Message-State: AGi0PuYzDRUmZCYTen71ciC7oV3hJaXVkIuxQxCG4i8E0AN7Jb8r6ys1
        49nx+IHuHa6UIuvCvRtsYAQSVin9wxYEp5L5TWY=
X-Google-Smtp-Source: APiQypLJ17dX5DND6148Q5+UsfiLvZmQnsYZDHytTDg94TtFOaytjQi5WUV0VjyWP4Byu0WvwHN6f9unq/lDikTgDy8=
X-Received: by 2002:ac8:6696:: with SMTP id d22mr1418683qtp.304.1588774802043;
 Wed, 06 May 2020 07:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141928.923428-1-arnd@arndb.de> <20200506024416.GB415100@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200506024416.GB415100@ubuntu-s3-xlarge-x86>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 6 May 2020 16:19:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3wqiXAx2GuKJjY90qLGNnyBNTst6LW7n6tRDvzvBQVVQ@mail.gmail.com>
Message-ID: <CAK8P3a3wqiXAx2GuKJjY90qLGNnyBNTst6LW7n6tRDvzvBQVVQ@mail.gmail.com>
Subject: Re: [PATCH] leds: lm355x: avoid enum conversion warning
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Bryan Wu <bryan.wu@canonical.com>,
        "G.Shark Jeong" <gshark.jeong@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:pYyoI1J8gUpxFMCxSUeaYinOPFIEeeQlBbkGh3K6lFnYpDltend
 mIq0SdiuAkBpiLbiUnt6WAQLzmHBUQFt7ITZWTYaNUtTnI+gxMEiMO1jlZDBSNAWVH9risA
 BToUfGEEpJWmbfl9uNBqsZxYfJV7n9sHBXHby0zmL4Mr9JhxdmNWVxd2nt0EPqhAcYvGb7p
 qJ3Z+R2CeT/oeLYOHv54A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rl8sl2ocEX0=:fWAp15AHmNUBDQ4Kc91v6H
 eNMhxChT/NuaVG5ZgTUzh3LalFtIb6cYMrjgXpidFfR7zJ4BHs2NLY/O/JGqvyj293a3nVEeD
 cxl3XFfWpQGee6YVxgcVNOQl3jGguKuWMbVw2pcw2vhZqVMkiJGyMPN40Dub5K2l6elXKDlMZ
 TNDfDgv2u6h30hzeA//dObmanDC8ISJ84+kL7dPoR+KobkLq2695AbdZ4J6gpJqMmagkNLJAK
 QpCXdaTXg885dRM0lQXlB5ouiCsbAujjbdGD5eDKRGjNwlTyEanZgLBaiw8Tg1zjcl9p8VvFB
 cHC/gNzmggBvhZhz/VzdnzaaNgbOxIq7MV+RaDE/gFXzt0x2jQw59VSv+AMllYHt6SdkvZJDy
 fmdTGaYs+1Ar4SFlRVfbyq6a9nhzgv4CXljt8fyDxOQMDLF5GWWp4xYnki2T/Drw/UnRIRY/F
 YucLLobC/ahth/Tf1Rf2ZgoVQtf3Kh31/jra7URrd2jLa4jaTuoaTiLAMv9gJobqPJizJB8cR
 PKWTUlC3GikG4KlhVFnEUWTRx3FwgplKJ5JgZK0rFMZ5vufMEabdVJ5aSh82WaUdEAJgGzXWr
 hLHuExw62YpWllT8YgEDVzFKCCc/2bZYxCMlYrHpNGgCnxYXUFn/lx9mP10umMp1EkO2GUQWB
 ufv91TnMeGFJ1ckmch3Mu8HSAyVYZw5hOLe+poZQ0dlMXxBUqx6YgKRAtEbrsw9umQdBGdsbt
 J+eJBYchyq2ytYiE5+4M+jnGzLVH3clsnPKf3X04jRyFboSlBGLo8lo/zhs/+qga4fHkT4842
 Tty52xMn5FpR7pa88Iq6U+t5EtA9MkU2mZo+whzVr6tSwHFTA4=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, May 6, 2020 at 4:44 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, May 05, 2020 at 04:19:17PM +0200, Arnd Bergmann wrote:
> > clang points out that doing arithmetic between diffent enums is usually
>                                                  ^ different
> > a mistake:
> >
> > drivers/leds/leds-lm355x.c:167:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
> >                 reg_val = pdata->pin_tx2 | pdata->ntc_pin;
> >                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> > drivers/leds/leds-lm355x.c:178:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
> >                 reg_val = pdata->pin_tx2 | pdata->ntc_pin | pdata->pass_mode;
> >                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> >
> > In this driver, it is intentional, so add a cast to hide the false-positive
>
> Not sure that I would call this a false positive. The warning is correct
> that there is a bitwise operation between different enumeration types
> but we do not care since we are just using the enumerated type for its
> integer value in lieu of a #define VAR value.

Right, I meant that the code works as intended and said "false positive"
to avoid claiming the driver is broken when this was a deliberate
design point.

We do want clang to warn about this though as you say, so I can
rephrase it to explain that both the driver and the compiler work
as intended but they clash in their views of how to do it ;-)

> > -             reg_val = pdata->pass_mode;
> > +             reg_val = (u32)pdata->pass_mode;
>
> Is this cast needed? I don't think there should be warning from going
> from an enumerated type to unsigned int.

This cast is not needed for warnings, I added it for consistency because
it seemed odd to cast only four of the five enums. I can remove if though
if you think it's clearer without the cast.

There may also be a different solution in completely removing the
lm355x_chip_init() function, as it was added at a time when we
were converting the last board files into devicetree, and there has
never been a board file defining lm355x_platform_data.

There is unfortunately no DT support either in it, so I assume we
could just remove the driver completely, or change it to use a
DT binding similar to
Documentation/devicetree/bindings/leds/leds-lm36*.txt

LED maintainers, any opinions on this?

     Arnd
