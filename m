Return-Path: <linux-leds+bounces-8423-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iER8JcuUHmrElAkAu9opvQ
	(envelope-from <linux-leds+bounces-8423-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 10:31:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8662A8F2
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 10:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2876E302269C
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 08:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF7A3624A9;
	Tue,  2 Jun 2026 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRru3k6D"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830AD19D8AC;
	Tue,  2 Jun 2026 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388642; cv=none; b=q1FOdNl/Q2sSKzXT0QQcbsuU1A+HhhN3hXCVIFwf3x3W02QMtul8OCLFOMCqsDAbcnTd0ja+Y+N0KlPXrWcGmADKeJafFaMeglqgwGer7aOiwd+oAvdPxOsMqkrTK4HrCanUYfdwB41iB4Hg8O4R2sl2Wm9XQpGlmBf4gVQ2eGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388642; c=relaxed/simple;
	bh=6mIZQksu9gsOvaTRiSt+HQWtZhwTIx9SmiAsWepUatk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxKX1raTwQ2X/ADhTyo1zXb6b8+MuHarP6BWezuzyOGTfDwQfAt4eY0fAiUF/rUlX6pVwr6BsRXPvzzuIOEi3ao9axf/02fPndYiTx7EPx1vVezXYNEB5lakDmI5B20XBJC8H7c2LH+G7OQSzmY/vznvIAJg40TtltFYniuChVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRru3k6D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780388641; x=1811924641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6mIZQksu9gsOvaTRiSt+HQWtZhwTIx9SmiAsWepUatk=;
  b=gRru3k6D0IMRTyInP3SLrGyNQECSLRfn1ew6YY+pvTimk6ktJO/gpt/O
   unTYcYEwDliL1O/PnyVBqDwzyU0TIY20nnJ/Xu2WsJfK6iCcLELiY55km
   DB0Oqdy/rDvvRKzgs/441sVb70DV7/PIsFpFrpKDFW3C9MKKA+4bbH1Rl
   e/bFVEvNwf6pebGBLhUuEbydxEjxc5ZuzphcOG63ZU311PpDKE9LTn+sj
   xeo7k/zb32HfPLhKEQ9E8c2tNmykb0YtvHbUvbExwoXa7AogH+B2BLTTm
   zC4P8rtbAN7Fn4+xWtNfcNQUeJ5eJ9g1C3P0ncB0d0rqjvN+hKzvXsGvH
   w==;
X-CSE-ConnectionGUID: fFuQTO34Sce4JtJ+2LnbGg==
X-CSE-MsgGUID: hsaJ9qH5RWGQXoqcc1QkAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81195634"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81195634"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:24:01 -0700
X-CSE-ConnectionGUID: yEgoAATaT6q0PeBlcsXiag==
X-CSE-MsgGUID: qzCimZX+SwK+A2t6n47VrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="245647814"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:23:56 -0700
Date: Tue, 2 Jun 2026 11:23:54 +0300
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
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
Message-ID: <ah6TGjRNnDpQGO60@ashevche-desk.local>
References: <20260601151831.76350-1-clamor95@gmail.com>
 <20260601151831.76350-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601151831.76350-6-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-8423-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 25E8662A8F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 06:18:25PM +0300, Svyatoslav Ryhel wrote:
> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.

...

> @@ -57,6 +60,9 @@ struct lm3533_als {
>  
>  	atomic_t zone;
>  	struct mutex thresh_mutex;
> +
> +	bool pwm_mode;
> +	u32 r_select;
>  };

Have you run `pahole`? Does it agree with the layout you made here?

...

> -	als->irq = lm3533->irq;
> +	als->irq = platform_get_irq_optional(pdev, 0);

> +

Redundant blank line.

> +	if (als->irq == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

What about other error codes when IRQ is found by can't be retrieved for some
reasons? IIRC we check against ENXIO in similar cases

	als->irq = platform_get_irq_optional(pdev, 0);
	if (als->irq == -ENXIO)
		als->irq = 0;
	if (als->irq < 0)
		return als->irq;

...

> +	led->pwm = 0;

Isn't it 0 by zalloc ?

> +	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);

...

>  #define LM3533_BOOST_FREQ_MASK		0x01
>  #define LM3533_BOOST_FREQ_SHIFT		0
> +#define LM3533_BOOST_FREQ_MIN		500000
> +#define LM3533_BOOST_FREQ_MAX		1000000

HZ_PER_KHZ  (since you included units.h)?

...

> +	nchilds = device_get_child_node_count(dev);
> +	if (!nchilds || nchilds > LM3533_CELLS_MAX) {
> +		dev_err(dev, "num of child nodes is not supported\n");
> +		return -ENODEV;

Why not dev_err_probe() here and elsewhere? It looks inconsistent with this
patch.

>  	}

...

> +	device_for_each_child_node_scoped(lm3533->dev, child) {

> +		if (!fwnode_device_is_available(child))
> +			continue;

Do we need this check?

...

> +				dev_err(dev, "invalid LED node %s\n",
> +					fwnode_get_name(child));

%pfw

...

> +	ret = sysfs_create_group(&dev->kobj, &lm3533_attribute_group);

No way. You should use .dev_groups.

> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs attributes\n");
>  		goto err_unregister;
>  	}

...

Can you think on how to split this change to smaller steps? I believe it's
possible.

-- 
With Best Regards,
Andy Shevchenko



