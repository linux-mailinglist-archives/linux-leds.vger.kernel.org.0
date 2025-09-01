Return-Path: <linux-leds+bounces-5333-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F3B3D96E
	for <lists+linux-leds@lfdr.de>; Mon,  1 Sep 2025 08:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C4C27A12A1
	for <lists+linux-leds@lfdr.de>; Mon,  1 Sep 2025 06:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82DC137C52;
	Mon,  1 Sep 2025 06:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYdKlAod"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24316A921;
	Mon,  1 Sep 2025 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756706670; cv=none; b=QzXKG6RSU0qM8wYeuq0gRLjrA1S7FynMy4XvRrlhPuMpYv2CYTEqIbj4iqdpkaCb/LdPDe+MKOGpy+gcT7hjFc0T7tutJIjAM9DDDWtecOAb398OGyUbhm2vtG4HGTT7aP8O+EOauS+nIIpKEcGrntaBFFZwpcKW+CMcL+QXTZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756706670; c=relaxed/simple;
	bh=hrOGCHRdPzLoI9jpZP9BBn52fRA4tLo8dDuTWV6k5TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hy5P29HSOwQZO6c56QgYeSepKmhPXUfuGrTMA7USWI7aB78ObG9RaWhWUoB+hTmXzjZLnXcHXuS13PktpNUQip6VsOC1PCW9POXOgYYvVDdIe1ilG/Nlr+0Og1WU5Lwgw4FIHSMYW7qsNmMne1EoF/nx+niR1iOAyGP2WwXwnNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYdKlAod; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756706669; x=1788242669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hrOGCHRdPzLoI9jpZP9BBn52fRA4tLo8dDuTWV6k5TI=;
  b=nYdKlAodRcKSjCF8PyCOXT48AbCcufo3JdTgU6EYF3/UpM+SmKpAITjD
   DVQU+WcYJ12SUfwq3uDezt0JCdxSFzNp0+ixpMyih+WH4w1CI/Bbi3Qzy
   zzaHJO2XdOyoN/sgXSkMdeqx/plBeV0ARMRr/stDh72+2ruUnN4Q3vTY4
   +oR7k0DjEHSCPmKbpLvidadBSuX0Ge+ha3TBAci9sqgRD7QkjIWenOj1S
   yvOexlrY7qFw2Z6epwS9mY3/Sb7NmdFayLRhc4FUV5341i/T+sigU1Of1
   U1PJhCvyrhABwWp18J87/Qa56AYmL+PFwgeBlMqLTzhpPYD3YaOaBasn3
   A==;
X-CSE-ConnectionGUID: vq2rBRgATvKwzx6HrSQCtQ==
X-CSE-MsgGUID: iqWqHVb1TqCQvJ9w8YFn1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="57922240"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="57922240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 23:04:28 -0700
X-CSE-ConnectionGUID: j9yWdkwnTEuiPB3jSGrxSg==
X-CSE-MsgGUID: um6fA0UrRVmdsnOIr1iUJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175042337"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 23:04:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1usxeQ-0000000AGsr-2W1y;
	Mon, 01 Sep 2025 09:04:22 +0300
Date: Mon, 1 Sep 2025 09:04:22 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 3/6] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
Message-ID: <aLU3ZhOaBlE-e4gO@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
 <20250825033237.60143-4-jefflessard3@gmail.com>
 <aKx9zQNppjNNMJEt@smile.fi.intel.com>
 <3E7CE725-4C10-41C9-9B44-58E7EC6B5F4F@gmail.com>
 <49F7228C-0EE6-4202-A2AF-A023B4A4DE4B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49F7228C-0EE6-4202-A2AF-A023B4A4DE4B@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 27, 2025 at 02:37:47PM -0400, Jean-François Lessard wrote:
> Le 25 août 2025 13 h 48 min 45 s HAE, "Jean-François Lessard" <jefflessard3@gmail.com> a écrit :
> >Le 25 août 2025 11 h 14 min 21 s HAE, Andy Shevchenko <andriy.shevchenko@intel.com> a écrit :
> >>On Sun, Aug 24, 2025 at 11:32:29PM -0400, Jean-François Lessard wrote:

...

> >>> +		fwnode_for_each_child_node(digits_node, child)
> >>> +			display->num_digits++;
> >>
> >>Don't we have a _count API for this?
> >>
> >
> >I'll use device_get_child_node_count() instead of manual counting loops.
> >
> >>> +		dev_dbg(dev, "Number of digits: %u\n", display->num_digits);
> >>> +
> >>> +		if (display->num_digits) {
> >>> +			display->digits = devm_kcalloc(dev, display->num_digits,
> >>> +						       sizeof(*display->digits),
> >>> +						       GFP_KERNEL);
> >>> +			if (!display->digits) {
> >>
> >>> +				fwnode_handle_put(digits_node);
> >>
> >>Use RAII instead, we have defined __free() method for this.
> >>
> >>> +				return -ENOMEM;
> >>> +			}
> >>> +
> >>> +			i = 0;
> >>> +			fwnode_for_each_child_node(digits_node, child) {
> >>
> >>Ditto. Use _scoped variant.
> >
> >Well received.
> 
> After further investigation, _scoped variant exists for
> device_for_each_child_node_scoped() but not for fwnode_for_each_child_node().
> 
> I suggest to include an additional patch in next submission to add to
> include/linux/property.h:
> 
> #define fwnode_for_each_child_node_scoped(fwnode, child)		\
> 	for (struct fwnode_handle *child __free(fwnode_handle) =	\
> 		fwnode_get_next_child_node(fwnode, NULL);		\
> 	     child; child = fwnode_get_next_child_node(fwnode, child))
> 
> #define fwnode_for_each_named_child_node_scoped(fwnode, child, name)	\
> 	fwnode_for_each_child_node_scoped(fwnode, child)		\
> 		for_each_if(fwnode_name_eq(child, name))
> 
> #define fwnode_for_each_available_child_node_scoped(fwnode, child)	\
> 	for (struct fwnode_handle *child __free(fwnode_handle) =	\
> 		fwnode_get_next_available_child_node(fwnode, NULL);	\
> 	     child; child = fwnode_get_next_available_child_node(fwnode, child))

LGTM!

-- 
With Best Regards,
Andy Shevchenko



