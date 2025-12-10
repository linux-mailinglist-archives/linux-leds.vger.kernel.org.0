Return-Path: <linux-leds+bounces-6401-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A58CB2E61
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 13:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70F2030080ED
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 12:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B3A2C0286;
	Wed, 10 Dec 2025 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dh+RZb0I"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4CC28000B;
	Wed, 10 Dec 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370022; cv=none; b=jibAY5pPrlaOppgY5OxPYdzFcinM9FpWMu6HNjReqpUytP+T6eYZSO67JjUcEjN7xxdGPYheH04M2+RzMUVFwVzMGaPvBIjSr3d/Y5AsCIZOEbKgxlnZBgwQ0IBEeBglFe6NvobwXQT5Parwn1tutbjoctoitJdVZ2g4+zlV4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370022; c=relaxed/simple;
	bh=ru83obOTS7DqHD4vyjoQvDVkI1zTw1gV9vToye8tgYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtQdaAGnqrjqewg4CUDDUEPfApfHsQrc6yCp2mYgIG01f7g+0C0XgpissyAwKo2OK7eDS+2WQu3EyfIvMEq4NF5Sc8ht/THJ3kDdXFLVb02d9bx0sSv70AV0HiZIcdOGHZBAhqKpRsixSt0bp7jpWgA1SfsqLEJe4C/ZhMLMNBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dh+RZb0I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765370020; x=1796906020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ru83obOTS7DqHD4vyjoQvDVkI1zTw1gV9vToye8tgYE=;
  b=Dh+RZb0I0UxBqP5Z9XH3JfSnvhwtb6HnVMbosHKkaJh26t3UBh+nmw0O
   NSJnb8HaLec1uox8TZVqm7hs4/C80HQunhfzcPz2ihXCMkE9DJSapO/5Y
   BHs25ZBck/2fu71VYsrZQIU5w4vx7GuaTCEKlVagff5NNBtJCVOAdrIls
   DC4oRKeyOQTa+FJRgXeCObNi41XDyHsWFypeKihzvQp/GhzkxU9WA5LcR
   nkqwhtL1OdE+Cbt0sLfBBWxQBDOBmdkaC34FPkZsW0KiIzPVND3oHNV5+
   GOTq4ZfQEWlZbnOTU/tttYMJB5WNnox2IIWh0Vin0ok4nglosxErv8nNh
   w==;
X-CSE-ConnectionGUID: kzXXkSjYQ3ezMDLe2eh8Zg==
X-CSE-MsgGUID: geWEAoCiT86ndoFxQf5P5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67298194"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67298194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 04:33:39 -0800
X-CSE-ConnectionGUID: I+eFBJZ8ScmXPEFxb/Bd+A==
X-CSE-MsgGUID: DKs99VFeQOCGrNCMwXCqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196412994"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 04:33:37 -0800
Date: Wed, 10 Dec 2025 14:33:35 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>
Cc: "lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Message-ID: <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
References: <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 10, 2025 at 10:43:38AM +0000, Jonathan Brophy wrote:
>  [PATCH v1 1/1] leds: Unexport of_led_get()
> 
> it would seem the removal of this function has removed the only way to search
> led phandles the device tree.

Are you talking about upstream drivers that now regressed somehow or is it
about downstream?

> The devm version works functionally different and is not a replacement.
> virtual led grouping drivers are unable to match phandles.
> is there plans to create a fwnode_led_get() replacment for of_led_get ?

When there will be a user that may not call existing APIs.

> The problem is gpio leds don't have fwnode properties so searching by
> platform does not work.

Can you elaborate? I think your downstream code (I have no other ideas
where you Q came from) uses some outdated approaches. Try to look at
the problem from the level of the existing APIs and frameworks. We shouldn't
really have such an issue (but it might be some special use case, I admit).


-- 
With Best Regards,
Andy Shevchenko



