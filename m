Return-Path: <linux-leds+bounces-5318-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553CB36DA0
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 17:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA672163EDD
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 15:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FB4223DE5;
	Tue, 26 Aug 2025 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUMZmKiU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02023875D;
	Tue, 26 Aug 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756221785; cv=none; b=GeMteeAWMr0D1tjKOduHjjZrZOYQtBz+cNr6H9c5eydFN2SkJHyqL8M9Y6AXOslCIQ8aGa1KgVdeOQtZztZf36PPnrXUWyKz+ckQWoVV/ar8FQXMVhKW42XaezfLmv+QBXQj6SeA7iJT0NHcJhMUY9iEjQXN2DJR6dooHsKK2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756221785; c=relaxed/simple;
	bh=BZuK+TBMT4BMUx4VSTl6olbTXsQYlv9hDSt/enMKmCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn00zJZ8R3pdPvBk/kkw4Keo/11mHUWQQ2Twa14u9k9FaxMD3GAb/s0p2NdPzn9Riq1CHO8iqzTEc89X5tIUAVRXpBBiBpLV3qybSY2gkbPixV1K47Wol4e7UMLijsFA20zO7TqwDFCQJTMDkFDPJfdKaHvjDhEDAlbkU4Yt2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUMZmKiU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756221783; x=1787757783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BZuK+TBMT4BMUx4VSTl6olbTXsQYlv9hDSt/enMKmCA=;
  b=DUMZmKiUleAJLKo5k22//qbLBkyioXixWpCUX2N/c0gniS0RlEb9Ys/q
   o4GXBEGliRETwZNJ800Z90ADESS/dnkGWicufQ2i18vgtqVp2+BuyNjwR
   R7lYDKeCEWB+oGC5jtHl6h0gtu+Xglh0Xs6RRXDV8X4zFNbXZAMGuYtXc
   bIdi1tgBAnfix7+Lz5b9p+c+hH+pLohp26zFlCA9VkCqZbBdb8KyQpSLy
   Qdg7pN2qIxupFbYYjwtTQfU1jPXNAdXFTVCgmAcoZwVEAOvgwCKDToSZ5
   9H7txedr1xlPZdBgd7Wm7B0BPUY5UdHeBp+L5UzmY5IyCrz6Qa3yPBrXE
   w==;
X-CSE-ConnectionGUID: 7BW5ajiRQ4+/ThRQ8cfw1g==
X-CSE-MsgGUID: bq6KyoHrQeaqzSUmi4/KXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69899005"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69899005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:23:03 -0700
X-CSE-ConnectionGUID: na3KtayEQWGbtC/OX3RNfQ==
X-CSE-MsgGUID: /LK6KlhJSySEWagjiYYI6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200545338"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:23:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqvVh-00000008oUb-0Mng;
	Tue, 26 Aug 2025 18:22:57 +0300
Date: Tue, 26 Aug 2025 18:22:56 +0300
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
Message-ID: <aK3RUIt0O-uzEo4-@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-4-jefflessard3@gmail.com>
 <aKx9zQNppjNNMJEt@smile.fi.intel.com>
 <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 25, 2025 at 01:48:45PM -0400, Jean-François Lessard wrote:
> Le 25 août 2025 11 h 14 min 21 s HAE, Andy Shevchenko <andriy.shevchenko@intel.com> a écrit :
> >On Sun, Aug 24, 2025 at 11:32:29PM -0400, Jean-François Lessard wrote:

...

> >> +Date:		August 2025
> >> +KernelVersion:	6.17
> >
> >The Date should be approximate date of the kernel release (alternatively, -rc1
> >of that). The version is estimated version where ABI can be found first.

> >Both of these need to be changed.
> 
> Given that 6.17-rc3 was just released, should I target 6.18 for the kernel
> version and use a March 2025 date for the estimated release timeframe?

6.18
The date is not in the past, obviously. You can consult with this site:
https://hansen.beer/~dave/phb/

...

> >So, the driver is under auxdisplay, but at the same time it completely relies
> >on LED subsystem... What's going on here?
> 
> The design integrates with the LED subsystem for two main reasons:
> 
> 1. Brightness control:
> The entire display brightness is controlled at the display level
> (individual LED icons can only be on/off via their brightness attributes).
> The LED subsystem provides established mechanisms for this.
> 
> 2. Coherent sysfs interface:
> This provides consistent /sys/class/leds/display for display-level controls
> and /sys/class/leds/display::{function} for individual icons.
> 
> I'm seeking your guidance on the best design for the auxdisplay subsystem.
> 
> >Btw, have you seen
> >https://lore.kernel.org/linux-leds/20231011190017.1230898-1-wse@tuxedocomputers.com/
> >? And  if so, what're your takeaways? (Yes, I know that's about different HW)
> 
> I've read the thread but I'm not clear on the specific point you're making.
> Could you clarify what aspect I should focus on?

If you have a LED matrix, perhaps we can consider different approaches as well.
(It's all about the current HW, is it a 7-segment or arbitrary display, if the
 former, that discussion is unrelated)

> (Though, my personal opinion is that using auxdisplay for keyboard LEDs
> doesn't really make sense. I think it would be better to properly implement
> it the required mechanism into input subsystem, with maybe some
> integration with the leds subsystem. Just a quick opinion, I do not
> master all aspects of this question at all.)

...

> >> + * Copyright (C) 2024 Jean-François Lessard
> >
> >My calendar shows something different.
> 
> The original code was developed in 2024, though it's being submitted in 2025.

But haven't you changed it in 2025?

...

> >> +#include <linux/bitmap.h>
> >
> >Is this used?
> 
> Yes, display->state is a bitmap. I'll move this include to tm16xx_core.c
> since it's not used in the header itself.

Yes, that's what I meant "used by this header file".

...

> >> +	union {
> >> +		struct i2c_client *i2c;
> >> +		struct spi_device *spi;
> >> +	} client;
> >
> >Why? Just drop it. struct device *dev is enough and I can't see the need
> >in this at all.
> 
> I'll remove this union and use container_of(dev, struct i2c_client, dev)
> or container_of(dev, struct spi_device, dev) where the specific client type
> is needed.

This is in correlation with the regmap proposal.

...

> >> +static ssize_t tm16xx_map_seg7_show(struct device *dev,
> >> +				    struct device_attribute *attr, char *buf)
> >> +{
> >> +	memcpy(buf, &map_seg7, sizeof(map_seg7));
> >> +	return sizeof(map_seg7);
> >> +}
> >
> >Can we use LINEDISP library?
> 
> I considered this but have two concerns:
> 
> 1. It creates attributes under a virtual "linedisp.{n}" device,
> which conflicts with the coherent LED sysfs design

It creates the specific attributes for the 7-segment HW, So look at it
from this angle. We have well established library and we expect 7-seg
drivers will use it to make sure that user space may be written in uniform
way.

> 2. Messages scroll indefinitely. There should be control for single-pass scrolling

If we miss that, add it to linedisp. I wouldn't mind, actually I will be in
favour of the development of that library.

> I'm willing to contribute improvements to line-display if needed,
> but this depends on resolving the main LED design question above.

...

> >> +		display->num_digits = 0;
> >> +		fwnode_for_each_child_node(digits_node, child)
> >> +			display->num_digits++;
> >
> >Don't we have a _count API for this?
> 
> I'll use device_get_child_node_count() instead of manual counting loops.

fwnode_get_child_node_count() I assume you meant.

...

> >> +	dev_dbg(dev, "Number of grids: %u\n", display->num_grids);
> >> +	dev_dbg(dev, "Number of segments: %u\n", display->num_segments);
> >
> >I didn't get this. You mean that they are not strictly 7-segment ones?
> 
> The terminology is confusing - "segment" is used both for 7-segment digits
> (which are indeed 7-segment) and for controller matrix coordinates
> (grid,segment) from datasheets. Controllers support varying numbers of segments
> For individual LED icons, not necessarily related to 7-segment displays.
> I'll add a comment to clarify this distinction.

Hmm... Maybe try to rename these 'segments' to something else, like 'hwseg'
(find a better name).

...

> >> +	/* Initialize main LED properties */
> >> +	if (dev->of_node)
> >> +		main->name = dev->of_node->name;
> >> +	if (!main->name)
> >> +		main->name = "display";
> >> +	device_property_read_string(dev, "label", &main->name);
> >
> >My gosh. This is done in the LED core if we even need this...
> 
> This relates to the LED subsystem integration question. If my design approach
> is acceptable, I'll review the LED core implementation to avoid duplicating
> this logic if possible.

I think if you integrate LED for special LED icons and linedisp for 7-segment
into a single driver, it's fine. I just can't speak about LED icons case.
The 7-seg LGTM (assuming linedisp and other existing APIs/ABIs to use, if required).

-- 
With Best Regards,
Andy Shevchenko



