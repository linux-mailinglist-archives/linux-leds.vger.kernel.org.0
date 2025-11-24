Return-Path: <linux-leds+bounces-6293-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F63C7F2E2
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 08:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B4B94E1704
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 07:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F41A2DCF57;
	Mon, 24 Nov 2025 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvEtXzDo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0742417F2;
	Mon, 24 Nov 2025 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763969497; cv=none; b=SpTYD0Y7Olg+/8Svb4R9/0PJUiQzsJ7XkdckbfXxaF/HTDbvTVku1v6PUsS9LSMysaepTDH/Ek0i8hT/OuF1jNlcUf4FbBF9rYcR1g7gbWi4ezOyZOk/6NmXnoTT0rQkwlDIjBTxMGbX2zud1xpd3JDXzHlfaHJkdK3GEOd2YA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763969497; c=relaxed/simple;
	bh=z/Y+4YCIUV7lLFCSRjb85rkZ6HXZdrhWx4+fo6UvLWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTpVz56lgLNN9grGb9063UJ85DcjH5qntHRaf6Kq/xRwKcqvITzo4YB4UqcmBzaCAvZr0G9Hlz8X+TZgxp3ahrigcGu0naLEgfE7ChNapSXRjKC6Pu4zDrg0Wg23oKfDq1tzclZr5WroKPcKnYtvbjS7mOg3L6lyc00X87H+zJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvEtXzDo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763969495; x=1795505495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z/Y+4YCIUV7lLFCSRjb85rkZ6HXZdrhWx4+fo6UvLWk=;
  b=XvEtXzDoYXDyHYujllAwYi4ltMlECMDvzNpdUOXTemnBLX/4/437fMOy
   sC72u0JRz8VVigt+8zitW/FWRVMiTkmMs9lINBYJJInUPRCscEDi4AuS2
   0EUlVrcqnEw0FiDQWpDVsjgbRnRj9n5C4jAf15FnKHZetyaDg7iCmJpOP
   pxBoaNpSVgGT2MViUKtSZdztbj0f4kM7gel7YVv1krJiZd4er9KJzmasy
   FCwNA5IWMssbgiD1onjdvDDLqNAZCb25kuPh/NBnm5FzeNVXSXsls2uM/
   pBFtI+mppaQHf8pyV8SULtSiQCjfihyOtGjNEx5FxeQIi3WAOCn1Z3W7G
   g==;
X-CSE-ConnectionGUID: f15KJ3WuT6aHbTy9Awm0CQ==
X-CSE-MsgGUID: BT51uxh3RxuLXgiw7I2gSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="66041276"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="66041276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:31:34 -0800
X-CSE-ConnectionGUID: LGcbzO7nQUmnMyussKJi3g==
X-CSE-MsgGUID: ReTjegNbRM+1xpjkDvsnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="193037431"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:31:32 -0800
Date: Mon, 24 Nov 2025 09:31:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] auxdisplay: TM16xx: Add support for I2C-based
 controllers
Message-ID: <aSQJ0sadpeyiuWRh@smile.fi.intel.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com>
 <20250926141913.25919-7-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926141913.25919-7-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Sep 26, 2025 at 10:19:07AM -0400, Jean-François Lessard wrote:
> Add support for TM16xx-compatible auxiliary display controllers connected
> via the I2C bus.
> 
> The implementation includes:
> - I2C driver registration and initialization
> - Probe/remove logic for I2C devices
> - Controller-specific handling and communication sequences
> - Integration with the TM16xx core driver for common functionality
> 
> This allows platforms using TM16xx or compatible controllers over I2C to be
> managed by the TM16xx driver infrastructure.

...

> +	help
> +	  This driver supports the following TM16XX compatible
> +	  I2C (2-wire) 7-segment led display chips:

LED

> +	  - Titanmec: TM1650
> +	  - Fuda Hisi: FD650, FD655, FD6551
> +	  - i-Core: AiP650
> +	  - Winrise: HBS658
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called tm16xx_i2c and you will also get tm16xx for the
> +	  core module.

...

Please, check the include blocks to follow IWYU principle.

+ array_size.h

> +#include <linux/bitfield.h>
> +#include <linux/device.h>

dev_printk.h
device/devres.h

?

+ err

> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>

+ types.h

...

> +static int tm16xx_i2c_probe(struct i2c_client *client)
> +{
> +	const struct tm16xx_controller *controller;
> +	struct tm16xx_display *display;
> +	int ret;
> +
> +	controller = i2c_get_match_data(client);
> +	if (!controller)
> +		return -EINVAL;
> +
> +	display = devm_kzalloc(&client->dev, sizeof(*display), GFP_KERNEL);
> +	if (!display)
> +		return -ENOMEM;
> +
> +	display->dev = &client->dev;
> +	display->controller = controller;
> +
> +	i2c_set_clientdata(client, display);

> +	ret = tm16xx_probe(display);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

	return tm16xx_probe(...);

> +}

...

> +static void tm16xx_i2c_remove(struct i2c_client *client)
> +{
> +	struct tm16xx_display *display = i2c_get_clientdata(client);
> +
> +	tm16xx_remove(display);
> +}

Just provide dem_tm16xx_probe() and drop this.

...

> +static int tm16xx_i2c_read(struct tm16xx_display *display, u8 cmd, u8 *data, size_t len)
> +{
> +	struct i2c_client *i2c = to_i2c_client(display->dev);
> +
> +	/* expected sequence: S Command [A] [Data] [A] P */
> +	struct i2c_msg msgs[1] = {{

Why an array out of a sudden? Previous function coped with just a single structure.

> +		.addr = cmd >> 1,
> +		.flags = I2C_M_RD | I2C_M_NO_RD_ACK,
> +		.len = len,
> +		.buf = data,
> +	}};
> +	int ret;
> +
> +	ret = i2c_transfer(i2c->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret < 0)
> +		return ret;
> +
> +	return (ret == ARRAY_SIZE(msgs)) ? 0 : -EIO;
> +}

...

> +static int tm1650_init(struct tm16xx_display *display)
> +{
> +	const enum led_brightness brightness = display->main_led.brightness;
> +	u8 cmds[2];
> +
> +	cmds[0] = TM1650_CMD_CTRL;
> +	cmds[1] = TM16XX_CTRL_BRIGHTNESS(brightness, brightness, TM1650) |
> +		  TM1650_CTRL_SEG8_MODE;
> +
> +	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));

For cases of char / u8 the sizeof() is fine.

> +}
> +
> +static int tm1650_data(struct tm16xx_display *display, u8 index,
> +		       unsigned int grid)
> +{
> +	u8 cmds[2];
> +
> +	cmds[0] = TM1650_CMD_ADDR + index * 2;
> +	cmds[1] = grid; /* SEG 1 to 8 */
> +
> +	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));

Ditto.

> +}

...

> +static void hbs658_swap_nibbles(u8 *data, size_t len)
> +{
> +	for (size_t i = 0; i < len; i++)
> +		data[i] = (data[i] << 4) | (data[i] >> 4);
> +}

At least these ones
drivers/iio/adc/mcp320x.c:158:          *val = (adc->rx_buf[0] << 4 | adc->rx_buf[1] >> 4);
drivers/mtd/tests/nandbiterrs.c:83:     c = (c & 0x0F) << 4 | (c & 0xF0) >> 4;
drivers/usb/atm/ueagle-atm.c:2072:      sc->ovl = intr->e1_bOvl >> 4 | intr->e1_bOvl << 4;

use the same code (and I believe more, but that needs a bit more sophisticated `grep`).

Perhaps make it a part of include/linux/swab.h

as

static inline void swab_nibbles(u8 *buf, unsigned int words)
{
	...
}

in a separate patch?

...

> +static int hbs658_init(struct tm16xx_display *display)
> +{
> +	const enum led_brightness brightness = display->main_led.brightness;
> +	u8 cmd;
> +	int ret;
> +
> +	/* Set data command */
> +	cmd = TM16XX_CMD_WRITE | TM16XX_DATA_ADDR_AUTO;
> +	hbs658_swap_nibbles(&cmd, 1);
> +	ret = tm16xx_i2c_write(display, &cmd, 1);
> +	if (ret)
> +		return ret;
> +
> +	/* Set control command with brightness */
> +	cmd = TM16XX_CMD_CTRL |
> +	      TM16XX_CTRL_BRIGHTNESS(brightness, brightness - 1, TM16XX);
> +	hbs658_swap_nibbles(&cmd, 1);

> +	ret = tm16xx_i2c_write(display, &cmd, 1);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

	return tm16xx_i2c_write(display, &cmd, 1);

> +}

...

> +	if (keycode != 0xFF) {

Hmm... Maybe


	if (keycode == 0xFF)
		return 0;

?

Also you use 0xFF magic several times. If it's the same semantically, define it
with name and use everywhere, if it's different we need either comments or a
few definitions for each semantically different case.

> +		col = FIELD_GET(HBS658_KEY_COL_MASK, keycode);
> +		tm16xx_set_key(display, 0, col, true);
> +	}
> +
> +	return 0;

-- 
With Best Regards,
Andy Shevchenko



