Return-Path: <linux-leds+bounces-6896-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNQfM4mYiWmk/QQAu9opvQ
	(envelope-from <linux-leds+bounces-6896-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 09:19:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3745D10CDB3
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 09:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDEC330078E2
	for <lists+linux-leds@lfdr.de>; Mon,  9 Feb 2026 08:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771202FB630;
	Mon,  9 Feb 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJqIkIf2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D7B1917ED;
	Mon,  9 Feb 2026 08:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625145; cv=none; b=pNx+v91oxSyYUVHmU3O4Uv4/0+AkBmkRehLEgEzEpSEIppySgExHAa5fAf7NW8K8rxcQbtiA6zstWf9g30CeSKwrFp1+stMi1Xo1f+aImzX2v9gDGFDCL3w1HLxbJ46hQiyAEU66dEtI1N8xzUWCBUCbSN/E3CAMI7LScmILXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625145; c=relaxed/simple;
	bh=v4+gioVzpmtpOGpUk+G0irz2D9GY7eKMbeUGrW55+yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DI8ZyoCbqewICrS9G+DnBFtjCLxNWOCZKMo2EM+SCyJbTDaujvBAV2U2J19Fm/dp+GPTLzjMFfBJwRdczkKmrn+ZEx3I/ohHXiMhfzWrWsFb63/MHwcL9JO+/jbiZ7ugNyXrj5Fn6dklf+V/wQrcYmdtiCoEOoGMpX/U5GVXB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJqIkIf2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770625145; x=1802161145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=v4+gioVzpmtpOGpUk+G0irz2D9GY7eKMbeUGrW55+yk=;
  b=YJqIkIf2ojg4CWIJf9DbTDdzS4eBtQsL1xZ+PO0Pn9p65TePynCEYsbR
   PkiPUpg0rIcgPC1pQToKTXpDRQSIB5diQCImzmiVUMkJJwQ8Y/fzLJvti
   cQG/dZz8/kRawUPQzXksz/l+2XDMTi4ZPf7lZiNRGurC307f+fPjSmGVX
   k1KeEZDLd6uZE+UJiLXMlmvfj757COKfdRtXEm03zssPfk6xVX2gwhlnH
   W4EqAadCa0aAPNaSDtACEoawp9tB8oySfvnCquJBc0sep4XBjc0dJb1wy
   kRQs9B2afRNzDon/hujimVfAAHkyusI2Hh3ictT7wmbNGO8k0Sq6cC/vJ
   A==;
X-CSE-ConnectionGUID: 5FpaSrHLQGuthp+ziVvWGA==
X-CSE-MsgGUID: FfZqHRd5S4yqLlL+TwiXGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82465464"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="82465464"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:19:04 -0800
X-CSE-ConnectionGUID: GemA8WHCSOacCXQ5QuuqCA==
X-CSE-MsgGUID: JpaDVtz5Qa2PnJz4Q/Sfrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="210600232"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 00:18:59 -0800
Date: Mon, 9 Feb 2026 10:18:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 10/11] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <aYmYcd0431P5sUtq@smile.fi.intel.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-11-clamor95@gmail.com>
 <aYiHnUW93AB0ARJH@smile.fi.intel.com>
 <D8B3E97F-3405-4EBD-882D-677F530E4EDB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8B3E97F-3405-4EBD-882D-677F530E4EDB@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6896-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3745D10CDB3
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 05:19:49PM +0200, Svyatoslav Ryhel wrote:
> 8 лютого 2026 р. 14:54:53 GMT+02:00, Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> >On Fri, Feb 06, 2026 at 07:28:44PM +0200, Svyatoslav Ryhel wrote:

...

> >> -static const struct of_device_id cpcap_of_match[] = {
> >> -	{ .compatible = "motorola,cpcap", },
> >> -	{ .compatible = "st,6556002", },
> >> -	{},
> >> -};
> >> -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> >> -
> >>  static const struct spi_device_id cpcap_spi_ids[] = {
> >>  	{ .name = "cpcap", },
> >>  	{ .name = "6556002", },
> >> +	{ .name = "mapphone-cpcap", },
> >>  	{},
> >>  };
> >
> >This  also needs to be converted to use driver data.
> 
> I can do that, but is it needed?

For the consistency's sake.
Also brief look at MFD SPI drivers I see that most of them use driver data.
All that is redundancy? Maybe clean them up as well to show the point?

> This id table, if I understand correctly, is here solely to silence warnings
> about missing spi id table. Driver itself does not use it in any way and will
> never use since all available devices that use this driver rely solely on the
> device tree, all possible future devices will be relying on device tree too
> due to obvious reasons.

Then maybe SPI should be fixed to avoid this table to be present? (But don't
waste your time, it will be a rabbit hole.)

> >>  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);

...

> And please, may you contain all your reviewing in one iteration. Then both of
> us will spend less time working on the patch. Thank you!

It's an impossible request, you should understand that. If you want, use AI
or your robot colleagues for that, I'm just a human being, I can't see
everything at once.


-- 
With Best Regards,
Andy Shevchenko



