Return-Path: <linux-leds+bounces-5765-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A26BD4FA9
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 18:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDAEE3A9872
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 16:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B185731E0E6;
	Mon, 13 Oct 2025 15:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TrhEZU72"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A23126B7;
	Mon, 13 Oct 2025 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370002; cv=none; b=Cyfe1ZDU5OvX3KEaVxmKrJCwB3ffRnUXoXxCh6bEFoGyZk7GEqtCt7kL53vEnOISi56amM4rWF/hqZ5SxXyx+QHNdelgCiDfvzAmihrsQduzBK4OHcN/AQ62KxhY+czPX3Fo1eTAbrb5lLT96eJTSusaq2QzWsUq4ie65Iwwfuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370002; c=relaxed/simple;
	bh=sQALxnqWnyeSEMQQ0RYyI6aibdSYc8AEXRbsUuo2WO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Thz+z5bhAIew6LuJpz+wglocBNlT5Mv5o8EhNtlXOHdsVbAp/du0se8/h7AxNp95KLdBdxHTgmxlrkFdGcNLOH8ahHXPoav34sjGTbYWtnql/+EuXvTAym5MBTpflyiXM70JCHKfhvOmJWORZk3LPTCG9vbqxdJ5+LLpae8l/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TrhEZU72; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1760369997;
	bh=sQALxnqWnyeSEMQQ0RYyI6aibdSYc8AEXRbsUuo2WO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrhEZU72r/+nrE6r5eTBIaHb02eYruhwh/6Kfwag28zUhjbGvS7gY2J9HguMBB2zx
	 yzxbwurE7SgZ32uIjUCOySMxKV2vEZSnJOPMgRzz65f9DaYC+yJQa/wsGRZp6akLo1
	 UGg4prMxS4fcOdQpnYTNEf5NH1AmClZs5XCMwzDM=
Date: Mon, 13 Oct 2025 17:39:55 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jonathan Brophy <professor_jonny@hotmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/4] leds: Add Virtual Color LED Group driver
Message-ID: <7175bcaf-f588-41ec-afe6-117eceffc28d@t-8ch.de>
References: <20251013120955.227572-1-professorjonny98@gmail.com>
 <20251013120955.227572-5-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013120955.227572-5-professorjonny98@gmail.com>

On 2025-10-14 01:09:48+1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Introduces a new driver that implements virtual LED groups,
> aggregating multiple monochromatic LEDs into virtual groups and providing
> priority-based control for concurrent state management.
> 
> Author: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Co Author: Jonathan Brophy <professor_jonny@hotmail.com>
> Copyright (C) 2024 Jonathan Brophy <professor_jonny@hotmail.com>
> 
> Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> Tested-by: Jonathan Brophy <professor_jonny@hotmail.com>
> Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
> ---
>  drivers/leds/rgb/Kconfig                   |  17 +
>  drivers/leds/rgb/Makefile                  |   1 +
>  drivers/leds/rgb/leds-group-virtualcolor.c | 439 +++++++++++++++++++++
>  3 files changed, 457 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-group-virtualcolor.c
> 
(...)

> diff --git a/drivers/leds/rgb/leds-group-virtualcolor.c b/drivers/leds/rgb/leds-group-virtualcolor.c
> new file mode 100644
> index 000000000000..e11ad155d3b4
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-group-virtualcolor.c
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Virtual LED Group Driver with Priority Control
> + *
> + * Implements virtual LED groups by aggregating multiple
> + * monochromatic LEDs. Provides priority-based control for managing
> + * concurrent LED activation requests, ensuring only the highest-priority
> + * LED state is active at any given time.
> + *
> + * Code created by Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
> + * Copyright (C) 2024 Jonathan Brophy <professor_jonny@hotmail.com>
> + *
> + */
> +
> +#include <linux/gpio/consumer.h>

Looks unnecessary.

> +#include <linux/leds.h>

#include <linux/list.h>

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct virtual_led {
> +	struct led_classdev cdev;
> +	struct led_classdev **monochromatics;
> +	struct leds_virtualcolor *vc_data;
> +	int num_monochromatics;
> +	int priority;
> +	unsigned long blink_delay_on;
> +	unsigned long blink_delay_off;
> +	struct list_head list;
> +};
> +
> +struct leds_virtualcolor {
> +	struct virtual_led *vleds;
> +	int num_vleds;
> +	struct list_head active_leds;
> +	struct mutex lock; // Protects access to active LEDs
> +};
> +
> +static void virtual_set_monochromatic_brightness(struct virtual_led *vled,
> +						 enum led_brightness brightness)
> +{
> +	int i;
> +
> +	if (vled->blink_delay_on || vled->blink_delay_off) {
> +		unsigned long blink_mask = (BIT(LED_BLINK_SW) | BIT(LED_BLINK_ONESHOT) |
> +					    BIT(LED_SET_BLINK));
> +
> +		/*
> +		 * Make sure the LED is not already blinking.
> +		 * We don't want to call led_blink_set multiple times.
> +		 */
> +		if (!(vled->cdev.work_flags & blink_mask))

work_flags don't look they are meant to be used by drivers.

> +			led_blink_set(&vled->cdev, &vled->blink_delay_on, &vled->blink_delay_off);
> +
> +		/* Update the blink delays if they have changed */
> +		if (vled->blink_delay_on != vled->cdev.blink_delay_on ||
> +		    vled->blink_delay_off != vled->cdev.blink_delay_off) {
> +			vled->cdev.blink_delay_on = vled->blink_delay_on;
> +			vled->cdev.blink_delay_off = vled->blink_delay_off;
> +		}
> +	}
> +
> +	for (i = 0; i < vled->num_monochromatics; i++)
> +		led_set_brightness(vled->monochromatics[i], brightness);
> +}
> +
> +static ssize_t priority_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct virtual_led *vled = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", vled->priority);

sysfs_emit();

> +}
> +
> +static ssize_t priority_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			      size_t count)
> +{
> +	struct virtual_led *vled = dev_get_drvdata(dev);
> +	int new_priority;
> +	int ret;
> +
> +	ret = kstrtoint(buf, 10, &new_priority);
> +	if (ret < 0)
> +		return ret;
> +
> +	vled->priority = new_priority;

No locking?

> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(priority);
> +
> +static ssize_t blink_delay_on_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct virtual_led *vled = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%lu\n", vled->blink_delay_on);
> +}

Why does this have a custom blinking UAPI?
Shouldn't it be generic?

(...)

> +static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
> +				       struct virtual_led *vled, struct leds_virtualcolor *vc_data)
> +{
> +	struct led_init_data init_data = {};
> +	u32 blink_interval;
> +	u32 phandle_count;
> +	u32 max_brightness;
> +	int ret;
> +	int i;

INIT_LIST_HEAD(&vled->list);

> +
> +	ret = of_property_read_u32(child, "priority", &vled->priority);
> +	if (ret)
> +		vled->priority = 0;
> +
> +	ret = of_property_read_u32(child, "blink", &blink_interval);
> +	if (!ret) {
> +		vled->blink_delay_on = blink_interval;
> +		vled->blink_delay_off = blink_interval;
> +	}
> +
> +	phandle_count = of_property_count_elems_of_size(child, "leds", sizeof(u32));
> +	if (phandle_count <= 0) {
> +		dev_err(dev, "No monochromatic LEDs specified for virtual LED %s\n",
> +			vled->cdev.name);
> +		return -EINVAL;
> +	}
> +
> +	vled->num_monochromatics = phandle_count;
> +	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
> +					    sizeof(*vled->monochromatics), GFP_KERNEL);
> +	if (!vled->monochromatics)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < vled->num_monochromatics; i++) {
> +		struct led_classdev *led_cdev;
> +
> +		led_cdev = devm_of_led_get_optional(dev, i);
> +		if (IS_ERR(led_cdev)) {
> +			/*
> +			 * If the LED is not available yet, defer the probe.
> +			 * The probe will be retried when it becomes available.
> +			 */
> +			if (PTR_ERR(led_cdev) == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +
> +			ret = PTR_ERR(led_cdev);
> +			dev_err(dev, "Failed to get monochromatic LED for %s, error %d\n",
> +				vled->cdev.name, ret);
> +			return ret;
> +		}

Just use dev_err_probe(), it will properly handle -EPROBE_DEFER.

> +
> +		vled->monochromatics[i] = led_cdev;
> +	}
> +
> +	ret = of_property_read_u32(child, "max-brightness", &max_brightness);
> +	if (ret)
> +		vled->cdev.max_brightness = LED_FULL;
> +	else
> +		vled->cdev.max_brightness = max_brightness;
> +
> +	vled->cdev.brightness_set_blocking = virtual_led_brightness_set;
> +	vled->cdev.flags = LED_CORE_SUSPENDRESUME;
> +
> +	init_data.fwnode = NULL; // Use OF, not fwnode

Why?

> +	ret = devm_led_classdev_register_ext(dev, &vled->cdev, &init_data);
> +	if (ret) {
> +		dev_err(dev, "Failed to register virtual LED %s\n", vled->cdev.name);
> +		return ret;
> +	}

if (ret)
	return dev_err_probe() ...

> +
> +	ret = device_create_file(vled->cdev.dev, &dev_attr_priority);
> +	if (ret) {
> +		dev_err(dev, "Failed to create sysfs attribute for priority\n");
> +		return ret;
> +	}

Use 'struct platform_driver::driver::dev_groups' to let the driver core
manage your sysfs attributes instead of doing it manually.

> +
> +	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_on);
> +	if (ret) {
> +		dev_err(dev, "Failed to create sysfs attribute for blink_delay_on\n");
> +		return ret;
> +	}
> +
> +	ret = device_create_file(vled->cdev.dev, &dev_attr_blink_delay_off);
> +	if (ret) {
> +		dev_err(dev, "Failed to create sysfs attribute for blink_delay_off\n");
> +		return ret;
> +	}
> +
> +	vled->vc_data = vc_data;
> +
> +	return 0;
> +}
> +
> +static int leds_virtualcolor_disable_sysfs_access(struct device *dev, struct virtual_led *vled)
> +{
> +	int i;
> +
> +	for (i = 0; i < vled->num_monochromatics; i++) {
> +		struct led_classdev *led_cdev = vled->monochromatics[i];
> +
> +		mutex_lock(&led_cdev->led_access);

This mutex looks unnecessary.

> +		led_sysfs_disable(led_cdev);
> +		mutex_unlock(&led_cdev->led_access);
> +
> +		devm_add_action_or_reset(dev, restore_sysfs_write_access, led_cdev);

Check for errors.

> +	}
> +
> +	return 0;
> +}
> +
> +static int leds_virtualcolor_probe(struct platform_device *pdev)
> +{
> +	struct leds_virtualcolor *vc_data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *child;
> +	int count = 0;
> +	int ret;
> +
> +	vc_data = devm_kzalloc(dev, sizeof(*vc_data), GFP_KERNEL);
> +	if (!vc_data)
> +		return -ENOMEM;
> +
> +	mutex_init(&vc_data->lock);

Use devm_mutex_init(), then you can get rid of all the mutex_destroy()
calls below.

> +	INIT_LIST_HEAD(&vc_data->active_leds);
> +
> +	vc_data->num_vleds = of_get_child_count(dev->of_node);
> +	if (vc_data->num_vleds == 0) {
> +		dev_err(dev, "No virtual LEDs defined in device tree\n");

return dev_err_probe();

> +		ret = -EINVAL;
> +		goto err_mutex_destroy;
> +	}
> +
> +	vc_data->vleds = devm_kcalloc(dev, vc_data->num_vleds, sizeof(*vc_data->vleds), GFP_KERNEL);
> +	if (!vc_data->vleds) {
> +		ret = -ENOMEM;
> +		goto err_mutex_destroy;
> +	}
> +
> +	for_each_child_of_node(dev->of_node, child) {

for_each_child_of_node_scoped() should be nicer.
Also I think you should check for available, or better yet use
for_each_available_child_of_node_scoped().

> +		struct virtual_led *vled = &vc_data->vleds[count];
> +
> +		ret = leds_virtualcolor_init_vled(dev, child, vled, vc_data);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to initialize virtual LED %d\n", count);
> +
> +			of_node_put(child);
> +			goto err_node_put;
> +		}
> +
> +		count++;
> +	}
> +
> +	platform_set_drvdata(pdev, vc_data);
> +
> +	if (of_property_read_bool(dev->of_node, "monochromatics-ro")) {

The property should be documented.

> +		int i;
> +
> +		for (i = 0; i < count; i++) {
> +			struct virtual_led *vled = &vc_data->vleds[i];
> +
> +			ret = leds_virtualcolor_disable_sysfs_access(dev, vled);
> +			if (ret)
> +				goto err_node_put;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_node_put:
> +	mutex_destroy(&vc_data->lock);
> +	return ret;
> +
> +err_mutex_destroy:

Both labels have the same code behind them.

> +	mutex_destroy(&vc_data->lock);
> +
> +	return ret;
> +}
> +
> +static void leds_virtualcolor_remove(struct platform_device *pdev)
> +{
> +	struct leds_virtualcolor *vc_data = platform_get_drvdata(pdev);
> +	int i, j;
> +
> +	for (i = 0; i < vc_data->num_vleds; i++) {
> +		struct virtual_led *vled = &vc_data->vleds[i];
> +
> +		device_remove_file(vled->cdev.dev, &dev_attr_priority);
> +		device_remove_file(vled->cdev.dev, &dev_attr_blink_delay_on);
> +		device_remove_file(vled->cdev.dev, &dev_attr_blink_delay_off);

No need to clean up sysfs files, they will be cleaned up automatically.

> +
> +		for (j = 0; j < vled->num_monochromatics; j++) {
> +			if (vled->monochromatics[j]) {
> +				led_put(vled->monochromatics[j]);

This is dropping the reference acquired by devm_of_led_get_optional(),
correct? Then it is unnecessary, as the reference will be dropped
automatically by the devres framework.

> +				vled->monochromatics[j] = NULL;

This looks unnecessary, the memory is going to be freed anyways.

> +			}
> +		}
> +	}
> +
> +	mutex_destroy(&vc_data->lock);
> +}

(...)

