Return-Path: <linux-leds+bounces-6476-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE616CE56D8
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 20:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24DF2300A341
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C016D27F75C;
	Sun, 28 Dec 2025 19:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CA9GTJXq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30CD1FB1;
	Sun, 28 Dec 2025 19:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766951965; cv=none; b=HkJ52rInobBxOxXlN+erRrP7+NopZUjPKchx82edkUSsWu4qwt1zljy0tgsgi1VNlbECfHRXBAfB9viUm6CdKBsaMlNGpQWR3BomotCscto8AE97EfDkReY1tpU/cNd8sG2iyYoJ4fLeHA3sVLAMdvUVbTuquyMHX4zZhJCEWgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766951965; c=relaxed/simple;
	bh=wi0G8+jT3bG/RuAYyZJ556azNwt0UbCddE4acJhI7k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbVYGUaKWLUcdm9plgiKemXhjF8yy/kWr0qr3MzNL0f6gcygYJU0eSxHUDnfeJkoZOLVhSEAbQ8vUoaH/+j83yoIbQeUuTDABKjTJaK/70yjK6cBpZgstSmxHepKvvUjL5OuCcJ22MRSXghZ8tgUAkzks008R0Occxkc6uPFtnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CA9GTJXq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766951964; x=1798487964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wi0G8+jT3bG/RuAYyZJ556azNwt0UbCddE4acJhI7k8=;
  b=CA9GTJXqJHtqL0474XYnFYPGCuTrya5iSpR7Yp5G2zjnQt/dW2SD5ESe
   gcJD6ozxY4cVVi8C+2kyYHYiqgf9UqjZ5gr+d+vXsHZJCSwA4tAfmsIQD
   MsVgmv5hm9hoXMGJaJpzylz1ojo7H1VeLjgeHwNA7lLqLWdr5uuFkBvo7
   lgwcV9IWzSoeKya0fLdmy3QZB6sV1M/SP9F7XTbT95VJ+SAz35Jr7FhjG
   HAfTNApIXA5C4sQdFGsRjROARCVmI7hVNsRt8IvknL9805HElp9kAl4NX
   FUo07NQ0/62sclxw7reLwxmiKGADk9LIVXzPAGs0wkxOFC9nv7Az8wMJj
   w==;
X-CSE-ConnectionGUID: gJDmYckeQ2arH46qIxP6OQ==
X-CSE-MsgGUID: L3zJOD9UTJ+mAFetS+x6/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72435447"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="72435447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:59:24 -0800
X-CSE-ConnectionGUID: +YmOERjVQdmHsKViJ9UgmQ==
X-CSE-MsgGUID: Nmv0ivG9TdS277bCrYFfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="231843228"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:59:20 -0800
Date: Sun, 28 Dec 2025 21:59:17 +0200
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
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Message-ID: <aVGMFQOd3c0Fvfxh@smile.fi.intel.com>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <aVF3ZTxqSXWVcCVN@smile.fi.intel.com>
 <DS0PR84MB3746809655135654882AF9D39FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR84MB3746809655135654882AF9D39FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Dec 28, 2025 at 07:14:09PM +0000, Jonathan Brophy wrote:
> >Hmm... I think the research missed the udev + sysfs approach as done for the
> 
> >networking devices. Hence the question: do we have enough data in sysfs for
> 
> >leds to understand their HW connections / semantics?

> I looked at that also but I don't see a way of it working with the current led attributes:

Okay, thanks for the quite an elaboration!
With that in mind I think your approach is okay, but I'm not a maintainer
to make a (final) decision.

-- 
With Best Regards,
Andy Shevchenko



