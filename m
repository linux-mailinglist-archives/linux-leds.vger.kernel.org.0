Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1E64194E0
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 15:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhI0NOZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 09:14:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234421AbhI0NOZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Sep 2021 09:14:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 788166113A;
        Mon, 27 Sep 2021 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632748367;
        bh=BbvgKOUZih7nOihlx2zt2uq5DrvyXDfq+MIjMucsX/k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cBaz4AVoEhH2ljsCp3F6K1F8qSEPoM1dsr09Abwn729rpxa7EaU0Qj2t5rZWv2HDw
         ZF/TLfYSzM3a2HdPhtyA/5KB5NOVrFI+0bpKZJFvLnljrXUeWJuKI1TA8NwCdCU93d
         N44upETYaGhmklOIvu9XWUKzFbcuURQCp/UtezlURlYlV7qHzY4mAf1WeKzoGvlEFQ
         6CMdMZIg9XO4U3L28lGJm3rp7EBQvrIfOb9KfahMNzv67XSef/irBJbZnfq7rJH7vt
         K+bqal6yLpJhf1A9nnum08kftNUKyoAmmvqoIyVv4bhhjeII5VYwln9nKvtSSc/IdF
         YLzlNudVZAWgA==
Received: by mail-wm1-f51.google.com with SMTP id f78-20020a1c1f51000000b0030cdb3d6079so427640wmf.3;
        Mon, 27 Sep 2021 06:12:47 -0700 (PDT)
X-Gm-Message-State: AOAM531UvhSAyKzXZYBStvdjX99kfm1AWK6JCTTnJrLUOn0LA2vOcylR
        NgaGKJVsTERFkciwnPeA288HgKA6yBIWq5N5vks=
X-Google-Smtp-Source: ABdhPJzTSRbiVPk+bvar9Y+L5k4f2AMm5Qvczr+xz/shSDHdnx3qacYRizrK/ymB2IlZH3eRiQX2VusXQa7XwY363js=
X-Received: by 2002:a1c:7413:: with SMTP id p19mr15989778wmc.98.1632748365942;
 Mon, 27 Sep 2021 06:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210927101610.1669830-1-arnd@kernel.org> <YVGbU1lYp6/5HyRy@kroah.com>
In-Reply-To: <YVGbU1lYp6/5HyRy@kroah.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 27 Sep 2021 15:12:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1-w-hd5OSyhP=Ja5nxrtRDjus-MkazbcWqaiv3q4vLjw@mail.gmail.com>
Message-ID: <CAK8P3a1-w-hd5OSyhP=Ja5nxrtRDjus-MkazbcWqaiv3q4vLjw@mail.gmail.com>
Subject: Re: [PATCH] led-class-flash: fix -Wrestrict warning
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-leds@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 27, 2021 at 12:22 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Sep 27, 2021 at 12:15:59PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > drivers/leds/led-class-flash.c: In function 'flash_fault_show':
> > drivers/leds/led-class-flash.c:210:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
> >   210 |         return sprintf(buf, "%s\n", buf);
> >       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/leds/led-class-flash.c:187:54: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
> >   187 |                 struct device_attribute *attr, char *buf)
> >       |                                                ~~~~~~^~~
> > cc1: all warnings being treated as errors
> > make[5]: *** [scripts/Makefile.build:277: drivers/leds/led-class-flash.o] Error 1
> > make[5]: Target '__build' not remade because of errors.
> > make[4]: *** [scripts/Makefile.build:540: drivers/leds] Error 2
> > drivers/thunderbolt/xdomain.c: In function 'modalias_show':
> > drivers/thunderbolt/xdomain.c:733:16: error: 'sprintf' argument 3 overlaps destination object 'buf' [-Werror=restrict]
> >   733 |         return sprintf(buf, "%s\n", buf);
> >       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/thunderbolt/xdomain.c:727:36: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
> >   727 |                              char *buf)
> >
>
> You also have a thunderbolt change in here as well :(

Oh, and I forgot to explain the change, clearly this one was meant to go
into the 'rework, then send' pile of my fixes.

v2 coming in a bit.

       Arnd
