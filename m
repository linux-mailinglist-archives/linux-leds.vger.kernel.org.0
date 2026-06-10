Return-Path: <linux-leds+bounces-8563-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nkmiFT2yKWpqcAMAu9opvQ
	(envelope-from <linux-leds+bounces-8563-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 20:51:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9A66C5FE
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 20:51:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=aye66uGD;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8563-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8563-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7B8C304A7B4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 18:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00B03537F6;
	Wed, 10 Jun 2026 18:51:37 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A292346AE3;
	Wed, 10 Jun 2026 18:51:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781117497; cv=none; b=FI+/U9jxP3TbfN1InPoSB4QoQgJqyr4Pa2QvvtK7bFs3cZtgFMrOvqTJ0a4dedWxKzX10m1HFOHFjc0W1NXPoznq9mGOyfhHtbd1nigyS0llMHmEgxIbJfAW1fdB7xA+CL60lCovaAbmEyygAHSNoFvLoiFgoU8yMKCzZHuCeLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781117497; c=relaxed/simple;
	bh=IAJeaJCSOrokeJqsoh7ZMS5JEDntzqitc8aG5X9uM6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW4n48saM8n31LoJ/zJdSz89rL4u5z7BsaxbVk7m2XTdfmMl51cqFZ8nMJ1VdIJNgOl7dmVrVcBNrj4B8f3gQvsCXg54vI87fASPceEKKI7BPSLaQMLT7L4R4PFYX41+0d3MEVcB9ctqvyffeT7sHj0PoYfopsrsOrasLAgouAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aye66uGD; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781117496; x=1812653496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IAJeaJCSOrokeJqsoh7ZMS5JEDntzqitc8aG5X9uM6A=;
  b=aye66uGDZKdQa9WjHMvX9ETjKqfTUZgBFSSA0Bq5xxh5lzQAfK+g2BqH
   LAU0myHxq65Fo0sCMoTh7EZ4yMDs7hhfZQ2jxn42oSfgCFgmotgjyyiNf
   BPsP1dCs0bt1oevZytmakFJebNOlM1SObYjyqOB60q30Gk96MG7A4J6R3
   M26/9n/89fyX5FywxFTLCUC48dG2L/9dD7Ymt/ocgDY24uvrh0B1sxKn1
   +2DxP4/VM1Jt9NLVafPLnBffLumN67z4JKgW85x0uecoAknFlfx0IHyoT
   05myRlxrMGUf3W2rN/UMKBmJuIY4Txt5X5CxqWeSmOMJ1Ysb99rdAOn03
   Q==;
X-CSE-ConnectionGUID: lBddJ2uWRcyl589jQROy0Q==
X-CSE-MsgGUID: SG/qs1cmS4633UOA0NuT9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81054028"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81054028"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 11:51:35 -0700
X-CSE-ConnectionGUID: Ld7552xLQuatmRnoelVB+w==
X-CSE-MsgGUID: 6f666/mdTJOs8w9zQz3/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245385735"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 11:51:30 -0700
Date: Wed, 10 Jun 2026 21:51:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 10/14] mfd: lm3533: Set DMA mask
Message-ID: <aimyLwhc_BT6I5wD@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-11-clamor95@gmail.com>
 <aihm315UtdqJclhh@ashevche-desk.local>
 <CAPVz0n01ymfYGH+_MgfHvWqzg+tczLi8E-1q=rZ5cHu+uJrpdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n01ymfYGH+_MgfHvWqzg+tczLi8E-1q=rZ5cHu+uJrpdg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8563-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFC9A66C5FE

On Wed, Jun 10, 2026 at 05:40:56PM +0300, Svyatoslav Ryhel wrote:
> вт, 9 черв. 2026 р. о 22:17 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Sat, Jun 06, 2026 at 07:57:34AM +0300, Svyatoslav Ryhel wrote:
> > > Missing coherent_dma_mask assigning triggers the following warning in
> > > dmesg:
> > >
> > > [    3.287872] platform lm3533-backlight.0: DMA mask not set
> > >
> > > Since this warning might be elevated to an error in the future, set
> > > coherent_dma_mask to zero because both the core and cells do not utilize
> > > DMA.
> >
> > Hmm... I am not sure about this. The entire kernel has only two drivers that
> > do that, and thanks to their commit messages one of them pointed out to the
> > commit from 2018. So, if no other devices suffer from this, I think it has to
> > be a better way of achieving the same.
> 
> If mfd framework warns that DMA mask is not set then this must be
> addressed. Why then there is such warning at the first place if mask
> can be just skipped. Then warning would be just a debug message. What
> is warning today can become error tomorrow.

It's there for 8 years. And only a few drivers explicitly nullify it.
I think doing this patch one should really understand what's going on.
(Note, I'm not that person, it's my gut feelings based on the experience
 and the above statistics.) MFD creates a lot of platform devices for
which DMA mask is set automatically. So, why is it not set properly for
this device?

-- 
With Best Regards,
Andy Shevchenko



