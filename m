Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633A7165C4E
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 11:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgBTK52 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 05:57:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59579 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbgBTK50 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 05:57:26 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4jWC-0002uz-Ny; Thu, 20 Feb 2020 11:57:20 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4jWB-00059I-0P; Thu, 20 Feb 2020 11:57:19 +0100
Date:   Thu, 20 Feb 2020 11:57:18 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sascha Hauer <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
Message-ID: <20200220105718.eoevd3kb63zzrotu@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
 <20200220074901.ohcrisjgd26555ya@pengutronix.de>
 <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcxXWputX1y90t8f-c0a3dw2CHU6=ebQ+o6e8Z1GymiDw@mail.gmail.com>
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

On Thu, Feb 20, 2020 at 12:22:36PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 20, 2020 at 9:49 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Wed, Feb 19, 2020 at 09:50:54PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 13, 2020 at 11:27 AM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> > > >
> > > > This function is in the same spirit as the other kstrto* functions and
> > > > uses the same calling convention. It expects the input string to be in
> > > > the format %u:%u and implements stricter parsing than sscanf as it
> > > > returns an error on trailing data (other than the usual \n).
> 
> ...
> 
> > > On top of that, why kstrtodev_t is so important? How many users are
> > > already in the kernel to get an advantage out of it?
> >
> > Does it need to be important? It matches the other kstrto* functions and
> > so it seemed more natural to me to put it near the other functions. I'm
> > not aware of other potential users and surprised you seem to suggest
> > this as a requirement.
> 
> Yes it does. The kstrtox() are quite generic, what you are proposing
> is rather one particular case with blurry understanding how many users
> will be out of it.

In my understanding one user is a hard requirement.

> If you had told "look, we have 1234 users which may benefit out of
> it", I would have given no comment against.

Sure, having >1000 potential users would be a good argument pro this
function. But having only one isn't a good contra IMHO.

> > > What to do with all other possible variants ("%d:%d", "%dx%d" and its
> > > %u variant, etc)?
> >
> > I don't see how %d:%d is relevant, major and minor cannot be negative
> > can they? I never saw 'x' as separator between major and minor. I
> > considered shortly parsing %u, but given that (I think) this is an
> > internal representation only I chose to not make it more visible than it
> > already is.
> 
> See above, if we are going to make it generic, perhaps better to cover
> more possible users, right?
> Otherwise your change provokes pile of (replaced)
> kstrto_resolution() /* %ux:%u */
> kstrto_range() /* %d:%d */
> kstrto_you_name_it()

Given there are respective types that this can be stored to, I don't
object more functions of this type and don't see a good reason to not
add such a function. And in my eyes I prefer to have such a function in
a visible place (i.e. where all the other kstrto* functions are) to
prevent code duplication.

Also I don't understand yet, what you want me to do. Assume I'd be
willing to use simple_strtoul, I'd still want to have a function that
gives me a dev_t from a given string. Should I put this directly in my
led-trigger driver?

> > > Why simple_strto*() can't be used?
> >
> > I didn't really consider it, but looking in more detail I don't like it
> > much. Without having tried it I think simple_strtoull accepts
> > "1000000000000000000000000000000000000000000" returning some arbitrary
> > value without an error indication.
> 
> So what? User has a lot of possibilities to shoot into the foot.
> Since you interpret this as device major:minor, not founding a device
> will be first level of error, next one when your code will try to do
> something out of it. It shouldn't be a problem of kstrtox generic
> helpers.

I fail to follow your argument here. In my eyes if the user writes a
valid major:minor it should work, and if they write an invalid one this
should result in an error and not a usage of a device that just happens
to have the major:minor that simple_strtoull happens to return for the
two components.

> > And given that I was asked for strict
> > parsing (i.e. not accepting 2:4:something) I'd say using simple_strto*
> > is a step backwards. Also simple_strtoul() has "This function is obsolete.
> > Please use kstrtoul instead." in its docstring which seems to apply to
> > the other simple_strto*() functions, too.
> 
> I specifically fixed a doc string to approve its use in the precisely
> cases you have here.

Can you please be a bit more constructive here and point to the change
you talk about? I didn't find a commit in next.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
