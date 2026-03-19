Return-Path: <linux-leds+bounces-7405-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL8gIA9JvGnPwQIAu9opvQ
	(envelope-from <linux-leds+bounces-7405-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 20:05:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF182D17E0
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 20:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B459E310B736
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 19:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC342741C9;
	Thu, 19 Mar 2026 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY+RHW6I"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD8487BE;
	Thu, 19 Mar 2026 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946969; cv=none; b=tyo3g7uiCDC0y+esiEFuB1ijcm0KgCZ+h9kz5jM6uuTWpAEG05tBPg40OTMGCzSjuqO0C5h2Jt0kIC4nblD3Vk7D8gwxIRvPB9yA7pb710+4DuCe6wdM0ucKm7IhrBK7Z4RZfPuU0jl2Pjwf50U6tKK59W9w2F7bjidHQRKTeos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946969; c=relaxed/simple;
	bh=1e+E+AnJKzG442hkSivlRFCb6WWkLuVY6mUoOvrF+Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmSgmdLbQc0kEyV7pXMoohUm4LKN8wuW9/vnJ6k/B6xzf3BJd7LA2prTZIEp9Wvg1xN1I87Q/iVjSD487M+4axOvKydj7BbZja05uOVkHP87NHM1zKBplRaHcrU/s3ofyIMMDC4FMxV5n6KEwyelyOO+WbxXCIyHNOng/ndVjkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY+RHW6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E7DC19424;
	Thu, 19 Mar 2026 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773946968;
	bh=1e+E+AnJKzG442hkSivlRFCb6WWkLuVY6mUoOvrF+Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QY+RHW6I6B3cdC5zrBrpsd2c0BpldSQJANuyyzbPK0kn+L6SHK1ZV1CVzBUQdZDei
	 67n1rhukcmH3pI3Nypi9vvb0RzzkAR9ktidDNcgZ09Ozj1MaVVhhKwaFZidzEduWXp
	 LvdGUpZ0gyNd3Sjm4cwId5EZZ5O84/p1BcDqdLJ9tMOiFeIKsTg3dyfJjF2mwfvpeM
	 qWizml9r2+Cmj67O+6HAUQoDSdHd54HpGnTjYvXT/EFJhhCMTq3uQxS1WqgHNnXgHJ
	 ARK0qcF4XywUK5Abh7RpR+AHZhwPk9YngnEF584UKO2EpUU1lQN+eUDArR41Q/g0iI
	 FEuxtPyor3X6g==
Date: Thu, 19 Mar 2026 19:02:44 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Craig McQueen <craig@mcqueen.au>, linux-kernel@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/1] leds: Adjust documentation of brightness sysfs
 node
Message-ID: <20260319190244.GD2902881@google.com>
References: <20260310165143.354065-1-andriy.shevchenko@linux.intel.com>
 <20260319150330.GL554736@google.com>
 <abwYGm9zlnCECUkO@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abwYGm9zlnCECUkO@ashevche-desk.local>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7405-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDF182D17E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026, Andy Shevchenko wrote:

> On Thu, Mar 19, 2026 at 03:03:30PM +0000, Lee Jones wrote:
> > On Tue, 10 Mar 2026, Andy Shevchenko wrote:
> > 
> > > Adjust documentation of brightness sysfs node about accepted value range.
> > > The code accepts only decimal values. We may not relax that due to different
> > > readings for, e.g., octal 0100, which becomes 64 instead of currently parsed
> > > 100.
> 
> ...
> 
> > > -		The value is between 0 and
> > > +		The decimal value is between 0 and
> > 
> > How about?
> > 
> > The value is between 0 and /sys/class/leds/<led>/max_brightness and is
> > represented by as a decimal.
> 
> I tried to be less invasive, but I have no objection on this proposal. Can you
> update it whilst applying or should I send a new version?

New version please.  I'm done for the day.

-- 
Lee Jones [李琼斯]

