Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5D0122954
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 11:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfLQK6e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 05:58:34 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51301 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLQK6e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 05:58:34 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihAYd-0001ni-EK; Tue, 17 Dec 2019 11:58:27 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihAYc-00054Y-76; Tue, 17 Dec 2019 11:58:26 +0100
Date:   Tue, 17 Dec 2019 11:58:26 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217105826.6d2odt4k5b4qknjk@pengutronix.de>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-4-u.kleine-koenig@pengutronix.de>
 <20191217083211.GC2672708@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217083211.GC2672708@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Greg,

On Tue, Dec 17, 2019 at 09:32:11AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 17, 2019 at 09:17:18AM +0100, Uwe Kleine-König wrote:
> > +	ret = tty_get_icount(trigger_data->tty, &icount);
> > +	if (icount.rx > trigger_data->icount.rx ||
> > +	    icount.tx > trigger_data->icount.tx) {
> 
> What happens when icount.rx and/or icount.tx wraps?  It's "only" an int.

Good catch. I wonder why this is not an unsigned quantity. Just grepping
through drivers/tty/serial most drivers just increment these counters
and don't care for overflow (which is undefined for ints) either. :-\

..ooOO(Where is the can maintainer? --- We found a can of worms :-)

> > +		unsigned long delay_on = 100, delay_off = 100;
> > +
> > +		led_blink_set_oneshot(trigger_data->led_cdev,
> > +				      &delay_on, &delay_off, 0);
> > +
> > +		trigger_data->icount = icount;
> 
> Implicit memcpy of a structure?  Ick.

I'd call that elegant ;-)

> All you care about are the two integers, why not just track them instead
> of the whole thing?

For now I only care about tx and rx, but I intend to add some bells and
whistles to trigger on other events. (But I don't care much, can add
that once I implement this support.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
