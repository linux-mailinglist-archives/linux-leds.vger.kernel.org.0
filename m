Return-Path: <linux-leds+bounces-7134-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIWwNbHuqmmOYAEAu9opvQ
	(envelope-from <linux-leds+bounces-7134-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:11:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DA22388F
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 16:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CDB93012BDF
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 15:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC58237F735;
	Fri,  6 Mar 2026 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cE8JC8nz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DA34B663
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809903; cv=none; b=i7h42YFpwoY0bNu4PoVNJZ1u7ffYUPgLJ5LeKvCqYdzvLONaAVf586T6oLallFTVa09KrpB5aEd4Hebhe3kSG4zZbBcyqaTYd2yjJTRuoPCNNA1qCxH11p/5dLcrvoxq3i0pMyf72pf7grCF9Me9TT0WtiOEiQgfPDcjh7IWw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809903; c=relaxed/simple;
	bh=lWj8J0pEAC+qw3u635QWARXfLuV65lUsAXrV96+FMMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZ5w1fSa2fyfz/1OW5avNax4zDdSTtoiPZfE7W3sudry+W8QpKJanq/Ys9fuf72yBY55VNSgS+ZYKKrcAusaReWfiWVqBi+hP6He0DWhUVr70AauAYSUao5pEm7/56hNFwJgvM+p1T1Zfrv7OsULcpJA/pg9rEHJc64I1I/LAwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cE8JC8nz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772809902; x=1804345902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lWj8J0pEAC+qw3u635QWARXfLuV65lUsAXrV96+FMMY=;
  b=cE8JC8nzltuQzqUi/LxZ/J/LWVEABHjBhMytOZKUG7XJqcicTUXRtI/v
   i+YeoSHfKqEqYugwvZBVp8s8Pp4VGClAx3aMSEomnKjEzntKHdWH2bXDh
   WkS3xvxjQBR9V6PyD8OwQ7snQLqxm5WvygH27MOleGuPOEKJ1heZ8DM/J
   HRGf6kZWjrECrfIIaDe2kFWPBs1n/TbjiqrtEo/6lXOtTolN9HZ1y61qZ
   HcqzSCBSqsQxXU7m0EiPdvDiR+iDW021ceHvRCHRa3Gqe5qTRTl9/yb0C
   yG8wHI2J72GddRM8GcOhymZcMvdM5EX5QN3zqUeEgLQnMy2xrdHBJr5jt
   w==;
X-CSE-ConnectionGUID: InK0rgffTSyHZDolFEoo1Q==
X-CSE-MsgGUID: ff0TnBHJT/OHK7uUGJ0S+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73794781"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73794781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:11:39 -0800
X-CSE-ConnectionGUID: fzLMhTrsSmqjo+tLBzVA/g==
X-CSE-MsgGUID: aDgyt5NeTOGVdZQaaS7LAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223520314"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:11:37 -0800
Date: Fri, 6 Mar 2026 17:11:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH] leds: led-class: detect brightness conversion base from
 string
Message-ID: <aarupkr802-283I9@ashevche-desk.local>
References: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
 <aamLXuyzEiqJGDtu@black.igk.intel.com>
 <20260306113221.GI183676@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306113221.GI183676@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 9A7DA22388F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7134-lists,linux-leds=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,topcon.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:32:21AM +0000, Lee Jones wrote:
> On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> > On Fri, Jan 23, 2026 at 10:57:26AM +0100, Michael Tretter wrote:
> > > From: Thorsten Schmelzer <tschmelzer@topcon.com>
> > > 
> > > sysfs-class-led doesn't specify the number format for the brightness,
> > > but the class only accepts base 10 numbers.
> > > 
> > > Use the automatic base detection of kstrtoul and accept the brightness
> > > as hex value as well.
> > 
> > This obviously brings a regression.
> > Previously the 000000000000100 is 100, now it's 64.
> > 
> > While I don't care much (I even like the change), I have to point this out.
> > 
> > The correct fix is to update documentation.
> 
> Again, should we remove this patch that you like?

Depends if anybody outside relies on the above mentioned decimal values
with leading 0(s). On the safest side is better to drop (and explain in
the documentation that the values are decimal).

-- 
With Best Regards,
Andy Shevchenko



