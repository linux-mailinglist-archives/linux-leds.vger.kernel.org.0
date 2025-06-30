Return-Path: <linux-leds+bounces-4945-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F7AEE06C
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 16:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85974189E8AA
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 14:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BD328BA96;
	Mon, 30 Jun 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdTxPY9I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322128C2BE;
	Mon, 30 Jun 2025 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293063; cv=none; b=VIZ35AFhSfFvcJ6b80wTf9P00aDEV5WI95bYkj5ecFztzYtWYYHw9UVFlQ45IqEyWLEyORQ4Q3YrKBOa3Z9nDHv3WOSiE3aP1PjdyB3efYT2gGz6uTW6W5leneWMElMLTO7WB8UswXPD2wCeCxY04pbxO5Ptj2UyDvvR9V9Hg5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293063; c=relaxed/simple;
	bh=TcnOsckU+VCULT+tXZk1ehzCEL4gv6Oqua1OqSumGdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTOiY3MzJAhwdJTRueMZIsMX2ZOaaIoqRGUHhtsnARsf8dII0uAJbM6GvKCVDgNjXe5bgMPeX74Ps01sGOe3y3PZ4duX6DxNeP1jZnVozKCRPYNjBk8WV8UvehHtlsDH9dx9SVlQGkvlvVjsVhLUyqWHFxess+St1hTZhpso0T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdTxPY9I; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751293063; x=1782829063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TcnOsckU+VCULT+tXZk1ehzCEL4gv6Oqua1OqSumGdA=;
  b=KdTxPY9IabGrHfMzIOHeJpfVOWezYijI3lxpdLuI0iABNUX278L1BuNz
   fAntk9bLnDZBKo38iUHCucR0lom6v+agMUgFida+/RR3FrcY5Sr/QC+/+
   U2pTK6gBFSORs4+K7BNLa7wDGtB5aTGURblxGk4J00vTYlIn+4dYG9SWc
   Er/nNjg/hi67boII5h4gx27pdUG+L25srsxf2LqtS7ib5VtD3RBvp+LhA
   JrhlO/69TsLsd+GamxkCDQneER7xg2I9qwCr/EqfhESltGrYuJxDwqRCL
   tZfazAxJXH4o7B/0NoTGxKy1dXrgUaTIsAcAbkFVUGVr1Tqcr1xCk5WKz
   g==;
X-CSE-ConnectionGUID: KIhMV7dWR96w6H4S79K4yQ==
X-CSE-MsgGUID: Ui0Y9ls0RKm2zkneDF5M7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64968072"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64968072"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:17:42 -0700
X-CSE-ConnectionGUID: sLL111bLR9qxA0VUn9e10g==
X-CSE-MsgGUID: Zar/m6DpS8C0MBbsbCRe7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="158979840"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:17:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWFKA-0000000BKTd-3dz6;
	Mon, 30 Jun 2025 17:17:34 +0300
Date: Mon, 30 Jun 2025 17:17:34 +0300
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
Message-ID: <aGKcfuQdNtQjmVC8@smile.fi.intel.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com>
 <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
 <aGI8a4iaOpN5HMQe@smile.fi.intel.com>
 <57f0289a-7d82-4294-a1dc-c6986da0c5ce@kernel.org>
 <aGJe2krBnrPXQiU6@smile.fi.intel.com>
 <532c88b8-d938-4633-ac09-12bb3080a023@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <532c88b8-d938-4633-ac09-12bb3080a023@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 01:39:25PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 11:54, Andy Shevchenko wrote:
> > On Mon, Jun 30, 2025 at 11:27:21AM +0200, Krzysztof Kozlowski wrote:
> >> On 30/06/2025 09:27, Andy Shevchenko wrote:
> >>> On Mon, Jun 30, 2025 at 08:12:16AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 29/06/2025 15:18, Jean-François Lessard wrote:

...

> >>>>> +	display->leds =
> >>>>> +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KERNEL);
> >>>>
> >>>> Wrong wrapping. Use kernel style, not clang style.
> >>>>
> >>>>
> >>>>> +	if (!display->leds)
> >>>>> +		return -ENOMEM;
> >>>
> >>> Just wondering how .clang-format is official? Note some of the maintainers even
> >>
> >> First time I hear above clang style is preferred. Where is it expected?
> > 
> > Documented here:
> > https://www.kernel.org/doc/html/latest/process/coding-style.html#you-ve-made-a-mess-of-it
> 
> I mean, which maintainers prefer such style of wrapping. Above I know,
> but it does not solve the discussion we have here - above line wrapping
> preferred by clang and opposite to most of the kernel code.

IIRC Dan Williams (as you might have deduced already from the links).

> > For example, discussed here
> > https://lore.kernel.org/lkml/CAPcyv4ij3s+9uO0f9aLHGj3=ACG7hAjZ0Rf=tyFmpt3+uQyymw@mail.gmail.com/
> 
> Heh, I read it and two emails earlier and still could not get they
> prefer to wrap at assignment instead of standard checkpatch-preferred
> wrapping at arguments.
> 
> > or here
> > https://lore.kernel.org/lkml/64dbeffcf243a_47b5729487@dwillia2-mobl3.amr.corp.intel.com.notmuch/
> 
> This is line length, so not the problem discussed here.

Ah, okay.

> > or
> > ...
> > 
> >> I assume clang-format is half-working and should not be used blindly,
> >> but fixed to match actual kernel coding style.
> > 
> > That sounds like the case, at least in accordance with Miguel.
> > 
> >>> prefer (ugly in some cases in my opinion) style because it's generated by the
> >>> clang-format.

-- 
With Best Regards,
Andy Shevchenko



