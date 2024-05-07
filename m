Return-Path: <linux-leds+bounces-1624-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED18BDDDF
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 11:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB201F219B0
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 09:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A021F13D52C;
	Tue,  7 May 2024 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZSU0Hz7g"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C9D10E3
	for <linux-leds@vger.kernel.org>; Tue,  7 May 2024 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715073372; cv=none; b=TrnJyUFUVwfkBu+Z+Mauumq5n/pKyFCogMAaCBDFS8ati2Kc1s0sZLOXMcndHRsr969do2zRq0b6cArrK0xZE4n7fuydAvIo5P4yfst3Aoi/45J0KR2kZxb7K6KNwmnIdlHdYbRCFWpFr4BSSVYAI5diO1tdOykO+FPCHsxAXZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715073372; c=relaxed/simple;
	bh=sDdfBk2XWvwSaAakbSaZ5OuZJl625/v7VOW0dqQgMIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGETQEdI8PDxrUtYCk9vOzgbt7GK9FEOYCXQ2L2NoJXfig+ndFN72k55GcDyVN26uA1kdYX6/siGy4MPnuGL1s4LQUgokI812x7Dc1guyV0pE40PJLl4o2JudsGic3yqL3ebgK3H2uS9Cr3mnv/DpIpPz/HqKJQ+mHxzGDU5a54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZSU0Hz7g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715073369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU5nB4dEC44CUcfDS6M5+9iGX3shTmz8DavXNr2LlXc=;
	b=ZSU0Hz7g4Tc238zpBjRmBWMLpbNsdViYB80K38Gm6pe4nhx/FI067wVK4xu5mu7zlbd9bO
	4iioQavesgKA3bHEx9GQwgyv7X8iujf244vQ6L1uyob8voWtYmt140/TPqQg9+Yov9gKfE
	BfAuHG4Ouaa9KMrO+sJC9sgtlU0ZIg8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-dN_2vhxbP8evIRYSZY0Hrg-1; Tue, 07 May 2024 05:16:08 -0400
X-MC-Unique: dN_2vhxbP8evIRYSZY0Hrg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-51f0d924685so2789802e87.0
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2024 02:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715073366; x=1715678166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iU5nB4dEC44CUcfDS6M5+9iGX3shTmz8DavXNr2LlXc=;
        b=ohiC7XHnZqPXS961dhaNxR5/Sm8/l6wltzvedzAEbCyAv6I2kMoKcnJbXQpPJw7ozW
         SQwicAsdJJCq72izC/nZ/S6yMUCIsLVWIOZKHiaeH1IljbQWHalMnyLoUmPnP3//x1SF
         CfzceTntnNUeu8p47Sa4PcwsCHPGZIoAWEreXU9+7nY/IhmHCze7+11/gEE57438K0Hc
         RbMQzEjHI4xBIFo7mzO+QRXPFBNpEnj4KjTWRH/yqP8+sw7MYnd6EJXOsdyIQFz2lpJx
         1+/1dvKbNCfmdRStYIxe5lLDLkN3A7jSUSuH/tYGnUOG1lwgN76d3tlgpPHWSJ9jC3gf
         LvOg==
X-Forwarded-Encrypted: i=1; AJvYcCWW1WEIWxJfFiKwuRS+h4LXQrqKR0d7hs6khZGQMe5K8gxAd0Q0lX3dLZe4MoAx90RB6l0pnUllV39Obp+hZWIFwj/YU7DcsPWCWA==
X-Gm-Message-State: AOJu0YwQVMHej13B5QhFaFsyK7P4d+fbfSSXmW2tB3nwzV33HruY9fV6
	CoL70O9y7aOo1h6BqwRGwjdn+bwK7/3+zaxGKmo1SSJzwYqsP/Zh/n89iGxCHVU7ohoAsKpKvyV
	M2qQhpTqnI1DjjlDFVBUGx7r6DuWL0+fhQPSk2HxH6IFRL/+XlnMIh2/YbVE=
X-Received: by 2002:a05:6512:3e0e:b0:516:c44a:657d with SMTP id i14-20020a0565123e0e00b00516c44a657dmr11257564lfv.64.1715073366499;
        Tue, 07 May 2024 02:16:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqy3gpNDllqjkX40+XPAHL01MwuV90jTAgGtGFxgxDCRpiYGNp06GMxuobqkQCGeYq9d7S+w==
X-Received: by 2002:a05:6512:3e0e:b0:516:c44a:657d with SMTP id i14-20020a0565123e0e00b00516c44a657dmr11257535lfv.64.1715073365984;
        Tue, 07 May 2024 02:16:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g13-20020a1709063b0d00b00a59a17eb5d2sm4386911ejf.222.2024.05.07.02.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 02:16:05 -0700 (PDT)
Message-ID: <5261419e-d788-4a38-86e6-d7094fa1a242@redhat.com>
Date: Tue, 7 May 2024 11:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] leds: trigger: Add new LED Input events trigger
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, linux-leds@vger.kernel.org
References: <20240505123240.14955-1-hdegoede@redhat.com>
 <20240505123240.14955-2-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240505123240.14955-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 5/5/24 2:32 PM, Hans de Goede wrote:
> Add a new trigger which turns LEDs on when there is input
> (/dev/input/event*) activity and turns them back off again after there has
> been no activity for 5 seconds.
> 
> This is primarily intended to control LED devices which are a backlight for
> capacitive touch-buttons, such as e.g. the menu / home / back buttons found
> on the bottom bezel of many somewhat older smartphones and tablets.
> 
> This can also be used to turn on the keyboard backlight LED on input
> events and turn the keyboard backlight off again when idle.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Self-nack for this patch. I still believe the basic idea of having such
a trigger is good. But the way how this implementation uses
the trigger->led_cdevs list is racy and that list is better left as
a private implementation detail of drivers/leds/led-trigger.c and not
used directly by triggers.

So I'm going to rework this for v2 so that it no longer loops over
trigger->led_cdevs list.

Regards,

Hans




> ---
>  drivers/leds/trigger/Kconfig                |  16 ++
>  drivers/leds/trigger/Makefile               |   1 +
>  drivers/leds/trigger/ledtrig-input-events.c | 252 ++++++++++++++++++++
>  3 files changed, 269 insertions(+)
>  create mode 100644 drivers/leds/trigger/ledtrig-input-events.c
> 
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index d11d80176fc0..809ffba0cd6a 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -152,4 +152,20 @@ config LEDS_TRIGGER_TTY
>  
>  	  When build as a module this driver will be called ledtrig-tty.
>  
> +config LEDS_TRIGGER_INPUT_EVENTS
> +	tristate "LED Input events trigger"
> +	depends on INPUT
> +	help
> +	  Turn LEDs on when there is input (/dev/input/event*) activity and turn
> +	  them back off again after there has been no activity for 5 seconds.
> +
> +	  This is primarily intended to control LEDs which are a backlight for
> +	  capacitive touch-buttons, such as e.g. the menu / home / back buttons
> +	  found on the bottom bezel of many older smartphones and tablets.
> +
> +	  This can also be used to turn on the keyboard backlight LED on
> +	  input events and turn the keyboard backlight off again when idle.
> +
> +	  When build as a module this driver will be called ledtrig-input-events.
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index 25c4db97cdd4..f78a3077efc7 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
>  obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
>  obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
>  obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
> +obj-$(CONFIG_LEDS_TRIGGER_INPUT_EVENTS)	+= ledtrig-input-events.o
> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
> new file mode 100644
> index 000000000000..cb86d1afeab4
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Input Events LED trigger
> + *
> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
> + * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
> + */
> +
> +#include <linux/input.h>
> +#include <linux/jiffies.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +#include "../leds.h"
> +
> +#define DEFAULT_LED_OFF_DELAY_MS			5000
> +
> +struct input_events_data {
> +	struct delayed_work work;
> +	spinlock_t lock;
> +	struct led_classdev *led_cdev;
> +	int led_cdev_saved_flags;
> +	/* To avoid repeatedly setting the brightness while there is events */
> +	bool led_on;
> +	unsigned long led_off_time;
> +	unsigned long led_off_delay;
> +};
> +
> +static void led_input_events_work(struct work_struct *work)
> +{
> +	struct input_events_data *data =
> +		container_of(work, struct input_events_data, work.work);
> +
> +	spin_lock_irq(&data->lock);
> +
> +	/*
> +	 * This time_after_eq() check avoids a race where this work starts
> +	 * running before a new event pushed led_off_time back.
> +	 */
> +	if (time_after_eq(jiffies, data->led_off_time)) {
> +		led_set_brightness_nosleep(data->led_cdev, LED_OFF);
> +		data->led_on = false;
> +	}
> +
> +	spin_unlock_irq(&data->lock);
> +}
> +
> +static ssize_t delay_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%lu\n", input_events_data->led_off_delay);
> +}
> +
> +static ssize_t delay_store(struct device *dev, struct device_attribute *attr,
> +			   const char *buf, size_t size)
> +{
> +	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
> +	unsigned long delay;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &delay);
> +	if (ret)
> +		return ret;
> +
> +	/* Clamp between 0.5 and 1000 seconds */
> +	delay = clamp_val(delay, 500UL, 1000000UL);
> +	input_events_data->led_off_delay = msecs_to_jiffies(delay);
> +
> +	return size;
> +}
> +
> +static DEVICE_ATTR_RW(delay);
> +
> +static struct attribute *input_events_led_attrs[] = {
> +	&dev_attr_delay.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(input_events_led);
> +
> +static int input_events_activate(struct led_classdev *led_cdev)
> +{
> +	struct input_events_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	INIT_DELAYED_WORK(&data->work, led_input_events_work);
> +	spin_lock_init(&data->lock);
> +	data->led_cdev = led_cdev;
> +	data->led_cdev_saved_flags = led_cdev->flags;
> +	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
> +
> +	led_set_trigger_data(led_cdev, data);
> +
> +	/*
> +	 * Use led_cdev->blink_brightness + LED_BLINK_SW flag so that sysfs
> +	 * brightness writes will change led_cdev->new_blink_brightness for
> +	 * configuring the on state brightness (like ledtrig-heartbeat).
> +	 */
> +	if (!led_cdev->blink_brightness)
> +		led_cdev->blink_brightness = led_cdev->max_brightness;
> +
> +	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
> +	/* Turn LED off during suspend, original flags are restored on deactivate() */
> +	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
> +
> +	/* Start with LED off */
> +	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
> +	return 0;
> +}
> +
> +static void input_events_deactivate(struct led_classdev *led_cdev)
> +{
> +	struct input_events_data *data = led_get_trigger_data(led_cdev);
> +
> +	led_cdev->flags = data->led_cdev_saved_flags;
> +	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
> +	cancel_delayed_work_sync(&data->work);
> +	kfree(data);
> +}
> +
> +static struct led_trigger input_events_led_trigger = {
> +	.name       = "input-events",
> +	.activate   = input_events_activate,
> +	.deactivate = input_events_deactivate,
> +	.groups     = input_events_led_groups,
> +};
> +
> +static void input_events_event(struct input_handle *handle, unsigned int type,
> +			       unsigned int code, int data)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(led_cdev, &input_events_led_trigger.led_cdevs, trig_list) {
> +		struct input_events_data *data = led_get_trigger_data(led_cdev);
> +		unsigned long led_off_delay = READ_ONCE(data->led_off_delay);
> +		unsigned long flags;
> +
> +		if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
> +			led_cdev->blink_brightness = led_cdev->new_blink_brightness;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +
> +		if (!data->led_on) {
> +			led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
> +			data->led_on = true;
> +		}
> +		data->led_off_time = jiffies + led_off_delay;
> +
> +		spin_unlock_irqrestore(&data->lock, flags);
> +
> +		mod_delayed_work(system_wq, &data->work, led_off_delay);
> +	}
> +	rcu_read_unlock();
> +}
> +
> +static int input_events_connect(struct input_handler *handler, struct input_dev *dev,
> +				const struct input_device_id *id)
> +{
> +	struct input_handle *handle;
> +	int ret;
> +
> +	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
> +	if (!handle)
> +		return -ENOMEM;
> +
> +	handle->dev = dev;
> +	handle->handler = handler;
> +	handle->name = "input-events";
> +
> +	ret = input_register_handle(handle);
> +	if (ret)
> +		goto err_free_handle;
> +
> +	ret = input_open_device(handle);
> +	if (ret)
> +		goto err_unregister_handle;
> +
> +	return 0;
> +
> +err_unregister_handle:
> +	input_unregister_handle(handle);
> +err_free_handle:
> +	kfree(handle);
> +	return ret;
> +}
> +
> +static void input_events_disconnect(struct input_handle *handle)
> +{
> +	input_close_device(handle);
> +	input_unregister_handle(handle);
> +	kfree(handle);
> +}
> +
> +static const struct input_device_id input_events_ids[] = {
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> +		.evbit = { BIT_MASK(EV_KEY) },
> +	},
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> +		.evbit = { BIT_MASK(EV_REL) },
> +	},
> +	{
> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
> +		.evbit = { BIT_MASK(EV_ABS) },
> +	},
> +	{ }
> +};
> +
> +static struct input_handler input_events_handler = {
> +	.name =	"input-events",
> +	.event = input_events_event,
> +	.connect = input_events_connect,
> +	.disconnect = input_events_disconnect,
> +	.id_table = input_events_ids,
> +};
> +
> +static int __init input_events_init(void)
> +{
> +	int ret;
> +
> +	ret = led_trigger_register(&input_events_led_trigger);
> +	if (ret)
> +		return ret;
> +
> +	ret = input_register_handler(&input_events_handler);
> +	if (ret) {
> +		led_trigger_unregister(&input_events_led_trigger);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit input_events_exit(void)
> +{
> +	input_unregister_handler(&input_events_handler);
> +	led_trigger_unregister(&input_events_led_trigger);
> +}
> +
> +module_init(input_events_init);
> +module_exit(input_events_exit);
> +
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> +MODULE_DESCRIPTION("Input Events LED trigger");
> +MODULE_LICENSE("GPL");


