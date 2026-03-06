Return-Path: <linux-leds+bounces-7137-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGqkEuMjq2n6aAEAu9opvQ
	(envelope-from <linux-leds+bounces-7137-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 19:58:43 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D847226E1E
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 19:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4BD6304F20A
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 18:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB0235E942;
	Fri,  6 Mar 2026 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wc2m//jl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545234A76E
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772823519; cv=none; b=OiyzFIK+9l9kO7AA2p+WfxmKrD3Drjzm/R3bmO8hcoOb6mRUh0gnq81G7xyNOQKITc2uxc6VOEvI0oiRKIVPbDktFMIIoGGRsiJOE7tE45UXQcU1xWwJeYTJETJ4KcUttZtsT0JaSS5vByKSWuv6HPIkMuMbFQMmZkPoGZKPxg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772823519; c=relaxed/simple;
	bh=ROz/lSo0MY6XfZ9gpGhjYXtIMENojg9f+d41WLbKnX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9RTJG0CAWdCGKlOVes2SrTdyZuv8ACjaE1ynHOzjQOTffr7Mx96BSIZJDjWSqRbAqyTMXJsjJPGa0BeIk35yGet/RJwT+QFTUEvxpGyPLIgPUoBQy3QYAxzIHatXh1/4GZVEbOO604X8Q7/pQNQHBU8LxLfxquywWQ8hh8oF38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wc2m//jl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772823518; x=1804359518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ROz/lSo0MY6XfZ9gpGhjYXtIMENojg9f+d41WLbKnX4=;
  b=Wc2m//jlSmw5lRaR0cHE9rgRSbpSoEBjTpqIOzHvkW4NsJDZCUidhJGq
   0zsFkuA3sMYJ/P2l/w/pjIPoQ0afa9dBQdXR7WEmO9IW5DcbOroUATZZR
   yW8CC9KyMG0wbeCXaEEqhUxZr1AU3ZSN5mNHLXe2S30wDNnliJ1rf4GUZ
   60DNzvNXIQklu+j8tF+7K5mGhEecSo6TkjjHAhPn+JUJ+pAXTjUASZ2QW
   /Tugr97R72mf55W7parTHWbMFS6d0us1nUQ2AtjKhWKl1EsFObgm7S3Fa
   LoLcHxZ/Orj5BaZ/ypVefmiblbu6jZZ3L0K7dLBAlVcBXcfkuRWq4p9+q
   A==;
X-CSE-ConnectionGUID: x2mU3wIVRx6TFFkEVtC4Yw==
X-CSE-MsgGUID: hHwj2uNmTdywNOJF5lYhGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77811660"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77811660"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 10:58:37 -0800
X-CSE-ConnectionGUID: nO/H1iVXTnWaa1id9eJSvQ==
X-CSE-MsgGUID: 93ieeb0TSVurVlFFxH/Pcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219032302"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 10:58:35 -0800
Date: Fri, 6 Mar 2026 20:58:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <aasj2LgRRlyTlOxF@ashevche-desk.local>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
 <20260306135505.GN183676@google.com>
 <aary8OPCveDNbbpP@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aary8OPCveDNbbpP@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 9D847226E1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,gmail.com,ucw.cz,vger.kernel.org,pengutronix.de,topcon.com];
	TAGGED_FROM(0.00)[bounces-7137-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:29:52PM +0100, Michael Tretter wrote:
> On Fri, 06 Mar 2026 13:55:05 +0000, Lee Jones wrote:
> > On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> > > On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > > > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > > > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > > > 
> > > > The interface doesn't check the values and higher values may lead to
> > > > unexpected color changes if the brightness is changed.
> > > > 
> > > > Clamp the intensity value to max_brightness.
> > > 
> > > This also brings a regression if somebody doesn't care about wrapping around.
> > > It's possible to return an error instead, but still the user space will be
> > > broken (in some rare weird cases).
> 
> If somebody in user space doesn't care about the wrap around for the
> brightness value, the behavior will still differ between systems,
> because the value for the wraparound for brightness depends on
> max_brightness, which is driver specific and some drivers already
> implement clamping on max_brightness.
> 
> Handling this in a coherent way at the API level leads to more
> consistent behavior between different drivers.
> 
> Furthermore, intensity for multicolor LEDs behaves kind of like
> brightness for single color LEDs and for these, the documentation
> (Documentation/ABI/testing/sysfs-class-led) specifies that
> 
> 	The [brightness] value is between 0 and
> 	/sys/class/leds/<led>/max_brightness
> 
> and
> 
> 	Most LEDs don't have hardware brightness support, so will
> 	just be turned on for non-zero brightness settings.
> 
> With a wraparound behavior, writing (max_brightness + 1) to brightness
> would lead to a wraparound and turn the LED off, which is against this
> specification.
> 
> I agree that the behavior of intensity is undefined if it exceeds
> max_brightness. Do you have an example of user space (or use case) that
> relies on this behavior or is this a hypothetical case?

It does not mean if it's hypothetical or real for a (censored) user.
This is an ABI change patch. It might break someone's use case.
At bare minimum the commit message should explain that.

> > > Again, I care even less about this change, but be always careful,
> > > the main rule in the kernel "We do NOT break user space".


-- 
With Best Regards,
Andy Shevchenko



