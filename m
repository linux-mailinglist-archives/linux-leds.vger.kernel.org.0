Return-Path: <linux-leds+bounces-8172-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iG2cImiWCWosgwQAu9opvQ
	(envelope-from <linux-leds+bounces-8172-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:20:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F58356071F
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44B3300C583
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B87334DCD2;
	Sun, 17 May 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrMB4ckZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929721C84A2;
	Sun, 17 May 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779013215; cv=none; b=cumP6bl0AteXWsxIK41CbVDl1wNxTuUXPx/NUyMrZfn6CT+1xiKnloPk0t4fulS6NPlF7ez6yVWDolKd0EuHUG2+6D2Tqspc0SuI7QSbeNnu+2tkB0JGShUl+znzPHLHBJvWLuX6M4kVaiRNdunuw3ve3f4zsDmofZc3zGp2G+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779013215; c=relaxed/simple;
	bh=oZxUQlyTk0p5nCvK12UZYWCNDBpHz3ibRGJ0b6zd/Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iwk0HAY8gnjbyuvmhVtnkxNjcWdacDtwn7XHQuP5J1C3KfbgH1lsrz6ROrA2BcdSWavdJaXfVQxFxexCsyjhglSVl3u21u357qyaR6l7WM2T69CfmzfF62VugQJquoDtpzEbPmoqPwyo/sWWcHbLMPxi/Iapyg1ADUhuciED6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrMB4ckZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779013214; x=1810549214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oZxUQlyTk0p5nCvK12UZYWCNDBpHz3ibRGJ0b6zd/Es=;
  b=SrMB4ckZT2iUpj53RML+c6dMNRiqLM8IhoG6PAysZIG+NayuCQUZIiGa
   lM/2aaREv+0oNY+axnWelm5C1kFHJqG8gZTs75fWb3+UPck3Q2d8T07ha
   XM8rcTOeHZDtrdgICvDpd2qJxtZKgSn3qJLqciZBtsARLclmVsML7DgSw
   gD0dcZJcTV2YekbQLXCw8hNMDir128p7Q5UBuzCCH06dKYKK1u7CdjrnT
   StHcw/v5txCzFRnmeMRVUFU1pOaijEAqEzis3NtnsEVkBh61bPQ2V9WeC
   YrWSdwJkzh4HmB+F6yGiACMn31PnX9U+CQJWDM1GZ0xnPIkOpsT8ql+65
   Q==;
X-CSE-ConnectionGUID: QEpTpUpcRtiDf9gV3f/qgw==
X-CSE-MsgGUID: jTJH7ILKQPu0TpeBFmjekA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79863934"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79863934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:20:13 -0700
X-CSE-ConnectionGUID: s1jh4tqGTcmsbArF7Y9qaA==
X-CSE-MsgGUID: Ym8Z6thTR1ql4o7Sr9BdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="239013867"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:20:09 -0700
Date: Sun, 17 May 2026 13:20:05 +0300
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
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve
 support
Message-ID: <agmWVdi3TkBb2cxV@ashevche-desk.local>
References: <20260517074306.30937-1-clamor95@gmail.com>
 <agl1T8O6kwP7SFZ1@ashevche-desk.local>
 <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 0F58356071F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-8172-lists,linux-leds=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 01:13:22PM +0300, Svyatoslav Ryhel wrote:
> нд, 17 трав. 2026 р. о 10:59 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > > setting mapping mode and LED sources based on device tree.
> >
> > How is this being different to
> > https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.com/
> > ?
> 
> I have decided to have a fresh look, this is continuation.

Then it should be something like v4?

> > What about this comment
> > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> > ? Have you talked to Bjorn A and Johan?
> 
> No, but since grep -r "lm3533_platform_data" * gives 0 results there
> are no platform_data users of lm3533.

Johan was against driver removal (while it sounds logical due to above) and
referred to some other patches from somebody else. I think you need to
synchronise with the people to have a clear roadmap that all stakeholders
are agree with. With that, the split and other technical issues can be solved
during the normal process.

-- 
With Best Regards,
Andy Shevchenko



