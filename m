Return-Path: <linux-leds+bounces-7133-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OOwFEfvqmncYwEAu9opvQ
	(envelope-from <linux-leds+bounces-7133-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:14:15 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A37223970
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5AB030B171A
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 15:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D90E3876A9;
	Fri,  6 Mar 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCViFkRO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FCE35B62C
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809793; cv=none; b=PZnk/bUtwiNeaPj93olpRCOBLfqdI9hTc7EpdVX0VZ3GDpzt/RYi/bDBVY0C6fZp35ZWgpFkBhDKkrLwY+20ZFqVRLkboKbPMLfQpyC9YCOKMldT2bfebThhuABaWOcEVOmIiJrzVGRIH7eeZEfeYue9GFOT9J+ccJIhI2CObEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809793; c=relaxed/simple;
	bh=PMlPhMiUvnT9gOBJ2LsD2utll9Y5DGdtv0dNJBaqWm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyCPAePelJVxCrdfGWGtP3LgvCWj6toEkV9xGr0T/SsNgWk7SBI+5aBnGYY4uqHIEHL2V4gTHbNKnTEg9Q3L2au0UP3RbVVLQvbMKp/rdtrtnSP8v5/+xr9P6pCqYdEMwxIYIF601ULml5yU6dm4urBmW/RaNSF/8iBf+PoCpw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCViFkRO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772809791; x=1804345791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PMlPhMiUvnT9gOBJ2LsD2utll9Y5DGdtv0dNJBaqWm0=;
  b=eCViFkRO4jItlxd9vL36oSewyOmJ7ZKDQ1YvPhWWoFQUwvVfc40qUitk
   cDKm1Ox8ltm05+IEpfKAOrFelUzxryvZ5+xpzX26WTpKw2DTtxsiGANY3
   2eqjU/NJyIOpDw9rTj0PrfdeCiOLNPbfwyf9HH+27KACVcCkQe1+mPAgU
   i3iIAIrA+e4hJXjeNWaHLgfEmYjint4BSEPhy+JmPfo8teh2skUBB5IBv
   +sNBiqAllGx6cOPaIieAbRFoKvCkvV7mbwOGoDj2ciKo+ITAmUFpC0bys
   tpddg3aIpx3TbXV5mcu4RNLbyEfvSVGI5RSFZQp1BCOEC3oaKaupvNRo0
   A==;
X-CSE-ConnectionGUID: U0vEMjoQRaKNZefOG+Cc6g==
X-CSE-MsgGUID: CYTnewVCSyWQ9KXUQCC1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77765495"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77765495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:09:50 -0800
X-CSE-ConnectionGUID: xp+UvGWpS/KSLq4t9FpBaQ==
X-CSE-MsgGUID: MA9opUHHQq2Cl77iKCcKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="256961134"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:09:48 -0800
Date: Fri, 6 Mar 2026 17:09:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <aaruOlCwePDD5WXc@ashevche-desk.local>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
 <20260306135505.GN183676@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306135505.GN183676@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: C0A37223970
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,ti.com,gmail.com,ucw.cz,vger.kernel.org,topcon.com];
	TAGGED_FROM(0.00)[bounces-7133-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 01:55:05PM +0000, Lee Jones wrote:
> On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> > On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > > 
> > > The interface doesn't check the values and higher values may lead to
> > > unexpected color changes if the brightness is changed.
> > > 
> > > Clamp the intensity value to max_brightness.
> > 
> > This also brings a regression if somebody doesn't care about wrapping around.
> > It's possible to return an error instead, but still the user space will be
> > broken (in some rare weird cases).
> > 
> > Again, I care even less about this change, but be always careful,
> > the main rule in the kernel "We do NOT break user space".
> 
> I'm going to remove this patch for now.

Wow, it was even never compiled!
For sure, please drop it.

-- 
With Best Regards,
Andy Shevchenko



