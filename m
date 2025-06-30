Return-Path: <linux-leds+bounces-4932-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E86AED590
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 09:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633A93A83E0
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 07:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E8F21CA0C;
	Mon, 30 Jun 2025 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haBqXJON"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9885821ABB1;
	Mon, 30 Jun 2025 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268474; cv=none; b=o2UW9lFNHhOgI584pydBcGRDeP5ZR+Ghq2F7XrktaVoVo2nivfgz2yebcNREXAClsT0kOnrq96ZNF0dubQgVu8ksQbMbWc+IO2Xh3RCEpkm45A0l1vbDreSWw29vc1c4/qPTEn5GBHE3Ot85TPsu7z/c9kk3OXjuw/Iy3AZHGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268474; c=relaxed/simple;
	bh=s7O3QKU1w7yXcBtvu+PX0pRrT+Gaj3+NMtxsSSmo9b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N29n1bdDFpwzzdnds+NmKI646ik5I6FnZEfxtqNLZvx/3/bf3jJoyS8Q6gN4znxMqh2XrQ/K3T8RY1vEIFkQz1LbNVff8TLb1oa75mhulaqulGJsJaa8dvCwWy0xX6fz4ILd9x14fo/WuJQPY0rHOvgyvyMNEX8/KxV6rp3LFX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haBqXJON; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751268472; x=1782804472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s7O3QKU1w7yXcBtvu+PX0pRrT+Gaj3+NMtxsSSmo9b8=;
  b=haBqXJONDS//idGACf7Uma5SAlfva/YVSd9ua4K96o+lNzgLIqoxOHn/
   T2vvxU8D3KvYYfDLjSYdGfT3N4mXo63FLB5PZ7uJXzzCW7Q7QjELlNSAm
   b+pWoZKY640E1KwbBw/n9uZpbvxih/4HwQMCIyqjUSOKPx3h0HHC/ObvP
   af99uWW0WwHdEECwO8aj7skybJVBaFkicySkhP9c484qXBEvlxvNOYPhJ
   JJMuEIluBc+VTDKSfjxeYz5qacr7nFLdeJ1p6n6pw4axiX8WI0IqRttsI
   Yd+67LWGcRIYER3fSwkpio9EUo1t1NY1akbwZ8thFtruebx/YfBGhc7zd
   Q==;
X-CSE-ConnectionGUID: jLd0XQj6ReWYEN3OyiBsmQ==
X-CSE-MsgGUID: wQh1notWTZmtGvGyvirXaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64835628"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64835628"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:27:49 -0700
X-CSE-ConnectionGUID: h6P/rFWnTa25eiiDrjgeMw==
X-CSE-MsgGUID: UWXeOLEbQoCH8xVTUk3umQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157773770"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:27:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uW8vT-0000000BEd7-3G98;
	Mon, 30 Jun 2025 10:27:39 +0300
Date: Mon, 30 Jun 2025 10:27:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <aGI8a4iaOpN5HMQe@smile.fi.intel.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com>
 <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 08:12:16AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2025 15:18, Jean-François Lessard wrote:

...

> > +	display->leds =
> > +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KERNEL);
> 
> Wrong wrapping. Use kernel style, not clang style.
> 
> 
> > +	if (!display->leds)
> > +		return -ENOMEM;

Just wondering how .clang-format is official? Note some of the maintainers even
prefer (ugly in some cases in my opinion) style because it's generated by the
clang-format.

-- 
With Best Regards,
Andy Shevchenko



