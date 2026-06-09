Return-Path: <linux-leds+bounces-8545-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YKsjDXNlKGoNDQMAu9opvQ
	(envelope-from <linux-leds+bounces-8545-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:11:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1676638AE
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FtoAE7Bi;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8545-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8545-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49F63010528
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 19:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6314C9004;
	Tue,  9 Jun 2026 19:10:14 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB823D2A4;
	Tue,  9 Jun 2026 19:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032214; cv=none; b=VQ35IosD1DX7aWUBBNjuiRZRXTXE1tAKKvIT9Q6Xawf1uPgESGy6xrhTvqdxbyLKEySrMb5PFnnpYcErpgB6OyV56MtYRwL1yZEsaRBjWbHsL3aHGUmliX7YgFWpsnCtlVNKnLgWrQ2/tCf+lz04QjVzh3WULAMWJLRk7HqAEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032214; c=relaxed/simple;
	bh=WS6JfaEA3BwmbJKvOhjIvyQekZrai9npTeo54lk95W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBOKzb1q7uUYV0rez24a/yApri9UR7MC5z6Mpat5zrYXRo9OMNvHrk5h3/TnPyOYkMvqpJhjIecJQXvTbjspQIK0alG/JWIF20vkg3vzN2DDz1dXHJ870pxekUjyNqfsTS2+RVm1MG87Jc9uReZDBhWhYojN2xQO5ITKuuTHOys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtoAE7Bi; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781032212; x=1812568212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WS6JfaEA3BwmbJKvOhjIvyQekZrai9npTeo54lk95W0=;
  b=FtoAE7BiPJ6knMitI9bTu7lKOsLqd5Xt/uu/aI2Er+VgNZkQu68B77ks
   PuB5FJqGhFRXsD7cjzjKsdd70NLWvUTctQZbpt6OE4bN43Og936XDlKQC
   Cru0rD85vlfadwEQt+ppdFVfyhIH1UPoS3xXspuGBWx5mkw5QGa7cJWTt
   p2xGdbOVTl4FVTK8jh0X8eTB6Z448SLY1OLvFIwXOkpGk+qNJ/6SDJFW1
   4vXvr6IEvbx4XL8Lj64ip30onSeBz3fIUVLw2TwT4k0nT6yBjrTjMEn5N
   dwNwgP4SsaARfaNhFVchjfAU6lW+HTrpCI1dr+NH96h2elVSnHIpDLTSV
   g==;
X-CSE-ConnectionGUID: iI0HNBiIRrC6jqevkRuRcQ==
X-CSE-MsgGUID: iLoPAbT3TRKK4mpYv/4RRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92374865"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92374865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:10:12 -0700
X-CSE-ConnectionGUID: mIKaIEDCTdGpbdmVntiHWA==
X-CSE-MsgGUID: N/5hmFWRSF2cAslIVueonw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="269960410"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:10:07 -0700
Date: Tue, 9 Jun 2026 22:10:04 +0300
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
Subject: Re: [PATCH v4 05/14] iio: light: lm3533-als: Remove redundant pdata
 helpers
Message-ID: <aihlDGNZRuHI-vMR@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606045738.21050-6-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8545-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F1676638AE

On Sat, Jun 06, 2026 at 07:57:29AM +0300, Svyatoslav Ryhel wrote:
> The lm3533_als_set_input_mode and lm3533_als_set_resistor functions are
> used only in lm3533_als_setup. Incorporate their code into
> lm3533_als_setup directly to simplify driver readability.

Use func() when referring to a function in the commit message.

...

>  static int lm3533_als_setup(struct lm3533_als *als,
>  			    const struct lm3533_als_platform_data *pdata)
>  {
> +	struct device *dev = &als->pdev->dev;
>  	int ret;
>  
> -	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
> +	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
> +				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
> +				     pdata->pwm_mode);
>  
>  	/* ALS input is always high impedance in PWM-mode. */
>  	if (!pdata->pwm_mode) {
> -		ret = lm3533_als_set_resistor(als, pdata->r_select);
> +		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> +		    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "invalid resistor value\n");
> +
> +		ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
> +				   pdata->r_select);
>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret, "failed to set resistor\n");
>  	}
>  
>  	return 0;

Wondering if it would be better to

	/* Bail out when in PWM-mode */
	if (pdata->pwm_mode)
		return 0;

	/* ALS input is always high impedance in PWM-mode. */
	...

as the above changes almost every line in that conditional.

-- 
With Best Regards,
Andy Shevchenko



