Return-Path: <linux-leds+bounces-1747-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E388D61ED
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 999241C247D6
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D53158847;
	Fri, 31 May 2024 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEwSf3aA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87B1F95A
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158991; cv=none; b=YsgdtmKeF4dJvmjKxUS2JtEBHA38SaAqD5bWlEm81Aq3roFrVT16f4oRpErOzXliARS6a6Qrm/SwxeJ+InIRb6lJ5htDQ6YTccmMaN5AeiG/crH6z0j1HRMSaXXh0Ut8Cg0JbBCBkCjr3I93HP9BqnY0xhtRluUZJ5gMbB7Oo1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158991; c=relaxed/simple;
	bh=7fId81CK7A41mzt/jYV1ZkNRwyKgvJv8XnEx3INupgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uv5zYUhgqQ52UfIRQvBZ9/rralGeCpSImbGueK9/Xv19hp8PRnJNAydkRyb+xWEi+Ic/Vxx/uMFwSuTDeVrk6Pw9KWFzK2R65vktgBtcjNTZXX3osbiOsjPn4iqvpo37Zcwk8nzUhC7aRuJfN+eit2uDwbO3F97busxC+bzP9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEwSf3aA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD286C116B1;
	Fri, 31 May 2024 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717158990;
	bh=7fId81CK7A41mzt/jYV1ZkNRwyKgvJv8XnEx3INupgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEwSf3aA0fpKk0jZUgnY+agWl/qQZSFah0hj7KhC2ldFIyXaVFO9JlUjLGgLHaJAh
	 WCC8feeEx7ddqN713woM6uOQMWWkhvr8j+hKtc4mbStUkhgAP87p8vKB4ZZy0hUuww
	 GZmje2JJT+lRpGWG4T5/ha4udnou/rmfqKCe8HOfvjBM5aplIFushM63cznPdvuOrW
	 m+51Gb5SBJWOMxw6CFxwDh18MrHzqV8R8m+vMABUCHHAxtgsnC1xLEitARZ7pYlWaX
	 PLkXMenb7MQiPSFWrlPz92GsdV5k1qRXVEsmpAmkJqfAqmr11sZ5a0HwYDkKKB73pi
	 TxkmALgIVWNRw==
Date: Fri, 31 May 2024 13:36:27 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/1] leds: trigger: Add new LED Input events trigger
Message-ID: <20240531123627.GH1005600@google.com>
References: <20240509141107.63512-1-hdegoede@redhat.com>
 <20240509141107.63512-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509141107.63512-2-hdegoede@redhat.com>

On Thu, 09 May 2024, Hans de Goede wrote:

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
> ---
> Changes in v2:
> - Add MODULE_ALIAS() for module auto-loading
> - Stop using the led-trigger.c private trigger->led_cdevs list
> ---
>  drivers/leds/trigger/Kconfig                |  16 ++
>  drivers/leds/trigger/Makefile               |   1 +
>  drivers/leds/trigger/ledtrig-input-events.c | 233 ++++++++++++++++++++
>  3 files changed, 250 insertions(+)
>  create mode 100644 drivers/leds/trigger/ledtrig-input-events.c

Looks good to me.  Just one tiny nit, then it'll be good to go.

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
> index 000000000000..f076476bbb77
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
> @@ -0,0 +1,233 @@
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
> +	struct input_handler handler;
> +	struct delayed_work work;
> +	spinlock_t lock;
> +	struct led_classdev *led_cdev;
> +	int led_cdev_saved_flags;
> +	/* To avoid repeatedly setting the brightness while there are events */
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
> +static void input_events_event(struct input_handle *handle, unsigned int type,
> +			       unsigned int code, int val)
> +{
> +	struct input_events_data *data =
> +		container_of(handle->handler, struct input_events_data, handler);
> +	unsigned long led_off_delay = READ_ONCE(data->led_off_delay);
> +	struct led_classdev *led_cdev = data->led_cdev;
> +	unsigned long flags;
> +
> +	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
> +		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	if (!data->led_on) {
> +		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
> +		data->led_on = true;
> +	}
> +	data->led_off_time = jiffies + led_off_delay;
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	mod_delayed_work(system_wq, &data->work, led_off_delay);
> +}
> +
> +static int input_events_connect(struct input_handler *handler, struct input_dev *dev,
> +				const struct input_device_id *id)
> +{
> +	struct input_handle *handle;
> +	int ret;
> +
> +	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);

Nit: sizeof(*handle)?

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
> +static int input_events_activate(struct led_classdev *led_cdev)
> +{
> +	struct input_events_data *data;
> +	int ret;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->handler.name = "input-events";
> +	data->handler.event = input_events_event;
> +	data->handler.connect = input_events_connect;
> +	data->handler.disconnect = input_events_disconnect;
> +	data->handler.id_table = input_events_ids;
> +
> +	INIT_DELAYED_WORK(&data->work, led_input_events_work);
> +	spin_lock_init(&data->lock);
> +
> +	data->led_cdev = led_cdev;
> +	data->led_cdev_saved_flags = led_cdev->flags;
> +	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
> +
> +	/*
> +	 * Use led_cdev->blink_brightness + LED_BLINK_SW flag so that sysfs
> +	 * brightness writes will change led_cdev->new_blink_brightness for
> +	 * configuring the on state brightness (like ledtrig-heartbeat).
> +	 */
> +	if (!led_cdev->blink_brightness)
> +		led_cdev->blink_brightness = led_cdev->max_brightness;
> +
> +	/* Start with LED off */
> +	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
> +
> +	ret = input_register_handler(&data->handler);
> +	if (ret) {
> +		kfree(data);
> +		return ret;
> +	}
> +
> +	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
> +
> +	/* Turn LED off during suspend, original flags are restored on deactivate() */
> +	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
> +
> +	led_set_trigger_data(led_cdev, data);
> +	return 0;
> +}
> +
> +static void input_events_deactivate(struct led_classdev *led_cdev)
> +{
> +	struct input_events_data *data = led_get_trigger_data(led_cdev);
> +
> +	led_cdev->flags = data->led_cdev_saved_flags;
> +	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
> +	input_unregister_handler(&data->handler);
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
> +module_led_trigger(input_events_led_trigger);
> +
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> +MODULE_DESCRIPTION("Input Events LED trigger");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("ledtrig:input-events");
> -- 
> 2.44.0
> 

-- 
Lee Jones [李琼斯]

