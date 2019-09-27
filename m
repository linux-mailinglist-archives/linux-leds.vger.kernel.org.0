Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E17BFF41
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2019 08:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfI0Gjr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 27 Sep 2019 02:39:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbfI0Gjr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 27 Sep 2019 02:39:47 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A844206B7;
        Fri, 27 Sep 2019 06:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569566385;
        bh=D1fbue6fRZB4ayd5BBQrUrBpjiNtGLlHZOZwf77w/QY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o5x4AK5F1vZEOrfezH4jbc39hpNYS3BguZvxXn5MskTlAY9SqfxueebW5k+EGSxH3
         YYpPwP/5Ln+Z639khcl4bSucKK5SAhYOuc8PbKtvFFTAblbe8pi6pEydPO+u++I1eB
         eKwdM+Qw9U/gKaevIo4aTwihv4jM93b02Fcy3zkg=
Date:   Fri, 27 Sep 2019 08:35:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/1] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190927063547.GA1786569@kroah.com>
References: <1568387004-3802-1-git-send-email-akinobu.mita@gmail.com>
 <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568387004-3802-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Sep 14, 2019 at 12:03:24AM +0900, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, the size of this file is limited to PAGE_SIZE because of the
> limitation for sysfs attribute.
> 
> Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> and which trigger is currently activated.
> 
> We work around it here by converting /sys/class/leds/<led>/trigger to
> binary attribute, which is not limited by length. This is _not_ good
> design, do not copy it.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/leds/led-class.c    |  8 ++--
>  drivers/leds/led-triggers.c | 90 ++++++++++++++++++++++++++++++++++-----------
>  drivers/leds/leds.h         |  6 +++
>  include/linux/leds.h        |  5 ---
>  4 files changed, 79 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 4793e77..8b5a1d1 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -73,13 +73,13 @@ static ssize_t max_brightness_show(struct device *dev,
>  static DEVICE_ATTR_RO(max_brightness);
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
> -static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
> -static struct attribute *led_trigger_attrs[] = {
> -	&dev_attr_trigger.attr,
> +static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
> +static struct bin_attribute *led_trigger_bin_attrs[] = {
> +	&bin_attr_trigger,
>  	NULL,
>  };
>  static const struct attribute_group led_trigger_group = {
> -	.attrs = led_trigger_attrs,
> +	.bin_attrs = led_trigger_bin_attrs,
>  };
>  #endif
>  
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 8d11a5e..ed5a311 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -16,6 +16,7 @@
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
>  #include <linux/slab.h>
> +#include <linux/mm.h>
>  #include "leds.h"
>  
>  /*
> @@ -26,9 +27,11 @@ LIST_HEAD(trigger_list);
>  
>   /* Used by LED Class */
>  
> -ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
> -		const char *buf, size_t count)
> +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> +			  struct bin_attribute *bin_attr, char *buf,
> +			  loff_t pos, size_t count)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_trigger *trig;
>  	int ret = count;
> @@ -64,39 +67,84 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>  	mutex_unlock(&led_cdev->led_access);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(led_trigger_store);
> +EXPORT_SYMBOL_GPL(led_trigger_write);
>  
> -ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
> -		char *buf)
> +__printf(4, 5)
> +static int led_trigger_snprintf(char *buf, size_t size, bool query,
> +				const char *fmt, ...)
> +{
> +	va_list args;
> +	int i;
> +
> +	va_start(args, fmt);
> +	if (query)
> +		i = vsnprintf(NULL, 0, fmt, args);
> +	else
> +		i = vscnprintf(buf, size, fmt, args);
> +	va_end(args);
> +
> +	return i;
> +}

You only call this in one place, why is it needed like this?  The "old"
code open-coded this, what is this helping with here?

And what does "query" mean here?  I have no idea how that variable
matters, or what it does.  Why not just test if buf is NULL or not if
you don't want to use it?

Ah, you are trying to see how "long" the buffer is going to be.  That
makes more sense, but just trigger off of the NULL buffer or not, making
this a bit more "obvious" what you are doing and not tieing two
parameters to each other (meaning one always reflects the other one).

> +static int led_trigger_format(char *buf, size_t size, bool query,
> +			      struct led_classdev *led_cdev)
>  {
> -	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_trigger *trig;
> -	int len = 0;
> +	int len = led_trigger_snprintf(buf, size, query, "%s",
> +				       led_cdev->trigger ? "none" : "[none]");
> +
> +	list_for_each_entry(trig, &trigger_list, next_trig) {
> +		bool hit = led_cdev->trigger &&
> +			!strcmp(led_cdev->trigger->name, trig->name);
> +
> +		len += led_trigger_snprintf(buf + len, size - len, query,
> +					    " %s%s%s", hit ? "[" : "",
> +					    trig->name, hit ? "]" : "");
> +	}
> +
> +	len += led_trigger_snprintf(buf + len, size - len, query, "\n");
> +
> +	return len;
> +}
> +
> +/*
> + * It was stupid to create 10000 cpu triggers, but we are stuck with it now.
> + * Don't make that mistake again. We work around it here by creating binary
> + * attribute, which is not limited by length. This is _not_ good design, do not
> + * copy it.
> + */
> +ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
> +			struct bin_attribute *attr, char *buf,
> +			loff_t pos, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	void *data;
> +	int len;
>  
>  	down_read(&triggers_list_lock);
>  	down_read(&led_cdev->trigger_lock);
>  
> -	if (!led_cdev->trigger)
> -		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
> +	len = led_trigger_format(NULL, 0, true, led_cdev);
> +	data = kvmalloc(len + 1, GFP_KERNEL);

Why kvmalloc() and not just kmalloc()?  How big is this buffer you are
expecting to have here?

> +	if (data)
> +		len = led_trigger_format(data, len + 1, false, led_cdev);
>  	else
> -		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
> +		len = -ENOMEM;
>  
> -	list_for_each_entry(trig, &trigger_list, next_trig) {
> -		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
> -							trig->name))
> -			len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ",
> -					 trig->name);
> -		else
> -			len += scnprintf(buf+len, PAGE_SIZE - len, "%s ",
> -					 trig->name);
> -	}
>  	up_read(&led_cdev->trigger_lock);
>  	up_read(&triggers_list_lock);

Two locks?  Why not 3?  5?  How about just 1?  :)

>  
> -	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
> +	if (len < 0)
> +		return len;

You just leaked data if led_trigger_format() returned an error :(

Just return -ENOMEM above if !data, which makes this much simpler.

thanks,

greg k-h
