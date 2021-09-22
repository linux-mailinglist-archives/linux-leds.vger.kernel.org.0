Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF60F4148A8
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 14:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhIVMUh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 08:20:37 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:37637 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235506AbhIVMUb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Sep 2021 08:20:31 -0400
Received: by mail-vs1-f47.google.com with SMTP id q66so2741739vsa.4;
        Wed, 22 Sep 2021 05:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vrikb9Ho8VzljCpQHp0jCgoGt0Y/EwUBxEGEgOiz9Qs=;
        b=pkZkZlUZqAp97A0cfHL59k1jzK0onWZCuOxF+SWoRqYPilHCrIvtuhL6n+IcX37uw2
         DR6Y6WU4tEUi/ZWPN3sm5zBoRNDQ5FjBn3a4WjH1mFYu61Ph1+iPmn2pB6aiWxopCaTE
         tzZHDLh5htiwxL/bf8Q64XF3CzE+rBnH/gTYC0vgwC+xBNjQjWNY4/eoRYCe+PTb9eqp
         3qh+Gv2NasXVIoEYzKsoEf6ZQrEVcKamrnJPqZktTx2ihY3eI/E7cbnUoh2DzqNMs9zk
         99O1u3jamw7BNawtlVYaAqaVm1AP8/CGQoeOP9eqJNkBnonbbQ7zY1gxQv5d95f8W7Mw
         axyA==
X-Gm-Message-State: AOAM530oV/hTfKM7bLzXIlbOUOCv0cDC+Zik5F0dMSvvxac4RMX2gy4X
        6G/JnyOgldb0Le57o8JOpk6rFo2xnzfzjb0Eor0=
X-Google-Smtp-Source: ABdhPJxkZMXzJnL39+Tvgy5FhIT6q5LXs0mqYPFDXOdsIrdfgkix7qdxUDpf6ZFzMVMx8gXnR3iwylK5SkOBpjnbfY0=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr24720980vsl.37.1632313140297;
 Wed, 22 Sep 2021 05:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr> <YUsWeWlfanGMCpT8@kroah.com>
In-Reply-To: <YUsWeWlfanGMCpT8@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Sep 2021 14:18:49 +0200
Message-ID: <CAMuHMdU9Mes_kyOeRbgzcvCRLLj0_N_na88REEqejdrhSuzByA@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Max.Merchel@tq-group.com, Oleksij Rempel <linux@rempel-privat.de>,
        Daniel Palmer <daniel@0x0f.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        pavo.banicevic@sartura.hr, Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, goran.medic@sartura.hr,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Greg,

On Wed, Sep 22, 2021 at 1:41 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Aug 24, 2021 at 02:44:33PM +0200, Luka Kovacic wrote:
> > +++ b/drivers/mfd/iei-wt61p803-puzzle.c
> > @@ -0,0 +1,908 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* IEI WT61P803 PUZZLE MCU Driver
> > + * System management microcontroller for fan control, temperature sensor reading,
> > + * LED control and system identification on IEI Puzzle series ARM-based appliances.
> > + *
> > + * Copyright (C) 2020 Sartura Ltd.
>
> It is 2021 now :(

IANAL, but if the driver was published first in 2020 (v1 of the patch),
"2020" should be fine.

It's not that Disney is allowed to increase the copyright year every time
Snowy White is played in a movie theatre ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
