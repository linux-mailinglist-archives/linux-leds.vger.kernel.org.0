Return-Path: <linux-leds+bounces-6299-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFEC8015F
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 12:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B97BA3457C1
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 11:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFD52727E5;
	Mon, 24 Nov 2025 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYkAWyWp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470B27A130;
	Mon, 24 Nov 2025 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763982361; cv=none; b=b2TYOZb2+IisUCqOiOifyECOAjYJsf0z5vgy7u2lQSnUa53JNnVmMLC5Ni9CfTJabecF1xRo8Qx85TLsC23L384HHxP374pvIfIBhR2Z2WCC3mH4p5/+P+jRSHiwA4JFyIVpdQSGgWl88Yocm2EByuzeQX+dCqd3XhgEsZNqnt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763982361; c=relaxed/simple;
	bh=KVvFmZoFRCdXCC9ErhNOGJuKMwgdTjyDPQxQPElqDP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX2bmAuQXZZa9/qXN6rzshD9O6dFwiHvzBNGLXq1BiqaD7jCat3Ig2DCpJ7Rj33EfENi+IPTR5TpbbIRAJw4sTX/654/wOhhtl4s+ShsjddVN4BsUT6sbj7/6JnE3wsUfCGDVx6XBWsGfd5O2LBDw9XDxOS9UQ7clhI6v2EgR/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYkAWyWp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763982359; x=1795518359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KVvFmZoFRCdXCC9ErhNOGJuKMwgdTjyDPQxQPElqDP4=;
  b=IYkAWyWpQqLOp7cdPCvFWou8WQDFurIkOsOt1NN3SLbr94jBbQu8f5Hl
   uHI1W4RGDJumO2H40V//illMPoHgRhcc++NDwPJo8GPVLs4SzpLMEIHUV
   j6EmEVicIjqAZGLpN8MJvGcUeyDpntQSI2pB3O+blflYR0AK2lBotC9AA
   DgX2zluP4zHnmWO2ZXUtwmiKm+jDlTQyGXkx+qEVDX3HytMTbNi509wVH
   J6TiZTtKPocgBV+DPhKdwuhQpuBoS/hvMf8kdBaAGSMfSZlhb5vrTxnQp
   PTNySGfakJr7R9onoJWtU3nBUOOxc9k5/Ng1u4AlKSYg23E7wW7TyqjCR
   w==;
X-CSE-ConnectionGUID: oy92ah6HT8+iWRM8+ldMdg==
X-CSE-MsgGUID: aY0KXXjSSq6d1vBcTKjaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="66018967"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="66018967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 03:05:58 -0800
X-CSE-ConnectionGUID: kVFEGw3TSSqfaElwQEfjWA==
X-CSE-MsgGUID: zW+qQPlWSgmPU2Ii8FrJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="215647864"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 03:05:56 -0800
Date: Mon, 24 Nov 2025 13:05:53 +0200
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
Subject: Re: [PATCH v6 4/7] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <aSQ8EeIEZDIpThtm@smile.fi.intel.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
 <20251121145911.176033-5-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121145911.176033-5-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 09:59:04AM -0500, Jean-François Lessard wrote:
> Add driver for TM16xx family LED controllers and compatible chips from
> multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and
> Winrise. These controllers drive 7-segment digits and individual LED icons
> through either I2C or SPI buses.
> 
> Successfully tested on various ARM TV boxes including H96 Max, Magicsee N5,
> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platforms
> (Rockchip, Amlogic, Allwinner).

...

> +/* I2C controller addresses and control settings */
> +#define TM1650_CMD_CTRL		0x48
> +#define TM1650_CMD_READ		0x4F
> +#define TM1650_CMD_ADDR		0x68
> +#define TM1650_CTRL_BR_MASK	GENMASK(6, 4)
> +#define TM1650_CTRL_ON		(1 << 0)
> +#define TM1650_CTRL_SLEEP	(1 << 2)
> +#define TM1650_CTRL_SEG_MASK	BIT(3)
> +#define TM1650_CTRL_SEG8_MODE	(0 << 3)
> +#define TM1650_CTRL_SEG7_MODE	(1 << 3)
> +#define TM1650_KEY_ROW_MASK	GENMASK(1, 0)
> +#define TM1650_KEY_COL_MASK	GENMASK(5, 3)
> +#define TM1650_KEY_DOWN_MASK	BIT(6)
> +#define TM1650_KEY_COMBINED	GENMASK(5, 3)

> +#define FD655_CMD_CTRL		0x48
> +#define FD655_CMD_ADDR		0x66
> +#define FD655_CTRL_BR_MASK	GENMASK(6, 5)
> +#define FD655_CTRL_ON		(1 << 0)
> +
> +#define FD6551_CTRL_BR_MASK	GENMASK(3, 1)
> +#define FD6551_CTRL_ON		(1 << 0)
> +
> +#define HBS658_KEY_COL_MASK	GENMASK(7, 5)

I'm wondering if splitting adding these chips to the separate patches gives us
better first one and the rest from the review / understanding perspective?

> +#define TM16XX_CTRL_BRIGHTNESS(on, val, prefix) \
> +	((on) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (val)) | prefix##_CTRL_ON) : 0)
> +
> +/* Forward declarations */
> +struct device;

+ blank line.

> +struct tm16xx_display;
> +struct tm16xx_digit;
> +struct tm16xx_led;

...

> +struct tm16xx_display {

Run `pahole` and try to find a compromise to group and save a few bytes here
and there.

> +	struct device *dev;
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

...

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/leds.h>
> +#include <linux/map_to_7segment.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/property.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

...

> +static void tm16xx_display_flush_data(struct work_struct *work)
> +{
> +	struct tm16xx_display *display = container_of(work, struct tm16xx_display, flush_display);

What about...

	struct device *dev = display->dev;

> +	unsigned int grid, i;

> +	int ret = 0;

Drop.


> +	if (!display->controller->data)
> +		return;
> +
> +	guard(mutex)(&display->lock);

	display->flush_status = 0; // do we even need this?

> +	for (i = 0; i < display->num_hwgrid; i++) {
> +		grid = tm16xx_get_grid(display, i);
> +		ret = display->controller->data(display, i, grid);
> +		if (ret) {
> +			dev_err(display->dev, "Failed to write display data: %d\n", ret);
> +			break;
> +		}

		display->flush_status = display->controller->data(display, i, grid);
		if (display->flush_status) {
			dev_err(dev, "Failed to write display data: %d\n", display->flush_status);
			return;
		}

> +	}

> +	display->flush_status = ret;

Drop.


?

> +}

...

> +static int tm16xx_display_value(struct tm16xx_display *display, const char *buf, size_t count)
> +{
> +	struct linedisp *linedisp = &display->linedisp;
> +	struct linedisp_map *map = linedisp->map;

	struct device *dev = display->dev;

> +	struct tm16xx_digit *digit;
> +	int seg_pattern, ret = 0;
> +	unsigned int i, j;
> +	bool val;
> +
> +	for (i = 0; i < display->num_digits; i++) {
> +		digit = &display->digits[i];
> +
> +		if (i < count) {
> +			seg_pattern = map_to_seg7(&map->map.seg7, buf[i]);
> +			if (seg_pattern < 0) {
> +				dev_err(display->dev,
> +					"Invalid mapping to 7 segment at position %u: %c",
> +					i, buf[i]);

> +				ret = -EINVAL;

Why shadowing error code?

> +				seg_pattern = 0;


			ret = map_to_seg7(&map->map.seg7, buf[i]);
			if (ret < 0) {
				dev_err(dev, "Invalid mapping to 7 segment at position %u: %c",
					i, buf[i]);
				seg_pattern = 0;
			} else {
				seg_pattern = ret;
			}

?

> +			}
> +		} else {
> +			seg_pattern = 0;
> +		}
> +
> +		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
> +			val = seg_pattern & BIT(j);
> +			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
> +		}
> +	}
> +
> +	schedule_work(&display->flush_display);
> +	return ret;
> +}

...

> +static int tm16xx_parse_fwnode(struct device *dev, struct tm16xx_display *display)
> +{
> +	unsigned int max_hwgrid = 0, max_hwseg = 0;
> +	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
> +	struct tm16xx_digit *digit;
> +	struct tm16xx_led *led;
> +	unsigned int i, j;
> +	u32 reg[2];
> +	int ret;
> +
> +	struct fwnode_handle *digits_node __free(fwnode_handle) =
> +		device_get_named_child_node(dev, "digits");
> +	struct fwnode_handle *leds_node __free(fwnode_handle) =
> +		device_get_named_child_node(dev, "leds");
> +
> +	/* parse digits */
> +	display->num_digits = fwnode_get_child_node_count(digits_node);
> +	if (display->num_digits) {
> +		display->digits = devm_kcalloc(dev, display->num_digits,
> +					       sizeof(*display->digits), GFP_KERNEL);

		display->digits = devm_kcalloc(dev, display->num_digits, sizeof(*display->digits),
					       GFP_KERNEL);

I prefer logical split.

> +		if (!display->digits)
> +			return -ENOMEM;
> +
> +		i = 0;
> +		fwnode_for_each_available_child_node_scoped(digits_node, child) {
> +			digit = &display->digits[i];
> +
> +			ret = fwnode_property_read_u32(child, "reg", reg);
> +			if (ret)
> +				return ret;
> +
> +			ret = fwnode_property_read_u32_array(child, "segments", segments,
> +							     TM16XX_DIGIT_SEGMENTS * 2);

ARRAY_SIZE() ?

> +			if (ret < 0)
> +				return ret;
> +
> +			for (j = 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
> +				digit->hwgrids[j] = segments[2 * j];
> +				digit->hwsegs[j] = segments[2 * j + 1];
> +				max_hwgrid = umax(max_hwgrid, digit->hwgrids[j]);
> +				max_hwseg = umax(max_hwseg, digit->hwsegs[j]);
> +			}
> +			i++;
> +		}
> +	}
> +
> +	/* parse leds */
> +	display->num_leds = fwnode_get_child_node_count(leds_node);
> +	if (display->num_leds) {
> +		display->leds = devm_kcalloc(dev, display->num_leds,
> +					     sizeof(*display->leds), GFP_KERNEL);

Ditto (logical split).

> +		if (!display->leds)
> +			return -ENOMEM;
> +
> +		i = 0;
> +		fwnode_for_each_available_child_node_scoped(leds_node, child) {
> +			led = &display->leds[i];
> +			ret = fwnode_property_read_u32_array(child, "reg", reg, 2);

ARRAY_SIZE() ?

> +			if (ret < 0)
> +				return ret;
> +
> +			led->hwgrid = reg[0];
> +			led->hwseg = reg[1];
> +			max_hwgrid = umax(max_hwgrid, led->hwgrid);
> +			max_hwseg = umax(max_hwseg, led->hwseg);
> +			i++;
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

> +int tm16xx_probe(struct tm16xx_display *display)
> +{
> +	struct led_classdev *main = &display->main_led;
> +	struct led_init_data led_init = {};
> +	struct device *dev = display->dev;
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
> +		return ret;

> +	/*
> +	 * Explicit (non-devm) resource management and specific order shutdown sequence
> +	 * required to prevent hardware access races when triggers attempt to update
> +	 * the display during removal:
> +	 * 1. unregister LEDs to stop triggers
> +	 * 2. clear display
> +	 * 3. turn off display
> +	 */

Can we drop using devm at all, since this is misleading now that we need to
call a ->remove() while the ->probe() is _partially_ managed.

> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
> +	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);

This can be moved down, right?

> +	/* Initialize main LED properties */
> +	led_init.fwnode = dev_fwnode(dev);
> +	/* max_brightness: handle default value and enforce hardware ceiling */
> +	main->max_brightness = display->controller->max_brightness;
> +	device_property_read_u32(dev, "max-brightness", &main->max_brightness);
> +	main->max_brightness = umin(main->max_brightness,
> +				    display->controller->max_brightness);
> +
> +	/* brightness: handle default value and enforce max ceiling */
> +	main->brightness = main->max_brightness;
> +	device_property_read_u32(dev, "default-brightness", &main->brightness);
> +	main->brightness = umin(main->brightness, main->max_brightness);
> +
> +	main->brightness_set = tm16xx_brightness_set;
> +	main->flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;

At least somewhere here.

> +	/* Register individual LEDs from device tree */
> +	ret = led_classdev_register_ext(dev, main, &led_init);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register main LED\n");

Does this actually allow already to have a work queued? If not, then move
initialisation even further.

> +	i = 0;
> +	led_init.devicename = dev_name(main->dev);
> +	led_init.devname_mandatory = true;
> +	led_init.default_label = "led";
> +	leds_node = device_get_named_child_node(dev, "leds");
> +	fwnode_for_each_available_child_node_scoped(leds_node, child) {
> +		led_init.fwnode = child;
> +		led = &display->leds[i];
> +		/* Individual leds are hardware-constrained to on/off */
> +		led->cdev.max_brightness = 1;
> +		led->cdev.brightness_set = tm16xx_led_set;
> +		led->cdev.flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
> +
> +		ret = led_classdev_register_ext(dev, &led->cdev, &led_init);
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
> +
> +	ret = linedisp_attach(&display->linedisp, display->main_led.dev,
> +			      display->num_digits, &tm16xx_linedisp_ops);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to initialize line-display\n");
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
> +EXPORT_SYMBOL_NS_GPL(tm16xx_probe, "TM16XX");

-- 
With Best Regards,
Andy Shevchenko



