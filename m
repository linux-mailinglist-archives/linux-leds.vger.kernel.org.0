Return-Path: <linux-leds+bounces-8420-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC75DDmPHmpTlAkAu9opvQ
	(envelope-from <linux-leds+bounces-8420-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 10:07:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53962A2B2
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 10:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 364663014AA2
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 08:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDE63191CE;
	Tue,  2 Jun 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+FcyMOj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A098E3BB68F;
	Tue,  2 Jun 2026 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387557; cv=none; b=Lx1hKzL66s4SRf+9cd13QIw9UK0r8nGDpiBLJ/svLh30+hkzxKjCg40p709MsQfUOEzTCFFazpk2kOpvUzXN/Dfg5/a7CSIv5rdPe37lxRPqRcUC8INXLRTdcM4hmMeLBb2OJkFwQJaQqtvSyHL40I022NqExlee1X3I1oVnhdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387557; c=relaxed/simple;
	bh=2U/w7csjdBCnO9lVG6/gN+OP8Ql7e6u8LR6s0zZmkk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiPSY6XMMu14gP1w3M/lFmD85/lVg6iCZk8ncIYEURbYPdWfgUqY8l2stbjnHF1yMyqvKlnDwt2Bl+qzfsRLFxiB7gtGVliRroCxvhTd1j8iTasaDC6YaFaz3S++dxxADsoHTlqpsr76HhR/K4CAmNLGh4Fe+K1iCHb0Iznew/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+FcyMOj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387554; x=1811923554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2U/w7csjdBCnO9lVG6/gN+OP8Ql7e6u8LR6s0zZmkk4=;
  b=c+FcyMOjYXw/cNXfdD3OYjDrLdxhPgG7NGVHOJpkl0lcRVYi0emiVT0q
   pZ8DYAz2+IB/UGK6RfWbDXcj/7jiC8tAMiJazraybu/t12L6ssQP9oAk3
   4/KwGLv0ZN2HfGN7Z2d6OhZ5OsCSv72b63qrONrp8Bz7UYmqsOpdXtM/D
   h7H5cpuwJYIiyWTWgQxZmYZMqxq10RnEP9F5cHS79DJGq+2kGLUDZns8C
   8Di5qVsZnbboox/JBDcX90hiuUvgXurJzwLRuQsuZEs0rcsB3SY1zkOGK
   RgGrSEcOw2IlpTXwa5CAVw/i6uvxLzwWfPok5NlvGbkLuhuWv7la3q7NF
   Q==;
X-CSE-ConnectionGUID: WhXQ1wG/RwiKs1M8lzyS0w==
X-CSE-MsgGUID: fw73njyqS0aut2Q0DmybZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80196790"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="80196790"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:05:51 -0700
X-CSE-ConnectionGUID: 1WUP5+yARsW2RD6Qx5dHOQ==
X-CSE-MsgGUID: iNqvUy3ES+SjQm6zrzvafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="281946170"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:05:45 -0700
Date: Tue, 2 Jun 2026 11:05:42 +0300
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
Subject: Re: [PATCH v3 02/11] mfd: lm3533: Remove driver specific regmap
 wrappers
Message-ID: <ah6O1h8SPwjf3rV1@ashevche-desk.local>
References: <20260601151831.76350-1-clamor95@gmail.com>
 <20260601151831.76350-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601151831.76350-3-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-8420-lists,linux-leds=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: CF53962A2B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 06:18:22PM +0300, Svyatoslav Ryhel wrote:
> Remove driver-specific regmap wrappers in favor of using regmap helpers
> directly. The wrappers are mostly equivalent to the standard helpers, with
> two exceptions: regmap_read requires an unsigned int pointer, and
> regmap_update_bits has the mask and value arguments swapped. These
> differences were accounted for and adjusted accordingly.

We refer to functions as func(), exempli gratia, regmap_read().

...

> static int lm3533_als_get_current(struct iio_dev *indio_dev, unsigned channel,
>  								int *val)
>  {
>  	u8 zone;
> -	u8 target;
> +	u32 target;
>  	int ret;

While at it, move towards reversed xmas tree order

	u32 target;
	u8 zone;
	int ret;


...

> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val, mask);
> +	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
> +				 val, mask);

It's better to replace this to use _set_bits()/_clear_bits() or even move from
the above conditional (not in this context) to _assign_bits().

...

>  	else
>  		val = 0;	/* analog input */
>  
> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask);
> +	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
> +				 mask, val);

Ditto.

>  	if (ret) {
>  		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
>  								pwm_mode);

...

>  	/* Make sure interrupts are disabled. */
> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, 0, mask);
> +	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
> +				 mask, 0);

_clear_bits().

>  	if (ret) {
>  		dev_err(&als->pdev->dev, "failed to disable interrupts\n");
>  		return ret;

...

>  	u8 mask = LM3533_ALS_ENABLE_MASK;
>  	int ret;
>  
> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, mask, mask);
> +	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
> +				 mask, mask);

_set_bits()

>  	if (ret)
>  		dev_err(&als->pdev->dev, "failed to enable ALS\n");
>  

...

>  	u8 mask = LM3533_ALS_ENABLE_MASK;
>  	int ret;
>  
> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, 0, mask);
> +	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
> +				 mask, 0);

_clear_bits()

>  	if (ret)
>  		dev_err(&als->pdev->dev, "failed to disable ALS\n");

...

>  	else
>  		val = 0;
>  
> -	ret = lm3533_update(led->lm3533, LM3533_REG_PATTERN_ENABLE, val, mask);
> +	ret = regmap_update_bits(led->lm3533->regmap,
> +				 LM3533_REG_PATTERN_ENABLE, mask, val);

_assign_bits() and so on...

>  	if (ret) {
>  		dev_err(led->cdev.dev, "failed to enable pattern %d (%d)\n",
>  							pattern, enable);

...

>  extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val);
> -extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u8 *val);
> +extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);

We don't need to keep 'extern' for ages.

>  extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb,
>  								u16 imax);
>  extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val);
> -extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val);
> -
> -extern int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val);
> -extern int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val);
> -extern int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mask);
> +extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);

-- 
With Best Regards,
Andy Shevchenko



