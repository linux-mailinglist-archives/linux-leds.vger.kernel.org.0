Return-Path: <linux-leds+bounces-6403-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7ACB41A7
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 22:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AD43016999
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 21:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D657322B70;
	Wed, 10 Dec 2025 21:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POXWsM5M"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783525C6EE;
	Wed, 10 Dec 2025 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403666; cv=none; b=SmnystJNsouRwqq8Nr+NZ/sjRCBkwRXF/RqWxGUpJcL6ARmdHR45RkTaMHAIxIHzBgZH757R6V/BWi2tGZ5IpXHd0foxoETFUjSTlzn6svBOcf4lgMfRgmO6ViJqYrqNzAqcaLhKLb4/QmodVA3QKbpfczvEjVLZlu2LnJtCv3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403666; c=relaxed/simple;
	bh=zhheq1/ImKAjEjsa65e6T48Ku5nuSlsbl3+bu7jvG1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcdbeR8QD/Ejsrh7rRpXNknNlNQ8GiRdHffHkguzmP8R7mZLIR7d2np9HrDGM70nJ5134g8y/SZLuboqUdjuKqMx2q1SqAossQ85VJdcDNxPDE2wfgy/yAY/mksvUxLg/BFqX3vTdYR5Jka2HMny4coMl5yEUWr8/ZUJjIejP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POXWsM5M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765403664; x=1796939664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zhheq1/ImKAjEjsa65e6T48Ku5nuSlsbl3+bu7jvG1Y=;
  b=POXWsM5MKBcZn3ykVJWlcROWkW4w0fIL8qzcWaCLHcMfVj65/QyivI5J
   Wl+PqW/kpsh9z4HqKv4xf88iiE4wlQnObM2F2HdLPktyVr2UFnMwQ1A8x
   BWLFxBdqLlMjosugFla9psi0R69NDpaGCUKlAz3LCQKlRFEbr89vXAlCr
   qqNjcp+wKes8UA5Dj3gbwGWxyaov69cfeRfACL6a7fegrTX632EukuLB5
   O4L/M7cW6vNwvpLy0FAYQNs3JFozGjCGeSWLfvLtWMP99K2gJrq12W4Fb
   KYNBB7xA/Gxy/5/Bgrr4/KQEM0SP5ZPgbOahSJ1BhOf/zxuDvtnbeIzLk
   g==;
X-CSE-ConnectionGUID: CtZM0Yg1Q+yszqlVrqcaOw==
X-CSE-MsgGUID: +XF+eI36RpOguyxPUxIbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67459557"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67459557"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:54:24 -0800
X-CSE-ConnectionGUID: 3By5uwxLSLuM26p9Dx8RWg==
X-CSE-MsgGUID: JjyhLkdGT/aguKCSRH03xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="195705960"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:54:22 -0800
Date: Wed, 10 Dec 2025 23:54:19 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>
Cc: "lee@kernel.org" <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] leds: Unexport of_led_get()
Message-ID: <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
References: <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
 <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 10, 2025 at 06:30:06PM +0000, Jonathan Brophy wrote:
> > Can you elaborate? I think your downstream code (I have no other ideas where you Q came from)
> > uses some outdated approaches. Try to look at the problem from the level of the existing APIs and 
> > frameworks. We shouldn't really have such an issue (but it might be some special use case, I admit).
> 
> I'm trying to create a virtual led driver but with the removal of
> of_led_get() im struggling to find a way to make it work.

Still it's unclear to me what it means and how the code look like.
Perhaps you need to send some patches for the discussion (maybe as
RFC if you think they are not upstream ready).

> I investigated alternative approaches to avoid of_led_get() dependency, including:
> 
> Direct class_find_device(led_class, ...) calls - Failed because led_class is
> not exported (static in led-class.c)

> bus_find_device_by_fwnode() - Failed because LED devices are class devices,
> not bus devices

> Manual iteration via class_dev_iter_init() - Failed because I cannot obtain
> the led_class pointer
> 
> of_led_get() appears to be the only viable solution because:
> 
> It's the only exported function with access to the non-exported leds_class
> It handles GPIO LED matching quirks (parent node vs child node)
> It provides proper reference counting via led_put()
> 
> Should led_class be exported, or is there a planned fwnode-based alternative
> to of_led_get?

You can introduce it as a precursor to your driver. But OF centric variant
gone for good, we use fwnode in a new code.

-- 
With Best Regards,
Andy Shevchenko



