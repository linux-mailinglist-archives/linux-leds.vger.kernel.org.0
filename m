Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111D8122980
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 12:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfLQLF6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 06:05:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:42624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbfLQLF5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 06:05:57 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA4652064B;
        Tue, 17 Dec 2019 11:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576580757;
        bh=ePf090R+2Dq3LbKbJzt3r0Wjqrbb4htnAyrTB+GuTDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kKcA9yrkQIcxlAkHIulAj5FktfHG2J23b1YVkpXpm+WuRNRKHh3yP8PS2Hd0KSmX3
         7mEM6jh4ONZYcCNlWeURalD295M1vDWMQAedgCnripeLdFKw7MWzuUtG/Um8fszY1L
         VktBelSHw6Q7pceceqaqgIGEnWW4DXDJDK3AeFgM=
Date:   Tue, 17 Dec 2019 12:05:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] tty: new helper function tty_kopen_shared
Message-ID: <20191217110554.GA3055718@kroah.com>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-2-u.kleine-koenig@pengutronix.de>
 <20191217082733.GA2672708@kroah.com>
 <20191217105101.fd23zsxxi2e42ltt@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217105101.fd23zsxxi2e42ltt@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 11:51:01AM +0100, Uwe Kleine-König wrote:
> Hello Greg,
> 
> all feedback I don't respond to is planned to be fixed in v3.
> 
> On Tue, Dec 17, 2019 at 09:27:33AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Dec 17, 2019 at 09:17:16AM +0100, Uwe Kleine-König wrote:
> > > +struct tty_struct *tty_kopen_shared(dev_t device)
> > > +{
> > > +	struct tty_struct *tty;
> > > +	struct tty_driver *driver;
> > > +	int index = -1;
> > > +
> > > +	mutex_lock(&tty_mutex);
> > > +	driver = tty_lookup_driver(device, NULL, &index);
> > > +	if (IS_ERR(driver)) {
> > > +		tty = ERR_CAST(driver);
> > > +		goto err_lookup_driver;
> > > +	}
> > > +
> > > +	tty = tty_driver_lookup_tty(driver, NULL, index);
> > 
> > No error check?
> 
> Well, the caller of tty_kopen_shared is supposed to check for error
> returns. Do you think an error message here would be approriate? I'd do
> this in the caller similar to how tty_kopen works.

Ah, you are passing it on to the caller, ok, nevermind.

greg k-h
