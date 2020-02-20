Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F18165B5E
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 11:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgBTKWp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 05:22:45 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35786 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgBTKWp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 05:22:45 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so702938pjc.0;
        Thu, 20 Feb 2020 02:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X1iVrbEe5HI+WzLO15gODwW6rZL/OTMzbBzRb8jX2NQ=;
        b=AzTP38YRlBEugdQFVd9RrmSBpuchkvsKlo2/eWRtKHjhO+JsMTIyBb2SqgbT0yPMgv
         2+VPManZc9qdlMpGLyTNTSRyW02IwK5fdNnJ1FolWVJQxcHCuX8MGbahODKEGhL2NObS
         5pxxKv+HytcuoHFWFBor/97OCjihn96JXQtYVFl15x3JZnb6a+FdClXn1p+QvrZsYt2t
         mvGBWdv0pff94x7bZGXE+oQOw8WtOZRuqtLPkvAf2u9plwofgGoG/M5FCpmpAr3Km4N2
         suNgSJdrffd4I7ahRe0pfxdpVzjIP/Gf5msOSimRlhXEL9+HjIfwnBAbEaI5k/IoDfLt
         R/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X1iVrbEe5HI+WzLO15gODwW6rZL/OTMzbBzRb8jX2NQ=;
        b=Qw9sGRgbxaGA7C8j/LBkDlJuQco3HXk6qLS2j37DdAQ63r6rR45PXHAiJQKk6/BhVc
         ixGcfIViIaV5zh79acjZ6CunpbNhYME7jt3Im9R/eSv1nQKCU04g+1N7ytXS+KWhqFgV
         1l41KKwj6a2AIsbfWqnMbLeQo0n3SneeKE4iydQfkT7vnUJfTDzjeOla/+aypGyxKgfY
         I0nkt3EIbKRLpNcwz0BP/YGkgqe1ft0dXphZ5FnppdFRqt6NHBdIoJYRr4J0q3gKeR4d
         iS8LSLS2Ow19aXRyj8nKWc+xlndSRYB8rpTIA8wXt5ohq3f1Dpx49IprZUSbNNAwORgW
         cGfA==
X-Gm-Message-State: APjAAAXrmQenUyuqW5yaEPjUVjm8LoQ3h8CIcvQZXLWPl5RDlj7IgBM1
        jv6d0HuZQLbXxG7ts7Tcljd4ZQ8YFqq+bts31Zw=
X-Google-Smtp-Source: APXvYqxAaB3iot4nYemzWfGV3k8YCDIQwKiih0xwPUYqI3HZ6VGS7HsHV7/tk8EzeCBAoqSZv803ReVlUUbeoEYbeZc=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr2770055pjb.30.1582194164374;
 Thu, 20 Feb 2020 02:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20200213091600.554-1-uwe@kleine-koenig.org> <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com> <20200220074901.ohcrisjgd26555ya@pengutronix.de>
In-Reply-To: <20200220074901.ohcrisjgd26555ya@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Feb 2020 12:22:36 +0200
Message-ID: <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 20, 2020 at 9:49 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Feb 19, 2020 at 09:50:54PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 13, 2020 at 11:27 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koen=
ig.org> wrote:
> > >
> > > This function is in the same spirit as the other kstrto* functions an=
d
> > > uses the same calling convention. It expects the input string to be i=
n
> > > the format %u:%u and implements stricter parsing than sscanf as it
> > > returns an error on trailing data (other than the usual \n).

...

> > On top of that, why kstrtodev_t is so important? How many users are
> > already in the kernel to get an advantage out of it?
>
> Does it need to be important? It matches the other kstrto* functions and
> so it seemed more natural to me to put it near the other functions. I'm
> not aware of other potential users and surprised you seem to suggest
> this as a requirement.

Yes it does. The kstrtox() are quite generic, what you are proposing
is rather one particular case with blurry understanding how many users
will be out of it.
If you had told "look, we have 1234 users which may benefit out of
it", I would have given no comment against.

> > What to do with all other possible variants ("%d:%d", "%dx%d" and its
> > %u variant, etc)?
>
> I don't see how %d:%d is relevant, major and minor cannot be negative
> can they? I never saw 'x' as separator between major and minor. I
> considered shortly parsing %u, but given that (I think) this is an
> internal representation only I chose to not make it more visible than it
> already is.

See above, if we are going to make it generic, perhaps better to cover
more possible users, right?
Otherwise your change provokes pile of (replaced)
kstrto_resolution() /* %ux:%u */
kstrto_range() /* %d:%d */
kstrto_you_name_it()

> > Why simple_strto*() can't be used?
>
> I didn't really consider it, but looking in more detail I don't like it
> much. Without having tried it I think simple_strtoull accepts
> "1000000000000000000000000000000000000000000" returning some arbitrary
> value without an error indication.

So what? User has a lot of possibilities to shoot into the foot.
Since you interpret this as device major:minor, not founding a device
will be first level of error, next one when your code will try to do
something out of it. It shouldn't be a problem of kstrtox generic
helpers.

> And given that I was asked for strict
> parsing (i.e. not accepting 2:4:something) I'd say using simple_strto*
> is a step backwards. Also simple_strtoul() has "This function is obsolete=
.
> Please use kstrtoul instead." in its docstring which seems to apply to
> the other simple_strto*() functions, too.

I specifically fixed a doc string to approve its use in the precisely
cases you have here.

--=20
With Best Regards,
Andy Shevchenko
