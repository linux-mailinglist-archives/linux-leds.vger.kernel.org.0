Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3AD1122987
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 12:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfLQLHq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 06:07:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:43040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLQLHq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 06:07:46 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F17D820716;
        Tue, 17 Dec 2019 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576580865;
        bh=AirzzB8xv/znj29XGEFdRULSYNsGeW8KUz8c+5pRPEI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o/GSFQfBGqIOQQllfLXWRvnLIosb1kpmBhxLE5b06FAhKJzkVkAew971CbGrQDQHl
         SSFKtwuJTaO6s8UirjcquNCI7zhL7WXVD6cS/MVUpA6um9ae0fpVFooUEEjXn8cBRY
         uTMehj3NvZNhq/DaLxrUfGcCOflWRkd/wwXexDqU=
Date:   Tue, 17 Dec 2019 12:07:43 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217110743.GB3055718@kroah.com>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-4-u.kleine-koenig@pengutronix.de>
 <20191217083211.GC2672708@kroah.com>
 <20191217105826.6d2odt4k5b4qknjk@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217105826.6d2odt4k5b4qknjk@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 11:58:26AM +0100, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Tue, Dec 17, 2019 at 09:32:11AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Dec 17, 2019 at 09:17:18AM +0100, Uwe Kleine-König wrote:
> > > +	ret = tty_get_icount(trigger_data->tty, &icount);
> > > +	if (icount.rx > trigger_data->icount.rx ||
> > > +	    icount.tx > trigger_data->icount.tx) {
> > 
> > What happens when icount.rx and/or icount.tx wraps?  It's "only" an int.
> 
> Good catch. I wonder why this is not an unsigned quantity. Just grepping
> through drivers/tty/serial most drivers just increment these counters
> and don't care for overflow (which is undefined for ints) either. :-\

It is not undefined for the kernel, I'm pretty sure we tell the compiler
to be sane for this type of thing.  It should "just wrap".  Oh wait
"int" is "signed int" here, hah, that's funny.  Surely someone has
noticed that in 20+ years by now?

> ..ooOO(Where is the can maintainer? --- We found a can of worms :-)

:)

> 
> > > +		unsigned long delay_on = 100, delay_off = 100;
> > > +
> > > +		led_blink_set_oneshot(trigger_data->led_cdev,
> > > +				      &delay_on, &delay_off, 0);
> > > +
> > > +		trigger_data->icount = icount;
> > 
> > Implicit memcpy of a structure?  Ick.
> 
> I'd call that elegant ;-)
> 
> > All you care about are the two integers, why not just track them instead
> > of the whole thing?
> 
> For now I only care about tx and rx, but I intend to add some bells and
> whistles to trigger on other events. (But I don't care much, can add
> that once I implement this support.)

Start small and add more as-needed, you can always move back to the full
structure later on if you really need it.

thanks,

greg k-h
