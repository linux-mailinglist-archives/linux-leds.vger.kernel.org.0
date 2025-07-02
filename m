Return-Path: <linux-leds+bounces-4962-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F3AF5CAE
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 17:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5D94E240D
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 15:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C642EAB6C;
	Wed,  2 Jul 2025 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENZdgt/M"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B82D46A4;
	Wed,  2 Jul 2025 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469589; cv=none; b=gWgdVJvFwiUmNZY/VJZ+c/rtZdp5Lc388Bd6WI+hPkSvFJvtyHpFa4X9okkxulxP0AmnQ6NXzV5ER7heQodKORPLPItcnyoy0K28KuZilIVflm9rmWwCK/JYZ1MvqBVCm83qbz5JbHH8R7PQSm0fjIO5J5oACUTh07wS/QhpoRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469589; c=relaxed/simple;
	bh=G5ILBnzhoUBgiBLqMFbwYh/EptMoWHO0QJIM/iVSoW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4RpskX16OLaAV6Wtz2u5KT8MJ74848Jpu0jnWBTyQnQODUxuBYkS+tbIhj4v4gzBuuabSx4ZYXSs5X7Sejebjly6IA1KzT/98y2cvJ5rMjcw1J+jAnjYA5wPqG471eBA1HujaaD/2hGtJe1ud9kHqOxn6634HyB35aBaoh8eAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENZdgt/M; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751469588; x=1783005588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G5ILBnzhoUBgiBLqMFbwYh/EptMoWHO0QJIM/iVSoW8=;
  b=ENZdgt/MDz8RuF4SiNGGywBMu+m0mxuJ8FDMliptkDeWnARKrTpX809q
   VzDGCCke0/dHvRs2w+Xw0szfUoL3R0ipAfJZnPKfg0sfuKuSctHaPTarL
   tAnfeSYIQs2TjqGP4KhdvNQMhoRRiTjSpCJgui+0Z4tayIbalyfCMv8Gk
   rgbN/zV543f+uPOJ1i3VmSLJSRVcHdxcvRuLQB+9gNJY4Nsdsw4UctbnJ
   UMsNKHw6KzGNPIj4Fb/PuYiwY758zFRmX/96CzDdanPEd1IDEP3WQ52Og
   bfZPNe5v1j/zXAM/ocof2CtB0qItSMai1Zngr+blWnnEvoFS7aefKXvTi
   A==;
X-CSE-ConnectionGUID: hkdMAfx3QwCPRSm+C2ZrCQ==
X-CSE-MsgGUID: Rrs7tm9fS9CxJ92/oqNx6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64470663"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64470663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:19:47 -0700
X-CSE-ConnectionGUID: 8FccvJpMTPSZ/g2mjmfAEw==
X-CSE-MsgGUID: /WlAN8HKRHOL6ygeg4m8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153879054"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:19:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWzFM-0000000Bx9M-02O9;
	Wed, 02 Jul 2025 18:19:40 +0300
Date: Wed, 2 Jul 2025 18:19:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ojeda@kernel.org,
	=?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
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
Message-ID: <aGVOCw6iqeIpIDBK@smile.fi.intel.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com>
 <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
 <aGI8a4iaOpN5HMQe@smile.fi.intel.com>
 <57f0289a-7d82-4294-a1dc-c6986da0c5ce@kernel.org>
 <aGJe2krBnrPXQiU6@smile.fi.intel.com>
 <532c88b8-d938-4633-ac09-12bb3080a023@kernel.org>
 <aGKcfuQdNtQjmVC8@smile.fi.intel.com>
 <668a149e-f39f-45dc-8c55-d914df116b47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <668a149e-f39f-45dc-8c55-d914df116b47@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 05:05:00PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 16:17, Andy Shevchenko wrote:
> > On Mon, Jun 30, 2025 at 01:39:25PM +0200, Krzysztof Kozlowski wrote:
> >> On 30/06/2025 11:54, Andy Shevchenko wrote:
> >>> On Mon, Jun 30, 2025 at 11:27:21AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 30/06/2025 09:27, Andy Shevchenko wrote:
> >>>>> On Mon, Jun 30, 2025 at 08:12:16AM +0200, Krzysztof Kozlowski wrote:
> >>>>>> On 29/06/2025 15:18, Jean-François Lessard wrote:

...

> >>>>>>> +	display->leds =
> >>>>>>> +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KERNEL);
> >>>>>>
> >>>>>> Wrong wrapping. Use kernel style, not clang style.
> >>>>>>
> >>>>>>
> >>>>>>> +	if (!display->leds)
> >>>>>>> +		return -ENOMEM;
> >>>>>
> >>>>> Just wondering how .clang-format is official? Note some of the maintainers even
> >>>>
> >>>> First time I hear above clang style is preferred. Where is it expected?
> >>>
> >>> Documented here:
> >>> https://www.kernel.org/doc/html/latest/process/coding-style.html#you-ve-made-a-mess-of-it
> >>
> >> I mean, which maintainers prefer such style of wrapping. Above I know,
> >> but it does not solve the discussion we have here - above line wrapping
> >> preferred by clang and opposite to most of the kernel code.
> > 
> > IIRC Dan Williams (as you might have deduced already from the links).
> BTW, if that's your preference, then obviously it is perfectly fine.
> It's your subsystem.

It's not my preference for the record, but I wanted to know more about
an application of the clang-format. And perhaps some docs (besides .clang-format)
should be fixed rather sooner?

-- 
With Best Regards,
Andy Shevchenko



