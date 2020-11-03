Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B542A3FF9
	for <lists+linux-leds@lfdr.de>; Tue,  3 Nov 2020 10:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgKCJ1g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Nov 2020 04:27:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgKCJ1g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Nov 2020 04:27:36 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7D9C0613D1;
        Tue,  3 Nov 2020 01:27:35 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b3so13699758pfo.2;
        Tue, 03 Nov 2020 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+oevH5NOXWY8mC/dfPuihrEtVh3WiYap02zfyjnacds=;
        b=cZEWxAHfEiuSTnTcJQ15sdqWmH2t5Z5yIoDZvD1nnKmv6iWFq9gVbTdAmM+CGFwNCj
         AmkoT6d5o8Gk+CRN5DsRS9egoLOWg6k6vW3oVCTgC1TnHFN+qSbLiUrjLcadgs4conZ1
         elvawYaQXYi+C5/5fv5ezoD/jKAC32fb+pH4iTP51fg6cVls1KqEXDk8da9vSJ8dU6/z
         qIr4RvW9RQvhcMHbwpULFhUXQY6niynhQQs2ixvIBulRsjV+X+mSWwxpcdK9R/nSyWpw
         BN4qIslUqG9paEzL8dbG5ClXa69lkQlMWbJPPtRJ6/eG6LccffJW5AoB1rLtHEqzO74p
         AobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+oevH5NOXWY8mC/dfPuihrEtVh3WiYap02zfyjnacds=;
        b=AwZdWHwxpMrqguD4vZJ8qhfAGqPrZMBxZy5tdsGomT2N6IPmP+AQfN6FkOa4p7Luln
         ThKzUHNYApDb0BOSM3rWSedG+Y7Bmo2+47kXvVXzHtMhiGuhwuL5mNN6KGpicq6QFGpa
         gCc4lqZadG6vIIfK5Q6olYn5PhzYmGy7zQ8TxV7ItyYr6Cqsh9B6FASI94Nb8Z1cVJSV
         VkD0BmQHHs4GSoafuCZSu8fBsRmInwZPD4hltGjPT2vY5+R8IU+UW3+XTTALK/avgH18
         /xSIvgxApx844HT4oDr5FB24DOVIyjebDDTDmbze5TwNvRpTt5/MWo8DSboaRsIPieAW
         MbLQ==
X-Gm-Message-State: AOAM533ghdk5jca/LBLbwdnvmW31lO8xo5bXVml25rQdfIXOBVIeU33f
        /ppk0+bwh9KnVA+clnRgAKo96aqbRLzJaOIQ8d4=
X-Google-Smtp-Source: ABdhPJwO3dn0tLoNPhZ4KT89FW3uSmGbx6Nx0h1SKcagkBJoNF4BJOhGU4ulCbvx/vsiAPgChLADh19c9ZU5aiyJxeg=
X-Received: by 2002:a17:90a:430b:: with SMTP id q11mr2874342pjg.129.1604395655266;
 Tue, 03 Nov 2020 01:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
 <20201025005916.64747-3-luka.kovacic@sartura.hr> <CAHp75Vd81cK+nhJ1fxgRC6cEKnBELVA9UtT8VPvq7nbHEdhecQ@mail.gmail.com>
 <CADZsf3ZtQyEK6diz6W=6tZz+=Toyj_XYU33At0JiLutsuRrizA@mail.gmail.com>
 <CAHp75VdiLg6br=nztormkiXcS5CZVDxcG8i0mUv2X799zpYq5A@mail.gmail.com> <CADZsf3YmNiF+wJNUiAUzLJhQe3FBHeS-FxYywQfFWu5r2_4T7g@mail.gmail.com>
In-Reply-To: <CADZsf3YmNiF+wJNUiAUzLJhQe3FBHeS-FxYywQfFWu5r2_4T7g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Nov 2020 11:27:19 +0200
Message-ID: <CAHp75Vd33q+chaFS1h971dB7QphmhORSYwwA0b+tgkVTmsbtWw@mail.gmail.com>
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

On Tue, Nov 3, 2020 at 1:15 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> On Mon, Nov 2, 2020 at 12:18 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Nov 1, 2020 at 3:22 PM Luka Kovacic <luka.kovacic@sartura.hr> wrote:
> > > On Mon, Oct 26, 2020 at 11:54 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sun, Oct 25, 2020 at 3:59 AM Luka Kovacic <luka.kovacic@sartura.hr> wrote:

...

> > > > > +       /* Response format:
> > > > > +        * (IDX RESPONSE)
> > > > > +        * 0    @
> > > > > +        * 1    O
> > > > > +        * 2    S
> > > > > +        * 3    S
> > > > > +        * ...
> > > > > +        * 5    AC Recovery Status Flag
> > > > > +        * ...
> > > > > +        * 10   Power Loss Recovery
> > > > > +        * ...
> > > > > +        * 19   Power Status (system power on method)
> > > > > +        * 20   XOR checksum
> > > > > +        */
> > > >
> > > > Shouldn't be rather defined data structure for response?
> > >
> > > Every response, apart from the standard headers and a checksum
> > > at the end is completely different and I don't see a good way to
> > > standardize that in some other way.
> >
> > And that's my point. Provide data structures for all responses you are
> > taking care of.
> > It will be way better documentation and understanding of this IPC.
>
> Okay, I'll improve handling of these in the next patchset.
> Should I make a generic header structure for the common parts and
> define the common responses somewhere centrally?

Yes, something like TCP/IP headers have.
This will immediately show how good/bad was design of this IPC
protocol (as a side effect, but gives a good hint on how layers of
messages are looking )

> Then I can check those just as you suggested.
>
> For the variable ones I can reuse the generic header structure and just
> use the specific values as I would do normally.

...

> > > > > +               if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
> > > > > +                     resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
> > > > > +                     resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
> > > > > +                       ret = -EPROTO;
> > > > > +                       goto err;
> > > > > +               }
> > > >
> > > > I think it would be better to define data structure for replies and
> > > > then check would be as simple as memcmp().
> > >
> > > I'd keep this as is, because the replies are different a lot of the times.
> > > Especially when the reply isn't just an ACK.
> >
> > How do you know the type of the reply? Can't you provide a data
> > structure which will have necessary fields to recognize this?
> >
>
> It can be recognized by the specific header of the reply.
> I will separate the header and the checksum into some kind of a generic
> structure, but as the content itself is just an arbitrary array of characters
> I cannot generalize that sensibly for every type of a reply there is.
>
> Anyway, I agree it would be good to define the common responses...

Yep, something to look like a structure with a payload.

...

> Can I output the versions, the firmware build info and only print the baud
> rate when an error occurs?

What you think is crucial. I'm not against it, I'm just pointing to
the way of shrinking as much as possible. Otherwise, move messages to
debug level (but that shouldn't be many in the production driver).

-- 
With Best Regards,
Andy Shevchenko
