Return-Path: <linux-leds+bounces-5305-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC516B34555
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 17:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D382188521E
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 15:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6A92F360C;
	Mon, 25 Aug 2025 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEZvxYX0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7023D7E3;
	Mon, 25 Aug 2025 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134871; cv=none; b=TqlDsM3RVzUSOJ1blo8X8GTYko0aJLIONQWn3aZGye7fmaBZxhcLqHW0OtlkW5lXr0/LSjcW/xLFUnmSGRsY4QKUy7rNSaqebk3EydFmVcIw4nOFyg1UGfv1UITwDmyTP/eFjSvZSY1MyA4yWa/xkBPvdyE0T+tCRLR/kgTK90Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134871; c=relaxed/simple;
	bh=dF1akKebs2h4RUp52AYTnX71xDhjtj8gZDiphPtqUn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSzaNgnfPC3QrQmM9p1k+/BeSRrr3T8SGua+l8uO6dLHNIEaN8JtjzjSWaHfjZsDhBc/1Rg9AqJhF48IfwRgiBz4hb0+QYHfKiLgR1d+RdI8PRRY6fwvCVvhyt2dxQ7+FghRPbIz4+7NjpWUYTimDEjMBzDuwAAfTFoIooHoi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEZvxYX0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756134869; x=1787670869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dF1akKebs2h4RUp52AYTnX71xDhjtj8gZDiphPtqUn4=;
  b=fEZvxYX0JVwTcA0TGYGCkcMBs6jSHeNaXYDFoKv6ghz5LsivFjLhfGbX
   wY9m7Au9dGDIM4jI14S2/wMDoYqb73H4jGd0snY4VCkPrSnCvGm5B7MzR
   juDkIWcx1t8+XJIhV9FCSXqkS34yqeUOiTDCYTQyVWxgSqilsHM+2KnfC
   Lax3rLofHt1TDn4btlHjrjfYGYLK4tNc+8YOjwLRJ+DyqU6K0ze0X/yT6
   du2YAV33/ooaNJGj7IP/JMXOnS7A8pJHANis66HrIfgh3mfryABpFJRXM
   VXbzGuPVfgBbUlS5qNIs+EL0nlta0KLsNppPmKgLmLBUzay8PzZS8FaAg
   w==;
X-CSE-ConnectionGUID: l/KQ6rsdTbakO5ElwVwqCg==
X-CSE-MsgGUID: nct4PFC4S4qZEdNdwsh15Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58408639"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58408639"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:14:28 -0700
X-CSE-ConnectionGUID: eTi1GKLdSm+eeii6y1BLXA==
X-CSE-MsgGUID: jJes+358RJmQrS0U3Vr1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="168920426"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:14:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqYtp-00000008Xj8-41Iw;
	Mon, 25 Aug 2025 18:14:21 +0300
Date: Mon, 25 Aug 2025 18:14:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 3/6] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <aKx9zQNppjNNMJEt@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-4-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825033237.60143-4-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 24, 2025 at 11:32:29PM -0400, Jean-François Lessard wrote:
> Add driver for TM16xx family LED controllers and compatible chips from
> multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and
> Winrise. These controllers drive 7-segment digits and individual LED icons
> through either I2C or SPI buses.
> 
> Successfully tested on various ARM TV boxes including H96 Max, Magicsee N5,
> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platforms
> (Rockchip, Amlogic, Allwinner).

...

> Notes:
>     checkpatch reports false positives that are intentionally ignored:
>     DEVICE_ATTR_FUNCTIONS: Functions are correctly prefixed with driver
>     name (tm16xx_*) following standard kernel practice for device
>     attribute functions to avoid namespace conflicts.
>     BIT_MACRO: bit shifts are used for field values while GENMASK/BIT
>     are used for bit positions per semantic convention

>     include <linux/of.h> is required for the default name of the main led
>     device, excluding the unit address, as implemented in
>     drivers/leds/led-core.c which relies on of_node->name

Sorry, but I do not see how of.h is related to all this... Please, drop it.

>     LED registration uses non-devm variant on-purpose to allow explicit
>     unregistration on device removal, ensuring LED triggers are
>     immediately stopped. This prevents stale LED trigger activity from
>     continuing after the hardware is gone, avoiding the need for complex
>     state tracking in brightness callbacks.

...

> +What:		/sys/class/leds/<led>/value

> +Date:		August 2025
> +KernelVersion:	6.17

The Date should be approximate date of the kernel release (alternatively, -rc1
of that). The version is estimated version where ABI can be found first.

Both of these need to be changed.


> +Contact:	Jean-François Lessard <jefflessard3@gmail.com>
> +Description:
> +		Controls the text displayed on the TM16xx 7-segment display.
> +
> +		Reading returns the current display content as ASCII characters,
> +		one character per digit position, followed by a newline.
> +
> +		Writing sets new display content. Input characters are mapped
> +		to 7-segment patterns using the configured character map. The
> +		string length should not exceed the number of available digits
> +		(see num_digits). Shorter strings will clear remaining digits.
> +
> +		Example:
> +		  echo "1234" > value    # Display "1234"
> +		  cat value              # Returns "1234\n"
> +
> +What:		/sys/class/leds/<led>/num_digits
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jean-François Lessard <jefflessard3@gmail.com>
> +Description:
> +		Read-only attribute showing the number of 7-segment digit
> +		positions available on this TM16xx display controller.
> +
> +		The value is determined by the device tree configuration
> +		and represents the maximum length for the 'value' attribute.
> +
> +		Example:
> +		  cat num_digits         # Returns "4\n" for 4-digit display
> +
> +What:		/sys/class/leds/<led>/map_seg7
> +Date:		August 2025
> +KernelVersion:	6.17
> +Contact:	Jean-François Lessard <jefflessard3@gmail.com>
> +Description:
> +		Read/write binary blob representing the ASCII-to-7-segment
> +		display conversion table used by the TM16xx driver, as defined
> +		by struct seg7_conversion_map in <linux/map_to_7segment.h>.
> +
> +		This attribute is not human-readable. Writes must match the
> +		struct size exactly, else -EINVAL is returned; reads return the
> +		entire mapping as a binary blob.
> +
> +		This interface and its implementation match existing conventions
> +		used in auxdisplay and segment-mapped display drivers since 2005.
> +
> +		ABI note: This style of binary sysfs attribute *is an exception*
> +		to current "one value per file, text only" sysfs rules, for
> +		historical compatibility and driver uniformity. New drivers are
> +		discouraged from introducing additional binary sysfs ABIs.
> +
> +		Reference interface guidance:
> +		- include/uapi/linux/map_to_7segment.h

So, the driver is under auxdisplay, but at the same time it completely relies
on LED subsystem... What's going on here?

Btw, have you seen
https://lore.kernel.org/linux-leds/20231011190017.1230898-1-wse@tuxedocomputers.com/
? And  if so, what're your takeaways? (Yes, I know that's about different HW)

> +Users:		Display configuration utilities and embedded system scripts/tools.

...

> + * Copyright (C) 2024 Jean-François Lessard

My calendar shows something different.


> +#include <linux/bitfield.h>

> +#include <linux/bitmap.h>

Is this used?

> +#include <linux/leds.h>
> +#include <linux/workqueue.h>

...

> +#define TM16XX_DIGIT_SEGMENTS	7

Why do we even need this?

...

> +#define TM16XX_CTRL_BRIGHTNESS(on, val, prfx) \
> +	((on) ? (FIELD_PREP(prfx##_CTRL_BR_MASK, (val)) | prfx##_CTRL_ON) : 0)

prefix can be spelled fully, going slightly over 80 is not a crime.

...

> +struct tm16xx_display {
> +	struct device *dev;
> +	const struct tm16xx_controller *controller;

> +	union {
> +		struct i2c_client *i2c;
> +		struct spi_device *spi;
> +	} client;

Why? Just drop it. struct device *dev is enough and I can't see the need
in this at all.

> +	u8 *spi_buffer;
> +	u8 num_grids;
> +	u8 num_segments;
> +	struct led_classdev main_led;
> +	struct tm16xx_led *leds;
> +	u8 num_leds;
> +	struct tm16xx_digit *digits;
> +	u8 num_digits;
> +	struct work_struct flush_init;
> +	struct work_struct flush_display;
> +	int flush_status;
> +	struct mutex lock; /* prevents concurrent work operations */
> +	unsigned long *state;
> +};

...

> + * Copyright (C) 2024 Jean-François Lessard

Year?

...

> +#include <linux/map_to_7segment.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>

Please, follow IWYU principle.

...

> +static ssize_t tm16xx_num_digits_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct tm16xx_display *display = dev_get_drvdata(led_cdev->dev->parent);
> +
> +	return sprintf(buf, "%u\n", display->num_digits);

Should be sysfs_emit().

> +}

...

> +static ssize_t tm16xx_map_seg7_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	memcpy(buf, &map_seg7, sizeof(map_seg7));
> +	return sizeof(map_seg7);
> +}

Can we use LINEDISP library?

...

> +static struct attribute *tm16xx_main_led_attrs[] = {
> +	&dev_attr_value.attr,
> +	&dev_attr_num_digits.attr,
> +	&dev_attr_map_seg7.attr,

> +	NULL,

No comma in the terminator entry.

> +};
> +ATTRIBUTE_GROUPS(tm16xx_main_led);

...

> +static int tm16xx_display_init(struct tm16xx_display *display)
> +{
> +	unsigned int nbits = tm16xx_led_nbits(display);

> +	dev_dbg(display->dev, "Initializing display\n");

Please, drop all these dev_dbg() over the code as they are close to useless,
use tracers and other mechanisms to debug if required.

Also drop unneeded kernel-doc for the (esp. static) functions that have well
established meaning (e.g., no need a kernel-doc for device attributes as they
should be documented in the ABI).

> +	schedule_work(&display->flush_init);
> +	flush_work(&display->flush_init);
> +	if (display->flush_status < 0)
> +		return display->flush_status;
> +
> +	if (tm16xx_init_value) {
> +		tm16xx_value_store(display->main_led.dev, NULL,
> +				   tm16xx_init_value,
> +				   strlen(tm16xx_init_value));
> +	} else {
> +		bitmap_fill(display->state, nbits);
> +		schedule_work(&display->flush_display);
> +		flush_work(&display->flush_display);
> +		bitmap_zero(display->state, nbits);
> +		if (display->flush_status < 0)
> +			return display->flush_status;
> +	}
> +
> +	dev_info(display->dev, "Display turned on\n");
> +
> +	return 0;
> +}

...

> +static int tm16xx_parse_dt(struct device *dev, struct tm16xx_display *display)

Why DT only? No support for other platforms? Why?
I think this is just matter of naming the function properly.

> +{
> +	struct fwnode_handle *leds_node, *digits_node, *child;
> +	struct tm16xx_led *led;
> +	struct tm16xx_digit *digit;

> +	int max_grid = 0, max_segment = 0;

Why signed?

> +	int ret, i, j;

Why are i and j signed?

> +	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
> +	u32 reg[2];
> +
> +	/* parse digits */
> +	digits_node = device_get_named_child_node(dev, "digits");
> +	if (digits_node) {

> +		display->num_digits = 0;
> +		fwnode_for_each_child_node(digits_node, child)
> +			display->num_digits++;

Don't we have a _count API for this?

> +		dev_dbg(dev, "Number of digits: %u\n", display->num_digits);
> +
> +		if (display->num_digits) {
> +			display->digits = devm_kcalloc(dev, display->num_digits,
> +						       sizeof(*display->digits),
> +						       GFP_KERNEL);
> +			if (!display->digits) {

> +				fwnode_handle_put(digits_node);

Use RAII instead, we have defined __free() method for this.

> +				return -ENOMEM;
> +			}
> +
> +			i = 0;
> +			fwnode_for_each_child_node(digits_node, child) {

Ditto. Use _scoped variant.

> +				digit = &display->digits[i];

> +				ret = fwnode_property_read_u32(child, "reg",
> +							       reg);

One line.

> +				if (ret < 0) {

Can it be positive? Here and everywhere else, if there is no positive return,
use 'if (ret)'.

> +					fwnode_handle_put(child);
> +					fwnode_handle_put(digits_node);
> +					return ret;
> +				}
> +
> +				ret = fwnode_property_read_u32_array(child,
> +								     "segments",
> +								     segments,
> +								     TM16XX_DIGIT_SEGMENTS * 2);
> +				if (ret < 0) {
> +					fwnode_handle_put(child);
> +					fwnode_handle_put(digits_node);
> +					return ret;
> +				}
> +
> +				for (j = 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
> +					digit->segments[j].grid = segments[2 * j];
> +					digit->segments[j].segment = segments[2 * j + 1];

> +					max_grid = umax(max_grid,

Firstly, the variables made signed and then specifically force them to be
unsigned in the macro. Weird. Can we make them to be a proper type and use max()?

> +							digit->segments[j].grid);

One line

> +					max_segment = umax(max_segment,
> +							   digit->segments[j].segment);

As per above comments.

> +				}
> +				digit->value = 0;
> +				i++;
> +			}
> +
> +			fwnode_handle_put(digits_node);
> +		}
> +	}
> +
> +	/* parse leds */
> +	leds_node = device_get_named_child_node(dev, "leds");
> +	if (leds_node) {
> +		display->num_leds = 0;
> +		fwnode_for_each_child_node(leds_node, child)
> +			display->num_leds++;

As per above.

> +		dev_dbg(dev, "Number of LEDs: %u\n", display->num_leds);
> +
> +		if (display->num_leds) {
> +			display->leds = devm_kcalloc(dev, display->num_leds,
> +						     sizeof(*display->leds),
> +						     GFP_KERNEL);
> +			if (!display->leds) {
> +				fwnode_handle_put(leds_node);
> +				return -ENOMEM;
> +			}
> +
> +			i = 0;
> +			fwnode_for_each_child_node(leds_node, child) {
> +				led = &display->leds[i];

> +				ret = fwnode_property_read_u32_array(child,
> +								     "reg", reg,
> +								     2);

Make it one line.

> +				if (ret < 0) {
> +					fwnode_handle_put(child);
> +					fwnode_handle_put(leds_node);
> +					return ret;
> +				}
> +
> +				led->grid = reg[0];
> +				led->segment = reg[1];
> +				max_grid = umax(max_grid, led->grid);
> +				max_segment = umax(max_segment, led->segment);
> +				i++;
> +			}
> +		}
> +
> +		fwnode_handle_put(leds_node);
> +	}
> +
> +	if (max_grid >= display->controller->max_grids) {
> +		dev_err(dev, "grid %u exceeds controller max_grids %u\n",
> +			max_grid, display->controller->max_grids);
> +		return -EINVAL;
> +	}
> +
> +	if (max_segment >= display->controller->max_segments) {
> +		dev_err(dev, "segment %u exceeds controller max_segments %u\n",
> +			max_segment, display->controller->max_segments);
> +		return -EINVAL;
> +	}
> +
> +	display->num_grids = max_grid + 1;
> +	display->num_segments = max_segment + 1;

> +	dev_dbg(dev, "Number of grids: %u\n", display->num_grids);
> +	dev_dbg(dev, "Number of segments: %u\n", display->num_segments);

I didn't get this. You mean that they are not strictly 7-segment ones?

> +
> +	return 0;
> +}

...

> +int tm16xx_probe(struct tm16xx_display *display)
> +{
> +	struct device *dev = display->dev;
> +	struct led_classdev *main = &display->main_led;
> +	struct fwnode_handle *leds_node, *child;
> +	unsigned int nbits;
> +	int ret, i;

Why is i signed?

> +	dev_dbg(dev, "Probing device\n");
> +	ret = tm16xx_parse_dt(dev, display);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to parse device tree\n");
> +
> +	nbits = tm16xx_led_nbits(display);
> +	display->state = devm_bitmap_zalloc(dev, nbits, GFP_KERNEL);
> +	if (!display->state)
> +		return -ENOMEM;

> +	mutex_init(&display->lock);

devm_mutex_init()

> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
> +	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);

> +	/* Initialize main LED properties */
> +	if (dev->of_node)
> +		main->name = dev->of_node->name;
> +	if (!main->name)
> +		main->name = "display";
> +	device_property_read_string(dev, "label", &main->name);

My gosh. This is done in the LED core if we even need this...

> +	main->max_brightness = display->controller->max_brightness;
> +	device_property_read_u32(dev, "max-brightness", &main->max_brightness);
> +	main->max_brightness = umin(main->max_brightness,
> +				    display->controller->max_brightness);
> +
> +	main->brightness = main->max_brightness;
> +	device_property_read_u32(dev, "default-brightness", &main->brightness);
> +	main->brightness = umin(main->brightness, main->max_brightness);
> +
> +	main->brightness_set = tm16xx_brightness_set;
> +	main->groups = tm16xx_main_led_groups;
> +	main->flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
> +
> +	ret = led_classdev_register(dev, main);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register main LED\n");

> +	i = 0;
> +	leds_node = device_get_named_child_node(dev, "leds");
> +	fwnode_for_each_child_node(leds_node, child) {
> +		struct tm16xx_led *led = &display->leds[i];
> +		struct led_init_data led_init = {
> +			.fwnode = child,
> +			.devicename = dev_name(main->dev),
> +			.devname_mandatory = true,
> +			.default_label = "led",
> +		};
> +		led->cdev.max_brightness = 1;
> +		led->cdev.brightness_set = tm16xx_led_set;
> +		led->cdev.flags = LED_RETAIN_AT_SHUTDOWN |
> +				  LED_CORE_SUSPENDRESUME;
> +
> +		ret = led_classdev_register_ext(dev, &led->cdev, &led_init);
> +		if (ret < 0) {
> +			fwnode_handle_put(child);
> +			dev_err_probe(dev, ret, "Failed to register LED %s\n",
> +				      led->cdev.name);
> +			goto unregister_leds;
> +		}
> +
> +		i++;
> +	}
> +
> +	ret = tm16xx_display_init(display);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to initialize display\n");
> +		goto unregister_leds;
> +	}
> +
> +	return 0;
> +
> +unregister_leds:
> +	while (i--)
> +		led_classdev_unregister(&display->leds[i].cdev);
> +
> +	led_classdev_unregister(main);
> +	return ret;
> +}

...

> +void tm16xx_remove(struct tm16xx_display *display)
> +{
> +	unsigned int nbits = tm16xx_led_nbits(display);
> +	struct tm16xx_led *led;

> +	dev_dbg(display->dev, "Removing display\n");

Unneeded noise.

> +	/*
> +	 * Unregister LEDs first to immediately stop trigger activity.
> +	 * This prevents LED triggers from attempting to access hardware
> +	 * after it's been disconnected or driver unloaded.
> +	 */
> +	for (int i = 0; i < display->num_leds; i++) {

Why iterator is signed?

> +		led = &display->leds[i];
> +		led_classdev_unregister(&led->cdev);
> +	}
> +	led_classdev_unregister(&display->main_led);
> +
> +	/* Clear display state */
> +	bitmap_zero(display->state, nbits);
> +	schedule_work(&display->flush_display);
> +	flush_work(&display->flush_display);
> +
> +	/* Turn off display */
> +	display->main_led.brightness = LED_OFF;
> +	schedule_work(&display->flush_init);
> +	flush_work(&display->flush_init);

> +	dev_info(display->dev, "Display turned off\n");

Unneeded noise.

> +}

-- 
With Best Regards,
Andy Shevchenko



