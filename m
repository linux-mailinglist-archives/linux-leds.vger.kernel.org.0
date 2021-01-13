Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755432F4FA7
	for <lists+linux-leds@lfdr.de>; Wed, 13 Jan 2021 17:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbhAMQPg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Jan 2021 11:15:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:42396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbhAMQPg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 13 Jan 2021 11:15:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5477D23339;
        Wed, 13 Jan 2021 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610554494;
        bh=rAxbfr1yH9EfqpiSDkdLoshUOly8OCUxRatOfRqD8+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c5P/ND0CGFBaf8j3KWnNJIQpMlnKQ1qsjdMYt1VaNwyDUqEQKp3IJAarwo0tyRwfb
         VjdJx/wgcMMjUcARj5rnP3a35UzRqqIjGgqyHJlyIGqL0CiuobhgUtNI6hvH5pBijF
         nKjUhHRaS3zMx0Y7o7aj3EhxUDx0+JFD/yj8cAv8=
Date:   Wed, 13 Jan 2021 17:16:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v10 3/3] leds: trigger: implement a tty trigger
Message-ID: <X/8cwD51DYhzRdDO@kroah.com>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Dec 18, 2020 at 11:42:46AM +0100, Uwe Kleine-König wrote:
> Usage is as follows:
> 
> 	myled=ledname
> 	tty=ttyS0
> 
> 	echo tty > /sys/class/leds/$myled/trigger
> 	echo $tty > /sys/class/leds/$myled/ttyname
> 
> . When this new trigger is active it periodically checks the tty's
> statistics and when it changed since the last check the led is flashed
> once.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
>  drivers/leds/trigger/Kconfig                  |   9 +
>  drivers/leds/trigger/Makefile                 |   1 +
>  drivers/leds/trigger/ledtrig-tty.c            | 188 ++++++++++++++++++
>  4 files changed, 204 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
>  create mode 100644 drivers/leds/trigger/ledtrig-tty.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> new file mode 100644
> index 000000000000..2bf6b24e781b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -0,0 +1,6 @@
> +What:		/sys/class/leds/<led>/ttyname
> +Date:		Dec 2020
> +KernelVersion:	5.10
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Specifies the tty device name of the triggering tty
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index ce9429ca6dde..b77a01bd27f4 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -144,4 +144,13 @@ config LEDS_TRIGGER_AUDIO
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
> +	  When build as a module this driver will be called ledtrig-tty.
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
> index 000000000000..c1e87c0d23c3
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/delay.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <uapi/linux/serial.h>
> +
> +struct ledtrig_tty_data {
> +	struct led_classdev *led_cdev;
> +	struct delayed_work dwork;
> +	struct mutex mutex;
> +	const char *ttyname;
> +	struct tty_struct *tty;
> +	int rx, tx;
> +};
> +
> +static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
> +{
> +	cancel_delayed_work_sync(&trigger_data->dwork);
> +}

This causes the following build warning with the patch applied:

drivers/leds/trigger/ledtrig-tty.c:19:13: warning: ‘ledtrig_tty_halt’ defined but not used [-Wunused-function]
   19 | static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
      |             ^~~~~~~~~~~~~~~~

Can you fix this up and just resend this patch (the other 2 are already
in my tree), so that I can queue it up?

thanks,

greg k-h
