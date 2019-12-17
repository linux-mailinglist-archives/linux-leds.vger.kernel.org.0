Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEDB12303F
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 16:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfLQP11 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 10:27:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:58204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727459AbfLQP11 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 10:27:27 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA7362072D;
        Tue, 17 Dec 2019 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576596446;
        bh=t6J26HpNYkT7zBIcDR+UAX5qqa5jsg26hrbhFgAYiqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yRIgBV57PmcSGPTlOKR12ZVdoqYXCLFYTJP+R7ch46IwJteaACTx3BDOy/Zy3iGQy
         zVnbPz1imt1gwe0bfj0NtZLKQJxENe/0kDa6oBmoYIq4Y0WpIyAl4Hm1BqHGycMdYz
         0bhaccVDsL8VstUjEOO3M5+cCqFR+F6QCJcpt+1A=
Date:   Tue, 17 Dec 2019 16:27:24 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217152724.GA3667595@kroah.com>
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
 <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 04:07:36PM +0100, Uwe Kleine-König wrote:
> Usage is as follows:
> 
> 	myled=ledname
> 	tty=ttyS0
> 
> 	echo tty > /sys/class/leds/$myled/trigger
> 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev

Is this the correct instructions?  Aren't you looking for a major/minor
number instead in your sysfs file?

> 
> . When this new trigger is active it periodically checks the tty's
> statistics and when it changed since the last check the led is flashed
> once.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/leds/trigger/Kconfig       |   7 ++
>  drivers/leds/trigger/Makefile      |   1 +
>  drivers/leds/trigger/ledtrig-tty.c | 159 +++++++++++++++++++++++++++++
>  3 files changed, 167 insertions(+)
>  create mode 100644 drivers/leds/trigger/ledtrig-tty.c
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index ce9429ca6dde..40ff08c93f56 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -144,4 +144,11 @@ config LEDS_TRIGGER_AUDIO
>  	  the audio mute and mic-mute changes.
>  	  If unsure, say N
>  
> +config LEDS_TRIGGER_TTY
> +	tristate "LED Trigger for TTY devices"
> +	depends on TTY
> +	help
> +	  This allows LEDs to be controlled by activity on ttys which includes
> +	  serial devices like /dev/ttyS0.
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index 733a83e2a718..25c4db97cdd4 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -15,3 +15,4 @@ obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
>  obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
>  obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
>  obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
> +obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
> diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
> new file mode 100644
> index 000000000000..0157aa0b2ce3
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <uapi/linux/serial.h>
> +
> +struct ledtrig_tty_data {
> +	struct led_classdev *led_cdev;
> +	struct delayed_work dwork;
> +	struct tty_struct *tty;
> +	dev_t device;
> +	int rx, tx;
> +};
> +
> +static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
> +{
> +	cancel_delayed_work_sync(&trigger_data->dwork);
> +}
> +
> +static void ledtrig_tty_restart(struct ledtrig_tty_data *trigger_data)
> +{
> +	if (!trigger_data->tty)
> +		return;
> +
> +	schedule_delayed_work(&trigger_data->dwork, 0);
> +}
> +
> +static ssize_t dev_show(struct device *dev,
> +			struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	ssize_t len = 0;
> +
> +	if (trigger_data->tty)
> +		len = sprintf(buf, "%u\n", trigger_data->device);

Will that print a dev_t in a format that userspace can make sense of it?
Should you split it up with MAJOR:MINOR instead?



> +
> +	return len;
> +}
> +
> +static ssize_t dev_store(struct device *dev,
> +			 struct device_attribute *attr, const char *buf,
> +			 size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	struct tty_struct *tty;
> +	unsigned major, minor;
> +	int ret;
> +
> +	if (size == 0 || (size == 1 && buf[0] == '\n')) {
> +		tty = NULL;
> +	} else {
> +		ret = sscanf(buf, "%u:%u", &major, &minor);
> +		if (ret < 2) {
> +			dev_err(dev, "invalid value\n");

Can I DoS the syslog with this?  :)

> +			return -EINVAL;
> +		}
> +
> +		tty = tty_kopen_shared(MKDEV(major, minor));
> +		if (IS_ERR(tty)) {
> +			dev_err(dev, "failed to open tty: %pe\n", tty);

Same here, dev_dbg() perhaps?

Other than these minor things, looks good to me.

Your tty changes are fine, if I can get an ack from the led maintainers
about a working patch 3, I'll be glad to take all 3 in my tree.

thanks,

greg k-h
