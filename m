Return-Path: <linux-leds+bounces-8636-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 62B4A8N6MmpV0gUAu9opvQ
	(envelope-from <linux-leds+bounces-8636-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 12:45:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C96989F7
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 12:45:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kAlEW2mZ;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8636-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8636-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31513304A347
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A9A3F58FB;
	Wed, 17 Jun 2026 10:32:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231E30674D;
	Wed, 17 Jun 2026 10:32:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692379; cv=none; b=WKtDJ18efILzbum0kWYlnUOrbzHwB1o9EFUw5iXrwb//2u/zfNm1KHtKpU1CnmoiF1bj0RwXeO3Gi4qwHQ1Wdm+oPwpbYbzqk05r1JDYKh+NZbLfcfcvkI9OqGhBX0AUVsLQgwbEe5rUkNGAb2Nx72sJBf01EOOaPS/oehl+rDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692379; c=relaxed/simple;
	bh=X3winq5qm2HIT6UC0/yxmrF0jTAu33Gl4aE30OAa1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx1nVbjJ4QcRWGCGEdc3NBw7nwVV5ycwaUlBJo7N759M1PLbROwYxFdDBokp4xrPU9q/ED2ljiADzotaYGSxGwaCQuJOaH7QsC0AYVxVAfR4OhQKjbHpMEuJD/b5Wpr+7bXJfsKyovrB4hd0ESD1P/yIE6sSTcp3kBGNAWqk1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAlEW2mZ; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781692377; x=1813228377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X3winq5qm2HIT6UC0/yxmrF0jTAu33Gl4aE30OAa1oI=;
  b=kAlEW2mZ3uZngNOBMtaNvhBeyWkA7uhdlSO9KJL000T459Mmv8rJphOs
   76D+hamhhVKLHIoWzEDkbwOzahCRV4UH1lCrVtOKpWI8WnFATq3M6t04E
   s3XVML4tSvItwDI7cHgG/dwTXeKu4KKXrcjUblZk/gGZ1VK5DANfj/N4o
   +zxN+MD962PFEEF9bcVVPkl7EmS9j0u5q4WroC+BG4fA9n2SxhCgYUoqz
   IK3eH3jdhv38N8Yrm2CPRFCpyJYD2w3E6G/aQDFiDiQhor1aEm3RyzMbm
   CUwyOY8oyCRqgJZ+tqSUziZ/OX7WZHNicSY6inVqZXd1Wx4mtk5KsSAFl
   Q==;
X-CSE-ConnectionGUID: VU2zsj0lQC2AxCYJ51w9Ww==
X-CSE-MsgGUID: 29+8XFCgQCmEeh6slDi6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93594475"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="93594475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 03:32:57 -0700
X-CSE-ConnectionGUID: leLgKuVYTtSbL+4Q82bKlQ==
X-CSE-MsgGUID: Uko2CTWXRUGLJxZ5qEEMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="247139272"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 03:32:53 -0700
Date: Wed, 17 Jun 2026 13:32:50 +0300
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
Subject: Re: [PATCH v5 02/14] mfd: lm3533: Remove driver specific regmap
 wrappers
Message-ID: <ajJ30lHG5lEXri7I@ashevche-desk.local>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617080031.99156-3-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8636-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 041C96989F7

On Wed, Jun 17, 2026 at 11:00:19AM +0300, Svyatoslav Ryhel wrote:
> Remove driver-specific regmap wrappers in favor of using regmap helpers
> directly.

OK, let's go with this variant.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Some side notes below for the record.

...

>  	struct lm3533_led *led = to_lm3533_led(led_cdev);
>  	unsigned enable;

Oh, besides using the old way of declaring unsigned int, it most likely
just needs to be kstrtobool().

>  	u8 reg;
> -	u8 mask;
> -	u8 val;
>  	int ret;
>  
>  	if (kstrtouint(buf, 0, &enable))
>  		return -EINVAL;

We should unshadow error codes (it may return more than -EINVAL).

>  	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
> -	mask = LM3533_REG_CTRLBANK_BCONF_ALS_EN_MASK;
>  
> -	if (enable)
> -		val = mask;
> -	else
> -		val = 0;
> -

...

> -	if (kstrtou8(buf, 0, &val))
> +	if (kstrtou32(buf, 0, &val))
>  		return -EINVAL;

Like in the previous case we should unshadow error codes.

-- 
With Best Regards,
Andy Shevchenko



