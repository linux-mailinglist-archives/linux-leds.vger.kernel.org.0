Return-Path: <linux-leds+bounces-1764-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F48D63D0
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E6AC1C21E4A
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FB615B0E6;
	Fri, 31 May 2024 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MA6lvIUS"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779A115AACD
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163618; cv=none; b=GfCIYHQr1mpQxXfWfdY2uy3lnBRN8Of/G5XOEpw6dlccuzGPRlWEQp2FJJN/SWBLLVZ74EjvdkzBVXs/8ZFYbLev3JaPfFW59eStYhj7XgOcU0kFMZi52x0i67ch8S7xjBK9CTOG7WHEtr5abIvfFUs6Hu0SFpdUI1Ak9wJ1Pz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163618; c=relaxed/simple;
	bh=JF/Xfpa831EhYdq8LDaMaZxF6gUO0NTAJAdcxTbwEqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYBoogjacxZS/hj0mP7U3sHGQK+petpewGUgO0O76bUykvfnPAouX6yqc9F4lzoHL8ttQHkW9D8BSDZNatO5Zhmhz6O0VLfaPmOUVLcyk6pAQjxMEHNLP6AO3nO4ER8GqqsOtSddw37inSOSzywPpCoW/yEEuni+uVmS6FvO/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MA6lvIUS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717163615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLkD1mNWPeatCuIyGo46IhqziqbMUME6mn6lWc87NNM=;
	b=MA6lvIUSA5u3Ozsx932cKpY+bns2V0Ye8saxBY80fInEgc5duwbcKQGftJNfRRYlQc5avp
	dgCl5Q0HLxQfwnwCdiSbuTGGQJL5PykANfBMu3wW56vSlhw3JMXVzxkN1uJ6BD1PcGX07H
	7THIdNUDYBMLyX91a4yJmzebERwkF7M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-UVJgvVgrPHe_o-6Kan9eRg-1; Fri, 31 May 2024 09:53:34 -0400
X-MC-Unique: UVJgvVgrPHe_o-6Kan9eRg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a688f6df640so22388166b.1
        for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 06:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163612; x=1717768412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLkD1mNWPeatCuIyGo46IhqziqbMUME6mn6lWc87NNM=;
        b=S5RRt2s5QNvOlhr8AVDokRYEQkJjaEL3ZlmwnYd/fFq1ER5omMZ+EXNrFSnHVI1IUl
         f2eX1y1IEAQcIXK9wQUwSeGRasTGjv5gT0pWGIQFJtyGJmiSQARyNYPhqEa5G7Fxm1MZ
         eRY0OAn8FUbPlmA0aMtyEuU3mPuJ/3zXQKptm1UEHJe7jD9frhJUZRECKJ0UHJ5YMDAi
         QBu4l40yxv4q2hqfb9Cf7LAOEfLDsbD0UWr4sgzYhdj4y04ZK9b25F6MGRyUlLwbp8xM
         cOpckuSEDzU55pMQhdPTSx/2aGduu1W21o74wqe1K5Yz7r3cUxAQAAPZCzzXoUnfxFUR
         Q3jg==
X-Forwarded-Encrypted: i=1; AJvYcCW/VeA6OkpTT93HVLaqMSO97dZeX9rXuRpzAAcMT/SRDuD3KnuclPF8EmW4+LHQ7rUY7kXzChcIEicCUWlqgjK17+DI2Q89wfAIyg==
X-Gm-Message-State: AOJu0YwVxZuliSnIFXtzHamdJBSdvRtEVhMyNEXR1X77BPS0cq2Z9RWk
	MExi0SZNWZCCgUxZhS3Sc7IKrTblFgasS/YByKGFsGDR2Vu+C2y7gxvM8WwyxPJZssy8FaEkYdE
	IcR7o2q1CRHAOUY6CuuaHU4jZo5hYe0zQsVMAPp8IeycgThoHw09brlzq4Ow=
X-Received: by 2002:a17:906:6a15:b0:a59:cd00:dafb with SMTP id a640c23a62f3a-a6822445ccbmr161404366b.64.1717163612649;
        Fri, 31 May 2024 06:53:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvW2BqjiyC7Bkaqx8i3Q7hrlGwQSmSR/89KVvPoUv105vUXuNobwJ0tLRwPEK7mYeesaGcmw==
X-Received: by 2002:a17:906:6a15:b0:a59:cd00:dafb with SMTP id a640c23a62f3a-a6822445ccbmr161402866b.64.1717163612070;
        Fri, 31 May 2024 06:53:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85c20sm88561666b.152.2024.05.31.06.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 06:53:31 -0700 (PDT)
Message-ID: <e0fb2573-f035-4de4-9dcb-d3d57e5eb298@redhat.com>
Date: Fri, 31 May 2024 15:53:30 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] leds: trigger: Add new LED Input events trigger
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Kate Hsuan <hpa@redhat.com>,
 linux-leds@vger.kernel.org
References: <20240509141107.63512-1-hdegoede@redhat.com>
 <20240509141107.63512-2-hdegoede@redhat.com>
 <20240531123627.GH1005600@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240531123627.GH1005600@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 2:36 PM, Lee Jones wrote:
> On Thu, 09 May 2024, Hans de Goede wrote:
> 
>> Add a new trigger which turns LEDs on when there is input
>> (/dev/input/event*) activity and turns them back off again after there has
>> been no activity for 5 seconds.
>>
>> This is primarily intended to control LED devices which are a backlight for
>> capacitive touch-buttons, such as e.g. the menu / home / back buttons found
>> on the bottom bezel of many somewhat older smartphones and tablets.
>>
>> This can also be used to turn on the keyboard backlight LED on input
>> events and turn the keyboard backlight off again when idle.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Add MODULE_ALIAS() for module auto-loading
>> - Stop using the led-trigger.c private trigger->led_cdevs list
>> ---
>>  drivers/leds/trigger/Kconfig                |  16 ++
>>  drivers/leds/trigger/Makefile               |   1 +
>>  drivers/leds/trigger/ledtrig-input-events.c | 233 ++++++++++++++++++++
>>  3 files changed, 250 insertions(+)
>>  create mode 100644 drivers/leds/trigger/ledtrig-input-events.c
> 
> Looks good to me.  Just one tiny nit, then it'll be good to go.
> 
>> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
>> index d11d80176fc0..809ffba0cd6a 100644
>> --- a/drivers/leds/trigger/Kconfig
>> +++ b/drivers/leds/trigger/Kconfig
>> @@ -152,4 +152,20 @@ config LEDS_TRIGGER_TTY
>>  
>>  	  When build as a module this driver will be called ledtrig-tty.
>>  
>> +config LEDS_TRIGGER_INPUT_EVENTS
>> +	tristate "LED Input events trigger"
>> +	depends on INPUT
>> +	help
>> +	  Turn LEDs on when there is input (/dev/input/event*) activity and turn
>> +	  them back off again after there has been no activity for 5 seconds.
>> +
>> +	  This is primarily intended to control LEDs which are a backlight for
>> +	  capacitive touch-buttons, such as e.g. the menu / home / back buttons
>> +	  found on the bottom bezel of many older smartphones and tablets.
>> +
>> +	  This can also be used to turn on the keyboard backlight LED on
>> +	  input events and turn the keyboard backlight off again when idle.
>> +
>> +	  When build as a module this driver will be called ledtrig-input-events.
>> +
>>  endif # LEDS_TRIGGERS
>> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
>> index 25c4db97cdd4..f78a3077efc7 100644
>> --- a/drivers/leds/trigger/Makefile
>> +++ b/drivers/leds/trigger/Makefile
>> @@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
>>  obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
>>  obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
>>  obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
>> +obj-$(CONFIG_LEDS_TRIGGER_INPUT_EVENTS)	+= ledtrig-input-events.o
>> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
>> new file mode 100644
>> index 000000000000..f076476bbb77
>> --- /dev/null
>> +++ b/drivers/leds/trigger/ledtrig-input-events.c
>> @@ -0,0 +1,233 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Input Events LED trigger
>> + *
>> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
>> + * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
>> + */
>> +
>> +#include <linux/input.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>> +#include "../leds.h"
>> +
>> +#define DEFAULT_LED_OFF_DELAY_MS			5000
>> +
>> +struct input_events_data {
>> +	struct input_handler handler;
>> +	struct delayed_work work;
>> +	spinlock_t lock;
>> +	struct led_classdev *led_cdev;
>> +	int led_cdev_saved_flags;
>> +	/* To avoid repeatedly setting the brightness while there are events */
>> +	bool led_on;
>> +	unsigned long led_off_time;
>> +	unsigned long led_off_delay;
>> +};
>> +
>> +static void led_input_events_work(struct work_struct *work)
>> +{
>> +	struct input_events_data *data =
>> +		container_of(work, struct input_events_data, work.work);
>> +
>> +	spin_lock_irq(&data->lock);
>> +
>> +	/*
>> +	 * This time_after_eq() check avoids a race where this work starts
>> +	 * running before a new event pushed led_off_time back.
>> +	 */
>> +	if (time_after_eq(jiffies, data->led_off_time)) {
>> +		led_set_brightness_nosleep(data->led_cdev, LED_OFF);
>> +		data->led_on = false;
>> +	}
>> +
>> +	spin_unlock_irq(&data->lock);
>> +}
>> +
>> +static ssize_t delay_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%lu\n", input_events_data->led_off_delay);
>> +}
>> +
>> +static ssize_t delay_store(struct device *dev, struct device_attribute *attr,
>> +			   const char *buf, size_t size)
>> +{
>> +	struct input_events_data *input_events_data = led_trigger_get_drvdata(dev);
>> +	unsigned long delay;
>> +	int ret;
>> +
>> +	ret = kstrtoul(buf, 0, &delay);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Clamp between 0.5 and 1000 seconds */
>> +	delay = clamp_val(delay, 500UL, 1000000UL);
>> +	input_events_data->led_off_delay = msecs_to_jiffies(delay);
>> +
>> +	return size;
>> +}
>> +
>> +static DEVICE_ATTR_RW(delay);
>> +
>> +static struct attribute *input_events_led_attrs[] = {
>> +	&dev_attr_delay.attr,
>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(input_events_led);
>> +
>> +static void input_events_event(struct input_handle *handle, unsigned int type,
>> +			       unsigned int code, int val)
>> +{
>> +	struct input_events_data *data =
>> +		container_of(handle->handler, struct input_events_data, handler);
>> +	unsigned long led_off_delay = READ_ONCE(data->led_off_delay);
>> +	struct led_classdev *led_cdev = data->led_cdev;
>> +	unsigned long flags;
>> +
>> +	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
>> +		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
>> +
>> +	spin_lock_irqsave(&data->lock, flags);
>> +
>> +	if (!data->led_on) {
>> +		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
>> +		data->led_on = true;
>> +	}
>> +	data->led_off_time = jiffies + led_off_delay;
>> +
>> +	spin_unlock_irqrestore(&data->lock, flags);
>> +
>> +	mod_delayed_work(system_wq, &data->work, led_off_delay);
>> +}
>> +
>> +static int input_events_connect(struct input_handler *handler, struct input_dev *dev,
>> +				const struct input_device_id *id)
>> +{
>> +	struct input_handle *handle;
>> +	int ret;
>> +
>> +	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
> 
> Nit: sizeof(*handle)?

Ack, thank you for the review. I'll rebase this on top of v6.10-rc1
and send out a v3 with the nit fixed.

Regards,

Hans


> 
>> +	if (!handle)
>> +		return -ENOMEM;
>> +
>> +	handle->dev = dev;
>> +	handle->handler = handler;
>> +	handle->name = "input-events";
>> +
>> +	ret = input_register_handle(handle);
>> +	if (ret)
>> +		goto err_free_handle;
>> +
>> +	ret = input_open_device(handle);
>> +	if (ret)
>> +		goto err_unregister_handle;
>> +
>> +	return 0;
>> +
>> +err_unregister_handle:
>> +	input_unregister_handle(handle);
>> +err_free_handle:
>> +	kfree(handle);
>> +	return ret;
>> +}
>> +
>> +static void input_events_disconnect(struct input_handle *handle)
>> +{
>> +	input_close_device(handle);
>> +	input_unregister_handle(handle);
>> +	kfree(handle);
>> +}
>> +
>> +static const struct input_device_id input_events_ids[] = {
>> +	{
>> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
>> +		.evbit = { BIT_MASK(EV_KEY) },
>> +	},
>> +	{
>> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
>> +		.evbit = { BIT_MASK(EV_REL) },
>> +	},
>> +	{
>> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
>> +		.evbit = { BIT_MASK(EV_ABS) },
>> +	},
>> +	{ }
>> +};
>> +
>> +static int input_events_activate(struct led_classdev *led_cdev)
>> +{
>> +	struct input_events_data *data;
>> +	int ret;
>> +
>> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->handler.name = "input-events";
>> +	data->handler.event = input_events_event;
>> +	data->handler.connect = input_events_connect;
>> +	data->handler.disconnect = input_events_disconnect;
>> +	data->handler.id_table = input_events_ids;
>> +
>> +	INIT_DELAYED_WORK(&data->work, led_input_events_work);
>> +	spin_lock_init(&data->lock);
>> +
>> +	data->led_cdev = led_cdev;
>> +	data->led_cdev_saved_flags = led_cdev->flags;
>> +	data->led_off_delay = msecs_to_jiffies(DEFAULT_LED_OFF_DELAY_MS);
>> +
>> +	/*
>> +	 * Use led_cdev->blink_brightness + LED_BLINK_SW flag so that sysfs
>> +	 * brightness writes will change led_cdev->new_blink_brightness for
>> +	 * configuring the on state brightness (like ledtrig-heartbeat).
>> +	 */
>> +	if (!led_cdev->blink_brightness)
>> +		led_cdev->blink_brightness = led_cdev->max_brightness;
>> +
>> +	/* Start with LED off */
>> +	led_set_brightness_nosleep(data->led_cdev, LED_OFF);
>> +
>> +	ret = input_register_handler(&data->handler);
>> +	if (ret) {
>> +		kfree(data);
>> +		return ret;
>> +	}
>> +
>> +	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
>> +
>> +	/* Turn LED off during suspend, original flags are restored on deactivate() */
>> +	led_cdev->flags |= LED_CORE_SUSPENDRESUME;
>> +
>> +	led_set_trigger_data(led_cdev, data);
>> +	return 0;
>> +}
>> +
>> +static void input_events_deactivate(struct led_classdev *led_cdev)
>> +{
>> +	struct input_events_data *data = led_get_trigger_data(led_cdev);
>> +
>> +	led_cdev->flags = data->led_cdev_saved_flags;
>> +	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>> +	input_unregister_handler(&data->handler);
>> +	cancel_delayed_work_sync(&data->work);
>> +	kfree(data);
>> +}
>> +
>> +static struct led_trigger input_events_led_trigger = {
>> +	.name       = "input-events",
>> +	.activate   = input_events_activate,
>> +	.deactivate = input_events_deactivate,
>> +	.groups     = input_events_led_groups,
>> +};
>> +module_led_trigger(input_events_led_trigger);
>> +
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>> +MODULE_DESCRIPTION("Input Events LED trigger");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("ledtrig:input-events");
>> -- 
>> 2.44.0
>>
> 


