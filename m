Return-Path: <linux-leds+bounces-6502-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF93CE9940
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 12:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C165301AD0E
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 11:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7497228D850;
	Tue, 30 Dec 2025 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWz/um5f"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6622E21D3E2;
	Tue, 30 Dec 2025 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095576; cv=none; b=jA3Ux3qbqv7kMB97NBxi7d3uHafXfRkwMfglaFiG78ztiEYmbLH7K9bFCFTwlLhNdH3coLHnfgeq04VJ8D6t/S5j/jF5y5bzqa2rPEQ7Xh9yRU2s3raflRc85snZFTWdNMFjWaN5CrtmvglwA6g4QPXOz8LUxaKPOhd1kbLkvSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095576; c=relaxed/simple;
	bh=DyG/NBWFjlnp6gw/HvFPV7VaCL6s+CiYdsTAmppZNVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oohkq0el8uqXdBPMowMUJgwtTQ7av3gdDcDLNbuMeQPHJgLEJeeX6JDRL/7UQjpUUfHZvGyvjr+lxSLhQH7R+62S2o1+DX4OdSHoZU04JLcvxUMG7YeQtLTYMxt+dDgVXlykSjeGQEAqJpRcVtyH8UCom7RsE+ah9A7Py0E4YRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWz/um5f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767095575; x=1798631575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyG/NBWFjlnp6gw/HvFPV7VaCL6s+CiYdsTAmppZNVo=;
  b=MWz/um5fX+r8/T59SIudnnwlrz5ilPDX5YbXU92Q91/on4oE+V9K3hRQ
   IEQcz7em7SX8wRCR0AwaT24YMi2opbZhb3g76LskNch55355tszDUscI0
   bXvKd1b+mkmIBdji/fkjN4WjSJCm4eDdssbjmoaCJMtHQv1UvQpiLpyUN
   JmTsTspozcuCPAvahw8DaXSRH8A2hpt0TgaCteVC+YQ0vBBeVlGavbgBZ
   Su62799Fp2PtivCoSazackvkicqKzEPxenNmygonDE6bTNnpHgEU2sqbR
   0G95dJ3dxr8ojDqxh0m27t4d9TJ15Z+fI5ZW1NfsDeTjVTiFBCOm4cMoD
   A==;
X-CSE-ConnectionGUID: J+AYdzBWTE2e5GSVL5tWSQ==
X-CSE-MsgGUID: RITGmkgDTHeojw7e+yA9ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72533954"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72533954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:52:54 -0800
X-CSE-ConnectionGUID: C9wOAXjHQ+Czwg1y4hoF6Q==
X-CSE-MsgGUID: wKDKwmi+QEqJEkFk/pU4WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200343987"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:52:52 -0800
Date: Tue, 30 Dec 2025 13:52:49 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 4/7] ABI: Add sysfs documentation for
 leds-group-virtualcolor
Message-ID: <aVO9EWB80PwqrHBn@smile.fi.intel.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20251230082336.3308403-5-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230082336.3308403-5-professorjonny98@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 30, 2025 at 09:23:17PM +1300, Jonathan Brophy wrote:
> 
> Document the sysfs ABI for the virtual LED group driver, including:
> 
> - mc/multi_intensity: Per-channel intensity control (0-255)
> - mc/multi_index: Channel-to-color-ID mapping (read-only)
> - mc/multi_multipliers: Per-channel scale factors (read-only)
> - brightness: Master brightness control with arbitration trigger
> - max_brightness: Maximum brightness value (mode-dependent)
> 
> Channel ordering is deterministic, sorted by ascending LED_COLOR_ID
> value. For RGBW LEDs, white (ID=0) appears first, followed by RGB.
> 
> The multi_intensity attribute is rate-limited to 100 updates/second
> per virtual LED by default, with counters visible in debugfs when
> CONFIG_DEBUG_FS is enabled.

...

> +Date:		December 2024
> +KernelVersion:	6.x

Both fields better to be filled with help of prediction crystal ball:
https://hansen.beer/~dave/phb/

Take the -rc1 or .0 date of the expected release (as of now 6.20.

Ditto for all new documented attributes.


...

> +		Example (RGB LED with 3 channels):
> +		  $ cat /sys/class/leds/myled/mc/multi_index
> +		  1 2 3
> +		  $ cat /sys/class/leds/myled/mc/multi_intensity
> +		  255 128 0
> +		  $ echo "128 64 200" > /sys/class/leds/myled/mc/multi_intensity

I believe for the arrays we use ',' (comma) as a separator.

> +		Note: In standard mode (led-mode = "standard"), intensity
> +		changes are rejected with -EPERM and the color is fixed by the
> +		channel multipliers defined in the device tree. In multicolor
> +		mode (led-mode = "multicolor", default), intensity can be
> +		freely modified.
> +
> +		This attribute is rate-limited to prevent system overload
> +		(default: 100 updates/second per virtual LED). Excessive
> +		updates will be silently dropped with incremented rate limit
> +		counters (visible in debugfs when CONFIG_DEBUG_FS enabled).

...

> +		Common color ID values:
> +		  - 0: LED_COLOR_ID_WHITE
> +		  - 1: LED_COLOR_ID_RED
> +		  - 2: LED_COLOR_ID_GREEN
> +		  - 3: LED_COLOR_ID_BLUE
> +		  - 4: LED_COLOR_ID_AMBER
> +		  - 5: LED_COLOR_ID_VIOLET
> +		  - 6: LED_COLOR_ID_YELLOW
> +		  - 7: LED_COLOR_ID_IR
> +		  - 8: LED_COLOR_ID_MULTI
> +		  - 9: LED_COLOR_ID_RGB
> +		  - 10: LED_COLOR_ID_UV

This doesn't seem to be scalable. Better to use plain color names I think.
In that case the indexing schema is kept internal to the kernel.

...

> +		Example (RGB LED):
> +		  $ cat /sys/class/leds/myled/mc/multi_index
> +		  1 2 3
> +		  (Shows: red=1, green=2, blue=3)
> +
> +		Example (RGBW LED):
> +		  $ cat /sys/class/leds/myled/mc/multi_index
> +		  0 1 2 3
> +		  (Shows: white=0, red=1, green=2, blue=3)

With my proposal it will be

		  (Shows: white,red,green,blue)

and note that if kernel wants to change index, it's flexible to do so and user
space will work the same way as it will keep their own index mapping if they
need so.

The

		  (Shows: red,green,blue,white)

is more aligned with the RGBW given name in your example.

-- 
With Best Regards,
Andy Shevchenko



