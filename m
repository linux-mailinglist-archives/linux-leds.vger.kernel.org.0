Return-Path: <linux-leds+bounces-6503-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A642CE99B8
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 13:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89503301D661
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 12:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC28C266B46;
	Tue, 30 Dec 2025 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldPyPCB4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90FB24DCF6;
	Tue, 30 Dec 2025 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096055; cv=none; b=XId+EZkpk6PK2kTM7lc6MZ2BRMyFSu7QZa1hmIENIfKa4HLWWulorWUG8mWwngOBHESsKX2pkKxg8enZTMJCa3IEC1TPxV+GqUstja55GpstClOUIscb8erbCQHPnHGTJXB8I8rUe1YnD20B/XEBy6JcAWcnoaSxn8NOzbl4G5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096055; c=relaxed/simple;
	bh=dlzQfEVicTnlKzg65AYi+wDmkQ9R2c7GYd/RI0N0onI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syKIR7Nsp3Xncs1rb5Q2VXgyVQWX8NMJUlOg/MC8GwBMNnKhLpkFgd8pNmu1mopqquIGDmNmJ5ueAeXYcCSZfUTQvuwwSFNiYhnvtLzqons4SXqYRDsGJRDOSbpP2iS2cqeDG1KvmdFmnSrAQooWgnjPVKtX7cNF6V9YmMioD34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldPyPCB4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767096054; x=1798632054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dlzQfEVicTnlKzg65AYi+wDmkQ9R2c7GYd/RI0N0onI=;
  b=ldPyPCB4BvaDSM0Hi6HKJRun8Iwi9SvOg4WV5YAeyMlnnfEbb81I4W96
   s9czsc9+QY4e0vZ6dTF76d444xcGrysR0u7c4TbS/J4Mum0Sb5GWmmabr
   sqVUcxp+Yd2m6tuUiabpgHqHZWtDSmLyAjYCmA72T2m+VB5eefwpzB5ez
   c6pkyepf8pHk/jY6Icujny+O8iq+wgyo5vFUXPFFM9WuKBnayGfjGKnFD
   gGOQZeXZ6PPkMKs3QdMsgM+Rxk8FJJThjLNz61e7y5B4msSUeI9HnDdZx
   AAW9+7XLjLuOiH5/a4PHJ0P2Gc14mXg7EVYDowLy5tNWZfroaOw59Gb1O
   Q==;
X-CSE-ConnectionGUID: 3knKXs9zT5mKw+qPaAJDQA==
X-CSE-MsgGUID: NMCQq5yLTw66eaXyL77DFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72534561"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72534561"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:00:54 -0800
X-CSE-ConnectionGUID: 4SwGugV8Qj2KALQvnK9SbA==
X-CSE-MsgGUID: SmwFsLFlREiDOUxlLRcvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231873036"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:00:50 -0800
Date: Tue, 30 Dec 2025 14:00:48 +0200
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
Subject: Re: [PATCH v5 6/7] leds: Add fwnode_led_get() for firmware-agnostic
 LED resolution
Message-ID: <aVO-8IK5yuES-m6d@smile.fi.intel.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20251230082336.3308403-7-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230082336.3308403-7-professorjonny98@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 30, 2025 at 09:23:19PM +1300, Jonathan Brophy wrote:

> Add fwnode_led_get() to resolve LED class devices from firmware node
> references, providing a firmware-agnostic alternative to of_led_get().
> 
> The function supports:
> - Device Tree and ACPI systems

...and software nodes (board files) I think also fall into this category.

> - GPIO LEDs (which may lack struct device)
> - Platform LED controllers
> - Deferred probing via -EPROBE_DEFER
> - Reference counting via led_module_get()
> 
> Implementation details:
> - Uses fwnode_property_get_reference_args() for property traversal
> - Falls back to of_led_get() for Device Tree GPIO LEDs
> - Returns optional parent device reference for power management
> - Handles NULL parent devices gracefully (common for GPIO LEDs)
> 
> This enables LED resolution using generic firmware APIs while
> maintaining compatibility with existing OF-specific LED drivers.
> Future migration to full fwnode support in LED core will be
> straightforward.

...

> -	return sysfs_emit(buf, "%u\n", brightness);
> +	return sprintf(buf, "%u\n", brightness);

Huh?!

This seems like indeliberate revert. Otherwise it's so wrong.

Ditto. for all same issues.

...

> -static const BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
> -static const struct bin_attribute *const led_trigger_bin_attrs[] = {
> +static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);

Why?! Don't we have a mechanism to add more groups on-the-fly?

...

> +#define LED_BLINK_BRIGHTNESS_CHANGE 	4

Mixed TABs and spaces.

...

> +	unsigned 	gpio;

Ditto.
Besides we should get rid of this completely (it's deprecated APIs that is on
removal stage).

...

> +	int 		num_leds;

TABs/spaces mix.

...

I have a felling that this patch is doing too many things at once. Please, try
to split (my brief look suggests that 3+ patches should come out of this one).

-- 
With Best Regards,
Andy Shevchenko



