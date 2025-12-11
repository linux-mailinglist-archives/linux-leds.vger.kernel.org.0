Return-Path: <linux-leds+bounces-6407-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C3ECB616E
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 14:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5216A30019F2
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 13:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E87923EAB8;
	Thu, 11 Dec 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1NZrKQ1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2E229B38;
	Thu, 11 Dec 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461085; cv=none; b=vE8CP/Z9ijzJW7UD7oXPDvBi0wwEWuI4HW9zskRK8MINzpPmabYib8HYqoQCjgG+cVrduC4k+x627GYuHBWE0aMrg2XIcKsSaKXxseMHuww163BM2luZoB7bbdqRaVN4MgYcBKGtYzt16KkPCa2BxC49TMGyKcXgfHnUxtCRdrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461085; c=relaxed/simple;
	bh=q5Bad2jUR+OgzT8aOrxGF5Ptu54iVeH2q46VmVpXrvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0mSGTbepv3k9oQZQOujBKjbGv1ZVEz0b9VyX/QkkiNYuMWq+ABhihXi9hDUp+WK/p5UNiq4jrg4v5xVFD/vdtkhW5DgQZFpmAxVmlHAepteI0i0gIWWjCWZkPhuTElpKdZ7QheT5Tnmwnv6psw6pOwCbCWpsAlMnhcTsv/2qds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1NZrKQ1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765461083; x=1796997083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q5Bad2jUR+OgzT8aOrxGF5Ptu54iVeH2q46VmVpXrvM=;
  b=l1NZrKQ1YIDl6/XnEFRrRqFQKdTPsHhgKsB/XMIDQmdpDk1XY6cqJcp4
   9e1l+Ht7UqMmmr+ywrcdwSlxl+RKqyRJXSVvOqY48IiPjlRXP/cxsCiuJ
   h53sPyXj6ubMSAEBX7YN9d+C8HBoiqGCtx7Uwpa8IcReqJOh5MetHrAFl
   syTRfADgAAOQnkmvFPIEOifvAJJrLyT94IgE7wMfjTNmO0ZsxKKx/4/3l
   2gBqxOOhHw2xE8Z9/9eAoqJxYgK7Z6hmvLKHH7UohYRgNybTLjPcedUYR
   q+XAmeUxvsVPfsf7yNaPCGCuev3vIntZ1V8MEgdCvBlBwTeUP+N4Tl6Wv
   Q==;
X-CSE-ConnectionGUID: fWfb/3QaS1u031DlIoBCqA==
X-CSE-MsgGUID: /FQXC9cmRVuWoH2c3bU7sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70022975"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70022975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:51:23 -0800
X-CSE-ConnectionGUID: 1PyGpEEmT/W8MXpB6kQZ2Q==
X-CSE-MsgGUID: jwatIZ6WQoWWsUiBdkY/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227457122"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.250])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:51:21 -0800
Date: Thu, 11 Dec 2025 15:51:19 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>
Cc: "lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Message-ID: <aTrMV22s-c3GBgU2@smile.fi.intel.com>
References: <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
 <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
 <SYAPR01MB2863A415594BCC2FCAD80876B2A1A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYAPR01MB2863A415594BCC2FCAD80876B2A1A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 11, 2025 at 12:49:12AM +0000, Jonathan Brophy wrote:
> > Still it's unclear to me what it means and how the code look like.
> > Perhaps you need to send some patches for the discussion (maybe as RFC if
> > you think they are not upstream ready).

Note, your email user agent is broken or misconfigured, it moves all lines to
be unwrapped. Please, configure it or change to one that works better with
the Linux related mailing lists.

> yes, I think  I will have to do this. 
> I'm developing a virtual LED grouping driver that needs to reference existing
> LEDs via Device Tree phandles.
> I plan it to expose the group as a singular or multicolor led.
> 
> as below I need to resolve the phandles of led_system_red and led_system_blue
> but there does not seem to be a way to do it under 
> The current api's:
> 
> DTS
> 	virtual_led_set: virtual-monocromatic-leds {
> 		compatible = "leds-group-virtualcolor";
> 
> 		led_virtual_violet: virtual-violet {
> 			color = <LED_COLOR_ID_VIOLET>;
> 			function = LED_FUNCTION_STATUS;
> 			leds = <&led_system_red>, <&led_system_blue>;

> 		};

Not an expert here, but sounds like an aggregator approach (gpio-aggregator)
design of which can be considered.

> > You can introduce it as a precursor to your driver. But OF centric variant
> > gone for good, we use fwnode in a new code.
> 
> I think this may be the only way forward.
> Removal of this function makes the virtual led driver under the current api
> impossible.
> I have my driver working with a of bridge following V4L2 fwnode helpers.
> v4l2_fwnode_endpoint_parse() and v4l2_fwnode_parse_link() has OF bridges
> where only DT bindings exist.
> Drivers walk endpoints via struct fwnode_handle, then call helpers that
> internally translate to OF nodes when needed.
> I have followed the same architecture on my driver on an older kernel
> successfully.
> 
> I was thinking a simple replacement for the of_led_get() with a patch
> something like below but I need to formalise and test further:

At glance something like this (of course the proposed code needs some
polishing).

-- 
With Best Regards,
Andy Shevchenko



