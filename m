Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F904123736
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 21:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfLQUX4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 15:23:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbfLQUX4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 15:23:56 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC3E520716;
        Tue, 17 Dec 2019 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576614235;
        bh=hqOaLKB67ZIyKPeEkO4awMJM3yX8vji2xK3JQcl224A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hpWggXQIz5W1uvKg8EsXaO7PCxxmzQMUXfuL2/AtiB6kQ5wynqXOlX4cfU8RsgNDn
         dTRD8pOkAdHMb1W2f8A4zvWkI5fNx7w/0euUH1KzUussGdbY++56NNjzO5ETV8yJ6V
         rBjAEe+WHJd9g6d2PNbowXKPleompHqmO5PFQ+rQ=
Date:   Tue, 17 Dec 2019 21:23:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 1/3] tty: rename tty_kopen() and add new function
 tty_kopen_shared()
Message-ID: <20191217202353.GA4140500@kroah.com>
References: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
 <20191217165816.19324-2-u.kleine-koenig@pengutronix.de>
 <c83b364b-3494-cf3d-0429-61ec3b502be0@gmail.com>
 <20191217182754.rji5p3npzc2z4gv3@pengutronix.de>
 <8fdf5fcb-d241-896f-5b62-8df2ae3c9f0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fdf5fcb-d241-896f-5b62-8df2ae3c9f0b@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 09:19:38PM +0100, Jacek Anaszewski wrote:
> On 12/17/19 7:27 PM, Uwe Kleine-König wrote:
> > Hello Jacek,
> > 
> > On Tue, Dec 17, 2019 at 07:08:47PM +0100, Jacek Anaszewski wrote:
> >> I wanted to test the set but unfortunately this
> >> patch does not apply. See below for the apparent reason.
> >>
> >>> [...]
> >>> -struct tty_struct *tty_kopen(dev_t device)
> >>> +static struct tty_struct *tty_kopen(dev_t device, int shared)
> >>>  {
> >>>  	struct tty_struct *tty;
> >>>  	struct tty_driver *driver;
> >>
> >> In mainline, even in v5.5-rc2 we have here NULL assignment:
> >>
> >> struct tty_driver *driver = NULL;
> > 
> > Yeah, if you don't want to wait for Greg's tree to appear in next, this
> > is the patch you're missing:
> > 
> > 	https://lkml.org/lkml/2019/12/17/101
> 
> Thanks for the pointer.
> 
> And regarding the trigger - I've tried below use case
> on my desktop Debian:
> 
> Ctrl+Alt+F3 to change the console
> 
> Then logged in and executed tty command:
> 
> $ tty
> $ /dev/tty3
> 
> $ cd /sys/class/leds/input5\:\:capslock
> note: this is LED on my USB keyboard and it works correct
> with e.g. timer trigger
> 
> /sys/class/leds/input5::capslock$ echo tty > trigger
> 
> $ cat /sys/class/tty/tty3/dev > dev
> 
> Type some characters.
> 
> LED does not blink.
> 
> $ echo "aaa" > /dev/tty3
> $ aaa
> 
> LED also does not blink.
> 
> I assume this is correct test case for tty trigger?

Try it on a real serial port, tty3 is a virtual one and I do not think
the "transmit/receive" statistics are every updated on a virtual one as
it does not make any sense to do so.

thanks,

greg k-h
