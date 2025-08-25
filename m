Return-Path: <linux-leds+bounces-5306-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880FB34570
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 17:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0A0F2A0853
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 15:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B9C2EAB7E;
	Mon, 25 Aug 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2e0Mzee"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38576278771;
	Mon, 25 Aug 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756135114; cv=none; b=UdzGaScjEuHMmUc5jOXMorkRc2nwgEdnP2eYygMXFSIDuWNlvdNMUQQ7FFO5eRYnSdaD136koLS0n/Rl7p+a3xd7Ljvk02vTXZcmDr42rAfD+a68pK5PpztC8deTUZI4HFhsZiOGO+LWej0nEYyYJXcgIb0zfRfQhCE+HPEbX/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756135114; c=relaxed/simple;
	bh=h9WJLP84xwt5wVBtEVeIRNiB8HSbXmFZo3QATGEh0lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZKfY3hJvXxgsfN9fPn30uWSoMuhjpOMM55yDmX8F8cw8m32zomLODzwydUP44dFLBZsbzKoa5RdcIURYIXcsERQq/+bou4es81oAA1Tzf0JG/T9edqaorQLt1uE6RGhke38Egm1eNYYdqi1MiHvWA0UtuPqKyMlbIDvI+Gs/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2e0Mzee; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756135114; x=1787671114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h9WJLP84xwt5wVBtEVeIRNiB8HSbXmFZo3QATGEh0lA=;
  b=U2e0MzeeLf5ay6OJ4C70+Yg2CyfVnkX3K2+yPCXaZP9UM0X6QC2GOA6B
   ekGSv/XQA03Wq4ff2JJCl/0gYE+LWprxaJtLerJxOLJs2yOYYo51Hi1U5
   MiCJgG2wRbTr72aHKQg2AIq3sZIaGsDts+rdV89qFPJ73OM/8g6xzkUVF
   nKM4V0yHoUUfGEGYyeXNd6bOK6EwqYY//xsu0u7782ggAggSZFjPDSUa/
   W6BYzwb7zuXrP+U7+eTecuWZUsbhD4+tqYgDjt2QUqrt5KmYpYTDoLrut
   dNvVPu5thZlRDyQ+GYPoUNRHnIKyUlhG+YNLRq9cgWlam5Bq66dgZ2yvq
   A==;
X-CSE-ConnectionGUID: ecXd5AxdTjqjbL9jN+VoIA==
X-CSE-MsgGUID: ocnny2NPS/GlhSqSprjvdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61994078"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="61994078"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:18:33 -0700
X-CSE-ConnectionGUID: nsjVeU+uShaSsnlrLf1iaQ==
X-CSE-MsgGUID: sdw8uvA5QqmnpiRy9AsieQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169258184"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:18:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqYxo-00000008XmU-0EcN;
	Mon, 25 Aug 2025 18:18:28 +0300
Date: Mon, 25 Aug 2025 18:18:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] auxdisplay: TM16xx: Add support for I2C-based
 controllers
Message-ID: <aKx-w0QOOQPyy9pW@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-6-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825033237.60143-6-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 24, 2025 at 11:32:31PM -0400, Jean-François Lessard wrote:
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

> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

IWYU everywhere, too little header inclusions, you use much more.

> +static int tm16xx_i2c_write(struct tm16xx_display *display, u8 *data, size_t len)
> +{

> +	dev_dbg(display->dev, "i2c_write %*ph", (char)len, data);

Noise.

> +	/* expected sequence: S Command [A] Data [A] P */
> +	struct i2c_msg msg = {
> +		.addr = data[0] >> 1,
> +		.flags = 0,
> +		.len = len - 1,
> +		.buf = &data[1],
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(display->client.i2c->adapter, &msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return (ret == 1) ? 0 : -EIO;

Can we use regmap for all parts of the driver? Why not?

> +}

...

> +static const struct tm16xx_controller fd6551_controller = {
> +	.max_grids = 5,
> +	.max_segments = 7,
> +	.max_brightness = 8,
> +	.max_key_rows = 0,
> +	.max_key_cols = 0,
> +	.init = fd6551_init,
> +	.data = fd655_data,

> +	.keys = NULL,

Redundant initialiser.

> +};

...

> +#if IS_ENABLED(CONFIG_OF)

No, please remove all these ugly ifdefferies.

> +static const struct of_device_id tm16xx_i2c_of_match[] = {
> +	{ .compatible = "titanmec,tm1650", .data = &tm1650_controller },
> +	{ .compatible = "fdhisi,fd6551",   .data = &fd6551_controller },
> +	{ .compatible = "fdhisi,fd655",    .data = &fd655_controller  },
> +	{ .compatible = "winrise,hbs658",  .data = &hbs658_controller },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, tm16xx_i2c_of_match);
> +#endif

...

> +		.of_match_table = of_match_ptr(tm16xx_i2c_of_match),

Definitely no to of_match_ptr(). Must be not used in a new code.

-- 
With Best Regards,
Andy Shevchenko



