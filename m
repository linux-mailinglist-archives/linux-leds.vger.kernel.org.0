Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD659131811
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2020 20:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbgAFS7V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Jan 2020 13:59:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgAFS7V (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Jan 2020 13:59:21 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E88B12072A;
        Mon,  6 Jan 2020 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578337160;
        bh=v9d35TVrIgudq/ZtG6CwFsc6NUWvH2KVrcE15fX6q9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cny6ABu/mU+myEV7taYl6RIQey4gbUi1362mYgSCcKsnwVDJRHWTqZlndb2yhRS4H
         br5CM49+v3rUvzbUgtfNnyuYnenSm00XYxTCv2jOqkiGybzgBIW4jdyNv1psvYM0Hj
         jIQCZNXoyQsXQ59oSCY6VsAQNTvsdQYZh7UVtfLY=
Date:   Mon, 6 Jan 2020 19:59:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@denx.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200106185918.GB597279@kroah.com>
References: <20191219093947.15502-1-u.kleine-koenig@pengutronix.de>
 <20191219093947.15502-4-u.kleine-koenig@pengutronix.de>
 <20191221184047.GC32732@amd>
 <20191223100828.bqtda4zilc74fqfk@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223100828.bqtda4zilc74fqfk@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Dec 23, 2019 at 11:08:28AM +0100, Uwe Kleine-K�nig wrote:
> Hello Pavel,
> 
> On Sat, Dec 21, 2019 at 07:40:47PM +0100, Pavel Machek wrote:
> > > +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-tty
> > > @@ -0,0 +1,6 @@
> > > +What:		/sys/class/leds/<led>/dev
> > > +Date:		Dec 2019
> > > +KernelVersion:	5.6
> > > +Contact:	linux-leds@vger.kernel.org
> > > +Description:
> > > +		Specifies $major:$minor of the triggering tty
> > 
> > Ok, sounds reasonable.
> > 
> > > +static ssize_t dev_store(struct device *dev,
> > > +			 struct device_attribute *attr, const char *buf,
> > > +			 size_t size)
> > > +{
> > > +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> > > +	struct tty_struct *tty;
> > > +	unsigned major, minor;
> > > +	int ret;
> > > +
> > > +	if (size == 0 || (size == 1 && buf[0] == '\n')) {
> > > +		tty = NULL;
> > > +	} else {
> > > +		ret = sscanf(buf, "%u:%u", &major, &minor);
> > > +		if (ret < 2)
> > > +			return -EINVAL;
> > 
> > If user writes 1:2:badparsingofdata into the file, it will pass, right?
> 
> Yes, and it will have the same effect as writing 1:2. I wonder if this
> is bad.
> 
> > > +		tty = tty_kopen_shared(MKDEV(major, minor));
> > > +		if (IS_ERR(tty))
> > > +			return PTR_ERR(tty);
> > > +	}
> > 
> > Do you need to do some kind of tty_kclose()? What happens if the
> > device disappears, for example because the USB modem is unplugged?
> 
> Only tty_kref_put is needed to close.
> 
> > > +static void ledtrig_tty_work(struct work_struct *work)
> > > +{
> > > +	struct ledtrig_tty_data *trigger_data =
> > > +		container_of(work, struct ledtrig_tty_data, dwork.work);
> > > +	struct serial_icounter_struct icount;
> > > +	int ret;
> > > +
> > > +	if (!trigger_data->tty) {
> > > +		led_set_brightness(trigger_data->led_cdev, LED_OFF);
> > > +		return;
> > > +	}
> > > +
> > > +	ret = tty_get_icount(trigger_data->tty, &icount);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	if (icount.rx != trigger_data->rx ||
> > > +	    icount.tx != trigger_data->tx) {
> > > +		unsigned long delay_on = 100, delay_off = 100;
> > > +
> > > +		led_blink_set_oneshot(trigger_data->led_cdev,
> > > +				      &delay_on, &delay_off, 0);
> > > +
> > > +		trigger_data->rx = icount.rx;
> > > +		trigger_data->tx = icount.tx;
> > > +	}
> > 
> > Since you are polling this, anyway, can you just manipulate brightness
> > directly instead of using _oneshot()? _oneshot() will likely invoke
> > another set of workqueues.
> 
> I copied that from the netdev trigger. I failed to find a suitable
> helper function, did I miss that or does it need creating?
>  
> > LED triggers were meant to operate directly from the events, not based
> > on statistics like this.
> 
> Ditto; just copied from the netdev trigger. I tried to find a suitable
> place to add a trigger in the core, but this is hard without having to
> modify all drivers; additionally this is in thier hot path. So I
> considered using statistics a good idea. Greg also liked it and someone
> before us for the network trigger, too ...

This still looks ok to me, any objections to me merging it in my tty
tree?

thanks,

greg k-h
