Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11334164BA9
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 18:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgBSRSF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 12:18:05 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33317 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgBSRSF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 12:18:05 -0500
Received: by mail-lj1-f193.google.com with SMTP id y6so1217886lji.0;
        Wed, 19 Feb 2020 09:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RofHi9gYU0MfSmZMufurAFlHepEM01ZEtiwTgi9BGrA=;
        b=LZOh66VA37oObxEP7Ty5P7kX6pRSh/kdOQ7xpWeqAUCmucbf0VP/c0eKCd4ReTTppo
         JZqjvTRaroW0x4nvkBmbgs8UyJwRmmycGXxLCDU6kuFCnZGxaMeU3eAkvMXItwSz18/5
         adR/Hf+QDmlLeKUOL/pMR8AwqhCMeKaXhEocy0Vp6qYCUWSdcdHDBBiTfaw1lPiw9C/k
         0ALoif7cWH+6mhiFqG8wHhyLVjE+Dv/twYKLNjpDpPRYNFx/Gv1WAxXNn25phx4WBj1V
         HFmxmDzTEZGG14UrtRfLUI+RdmmupuWfy8TkCUB0or8VJrZWQL6ipj1hTRMfVS2yTZQJ
         zd6A==
X-Gm-Message-State: APjAAAW3hY995mX7NBwmDfCLWScEHms7jWlODXn7asNmInJOb0FqKK5b
        vM96TkV/nao1HeOG/FfCLfk=
X-Google-Smtp-Source: APXvYqx8WEW5DwJYqFalOQFg6QSc95CJr9EXAk5YvFEl1v88/LWr6FJofLuta2Vnn9pg+0MFg7u5zQ==
X-Received: by 2002:a05:651c:40c:: with SMTP id 12mr16592063lja.147.1582132682705;
        Wed, 19 Feb 2020 09:18:02 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id b30sm116917lfc.39.2020.02.19.09.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 09:18:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j4Sz1-0003WC-KQ; Wed, 19 Feb 2020 18:17:59 +0100
Date:   Wed, 19 Feb 2020 18:17:59 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 2/4] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20200219171759.GE32540@localhost>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-3-uwe@kleine-koenig.org>
 <20200219132113.GD32540@localhost>
 <20200219163758.5rypsol4n6ucost4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219163758.5rypsol4n6ucost4@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 19, 2020 at 05:37:58PM +0100, Uwe Kleine-König wrote:
> On Wed, Feb 19, 2020 at 02:21:13PM +0100, Johan Hovold wrote:
> > On Thu, Feb 13, 2020 at 10:15:58AM +0100, Uwe Kleine-König wrote:
> > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > Introduce a new function tty_kopen_shared() that yields a struct
> > > tty_struct. The semantic difference to tty_kopen() is that the tty is
> > > expected to be used already. So rename tty_kopen() to
> > > tty_kopen_exclusive() for clearness, adapt the single user and put the
> > > common code in a new static helper function.
> > > 
> > > tty_kopen_shared is to be used to implement an LED trigger for tty
> > > devices in one of the next patches.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> >  
> > > -/**
> > > - *	tty_kopen	-	open a tty device for kernel
> > > - *	@device: dev_t of device to open
> > > - *
> > > - *	Opens tty exclusively for kernel. Performs the driver lookup,
> > > - *	makes sure it's not already opened and performs the first-time
> > > - *	tty initialization.
> > > - *
> > > - *	Returns the locked initialized &tty_struct
> > > - *
> > > - *	Claims the global tty_mutex to serialize:
> > > - *	  - concurrent first-time tty initialization
> > > - *	  - concurrent tty driver removal w/ lookup
> > > - *	  - concurrent tty removal from driver table
> > > - */
> > > -struct tty_struct *tty_kopen(dev_t device)
> > > +static struct tty_struct *tty_kopen(dev_t device, int shared)
> > >  {
> > >  	struct tty_struct *tty;
> > >  	struct tty_driver *driver;
> > > @@ -1905,7 +1890,7 @@ struct tty_struct *tty_kopen(dev_t device)
> > >  
> > >  	/* check whether we're reopening an existing tty */
> > >  	tty = tty_driver_lookup_tty(driver, NULL, index);
> > > -	if (IS_ERR(tty))
> > > +	if (IS_ERR(tty) || shared)
> > 
> > So here you skip initialisation and return NULL if the tty isn't already
> > in use (e.g. is open) when shared is set.
> 
> Which is good, right? If I remember my tests correctly this even works
> if the tty isn't opened but just "exists".

No, this means that your trigger will never be installed unless the port
is already open, yet the sysfs interface still returns success (see
patch 4/4 dev_store()).

Note that the struct tty doesn't exist until the port is opened; it's
allocated in tty_init_dev() that you skip above when "shared" is set.

Johan
