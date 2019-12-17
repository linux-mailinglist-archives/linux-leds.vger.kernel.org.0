Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBE21226B5
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 09:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfLQIcP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 03:32:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:38192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfLQIcP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 03:32:15 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DFD420717;
        Tue, 17 Dec 2019 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576571533;
        bh=nRpxsLlEtYzXfsLUlkFlfMcpYSphvB4WowK0VqldUl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t7e+Ax2+ZBspLksQYG7uPv3E2ZuiHHVhZiWcC9k2OFlLuRvjCehtSpYeVkpgrizny
         66uoSCuiife3CR+OL9t6tcSjnU/86K+DcFkRZHa7yihQtM17ThoVX27LxwhbyZiJ3u
         fEidIXxt4NNSFvETfD7dsC3++zPuWJDiB2UaurNA=
Date:   Tue, 17 Dec 2019 09:32:11 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217083211.GC2672708@kroah.com>
References: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
 <20191217081718.23807-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217081718.23807-4-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 09:17:18AM +0100, Uwe Kleine-König wrote:
> Usage is as follows:
> 
> 	myled=ledname
> 	tty=ttyS0
> 
> 	echo tty > /sys/class/led/$myled/trigger
> 	cat /sys/class/tty/$tty/dev > /sys/class/led/$myled/dev
> 
> . When this new trigger is active it periodically checks the tty's
> statistics and when it changed since the last check the led is flashed
> once.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/leds/trigger/Kconfig       |   7 ++
>  drivers/leds/trigger/Makefile      |   1 +
>  drivers/leds/trigger/ledtrig-tty.c | 146 +++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
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
> index 000000000000..3f3197366700
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -0,0 +1,146 @@
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
> +	struct serial_icounter_struct icount;
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
> +			return -EINVAL;
> +		}
> +
> +		tty = tty_kopen_shared(MKDEV(major, minor));
> +		if (IS_ERR(tty)) {
> +			dev_err(dev, "failed to open tty: %pe\n", tty);
> +			return PTR_ERR(tty);
> +		}
> +	}
> +
> +	ledtrig_tty_halt(trigger_data);
> +
> +	tty_kref_put(trigger_data->tty);
> +	trigger_data->tty = tty;
> +	trigger_data->device = MKDEV(major, minor);
> +
> +	ledtrig_tty_restart(trigger_data);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(dev);
> +
> +static void ledtrig_tty_work(struct work_struct *work)
> +{
> +	struct ledtrig_tty_data *trigger_data =
> +		container_of(work, struct ledtrig_tty_data, dwork.work);
> +	struct serial_icounter_struct icount;
> +	int ret;
> +
> +	if (!trigger_data->tty) {
> +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> +		return;
> +	}
> +
> +	ret = tty_get_icount(trigger_data->tty, &icount);
> +	if (icount.rx > trigger_data->icount.rx ||
> +	    icount.tx > trigger_data->icount.tx) {

What happens when icount.rx and/or icount.tx wraps?  It's "only" an int.

> +		unsigned long delay_on = 100, delay_off = 100;
> +
> +		led_blink_set_oneshot(trigger_data->led_cdev,
> +				      &delay_on, &delay_off, 0);
> +
> +		trigger_data->icount = icount;

Implicit memcpy of a structure?  Ick.

All you care about are the two integers, why not just track them instead
of the whole thing?

thanks,

greg k-h
