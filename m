Return-Path: <linux-leds+bounces-8422-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJkfDqSRHmodlAkAu9opvQ
	(envelope-from <linux-leds+bounces-8422-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 10:17:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D262A5E2
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 10:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E14DA30128DF
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 08:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AF53BD654;
	Tue,  2 Jun 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eueEkc+A"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60C37B012;
	Tue,  2 Jun 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387789; cv=none; b=NOAwX9qb76YRtHD+ZIQ7qYE8M9VdSz0+ynx0vWSp69mYVF8KwplNxGfFe/JFK8asKJLhEvVpkYnKBRT/WTalHxGqUpB4hh2D5WfVv6w3CSVP1yh++hF1AQbmC2PwtOOzLvMhGavINPEIBhGaa9k0l4ia/PR9V19wCjbC1vhkotQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387789; c=relaxed/simple;
	bh=gwYJ/kTtL7028h1WAxReM18rkWLzIkyfezPsBxvoirg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ox9zStqENdl54spZblW4pQLtFYk6bYjQZZ9erNpkKr+bdDg5j3aU5bqxGXUsJyWicqpcyUAut38A/zJvGisBkmLJmOAVP2RMJyv92q1dSNygJVu0vnMT5+pwXzFBzqofE+IgT4yhPq/Uxb6SsNtrwveZc7QbKKWEtixGT1kkZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eueEkc+A; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387789; x=1811923789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gwYJ/kTtL7028h1WAxReM18rkWLzIkyfezPsBxvoirg=;
  b=eueEkc+ADN576A1kcwyvcKX8Ab7rM7b9dKdYbNXLyNIht7L/BQNClRO9
   I3V849nTBIjfuT/7r14a6qUkRc3gLoyO589hTFxZaoFUWf2q0tz4+tBlF
   omguOS6QaqV03rUuptR+x79WBsrbPwvoaA9CX4ZMAXsd4GEbVdyXm+h8p
   ABrrr4AGgeVczbUh2jdAi3K0KACNkU+jixuKIw0imPfkdK1jO/iFEvyTZ
   T3FC2rcjguvi8XQWH9EWX9h4cHDNpNei8R2QXEydYRl+MW0e7Y0ZU8A0u
   zY15886mMIhK/0ZDih006EfRz6ctNHiDvsstEYPpV4NDiENx3QMYox/hK
   g==;
X-CSE-ConnectionGUID: iBlI97rCQx+am7f34OkxCA==
X-CSE-MsgGUID: zx18TN3HQyCmQHATu8rguw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92652664"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="92652664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:09:48 -0700
X-CSE-ConnectionGUID: oXQ32FnEQLiEJT/X8SyneQ==
X-CSE-MsgGUID: 9RXlf7NKQRGUUADC5KWE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248759645"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:09:42 -0700
Date: Tue, 2 Jun 2026 11:09:40 +0300
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
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
Message-ID: <ah6PxFtoJUWkd79P@ashevche-desk.local>
References: <20260601151831.76350-1-clamor95@gmail.com>
 <20260601151831.76350-9-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601151831.76350-9-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-8422-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9F8D262A5E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:
> Simplify the sysfs logic of the linear property by switching to a macro
> and a ternary operator.

...

>  	if (kstrtoul(buf, 0, &linear))
>  		return -EINVAL;

Besides _assign_bits() in the below, side note here to unshadow error codes:

	ret = kstrtoul(buf, 0, &linear);
	if (ret)
		return ret;

(obviously in a separate change).

...

>  	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
> -				 mask, val);
> +				 CTRLBANK_AB_BCONF_MODE(id),
> +				 linear ? CTRLBANK_AB_BCONF_MODE(id) : 0);
>  	if (ret)
>  		return ret;

-- 
With Best Regards,
Andy Shevchenko



