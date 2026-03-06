Return-Path: <linux-leds+bounces-7132-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KASLAgXvqmmOYAEAu9opvQ
	(envelope-from <linux-leds+bounces-7132-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:13:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E34722391C
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9428B30517DA
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B593A1A32;
	Fri,  6 Mar 2026 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7sezYBL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DFA3ACEF9
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809719; cv=none; b=XKoIsy7O1dCz3IA9AQ/YkyOS4OF3uJggwswyAlvgLIaMVKv1/CNpHDq7QJ89plN42EuuXIStiyyFtez4pjSoIZ90ihO6huG+zarhMh4dGEOHRjFBqkPkyLUbDvNtIDos4MYEf+0Pju7XtYjF9Xu4JvhAWQ5kyNGprQ0B1O7VjqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809719; c=relaxed/simple;
	bh=M0SEldi4oGSKtDQZSbelAHNzS9DNYKVsYceeFCRPAkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/r6fnJ7ThxpQJOGkroS9x6wbScH1ycgI7ZhSg2c0rB2xZDlgc+FX3/h5ZXb8GSJ52jGvO3EcyvZgeh3pql5WsSubZ7xP+jKXgplywxWZzn9CP4XkiFIwuoH4tU687aAPsUmXjWTihWvj6RnjDouM/Nuc0W29qFhWnmjkW1Wlw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7sezYBL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772809716; x=1804345716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0SEldi4oGSKtDQZSbelAHNzS9DNYKVsYceeFCRPAkU=;
  b=F7sezYBLp1ap+JHTntygE1H/jfcQR0jbsrnfkZI0QAEDOfa/V3/myAp6
   qZNPGvNOM6h5J/RI58tHN6N2vzpEqen8/YyA3CbAZyjwi66ZG4GSKdvcV
   +UmY+zL5zp5r96tdX7m4UyGKHVwQk/Rjab8dEapZ38VSXodTBiuCM4zi9
   dNFVc5jU8Kq1vVv+iNWbsGW361j2iz8PQTZ45kIOp39h2RhJJ/FlMWICR
   53X5Cu3zOZfQ3V2Hl5TwuwrXsMn++vK5RqUD5RVpk53Vrpv0CRmuvJenI
   52Lmti0Qm7lvYDMqWXUisx+BP/JvnnEXAAmhZGkqwVDGhez4PfaXAJ9YB
   g==;
X-CSE-ConnectionGUID: 5A53tkd8SimFCpt8Wv6gHg==
X-CSE-MsgGUID: FPw8gcs/QzKc9WMd3groKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="91305367"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="91305367"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:08:36 -0800
X-CSE-ConnectionGUID: MhdrIpP7TASuZj8B7dPJDg==
X-CSE-MsgGUID: sjwR5QwaR9m5tZNBBgLEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219160150"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:08:33 -0800
Date: Fri, 6 Mar 2026 17:08:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <aart7mRg0LiiyH71@ashevche-desk.local>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
 <20260306113055.GH183676@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306113055.GH183676@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 8E34722391C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,ti.com,gmail.com,ucw.cz,vger.kernel.org,topcon.com];
	TAGGED_FROM(0.00)[bounces-7132-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:30:55AM +0000, Lee Jones wrote:
> On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> 
> > On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > > 
> > > The interface doesn't check the values and higher values may lead to
> > > unexpected color changes if the brightness is changed.
> > > 
> > > Clamp the intensity value to max_brightness.
> > 
> > This also brings a regression if somebody doesn't care about wrapping around.
> > It's possible to return an error instead, but still the user space will be
> > broken (in some rare weird cases).
> > 
> > Again, I care even less about this change, but be always careful,
> > the main rule in the kernel "We do NOT break user space".
> 
> What are you saying?  I should remove this patch?

It's up to you. I'm saying that this patch deliberately breaks
*misused*, but working user space. I don't care if this patch
goes in or not. The change seems logical, but it should at least
explain that misused user space won't work anymore.

-- 
With Best Regards,
Andy Shevchenko



