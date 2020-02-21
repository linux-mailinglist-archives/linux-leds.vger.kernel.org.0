Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4C61677AA
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2020 09:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730704AbgBUImj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Feb 2020 03:42:39 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37423 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727934AbgBUImi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Feb 2020 03:42:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so841675pfn.4;
        Fri, 21 Feb 2020 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i0j3HxQ470HdIWxAMoUka3U8AZHwcMDdR6BO6TowNX8=;
        b=S9BznbuiB7CZsRilNYHcvxrAQnetlx6nUYiludsv40niivFJ350vJbnhnnT0ttG1nu
         HTRfYvmy5pcjGjFl1xqDu6ElpXc7SUaVX2CZL10QamBW/nb/vbBYiRYmiotRXDrk9gFg
         PP9rORoTEL2+EPlgzQfyG7SvbSJNNta8l6mWyY644SdNTv5yMapp4OY72k+fT7FLJUc5
         KkLOwFLUR/JQkfe4JJBUqw5lHn+k8NftdPycBOvwpTCAvKx76NmGxq4t8FSZIPMWPCNj
         khU4IwOfIQsVr0r9b2dUlu1J7LSVcE8vD/vIEsD/o4I9eNNLDc8FoZOR3gWfzONGvTio
         BPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i0j3HxQ470HdIWxAMoUka3U8AZHwcMDdR6BO6TowNX8=;
        b=tjqdAL18fsiNoE6QwNs/7bgF2n/3oJdkzTcjTPQtcigFkIJ2cYuCwPZFwEqMDz3pxX
         Kz8dAsBuW3GC2hd+lY2B3GS8ujrPDH7WCZuAFb5r7GgWeVkinlinUlOxFzb3Yd6V/3z2
         tSdOcobIgKQB4WAUgFzCjYvUhik9PEv9lwLhMyTIgjOc5xy8WcnMmOR/JCvqbDAEbb8J
         2xfrmiDpMJCEcc6T/2VZAx42g92wSea5ZwT0zTXwgafJDHxaT+G3jSD4l0aMiX4uSFK+
         dwY/yNF029TsXMg6J21+11Cvta3qVZpZJ42IqO7ZQgT7VgaL6zAJTC9O6LIue0m+YmVH
         swQQ==
X-Gm-Message-State: APjAAAU5TEHB+6QWNIquo0cOzbMTvO/9wALItIlgwGf6dSxYbzvaRfyv
        HVRA7GMfU/Z4JqBuhgLFWp5jMCKqyAOe3DxzcfE=
X-Google-Smtp-Source: APXvYqzr723bAPUr915pjFyXAHuVlB4FwzaNx+DToKigYTUcjbunnfJIG1Jb5ag1LVGlqNDMtFhnoQ74+d9KO9OQRDA=
X-Received: by 2002:a62:1944:: with SMTP id 65mr37651381pfz.151.1582274557809;
 Fri, 21 Feb 2020 00:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20200213091600.554-1-uwe@kleine-koenig.org> <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
 <20200220074901.ohcrisjgd26555ya@pengutronix.de> <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
 <20200220105718.eoevd3kb63zzrotu@pengutronix.de> <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
 <20200220140101.frlxklnv6x3uhzow@pengutronix.de>
In-Reply-To: <20200220140101.frlxklnv6x3uhzow@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 21 Feb 2020 10:42:29 +0200
Message-ID: <CAHp75VdD5rJMBqH-YwGKuM5EHUXxeGAon6TfPwq_YxWGzkdrtQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
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

On Thu, Feb 20, 2020 at 4:01 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Feb 20, 2020 at 01:46:00PM +0200, Andy Shevchenko wrote (with
> the additions written in a later mail inserted as if he said them
> already then):
> > On Thu, Feb 20, 2020 at 12:57 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Thu, Feb 20, 2020 at 12:22:36PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Feb 20, 2020 at 9:49 AM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:

...

> > Yes. But looking at the LOCs you introduce to entire kernel in such
> > generic area (I wouldn't tell you anything if, for instance, you
> > introduced a support for hypothetical S2P bus with one host controller
> > driver) like lib/.
>
> Why are added LOCs bad? Increased compile time? Increased binary size?

Both.

> More memory usage when the file is opened in an editor?

Probably in some cases. :-)

> > > > If you had told "look, we have 1234 users which may benefit out of
> > > > it", I would have given no comment against.
> > >
> > > Sure, having >1000 potential users would be a good argument pro this
> > > function. But having only one isn't a good contra IMHO.
> >
> > For lib/ is a good argument in my opinion.
>
> So while I agree (as I wrote) that many users would be great, not having
> many users isn't bad enough to justify putting this function somewhere
> separated from the other kstrto*() functions. I assume we won't be able
> to sort out this difference of opinion.

If you put this like: okay, this is a new helper and new user, but we
have 100500 similar cases in the kernel which may benefit out of this,
it's one story, it you put it like: okay, let's do one helper per each
very particular case, it's another story.
You see the difference? I'm completely against the latter one.

...

> > > > See above, if we are going to make it generic, perhaps better to co=
ver
> > > > more possible users, right?
> > > > Otherwise your change provokes pile of (replaced)
> > > > kstrto_resolution() /* %ux:%u */
> > > > kstrto_range() /* %d:%d */
> > > > kstrto_you_name_it()
> > >
> > > Given there are respective types that this can be stored to, I don't
> > > object more functions of this type and don't see a good reason to not
> > > add such a function. And in my eyes I prefer to have such a function =
in
> > > a visible place (i.e. where all the other kstrto* functions are) to
> > > prevent code duplication.
> >
> > You can easily satisfy above by adding a function parameter 'char
> > *delim', right?
>
> Well, not completely as major and minor have a different domain range
> compared to unsigned ints (or any other integer type).

Yes, it's also can be adjusted. You provide a better helper and then
you may do something like

static inline ... string_parse_dev_t(...)
{
  ret =3D string_parse_two_numbers(..., );
  if (ret)
    return ret;

  if (x or y is not in range)
    return -EOVERFLOW;
  ...
}

> > > Also I don't understand yet, what you want me to do.
> >
> > I have issues with kstrto() not playing with simple and single numbers
> > (boolean is a special case, but still a number at the end).
>
> A dev_t is also a number in the end.

My point (when I added single) is 1:1 map. dev_t is not.

> > I also don't feel good with too narrow usage of the newly introduced he=
lper
>
> I don't see how a helper that should provide a valid dev_t and other
> types use a generic function. The specification for parsing a dev_t is:
> "A non-negative number that fits in 20 bits, followed by a colon,
> followed by a non-negative number that fits in 12 bits." So even if we
> had a generic function that could parse (in scanf-semantics) "%u:%u",
> we'd still need a more specialized helper that ensures the range of the
> two integers. (And I suggest to call this helper kstrtodev_t. :-)

See above: 1/ provide a generic helper, 2/ provide its use with
certain dev_t validation.

> > > Assume I'd be
> > > willing to use simple_strtoul, I'd still want to have a function that
> > > gives me a dev_t from a given string. Should I put this directly in m=
y
> > > led-trigger driver?
> >
> > I see the following possibilities:
> > a) put it inside the caller and forget about generic helper
> > b) do a generic helper, but 1/ in string_*() namespace, 2/ with a
> > delimiter parameter and 3/ possibility to take negative numbers
>
> I wonder about 1/. Are there already other (and similar) functions in
> the string_* namespace?

Not exactly. There is a printing in human-readable format for sizes
and escape/unescape.

> IMHO kstrto* is fine. These all take a string
> and provide a value of a given type with strict parsing. As pointed out
> above, 2/ isn't enough. I don't care much about 3/.

See above, I really don't see how this fits kstrtox(), to me it's
obvious layer violation.

> > In b) case, add to the commit message how many potential _existing_
> > users may be converted to this.
>
> <sarcasm>Will use 9f6158946987a5ce3f16da097d18f240a89db417 as a good
> example how to do that.</sarcasm>

I didn't get it. There are _existing_ users in the kernel for that
functionality, At least two are using it right now.
Funny that the original code has been rewritten to get rid of int_pow() cal=
l.
You may do the same, i.e. rewrite your code to get rid of whatever_dev_t() =
use.

> > Also it would be good to have two versions strict (only \n at the end
> > is allowed) and non-strict (based on the amount of users for each
> > group). And don't forget to extend lib/test_string.c accordingly.
> >
> > > > > And given that I was asked for strict
> > > > > parsing (i.e. not accepting 2:4:something) I'd say using simple_s=
trto*
> > > > > is a step backwards. Also simple_strtoul() has "This function is =
obsolete.
> > > > > Please use kstrtoul instead." in its docstring which seems to app=
ly to
> > > > > the other simple_strto*() functions, too.
> > > >
> > > > I specifically fixed a doc string to approve its use in the precise=
ly
> > > > cases you have here.
> > >
> > > Can you please be a bit more constructive here and point to the chang=
e
> > > you talk about? I didn't find a commit in next.
> >
> > https://elixir.bootlin.com/linux/v5.6-rc2/source/include/linux/kernel.h=
#L446
> >
> > Note, there is no more word 'obsolete' there.
>
> I talked about
>
> https://elixir.bootlin.com/linux/v5.6-rc2/source/lib/vsprintf.c#L61
>
> which still tells to not use it.

I see. Thanks for report, I'll soon send a patch to fix it as well.

> I think what is needed here to satisfy us both is a set of functions like=
:
>
>         int buftoul(const char *buf, char **endp, unsigned long *result)
>
> which does proper range checking (by not consuming chars that are too
> much) and still provides an endp pointer that allows to make use of this
> function to parse types that are represented by more than a plain
> integer.

Yeah, https://xkcd.com/927/.

> Currently this functionality is provided by _parse_integer
> (with a different API and slightly different semantic). For my purpose
> _parse_integer is good enough, so I'd like to leave introduction and
> identification plus conversion of already existing potential users to
> you.

Nothing prevents you to use it from your parser which will be located
in string_*() namespace.

--
With Best Regards,
Andy Shevchenko
