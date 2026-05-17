Return-Path: <linux-leds+bounces-8167-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H2uTBFt1CWokbAQAu9opvQ
	(envelope-from <linux-leds+bounces-8167-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:59:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84855FCEB
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09BD5300C5AC
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5843230EF84;
	Sun, 17 May 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNDxb9WS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6D194AE6;
	Sun, 17 May 2026 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779004760; cv=none; b=ET790Km0e62AvcODi5blx6oR5DuVZICkvSjcB9o+8XtRpctfbGAK9Y8ILlDzdvS3Y2ErBZ2wqMteOeigXEnzx1IcvLVInGRt96Q3pv0zMtJl4wqWHYQyLFbHGwhxXiw8DoWNlW3N/pa91nST7uBAg45zvBKAkww4q+pIN+f0SJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779004760; c=relaxed/simple;
	bh=RCztGsesV7QNXwOx6El2gib8koFC1gVYlbosBrs9hB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Osm16onTmp9fdsPI7rqlkX1kqesswDB2sIks4axCEUQpL9JssIXwP0FXvZ1+f4v8f9ir+kdUNc2RmlWJF2KLCFLVMEoLq/hTgC1DALo9ASvgDc16VwgN5v8XF7lTCI6KEj6yqD1JTGUMhwc+F4n/NdHPyljMi4qwt9dlrCullDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNDxb9WS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779004759; x=1810540759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RCztGsesV7QNXwOx6El2gib8koFC1gVYlbosBrs9hB4=;
  b=YNDxb9WSZmdjmNUum8BR14IvD3MBggsiV19f+RwWU9Dgb3SnjvlufJrb
   6PZgRGETM2R95PLg1qZYQ4YZffMlnvWviAXrh72L966Ijzf6FeaTfX2oM
   PyGM7Tu9WYOH4hS4uxgGBMrklxOHgxzQEeGhucJRl0xr5yDRuFA9u+c6u
   VcUSErpPOlB4mkxPm4jFZs+tK0uJJmvvptblbc3gXkZIXatMfIFLE8tae
   Eccu0ksb04qHFhAsOTjFxOIFqhGqcVbuyaSX0qC5wF4B00IBAZVmlFOVL
   UPYklh4dY6RF8JAwkXN6bo1OPTynr9wWC1PY3shZChLIdCm0fUGCoNivf
   g==;
X-CSE-ConnectionGUID: Tg7oODNDRtSfqLEu13iCMA==
X-CSE-MsgGUID: EyubHe9iQa6w/j3oe/Thlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90995767"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90995767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:59:19 -0700
X-CSE-ConnectionGUID: fEhjprTLT9GHbm5HCE3P9Q==
X-CSE-MsgGUID: 632bb8nxSsKUq/xhD4M5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="232733648"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:59:14 -0700
Date: Sun, 17 May 2026 10:59:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve
 support
Message-ID: <agl1T8O6kwP7SFZ1@ashevche-desk.local>
References: <20260517074306.30937-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517074306.30937-1-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 5B84855FCEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-8167-lists,linux-leds=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> Convert LM3533 to OF bindings, add missing VIN supply, add support for
> setting mapping mode and LED sources based on device tree. 

How is this being different to
https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.com/
?

What about this comment
https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
? Have you talked to Bjorn A and Johan?

-- 
With Best Regards,
Andy Shevchenko



