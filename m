Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82AB912324B
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 17:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfLQQXX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 11:23:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42925 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbfLQQXW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 11:23:22 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihFcw-0008Ua-NX; Tue, 17 Dec 2019 17:23:14 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihFcv-0000T1-8r; Tue, 17 Dec 2019 17:23:13 +0100
Date:   Tue, 17 Dec 2019 17:23:13 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217162313.5n3v7va5nw5lxloh@pengutronix.de>
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
 <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
 <20191217152724.GA3667595@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217152724.GA3667595@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 04:27:24PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 17, 2019 at 04:07:36PM +0100, Uwe Kleine-K�nig wrote:
> > Usage is as follows:
> > 
> > 	myled=ledname
> > 	tty=ttyS0
> > 
> > 	echo tty > /sys/class/leds/$myled/trigger
> > 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
> 
> Is this the correct instructions?  Aren't you looking for a major/minor
> number instead in your sysfs file?

This is correct, yes, at least it works as intended on my machine.

/sys/class/tty/$tty/dev produces $major:$minor and that's what the
led-trigger consumes.

> > . When this new trigger is active it periodically checks the tty's
> > statistics and when it changed since the last check the led is flashed
> > once.
> > 
> > Signed-off-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/leds/trigger/Kconfig       |   7 ++
> >  drivers/leds/trigger/Makefile      |   1 +
> >  drivers/leds/trigger/ledtrig-tty.c | 159 +++++++++++++++++++++++++++++
> >  3 files changed, 167 insertions(+)
> >  create mode 100644 drivers/leds/trigger/ledtrig-tty.c
> > 
> > diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> > index ce9429ca6dde..40ff08c93f56 100644
> > --- a/drivers/leds/trigger/Kconfig
> > +++ b/drivers/leds/trigger/Kconfig
> > @@ -144,4 +144,11 @@ config LEDS_TRIGGER_AUDIO
> >  	  the audio mute and mic-mute changes.
> >  	  If unsure, say N
> >  
> > +config LEDS_TRIGGER_TTY
> > +	tristate "LED Trigger for TTY devices"
> > +	depends on TTY
> > +	help
> > +	  This allows LEDs to be controlled by activity on ttys which includes
> > +	  serial devices like /dev/ttyS0.
> > +
> >  endif # LEDS_TRIGGERS
> > diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> > index 733a83e2a718..25c4db97cdd4 100644
> > --- a/drivers/leds/trigger/Makefile
> > +++ b/drivers/leds/trigger/Makefile
> > @@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
> >  obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
> >  obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
> >  obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
> > +obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
> > diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> > new file mode 100644
> > index 000000000000..0157aa0b2ce3
> > --- /dev/null
> > +++ b/drivers/leds/trigger/ledtrig-tty.c
> > @@ -0,0 +1,159 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/tty.h>
> > +#include <uapi/linux/serial.h>
> > +
> > +struct ledtrig_tty_data {
> > +	struct led_classdev *led_cdev;
> > +	struct delayed_work dwork;
> > +	struct tty_struct *tty;
> > +	dev_t device;
> > +	int rx, tx;
> > +};
> > +
> > +static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
> > +{
> > +	cancel_delayed_work_sync(&trigger_data->dwork);
> > +}
> > +
> > +static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
> > +{
> > +	if (!trigger_data->tty)
> > +		return;
> > +
> > +	schedule_delayed_work(&trigger_data->dwork, 0);
> > +}
> > +
> > +static ssize_t dev_show(struct device *dev,
> > +			struct device_attribute *attr, char *buf)
> > +{
> > +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> > +	ssize_t len = 0;
> > +
> > +	if (trigger_data->tty)
> > +		len = sprintf(buf, "%u\n", trigger_data->device);
> 
> Will that print a dev_t in a format that userspace can make sense of it?
> Should you split it up with MAJOR:MINOR instead?

Ah, yes, this needs fixing to match the format that is used in .store.

> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t dev_store(struct device *dev,
> > +			 struct device_attribute *attr, const char *buf,
> > +			 size_t size)
> > +{
> > +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> > +	struct tty_struct *tty;
> > +	unsigned major, minor;
> > +	int ret;
> > +
> > +	if (size == 0 || (size == 1 && buf[0] == '\n')) {
> > +		tty = NULL;
> > +	} else {
> > +		ret = sscanf(buf, "%u:%u", &major, &minor);
> > +		if (ret < 2) {
> > +			dev_err(dev, "invalid value\n");
> 
> Can I DoS the syslog with this?  :)

Only if you can write to the sysfs file in which case you can DoS the
syslog anyhow :-)

> > +			return -EINVAL;
> > +		}
> > +
> > +		tty = tty_kopen_shared(MKDEV(major, minor));
> > +		if (IS_ERR(tty)) {
> > +			dev_err(dev, "failed to open tty: %pe\n", tty);
> 
> Same here, dev_dbg() perhaps?
> 
> Other than these minor things, looks good to me.
> 
> Your tty changes are fine, if I can get an ack from the led maintainers
> about a working patch 3, I'll be glad to take all 3 in my tree.

You'll get a v4 in a moment. Thanks for your prompt reviews.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
