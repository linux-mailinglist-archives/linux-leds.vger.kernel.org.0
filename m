Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1AE31234A1
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 19:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfLQSUm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 13:20:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:56134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfLQSUl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 13:20:41 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58267206D7;
        Tue, 17 Dec 2019 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576606840;
        bh=R7X+VUc54FRJM8mODYV5OWQAzW0djewmzAEIK4csmKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eG0W1wu0zdM4xxKifZJXzioeiaxkB1ibqklJyy91q5gqIKPkNuxIwZkOuK29BnIZh
         7KeGxZQabmchNJh5cCxH6GyziI7A9YUhebBiHWXAwfsAwWUvf5h57pU4wlZFrtadr1
         KMEg5WzOW9WpY+tuptiNClHekvcV/3XfNZni+/8Q=
Date:   Tue, 17 Dec 2019 19:20:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 1/3] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20191217182038.GA3853604@kroah.com>
References: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
 <20191217165816.19324-2-u.kleine-koenig@pengutronix.de>
 <c83b364b-3494-cf3d-0429-61ec3b502be0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c83b364b-3494-cf3d-0429-61ec3b502be0@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 07:08:47PM +0100, Jacek Anaszewski wrote:
> Hi Uwe,
> 
> I wanted to test the set but unfortunately this
> patch does not apply. See below for the apparent reason.
> 
> On 12/17/19 5:58 PM, Uwe Kleine-König wrote:
> > Introduce a new function tty_kopen_shared() that yields a struct
> > tty_struct. The semantic difference to tty_kopen() is that the tty is
> > expected to be used already. So rename tty_kopen() to
> > tty_kopen_exclusive() for clearness, adapt the single user and put the
> > common code in a new static helper function.
> > 
> > tty_kopen_shared is to be used to implement an LED trigger for tty
> > devices in one of the next patches.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/staging/speakup/spk_ttyio.c |  2 +-
> >  drivers/tty/tty_io.c                | 58 ++++++++++++++++++++---------
> >  include/linux/tty.h                 |  5 ++-
> >  3 files changed, 44 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
> > index 5a9eff08cb96..e9db06eae875 100644
> > --- a/drivers/staging/speakup/spk_ttyio.c
> > +++ b/drivers/staging/speakup/spk_ttyio.c
> > @@ -147,7 +147,7 @@ static int spk_ttyio_initialise_ldisc(struct spk_synth *synth)
> >  	if (ret)
> >  		return ret;
> >  
> > -	tty = tty_kopen(dev);
> > +	tty = tty_kopen_exclusive(dev);
> >  	if (IS_ERR(tty))
> >  		return PTR_ERR(tty);
> >  
> > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > index a1453fe10862..b718666ce73c 100644
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> > @@ -1875,22 +1875,7 @@ static struct tty_driver *tty_lookup_driver(dev_t device, struct file *filp,
> >  	return driver;
> >  }
> >  
> > -/**
> > - *	tty_kopen	-	open a tty device for kernel
> > - *	@device: dev_t of device to open
> > - *
> > - *	Opens tty exclusively for kernel. Performs the driver lookup,
> > - *	makes sure it's not already opened and performs the first-time
> > - *	tty initialization.
> > - *
> > - *	Returns the locked initialized &tty_struct
> > - *
> > - *	Claims the global tty_mutex to serialize:
> > - *	  - concurrent first-time tty initialization
> > - *	  - concurrent tty driver removal w/ lookup
> > - *	  - concurrent tty removal from driver table
> > - */
> > -struct tty_struct *tty_kopen(dev_t device)
> > +static struct tty_struct *tty_kopen(dev_t device, int shared)
> >  {
> >  	struct tty_struct *tty;
> >  	struct tty_driver *driver;
> 
> In mainline, even in v5.5-rc2 we have here NULL assignment:
> 
> struct tty_driver *driver = NULL;

This is based on a patch that is already in my tty-testing tree and that
was posted earlier.  It should show up in linux-next in a day or so.

thanks,

greg k-h
