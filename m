Return-Path: <linux-leds+bounces-7303-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEJYBD65sWmxEwAAu9opvQ
	(envelope-from <linux-leds+bounces-7303-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:49:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58314268DED
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6063F322BD32
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 18:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC1B3DE45C;
	Wed, 11 Mar 2026 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="o0NDYH8r"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F53E4C88;
	Wed, 11 Mar 2026 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254696; cv=none; b=c7kV1OH8r5DcbKfCiaYrXEYOmIwnmwWiEAzZRH92Rik6B2g1WwchbVfZNLt4mkN7KE9HWa4W2VVSigcXQVL1exSu9cU+zc/lbilL5mNZpS1gnacwCEAodrh7Q04amMt4kItGNivNUctwcdyKZtm/9qttepmweZ/haFncR/GHMOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254696; c=relaxed/simple;
	bh=NCgqxfvjeAved03ATSJnga+ObPGMSCUXmgck86kGYAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L77sfAoZoisHp/gL83duSrsXGldbUgvBJMKovxMZ80OHpGQvem4BT115J2vvlIv+yOPqomKER+tvU0XIV+paceILw57efBxhxlGWtWHH9wTeAK6aYWay1c13+bN5UPWc8J/VY7KSuip3kZjrHtdJM4SPkSks8fWKvQ0ZyNBTdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=o0NDYH8r; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fmmGNMpsl34ABgYdlvf9jmjUIfBYwPzaJD2Eq9S8un8=; b=o0NDYH8rvQAkkHDyotFCRvnsWq
	XUvFwfAdS1JttmQqrxPibYeGt7NWTrKvdeP881sakioqQKIq83ISkWGf5CG8tfZ3YBB8RrheCGCWK
	g2OC7EULA9zho8PUh+BUlJqRcnoOH35EMrbNWqmAYosDnbAW7ACWUKp7d2hUzP3G7ivk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0OXy-00BDrI-AC; Wed, 11 Mar 2026 19:44:42 +0100
Date: Wed, 11 Mar 2026 19:44:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as
 hw control trigger
Message-ID: <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-2-i@rong.moe>
 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7303-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58314268DED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> While I agree that the current policy makes its own sense and works
> well on most devices, it leads to out-of-sync software states on recent
> laptops.
> 
> When the LED's hardware autonomously put itself into hw control mode,
> it is offloaded to the hardware per se -- we *can't* prevent this from
> happening.

If you cannot control the hardware, why are you trying to control the
hardware?

> The series is about how to update software state to reflect the
> hardware state change. Blindly keeping the software state despite the
> hardware state is hardly meaningful and makes software out-of-sync.

Since you cannot control the hardware, just don't register the
LED. That gives a truer picture. Something else than Linux is
controlling it.

Do you get a notification when that something else takes control? ACPI
event or something? If you do, can just re-impose the software state
back on the hardware.

> As shown above, this series doesn't change the LED's hardware state and
> it just updates the software state to notify user about that. If you'd
> like to enforce software state's priority, we would have to explicitly
> undo the hardware state change immediately after the LED's hardware has
> autonomously activated/deactivated hw control mode.

Yes, if you decide Linux is driving the hardware, the Linux state
should always be imposed back on the hardware. Just consider it flaky
hardware which needs hitting over the head every so often to make
work.

But maybe we should take a step back here. What are your real use
cases here? Why do you want Linux to control this hardware, when
something else already is controlling it? Is /sys/class/led even the
right API? That will depend on what your use cases are.

	Andrew

