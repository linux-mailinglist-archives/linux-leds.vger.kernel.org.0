Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA0C165F61
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 15:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgBTOBK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 09:01:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46577 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgBTOBJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 09:01:09 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4mNz-0006Ks-Ot; Thu, 20 Feb 2020 15:01:03 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4mNx-0003lv-HS; Thu, 20 Feb 2020 15:01:01 +0100
Date:   Thu, 20 Feb 2020 15:01:01 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
Message-ID: <20200220140101.frlxklnv6x3uhzow@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
 <20200220074901.ohcrisjgd26555ya@pengutronix.de>
 <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
 <20200220105718.eoevd3kb63zzrotu@pengutronix.de>
 <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

On Thu, Feb 20, 2020 at 01:46:00PM +0200, Andy Shevchenko wrote (with
the additions written in a later mail inserted as if he said them
already then):
> On Thu, Feb 20, 2020 at 12:57 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Thu, Feb 20, 2020 at 12:22:36PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 20, 2020 at 9:49 AM Uwe Kleine-König
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > On Wed, Feb 19, 2020 at 09:50:54PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Feb 13, 2020 at 11:27 AM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> > > > > >
> > > > > > This function is in the same spirit as the other kstrto* functions and
> > > > > > uses the same calling convention. It expects the input string to be in
> > > > > > the format %u:%u and implements stricter parsing than sscanf as it
> > > > > > returns an error on trailing data (other than the usual \n).
> > >
> > > ...
> > >
> > > > > On top of that, why kstrtodev_t is so important? How many users are
> > > > > already in the kernel to get an advantage out of it?
> > > >
> > > > Does it need to be important? It matches the other kstrto* functions and
> > > > so it seemed more natural to me to put it near the other functions. I'm
> > > > not aware of other potential users and surprised you seem to suggest
> > > > this as a requirement.
> > >
> > > Yes it does. The kstrtox() are quite generic, what you are proposing
> > > is rather one particular case with blurry understanding how many users
> > > will be out of it.
> >
> > In my understanding one user is a hard requirement.
> 
> Yes. But looking at the LOCs you introduce to entire kernel in such
> generic area (I wouldn't tell you anything if, for instance, you
> introduced a support for hypothetical S2P bus with one host controller
> driver) like lib/.

Why are added LOCs bad? Increased compile time? Increased binary size?
More memory usage when the file is opened in an editor?

> > > If you had told "look, we have 1234 users which may benefit out of
> > > it", I would have given no comment against.
> >
> > Sure, having >1000 potential users would be a good argument pro this
> > function. But having only one isn't a good contra IMHO.
> 
> For lib/ is a good argument in my opinion.

So while I agree (as I wrote) that many users would be great, not having
many users isn't bad enough to justify putting this function somewhere
separated from the other kstrto*() functions. I assume we won't be able
to sort out this difference of opinion.

> > > > > What to do with all other possible variants ("%d:%d", "%dx%d" and its
> > > > > %u variant, etc)?
> > > >
> > > > I don't see how %d:%d is relevant, major and minor cannot be negative
> > > > can they? I never saw 'x' as separator between major and minor. I
> > > > considered shortly parsing %u, but given that (I think) this is an
> > > > internal representation only I chose to not make it more visible than it
> > > > already is.
> > >
> > > See above, if we are going to make it generic, perhaps better to cover
> > > more possible users, right?
> > > Otherwise your change provokes pile of (replaced)
> > > kstrto_resolution() /* %ux:%u */
> > > kstrto_range() /* %d:%d */
> > > kstrto_you_name_it()
> >
> > Given there are respective types that this can be stored to, I don't
> > object more functions of this type and don't see a good reason to not
> > add such a function. And in my eyes I prefer to have such a function in
> > a visible place (i.e. where all the other kstrto* functions are) to
> > prevent code duplication.
> 
> You can easily satisfy above by adding a function parameter 'char
> *delim', right?

Well, not completely as major and minor have a different domain range
compared to unsigned ints (or any other integer type).
 
> > Also I don't understand yet, what you want me to do.
> 
> I have issues with kstrto() not playing with simple and single numbers
> (boolean is a special case, but still a number at the end).

A dev_t is also a number in the end.

> I also don't feel good with too narrow usage of the newly introduced helper

I don't see how a helper that should provide a valid dev_t and other
types use a generic function. The specification for parsing a dev_t is:
"A non-negative number that fits in 20 bits, followed by a colon,
followed by a non-negative number that fits in 12 bits." So even if we
had a generic function that could parse (in scanf-semantics) "%u:%u",
we'd still need a more specialized helper that ensures the range of the
two integers. (And I suggest to call this helper kstrtodev_t. :-)

> > Assume I'd be
> > willing to use simple_strtoul, I'd still want to have a function that
> > gives me a dev_t from a given string. Should I put this directly in my
> > led-trigger driver?
> 
> I see the following possibilities:
> a) put it inside the caller and forget about generic helper
> b) do a generic helper, but 1/ in string_*() namespace, 2/ with a
> delimiter parameter and 3/ possibility to take negative numbers

I wonder about 1/. Are there already other (and similar) functions in
the string_* namespace? IMHO kstrto* is fine. These all take a string
and provide a value of a given type with strict parsing. As pointed out
above, 2/ isn't enough. I don't care much about 3/.

> In b) case, add to the commit message how many potential _existing_
> users may be converted to this.

<sarcasm>Will use 9f6158946987a5ce3f16da097d18f240a89db417 as a good
example how to do that.</sarcasm>

> Also it would be good to have two versions strict (only \n at the end
> is allowed) and non-strict (based on the amount of users for each
> group). And don't forget to extend lib/test_string.c accordingly.
> 
> > > > And given that I was asked for strict
> > > > parsing (i.e. not accepting 2:4:something) I'd say using simple_strto*
> > > > is a step backwards. Also simple_strtoul() has "This function is obsolete.
> > > > Please use kstrtoul instead." in its docstring which seems to apply to
> > > > the other simple_strto*() functions, too.
> > >
> > > I specifically fixed a doc string to approve its use in the precisely
> > > cases you have here.
> >
> > Can you please be a bit more constructive here and point to the change
> > you talk about? I didn't find a commit in next.
> 
> https://elixir.bootlin.com/linux/v5.6-rc2/source/include/linux/kernel.h#L446
> 
> Note, there is no more word 'obsolete' there.

I talked about

https://elixir.bootlin.com/linux/v5.6-rc2/source/lib/vsprintf.c#L61

which still tells to not use it.

I think what is needed here to satisfy us both is a set of functions like:

	int buftoul(const char *buf, char **endp, unsigned long *result)

which does proper range checking (by not consuming chars that are too
much) and still provides an endp pointer that allows to make use of this
function to parse types that are represented by more than a plain
integer. Currently this functionality is provided by _parse_integer
(with a different API and slightly different semantic). For my purpose
_parse_integer is good enough, so I'd like to leave introduction and
identification plus conversion of already existing potential users to
you.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
