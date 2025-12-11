Return-Path: <linux-leds+bounces-6406-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D228CCB6152
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 14:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34730301B2E5
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 13:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771612327A3;
	Thu, 11 Dec 2025 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxcR/LQC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773DB45948;
	Thu, 11 Dec 2025 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765460817; cv=none; b=NahkCGeEPoQ4+sYONAJLY79ndCPCdVn+qkYh6ZsN57O2azR8oLJ71f8uWPT0pD8XTKPAUOxddJuvtXV5/TmKRBaai7gCXXlPuMoFR2Xp2ultGPM4TvTdwMmi7ylpWaQ2hSMYO3Qly/3a97A+WxoPKLlds8KuLNociS1MJ3ERVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765460817; c=relaxed/simple;
	bh=kq5phqcXywPI7qShpWY6a+pfaqL+MR4jd5JDFFRnQhs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkilYziquObWrCPbtUuvDEfxv3yavfiuLWbSVK86CnkIMNPE0gv02a3Yd2pl2vu+PJMDbEvfdPYJV//On0/GDVbcutxvjb9+2btYqftORME7bYL3qZfxrGK2RsrPp84b2Pxqj+Z0r5hDdM4MxrZmG7LVIfU9MJHB3hcv5DJ9KI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxcR/LQC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460815; x=1796996815;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=kq5phqcXywPI7qShpWY6a+pfaqL+MR4jd5JDFFRnQhs=;
  b=DxcR/LQCug4zqoz5xdrHZ+h6Y74rI5xslUnPxDz/rU64VjJZ+FB+IAsS
   jIlRA8w3YP5KaMw8v+gnJ7LVUpoo5WIRjdYE0K7BhTHSX1EwQQb2NJX2Y
   Oq5uZTArMPZTQBzUzhdQS0E+blHayEgrmjNWtTFbHTETKvyxx/Zb4DpSi
   326FkOVo/rjm1JxrYKTDMOVErjCL5zX52kESnCiFZkkN4p5G8/znhdIJc
   u/DxzCq5E3ppFFR7/AUBnE9azLxwmdRkc+24SOu7YpZpHJKWfI1gBU4i4
   iunPZu2d0jSArohAD9iZEgxyD2AsZTV6PHZU/908+mnjFNUfu3cJPQsrQ
   A==;
X-CSE-ConnectionGUID: FCfKr9FPTh6uSueZmcBC6w==
X-CSE-MsgGUID: 8m3Rl6PTSuaCqi0enAnYjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70022734"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70022734"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:46:54 -0800
X-CSE-ConnectionGUID: QncUw5drSXuzSDi0usCjNw==
X-CSE-MsgGUID: 90Fz7G+uQUS6/0AmrbbW/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201710881"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.250])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:46:53 -0800
Date: Thu, 11 Dec 2025 15:46:51 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>,
	"lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Message-ID: <aTrLS84EjEGuSXC1@smile.fi.intel.com>
References: <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
 <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
 <20251211-plural-generic-c7e78cd51f9d@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-plural-generic-c7e78cd51f9d@thorsis.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 11, 2025 at 01:34:10PM +0100, Alexander Dahl wrote:
> Am Wed, Dec 10, 2025 at 11:54:19PM +0200 schrieb andriy.shevchenko@linux.intel.com:
> > On Wed, Dec 10, 2025 at 06:30:06PM +0000, Jonathan Brophy wrote:
> > > > Can you elaborate? I think your downstream code (I have no other ideas where you Q came from)
> > > > uses some outdated approaches. Try to look at the problem from the level of the existing APIs and 
> > > > frameworks. We shouldn't really have such an issue (but it might be some special use case, I admit).
> > > 
> > > I'm trying to create a virtual led driver but with the removal of
> > > of_led_get() im struggling to find a way to make it work.
> > 
> > Still it's unclear to me what it means and how the code look like.
> > Perhaps you need to send some patches for the discussion (maybe as
> > RFC if you think they are not upstream ready).
> 
> I guess it is about the patch series Jonathan already sent?

I don't know, I wasn't in Cc list there. And it seems the series got a lot of
useful comments already. So. if next version being Cc'ed to me, I would review
it. (Going ahead: the series, if survives the approach, has a lot of style and
related mistakes, like wrong kernel version and data in the ABI documentation.)

> https://lore.kernel.org/linux-leds/20251019092331.49531-1-professorjonny98@gmail.com/T/#u


-- 
With Best Regards,
Andy Shevchenko



