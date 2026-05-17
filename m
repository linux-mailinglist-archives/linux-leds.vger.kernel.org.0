Return-Path: <linux-leds+bounces-8174-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNo8LiCbCWpHhQQAu9opvQ
	(envelope-from <linux-leds+bounces-8174-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:40:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DEB5608AA
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7499300820D
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA3235F16B;
	Sun, 17 May 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCnt/T1h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C835DA6A;
	Sun, 17 May 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014430; cv=none; b=tkeq54QWYqTk2uGixXnHGWdiIbQewl26b7OQY3JGQUldXZVEhxx+NVgeEbXXWlTcnIeBMlkm6xIE0qhuE4brkUhbYNUKRbX69xZPtvhykvaHSihO/VBaW2OY3+JYHu3y2Ux7IygKO6mo5u1nmAg3yDdqIEoge/rDZcbJElxmFmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014430; c=relaxed/simple;
	bh=3+pu7n1CG+XGB3Ldn4JBhKXZKe50YpSBlqvjDoYq7e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7IBTjabDXUwDzl3xECg0hYMKkjt8ML7zEYjng2K/f5Y1bNLWosKS6IdwcBLoQ2Wka9/LB482/7bc0EEUOepCXdhfleC/u4IysUFE0OWJtnSSXlsj8M/srzQYTlTCC3MCeEEt6kmt0NWHRyOtLxGbqEZysK3715Kp5qoohoPJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCnt/T1h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779014429; x=1810550429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3+pu7n1CG+XGB3Ldn4JBhKXZKe50YpSBlqvjDoYq7e4=;
  b=oCnt/T1hrNEJC7ZFmXgtq96bERBAv0NCNjyDHCiXlkBJ99nze3/XJ0yT
   C7ZJIjYlFmGBI3P6Og2bxDFREzoVfnJu1eChHDZE9+H1GBgSc5kh53vXr
   8Dd6sNNnZp0De5DCjNFuTM5Z46qEmA2AjW+b4m4lowTKbMVD+TVb3upTj
   j5EDFpol0p/udo08kZkP5iQk76NtunQVwMPlo6KasFiJ40O/6GLT9goWC
   caGy/OcVen2FGhjROf71GhJsE6IxTPr8g+KFk2oCAi1t7dh+fZhFrctD7
   7Wap0sP/dG6C78XkT4kS1iZnAUpfBlUAmP9UhoXoOK7A1uw/iyYBuawDk
   g==;
X-CSE-ConnectionGUID: ljCdVK8KQPGBGjdo9LBWlw==
X-CSE-MsgGUID: vqRgCxZfR2iudSr9I+iX1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79864304"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79864304"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:40:28 -0700
X-CSE-ConnectionGUID: 0/XQ2Nl4Q3apw4ZJiajANw==
X-CSE-MsgGUID: qo1alMKuTvC8X7PvF427pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="262908978"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:40:23 -0700
Date: Sun, 17 May 2026 13:40:21 +0300
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
Message-ID: <agmbFQHezUl5Nydn@ashevche-desk.local>
References: <20260517074306.30937-1-clamor95@gmail.com>
 <agl1T8O6kwP7SFZ1@ashevche-desk.local>
 <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
 <agmWVdi3TkBb2cxV@ashevche-desk.local>
 <CAPVz0n3Kn5VVxWxCgq2EcRiOaLWnB85hD+-S2Eou=H1PyycJCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3Kn5VVxWxCgq2EcRiOaLWnB85hD+-S2Eou=H1PyycJCQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 40DEB5608AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-8174-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 01:34:32PM +0300, Svyatoslav Ryhel wrote:
> нд, 17 трав. 2026 р. о 13:20 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Sun, May 17, 2026 at 01:13:22PM +0300, Svyatoslav Ryhel wrote:
> > > нд, 17 трав. 2026 р. о 10:59 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > > > On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > > > > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > > > > setting mapping mode and LED sources based on device tree.
> > > >
> > > > How is this being different to
> > > > https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.com/
> > > > ?
> > >
> > > I have decided to have a fresh look, this is continuation.
> >
> > Then it should be something like v4?
> 
> That was more than a year ago, lets start fresh. Those patches are
> gone, though I did add many of suggestions from there.
> 
> > > > What about this comment
> > > > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> > > > ? Have you talked to Bjorn A and Johan?
> > >
> > > No, but since grep -r "lm3533_platform_data" * gives 0 results there
> > > are no platform_data users of lm3533.
> >
> > Johan was against driver removal (while it sounds logical due to above) and
> > referred to some other patches from somebody else. I think you need to
> > synchronise with the people to have a clear roadmap that all stakeholders
> > are agree with. With that, the split and other technical issues can be solved
> > during the normal process.
> 
> And this discussion was 2 years ago, and
> 
> "This device is used in a bunch of Sony phones and Bjorn A posted a
> series adding devicetree bindings a few years ago"
> 
> They have had more than enough time, don't you think? You would
> definitely know if there were any activity since you are IIO reviewer
> and would be included, were there any activity?

At least it's polite to Cc them your version.

-- 
With Best Regards,
Andy Shevchenko



