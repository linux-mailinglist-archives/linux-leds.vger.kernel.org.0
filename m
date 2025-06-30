Return-Path: <linux-leds+bounces-4939-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC6AED916
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 11:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 951941757B9
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 09:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B13024728C;
	Mon, 30 Jun 2025 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJPKWUeF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9D23535A;
	Mon, 30 Jun 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277284; cv=none; b=fZibityel0VAI848NPL+g3Ys20S8NTIm59CxtxZN2DWhdYYpUn/UUz2Tw95HxgBEle9ycvY4Gk0ZbbfHUpPiHaKCqacfOsGXNmKIzTVDYRNErNEUPFBlQQqPdsqw89u7HAtOnxX8jQ68tEXoAbHpd/7eXVdoqDeaFEK+VUZdZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277284; c=relaxed/simple;
	bh=c+EfMIdWLTOY9ANfDs+rcgi+w/4MGJzxoOO4qqOmm0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/XkMs9OFIF/6hCfxejsXvQ5wn+QgnvcMb+bthXBnIBO8WaKdJ2BXG+sNeDDhrLzKi3WGmQCnwQe8xaAEROsfANRd6mbu58SYZJrU1emVL1I3UOhgmqP9b1y7pdqz6+DpgqJt4mrRb+/wu1peojh3pIT8uu6VX3cbASEYpvN6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJPKWUeF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277282; x=1782813282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c+EfMIdWLTOY9ANfDs+rcgi+w/4MGJzxoOO4qqOmm0s=;
  b=XJPKWUeFIaMB2ylTBXcjLBBuLPoYQLrixOBbsVjSp6t/8c1mMObfH0mA
   jg07pot9kp9/8BgzKcsLbQYzyt83TNQ1ZEGyHDXJ8EEDE9kzWhSeu0l4O
   rt5E9xuIQHG8tF3T16lexcTunHDnHhD5h0afnNkvH9X9r9WF54dO1UT3X
   Yx9AhHGX11YWLDD/qmvWeapMHCPY9ekVSan+jTUKvjH71JyC2R3kM1W9P
   HotovrwYj9Zfxfsq8UTdZ01eJkZdcE1ICkCIyquoxkT0pyoptnqeOpSII
   PfhelZ0J6Fxpi/W65eiQA2kx4nRg5UzK5f+yrftrUQ++hKkEyK2uJUc0K
   g==;
X-CSE-ConnectionGUID: QNGjqqlFRsuPQ3R3IrJUxA==
X-CSE-MsgGUID: 7TS4aa0JSpGO/99dAYotPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53358921"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53358921"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:54:42 -0700
X-CSE-ConnectionGUID: GeEOfUQ3RtCuf1SNrvd0OQ==
X-CSE-MsgGUID: gBUQqF1kR4Se5EKo3+YMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159144017"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:54:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWBDe-0000000BGfS-3TPm;
	Mon, 30 Jun 2025 12:54:34 +0300
Date: Mon, 30 Jun 2025 12:54:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, ojeda@kernel.org
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: Re: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display
 controllers driver
Message-ID: <aGJe2krBnrPXQiU6@smile.fi.intel.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com>
 <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
 <aGI8a4iaOpN5HMQe@smile.fi.intel.com>
 <57f0289a-7d82-4294-a1dc-c6986da0c5ce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57f0289a-7d82-4294-a1dc-c6986da0c5ce@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 11:27:21AM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 09:27, Andy Shevchenko wrote:
> > On Mon, Jun 30, 2025 at 08:12:16AM +0200, Krzysztof Kozlowski wrote:
> >> On 29/06/2025 15:18, Jean-François Lessard wrote:

...

> >>> +	display->leds =
> >>> +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KERNEL);
> >>
> >> Wrong wrapping. Use kernel style, not clang style.
> >>
> >>
> >>> +	if (!display->leds)
> >>> +		return -ENOMEM;
> > 
> > Just wondering how .clang-format is official? Note some of the maintainers even
> 
> First time I hear above clang style is preferred. Where is it expected?

Documented here:
https://www.kernel.org/doc/html/latest/process/coding-style.html#you-ve-made-a-mess-of-it

For example, discussed here
https://lore.kernel.org/lkml/CAPcyv4ij3s+9uO0f9aLHGj3=ACG7hAjZ0Rf=tyFmpt3+uQyymw@mail.gmail.com/
or here
https://lore.kernel.org/lkml/64dbeffcf243a_47b5729487@dwillia2-mobl3.amr.corp.intel.com.notmuch/
or
...

> I assume clang-format is half-working and should not be used blindly,
> but fixed to match actual kernel coding style.

That sounds like the case, at least in accordance with Miguel.

> > prefer (ugly in some cases in my opinion) style because it's generated by the
> > clang-format.

-- 
With Best Regards,
Andy Shevchenko



