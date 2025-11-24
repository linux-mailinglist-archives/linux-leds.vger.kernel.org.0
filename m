Return-Path: <linux-leds+bounces-6301-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C18DAC81B6A
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 17:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 82D30341128
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 16:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8ED314B83;
	Mon, 24 Nov 2025 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNw38J/g"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA82BE05F;
	Mon, 24 Nov 2025 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003242; cv=none; b=V6j1ot5mVF/L5mt/odDXOCST/DL6jYExt+4RkJNur/YpzwALLMXTR+7dCpwCtV3Tp46OilhXZhrUPP5yD93hRZCEvE86cm48TIsc/oo5he+DbRMGQHYqa6I6J+dBAglUz0yh/P9N3XrzCOVsJY7ty1Zqh7lKfDMVtgSGsY4/qTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003242; c=relaxed/simple;
	bh=Mk0Gchkw9MwOg+few64zM2hLS7IZoyhOdqKCDhhfur4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DREiTFl4rbI93ZR8/HeHn4fsA9l2/xq0IRw6j06tJruRsloSxcb1OCMQP+gN2AG48GcC2uPA0zWAJ7GALrh/tSLBHkpUMkJESSaDpwGYQcWw1vjJlMyBeePSv2DDCUfJsYbDEcNVcz7dUYccJZLHwFtc+Z6on6HYlMBcRB/32ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNw38J/g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764003241; x=1795539241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mk0Gchkw9MwOg+few64zM2hLS7IZoyhOdqKCDhhfur4=;
  b=BNw38J/g4d0bUdJNUYGnuOvw4sRnRZx3UqJkXj2W7GifOxiG3xE/wyJP
   O2HlM05CCY7ayjbkJviUZU1vxseL3YU7mPxEYf5Kqu37u7Y/H58e3K2yU
   gPijx+lYNW2FDEZslER4CLUWCO2ukbner3jXFiZxroojuXEIA1I6s/GGm
   EauK+sSH8+QsRzLnJQt/F7zW25H4SpUAXKiEq7U2Vbpk6XVK6NHzpP1eS
   o3hNzkbcjzvUuS7nl7/Ilv/O+IZ7m9yMPboauUumLZSoGzWokvlyH511R
   S4sqjHjtpi+hl04g2DskyWWlxgeCR6RUDi8PZZ9GgpPqD51G42H8qrCIc
   A==;
X-CSE-ConnectionGUID: wewSN0MfRxabBGESRasLJg==
X-CSE-MsgGUID: Ix2D1tpbRwS9jxOYbNSeVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76622098"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="76622098"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:54:00 -0800
X-CSE-ConnectionGUID: bdRNKzb5SOqAlhvhFuHGNA==
X-CSE-MsgGUID: 1rbhavySTTurkuyCQIYaxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192393371"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:53:58 -0800
Date: Mon, 24 Nov 2025 18:53:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/7] auxdisplay: TM16xx: Add support for I2C-based
 controllers
Message-ID: <aSSNoyDOOjG2s1Wl@smile.fi.intel.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
 <20251121145911.176033-7-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121145911.176033-7-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 09:59:06AM -0500, Jean-François Lessard wrote:
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

+ array_size.h

> +#include <linux/bitfield.h>

> +#include <linux/device.h>

Isn't it simply device/devres.h


+ errno.h

> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/types.h>

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

	return tm16xx_probe();

> +}

...

> +static int tm16xx_i2c_read(struct tm16xx_display *display, u8 cmd, u8 *data, size_t len)
> +{
> +	struct i2c_client *i2c = to_i2c_client(display->dev);

> +	/* expected sequence: S Command [A] [Data] [A] P */
> +	struct i2c_msg msgs[1] = {{
> +		.addr = cmd >> 1,
> +		.flags = I2C_M_RD | I2C_M_NO_RD_ACK,
> +		.len = len,
> +		.buf = data,
> +	}};

No array is needed.

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

For u8 / char it's okay to use simple sizeof(). But it's up to you.
Ditto for the rest similar cases.

> +}

...

> +static void hbs658_swap_nibbles(u8 *data, size_t len)
> +{
> +	for (size_t i = 0; i < len; i++)
> +		data[i] = (data[i] << 4) | (data[i] >> 4);
> +}

Perhaps make it part of swab.h?

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

> +static int hbs658_keys(struct tm16xx_display *display)
> +{
> +	u8 cmd, keycode;
> +	int col;
> +	int ret;
> +
> +	cmd = TM16XX_CMD_READ;
> +	hbs658_swap_nibbles(&cmd, 1);
> +	ret = tm16xx_i2c_read(display, cmd, &keycode, 1);
> +	if (ret)
> +		return ret;
> +
> +	hbs658_swap_nibbles(&keycode, 1);

> +	if (keycode != 0xFF) {

Perhaps

	if (keycode == 0xFF) // consider defining 0xFF with useful name
		return;

?

> +		col = FIELD_GET(HBS658_KEY_COL_MASK, keycode);
> +		tm16xx_set_key(display, 0, col, true);
> +	}
> +
> +	return 0;
> +}

...

Probably it is better to split out the additional HW enablement
to separate changes.

-- 
With Best Regards,
Andy Shevchenko



