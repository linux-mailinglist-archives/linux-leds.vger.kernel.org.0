Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0670A12386A
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 22:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfLQVI3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 16:08:29 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58937 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfLQVI3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 16:08:29 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihK4q-0005qM-2e; Tue, 17 Dec 2019 22:08:20 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihK4o-0006Wv-It; Tue, 17 Dec 2019 22:08:18 +0100
Date:   Tue, 17 Dec 2019 22:08:18 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        kernel@pengutronix.de, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217210818.rbwmrz3fsnobo7nj@pengutronix.de>
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
 <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
 <20191217152724.GA3667595@kroah.com>
 <20191217162313.5n3v7va5nw5lxloh@pengutronix.de>
 <20191217172102.GB3829986@kroah.com>
 <b2844f63-d580-ddc2-b4ed-817eaa89a2c6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2844f63-d580-ddc2-b4ed-817eaa89a2c6@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 09:27:13PM +0100, Jacek Anaszewski wrote:
> On 12/17/19 6:21 PM, Greg Kroah-Hartman wrote:
> > On Tue, Dec 17, 2019 at 05:23:13PM +0100, Uwe Kleine-König wrote:
> >> On Tue, Dec 17, 2019 at 04:27:24PM +0100, Greg Kroah-Hartman wrote:
> >>> On Tue, Dec 17, 2019 at 04:07:36PM +0100, Uwe Kleine-König wrote:
> >>>> Usage is as follows:
> >>>>
> >>>> 	myled=ledname
> >>>> 	tty=ttyS0
> >>>>
> >>>> 	echo tty > /sys/class/leds/$myled/trigger
> >>>> 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
> >>>
> >>> Is this the correct instructions?  Aren't you looking for a major/minor
> >>> number instead in your sysfs file?
> >>
> >> This is correct, yes, at least it works as intended on my machine.
> >>
> >> /sys/class/tty/$tty/dev produces $major:$minor and that's what the
> >> led-trigger consumes.
> > 
> > Ugh, nevermind, I totally read that wrong, I was thinking "echo" instead
> > of cat.  My fault, what you wrote is correct.  Should that be documented
> > somewhere in a Documentation/ABI/ file so that people know how to use
> > this new sysfs file?  How are led triggers documented?
> 
> LED triggers have their corresponding entries in Documentation/ABI.
> 
> Uwe, you already did that for netdev trigger:
> 
> Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> 
> It would be nice to have one for this too.
> 
> There are also less formal docs in Documentation/leds, e.g.:
> 
> Documentation/leds/ledtrig-usbport.rst

I'd put into Documentation/ABI/testing/sysfs-class-led-trigger-tty:

	What:           /sys/class/leds/<led>/dev
	Date:           Dec 2019
	KernelVersion:  5.6
	Contact:        linux-leds@vger.kernel.org
	Description:
			Specifies $major:$minor of the triggering tty

Does this look reasonable?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
