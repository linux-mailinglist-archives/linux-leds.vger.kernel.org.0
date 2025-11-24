Return-Path: <linux-leds+bounces-6302-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA3C81C28
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 18:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08AE24E606A
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 17:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834D42C15A3;
	Mon, 24 Nov 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnWNs/tL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8EB2C1581;
	Mon, 24 Nov 2025 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003631; cv=none; b=TQenXB2Mx8qfjkJLtG1J05gt/SPX4kVj1ASfFPdOA5QaUnlZ/kPbbUlILPf0kmPNJ5TJH1UnWyAR4vf4kPqAYHjSZ571vl/qF+pjnyRGQ2N2Imqu3pvmbB/hmBjNwzVMj4A8EDXh+k9P96byrrUKspWWthDVN2ZQ/+/+Su4N/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003631; c=relaxed/simple;
	bh=Mk/slBwKHprGvIb7bG9qOObsfJ8L/yVyEYYi4ycNtnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLAxdDWu/4WHgI+NBsov0uj9j1ztv8kN3VLmCQa0Zxizn0Q+3ZxtS0s17isuMkSb2klRHf2Hu1yWkzUlkFRBZu+9yB8Q9svG792avijD1fi4asnnVek8HEHOM3X7D7k0WXUoCmerNPZDFskwAjsRpb8Rf9s0EBZjgeQvrFQkilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnWNs/tL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764003630; x=1795539630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mk/slBwKHprGvIb7bG9qOObsfJ8L/yVyEYYi4ycNtnc=;
  b=WnWNs/tLU5+VOI0kOViV745p/KY5LP4V8a6jB0Hiv5Wc9WLhhEkWHjiI
   TDSu0Snbl6Es9+Mm4eS/ERQDjW8b2VJgBqbpqui0B5rbZd8ZnwlweiXIT
   OPvhNTx9B1mp75wQ9DBSUiXF2W6txGsT3TmV1g4+Z97N6Q+s0zks5SiEP
   BOm8HFCSx0fW83V+aN6XFKTLkEv6DwhL6tIOKYzQcuajdceVC0ov0wFdp
   lPoqRALMqhoofIXCja/0fS5kVZhuDfrLmDGLA/S/FHM1CfIuhRRPyen3O
   h+sHbRDLyXvxz3D0SkLM11ElAKwjJTjbQto0PhWooNtA2wyLw83WKD+yS
   Q==;
X-CSE-ConnectionGUID: /rKijaGORJGtfR8dEbxSsA==
X-CSE-MsgGUID: erF9oOftQ1KPaOTMuC/Y8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77370512"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="77370512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:00:29 -0800
X-CSE-ConnectionGUID: Kecw1TliSNiD/U1VmgsvSw==
X-CSE-MsgGUID: f1f+bLoYTVmvE3sediqx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="223048537"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:00:26 -0800
Date: Mon, 24 Nov 2025 19:00:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 7/7] auxdisplay: TM16xx: Add support for SPI-based
 controllers
Message-ID: <aSSPKObizmpKiSpR@smile.fi.intel.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
 <20251121145911.176033-8-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121145911.176033-8-jefflessard3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 21, 2025 at 09:59:07AM -0500, Jean-François Lessard wrote:
> Add support for TM16xx-compatible auxiliary display controllers connected
> via the SPI bus.
> 
> The implementation includes:
> - SPI driver registration and initialization
> - Probe/remove logic for SPI devices
> - Controller-specific handling and communication sequences
> - Integration with the TM16xx core driver for common functionality
> 
> This allows platforms using TM16xx or compatible controllers over SPI to be
> managed by the TM16xx driver infrastructure.

...

Seems like same/similar comments as per I2C glue driver are applicable here.
Please, address accordingly.

Additional comments below.

...

> +	tm16xx_for_each_key(display, row, col) {
> +		byte = col >> 1;

> +		bit = (2 - row) + ((col & 1) << 2);

If you do something like

		byte = col / 2;
		... = col % 2;

it may be optimised to a single assembly instruction on some architectures
by a compiler (and yes, I saw it in real life that `idiv` on x86 has been
chosen over other approaches by GCC).


> +		value = !!(codes[byte] & BIT(bit));

Seems unneeded

> +		tm16xx_set_key(display, row, col, value);

		tm16xx_set_key(display, row, col, codes[byte] & BIT(bit));


> +	}
> +
> +	return 0;
> +}

...

> +	tm16xx_set_key(display, 0, 0, !!(codes[0] & BIT(1)));
> +	tm16xx_set_key(display, 0, 1, !!(codes[0] & BIT(4)));
> +	tm16xx_set_key(display, 0, 2, !!(codes[1] & BIT(1)));
> +	tm16xx_set_key(display, 0, 3, !!(codes[1] & BIT(4)));
> +	tm16xx_set_key(display, 0, 4, !!(codes[2] & BIT(1)));

Do we really need !!() ?

-- 
With Best Regards,
Andy Shevchenko



