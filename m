Return-Path: <linux-leds+bounces-2745-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17D97AC8D
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2024 10:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28CE2811DC
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2024 08:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD69C14BF8B;
	Tue, 17 Sep 2024 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSwNfkZ0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A3136337;
	Tue, 17 Sep 2024 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560257; cv=none; b=Iig1bMD9EigciHFk+6jWCUib71yhBoqbIBZVKbMlJdIngI3d0OKVyIeXWc3RGv/CM2/nnpusaXP+cCmiiTQ5bMxvG0jPgMOU+nSqOtK5hx7eJWmHNmVyMc0HBqxPSOvRsmi55nKMEmIuqhdl/+cbA9HCh4jYdA2VfXHIqyXpQBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560257; c=relaxed/simple;
	bh=qSmOUeitvOYO+X0AQn7LUF4PASe8G186GO/GIZ2AJwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDYkjtyha2s8PTwWVpYU3acOWLxxorBkmYRpUR3KcjQNObHYfsVg76iQWEvpl9mPNzq6Z/+1u3j3zEH6KrBwnbtCjO9gqyY3IFqVYGnmOTb66Xc/4jOpc+hAnjSHw/oNM6EXA1hsyTAznQ/RXu2QE0sNLHoqUnhdbj9zIUoIF7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSwNfkZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C36EC4CEC6;
	Tue, 17 Sep 2024 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726560257;
	bh=qSmOUeitvOYO+X0AQn7LUF4PASe8G186GO/GIZ2AJwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSwNfkZ0YxpTjPyDqRgif8IXCSszGvIrkWYIJDgQfFgk/NJKlpV0xZUi1WL8r2S5O
	 sn81g2h2/aBURMG788k4S51y6to7YLtHFFxIHvqMoDKVa+raDoPMUCd0qTVWNdouBR
	 Yo8fX8XFpV4JydaC0uxXpwqcyfUXD8o6VLgZZ3/R8P+M2tKRjiOpfbqMl+SQmKjBCP
	 zBopYgAPd0Q+tfZ/4DTz0hwoQlMDgNfrig2V+vPo1O/wsAa9h/GhBzNuhAdxFqdKbO
	 DgqAoYtUsKm2uwVzuyAmqmrYClHQxLWx1z0aa0SX4GPmgnqa9qHKhnJwGNwTm/whTq
	 SiCNxv4kz3bzg==
Date: Tue, 17 Sep 2024 09:04:12 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	kernel@salutedevices.com, rockosov@gmail.com,
	Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: [PATCH v2] leds: introduce ordered workqueue for leds events
 instead of system_wq
Message-ID: <20240917080412.GB9955@google.com>
References: <20240903223936.21292-1-ddrokosov@salutedevices.com>
 <20240916111733.c5rp4l666rtdz7bt@CAB-WSD-L081021>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916111733.c5rp4l666rtdz7bt@CAB-WSD-L081021>

On Mon, 16 Sep 2024, Dmitry Rokosov wrote:

> Hello Lee!
> 
> What are the next steps? Should I make any changes, or are we waiting
> for test results from the mailing list members?

This is an intrusive core change that was submitted during -rc6.

It's going to need some time on the list for people to respond.

> Sorry for the ping.
> 
> On Wed, Sep 04, 2024 at 01:39:30AM +0300, Dmitry Rokosov wrote:
> > This allows to setup ordered workqueue for leds events. This may be
> > useful, because default 'system_wq' does not guarantee execution order
> > of each work_struct, thus for several brightness update requests (for
> > multiple leds), real brightness switch could be in random order.
> > 
> > Yes, for sysfs-based leds we have flush_work() call inside
> > brightness_store() operation, but it's blocking call, so userspace
> > caller can be blocked at a long time, which means leds animation stream
> > can be broken.
> > 
> > Ordered workqueue has the same behaviour as system_wq + flush_work(),
> > but all scheduled works are async and userspace caller is not blocked,
> > which it better for userspace animation scheduling.
> > 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > ---
> > Changes v2 since v1 at [1]:
> >     - replace "leds" with "LEDs" in the log message
> > 
> > Links:
> >     [1] https://lore.kernel.org/all/20240820155407.32729-1-ddrokosov@salutedevices.com/
> > ---
> >  drivers/leds/led-class.c | 12 +++++++++++-
> >  drivers/leds/led-core.c  |  6 +++---
> >  include/linux/leds.h     |  1 +
> >  3 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index c66d1bead0a4..b5e28ad54f7f 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -25,6 +25,8 @@
> >  static DEFINE_MUTEX(leds_lookup_lock);
> >  static LIST_HEAD(leds_lookup_list);
> >  
> > +static struct workqueue_struct *leds_wq;
> > +
> >  static ssize_t brightness_show(struct device *dev,
> >  		struct device_attribute *attr, char *buf)
> >  {
> > @@ -57,7 +59,6 @@ static ssize_t brightness_store(struct device *dev,
> >  	if (state == LED_OFF)
> >  		led_trigger_remove(led_cdev);
> >  	led_set_brightness(led_cdev, state);
> > -	flush_work(&led_cdev->set_brightness_work);
> >  
> >  	ret = size;
> >  unlock:
> > @@ -548,6 +549,8 @@ int led_classdev_register_ext(struct device *parent,
> >  
> >  	led_update_brightness(led_cdev);
> >  
> > +	led_cdev->wq = leds_wq;
> > +
> >  	led_init_core(led_cdev);
> >  
> >  #ifdef CONFIG_LEDS_TRIGGERS
> > @@ -666,12 +669,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
> >  
> >  static int __init leds_init(void)
> >  {
> > +	leds_wq = alloc_ordered_workqueue("leds", 0);
> > +	if (!leds_wq) {
> > +		pr_err("failed to create LEDs ordered workqueue\n");
> > +		return -ENOMEM;
> > +	}
> > +
> >  	return class_register(&leds_class);
> >  }
> >  
> >  static void __exit leds_exit(void)
> >  {
> >  	class_unregister(&leds_class);
> > +	destroy_workqueue(leds_wq);
> >  }
> >  
> >  subsys_initcall(leds_init);
> > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> > index 89c9806cc97f..9769ac49be20 100644
> > --- a/drivers/leds/led-core.c
> > +++ b/drivers/leds/led-core.c
> > @@ -266,7 +266,7 @@ void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on
> >  		led_cdev->delayed_delay_on = delay_on;
> >  		led_cdev->delayed_delay_off = delay_off;
> >  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
> > -		schedule_work(&led_cdev->set_brightness_work);
> > +		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> >  		return;
> >  	}
> >  
> > @@ -297,7 +297,7 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
> >  		 */
> >  		if (!brightness) {
> >  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> > -			schedule_work(&led_cdev->set_brightness_work);
> > +			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> >  		} else {
> >  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> >  				&led_cdev->work_flags);
> > @@ -333,7 +333,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
> >  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
> >  	}
> >  
> > -	schedule_work(&led_cdev->set_brightness_work);
> > +	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> >  }
> >  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
> >  
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index 6300313c46b7..7c9f1cb12ab9 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -169,6 +169,7 @@ struct led_classdev {
> >  	int			 new_blink_brightness;
> >  	void			(*flash_resume)(struct led_classdev *led_cdev);
> >  
> > +	struct workqueue_struct *wq; /* LED workqueue */
> >  	struct work_struct	set_brightness_work;
> >  	int			delayed_set_value;
> >  	unsigned long		delayed_delay_on;
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Thank you,
> Dmitry

-- 
Lee Jones [李琼斯]

