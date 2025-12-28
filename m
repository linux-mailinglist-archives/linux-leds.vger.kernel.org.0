Return-Path: <linux-leds+bounces-6475-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B5CE56CC
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 20:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87745300A877
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABC627F195;
	Sun, 28 Dec 2025 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVSzxy7/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F67023D7E6;
	Sun, 28 Dec 2025 19:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766951801; cv=none; b=ZCybZUaeBrtO4q9MKhqIvVdNBW5zs2NDDwAtetbz6si8qRUSSNTIZDTlojQEagWWVaWcK1U48xViP7fYWLOYt0bFdanOExk5mXsT5vwqtFzTg3DVskbhu3PzzWzHsIGzNJ5jhjCcxivJ2gBXPnD41Ai7f+mVisWhG17Qo7ZrlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766951801; c=relaxed/simple;
	bh=/f4zd0oh9Rx+Q0h5fPcM3Gq9TC58EbDW1WDvlW9gTJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAIMuSCR+k4icy8uHAyxK4pM/awpG/5+YfR/kHldt1MHfHpEs8EnhnMK6q2XEQAoxOiNpG2QAK9NPSXwxnJ1irnBjtpZQsxhFhlIgUv8yf68C3fpl9RmF89t7YYxz+UGANjckdw3XH8ZgBNpy9MnzlncNxrvN6J51FmZGI/wOr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVSzxy7/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766951799; x=1798487799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/f4zd0oh9Rx+Q0h5fPcM3Gq9TC58EbDW1WDvlW9gTJc=;
  b=gVSzxy7/riStJXi2yptbm/MTP1T6EShSbJGfLKHj2yBCQ1ckVqkE6ndT
   25ZuK+ETohMWFqjlVg9Y9vg2FSgk/2eHOVJICNrQ3A2Yp7jpRR5lrmXFH
   CLav/NBXw11MR8qOc0mXFEpSSo4XvNuD3r33j+bGdrz1+ilvAgBZ7Mr3S
   7BkXU2QNtw1qRP5o1eTntcJbUlTFVbCqA8FSL8hDtPnE7gUqrt4wBc7IM
   RDaUAXeXWbzjMkMBptROpxixuq71K/yU0OlM5vte7Z6/vV8he9bbxa1Ti
   B+MfvUA8+hUppVUJsRshu2ceDVWNXuXg4vMb77PXLTwFVjEAYi5ccdmPe
   w==;
X-CSE-ConnectionGUID: psd0DaZaQomzYgAWVBFpjw==
X-CSE-MsgGUID: TTi5ZjRGSyCy/s1JJk3/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68476328"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="68476328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:56:39 -0800
X-CSE-ConnectionGUID: kZtlIxK+TaaJjOfK60Sn6w==
X-CSE-MsgGUID: dsSqM6XLRNmsXIFAJUXS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200778818"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:56:37 -0800
Date: Sun, 28 Dec 2025 21:56:33 +0200
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
Subject: Re: [RFC PATCH 1/2] leds: core: Add support for led-instance property
Message-ID: <aVGLcXjtJX4j8Kf5@smile.fi.intel.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <20251228182252.1550173-2-professorjonny98@gmail.com>
 <aVF4g_W2KHQ53gbJ@smile.fi.intel.com>
 <DS0PR84MB374654D9715FE2FAAC4C299D9FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DS0PR84MB374654D9715FE2FAAC4C299D9FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Dec 28, 2025 at 06:43:18PM +0000, Jonathan Brophy wrote:
> >But this will be called unconditionally even if the
>=20
> >function/function-enumerator is present. Wouldn't these be conflicting o=
ptions?
> >
> Good point! You're right that function-enumerator and led-instance could
> conflict. I'll make them mutually exclusive.
>=20
> The semantic difference is:
> - function-enumerator: Numeric instances (0, 1, 2...) =1B$B"*=1B(B "lan:g=
reen-5"
> - led-instance: Semantic instances ("port23") =1B$B"*=1B(B "lan:green:por=
t23"
>=20
> Having both would create "lan:green-5:port23" which is confusing.
>=20
> I can add validation to reject DT nodes that specify both:
>=20
>   if (props->func_enum_present && instance) {
>       dev_err(dev, "'led-instance' and 'function-enumerator' are mutually=
 exclusive\n");
>       return -EINVAL;
>   }

Dunno. Maybe Lee can comment and/or suggest on this...

> And document this in the DT binding:
>=20
>   "This property cannot be used together with function-enumerator.
>    Use function-enumerator for numeric instances (0, 1, 2) or
>    led-instance for semantic instances (port0, battery, usb)."
>=20
> would this be ok ?

In DT as far as I know the special syntax is used for the mutually exclusive
properties. But not an expert, better to wait the answer by DT people.

--=20
With Best Regards,
Andy Shevchenko



