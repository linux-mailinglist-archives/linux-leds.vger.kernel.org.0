Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8131712293D
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 11:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfLQKvM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 05:51:12 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40609 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfLQKvJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 05:51:09 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihARS-000152-O1; Tue, 17 Dec 2019 11:51:02 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihARR-0004u2-SF; Tue, 17 Dec 2019 11:51:01 +0100
Date:   Tue, 17 Dec 2019 11:51:01 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] tty: new helper function tty_kopen_shared
Message-ID: <20191217105101.fd23zsxxi2e42ltt@pengutronix.de>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-2-u.kleine-koenig@pengutronix.de>
 <20191217082733.GA2672708@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217082733.GA2672708@kroah.com>
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

all feedback I don't respond to is planned to be fixed in v3.

On Tue, Dec 17, 2019 at 09:27:33AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 17, 2019 at 09:17:16AM +0100, Uwe Kleine-König wrote:
> > +struct tty_struct *tty_kopen_shared(dev_t device)
> > +{
> > +	struct tty_struct *tty;
> > +	struct tty_driver *driver;
> > +	int index = -1;
> > +
> > +	mutex_lock(&tty_mutex);
> > +	driver = tty_lookup_driver(device, NULL, &index);
> > +	if (IS_ERR(driver)) {
> > +		tty = ERR_CAST(driver);
> > +		goto err_lookup_driver;
> > +	}
> > +
> > +	tty = tty_driver_lookup_tty(driver, NULL, index);
> 
> No error check?

Well, the caller of tty_kopen_shared is supposed to check for error
returns. Do you think an error message here would be approriate? I'd do
this in the caller similar to how tty_kopen works.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
