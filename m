Return-Path: <linux-leds+bounces-6653-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA468D2604A
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 18:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 971353042487
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 16:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617A83B530C;
	Thu, 15 Jan 2026 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX8LMlh+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CF3BC4EE;
	Thu, 15 Jan 2026 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496338; cv=none; b=vGoFzRrIKfI9W9GEV/E7TlAODlJla06zDVTLEupQCQ6ujhdL8AmIc8H1rmwd06SNnZGApVIDidEeHIPpoJHVDzJoNLrJ9+DbPV6BISQm1n5Cvh9sUxoEpExwO2QBkMYGvkyV8MbEftrx3mBPWEygLzdC3N/fosuYBlLM5vZJhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496338; c=relaxed/simple;
	bh=MXUN7uVlUmr9dcSClQLwGriHQzZeir9abbbMwP99laI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/JZgkOsU+uIL/AFHDsXhbYpul8J4D1MZAfoL5PBp+z+1m839H7txAOgyOdUmiQPDf3kjNVw3NXiVYfanc5GN2rVWAv25Y64ALHXCDAxkFJNvNugYZclop0lVAZQnLzXh+g02wvFGgpuRJTl+fQdVFGiPCVTmlgAWatS0fnitOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX8LMlh+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768496337; x=1800032337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MXUN7uVlUmr9dcSClQLwGriHQzZeir9abbbMwP99laI=;
  b=hX8LMlh+3Toz//7YkDRlsj2wUg824yyZM46K9BjtXYVwRri0W9HX7lzw
   X1c75AodPy/Iw6fgrEoXUzx86prmc3x6MtqyTJiucBuQ2sh54qLlVUXXf
   A16exZ4SjqUvnI3NgEs/RyI/+fVaMz5EblVwhjPm5Lsy2DEIY70aY7pFB
   0iZ8uax5z8WedmPhHGvOiQ7SDjgGmXQbIgEu/zcXOOu7v/x631rEESis7
   V8ZvvXdU02HI6o7fOYa0wimwAaPjFuVq3oGbjuaCYtd1xtA/jOHvJbWDt
   YaM+4qlrnlzPkcGuP7SKTIxvTsa7FX93uMYfi14QHw76ZUDwA8Hu7O8vn
   g==;
X-CSE-ConnectionGUID: +wcd/EoTTquNOsLnxU/0zw==
X-CSE-MsgGUID: BkPKhX0RSnenmUl/WCnP2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69897277"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69897277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 08:58:50 -0800
X-CSE-ConnectionGUID: E0Q2A8BiS5eZn64q1EGqaQ==
X-CSE-MsgGUID: C3nGcwgwQh2RXDgvhUNxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205276808"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 08:58:46 -0800
Date: Thu, 15 Jan 2026 18:58:44 +0200
From: Andriy Shevencho <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Brophy <Professor_jonny@hotmail.com>,
	Jonathan Brophy <professorjonny98@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v5 0/7] leds: Add virtual LED group driver with priority
 arbitration
Message-ID: <aWkcxGHINusTftex@smile.fi.intel.com>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20260113115701.GG1902656@google.com>
 <DS0PR84MB3746D50A75BCB4DB053E008E9F8EA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
 <20260115150725.GF2842980@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115150725.GF2842980@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 03:07:25PM +0000, Lee Jones wrote:
> On Tue, 13 Jan 2026, Jonathan Brophy wrote:
> 
> > >>  drivers/leds/rgb/Kconfig                      |   17 +
> > >>  drivers/leds/rgb/Makefile                     |    1 +
> > >>  drivers/leds/rgb/leds-group-virtualcolor.c    | 3360 +++++++++++++++++
> > 
> > >This is an unreasonable request to ask of any reviewer.  I certainly don't have the time to go through this in any level of detail.
> > 
> > >--
> > >Lee Jones [李琼斯]
> > 
> > Hi Yes it Is a big lump of code
> > I will break this down into features and separate the driver in to sub 600 lines of code in a future patch.
> > 
> > I'm a junior coder It is easier for me to compute as a single file but yes you are correct it is daunting.
> > 
> > Ill finish additions and features first then send an update patch with the driver separated for ease of review in the future.
> > I expect the code to split nicely into separate sections as the below layout: 
> > core.c
> > arbitration.c
> > phys.c
> > vled.c
> > debugfs.c
> > virtualcolor.h
> > 
> > Would this be a better arrangement ?
> 
> Patches should build on each other in terms of functionality, not filename.

While I am 100% with Lee here, the filenames strictly speaking are orthogonal
to the patch split. But they are still helpful for the end result. So think
about both file split and patch split (and the latter one in terms like Lee
described below).

> The first patch should provide just enough functionality to be useful.
> 
> Then build it up one piece at a time.

-- 
With Best Regards,
Andy Shevchenko



