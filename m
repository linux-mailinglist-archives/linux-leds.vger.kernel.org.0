Return-Path: <linux-leds+bounces-8543-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ao+qGPZjKGq/DAMAu9opvQ
	(envelope-from <linux-leds+bounces-8543-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:05:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A966382B
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:05:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Zl3Uy0gZ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8543-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8543-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81BB0301FE58
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 19:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719564C0427;
	Tue,  9 Jun 2026 19:02:54 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F69A4C954B;
	Tue,  9 Jun 2026 19:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031774; cv=none; b=H5Rdc6vNALpRd08pFSRy0IJBQp1LwEYF4HlboB7rvPy5sIRh16UcXw5JF+ACrg+GjuDTBJLoIuNXn9KSUPv1HC9UH/bUr4SuYkxUGjv7OJn3rHPpXG1fTjRkb5y06SDngdMbHA6OaGNRjrYG4eOD7I27ubg1cBFYKWFWVqljbxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031774; c=relaxed/simple;
	bh=deUspC86kBJfg0o/64mhshqzhfCZxHh4On4fEBT3WEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzvToyS4AG3KWrimrdw9L3XYdDF2E3vtnEWoX8LHYKckptJZi+HldDn43yMyy8fRjNwZiiJNcanF1zBJLhQx0ewJYIV127ew1u166YmPf2xB60+YGbMuqZ4rXiXxF/yXWCZJSj20UgGKGoZG2YqPcgkJYpSpnPoW+o1+6u8lyDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl3Uy0gZ; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781031773; x=1812567773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=deUspC86kBJfg0o/64mhshqzhfCZxHh4On4fEBT3WEI=;
  b=Zl3Uy0gZbwwyzsRUlofJ30QLYh5uLxgNSyajb1qludHqM3HxLCMPGy2W
   aHyOsPPKO333BpxcfRMS/QcTxvEo4zxXUpFNWStbfMbuQZKdF17q/NQki
   PMvi+52pF4V1CTKeuGXOod2u+oQMEZex7V5+VXAChaKC6ZiDQFLgSmbyl
   5onuuy1d+CN2T55z1l4YAuGC/Y8Pckr0ykKvOIleQiHxp5xI9SCUxRNFC
   6QgbTiTGWbQfNHu5str8RaBdKS4ckZ/Z8YWt6IGb8yVpRusdTT8FGTnH1
   nfaFci4JMVVX/EfjY8f/t+pi2vrslQf+tVDFxoHwmvtnoCnW8yOaIj4A2
   Q==;
X-CSE-ConnectionGUID: Gb6YBAo4R4W93nXv0IEZUw==
X-CSE-MsgGUID: Uh9r/mbURiqocDF3ZSaLoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69341469"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="69341469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:02:52 -0700
X-CSE-ConnectionGUID: QGqNAd4uTc+4Ed3shPeszQ==
X-CSE-MsgGUID: Ak0qUeEaSXmuteJyhUjHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="284012438"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:02:47 -0700
Date: Tue, 9 Jun 2026 22:02:45 +0300
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
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 02/14] mfd: lm3533: Remove driver specific regmap
 wrappers
Message-ID: <aihjVZ9xvM2BRFu4@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-3-clamor95@gmail.com>
 <aiPDzdKuccdLIvlF@ashevche-desk.local>
 <CAPVz0n2rdgw8Xr3uxVdQGwrHTNFqK4SKQDFU2FEB8LzLwPhQ_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2rdgw8Xr3uxVdQGwrHTNFqK4SKQDFU2FEB8LzLwPhQ_A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8543-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 562A966382B

On Sat, Jun 06, 2026 at 10:22:43AM +0300, Svyatoslav Ryhel wrote:
> сб, 6 черв. 2026 р. о 09:53 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Sat, Jun 06, 2026 at 07:57:26AM +0300, Svyatoslav Ryhel wrote:

...

> > > +     ret = regmap_assign_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
> > > +                              LM3533_ALS_INT_ENABLE_MASK, enable);
> >
> > In cases like this perhaps leaving mask would be fine and together with
> 
> I prefer to remove intermediate variables it the helper allows to
> directly pass needed value.
> 
> >         struct regmap *map = als->lm3533->regmap;
> 
> next patch drops lm3533 so there will be als->regmap which IMHO is
> more logical instead of passing entire lm3533 to child devices.

Still it's longer than map. A local variable may help with making lines
shorter.

> > this be nice one-liner:
> >
> >         ret = regmap_assign_bits(map, LM3533_REG_ALS_ZONE_INFO, mask, enable);
> >
> > >       if (ret) {
> > >               dev_err(&indio_dev->dev, "failed to set int mode %d\n",
> > >                                                               enable);
> >
> > In many cases it won't increase LoC count.

-- 
With Best Regards,
Andy Shevchenko



