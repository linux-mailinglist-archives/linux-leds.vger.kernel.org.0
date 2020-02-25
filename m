Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A06AD16BCBE
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 09:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgBYIzL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 03:55:11 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43370 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729313AbgBYIzK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 03:55:10 -0500
Received: by mail-lf1-f65.google.com with SMTP id s23so9123401lfs.10;
        Tue, 25 Feb 2020 00:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Qj/oiN9n+I7E1wS+ld94elXXQ3PzY9hQTBW7ib6/UU8=;
        b=RdpRpUu6K1gQcXAtfSnzQqsg4lySg3IXyOxTo8pis3csdfPa5/qEYV4baRd7yoeVMR
         VUF8rxzC4UBaAkIGCoeoP8aUZmRUQs70nXocrn3pIEkgPGgdjAt266DkpRYxB6dylFnJ
         TLqtaDCL+l6zADHor08uKY2rL9CEdUguXmbGI0VKYxSW90LFJOELU2dgujJ5VHSX2r6x
         jLCPIWi9hbB8dxtos6BVGNtjWr84X94QCdmfEu7TpRZ6C+Ze2s2bpWy69PPpuDhknaIQ
         X238j5YBSFYavMjkyJk65GsexMsLC4jZbgdgDrxhCdvNn4CBkqOpz4ZEqmZp/nar47Bh
         yhDg==
X-Gm-Message-State: APjAAAXkkZ5wlAuX3QNwZnXy7T0KJgzhLDMgDIfad5B/PQUuNOnOUe+i
        j35xT3G3ety32tK0u0//408=
X-Google-Smtp-Source: APXvYqw7VZ1CsxPqcRSp8EqTTUf/XxMCZvxabPWIaaKkzOrgGvBqlnIOA4B28M5WHvdItwoHSNAJGQ==
X-Received: by 2002:a19:ed0b:: with SMTP id y11mr10821978lfy.77.1582620908168;
        Tue, 25 Feb 2020 00:55:08 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id s15sm7370227ljs.58.2020.02.25.00.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:55:07 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j6Vzb-0004Qj-AL; Tue, 25 Feb 2020 09:55:03 +0100
Date:   Tue, 25 Feb 2020 09:55:03 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Johan Hovold <johan@kernel.org>, kernel@pengutronix.de,
        linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 2/4] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20200225085503.GP32540@localhost>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-3-uwe@kleine-koenig.org>
 <20200219132113.GD32540@localhost>
 <20200219163758.5rypsol4n6ucost4@pengutronix.de>
 <20200219171759.GE32540@localhost>
 <20200220110427.e6jgzvdhh3ysql3n@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200220110427.e6jgzvdhh3ysql3n@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 20, 2020 at 12:04:27PM +0100, Uwe Kleine-König wrote:
> On Wed, Feb 19, 2020 at 06:17:59PM +0100, Johan Hovold wrote:
> > On Wed, Feb 19, 2020 at 05:37:58PM +0100, Uwe Kleine-König wrote:
> > > On Wed, Feb 19, 2020 at 02:21:13PM +0100, Johan Hovold wrote:
> > > > On Thu, Feb 13, 2020 at 10:15:58AM +0100, Uwe Kleine-König wrote:
> > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > 
> > > > > Introduce a new function tty_kopen_shared() that yields a struct
> > > > > tty_struct. The semantic difference to tty_kopen() is that the tty is
> > > > > expected to be used already. So rename tty_kopen() to
> > > > > tty_kopen_exclusive() for clearness, adapt the single user and put the
> > > > > common code in a new static helper function.
> > > > > 
> > > > > tty_kopen_shared is to be used to implement an LED trigger for tty
> > > > > devices in one of the next patches.
> > > > > 
> > > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > ---
> > > >  
> > > > > -/**
> > > > > - *	tty_kopen	-	open a tty device for kernel
> > > > > - *	@device: dev_t of device to open
> > > > > - *
> > > > > - *	Opens tty exclusively for kernel. Performs the driver lookup,
> > > > > - *	makes sure it's not already opened and performs the first-time
> > > > > - *	tty initialization.
> > > > > - *
> > > > > - *	Returns the locked initialized &tty_struct
> > > > > - *
> > > > > - *	Claims the global tty_mutex to serialize:
> > > > > - *	  - concurrent first-time tty initialization
> > > > > - *	  - concurrent tty driver removal w/ lookup
> > > > > - *	  - concurrent tty removal from driver table
> > > > > - */
> > > > > -struct tty_struct *tty_kopen(dev_t device)
> > > > > +static struct tty_struct *tty_kopen(dev_t device, int shared)
> > > > >  {
> > > > >  	struct tty_struct *tty;
> > > > >  	struct tty_driver *driver;
> > > > > @@ -1905,7 +1890,7 @@ struct tty_struct *tty_kopen(dev_t device)
> > > > >  
> > > > >  	/* check whether we're reopening an existing tty */
> > > > >  	tty = tty_driver_lookup_tty(driver, NULL, index);
> > > > > -	if (IS_ERR(tty))
> > > > > +	if (IS_ERR(tty) || shared)
> > > > 
> > > > So here you skip initialisation and return NULL if the tty isn't already
> > > > in use (e.g. is open) when shared is set.
> > > 
> > > Which is good, right? If I remember my tests correctly this even works
> > > if the tty isn't opened but just "exists".
> > 
> > No, this means that your trigger will never be installed unless the port
> > is already open, yet the sysfs interface still returns success (see
> > patch 4/4 dev_store()).
> 
> Ah I think I see. tty_driver_lookup_tty() might return NULL which for
> the trigger driver indicates that tty_kopen_shared should be retried,
> right?

I'm not sure how best to handle this, but yes, your trigger can only be
enabled while the port is open currently. And no error is returned to a
user trying to enable the trigger before it has been opened.

But regardless of the error reporting, I don't think failing when the
port isn't open is the right thing to do as as this makes the interface
rather useless since you cannot enable a trigger from for example a udev
rule.

If this approach is to be used at all, it seems you may need to allocate
the struct tty when the trigger is enabled. And make sure you don't mess
up some other assumption in tty core...
 
> > Note that the struct tty doesn't exist until the port is opened; it's
> > allocated in tty_init_dev() that you skip above when "shared" is set.
> 
> That needs fixing. I will try to resolve the dialog with Andy before
> addressing that in the next iteration.

Johan
