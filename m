Return-Path: <linux-leds+bounces-2572-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFC968898
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 15:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67A4281EB3
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2024 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D0219E965;
	Mon,  2 Sep 2024 13:17:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16313E8A5
	for <linux-leds@vger.kernel.org>; Mon,  2 Sep 2024 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283047; cv=none; b=oSd2jKHJ9cVpb0z8CIdRGX9uZTplXRLXGZzrQJ7vAbA9i/YrquWt+4XyiyZtqAp0aqiOz41LLgbw8uSZfM0TxyvCwbeMTDVKl0npue3fK2GCprtp8YIP/kp46SdlWPMm3bClpTLtQx0Sbm48zde5YKn+cpGVJp1EbYxOpcBeP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283047; c=relaxed/simple;
	bh=GpBwAlpIxZWJjv2ymKSxQTNGC1bxHu7UhY1fSZZYYrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLCIS88hnPtGzHFNg9hU3PBUI453BCN0DrTZIzz34Lbwv9mhqiiOQ5OLRyh0VyKWoYAXQsSbauQIMBGSd4ru0BuPQQA67d1ByotyotoqnzW9N91Qm93qevN/+r9pwck6MpFE4a6nuCjp2FcAQCkfCBdftYYWTZmbVcLzZ/SAjnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: vHQn49HeTB6fC+NFMU7r4A==
X-CSE-MsgGUID: atm3hIONQJWNV90EeIPKDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23670333"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23670333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:17:25 -0700
X-CSE-ConnectionGUID: mx18IN+4QvSTKALky29K8w==
X-CSE-MsgGUID: 4sELQTiDQZG6g99mY0T2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95421338"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:17:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl6vj-00000004NQu-20HD;
	Mon, 02 Sep 2024 16:17:15 +0300
Date: Mon, 2 Sep 2024 16:17:15 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds 5/8] leds: turris-omnia: Notify sysfs on MCU global
 LEDs brightness change
Message-ID: <ZtW625-GePwV8ffA@smile.fi.intel.com>
References: <20240902124104.14297-1-kabel@kernel.org>
 <20240902124104.14297-6-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902124104.14297-6-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:41:01PM +0200, Marek Behún wrote:
> Recall that on Turris Omnia, the LED controller has a global brightness
> property, which allows the user to make the front LED panel dimmer.
> 
> There is also a button on the front panel, which by default is
> configured so that pressing it changes the global brightness to a lower
> value (unless it is at 0%, in which case pressing the button changes the
> global brightness to 100%).
> 
> Newer versions of the MCU firmware support informing the SOC that the
> brightness was changed by button press event via an interrupt.
> 
> Now that we have the turris-omnia-mcu driver, which adds support for MCU
> interrupts, add the ability to inform the userspace (via a sysfs
> notification) that the global brightness was changed.

...

> +	ret = devm_device_add_group(dev, &omnia_led_controller_group);

AFAIU the intention is to remove that API, hence this shall not be used.
Greg?

https://lore.kernel.org/lkml/20221109140711.105222-1-gregkh@linuxfoundation.org/

-- 
With Best Regards,
Andy Shevchenko



