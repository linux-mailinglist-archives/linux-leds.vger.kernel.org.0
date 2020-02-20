Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27DD1658BC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2020 08:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgBTHtJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Feb 2020 02:49:09 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54643 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbgBTHtJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 02:49:09 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4gZy-00076I-W3; Thu, 20 Feb 2020 08:49:03 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4gZx-0007Au-66; Thu, 20 Feb 2020 08:49:01 +0100
Date:   Thu, 20 Feb 2020 08:49:01 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v6 1/4] lib: new helper kstrtodev_t()
Message-ID: <20200220074901.ohcrisjgd26555ya@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-2-uwe@kleine-koenig.org>
 <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcStj5sE3f0uK2deOWC=ojfx-z1fbrh6Lu6jAor9F9PgA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 19, 2020 at 09:50:54PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 13, 2020 at 11:27 AM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> >
> > This function is in the same spirit as the other kstrto* functions and
> > uses the same calling convention. It expects the input string to be in
> > the format %u:%u and implements stricter parsing than sscanf as it
> > returns an error on trailing data (other than the usual \n).
> 
> Can we first split the kstrotox* (and simple_strto*) to the separate
> header first?

I don't feel strong here what is right. But I hesitate to create another
pre-condition for this patch set.

> On top of that, why kstrtodev_t is so important? How many users are
> already in the kernel to get an advantage out of it?

Does it need to be important? It matches the other kstrto* functions and
so it seemed more natural to me to put it near the other functions. I'm
not aware of other potential users and surprised you seem to suggest
this as a requirement.

> What to do with all other possible variants ("%d:%d", "%dx%d" and its
> %u variant, etc)?

I don't see how %d:%d is relevant, major and minor cannot be negative
can they? I never saw 'x' as separator between major and minor. I
considered shortly parsing %u, but given that (I think) this is an
internal representation only I chose to not make it more visible than it
already is.

> Why simple_strto*() can't be used?

I didn't really consider it, but looking in more detail I don't like it
much. Without having tried it I think simple_strtoull accepts
"1000000000000000000000000000000000000000000" returning some arbitrary
value without an error indication. And given that I was asked for strict
parsing (i.e. not accepting 2:4:something) I'd say using simple_strto*
is a step backwards. Also simple_strtoul() has "This function is obsolete.
Please use kstrtoul instead." in its docstring which seems to apply to
the other simple_strto*() functions, too.

> >  #include <linux/export.h>
> >  #include <linux/types.h>
> >  #include <linux/uaccess.h>
> 
> > +#include <linux/kdev_t.h>
> 
> Perhaps preserve order?

Can do.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
