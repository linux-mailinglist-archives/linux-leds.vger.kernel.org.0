Return-Path: <linux-leds+bounces-5319-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72009B36DBB
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 17:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388812042CE
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 15:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE6329B8CE;
	Tue, 26 Aug 2025 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWO9XXl0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012EA221FC8;
	Tue, 26 Aug 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222248; cv=none; b=Cz7kPKOygxg9U+2kbPD+dEaAnmw6ajh80ImWVWTDSNd0Js3D3J+CuAQ2l2rnTH97Vxi+ibGZgu1tJTzcA0Vtpjltrf0wv3X2rD27nDDHoavbovNMniTbV6v9IJoOmBn/HxpdN+ePnAsRvZRVcOUUQ4dO85RRjPIIZ0hVd54daOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222248; c=relaxed/simple;
	bh=DeZTUuTNgAjd9XlyeDu87gsPKiVWAJL6bNkrFjZVfC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLf/HJeWg0pHvkTTWQZSsDyFrCUL5w/PTz/YIm4Wy+Z0VXGeln2zXJF4bdwTQxIp2tDNz9AmQ2tJlqCc3ddhO7uNCtiy5VtSLzJWSyQHYrTLt7r8BmjbaHLZQZGm43dglGzgrwJ7VoOC3CQe5EZb7+gzT8SqVNYBs9S511dlbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWO9XXl0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756222248; x=1787758248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DeZTUuTNgAjd9XlyeDu87gsPKiVWAJL6bNkrFjZVfC4=;
  b=gWO9XXl0NyKt+Y3YDrlQzQnQd3/hPAzotdS1vGvWaI5vCu1Rj44fKisl
   R30y0Cewr+nREtu3hJoQdD4RiCEIbxwXPV0/AuWJKqEBa8ZbPDzwRkjWE
   uJY0Ju0hDzY1l15we0tTtGLLKyHbFRfb+a8L9s857q//c6+5akGp9xH0s
   rq4ZgqEF3HdWO2md6uQXZPtb2bV8ULc4tWXBBrN+FwBuR9OxRWvdiwiuA
   1zdR03bKsRwwKrguYs4DTE5AIcEt/7TAXRBMJIgKq8H2y1/VshANvn9Ni
   LMCbYVsQQgCsS9odZ0Qrmw4v8kA10Zn8ImJPPPl1KsoP8CjkULBuL9prE
   Q==;
X-CSE-ConnectionGUID: tR3DNAKBQKCkVrn+v63XGg==
X-CSE-MsgGUID: 86sL0V1YS1SdZseVFBgbqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62105068"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="62105068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:30:47 -0700
X-CSE-ConnectionGUID: uLf+w4GuRiW1N+GQKgEVKg==
X-CSE-MsgGUID: HkERIKD/R6CNSo/sokYITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169781095"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:30:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqvdB-00000008ocE-15MW;
	Tue, 26 Aug 2025 18:30:41 +0300
Date: Tue, 26 Aug 2025 18:30:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] auxdisplay: TM16xx: Add support for I2C-based
 controllers
Message-ID: <aK3TIVbmFgv1ZiYs@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-6-jefflessard3@gmail.com>
 <aKx-w0QOOQPyy9pW@smile.fi.intel.com>
 <951E84EF-4ED7-4882-A5E2-6E3CD63E1E07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <951E84EF-4ED7-4882-A5E2-6E3CD63E1E07@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 26, 2025 at 12:01:57AM -0400, Jean-François Lessard wrote:
> Le 25 août 2025 11 h 18 min 27 s HAE, Andy Shevchenko <andriy.shevchenko@intel.com> a écrit :
> >On Sun, Aug 24, 2025 at 11:32:31PM -0400, Jean-François Lessard wrote:

...

> >Can we use regmap for all parts of the driver? Why not?
> 
> These controllers implement custom 2-wire/3-wire protocols that share
> sufficient commonalities with I2C/SPI to leverage those subsystems, but are not
> fully compliant with standard register-based access patterns.
> 
> Specific regmap incompatibilities:
> 
> I2C protocol:
> - Dynamic addressing: slave address embedded in command byte (data[0] >> 1)

Isn't this called paging? Or actually we have also non-standard
(non-power-of-2) regmap implementations, perhaps one of them
(7 + 9) if exists is what you need?

> - Custom message flags: requires I2C_M_NO_RD_ACK for reads

Hmm... If we have more than one device like this, we might implement the
support in regmap. Or, perhaps, the custom regmap IO accessors can solve this.

> SPI protocol:
> - Inter-transfer timing: mandatory TM16XX_SPI_TWAIT_US delay between
> command/data

One may implement custom regmap IO accessors.

> - CS control: requires cs_change = 0 to maintain assertion across phases
> 
> Regmap's I2C/SPI bus implementations use fixed addressing and standard transfer
> patterns without support for these protocol-specific requirements. A custom
> regmap bus would internally call these same helper functions without providing
> practical benefit.

regmap provides a few benefits on top of the raw implementations. First of all,
it takes care about synchronisation (and as a side effect enables
configurations of the multi-functional HW, if ever needed in this case). It also
gives a debugfs implementation, and paging support (if it's what we need).
And many more...

> The explicit transfer approach better reflects the actual hardware protocol
> requirements.

That said, please, try to look into it closer.

-- 
With Best Regards,
Andy Shevchenko



