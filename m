Return-Path: <linux-leds+bounces-6518-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80CCEE8CD
	for <lists+linux-leds@lfdr.de>; Fri, 02 Jan 2026 13:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 942543010CCC
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jan 2026 12:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B806230E856;
	Fri,  2 Jan 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKzT0HvV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49722D47F3;
	Fri,  2 Jan 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357445; cv=none; b=HbT0cL4CAn2FBWJ3+W9aMAKAiSrSsuktyaJlTjZLvP7vMwY4Bv3zsEWXTsfkxKsLUYzGwGodVumuOrrJSt+p7Fvo5HES2ICurJ1MQymDwSxVaZlgNnnG6Urc2jxz6yedTYfAaNc7nLe6ZfUVTYfqFmSL44SA7WE5SiEAPghDb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357445; c=relaxed/simple;
	bh=7Rk0yeVXcV1S1WfT0PPaT2pcKMSwxTqqqT++2T5PXhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qtff4vhuKZ1fy0+FHeBDs2V25ywdJhSowT1a4piPho3O8CrEyKdV5xeHcRxsT7jhNTuasTPmHJ3HKpJ1Ospcxi90x/4+VGIqguEH+Qa27bwAzwGuFsXplrRTrap2nGHSiN4CYjxzOPwtJaDYl2+8kRT59NjRf6z4QLKaGdT7lbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKzT0HvV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767357444; x=1798893444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Rk0yeVXcV1S1WfT0PPaT2pcKMSwxTqqqT++2T5PXhA=;
  b=hKzT0HvVaIoPmD1rUrEbbHbW9+rG1bXKiRUU6HHaHIqTRIXxkFjxKHvG
   yOaaoTf/VcfclZsqFflwq2ie/YsYwS9jVuQs3pMC13HuNNm6GNyVXnP7V
   dAndVScI1ORuRL8VmTHTSkWvq66FdX22mZlPVZkN0Ash3n60PlGT/iMg2
   vFLXk+qQwFwI983Zph1JdoW0uh+dCPqRwZM6xhygzPPka/U49JdT06Tsm
   NKYwJroVBKu8bnUwHS1d6cJx8ctsrYfnTPQLMu8cukbwaLuTvfpIaCXOC
   HKA+EKp1kdyguEOdUmflJrxaKqVUVvsOmhvZQCwJPQh0K1n/TDW09oW3w
   g==;
X-CSE-ConnectionGUID: g2ctpb2CRl+2vI2SGpJ7Rw==
X-CSE-MsgGUID: h2xQuTDQSq+zxSzxlu0Naw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68758386"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68758386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:37:24 -0800
X-CSE-ConnectionGUID: ibxrsjkoTB+2crjlJ5E5Cg==
X-CSE-MsgGUID: Pw1RGovFQ9qkEvrgvpBPpQ==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.46])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:37:21 -0800
Date: Fri, 2 Jan 2026 14:37:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tiffany Yang <ynaffit@google.com>
Cc: stable@vger.kernel.org, pchelkin@ispras.ru,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 5.10,5.15,6.1,6.6 RESEND] leds: spi-byte: Initialize
 device node before access
Message-ID: <aVe7_7Jf_FWkBhqH@smile.fi.intel.com>
References: <20251231004510.1732543-2-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231004510.1732543-2-ynaffit@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 30, 2025 at 04:45:11PM -0800, Tiffany Yang wrote:
> Commit 7f9ab862e05c ("leds: spi-byte: Call of_node_put() on error path")
> was merged in 6.11 and then backported to stable trees through 5.10. It
> relocates the line that initializes the variable 'child' to a later
> point in spi_byte_probe().
> 
> Versions < 6.9 do not have commit ccc35ff2fd29 ("leds: spi-byte: Use
> devm_led_classdev_register_ext()"), which removes a line that reads a
> property from 'child' before its new initialization point. Consequently,
> spi_byte_probe() reads from an uninitialized device node in stable
> kernels 6.6-5.10.

I'm wondering if in long term the easier maintenance will be with that patch
also being backported rather than this being applied.

> Initialize 'child' before it is first accessed.

-- 
With Best Regards,
Andy Shevchenko



