Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FDB2A3708
	for <lists+linux-leds@lfdr.de>; Tue,  3 Nov 2020 00:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgKBXPu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 18:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgKBXPu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 18:15:50 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80598C061A49
        for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2020 15:15:50 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id a20so14479362ilk.13
        for <linux-leds@vger.kernel.org>; Mon, 02 Nov 2020 15:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vANG7kCf7McNifCt4i3eNIRIg0UbrbcsPjzgcq/xupY=;
        b=h5jLblIVHQZxx1Tha8vSPTgmFm12uAoDpNRpw9JwOnw7wxb7HaVuyg/rzFb7Uin+PK
         zfamwZvGW9EXDR/1Z8lkaWsAd/Dzxp61RRhQEM9IsexjYWO18MheaPDRLsq0qkrJ0vxG
         RcDDwVRGEGwjG48kWlFIKgZhG399nXw50T63xkcGwa3llVps7XdDhtP7Nh+G0GciaGvo
         s1HvV7FrH9VimbPIGqpT6ShuZiUX6to6ls1L4Kk6DrO2Jr9K1wnrt54sOxvlDYBiDMw9
         /j8kuVpONSCDEHxZ25boboyHsp9J9ViqY/tpiBJm+w9BneEjzgUi5d2VPT6DgDI1wuL/
         U9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vANG7kCf7McNifCt4i3eNIRIg0UbrbcsPjzgcq/xupY=;
        b=H4LbhlKdRu+j/pBsVDFhz7PUt6CX9NDdt9OHRIyGR9DNKPKZ3kFpT/zUS+gg/faAdK
         NB53dCUbq6oImoLmVE030GcJTzrFEm6hfAvlrHCQB+CY2g2QWom/7GIvY5jQZWnbnmqg
         UQJ/k39ui78/X8QO8QeCOHGQK3uvyt4jRNQlf5XK5SE1yr/1gRtK9dBp5Sre8FIZ+tvV
         49SEK2D2PNQ2FwqUGbYaCVyXWyk5eDx75cQWDGZgJ24dAvSoVmGvYpIzYSSg+EeCuFOu
         3TbQDyTPUfBsMDw8uy8Phu+yMIBaqCdNOsa5LE8wP3npWBbsLppXXdUYXqwjLHQEGJUx
         jOhg==
X-Gm-Message-State: AOAM5332lJlnxhIUXKsisHVJbvOpmh9kIa79IlesG1hRczTTRsj1AgBi
        du1rMowr399RErTB/5vgA/iQ1rEUZYdji6vg2eqnoQ==
X-Google-Smtp-Source: ABdhPJw3EE9PKY+cfyHuSQbTgzBcg7DVDf56jRmLLrBnLhMwmJ/Y8HvnlTB3ZBgfqaXgoIWHTj3ut3M69FdvESf89GI=
X-Received: by 2002:a05:6e02:f12:: with SMTP id x18mr8305779ilj.145.1604358949644;
 Mon, 02 Nov 2020 15:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr> <CAHp75Vd81cK+nhJ1fxgRC6cEKnBELVA9UtT8VPvq7nbHEdhecQ@mail.gmail.com>
 <CADZsf3ZtQyEK6diz6W=6tZz+=Toyj_XYU33At0JiLutsuRrizA@mail.gmail.com> <CAHp75VdiLg6br=nztormkiXcS5CZVDxcG8i0mUv2X799zpYq5A@mail.gmail.com>
In-Reply-To: <CAHp75VdiLg6br=nztormkiXcS5CZVDxcG8i0mUv2X799zpYq5A@mail.gmail.com>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Tue, 3 Nov 2020 00:15:38 +0100
Message-ID: <CADZsf3YmNiF+wJNUiAUzLJhQe3FBHeS-FxYywQfFWu5r2_4T7g@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Andy,

On Mon, Nov 2, 2020 at 12:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Nov 1, 2020 at 3:22 PM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> > On Mon, Oct 26, 2020 at 11:54 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Oct 25, 2020 at 3:59 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> ...
>
> > > > +#include <linux/of_device.h>
> > >
> > > Don't see a user of this, but of_platform.h seems to be missed.
> >
> > Okay, I'll add it.
> > I'm still using devm_of_platform_populate() in iei_wt61p803_puzzle_probe().
>
> Yes, and that's why I have mentioned of_platform.h above.
>
> ...
>
> > > > +       struct kobject *kobj;
> > >
> > > It's quite strange you need this,
> >
> > This is used in iei_wt61p803_puzzle_sysfs_create() and
> > iei_wt61p803_puzzle_sysfs_remove() to clean up afterwards.
>
> I didn't get why you need this in the first place.
>
> ...
>
> > > > +       /* Return the number of processed bytes if function returns error */
> > > > +       if (ret < 0)
> > >
> > > > +               return (int)size;
> > >
> > > Will be interesting result, maybe you wanted other way around?
> >
> > That is intentional.
> > A single frame is concatenated in the iei_wt61p803_puzzle_process_resp()
> > function. In case we find ourselves in an unknown state, an error is
> > returned there.
> >
> > We want to discard the remaining incoming data, since the frame this
> > data belongs
> > to is broken anyway.
>
> Elaborate in the comment.

Okay.

>
> > > > +       return ret;
>
> ...
>
> > > > +err:
> > >
> > > err_unlock: ?
> >
> > I use goto only in case there is also a mutex to unlock, so I don't see why
> > to change this.
>
> The comment was about clarification of what is done at this label.

Ok, I understand. I will change the labels where mutexes are unlocked to
indicate this as you suggested.

>
> > > > +       mutex_unlock(&mcu->lock);
> > > > +       return ret;
>
> ...
>
> > > > +       /* Response format:
> > > > +        * (IDX RESPONSE)
> > > > +        * 0    @
> > > > +        * 1    O
> > > > +        * 2    S
> > > > +        * 3    S
> > > > +        * ...
> > > > +        * 5    AC Recovery Status Flag
> > > > +        * ...
> > > > +        * 10   Power Loss Recovery
> > > > +        * ...
> > > > +        * 19   Power Status (system power on method)
> > > > +        * 20   XOR checksum
> > > > +        */
> > >
> > > Shouldn't be rather defined data structure for response?
> >
> > Every response, apart from the standard headers and a checksum
> > at the end is completely different and I don't see a good way to
> > standardize that in some other way.
>
> And that's my point. Provide data structures for all responses you are
> taking care of.
> It will be way better documentation and understanding of this IPC.

Okay, I'll improve handling of these in the next patchset.
Should I make a generic header structure for the common parts and
define the common responses somewhere centrally?
Then I can check those just as you suggested.

For the variable ones I can reuse the generic header structure and just
use the specific values as I would do normally.

>
> ...
>
> > > > +               if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> > > > +                     resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> > > > +                     resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> > > > +                       ret = -EPROTO;
> > > > +                       goto err;
> > > > +               }
> > >
> > > I think it would be better to define data structure for replies and
> > > then check would be as simple as memcmp().
> >
> > I'd keep this as is, because the replies are different a lot of the times.
> > Especially when the reply isn't just an ACK.
>
> How do you know the type of the reply? Can't you provide a data
> structure which will have necessary fields to recognize this?
>

It can be recognized by the specific header of the reply.
I will separate the header and the checksum into some kind of a generic
structure, but as the content itself is just an arbitrary array of characters
I cannot generalize that sensibly for every type of a reply there is.

Anyway, I agree it would be good to define the common responses...

> ...
>
> > > > +       power_loss_recovery_cmd[3] = cmd_buf[0];
> > >
> > > One decimal (most significant) digit?! Isn't it a bit ambiguous?
> >
> > The power_loss_recovery_action can only have a value of 0 - 4.
> > My understanding is that if I give snprintf a buffer of size 1, it will
> > truncate the one character to make space for NUL.
>
> Why to bother with snprintf()? hex_asc[] would be sufficient. But my
> point that the code is fragile. If it ever gets 15, you will get 1.

Ok, I'll simplify this.

>
> ...
>
> > I can reduce this, but I'd just like to log the baud rate and the
> > firmware build info.
>
> > These two could be useful in a kernel log, if something doesn't work.
>
> FW build info is definitely good to have, but don't you have other
> means to retrieve baud rate?

The normal boot log is completely clean, there are no serdev bus specific
messages.

The baud rate is defined in the device tree, so if something goes wrong it
should be sufficient to only print the baud rate then.
Can I output the versions, the firmware build info and only print the baud
rate when an error occurs?

>
> --
> With Best Regards,
> Andy Shevchenko
