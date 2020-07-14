Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6CD21E9CC
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2020 09:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgGNHNu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Jul 2020 03:13:50 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38077 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgGNHNu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Jul 2020 03:13:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id x9so11229970ljc.5;
        Tue, 14 Jul 2020 00:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=I8q/kKOoJ4EDNZmyw9B1tAKEj1PJEvtqbKVmsPEfvXs=;
        b=uQCAhWNsC0e3oJaE6PhefE+B4+veKwpnFXSQzq4MaB30U5gvjYSmGElbh9OZEDh7CJ
         1VpAtvxNP2cSJyjzyXRVo+a/i6slMA8xwHTxT83NgIraC3ukOhgRf96gAXVVlWwYItWN
         t4AAW1jH9JuH9+9vKZqI4TEtd1Pl6ttTeTGWCoQodJbdl4ht5hcVLbpMNgCL2M/d3kJj
         38+NY1BKhWERks5eI3F/nPQZsM0CtuPN4Uwl9nvpNLHkp2i7ktBRA+hrXpS19bb0cpgs
         f9tuvIaA5safynrIjfPFN8LNz7e4/qXIB3RUEz3bE4SJlVkg3jaDohqo5t5pzFkV1QCy
         q0hA==
X-Gm-Message-State: AOAM532lpg6vdm1gd9LfgZ6r69SUoMVPLA9wmbWnUfrAvPUCVqLuHTND
        oCSSCYLA4rIx2FZlGe0mHUv4ebrY300=
X-Google-Smtp-Source: ABdhPJzQkSTYKCrOtoiirkCn7UfcT2sr5AYRFu3/FFh6u8vMuj1l/H7fCj2W0oyXAz0VwVAj35osCg==
X-Received: by 2002:a2e:9a16:: with SMTP id o22mr1753925lji.40.1594710826288;
        Tue, 14 Jul 2020 00:13:46 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o64sm5093636lfa.22.2020.07.14.00.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 00:13:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jvF8V-0008HK-9M; Tue, 14 Jul 2020 09:13:56 +0200
Date:   Tue, 14 Jul 2020 09:13:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200714071355.GY3453@localhost>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jul 07, 2020 at 06:59:58PM +0200, Uwe Kleine-König wrote:
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
>  drivers/leds/trigger/Kconfig                  |   7 +
>  drivers/leds/trigger/Makefile                 |   1 +
>  drivers/leds/trigger/ledtrig-tty.c            | 192 ++++++++++++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
>  create mode 100644 drivers/leds/trigger/ledtrig-tty.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-tty b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> new file mode 100644
> index 000000000000..5c53ce3ede36
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> @@ -0,0 +1,6 @@
> +What:		/sys/class/leds/<led>/ttyname
> +Date:		Jul 2020
> +KernelVersion:	5.8
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Specifies the tty device name of the triggering tty
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
> index 000000000000..e44e2202fa34
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-tty.c
> @@ -0,0 +1,192 @@
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

> +static ssize_t ttyname_store(struct device *dev,
> +			     struct device_attribute *attr, const char *buf,
> +			     size_t size)
> +{
> +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> +	char *ttyname;
> +	ssize_t ret = size;
> +
> +	ledtrig_tty_halt(trigger_data);
> +
> +	mutex_lock(&trigger_data->mutex);
> +
> +	if (size > 0 && buf[size - 1] == '\n')
> +		size -= 1;
> +
> +	if (size) {
> +		ttyname = kmemdup_nul(buf, size, GFP_KERNEL);
> +		if (!ttyname) {
> +			ret = -ENOMEM;
> +			goto out_unlock;
> +		}
> +	} else {
> +		ttyname = NULL;
> +	}
> +
> +	kfree(trigger_data->ttyname);
> +	tty_kref_put(trigger_data->tty);
> +	trigger_data->tty = NULL;
> +
> +	trigger_data->ttyname = ttyname;
> +
> +out_unlock:
> +	mutex_unlock(&trigger_data->mutex);
> +
> +	if (ttyname)
> +		ledtrig_tty_restart(trigger_data);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(ttyname);
> +
> +static void ledtrig_tty_work(struct work_struct *work)
> +{
> +	struct ledtrig_tty_data *trigger_data =
> +		container_of(work, struct ledtrig_tty_data, dwork.work);
> +	struct serial_icounter_struct icount;
> +	int ret;
> +	bool firstrun = false;
> +
> +	mutex_lock(&trigger_data->mutex);
> +
> +	BUG_ON(!trigger_data->ttyname);
> +
> +	/* try to get the tty corresponding to $ttyname */
> +	if (!trigger_data->tty) {
> +		dev_t devno;
> +		struct tty_struct *tty;
> +		int ret;
> +
> +		firstrun = true;
> +
> +		ret = tty_dev_name_to_number(trigger_data->ttyname, &devno);
> +		if (ret < 0)
> +			/*
> +			 * A device with this name might appear later, so keep
> +			 * retrying.
> +			 */
> +			goto out;
> +
> +		tty = tty_kopen_shared(devno);
> +		if (IS_ERR(tty) || !tty)
> +			/* What to do? retry or abort */
> +			goto out;
> +
> +		trigger_data->tty = tty;
> +	}
> +
> +	ret = tty_get_icount(trigger_data->tty, &icount);
> +	if (ret)
> +		return;
> +
> +	while (firstrun ||
> +	       icount.rx != trigger_data->rx ||
> +	       icount.tx != trigger_data->tx) {
> +
> +		led_set_brightness(trigger_data->led_cdev, LED_ON);
> +
> +		msleep(100);
> +
> +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> +
> +		trigger_data->rx = icount.rx;
> +		trigger_data->tx = icount.tx;
> +		firstrun = false;
> +
> +		ret = tty_get_icount(trigger_data->tty, &icount);
> +		if (ret)
> +			return;
> +	}

Haven't looked at the latest proposal in detail, but this looks broken
as you can potentially loop indefinitely in a worker thread, and with no
way to stop the trigger (delayed work).

> +
> +out:
> +	mutex_unlock(&trigger_data->mutex);
> +	schedule_delayed_work(&trigger_data->dwork, msecs_to_jiffies(100));
> +}

Johan
