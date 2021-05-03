Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF04371159
	for <lists+linux-leds@lfdr.de>; Mon,  3 May 2021 07:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbhECFy1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 01:54:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:36560 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhECFy0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 May 2021 01:54:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5D66FAF2F;
        Mon,  3 May 2021 05:53:32 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] leds: trigger: implement block trigger
To:     Enzo Matsumiya <ematsumiya@suse.de>, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org
Cc:     u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-3-ematsumiya@suse.de>
From:   Hannes Reinecke <hare@suse.de>
Message-ID: <7e8da9ec-b3e3-0329-d54c-bb44c4064f0d@suse.de>
Date:   Mon, 3 May 2021 07:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210430183216.27458-3-ematsumiya@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/30/21 8:32 PM, Enzo Matsumiya wrote:
> Usage (using capslock LED as example/test):
> 
>      openSUSE-tw:/sys/class/leds/input0::capslock # echo block > trigger
>      openSUSE-tw:/sys/class/leds/input0::capslock # cat trigger
>      none usb-gadget ... ... [block]
> 
> A single "block" trigger is created, with each non-empty block device
> being available to have its stats polled.
> 
>      openSUSE-tw:/sys/class/leds/input0::capslock # ls
>      block_devices  brightness  device  max_brightness  power  subsystem  trigger  uevent
>      openSUSE-tw:/sys/class/leds/input0::capslock # ls block_devices/
>      sda  sr0
>      openSUSE-tw:/sys/class/leds/input0::capslock # cat block_devices/sda
>      1
>      openSUSE-tw:/sys/class/leds/input0::capslock # echo 0 > block_devices/sr0
> 
> Activity is then represented in an accumulated manner (part_read_stat_accum()),
> with a fixed blinking interval of 50ms.
> 
> Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
> ---
>   drivers/leds/trigger/Kconfig         |  10 +
>   drivers/leds/trigger/Makefile        |   1 +
>   drivers/leds/trigger/ledtrig-block.c | 293 +++++++++++++++++++++++++++
>   3 files changed, 304 insertions(+)
>   create mode 100644 drivers/leds/trigger/ledtrig-block.c
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index b77a01bd27f4..bead31a19148 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -153,4 +153,14 @@ config LEDS_TRIGGER_TTY
>   
>   	  When build as a module this driver will be called ledtrig-tty.
>   
> +config LEDS_TRIGGER_BLOCK
> +	tristate "LED Block Device Trigger"
> +	depends on BLOCK
> +	default m
> +	help
> +	  This allows LEDs to be controlled by block device activity.
> +	  This trigger doesn't require the lower level drivers to have any
> +	  instrumentation. The activity is collected by polling the disk stats.
> +	  If unsure, say Y.
> +
>   endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index 25c4db97cdd4..cadc77d95802 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
>   obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
>   obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
>   obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
> +obj-$(CONFIG_LEDS_TRIGGER_BLOCK)	+= ledtrig-block.o
> diff --git a/drivers/leds/trigger/ledtrig-block.c b/drivers/leds/trigger/ledtrig-block.c
> new file mode 100644
> index 000000000000..b00dbf916876
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-block.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED block trigger
> + *
> + * Copyright (C) 2021 Enzo Matsumiya <ematsumiya@suse.de>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/genhd.h>
> +#include <linux/leds.h>
> +#include <linux/workqueue.h>
> +#include <linux/part_stat.h>
> +
> +#include "../leds.h"
> +
> +extern struct class block_class;
> +extern const struct device_type disk_type;
> +
> +struct ledtrig_blk_data {
> +	struct led_classdev *led_cdev;
> +	struct list_head block_devices;
> +};
> +
> +struct ledtrig_blk_device {
> +	struct list_head list;
> +
> +	struct ledtrig_blk_data *data;
> +
> +	struct gendisk *disk;
> +	struct device_attribute attr;
> +	struct delayed_work work;
> +	struct mutex lock;
> +	u64 last_activity;
> +	bool observed;
> +};
> +
> +/*
> + * Blink interval in msecs
> + */
> +#define BLINK_INTERVAL 50
> +
> +
> +/*
> + * Helpers
> + */
> +
> +static int _for_each_blk(void *data,
> +			  int (*fn)(void *, struct gendisk *))
> +{
> +	struct class_dev_iter iter;
> +	struct device *dev;
> +	int err;
> +
> +	/* iterate through all block devices on the system */
> +	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
> +	while ((dev = class_dev_iter_next(&iter))) {
> +	        struct gendisk *disk = dev_to_disk(dev);
> +
> +	        err = fn(data, disk);
> +
> +	        if (err) {
> +	                pr_err("error running fn() on disk %s\n", disk->disk_name);
> +	                return err;
> +	        }
> +	}
> +	class_dev_iter_exit(&iter);
> +
> +	return 0;
> +}
> +
> +
> +/*
> + * Device attr
> + */
> +
> +static ssize_t ledtrig_blk_device_show(struct device *dev,
> +				       struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_blk_device *device = container_of(attr,
> +							 struct ledtrig_blk_device,
> +							 attr);
> +	bool observed;
> +
> +	mutex_lock(&device->lock);
> +	observed = device->observed;
> +	mutex_unlock(&device->lock);
> +
> +	return sprintf(buf, "%d\n", observed) + 1;
> +}
> +
> +static ssize_t ledtrig_blk_device_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t size)
> +{
> +	struct ledtrig_blk_device *device = container_of(attr,
> +							 struct ledtrig_blk_device,
> +							 attr);
> +	int err = -EINVAL;
> +
> +	mutex_lock(&device->lock);
> +	if (!strcmp(buf, "0") || !strcmp(buf, "0\n"))
> +		device->observed = 0;
> +	else if (!strcmp(buf, "1") || !strcmp(buf, "1\n"))
> +		device->observed = 1;
> +	else
> +		goto out_unlock;
> +
> +	err = size;
> +
> +out_unlock:
> +	mutex_unlock(&device->lock);
> +
> +	return err;
> +}
> +
> +static struct attribute *devices_attrs[] = {
> +	NULL,
> +};
> +
> +static const struct attribute_group devices_group = {
> +	.name = "block_devices",
> +	.attrs = devices_attrs,
> +};
> +
> +
> +/*
> + * Work
> + */
> +
> +static void ledtrig_blk_work(struct work_struct *work)
> +{
> +	struct ledtrig_blk_device *device = container_of(work, struct ledtrig_blk_device, work.work);
> +	struct gendisk *disk;
> +	unsigned long interval = BLINK_INTERVAL;
> +	u64 activity;
> +
> +	if (!device->observed)
> +		goto out;
> +
> +	disk = device->disk;
> +	activity = part_stat_read_accum(disk->part0, ios);
> +
> +	if (device->last_activity != activity) {
> +		led_stop_software_blink(device->data->led_cdev);
> +		led_blink_set_oneshot(device->data->led_cdev, &interval, &interval, 0);
> +
> +		device->last_activity = activity;
> +	}
> +
> +out:
> +	schedule_delayed_work(&device->work, interval * 2);
> +}
> +
> +
> +/*
> + * Adding & removing block devices
> + */
> +
> +static int ledtrig_blk_add_device(void *data,
> +				  struct gendisk *disk)
> +{
> +	struct ledtrig_blk_data *led_blk_data = (struct ledtrig_blk_data *) data;
> +	struct led_classdev *led_cdev = led_blk_data->led_cdev;
> +	struct ledtrig_blk_device *device;
> +	int err;
> +
> +	device = kzalloc(sizeof(*device), GFP_KERNEL);
> +	if (!device) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +
> +	device->data = led_blk_data;
> +	device->observed = true;
> +
> +	sysfs_attr_init(&device->attr.attr);
> +	device->attr.attr.name = disk->disk_name;
> +	device->attr.attr.mode = S_IRUSR | S_IWUSR;
> +	device->attr.show = ledtrig_blk_device_show;
> +	device->attr.store = ledtrig_blk_device_store;
> +	device->disk = disk;
> +	device->last_activity = 0;
> +
> +	INIT_DELAYED_WORK(&device->work, ledtrig_blk_work);
> +	mutex_init(&device->lock);
> +
> +	list_add_tail(&device->list, &led_blk_data->block_devices);
> +
> +	err = sysfs_add_file_to_group(&led_cdev->dev->kobj, &device->attr.attr,
> +				      devices_group.name);
> +	if (err)
> +		goto err_free;
> +
> +	schedule_delayed_work(&device->work, BLINK_INTERVAL * 2);
> +
> +	return 0;
> +
> +err_free:
> +	kfree(device);
> +err_out:
> +	return err;
> +}
> +
> +static int ledtrig_blk_add_all_devices(struct ledtrig_blk_data *led_blk_data)
> +{
> +	(void)_for_each_blk(led_blk_data, ledtrig_blk_add_device);
> +
> +	return 0;
> +}
> +
> +static void ledtrig_blk_remove_device(struct ledtrig_blk_data *led_blk_data,
> +				      struct ledtrig_blk_device *device)
> +{
> +	struct led_classdev *led_cdev = led_blk_data->led_cdev;
> +
> +	list_del(&device->list);
> +	sysfs_remove_file_from_group(&led_cdev->dev->kobj, &device->attr.attr,
> +				     devices_group.name);
> +	kfree(device);
> +}
> +
> +
> +/*
> + * Init, exit, etc
> + */
> +
> +static int ledtrig_blk_activate(struct led_classdev *led_cdev)
> +{
> +	struct ledtrig_blk_data *led_blk_data;
> +	int err;
> +
> +	led_blk_data = kzalloc(sizeof(*led_blk_data), GFP_KERNEL);
> +	if (!led_blk_data)
> +		return -ENOMEM;
> +
> +	led_blk_data->led_cdev = led_cdev;
> +
> +	/* List of devices */
> +	INIT_LIST_HEAD(&led_blk_data->block_devices);
> +	err = sysfs_create_group(&led_cdev->dev->kobj, &devices_group);
> +	if (err)
> +		goto err_free;
> +
> +	ledtrig_blk_add_all_devices(led_blk_data);
> +	led_set_trigger_data(led_cdev, led_blk_data);
> +
> +	return 0;
> +
> +err_free:
> +	kfree(led_blk_data);
> +	return err;
> +}
> +
> +static void ledtrig_blk_deactivate(struct led_classdev *led_cdev)
> +{
> +	struct ledtrig_blk_data *led_blk_data = led_get_trigger_data(led_cdev);
> +	struct ledtrig_blk_device *device, *tmp;
> +
> +	list_for_each_entry_safe(device, tmp, &led_blk_data->block_devices, list) {
> +		cancel_delayed_work_sync(&device->work);
> +		ledtrig_blk_remove_device(led_blk_data, device);
> +	}
> +
> +	sysfs_remove_group(&led_cdev->dev->kobj, &devices_group);
> +
> +	kfree(led_blk_data);
> +}
> +
> +static struct led_trigger ledtrig_blk_trigger = {
> +	.name = "block",
> +	.activate = ledtrig_blk_activate,
> +	.deactivate = ledtrig_blk_deactivate,
> +};
> +
> +static int __init ledtrig_blk_init(void)
> +{
> +	return led_trigger_register(&ledtrig_blk_trigger);
> +}
> +
> +static void __exit ledtrig_blk_exit(void)
> +{
> +	led_trigger_unregister(&ledtrig_blk_trigger);
> +}
> +
> +module_init(ledtrig_blk_init);
> +module_exit(ledtrig_blk_exit);
> +
> +MODULE_AUTHOR("Enzo Matsumiya <ematsumiya@suse.de>");
> +MODULE_DESCRIPTION("LED block trigger");
> +MODULE_LICENSE("GPL v2");
> +
> 
As already commented on, this for_each_blk() construct is not a good 
idea. Infact, I guess it would be better if you could invert the logic:
Not having the block trigger enumerating all devices, but rather let the 
devices register with the block trigger.
That would have the benefit that one could choose which block device 
should be handled by the LED trigger subsystem, _and_ you would avoid 
the need for a for_each_blk() construct.
Thing is, I don't think that all block devices should be handled by the 
LED trigger; eg for things like 'loop' or 'ramdisk' it is very questionable.

Downside is that you would need to modify the drivers, but realistically 
there are only very few drivers which should be modified; I would go for 
nvme-pci and the sd driver for starters. Maybe floppy, but arguably that 
can omitted as one has a very good audio indicator for floppy accesses :-)

But apart from that: Yay! Good job!

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
