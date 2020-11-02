Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834572A28E6
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 12:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgKBLSZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 06:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgKBLSX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 06:18:23 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A6DC0617A6;
        Mon,  2 Nov 2020 03:18:22 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so3226923pgg.12;
        Mon, 02 Nov 2020 03:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+MIXEkaPvd+9Nl/3v8IX3DE8ILYKxiL+WZEl2aSsPzQ=;
        b=B+jKXi4BJFhu7JS7Gsd0UtDcbO4S3DA93rB+zwxobWwQBysTJDYrh76qIOE0oHKWnB
         Q2MTH0+CIiUaMSmw/I7MPjWidchn3evd+YYAPsUxH2wNGcCuUJaXE1zm+nYaEASHi0et
         gKsSdyAT8yDRKEMVxTZNn6FI53kNZJ+Lr1HbPwvVfkXlEzW/pMR91I4Fe/D2lZIOayhq
         kb31fvfnb4WKoZ0S1Fxr1A4pLd5iZ8ijDdDckMiw7gq7qFL1OeO+MnGyCAlEv3g/oaPn
         Dnr2vHGfqyluQG4G1l9oT1mZIXxui1K/O8xQ/7Y2WNLqdvU2GgJQtlflm8mViULvAT7+
         0b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+MIXEkaPvd+9Nl/3v8IX3DE8ILYKxiL+WZEl2aSsPzQ=;
        b=fDWAizz3mvYbHmf4B7eCqgWg+U6CUuLBUve21EksqJeSeTWzxwBrpwCa+2byemspII
         jEynMMI+5mIu2jPgtT/raFIn4kfHF9DzNKg24tFhBfhg8RDetec/Y/+nnHPx6rZfIek7
         cfkKgd0cYeei+Qsm+iHXNJcK1QjIk0miHPeruOdGmfWfajBn8YZ9hAhFWOOu9zvhOsVc
         1ZpkPI4JOpVqZQAjQbCxPupwnYcNI0kpp3XB/E3JI/y+c/U7sqODNPFUb/kAMTPAs3rh
         9nxwOyvEf983L9yWMei1EQWDKQVcE7D/szBNKDG+5YZaB+7v1qWxZ0wWrTNYOVD4eUzG
         hZ1Q==
X-Gm-Message-State: AOAM5334cv4RU/PkFtXFQ66Usf6+tFjCg6gqmQ1OzJk9pNks6XZFd+IE
        UFgVvdMczAEhga84HwzQauuAnKzd3dObcJvM4kc=
X-Google-Smtp-Source: ABdhPJzy8FgUUD7Bk78EG0I/HO29QfuSMPIYsqMmX0zaRrJfN//t8govXn+wNFyKhlCZU1bi/05m/yBmAu9l9U3QYBY=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr17558180pjb.228.1604315901720;
 Mon, 02 Nov 2020 03:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr> <CAHp75Vd81cK+nhJ1fxgRC6cEKnBELVA9UtT8VPvq7nbHEdhecQ@mail.gmail.com>
 <CADZsf3ZtQyEK6diz6W=6tZz+=Toyj_XYU33At0JiLutsuRrizA@mail.gmail.com>
In-Reply-To: <CADZsf3ZtQyEK6diz6W=6tZz+=Toyj_XYU33At0JiLutsuRrizA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Nov 2020 13:19:10 +0200
Message-ID: <CAHp75VdiLg6br=nztormkiXcS5CZVDxcG8i0mUv2X799zpYq5A@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
To:     Luka Kovacic <luka.kovacic@sartura.hr>
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

On Sun, Nov 1, 2020 at 3:22 PM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> On Mon, Oct 26, 2020 at 11:54 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Oct 25, 2020 at 3:59 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:

...

> > > +#include <linux/of_device.h>
> >
> > Don't see a user of this, but of_platform.h seems to be missed.
>
> Okay, I'll add it.
> I'm still using devm_of_platform_populate() in iei_wt61p803_puzzle_probe().

Yes, and that's why I have mentioned of_platform.h above.

...

> > > +       struct kobject *kobj;
> >
> > It's quite strange you need this,
>
> This is used in iei_wt61p803_puzzle_sysfs_create() and
> iei_wt61p803_puzzle_sysfs_remove() to clean up afterwards.

I didn't get why you need this in the first place.

...

> > > +       /* Return the number of processed bytes if function returns error */
> > > +       if (ret < 0)
> >
> > > +               return (int)size;
> >
> > Will be interesting result, maybe you wanted other way around?
>
> That is intentional.
> A single frame is concatenated in the iei_wt61p803_puzzle_process_resp()
> function. In case we find ourselves in an unknown state, an error is
> returned there.
>
> We want to discard the remaining incoming data, since the frame this
> data belongs
> to is broken anyway.

Elaborate in the comment.

> > > +       return ret;

...

> > > +err:
> >
> > err_unlock: ?
>
> I use goto only in case there is also a mutex to unlock, so I don't see why
> to change this.

The comment was about clarification of what is done at this label.

> > > +       mutex_unlock(&mcu->lock);
> > > +       return ret;

...

> > > +       /* Response format:
> > > +        * (IDX RESPONSE)
> > > +        * 0    @
> > > +        * 1    O
> > > +        * 2    S
> > > +        * 3    S
> > > +        * ...
> > > +        * 5    AC Recovery Status Flag
> > > +        * ...
> > > +        * 10   Power Loss Recovery
> > > +        * ...
> > > +        * 19   Power Status (system power on method)
> > > +        * 20   XOR checksum
> > > +        */
> >
> > Shouldn't be rather defined data structure for response?
>
> Every response, apart from the standard headers and a checksum
> at the end is completely different and I don't see a good way to
> standardize that in some other way.

And that's my point. Provide data structures for all responses you are
taking care of.
It will be way better documentation and understanding of this IPC.

...

> > > +               if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> > > +                     resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> > > +                     resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> > > +                       ret = -EPROTO;
> > > +                       goto err;
> > > +               }
> >
> > I think it would be better to define data structure for replies and
> > then check would be as simple as memcmp().
>
> I'd keep this as is, because the replies are different a lot of the times.
> Especially when the reply isn't just an ACK.

How do you know the type of the reply? Can't you provide a data
structure which will have necessary fields to recognize this?

...

> > > +       power_loss_recovery_cmd[3] = cmd_buf[0];
> >
> > One decimal (most significant) digit?! Isn't it a bit ambiguous?
>
> The power_loss_recovery_action can only have a value of 0 - 4.
> My understanding is that if I give snprintf a buffer of size 1, it will
> truncate the one character to make space for NUL.

Why to bother with snprintf()? hex_asc[] would be sufficient. But my
point that the code is fragile. If it ever gets 15, you will get 1.

...

> I can reduce this, but I'd just like to log the baud rate and the
> firmware build info.

> These two could be useful in a kernel log, if something doesn't work.

FW build info is definitely good to have, but don't you have other
means to retrieve baud rate?

-- 
With Best Regards,
Andy Shevchenko
