Return-Path: <linux-leds+bounces-8445-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ae3LFV9MH2pCjwAAu9opvQ
	(envelope-from <linux-leds+bounces-8445-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 23:34:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805E6321B6
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 23:34:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=OiTKFFih;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8445-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8445-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43844300B2A9
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 21:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB533A48DF;
	Tue,  2 Jun 2026 21:34:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E225A354;
	Tue,  2 Jun 2026 21:34:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780436057; cv=none; b=GObf+jKI9v+sQYSWbIlTQpRSbe8HtodZsMYcS863kzZTTPxn2Z1Mlueh1ow55LDdrxgFfqi2bFOMmD+GtSwUHRpBhbuxVkN32djkdQcgXKmtINOUejWer7336xreKFj7dfXaBpqyRjQfqBbgp61Kw+ksj0r1yr/gwtLLkEhxhRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780436057; c=relaxed/simple;
	bh=0sFcW2X1E1AgGGPXJn22H9fGatEbESdFMFY3VY2TYc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiZEHOYr0BBCi71yRzYJ9Df4nXYMIr7JlxiBZRFyL/p8zoZjrrVixSNuUKmEfeo54c9KOHiwDey4PDJRufmr6m1vnd8dX5GMNCkwpPR5ER3gKra8WilBPFL+ZST/ZjrnqpdOLFZQvj44Jy5rGTjqKjeG8+lG8h+4rZeAw40miHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiTKFFih; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780436056; x=1811972056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0sFcW2X1E1AgGGPXJn22H9fGatEbESdFMFY3VY2TYc0=;
  b=OiTKFFihzb+SFnJ9r0qnwwwUeUHYXYqSQ/EkmaqaqlohaNgYlm6Nimyf
   EbcdQs5jgtZYsJ7vYXU/wNdq0DDyJ4Khq2kRR+9/fyAP4Zp49ZQxqRgrZ
   gaTNoObh+uvbK4SZ0WDidBEL4YQoYs/YbcZcfIlOaTYI1A2BoHz13wF8i
   LSm4d2tiHo4yGf/bwOdu0jR2H7eoKSrj+ZRHLE7CvaZT+nnyJ9rwyO6Pz
   jsbtC8CNOYFiU7IREKFBk1bo1QWXYNhOsAD6e+9APJ70MaYgPssunWYqz
   HlLKVJdjC+vjVCV6oh4ASuHGLpND8pmptU4iSdgrCbdCcYLVGksBuzw/l
   Q==;
X-CSE-ConnectionGUID: zA0xnocLTLu1+zZrEqGgEA==
X-CSE-MsgGUID: Z5BSXtjvTVCGoFBO5WELcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80971946"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80971946"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 14:34:16 -0700
X-CSE-ConnectionGUID: LQKt6rLgQk2hFVaSLAmpkA==
X-CSE-MsgGUID: lALpSXqKQLq8cywPAi7sAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239574756"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 14:34:10 -0700
Date: Wed, 3 Jun 2026 00:34:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, mike.marciniszyn@gmail.com,
	Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] dd LED support for fbnic
Message-ID: <ah9MUFXpPTycrO4A@ashevche-desk.local>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
 <20260521110324.GB2921053@google.com>
 <d87c9ad1-f180-45c8-a525-40c1b39c4265@lunn.ch>
 <20260521133316.GB3591266@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521133316.GB3591266@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8445-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:andrew@lunn.ch,m:mike.marciniszyn@gmail.com,m:pavel@kernel.org,m:alexanderduyck@fb.com,m:kuba@kernel.org,m:kernel-team@meta.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:linux@armlinux.org.uk,m:daniel@makrotopia.org,m:kees@kernel.org,m:horms@kernel.org,m:dimitri.daskalakis1@gmail.com,m:jacob.e.keller@intel.com,m:lee@trager.us,m:mohsin.bashr@gmail.com,m:alok.a.tiwari@oracle.com,m:dg573847474@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:mikemarciniszyn@gmail.com,m:dimitridaskalakis1@gmail.com,m:mohsinbashr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,kernel.org,fb.com,meta.com,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,intel.com,trager.us,oracle.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2805E6321B6

On Thu, May 21, 2026 at 02:33:16PM +0100, Lee Jones wrote:
> On Thu, 21 May 2026, Andrew Lunn wrote:
> > On Thu, May 21, 2026 at 12:03:24PM +0100, Lee Jones wrote:
> > > On Wed, 20 May 2026, Andrew Lunn wrote:

...

> > > It's also just a cover-letter.
> > 
> > It depends on the Maintainers workflow, but for netdev, a patch series
> > is imported into a branch, and the cover letter is used for the text
> > of the merge commit into net-next.
> > 
> > A well written cover letter contains the big picture, what does this
> > set of patches do, so it has useful information in it, so we want to
> > have it in the git history.
> 
> Interesting.  This is new to me.  As you were.

I also do this from time to time (depending on the series at hand), this is so
cool with `b4 shazam ...`.

-- 
With Best Regards,
Andy Shevchenko



