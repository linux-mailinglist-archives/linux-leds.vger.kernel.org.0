Return-Path: <linux-leds+bounces-8525-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HfbJMm7CI2oyxwEAu9opvQ
	(envelope-from <linux-leds+bounces-8525-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 08:47:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9F64CBAD
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 08:47:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dk+LZpHv;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8525-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8525-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69834300B9E0
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 06:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3FB30D416;
	Sat,  6 Jun 2026 06:46:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F63202963;
	Sat,  6 Jun 2026 06:46:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780728406; cv=none; b=GJ4s1QEtu637GcpwljyQReN1budNM8I1bmYaC0bDdWdDWa5gBnSKacf5UAKFMzfGMXRB4swI54A9KIiMgkjxvaf27MxAAr9dyaU60QkryDoPPsFayzZ7y8FRsax5Ra/k4W3d7nnigaKiigNmKUcPsSpx1XrseKfHgTHAGSbgNgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780728406; c=relaxed/simple;
	bh=DSxIRnTXK40EJiQzC44uhcd9hVw68raQ06IMzoojolQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM7rhFNNqjnh4wd6riOHjLf1jQgIyPn+fBjSZLCUx0WVItXUhNmcbNQaf3ngmU9WbtBtgXOv+CJ86Fg1GTOKD87L9H15/9vMwg/SSIq/tx3xxBt+KTqr6W/x+CRMXQxmzTEKIEa7/KPdlghev8hTFCgWgsPAsPaHi/LdHK1nZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dk+LZpHv; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780728405; x=1812264405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DSxIRnTXK40EJiQzC44uhcd9hVw68raQ06IMzoojolQ=;
  b=dk+LZpHvJrJ80lj61xNhPbGqQ/04+eXa14g+9ko6g4vJT1x7fyGos2Ir
   FTnFamrlYd0qorVBoNNEgcSm3cUcsLElJv0AyGeCWcE2+givgh6BbD3Q7
   k1PvUecNKTGRrwJ/0rFC5kRDT4TpzttgMw7AsFYPSNSbAAH4Bgx+T2Ozm
   1+cVS2/MHXwxBBETx6HCavGpFHdQYl7qGhxhTvcUcdDhoIZI+Ej0eALEs
   EkDbmCWpjI27kA0owlSovs29+2iNhUDp6Sh7j3qmcmndTRb++m9DIwZZr
   Xvr7P4EBZ5rDCofxOQr9OfD4k4J7i/8NMfdOkkh/Yb8/sMlpPmESxMgOI
   w==;
X-CSE-ConnectionGUID: GaQPZOnjTSq8XHSnqixUUg==
X-CSE-MsgGUID: I5SM9u4ER52FSKYbSDQPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92121085"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="92121085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 23:46:44 -0700
X-CSE-ConnectionGUID: b+3Z64H6SE6PXSgvrpJa/w==
X-CSE-MsgGUID: JwMTLQe7Q3WEGxDkk49JsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="283121212"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 23:46:39 -0700
Date: Sat, 6 Jun 2026 09:46:36 +0300
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
Subject: Re: [PATCH v4 03/14] mfd: lm3533: Remove extern from shared
 functions in the header
Message-ID: <aiPCTBFGgnfhFgLl@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606045738.21050-4-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8525-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25F9F64CBAD

On Sat, Jun 06, 2026 at 07:57:27AM +0300, Svyatoslav Ryhel wrote:
> Using 'extern' is not required, drop them.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



