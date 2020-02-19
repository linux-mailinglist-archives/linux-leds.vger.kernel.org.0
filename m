Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF1C1642DD
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 12:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgBSLDO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 06:03:14 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46523 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgBSLDN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 06:03:13 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4N8H-0004mY-1p; Wed, 19 Feb 2020 12:03:09 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4N8E-0001EF-SZ; Wed, 19 Feb 2020 12:03:06 +0100
Date:   Wed, 19 Feb 2020 12:03:06 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 4/4] leds: trigger: implement a tty trigger
Message-ID: <20200219110306.k5jndutalll64esu@pengutronix.de>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-5-uwe@kleine-koenig.org>
 <20200219105239.GA32540@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219105239.GA32540@localhost>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 19, 2020 at 11:52:39AM +0100, Johan Hovold wrote:
> On Thu, Feb 13, 2020 at 10:16:00AM +0100, Uwe Kleine-König wrote:
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Usage is as follows:
> > 
> > 	myled=ledname
> > 	tty=ttyS0
> > 
> > 	echo tty > /sys/class/leds/$myled/trigger
> > 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
> > 
> > . When this new trigger is active it periodically checks the tty's
> > statistics and when it changed since the last check the led is flashed
> > once.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> 
> > +static ssize_t dev_store(struct device *dev,
> > +			 struct device_attribute *attr, const char *buf,
> > +			 size_t size)
> > +{
> > +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> > +	struct tty_struct *tty;
> > +	dev_t d;
> > +	int ret;
> > +
> > +	if (size == 0 || (size == 1 && buf[0] == '\n')) {
> > +		tty = NULL;
> > +	} else {
> > +		ret = kstrtodev_t(buf, &d);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		tty = tty_kopen_shared(d);
> 
> I really don't have time to look at this, but having the led-trigger
> keep the port open looks fundamentally broken (consider modem-control
> signals, power, etc).

If I understand correctly calling tty_kopen_shared() doesn't open the
device, just keep it referenced which prevents it to disappear. Unless I
miss something it doesn't result in the tty's .open() being called.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
