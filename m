Return-Path: <linux-leds+bounces-7103-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFvxLIWOqWni/gAAu9opvQ
	(envelope-from <linux-leds+bounces-7103-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 15:09:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25787213084
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 15:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DEA73005664
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 14:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDEF3A0B05;
	Thu,  5 Mar 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4SBhd6f"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8663822AE
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719745; cv=none; b=TCFc/tdfsvyhvAerCXfuPqa9GkgfllQOBYFKKlaMp6BXByAoTaNjkpS5JTfsd5sK0gb1wpBJzJkr4NhiE7BvVvxK7umi4kiA+ufPbKEvwpuFagdHxdkPgxkkCdj/rKyxbcPkUEgi3of8lfER1ufOktpzwR6tQwfVkW9UBN6ux+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719745; c=relaxed/simple;
	bh=HW6yfFQ9Jv9bLTg3Vn6WyYLa63gs/cJlW+wBSmbOKiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyHIvjvPmmX+LG+IwFStNRmgsCr9jNJ2pvJdggDnWn6gfq0T8Nki4mPX5x1z9CUrYyqmRHxmhqYLqJfSfvDdOVuQ1bNxQme/O2/haXT7c08aWrNWSt07ZtDRGdFFW/e44EoFGbclARg2y48j2BjLp3HwRvd8kJ5YDf91jcdX9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4SBhd6f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772719744; x=1804255744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HW6yfFQ9Jv9bLTg3Vn6WyYLa63gs/cJlW+wBSmbOKiY=;
  b=d4SBhd6fS6AdiroYQX+f18afXJbEQ7dqk+PEUaWr1g6wiZRfaqQTqffF
   64XYeFjFNOli0PD4CbJ/4WF826Lj+KtiXgGQzq8GGGmqf7Zs+KtA0VZ1/
   EGucj3QS6en8Nu/T44xztKyp2LHG0vOnH/X/37nQ2eG9HfWrvTndypb0O
   gWNRumMhOvzYrDXodTOzbM9mcESsRjYNx1aV8LZfU/FxFsNGJbA/2jUr+
   p2BxFiUoDwk4KQj0ABI7MJ4m5fO110TSjHFyZ4lu1ozzKGC3Tc8iJAYCo
   xI3QcZd6u801fNyCJT5YuVBp+E4tUx3sCH6xkfuBn4LFiQsVfdAkWxFde
   A==;
X-CSE-ConnectionGUID: ahW+SBcSQ/q28kzK38Ro7w==
X-CSE-MsgGUID: twMO2ZgOTQ64H1xpP6eang==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73675926"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73675926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:09:03 -0800
X-CSE-ConnectionGUID: MLZyYDP0RriL45eYNmIEBg==
X-CSE-MsgGUID: y4KV1ErVSqaaBjnt/Slcyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="256580778"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 06:09:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A3D3195; Thu, 05 Mar 2026 15:08:58 +0100 (CET)
Date: Thu, 5 Mar 2026 15:08:58 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <aamOejvtN8H1zB0E@black.igk.intel.com>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Queue-Id: 25787213084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,gmail.com,ucw.cz,vger.kernel.org,pengutronix.de,topcon.com];
	TAGGED_FROM(0.00)[bounces-7103-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> intensity should not exceed /sys/class/leds/<led>/max_brightness.
> 
> The interface doesn't check the values and higher values may lead to
> unexpected color changes if the brightness is changed.
> 
> Clamp the intensity value to max_brightness.

This also brings a regression if somebody doesn't care about wrapping around.
It's possible to return an error instead, but still the user space will be
broken (in some rare weird cases).

Again, I care even less about this change, but be always careful,
the main rule in the kernel "We do NOT break user space".

-- 
With Best Regards,
Andy Shevchenko



