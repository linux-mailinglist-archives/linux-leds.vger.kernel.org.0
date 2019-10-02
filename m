Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2FDC8CE9
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfJBPa0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:30:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:39004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfJBPa0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 2 Oct 2019 11:30:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96E8E21A4C;
        Wed,  2 Oct 2019 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570030223;
        bh=s0Z0BD8S/+85IH85cLLnC9zo42Wcl0+eeRx2SA7ru30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1mFGB2qFK1CdZPpL/0S3pREGphuWKXj1mQHMz57bz5AaJ3wqlHLedkJSoHLpgZG+f
         3iHKz3Lc6ucpflblaZsrt2iJZpmR1tKDI2AyKdwAdLww2SORKTu0LbTPTA0najnG7x
         8YzIi467cFcBBnubdHlxSQBwyGYkBt/RoY4roXBg=
Date:   Wed, 2 Oct 2019 17:30:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH -next 2/2] leds: add /sys/class/leds/<led>/current-trigger
Message-ID: <20191002153020.GD1748000@kroah.com>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
 <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Oct 03, 2019 at 12:13:01AM +0900, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, this violates the "one value per file" rule of sysfs.
> 
> This provides /sys/class/leds/<led>/current-trigger which is almost
> identical to /sys/class/leds/<led>/trigger.  The only difference is that
> 'current-trigger' only shows the current trigger name.
> 
> This new file follows the "one value per file" rule of sysfs.
> We can find all available LED triggers by listing the
> /sys/devices/virtual/led-trigger/ directory.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
>  drivers/leds/led-class.c                  | 10 ++++++++
>  drivers/leds/led-triggers.c               | 38 +++++++++++++++++++++++++++----
>  drivers/leds/leds.h                       |  5 ++++
>  4 files changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 5f67f7a..fdfed3f 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -61,3 +61,16 @@ Description:
>  		gpio and backlight triggers. In case of the backlight trigger,
>  		it is useful when driving a LED which is intended to indicate
>  		a device in a standby like state.
> +
> +What:		/sys/class/leds/<led>/current-trigger
> +Date:		September 2019
> +KernelVersion:	5.5
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Set the trigger for this LED. A trigger is a kernel based source
> +		of LED events.
> +		Writing the trigger name to this file will change the current
> +		trigger. Trigger specific parameters can appear in
> +		/sys/class/leds/<led> once a given trigger is selected. For
> +		their documentation see sysfs-class-led-trigger-*.
> +		Reading this file will return the current LED trigger name.
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 3f04334..3cb0d8a 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -74,12 +74,22 @@ static ssize_t max_brightness_show(struct device *dev,
>  static DEVICE_ATTR_RO(max_brightness);
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
> +
> +static DEVICE_ATTR(current_trigger, 0644, led_current_trigger_show,
> +		   led_current_trigger_store);

DEVICE_ATTR_RW() please.

> +static struct attribute *led_current_trigger_attrs[] = {
> +	&dev_attr_current_trigger.attr,
> +	NULL,
> +};
> +
>  static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
>  static struct bin_attribute *led_trigger_bin_attrs[] = {
>  	&bin_attr_trigger,
>  	NULL,
>  };
>  static const struct attribute_group led_trigger_group = {
> +	.attrs = led_current_trigger_attrs,
>  	.bin_attrs = led_trigger_bin_attrs,
>  };
>  #endif
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 0b810cf..a2ef674 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -27,11 +27,9 @@ LIST_HEAD(trigger_list);
>  
>   /* Used by LED Class */
>  
> -ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> -			  struct bin_attribute *bin_attr, char *buf,
> -			  loff_t pos, size_t count)
> +static ssize_t led_trigger_store(struct device *dev, const char *buf,
> +				 size_t count)
>  {
> -	struct device *dev = kobj_to_dev(kobj);
>  	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_trigger *trig;
>  	int ret = count;
> @@ -67,8 +65,25 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  	mutex_unlock(&led_cdev->led_access);
>  	return ret;
>  }
> +
> +ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
> +			  struct bin_attribute *bin_attr, char *buf,
> +			  loff_t pos, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +
> +	return led_trigger_store(dev, buf, count);
> +}
>  EXPORT_SYMBOL_GPL(led_trigger_write);
>  
> +ssize_t led_current_trigger_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	return led_trigger_store(dev, buf, count);
> +}
> +EXPORT_SYMBOL_GPL(led_current_trigger_store);
> +
>  __printf(3, 4)
>  static int led_trigger_snprintf(char *buf, ssize_t size, const char *fmt, ...)
>  {
> @@ -144,6 +159,21 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_read);
>  
> +ssize_t led_current_trigger_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	int len;
> +
> +	down_read(&led_cdev->trigger_lock);
> +	len = scnprintf(buf, PAGE_SIZE, "%s\n", led_cdev->trigger ?

No need for "scnprintf() when writing a single number to a buffer.  Just
use sprintf() please.

> +			led_cdev->trigger->name : "none");

Can you have a trigger named "none"? :)

thanks,

greg k-h
