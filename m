Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7E1167B62
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2020 11:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgBUKxV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Feb 2020 05:53:21 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38707 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgBUKxT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Feb 2020 05:53:19 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j55vl-0007RY-NN; Fri, 21 Feb 2020 11:53:13 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j55vk-0002Kq-1Q; Fri, 21 Feb 2020 11:53:12 +0100
Date:   Fri, 21 Feb 2020 11:53:12 +0100
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
Message-ID: <20200221105311.qxy3q7sf5owze2na@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
 <20200220074901.ohcrisjgd26555ya@pengutronix.de>
 <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
 <20200220105718.eoevd3kb63zzrotu@pengutronix.de>
 <CAHp75Vd3KN81qxOWJQ7v=GimSLtVymur_iPsf91pka1STc1nfA@mail.gmail.com>
 <20200220140101.frlxklnv6x3uhzow@pengutronix.de>
 <CAHp75VdD5rJMBqH-YwGKuM5EHUXxeGAon6TfPwq_YxWGzkdrtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdD5rJMBqH-YwGKuM5EHUXxeGAon6TfPwq_YxWGzkdrtQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Andy,

On Fri, Feb 21, 2020 at 10:42:29AM +0200, Andy Shevchenko wrote:
> On Thu, Feb 20, 2020 at 4:01 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > > > Also I don't understand yet, what you want me to do.
> > >
> > > I have issues with kstrto() not playing with simple and single numbers
> > > (boolean is a special case, but still a number at the end).
> >
> > A dev_t is also a number in the end.
> 
> My point (when I added single) is 1:1 map. dev_t is not.

I don't agree. The mapping is quite similar, the only difference is that
you cannot write 47:11 in C source code to get an instance of dev_t.
(But you can write MKDEV(47, 11) which is close but IMHO unsuitable for
the sysfs interface.)

Other than that it's just that kstrtoul does
"49283083" -> 10111100000000000000001011 while kstrtodev_t does
"47:11" -> 10111100000000000000001011.

(nitpick: it's both not 1:1 as "0x2f0000b" maps to the same as "49283083",
but ...)

> > > In b) case, add to the commit message how many potential _existing_
> > > users may be converted to this.
> >
> > <sarcasm>Will use 9f6158946987a5ce3f16da097d18f240a89db417 as a good
> > example how to do that.</sarcasm>
> 
> I didn't get it. There are _existing_ users in the kernel for that
> functionality, At least two are using it right now.

Yeah, this was just me being grumpy about "add to the commit message how
many potential _existing_ users may be converted". See the output of

	git grep '\<int_pow\>' 9f6158946987a5ce3f16da097d18f240a89db417^

.

> > [...]
> > I think what is needed here to satisfy us both is a set of functions like:
> >
> >         int buftoul(const char *buf, char **endp, unsigned long *result)
> >
> > which does proper range checking (by not consuming chars that are too
> > much) and still provides an endp pointer that allows to make use of this
> > function to parse types that are represented by more than a plain
> > integer.
> 
> Yeah, https://xkcd.com/927/.

With the difference that if we introduce a new standard we can
effectively kill the older ones. And that you now work towards
undeprecating simple_str* seems to confirm that we don't have the one
standard to rule them all yet.

=====

So, I'm trying to summarize the things we agree about and our
differences to maybe help finding an agreement. Trying to be objective
until the ==== below.

I think we agree about:

 - The dev_t specification provided by a user via sysfs should be parsed
   in a strict way.

 - A helper that takes a string as argument and yields a dev_t or an
   error is wanted.

The points we don't agree about yet are:

 a) naming of the function
    Uwe: It fits well into kstrto*(), so kstrtodev_t()
    Andy: It doesn't fit and feels like a layer violation

 b) Where to put the function
    Uwe: Put it into a global place for others to find
    Andy: Put it near the (for now) single user.
    (not sure this is really your position here)

 c) Helpers used to implement the str-to-dev_t helper
    Uwe: calling the already existing _parse_integer twice is fine
    Andy: let's create a helper that parses two integers with a given
          separator

====

I don't feel very strong about b), and could live with putting it near
the led trigger until a new user appears. Concerning a) I still think it
should have a name that should be obvious enough that a potential new
user finds it. And given that kstrto* already contains functions
converting strings to a given type this feels right for me. Andy
didn't suggest a definitive name, only string_* namespace. This is quite
crowded, the best representatives are probably the ones declared in
include/linux/string_helpers.h.

I looked a bit around for potential users of str-to-dev_t and
parse-two-integers. I found none for str-to-dev_t and only
dname_to_vma_addr() for the parse-two-integers helper. (But for
parse-two-integers the problem might be that I missed some as I don't
have a good idea how to grep for these.)

dname_to_vma_addr() takes a string in format "%lx-%lx", interprets the
numbers as base16 without 0x prefix and leading zeros and doesn't accept
a trailing \n. Sounds like a quest for someone being really motivated to
cover both (i.e. dname_to_vma_addr() and str-to-dev_t) in a single
versatile function.

Another way out would be to not take a dev_t from user-space to
determine the tty, but a name and use tty_dev_name_to_number() to get
the dev_t. (Which would add a second user to this globally exported
function. (The only other user is in staging.) :-)

I don't know how we can find an agreement, maybe we'd need some input
by someone else? There are quite some people who get this mail, maybe
someone read 'til here and cares enough to comment?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
