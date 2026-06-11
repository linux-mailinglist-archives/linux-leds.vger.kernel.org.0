Return-Path: <linux-leds+bounces-8577-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G6UfHEsMK2pl1wMAu9opvQ
	(envelope-from <linux-leds+bounces-8577-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 21:28:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73C674BD4
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 21:28:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="KXIXh/UE";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8577-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8577-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D58AF30B9265
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2026 19:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B60364EAA;
	Thu, 11 Jun 2026 19:27:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B030DEB8;
	Thu, 11 Jun 2026 19:27:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206076; cv=none; b=brBSwOpY2Ab/oO62wBKVI7SZ1E3v6POxRlA7UiPVAxHActpJyp7W/N0bJjpDUUrLaMmr7OjhSvoqefigjK4jRqsrI9xhhbnI3AjXbgHBny4PIRdlmMcXwraf205rYY34IDoPw2h2wYRTyaiPU6QO8fRuNZU7kDc3B/VDHNppUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206076; c=relaxed/simple;
	bh=ZsYHI2Mv0/sivtqF2/BNg7mQl3iBrP2bqcQipJwiT+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Anc1SYlaNtOnPirZ9jRRTZP//gAGZbDC56gRIgfUj3XXmX18dIiRsNHLM63VcahWEhUyNVaMe7eHm8EByQWgGIdMOfknT9TUFPX9tjinNz+YAygCnzVsHklGaQQALbJ9nM3sxMPqPuSxCx2+eeDiuU/bqQxPQieaHVP644+gOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXIXh/UE; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781206074; x=1812742074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZsYHI2Mv0/sivtqF2/BNg7mQl3iBrP2bqcQipJwiT+Y=;
  b=KXIXh/UE+RtfjZbZWSKCylfzkfw+lWUJZ9EXSIa8yk07l4RVT7YfY3nH
   OO/2YB2BwXgfOV9RyLVySoMQskmpUSIUPuexuALIlYnF7uPZCz3gHFAqA
   +tHykquc1ntsgkCm/TR1EzvM6TDGvn6au2PAwzl0sAr0X53ldVp0A0UCo
   WFvAdgpVm2o0jWKgq0KP8vG7ud6NoS8Z0K/Ng3xPyKOcp3bmnjuIOdo8N
   0St0+9lrEE+0OacY7YccUVAaMxmhX1nVRz4z5quyD61yayRmK80krA1Ek
   731QvVvxpWsSgbZ7XUbkdBnRwUFYMzsrbrDNRJ7aGExnalxolwBONSdeZ
   A==;
X-CSE-ConnectionGUID: 1SxWtLrYSr6etcJ97qJbDg==
X-CSE-MsgGUID: MJQyfFTOTeSAtvXlT5Qe0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104698285"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="104698285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:27:54 -0700
X-CSE-ConnectionGUID: qhaqYVHXR62R6ZSVw7gEwA==
X-CSE-MsgGUID: H7BMtbp3SoKVHA79A3Horg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246662023"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:27:48 -0700
Date: Thu, 11 Jun 2026 22:27:46 +0300
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
Subject: Re: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
Message-ID: <aisMMgsGMNwOq1lX@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-15-clamor95@gmail.com>
 <aihoH9Pmzufa9pnE@ashevche-desk.local>
 <CAPVz0n0m+i7wexfC0BWwvdOuJxDk_=x+EpxEbNmoHN1AsEmfNg@mail.gmail.com>
 <aimy3BxBaXQ3Uigd@ashevche-desk.local>
 <CAPVz0n0bpo6PAfdN+LGEgPYhEx8mqtu_SL=WnDxhWn-Cq4rQKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0bpo6PAfdN+LGEgPYhEx8mqtu_SL=WnDxhWn-Cq4rQKA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8577-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB73C674BD4

On Thu, Jun 11, 2026 at 03:33:42PM +0300, Svyatoslav Ryhel wrote:
> ср, 10 черв. 2026 р. о 21:54 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Wed, Jun 10, 2026 at 05:45:28PM +0300, Svyatoslav Ryhel wrote:
> > > вт, 9 черв. 2026 р. о 22:23 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > > > On Sat, Jun 06, 2026 at 07:57:38AM +0300, Svyatoslav Ryhel wrote:
> > > > > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > > > > defined in the device tree.

...

> > > > > +     int ret, i;
> > > >
> > > > No need to add 'i'.
> > >
> > > This is personal preference as well. There is no strict rule that
> > > iteration variable must be defined strictly in the for loop.
> >
> > This is a preference by Linus who is the leader of the project.
> > Also in IIO we have some set of maintainer preferences.
> 
> Well, this is not meant for IIO,

Oh, my bad. I am overwhelmed with the IIO patches, automatically thought that
I am dealing with yet another IIO patch.

> though it seems that Lee is also in favor if this approach.

Good to know!

> > > > > +             for (i = 0; i < led->num_leds; i++) {
> > > >
> > > >                 for (unsigned int i = 0; i < led->num_leds; i++) {
> > > >
> > > > > +                     if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
> > > > > +                             continue;
> > > > > +
> > > > > +                     output_cfg_shift = led->leds[i] * 2;
> > > > > +                     output_cfg_val |= led->id << output_cfg_shift;
> > > > > +                     output_cfg_mask |= OUTPUT_LVLED_MASK << output_cfg_shift;
> > > > > +             }

-- 
With Best Regards,
Andy Shevchenko



