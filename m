Return-Path: <linux-leds+bounces-7400-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG/NFUgZvGlEsQIAu9opvQ
	(envelope-from <linux-leds+bounces-7400-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 16:42:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6872D2CDDBA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 16:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C0F4300D0EA
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 15:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC653DEAC3;
	Thu, 19 Mar 2026 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VK/Ofo3/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C773D9DD2;
	Thu, 19 Mar 2026 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934624; cv=none; b=WdCQigfdBNrY+qZ7FjBjlzAi0dCBHQQM6dpLebFxxEgUDJnbsW6KAH5jaitMcR9nvdcIxaci6A99oRSjOat6xyxS+FvJJshhxXYTBwnegK0Epaf7TRSmeXCPlAV1RHG8Gtct+fA/OfradAe5BkfBZisTIMWDFu9wSv7/51PePm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934624; c=relaxed/simple;
	bh=y2QOvbtD+rPFzJomZ0RZwLgzzEwO9J4hZow4z4mFlDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlQ8SBf39wqu5l6taWaTMcgiIaT87QaOojXYNTbr+nyGmssfynWWaggls1hXmnHpL2WnJxXjaQUyUcWhMTrkmqpaILtiLO83XfxQHBumfW7rogwBt4IgH7V18YLUqZL8HYZ7WLF+0+EksRiAdBxjoeu4unkIUQlDgHJV7E9QWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VK/Ofo3/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773934623; x=1805470623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y2QOvbtD+rPFzJomZ0RZwLgzzEwO9J4hZow4z4mFlDw=;
  b=VK/Ofo3/HRfnwy6PoDM23FEjqch3HtC/fTJCRvBxxGf55mHpH3V5Zmwg
   eIXmxwRLlQFDpJXw7Qrp3DjEs/kAwv1cML6GWy4UYz3YKZjGEbbbDb7RF
   sAYw4Q2WzsUcDgI/44DWODDqWP2TT3hWWQgIqYZm8CQDwt4mkGOt4DAG9
   IXWqacpjLJWHeCLpbDMn9SC3S0aPBn09Ajv8gUJnwoPIdgNe7s6vzKFBr
   DNWESwfCGjZQ3vOAlhWhd1geIsaovDzdpr2Bf5EyvvrZpGj2oTulu0Sqv
   8sBoIBbFV1kexaerq50HDItx8uwwOGbC53IASdBLYg6dJMMS318vs+Oqx
   Q==;
X-CSE-ConnectionGUID: YOJCGysHQE+M6B3idJjOpg==
X-CSE-MsgGUID: oKyU7yLvRMC3XulT+1i3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78868334"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78868334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:37:02 -0700
X-CSE-ConnectionGUID: KRoAkYquRDimSU4IhYhOKg==
X-CSE-MsgGUID: ecxzC16ET1CArG/sWCWdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222240808"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:37:01 -0700
Date: Thu, 19 Mar 2026 17:36:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Craig McQueen <craig@mcqueen.au>, linux-kernel@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/1] leds: Adjust documentation of brightness sysfs
 node
Message-ID: <abwYGm9zlnCECUkO@ashevche-desk.local>
References: <20260310165143.354065-1-andriy.shevchenko@linux.intel.com>
 <20260319150330.GL554736@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319150330.GL554736@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7400-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 6872D2CDDBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 03:03:30PM +0000, Lee Jones wrote:
> On Tue, 10 Mar 2026, Andy Shevchenko wrote:
> 
> > Adjust documentation of brightness sysfs node about accepted value range.
> > The code accepts only decimal values. We may not relax that due to different
> > readings for, e.g., octal 0100, which becomes 64 instead of currently parsed
> > 100.

...

> > -		The value is between 0 and
> > +		The decimal value is between 0 and
> 
> How about?
> 
> The value is between 0 and /sys/class/leds/<led>/max_brightness and is
> represented by as a decimal.

I tried to be less invasive, but I have no objection on this proposal. Can you
update it whilst applying or should I send a new version?

> >  		/sys/class/leds/<led>/max_brightness.

-- 
With Best Regards,
Andy Shevchenko



