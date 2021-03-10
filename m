Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5DA334429
	for <lists+linux-leds@lfdr.de>; Wed, 10 Mar 2021 17:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbhCJQ5g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Mar 2021 11:57:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:42562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233487AbhCJQ5V (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 10 Mar 2021 11:57:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C62064FC6;
        Wed, 10 Mar 2021 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615395441;
        bh=7EPZCx1Jd6j+5JvWItU2mc7CzKenjGrlOjY+LeI07HY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qW9lxbfVe0k8xgBznzfCKN1FitWzQczC9iy+z3yAVC8CNjzqdYqKfvccWmpJa1EDg
         O7i45sEeEnKg8RzRU0TYVJzelJNDlcOa3zm7VrxPHunrD/7RfLyu/wKS+rbRv6YgGw
         9cnrSykAIf4fiRTNnuxNJxlzUuDA80W45lWcVsAh900xq7ZLhy229cDB26vFAaVdf3
         6bzjdftexhCwLWTHEZ0wfdDzQgW5Y/mYa+jxu56a4H6DuY2E3yOR1d//W5mQ/Cxhwr
         BtXJDUL8HuyBlzwT+QnqnFEESnJkRnuXvN3noSM0CfEmEcF6OPx49cwAnmi9/Mj70Q
         MEINIuqz6sacw==
Received: by mail-ot1-f53.google.com with SMTP id e45so17024574ote.9;
        Wed, 10 Mar 2021 08:57:21 -0800 (PST)
X-Gm-Message-State: AOAM532ly4WIWl7RE6tutqQG0Mox67k5GczGhr/NtYNDxhvNLhQrrjr0
        IlViYl1bx6Lfaz75/l8jFTvjG/26qBOwEHxG1QE=
X-Google-Smtp-Source: ABdhPJym2TmutaYFYi2OOEkhU61s/4pWgWKfwj3mn9aXGF8IMYl9Y/GSV4KtAuFoKJcwJ0EVTvsO9w/nQ2qoVSIzId4=
X-Received: by 2002:a9d:6341:: with SMTP id y1mr3312842otk.210.1615395440911;
 Wed, 10 Mar 2021 08:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20210308153052.2353885-1-arnd@kernel.org> <20210309180851.GA4669@duo.ucw.cz>
 <20210309193910.GA7507@amd> <YEgeoPqCCgTUEsSc@angband.pl> <20210310072831.GA29779@amd>
In-Reply-To: <20210310072831.GA29779@amd>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 10 Mar 2021 17:57:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
Message-ID: <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
Subject: Re: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Mar 10, 2021 at 8:30 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > > I'd like people from Intel to contact me. There's more to fix there,
> > > > and AFAICT original author went away.
> > >
> > > The following message to <mallikarjunax.reddy@linux.intel.com> was
> > > undeliverable.
> >
> > > <mallikarjunax.reddy@linux.intel.com>: Recipient
> > > +address rejected: User unknown in virtual mailbox table'
> >
> > > commit c3987cd2bca34ddfec69027acedb2fae5ffcf7a0
> > > Author: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> >
> > I asked around, and got told Mallikarjuna has been "sold" to MaxLinear,
> > together with the rest of the Connected Home Division.  So he most likely
> > still works on this stuff, just under a different banner.
> >
> > > If someone knows how to contact the author, that would be welcome.
> >
> > Alas, no idea about his MaxLinear address.
>
> Thanks for the effort. Anyway, I suspect I'll just do this:

Maybe Hauke or John  (added both to cc) know who at MaxLinear is
responsible for maintaining the Lightning Mountain drivers now.

       Arnd

> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
> index 6dedc58c47b3..79493f21d365 100644
> --- a/drivers/leds/blink/Kconfig
> +++ b/drivers/leds/blink/Kconfig
> @@ -1,14 +1,6 @@
> -menuconfig LEDS_BLINK
> -       bool "LED Blink support"
> -       depends on LEDS_CLASS
> -       help
> -         This option enables blink support for the leds class.
> -         If unsure, say Y.
> -
> -if LEDS_BLINK
> -
>  config LEDS_BLINK_LGM
>         tristate "LED support for Intel LGM SoC series"
> +       depends on BROKEN
>         depends on GPIOLIB
>         depends on LEDS_CLASS
>         depends on MFD_SYSCON
> @@ -17,5 +9,3 @@ config LEDS_BLINK_LGM
>           Parallel to serial conversion, which is also called SSO controller,
>           can drive external shift register for LED outputs.
>           This enables LED support for Serial Shift Output controller(SSO).
> -
> -endif # LEDS_BLINK
>
>
> --
> http://www.livejournal.com/~pavelmachek
