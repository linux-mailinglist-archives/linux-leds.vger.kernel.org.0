Return-Path: <linux-leds+bounces-7666-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKYGAXDQ12mrTAgAu9opvQ
	(envelope-from <linux-leds+bounces-7666-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:14:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD73CD7F8
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D464A303A124
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 16:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C1F3793BE;
	Thu,  9 Apr 2026 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUEq4Y6Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA934752E;
	Thu,  9 Apr 2026 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750458; cv=none; b=ZU+vW/wg7QIpIzq5tWmIJdTdgoKK2Vzr6t++AJVfkPkWQiqXniV6iA6fkF19F8kBKKtedqEkvcrDH0nHeev6wu71U+PBi7yYyAId7GgPRvsrGRJ4Rmc5yTt6qjEY7PjfirDUsbEIKzhlkCpacvqjXtR4coigXoXjQoXf156ufCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750458; c=relaxed/simple;
	bh=tbpFDI6kphBmjDruVujPRnLSzXFiuN45l7FGAOCOl7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OO7YSZWK04U7wRZ0xNTc7YsJ6zQnaLwG5TKSxE6SaB3NJIRIjQsS/M483LWqD0dOK1KqYyuW/l3cH2bP+MOPyYfRkIxjtOfcKXu1pR7nlrC0qvi0QIKNjprw7V2CTYjuRibZXbbWcHcEcB+VpGRqbqOHaVtLGMFKoGkSTMmJ/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUEq4Y6Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775750457; x=1807286457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tbpFDI6kphBmjDruVujPRnLSzXFiuN45l7FGAOCOl7Y=;
  b=NUEq4Y6QWf4tWQeCge+LLlt56zz6UDkSX1Amh5809i98xjhibhtyelrP
   azCQHhbMgbVTHh1gwzoEwzpJXmsKuYL3N2Ogj/W6mugUgq7gn91Rpt3T2
   LJqZcOrpIW8obbM4y+DHMCnchwV6u8y13iggTxBvxqpuGBV3D9d6Yru3R
   FTD0bCRGan9enrUxtIGqQfdNUb4tquLMEEJp8u+1+LiRJBjrQEXqTUfss
   TcO15BkULb/EkJxo9zQezkTAS50MrdLGLzN8Z/Y6prwMbTjdkCgOG5eYm
   lJL7JXZd+vTTNFV27ckKBuyCgD16R26xWrjcF6FVIgF22GxkbmFTu2PSL
   Q==;
X-CSE-ConnectionGUID: 5C8MUkfiRVu2aMDr0QFoFw==
X-CSE-MsgGUID: UPxAZ+0qTviad47ED1kYJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76636955"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76636955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 09:00:56 -0700
X-CSE-ConnectionGUID: sOfUctIkQxaquJZt4G5ZjA==
X-CSE-MsgGUID: rCU8EbsvQ3yee6EqLufaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="222301564"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 09:00:55 -0700
Date: Thu, 9 Apr 2026 19:00:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v2 2/2] leds: class: Reinitialise list after dropping
 from lookup table
Message-ID: <adfNNGYVXjnJOwPh@ashevche-desk.local>
References: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
 <20260331183055.1209526-3-andriy.shevchenko@linux.intel.com>
 <20260409155232.GA3439476@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409155232.GA3439476@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7666-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CFD73CD7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 04:52:32PM +0100, Lee Jones wrote:
> On Tue, 31 Mar 2026, Andy Shevchenko wrote:
> 
> > Currently the lookup table just removes the list entry and leaves
> > the stale pointers in it. If the lookup is embedded in some data
> > structure, the pointer to the lookup entry can't be NULL (always
> > valid), but calling led_remove_lookup() on it twice will lead to
> > the wrong behaviour. To avoid that the user has to track the state
> > itself. With this change in place, the user may drop that approach
> > and use something like
> > 
> >   probe:
> > 	INIT_LIST_HEAD(&lookup.list);
> > 	if (LED lookup is required)
> > 		led_add_lookup(&lookup);
> > 
> >   remove:
> > 	led_remove_lookup(&lookup);
> 
> How do we feel about a devm_led_add_lookup()?

No strong opinion. If we have that already, great! This patch won't be needed.
If not yet, we may add one, but briefly looking at the kernel I have not found
any other framework doing that.

In any case the user that would need this patch has been already modified the
way that lookup is always there, effectively means we may postpone or even drop
this patch for now.

> > without any additional tracking kept over the device lifetime.

-- 
With Best Regards,
Andy Shevchenko



