Return-Path: <linux-leds+bounces-6522-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49662CEFF0E
	for <lists+linux-leds@lfdr.de>; Sat, 03 Jan 2026 13:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29C683026538
	for <lists+linux-leds@lfdr.de>; Sat,  3 Jan 2026 12:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DD8219A8D;
	Sat,  3 Jan 2026 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3IiaEXv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED151CD1E4;
	Sat,  3 Jan 2026 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767444995; cv=none; b=eDJjKtCeTbin0Q4qcWJHhIjKa9MK5KV6SpfPbG7QOzJhk4TS4rz0nrG6X7K8xe/eKNPNMTpQJ1fqASZYgZ0Ms7lBGhruVyHu61SHu+MS11ogVFM3lZJ23HNC61FnuKcQ4XXMbBsSFZluC6POC+RimhUzx1jftqt442YzUuM9prI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767444995; c=relaxed/simple;
	bh=t6wLIwOo5Ia2UkV1+cEAZKfN3TrKmKMZKIlYAHfju00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwlW8+xyQ552pD+sqdGI6k2O4+KgW3rT/uY4ud34BRDm5rxTXYDxp2Qmgh4aAywtqdIZpp3E9O1CfYrrvDJrvfF/JXRwCgyQzZd5Wm0a9xKv29RG+PoXjet4+7VtOAOvuYv9EhNw9/kpt/w8FKvbGSxLhR/zK+26anErEwcuFCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3IiaEXv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767444994; x=1798980994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=t6wLIwOo5Ia2UkV1+cEAZKfN3TrKmKMZKIlYAHfju00=;
  b=g3IiaEXviHYfNxFuWYHDw0at34iFvIlc/ZJ9SW8iO0kJGlvfKIxm5mYn
   qKhxVvkR7RkvcF1ScRUE0PD+iQy+iI5OCdwTd+wmsSrZuTcASkCrleGiV
   LlYzQtGB5RtyF8u8feQ9LgY6cbR6DftlnZ1DyuOo7c5uLlCb/w6oylATi
   DdhhCEQtjtr4DGkr5VsHTxdOz8DG8VHMj/2IlQsqI6mgPq3TzsIOizBwN
   dp89RikGeLdFGcucEPsugyVclL1nICiN/5BlFDH1I6i5JmF0h1vwabgwF
   NFVwwN5RWzlShh5XnYWaJm1tdK4wE4NTo8JWsRh80rEBUwhJsfplz1BtE
   Q==;
X-CSE-ConnectionGUID: v1H2NIycTriKDUV1w3lcQg==
X-CSE-MsgGUID: fLh13WRKST2wUIP0R1O9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68944231"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68944231"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 04:56:33 -0800
X-CSE-ConnectionGUID: KqZwTZDGTBuLyFi8W8bS4w==
X-CSE-MsgGUID: nCptq1DCT6CVtdt1xKuTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202250572"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 04:56:30 -0800
Date: Sat, 3 Jan 2026 14:56:28 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <Professor_jonny@hotmail.com>
Cc: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v5 7/7] leds: Add virtual LED group driver
Message-ID: <aVkR_AG1fbZn4A7p@smile.fi.intel.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20251230082336.3308403-8-professorjonny98@gmail.com>
 <aVPDUVNX95Hv13VU@smile.fi.intel.com>
 <DS0PR84MB3746506E7740C032585F124F9FB8A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR84MB3746506E7740C032585F124F9FB8A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jan 03, 2026 at 08:22:06AM +0000, Jonathan Brophy wrote:

> >I stopped with this, this patch is half-baked and unreviewable. Please, split
> >it to a few features and add one-by-one, for example:
> 
> >- very basic sypport
> >- feature A
> >- ...
> >- debugfs
> 
> >So I expect 3+ patches out of this one. And try to keep size of a change less
> >than 1000 LoCs.
> 
> Thanks Andy
> 
> You have given me some things to fix and some great advice I'm a very junior dev and
> I know nothing of the led subsystem before this project.

You're welcome!

> I think it may be best to use a function to generate a gamma table I was thinking a
> hard coded table may be a better idea for performance reasons with addressable rgb
> strips that I plan to implement in the future.
> 
> I planned to split the driver into several files is this what you mean?
> it would logically break into  files as part of the driver as follows:
> 
> core.c
> arbitration.c
> phys.c
> vled.c
> debugfs.c
> virtualcolor.h

Fine by me, but I'm not a maintainer nor the authoritative person, you need to
wait for Jacek, and/or Lee, and/or Pavel to express their opinions.

-- 
With Best Regards,
Andy Shevchenko



