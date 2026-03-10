Return-Path: <linux-leds+bounces-7167-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOMSL8vlr2nkdAIAu9opvQ
	(envelope-from <linux-leds+bounces-7167-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 10:35:07 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 136F6248885
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 10:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5D430920B6
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 09:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852BA43D4EA;
	Tue, 10 Mar 2026 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0iTwkdL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6443CEF7
	for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2026 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134605; cv=none; b=qy4ngM17lH2YL8PZKrmqELf4sAahokdr95eKKJyi0sI4TECBOpMd2fzNExxNJ74o3OxytH4m4owDvN+QLobHUQ47mkBUUwNPUdMaoGa5ZFxuTB8JQhhNUcbhLOZLspJe5R8qTpnUXB1AN6Y4DVznxrKSUwUPfewJHZ81PxAeVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134605; c=relaxed/simple;
	bh=k8NuUYmwWEnSpYSDx/7NXzrrywXpfdf9wA2VsksW4ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyQfcVFzWpp1Wjjb69G9iMZeyg8zkkcC4BkB6ESprk4OcW5OKZ6RhFUNgxwdCutG8HFUUfvK8TBTvOMSrVS3X2NSi9ilCoGO21aHUT8dHjnCg+C8f88OoubqrhQJb+FcIM8t4hxwWuiNoyitcH5uS7m3728IA2WKVAAZP8lRGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0iTwkdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8766CC2BC86;
	Tue, 10 Mar 2026 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134605;
	bh=k8NuUYmwWEnSpYSDx/7NXzrrywXpfdf9wA2VsksW4ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0iTwkdLzt3FOAoPMq4YX34MvrmgLLLp7SJUeiP47wZ54xLjtzUdiPLpKSjqy4Ibc
	 GjTJElexPdAOp4APUsPC6zPzYsI6TVhf5Pn7njothwVs1SNvQP9GsaJLclWL5vB9Bl
	 ovRxHH4k5o+pmj9OgBIeHUL+Kc7MuMLiFKst2KTo+GOQecn3GWll1njAMW1BCXldIb
	 vAblG7+BHP71DcfqMzRkJbm19tIutDD3dtrev7qradHnuDMLhF0H7PJJqx2cTeFVc+
	 lyiuDBJpt6u4Kkpw8PLu5vyIn0cE6EWscrMajlxmAVYz++ZgHT/JSriWkJABvn/QH7
	 4YuvuFy5mUpTw==
Date: Tue, 10 Mar 2026 09:23:19 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH] leds: led-class: detect brightness conversion base from
 string
Message-ID: <20260310092319.GF183676@google.com>
References: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
 <aamLXuyzEiqJGDtu@black.igk.intel.com>
 <20260306113221.GI183676@google.com>
 <aarupkr802-283I9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aarupkr802-283I9@ashevche-desk.local>
X-Rspamd-Queue-Id: 136F6248885
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7167-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,topcon.com:email]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026, Andy Shevchenko wrote:

> On Fri, Mar 06, 2026 at 11:32:21AM +0000, Lee Jones wrote:
> > On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> > > On Fri, Jan 23, 2026 at 10:57:26AM +0100, Michael Tretter wrote:
> > > > From: Thorsten Schmelzer <tschmelzer@topcon.com>
> > > > 
> > > > sysfs-class-led doesn't specify the number format for the brightness,
> > > > but the class only accepts base 10 numbers.
> > > > 
> > > > Use the automatic base detection of kstrtoul and accept the brightness
> > > > as hex value as well.
> > > 
> > > This obviously brings a regression.
> > > Previously the 000000000000100 is 100, now it's 64.
> > > 
> > > While I don't care much (I even like the change), I have to point this out.
> > > 
> > > The correct fix is to update documentation.
> > 
> > Again, should we remove this patch that you like?
> 
> Depends if anybody outside relies on the above mentioned decimal values
> with leading 0(s). On the safest side is better to drop (and explain in
> the documentation that the values are decimal).

For the fear of breaking userspace, I have dropped the patch.

Please could someone update the docs?

-- 
Lee Jones [李琼斯]

