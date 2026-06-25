Return-Path: <linux-leds+bounces-8721-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sbgcGELYPGretAgAu9opvQ
	(envelope-from <linux-leds+bounces-8721-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 09:26:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A46C359C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 09:26:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ETSqUzsh;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8721-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8721-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EBBE30078A4
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 07:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C16A3C2BBE;
	Thu, 25 Jun 2026 07:26:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5708C3BE659;
	Thu, 25 Jun 2026 07:26:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372416; cv=none; b=toN7TW88zGffffOXEt2LAl6jWSdaD6SZULHbmFGhQllCfgWa+8EvZ14YGj4j55/J2k9L8Q1s0VV3kD1LJPT4Q2biv4FKqfNUiZMoZPKxkAuDfYzKqHirYXKBoTBQV1uaVm7loYLBjHL7Gt2+134nNwUVsh8CFrQE1jN4Xd6ejcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372416; c=relaxed/simple;
	bh=/JAMbYV6/MvMS5YmktMrYNIX493b56t4m6w329yYRCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLm6yPJoIJPRgVjd2XORBieLRHwy4IA7kDQJpBc7P4vkyUfS5+SuweZRtFKT3o1TG4T29lxuyLj8vqs8IR1R9XFcQDexSFCtvhsOMasop27BSbjRSLf/1uXyG2Hlwa4hSCaWMW31hyDhCLVMmm9osxj5EehXXkowozGuQey/BcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETSqUzsh; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782372414; x=1813908414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/JAMbYV6/MvMS5YmktMrYNIX493b56t4m6w329yYRCY=;
  b=ETSqUzshfU7gxWrTA/fMB0Mb9/V2FTIm617Z1QHjw1jl619AfRwhsR7I
   yiX1eWs8KH/4tczmlVKt9QKvxq5PKFPC7Q+ju6ZYn40NGBEG3JaALq7Zo
   uDxfJ7MWmsuZNW/oNidMtUajDn37ZNy0iyFiXJNYq/iku+6l+1IzEkDW/
   6dwyFO13BHrj8W8q33NSJ0yUm1QIuPbr91K56v5wzT5z1TMcowYlJ++x+
   6MPAd6CJx5Yx/U2cv3j2hAeINd2SBHjnovgESZ8i/fOY16ZQ93qf6yOff
   wnWaav8OOfkAK1yW81QVor8lHdc5fTBvACcNry2qmw5OKSn8EjnwBK0lb
   w==;
X-CSE-ConnectionGUID: oRmHxVOgTbqe2Zg89uRUMQ==
X-CSE-MsgGUID: wH3+cA4sThSDi0FjSX2vNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94636021"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="94636021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:26:54 -0700
X-CSE-ConnectionGUID: 0cBg5HpcQ92wuLGB//QaJw==
X-CSE-MsgGUID: 7G2IFw+sSgmoVJWfCXXYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="249049141"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:26:49 -0700
Date: Thu, 25 Jun 2026 10:26:47 +0300
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
Subject: Re: [PATCH v5 07/14] mfd: lm3533: Use dev_groups in struct
 device_driver
Message-ID: <ajzYN6nrvaiKqP5I@ashevche-desk.local>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-8-clamor95@gmail.com>
 <ajzXidQCd8pe-L5b@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajzXidQCd8pe-L5b@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8721-lists,linux-leds=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E05A46C359C

On Thu, Jun 25, 2026 at 10:24:00AM +0300, Andy Shevchenko wrote:
> On Wed, Jun 17, 2026 at 11:00:24AM +0300, Svyatoslav Ryhel wrote:

...

> >  	.attrs		= lm3533_attributes
> >  };
> >  
> > +static const struct attribute_group *lm3533_attribute_groups[] = {
> > +	&lm3533_attribute_group,
> > +	NULL,
> > +};
> 
> We have ATTRIBUTE_GROUPS() macro.

Okay, it uses is_visible, so __ATTRIBUTE_GROUPS() that we can still use.

...

> > +++ b/drivers/video/backlight/lm3533_bl.c
> 
> Same as per above.

-- 
With Best Regards,
Andy Shevchenko



