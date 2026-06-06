Return-Path: <linux-leds+bounces-8526-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ni0UHx/EI2rBxwEAu9opvQ
	(envelope-from <linux-leds+bounces-8526-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 08:54:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB364CC3C
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 08:54:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mpLqdlFU;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8526-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8526-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 600C930071F0
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 06:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144D430F535;
	Sat,  6 Jun 2026 06:53:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713F78F39;
	Sat,  6 Jun 2026 06:53:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780728790; cv=none; b=uhWzTwukMmCXuWncOHlD6BOuLYVotTH0owM5XerqSPiOadBnH1HzyZx0H1onqeyj5Bj/dh+4ZP8lhJRbwWRhdqkCgYy4FYH/u5mW6gxFyjVDKxiZS19YhnWz0RMMMtUlN5wM3aSRw1sajrdM9yml57BOtTUWgK7PiyUdAFI3gRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780728790; c=relaxed/simple;
	bh=Ua+pmOUdH0hE2qHl0EeTA3y+RmonfwXBwqAa6siD2hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5bG320aOyANEKp5FWYfsufLyuur1nen4G3aWlhjSX0Jl0VY4iYbyfiPLCXHIGZpraiCVszFPM8591kRV7anWfqxhVFspW7MRNJxKloqmxJTe2EcwsFsr6Eq4UcazJpLjgHta+hd9qKdHg2GvOLU4rF3zwYvlvImMxwi07NIb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpLqdlFU; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780728788; x=1812264788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ua+pmOUdH0hE2qHl0EeTA3y+RmonfwXBwqAa6siD2hA=;
  b=mpLqdlFUT3eMM0L9voL5G93YOgaOunuJKEk+Vucmt7hY2xo0QW8vTQqV
   zL0ukgaNwF2QnUtq99B/NO2+PxsQ3xL/seAdVUo1W4fq8dIyIrk2aYP1H
   VRBXOEE+F9KYs4Sdh/p2V1icthl8vyqbHk4k9vy50lMeLjO9m7046LoCI
   vqjY5a2d0abZmkWBxg/tNqi1giIReAP0UXagIJ8TMnfIwjR25aZlK1WPJ
   Oly87teoyPZZ3mARDEoaSPfzfzO8h9UaTedlbq2mOeuzLpZ6ab677AQZO
   SvPi1qGkN9b40PIybsQ5O5Eh8LwES1tMWXIlmD66hmEJmMpeToAnciZ0i
   w==;
X-CSE-ConnectionGUID: CaaSuu96R2SgqRMvGUqEKw==
X-CSE-MsgGUID: Rn6P4sYcT/2XD6ogHA42Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81673447"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="81673447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 23:53:08 -0700
X-CSE-ConnectionGUID: HqwNvrRRQwmj9tyigOeqwQ==
X-CSE-MsgGUID: rJRg2daYSVaIxT3DdqeZmA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 23:53:03 -0700
Date: Sat, 6 Jun 2026 09:53:01 +0300
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
Message-ID: <aiPDzdKuccdLIvlF@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606045738.21050-3-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8526-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87AB364CC3C

On Sat, Jun 06, 2026 at 07:57:26AM +0300, Svyatoslav Ryhel wrote:
> Remove driver-specific regmap wrappers in favor of using regmap helpers
> directly.

I like the idea of this patch. Nevertheless I have some suggestions below.

...

>  {
>  	struct lm3533_als *als = iio_priv(indio_dev);
>  	u8 reg;
> -	u8 val;
> +	u32 val;

Strictly speaking this should be unsigned int. The regmap API use unsigned int.

...

>  static int lm3533_als_set_int_mode(struct iio_dev *indio_dev, int enable)
>  {
>  	struct lm3533_als *als = iio_priv(indio_dev);
> -	u8 mask = LM3533_ALS_INT_ENABLE_MASK;
> -	u8 val;
>  	int ret;
>  
> -	if (enable)
> -		val = mask;
> -	else
> -		val = 0;
> -
> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val, mask);
> +	ret = regmap_assign_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
> +				 LM3533_ALS_INT_ENABLE_MASK, enable);

In cases like this perhaps leaving mask would be fine and together with

	struct regmap *map = als->lm3533->regmap;

this be nice one-liner:

	ret = regmap_assign_bits(map, LM3533_REG_ALS_ZONE_INFO, mask, enable);

>  	if (ret) {
>  		dev_err(&indio_dev->dev, "failed to set int mode %d\n",
>  								enable);

In many cases it won't increase LoC count.

...

>  extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val);
> -extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u8 *val);
> +extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);

>  extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val);
> -extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val);
> +extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);

Now they become asymmetrical. Perhaps to replace setters, but be careful about
upper bits.

-- 
With Best Regards,
Andy Shevchenko



