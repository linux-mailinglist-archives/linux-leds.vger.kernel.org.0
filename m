Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D61A165CED
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 12:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgBTLqJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 06:46:09 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41770 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgBTLqJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 06:46:09 -0500
Received: by mail-pf1-f196.google.com with SMTP id j9so1807815pfa.8;
        Thu, 20 Feb 2020 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2ScI7oGFkcWQzSBzvwVnk7UzPOpiqHho6PPj3rXuDXc=;
        b=LDhfKtrkj9tmgu2iER+QpZJUvjogpOY/ilUl8z7OR71Q+0ExlTaZhUzinF1uvUTwfq
         leZILaNuBMF2X63WCvIktQ/srWsMxqBzbpSKeyjsF7OClP/04vNlwbLkwQnLZe9mXsSq
         bwYax4flNBORXW8Gfx0ilZB8RBZPck7WMU7/UjiF8YImKsOImT0THFKMTIBIUeQ9MdVh
         tx+sWJO5zgWdztbM5R1M0pW1iZcN4vuR28xeyFsP1vNLQb+cleLjz3QAVhZ0BgVps3Z8
         SSCzCpf0vE+zbqkmBSehzwwNc/td8FS6WNl4bhgJDv7AtehI3kiWK7KwdVRUFvuDSkoP
         J2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2ScI7oGFkcWQzSBzvwVnk7UzPOpiqHho6PPj3rXuDXc=;
        b=UMvkRQL9JLDOCaE/yRe4zmMujjoaNsh3worfZygfqyG8gePp2eWQnPV7Qc8nsfEryA
         X6WFr3h3qyMfLnZ8YMlANhQm6gPmB1grgJnPtx/ni81jPVps6TQeD+xL2P3932PW2aCL
         UosP/oVRAQ1cpFm8p7atB6oj54+VJDywntUEVsd9h1IZVP9NGduTjUNn6M/wykpm+Fio
         VGnQnCrtlS4xkh2WpboLfNhg2NEn7qvPRYvYtBBchpHiL6GziZUCVl+XkMlhkX4sYxcJ
         dcVIK0y4IrnJKaY0owmtIvswmUdzPYvduyY5UyaGP16eiOWZQSkpEA4iH9pH/+iFlj0X
         uS/A==
X-Gm-Message-State: APjAAAU5uCJRUa/F5USOzkudUjiI12aNPrv06//ujCaVDuPUbil8JaBx
        S5mmb41WUDwzJ9v3l0syV7zn1vwjSvTIzp24r1pqWTsiWXT9dQ==
X-Google-Smtp-Source: APXvYqxsTk9oJoLc/7GdvMn3HPkMU1PrEL/2nl48ZgALnv5Th9PONrxOU3zB7COnGuPFs2nnzlF6kWd4Wh/ZlBlWTfA=
X-Received: by 2002:a62:52d0:: with SMTP id g199mr30825151pfb.241.1582199168430;
 Thu, 20 Feb 2020 03:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20200213091600.554-1-uwe@kleine-koenig.org> <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
 <20200220074901.ohcrisjgd26555ya@pengutronix.de> <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
 <20200220105718.eoevd3kb63zzrotu@pengutronix.de>
In-Reply-To: <20200220105718.eoevd3kb63zzrotu@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Feb 2020 13:46:00 +0200
Message-ID: <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Sascha Hauer <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 20, 2020 at 12:57 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Feb 20, 2020 at 12:22:36PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2020 at 9:49 AM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Wed, Feb 19, 2020 at 09:50:54PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Feb 13, 2020 at 11:27 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-=
koenig.org> wrote:
> > > > >
> > > > > This function is in the same spirit as the other kstrto* function=
s and
> > > > > uses the same calling convention. It expects the input string to =
be in
> > > > > the format %u:%u and implements stricter parsing than sscanf as i=
t
> > > > > returns an error on trailing data (other than the usual \n).
> >
> > ...
> >
> > > > On top of that, why kstrtodev_t is so important? How many users are
> > > > already in the kernel to get an advantage out of it?
> > >
> > > Does it need to be important? It matches the other kstrto* functions =
and
> > > so it seemed more natural to me to put it near the other functions. I=
'm
> > > not aware of other potential users and surprised you seem to suggest
> > > this as a requirement.
> >
> > Yes it does. The kstrtox() are quite generic, what you are proposing
> > is rather one particular case with blurry understanding how many users
> > will be out of it.
>
> In my understanding one user is a hard requirement.

Yes. But looking at the LOCs you introduce to entire kernel in such
generic area (I wouldn't tell you anything if, for instance, you
introduced a support for hypothetical S2P bus with one host controller
driver) like lib/.

> > If you had told "look, we have 1234 users which may benefit out of
> > it", I would have given no comment against.
>
> Sure, having >1000 potential users would be a good argument pro this
> function. But having only one isn't a good contra IMHO.

For lib/ is a good argument in my opinion.

> > > > What to do with all other possible variants ("%d:%d", "%dx%d" and i=
ts
> > > > %u variant, etc)?
> > >
> > > I don't see how %d:%d is relevant, major and minor cannot be negative
> > > can they? I never saw 'x' as separator between major and minor. I
> > > considered shortly parsing %u, but given that (I think) this is an
> > > internal representation only I chose to not make it more visible than=
 it
> > > already is.
> >
> > See above, if we are going to make it generic, perhaps better to cover
> > more possible users, right?
> > Otherwise your change provokes pile of (replaced)
> > kstrto_resolution() /* %ux:%u */
> > kstrto_range() /* %d:%d */
> > kstrto_you_name_it()
>
> Given there are respective types that this can be stored to, I don't
> object more functions of this type and don't see a good reason to not
> add such a function. And in my eyes I prefer to have such a function in
> a visible place (i.e. where all the other kstrto* functions are) to
> prevent code duplication.

You can easily satisfy above by adding a function parameter 'char
*delim', right?

> Also I don't understand yet, what you want me to do.

I have issues with kstrto() not playing with simple numbers (boolean
is a special case, but still a number at the end).
I also don't feel good with too narrow usage of the newly introduced helper

> Assume I'd be
> willing to use simple_strtoul, I'd still want to have a function that
> gives me a dev_t from a given string. Should I put this directly in my
> led-trigger driver?

I see the following possibilities:
a) put it inside the caller and forget about generic helper
b) do a generic helper, but 1/ in string_*() namespace, 2/ with a
delimiter parameter and 3/ possibility to take negative numbers

In b) case, add to the commit message how many potential _existing_
users may be converted to this.
Also it would be good to have two versions strict (only \n at the end
is allowed) and non-strict (based on the amount of users for each
group).

> > > And given that I was asked for strict
> > > parsing (i.e. not accepting 2:4:something) I'd say using simple_strto=
*
> > > is a step backwards. Also simple_strtoul() has "This function is obso=
lete.
> > > Please use kstrtoul instead." in its docstring which seems to apply t=
o
> > > the other simple_strto*() functions, too.
> >
> > I specifically fixed a doc string to approve its use in the precisely
> > cases you have here.
>
> Can you please be a bit more constructive here and point to the change
> you talk about? I didn't find a commit in next.

https://elixir.bootlin.com/linux/v5.6-rc2/source/include/linux/kernel.h#L44=
6

Note, there is no more word 'obsolete' there.

--=20
With Best Regards,
Andy Shevchenko
