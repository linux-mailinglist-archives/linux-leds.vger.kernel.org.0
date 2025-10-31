Return-Path: <linux-leds+bounces-5953-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8AEC243BF
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 10:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90633A720A
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B9E3321CF;
	Fri, 31 Oct 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBr+Bhwf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E41B32ED26;
	Fri, 31 Oct 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761903715; cv=none; b=JJMDs62PKI1eLsr90A2nifKrofkKIkSi/q0qYejYZfmKZYRsEsFXSk/2P/A4cx4Eop3fNiw8F8bFdcSbH+4p1E3v73n1qXLbyid79hLzDTrW+EhY7wRd6IQJpn8V+Apks/lpW2UTUbJNRSFMzJ/RVG9oM4wigDKu7ojT1LSiSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761903715; c=relaxed/simple;
	bh=AniwhKVEzDyiacvVEjC4H8QPa6pBICc7YQZFV4pKOpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ca3TSgEOJTNmcYQfJw4VCfLaeKnlP5g40DBV80me1CrCAi5q8AE82ldFHKuNCnu5RyZcn63LPmhQF7YzLap8sQsw1rDCxqRBy8wbxGZ926JeRZbWek92GLIXh6LOZFz7oJgVGfyEQ8G5RohSHDUFm+vsexSSb53hp+5uizIbEis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBr+Bhwf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761903712; x=1793439712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AniwhKVEzDyiacvVEjC4H8QPa6pBICc7YQZFV4pKOpw=;
  b=eBr+BhwfHjNVnjIvEqn8JRIP/FXWWOwtZ4jbbT3XCCJgBAbWLjf58oXC
   efnvUxlcoRw4wDflly00Q75NAz10/0jFyUtfeSC0a7maHYeDLTGyD3eNz
   J4KQEi2MrdQeg83cb1REJCcfITwmDWDUPUajgZIAm7rWI5SQyYQu1Cn7V
   lfBvgOSSy+Xx9XGEiS2fMZ/R+YmS0cSSLz16KjZHQgsKYNTipWKNrfWug
   aSR75y/4xjJJGOOA7g6Mg9FNJMLn5qsUUUhONkJQjXLXarv1a2e5tC1Xu
   C1AsPNs5090p1GpaNfR2dZw7LNOda8/flVrmse8XDFkio4XBp46uIwqsO
   w==;
X-CSE-ConnectionGUID: rwt33UagT1mMk+gRLrFPyQ==
X-CSE-MsgGUID: W01/z6uqTb2tJjXblpdrAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74662065"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="74662065"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:41:51 -0700
X-CSE-ConnectionGUID: mP5xuws9Sm2J6Xi2Brp9IA==
X-CSE-MsgGUID: TEKg4Z1ORoSYHP1eeX3fbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190545685"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:41:50 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vEldh-00000004E4l-3Ikl;
	Fri, 31 Oct 2025 11:41:45 +0200
Date: Fri, 31 Oct 2025 11:41:44 +0200
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5 4/7] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <aQSEWGg50VHIECoM@smile.fi.intel.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com>
 <20250926141913.25919-5-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926141913.25919-5-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 26, 2025 at 10:19:05AM -0400, Jean-François Lessard wrote:
> Add driver for TM16xx family LED controllers and compatible chips from
> multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and
> Winrise. These controllers drive 7-segment digits and individual LED icons
> through either I2C or SPI buses.
> 
> Successfully tested on various ARM TV boxes including H96 Max, Magicsee N5,
> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platforms
> (Rockchip, Amlogic, Allwinner).

...

> +config TM16XX

Hmm... After applying this patch there will be no compile test coverage.

> +	tristate

IIRC there is a trick how to achieve that by modifying a tristate line to be
visible depending on the other options.

E.g.,
drivers/dpll/zl3073x/Kconfig:4: tristate "Microchip Azurite DPLL/PTP/SyncE devices" if COMPILE_TEST

> +	select LEDS_CLASS
> +	select LEDS_TRIGGERS
> +	select LINEDISP
> +	select NEW_LEDS
> +	help
> +	  Core TM16XX-compatible 7-segment LED controllers module

Please, elaborate a bit more here. Usually we expect ~3 lines of description to
be a minimum.

...

> +#ifndef _TM16XX_H
> +#define _TM16XX_H

+ bits.h

> +#include <linux/bitfield.h>
> +#include <linux/leds.h>

+ mutex.h

> +#include <linux/workqueue.h>

+ types.h

...

> +#define FD655_CMD_CTRL		0x48
> +#define FD655_CMD_ADDR		0x66
> +#define FD655_CTRL_BR_MASK	GENMASK(6, 5)
> +#define FD655_CTRL_ON		(1 << 0)
> +
> +#define FD6551_CMD_CTRL		0x48

Do we need a duplicate? Yes, bitfields can be different, but since the register
is called the same, I would leave only one register offset definition.

...

> +/**
> + * DOC: struct tm16xx_controller - Controller-specific operations and limits
> + * @max_grids: Maximum number of grids supported by the controller.
> + * @max_segments: Maximum number of segments supported by the controller.
> + * @max_brightness: Maximum brightness level supported by the controller.
> + * @max_key_rows: Maximum number of key input rows supported by the controller.
> + * @max_key_cols: Maximum number of key input columns supported by the controller.
> + * @init: Pointer to controller mode/brightness configuration function.
> + * @data: Pointer to function writing display data to the controller.
> + * @keys: Pointer to function reading controller key state into bitmap.
> + *
> + * Holds function pointers and limits for controller-specific operations.
> + */
> +struct tm16xx_controller {
> +	const u8 max_grids;
> +	const u8 max_segments;
> +	const u8 max_brightness;
> +	const u8 max_key_rows;
> +	const u8 max_key_cols;

What are const above supposed to achieve?

> +	int (*const init)(struct tm16xx_display *display);
> +	int (*const data)(struct tm16xx_display *display, u8 index, unsigned int grid);
> +	int (*const keys)(struct tm16xx_display *display);
> +};

...

> +struct tm16xx_display {
> +	struct device *dev;

Missing forward declaration.

> +	const struct tm16xx_controller *controller;
> +	struct linedisp linedisp;
> +	u8 *spi_buffer;
> +	u8 num_hwgrid;
> +	u8 num_hwseg;
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

> +#endif /* _TM16XX_H */

...

> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/leds.h>
> +#include <linux/map_to_7segment.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/sysfs.h>

+ types.h

> +#include <linux/workqueue.h>

> +#include "line-display.h"

I would add a blank line here as well.

> +#include "tm16xx.h"

...

> +#define linedisp_to_tm16xx(display) \
> +	container_of(display, struct tm16xx_display, linedisp)

One line, we are using 100 limit here.

...

> +/**
> + * tm16xx_set_seg() - Set the display state for a specific grid/segment
> + * @display: pointer to tm16xx_display
> + * @hwgrid: grid index
> + * @hwseg: segment index
> + * @on: true to turn on, false to turn off

Can also be %true and %false. This helps the rendering to use different font
settings for the constants (where applicable).

> + */
> +static inline void tm16xx_set_seg(const struct tm16xx_display *display,
> +				  const u8 hwgrid, const u8 hwseg, const bool on)
> +{
> +	assign_bit(hwgrid * display->num_hwseg + hwseg, display->state, on);

Do you need an atomic call here? Perhaps __assign_bit() would suffice,

> +}

...

> +static inline unsigned int tm16xx_get_grid(const struct tm16xx_display *display,
> +					   const unsigned int index)
> +{
> +	return bitmap_read(display->state, index * display->num_hwseg,
> +			   display->num_hwseg);

One line.

> +}

...

> +static void tm16xx_display_flush_init(struct work_struct *work)
> +{
> +	struct tm16xx_display *display = container_of(work,
> +						      struct tm16xx_display,
> +						      flush_init);

I slightly prefer

	struct tm16xx_display *display =
		container_of(work, struct tm16xx_display, flush_init);

Or even a single line.


> +	int ret;
> +
> +	if (display->controller->init) {
> +		scoped_guard(mutex, &display->lock) {
> +			ret = display->controller->init(display);
> +			display->flush_status = ret;
> +		}
> +		if (ret)
> +			dev_err(display->dev,
> +				"Failed to configure controller: %d\n", ret);
> +	}

First of all, I'm not sure what the lock is protecting. Here you allow "init" to
be whatever, while in the below code the "data" is protected.

Second, I haven't seen changes in this function later in the series, so perhaps
drop the indentation by negating conditional?

> +}

> +/**
> + * tm16xx_display_flush_data() - Workqueue to update display data to controller
> + * @work: pointer to work_struct

Perhaps add a small description and explain that this is interrupted if an
error occurs and that error will be stored for further use by upper layers.

Does the same apply to the above function?

> + */
> +static void tm16xx_display_flush_data(struct work_struct *work)
> +{
> +	struct tm16xx_display *display = container_of(work,
> +						      struct tm16xx_display,
> +						      flush_display);
> +	unsigned int grid, i;
> +	int ret = 0;

> +	scoped_guard(mutex, &display->lock) {

As per above, and here AFAICS guard()() will suit better.

> +		if (display->controller->data) {
> +			for (i = 0; i < display->num_hwgrid; i++) {
> +				grid = tm16xx_get_grid(display, i);
> +				ret = display->controller->data(display, i, grid);
> +				if (ret) {
> +					dev_err(display->dev,
> +						"Failed to write display data: %d\n",
> +						ret);
> +					break;
> +				}
> +			}
> +		}
> +
> +		display->flush_status = ret;
> +	}
> +}

...

> +static void tm16xx_brightness_set(struct led_classdev *led_cdev,
> +				  enum led_brightness brightness)

One line

...

> +static void tm16xx_led_set(struct led_classdev *led_cdev,
> +			   enum led_brightness value)

Ditto.

...

> +static int tm16xx_display_value(struct tm16xx_display *display, const char *buf, size_t count)
> +{
> +	struct linedisp *linedisp = &display->linedisp;
> +	struct linedisp_map *map = linedisp->map;
> +	struct tm16xx_digit *digit;
> +	unsigned int i, j;

> +	int seg_pattern;

Hmm... Should it be signed?

> +	bool val;

> +	for (i = 0; i < display->num_digits && i < count; i++) {

This means "whatever is smaller", perhaps make it clearer by using min() ?

> +		digit = &display->digits[i];
> +		seg_pattern = map_to_seg7(&map->map.seg7, buf[i]);
> +
> +		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
> +			val = seg_pattern & BIT(j);
> +			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
> +		}
> +	}
> +
> +	for (; i < display->num_digits; i++) {
> +		digit = &display->digits[i];
> +		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++)
> +			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], 0);
> +	}

Or unite these two for-loops into a single one with i < count conditional embedded?

		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
			if (i < count)
				val = seg_pattern & BIT(j);
			else
				val = 0;
			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
		}

?

> +	schedule_work(&display->flush_display);
> +	return 0;
> +}

...

> +static int tm16xx_parse_fwnode(struct device *dev, struct tm16xx_display *display)
> +{
> +	struct tm16xx_led *led;
> +	struct tm16xx_digit *digit;
> +	unsigned int max_hwgrid = 0, max_hwseg = 0;
> +	unsigned int i, j;
> +	int ret;
> +	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
> +	u32 reg[2];
> +
> +	struct fwnode_handle *digits_node __free(fwnode_handle) =
> +		device_get_named_child_node(dev, "digits");
> +	struct fwnode_handle *leds_node __free(fwnode_handle) =
> +		device_get_named_child_node(dev, "leds");
> +
> +	/* parse digits */
> +	if (digits_node) {
> +		display->num_digits = fwnode_get_child_node_count(digits_node);

> +		if (display->num_digits) {

Drop an indentation level by splitting this to a helper.

> +			display->digits = devm_kcalloc(dev, display->num_digits,
> +						       sizeof(*display->digits),
> +						       GFP_KERNEL);
> +			if (!display->digits)
> +				return -ENOMEM;
> +
> +			i = 0;
> +			fwnode_for_each_available_child_node_scoped(digits_node, child) {
> +				digit = &display->digits[i];
> +
> +				ret = fwnode_property_read_u32(child, "reg", reg);
> +				if (ret)
> +					return ret;
> +
> +				ret = fwnode_property_read_u32_array(child,
> +								     "segments", segments,
> +								     TM16XX_DIGIT_SEGMENTS * 2);

> +				if (ret < 0)
> +					return ret;

Why '< 0'? Here it's definitely not a counting call, so it should never return
positive in this case.

> +
> +				for (j = 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
> +					digit->hwgrids[j] = segments[2 * j];
> +					digit->hwsegs[j] = segments[2 * j + 1];
> +					max_hwgrid = umax(max_hwgrid, digit->hwgrids[j]);
> +					max_hwseg = umax(max_hwseg, digit->hwsegs[j]);
> +				}
> +				i++;
> +			}
> +		}
> +	}
> +
> +	/* parse leds */
> +	if (leds_node) {
> +		display->num_leds = fwnode_get_child_node_count(leds_node);

> +		if (display->num_leds) {

Ditto.

> +			display->leds = devm_kcalloc(dev, display->num_leds,
> +						     sizeof(*display->leds),
> +						     GFP_KERNEL);
> +			if (!display->leds)
> +				return -ENOMEM;
> +
> +			i = 0;
> +			fwnode_for_each_available_child_node_scoped(leds_node, child) {
> +				led = &display->leds[i];
> +				ret = fwnode_property_read_u32_array(child, "reg", reg, 2);
> +				if (ret < 0)

Ditto,.

> +					return ret;
> +
> +				led->hwgrid = reg[0];
> +				led->hwseg = reg[1];
> +				max_hwgrid = umax(max_hwgrid, led->hwgrid);
> +				max_hwseg = umax(max_hwseg, led->hwseg);
> +				i++;
> +			}
> +		}
> +	}
> +
> +	if (max_hwgrid >= display->controller->max_grids) {
> +		dev_err(dev, "grid %u exceeds controller max_grids %u\n",
> +			max_hwgrid, display->controller->max_grids);
> +		return -EINVAL;
> +	}
> +
> +	if (max_hwseg >= display->controller->max_segments) {
> +		dev_err(dev, "segment %u exceeds controller max_segments %u\n",
> +			max_hwseg, display->controller->max_segments);
> +		return -EINVAL;
> +	}
> +
> +	display->num_hwgrid = max_hwgrid + 1;
> +	display->num_hwseg = max_hwseg + 1;
> +
> +	return 0;
> +}

...

> +/**
> + * tm16xx_probe() - Probe and initialize display device, register LEDs
> + * @display: pointer to tm16xx_display
> + *
> + * Return: 0 on success, negative error code on failure
> + */

Unneeded kernel-doc.

> +int tm16xx_probe(struct tm16xx_display *display)
> +{
> +	struct device *dev = display->dev;
> +	struct led_classdev *main = &display->main_led;
> +	struct led_init_data led_init = {0};

'0' is not needed.

> +	struct fwnode_handle *leds_node;
> +	struct tm16xx_led *led;
> +	unsigned int nbits, i;
> +	int ret;
> +
> +	ret = tm16xx_parse_fwnode(dev, display);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse device tree\n");
> +
> +	nbits = tm16xx_led_nbits(display);
> +	display->state = devm_bitmap_zalloc(dev, nbits, GFP_KERNEL);
> +	if (!display->state)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(display->dev, &display->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize mutex\n");

I believe it's ENOMEM here, so we don't need an error message.

> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
> +	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);

devm-helpers.h have something for this case, I believe.

> +	/* Initialize main LED properties */
> +	led_init.fwnode = dev_fwnode(dev); /* apply label property */

I didn't get a comment. This not only about label, but for entire set of
properties that led framework can consume.

> +	main->max_brightness = display->controller->max_brightness;
> +	device_property_read_u32(dev, "max-brightness", &main->max_brightness);
> +	main->max_brightness = umin(main->max_brightness,
> +				    display->controller->max_brightness);

Hmm... Why 'u' variant of macro?


> +	main->brightness = main->max_brightness;
> +	device_property_read_u32(dev, "default-brightness", &main->brightness);
> +	main->brightness = umin(main->brightness, main->max_brightness);

Ditto.

Given a comment about propagating fwnode, why do we need all this? Doesn't led
core take care of these properties as well?

> +	main->brightness_set = tm16xx_brightness_set;
> +	main->flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
> +
> +	/* Register individual LEDs from device tree */
> +	ret = led_classdev_register_ext(dev, main, &led_init);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register main LED\n");
> +
> +	i = 0;
> +	led_init.devicename = dev_name(main->dev);
> +	led_init.devname_mandatory = true;
> +	led_init.default_label = "led";
> +	leds_node = device_get_named_child_node(dev, "leds");
> +	fwnode_for_each_available_child_node_scoped(leds_node, child) {
> +		led_init.fwnode = child;
> +		led = &display->leds[i];

> +		led->cdev.max_brightness = 1;

That should be set to default by the led core based on the property value, not the case?

> +		led->cdev.brightness_set = tm16xx_led_set;
> +		led->cdev.flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
> +
> +		ret = led_classdev_register_ext(dev, &led->cdev, &led_init);

Why not devm_led_*()?

> +		if (ret) {
> +			dev_err_probe(dev, ret, "Failed to register LED %s\n",
> +				      led->cdev.name);
> +			goto unregister_leds;
> +		}
> +
> +		i++;
> +	}
> +
> +	ret = tm16xx_display_init(display);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to initialize display\n");
> +		goto unregister_leds;
> +	}

> +	ret = linedisp_attach(&display->linedisp, display->main_led.dev,
> +			      display->num_digits, &tm16xx_linedisp_ops);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to initialize line-display\n");
> +		goto unregister_leds;
> +	}

If we haven't yet devm for this, it can be
1) introduced, OR
2) wrapped to become a such (see devm_add_action_or_reset() usage).

> +	return 0;
> +
> +unregister_leds:
> +	while (i--)
> +		led_classdev_unregister(&display->leds[i].cdev);
> +
> +	led_classdev_unregister(main);
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS(tm16xx_probe, "TM16XX");

Needs to be namespaced _GPL variant. Same for all exports.

> +/**
> + * tm16xx_remove() - Remove display, unregister LEDs, blank output
> + * @display: pointer to tm16xx_display
> + */

Unneeded kernel-doc.

> +void tm16xx_remove(struct tm16xx_display *display)
> +{
> +	unsigned int nbits = tm16xx_led_nbits(display);
> +	struct tm16xx_led *led;
> +
> +	linedisp_detach(display->main_led.dev);

> +	/*
> +	 * Unregister LEDs first to immediately stop trigger activity.
> +	 * This prevents LED triggers from attempting to access hardware
> +	 * after it's been disconnected or driver unloaded.
> +	 */

After switching to devm_*() this comment won't be needed (besides that it will
come orphaned).

> +	for (int i = 0; i < display->num_leds; i++) {
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
> +}
> +EXPORT_SYMBOL_NS(tm16xx_remove, "TM16XX");

_GPL

-- 
With Best Regards,
Andy Shevchenko



