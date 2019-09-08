Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11670ACEE1
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 15:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfIHNVw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 09:21:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbfIHNVw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 8 Sep 2019 09:21:52 -0400
Received: from localhost (unknown [62.28.240.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDCE6207FC;
        Sun,  8 Sep 2019 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567948910;
        bh=TQuvU4CJKPHD0/WaGb62Q/nrduWTHKA5oS2jfnfUwgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aZVsvR2YSCIpzgI5jyjROB/uufd51p7kEfJqyI2ABQEIk5iMde/Q+Hgh325vzE9Fn
         efasxd/Sjiyh6C5Dvz/v/B3VJWE9Y3iXHhf3abeLbhhSzGFViJU6scra2C5SpGvtHW
         InFsGPx3wJ73HDxTfOZHxVG5RKHcmwEMW6txkx6o=
Date:   Sun, 8 Sep 2019 14:21:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/5] leds: add /sys/class/triggers/ that contains trigger
 sub-directories
Message-ID: <20190908132148.GA10788@kroah.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
 <1567946472-10075-5-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567946472-10075-5-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 08, 2019 at 09:41:11PM +0900, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, this violates the "one value per file" rule of sysfs.
> 
> This provides /sys/class/leds/triggers directory that contains a number of
> sub-directories, each representing an LED trigger. The name of the
> sub-directory matches the LED trigger name.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-class-led |  9 +++++++++
>  drivers/leds/led-class.c                  | 32 +++++++++++++++++++++++++++++++
>  drivers/leds/led-triggers.c               | 19 ++++++++++++++++++
>  drivers/leds/leds.h                       |  1 +
>  include/linux/leds.h                      |  1 +
>  5 files changed, 62 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 5f67f7a..14d91af 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -61,3 +61,12 @@ Description:
>  		gpio and backlight triggers. In case of the backlight trigger,
>  		it is useful when driving a LED which is intended to indicate
>  		a device in a standby like state.
> +
> +What:		/sys/class/leds/triggers/
> +Date:		September 2019
> +KernelVersion:	5.5
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		This directory contains a number of sub-directories, each
> +		representing an LED trigger. The name of the sub-directory
> +		matches the LED trigger name.
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 7d85181..04e6c14 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -81,6 +81,28 @@ static struct bin_attribute *led_trigger_bin_attrs[] = {
>  static const struct attribute_group led_trigger_group = {
>  	.bin_attrs = led_trigger_bin_attrs,
>  };
> +
> +static int led_triggers_kobj_create(void)
> +{
> +	led_triggers_kobj = class_kobject_create_and_add("triggers",
> +							 leds_class);
> +
> +	return led_triggers_kobj ? 0 : -ENOMEM;
> +}
> +
> +static void led_triggers_kobj_destroy(void)
> +{
> +	kobject_put(led_triggers_kobj);
> +}
> +
> +#else
> +static inline int led_triggers_kobj_create(void)
> +{
> +	return 0;
> +}
> +static void led_triggers_kobj_destroy(void)
> +{
> +}
>  #endif
>  
>  static struct attribute *led_class_attrs[] = {
> @@ -411,16 +433,26 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
>  
>  static int __init leds_init(void)
>  {
> +	int ret;
> +
>  	leds_class = class_create(THIS_MODULE, "leds");
>  	if (IS_ERR(leds_class))
>  		return PTR_ERR(leds_class);
>  	leds_class->pm = &leds_class_dev_pm_ops;
>  	leds_class->dev_groups = led_groups;
> +
> +	ret = led_triggers_kobj_create();
> +	if (ret) {
> +		class_unregister(leds_class);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
>  static void __exit leds_exit(void)
>  {
> +	led_triggers_kobj_destroy();
>  	class_destroy(leds_class);
>  }
>  
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index ed5a311..4a86964 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -268,16 +268,26 @@ void led_trigger_rename_static(const char *name, struct led_trigger *trig)
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_rename_static);
>  
> +static struct kobj_type led_trigger_kobj_type = {
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +struct kobject *led_triggers_kobj;
> +EXPORT_SYMBOL_GPL(led_triggers_kobj);
> +
>  /* LED Trigger Interface */
>  
>  int led_trigger_register(struct led_trigger *trig)
>  {
>  	struct led_classdev *led_cdev;
>  	struct led_trigger *_trig;
> +	int ret;
>  
>  	rwlock_init(&trig->leddev_list_lock);
>  	INIT_LIST_HEAD(&trig->led_cdevs);
>  
> +	kobject_init(&trig->kobj, &led_trigger_kobj_type);
> +
>  	down_write(&triggers_list_lock);
>  	/* Make sure the trigger's name isn't already in use */
>  	list_for_each_entry(_trig, &trigger_list, next_trig) {
> @@ -286,6 +296,14 @@ int led_trigger_register(struct led_trigger *trig)
>  			return -EEXIST;
>  		}
>  	}
> +
> +	WARN_ON_ONCE(!led_triggers_kobj);
> +	ret = kobject_add(&trig->kobj, led_triggers_kobj, "%s", trig->name);
> +	if (ret) {
> +		up_write(&triggers_list_lock);
> +		return ret;
> +	}
> +
>  	/* Add to the list of led triggers */
>  	list_add_tail(&trig->next_trig, &trigger_list);
>  	up_write(&triggers_list_lock);
> @@ -316,6 +334,7 @@ void led_trigger_unregister(struct led_trigger *trig)
>  
>  	/* Remove from the list of led triggers */
>  	down_write(&triggers_list_lock);
> +	kobject_put(&trig->kobj);
>  	list_del_init(&trig->next_trig);
>  	up_write(&triggers_list_lock);
>  
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index a0ee33c..52debe0 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -33,5 +33,6 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  extern struct rw_semaphore leds_list_lock;
>  extern struct list_head leds_list;
>  extern struct list_head trigger_list;
> +extern struct kobject *led_triggers_kobj;
>  
>  #endif	/* __LEDS_H_INCLUDED */
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 33ae825..379f282 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -279,6 +279,7 @@ struct led_trigger {
>  	struct list_head  next_trig;
>  
>  	const struct attribute_group **groups;
> +	struct kobject kobj;

No, don't do this.  Do not put "raw" kobjects in the device tree below a
"normal" directory, it's only going to cause massive problems for
userspace tools to be notified of the attributes.

If you want to make led_triggers "real" devices, great, do that!  But
this hybrid "not quite real" is not going to work out well at all in the
end.

Make this a 'struct device' and you will be fine.  That is probably the
simplest of all.  Now if you want to lump them below the leds class or
not is up to you, personally, I'd make it a new one as the structure is
different and this makes it more obvious, but it is up to you as you
know best how userspace is going to interact with these.

thanks,

greg k-h
