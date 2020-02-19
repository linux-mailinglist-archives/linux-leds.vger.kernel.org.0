Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CC1164AA8
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 17:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgBSQiH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 11:38:07 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54319 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgBSQiH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 11:38:07 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4SMJ-000285-Qk; Wed, 19 Feb 2020 17:37:59 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4SMI-000560-NF; Wed, 19 Feb 2020 17:37:58 +0100
Date:   Wed, 19 Feb 2020 17:37:58 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 2/4] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20200219163758.5rypsol4n6ucost4@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-3-uwe@kleine-koenig.org>
 <20200219132113.GD32540@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219132113.GD32540@localhost>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 19, 2020 at 02:21:13PM +0100, Johan Hovold wrote:
> On Thu, Feb 13, 2020 at 10:15:58AM +0100, Uwe Kleine-König wrote:
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
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
>  
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
> > @@ -1905,7 +1890,7 @@ struct tty_struct *tty_kopen(dev_t device)
> >  
> >  	/* check whether we're reopening an existing tty */
> >  	tty = tty_driver_lookup_tty(driver, NULL, index);
> > -	if (IS_ERR(tty))
> > +	if (IS_ERR(tty) || shared)
> 
> So here you skip initialisation and return NULL if the tty isn't already
> in use (e.g. is open) when shared is set.

Which is good, right? If I remember my tests correctly this even works
if the tty isn't opened but just "exists".

> >  		goto out;
> >  
> >  	if (tty) {
> > @@ -1923,7 +1908,44 @@ struct tty_struct *tty_kopen(dev_t device)
> >  	tty_driver_kref_put(driver);
> >  	return tty;
> >  }
> > -EXPORT_SYMBOL_GPL(tty_kopen);
> > +
> > +/**
> > + *	tty_kopen_exclusive	-	open a tty device for kernel
> > + *	@device: dev_t of device to open
> > + *
> > + *	Opens tty exclusively for kernel. Performs the driver lookup,
> > + *	makes sure it's not already opened and performs the first-time
> > + *	tty initialization.
> > + *
> > + *	Returns the locked initialized &tty_struct
> > + *
> > + *	Claims the global tty_mutex to serialize:
> > + *	  - concurrent first-time tty initialization
> > + *	  - concurrent tty driver removal w/ lookup
> > + *	  - concurrent tty removal from driver table
> > + */
> > +struct tty_struct *tty_kopen_exclusive(dev_t device)
> > +{
> > +	return tty_kopen(device, 0);
> > +}
> > +EXPORT_SYMBOL_GPL(tty_kopen_exclusive);
> > +
> > +/**
> > + *	tty_kopen_shared	-	open a tty device for shared in-kernel use
> > + *	@device: dev_t of device to open
> > + *
> > + *	Opens an already existing tty
> > + *	rnel. Performs the driver lookup,
> 
> "rnel"?
> 
> > + *	makes sure it's not already opened and performs the first-time
> > + *	tty initialization.
> 
> Yet, you claim to do initialisation here, which isn't the case.

Yeah, wrong (and incomplete) copy of the tty_kopen_exclusive docstring.

> > + *
> > + *	Locking is identical to tty_kopen() above.
> > + */
> > +struct tty_struct *tty_kopen_shared(dev_t device)
> > +{
> > +	return tty_kopen(device, 1);
> > +}
> > +EXPORT_SYMBOL_GPL(tty_kopen_shared);
> 
> This "kopen" naming is unfortunate as the tty isn't really opened by
> either of these functions, but that's not something you introduced.

Ack, will send a v7 with the doc string fixed.

Thanks for taking the time to look over 
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
