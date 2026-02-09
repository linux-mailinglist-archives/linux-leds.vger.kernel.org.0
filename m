Return-Path: <linux-leds+bounces-6900-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAqwKoy2iWlLBAUAu9opvQ
	(envelope-from <linux-leds+bounces-6900-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 11:27:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EA10E25F
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 11:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADDF930058CF
	for <lists+linux-leds@lfdr.de>; Mon,  9 Feb 2026 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B114D36683A;
	Mon,  9 Feb 2026 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APhh0VzB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688B30F547;
	Mon,  9 Feb 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770632842; cv=none; b=vB1DM6Y4hEMlFf0PshWbU+dfWUHwPzqzcWu2u5T5gKGTuEyiEraFl6NsBgKdkDkY6iAKxiq+XmrhCdzoUmFYhtIZKsLptpN90SobAG9r+Ys5awK7aXtjablnh6jJrDTn7mpHnazdDGdBUkcijVlETgrda86P4pRFcdz7bfDBxdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770632842; c=relaxed/simple;
	bh=axW5o0CFgkUka//n5ayjtkSdMCBB2Hxzwp4k8PHtCJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx4uUVaV4qFmf4vWHA/98MULWsgrUVMtghJXv7SNj6CHtxVFVTQjL7BmqBTQRFjeeO7lhrVieS7244vzPwuENp0OsK5+ao5p+lZjxAfU8OneF/Bo6toZ3cV3BPegs0+b6sTDmZPKvE+LrJwjVw8hR6LTxpVGJFcvJ/QXgn3pbf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APhh0VzB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770632842; x=1802168842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=axW5o0CFgkUka//n5ayjtkSdMCBB2Hxzwp4k8PHtCJY=;
  b=APhh0VzBlQvjyXOGaDRlrmbPLACJbiOSkPbfWLJog6HmtTUBIgSO4hOg
   6l7kNf5ujhxuU3TiL4TXc+xelqr6UF2S+Wm/a4DRFMwTnK8saYr4/Q8/u
   wKvw7pzmmVvKgT8PMCycTRzczxiFqhT+kQOawvLBMlanTr4ok8WX+zxpb
   OcbVRg9TDzDFuQbXygNjh5gL+fpMUFVFmNQQihwwy8QCeMqVnYd48699f
   7lnCh094770YSR8YHEqi/npReJpxDqoNaO4wS3fdfnbEn25UeLiSFnQrM
   iXICQOqHQkB7cn4Y9cKA7Lf5T2u9o247VWRFavskaC5fbHRqcNv9RL+4L
   Q==;
X-CSE-ConnectionGUID: ZAo4UzAVQzmOgM1n8DZIig==
X-CSE-MsgGUID: KjUMv5tUQummR1Zgquf74Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82066737"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82066737"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 02:27:22 -0800
X-CSE-ConnectionGUID: sl/BX6jrTreG1ZNelHJi+A==
X-CSE-MsgGUID: 9Cg4MpnSQS+VIg1qDpsuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210732598"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 02:27:16 -0800
Date: Mon, 9 Feb 2026 12:27:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 10/11] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <aYm2gm6PlKO2ODll@smile.fi.intel.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-11-clamor95@gmail.com>
 <aYiHnUW93AB0ARJH@smile.fi.intel.com>
 <D8B3E97F-3405-4EBD-882D-677F530E4EDB@gmail.com>
 <aYmYcd0431P5sUtq@smile.fi.intel.com>
 <5AA39777-F5C8-4AD5-A5C2-47265C8213F5@gmail.com>
 <aYmg_7uq2rAWJgGK@smile.fi.intel.com>
 <CAPVz0n0+UxdocZdLtqPz=5m5RMV_K2Ldqsf53-13hUiLpV6c6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0+UxdocZdLtqPz=5m5RMV_K2Ldqsf53-13hUiLpV6c6A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6900-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 523EA10E25F
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:06:54AM +0200, Svyatoslav Ryhel wrote:
> пн, 9 лют. 2026 р. о 10:55 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Mon, Feb 09, 2026 at 10:42:02AM +0200, Svyatoslav Ryhel wrote:
> > > 9 лютого 2026 р. 10:18:57 GMT+02:00, Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > > >On Sun, Feb 08, 2026 at 05:19:49PM +0200, Svyatoslav Ryhel wrote:
> > > >> 8 лютого 2026 р. 14:54:53 GMT+02:00, Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > > >> >On Fri, Feb 06, 2026 at 07:28:44PM +0200, Svyatoslav Ryhel wrote:

...

> > > >> And please, may you contain all your reviewing in one iteration. Then both of
> > > >> us will spend less time working on the patch. Thank you!
> > > >
> > > >It's an impossible request, you should understand that. If you want, use AI
> > > >or your robot colleagues for that, I'm just a human being, I can't see
> > > >everything at once.
> > >
> > > Ability to see only nits and don't see the possible issues seems to be a talent.
> >
> > Paying respect to the reviewers requires some talent, indeed.

...

> > Also, train your logic a bit, why do humans have so many professions? According
> > to your "logic" one should be a doctor and a cook and a programmer. Why not?
> >
> > Or even closer to this case, a doctor must be a surgeon, a dentist, a therapist,
> > and you name it. Why not?
> 
> If seems that my expectations were too high. Apologies, my mistake. I
> will keep in mind to spare you from wasting your time on reviewing my
> patches in the future.

Yeah, I agree, I think the AI approach to your excellent and mistake-less code
can be applied with a better outcome.

...

Currently your code needs some work, sorry.

-- 
With Best Regards,
Andy Shevchenko



