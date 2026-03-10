Return-Path: <linux-leds+bounces-7262-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KDMHrR3sGmtjgIAu9opvQ
	(envelope-from <linux-leds+bounces-7262-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 20:57:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC94425741C
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 20:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80F723051D3F
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 19:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3CE3E2746;
	Tue, 10 Mar 2026 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dB3e9HJ4"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0266A3E2748;
	Tue, 10 Mar 2026 19:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172638; cv=none; b=Y97W3OCxG4Yl5JNld5msGjfpa9khBw8Wpu9qd18p2vBeMox0ky5Y9O6P/598uetyq03OAoPwvUVZ1/WI0wUyi5obKcGmO4mbJDoISMzXvJV/U1aPvRKk954pObrQq64GNLk4DCCZsNJRbTd5kw/z/I58yd6TTla54kJkHx+7l0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172638; c=relaxed/simple;
	bh=M6Yyn2IqOVSyqGneisdkLZsfpP6HHVTCGxUUwPpoQG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYIdH/2YKTk08wwuMh64jvxSm4tWyST7xz0GlGQuuKlBGtGYDyjIl6VIL4S/Capk8qSZg7ZOmx21ikCpf6m1amRk1Tn31xAk/bEUXPJeNVcVBkv5rAtjp1HEuxwyVvXRgsztvu9/g7YujtRpwexipb48JyUjqiqE6UAb4457Bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dB3e9HJ4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7TGbrStLEYKLqfIfPAJzKvS2CcoVdXYyHBaWzSAeeew=; b=dB3e9HJ4w+a2kr/vJiB15RcLX1
	zWbSeRL1ZwdCrXchiENx2+Wwd6kAkJNUZEH+DnAD2N/fb3aeUlRx1nzlmyYKnSC4t1nVH1OmQBc/q
	2fhMF0LLu6he9mLFky4mz67uN2tIVMn63KJZDtFI67+SRHfr9+EZbUGsU+ONfVSU68eo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w03CO-00B4rz-0v; Tue, 10 Mar 2026 20:57:00 +0100
Date: Tue, 10 Mar 2026 20:57:00 +0100
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
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
Message-ID: <c61a58df-8211-4f6a-8f60-b66b565123e4@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
X-Rspamd-Queue-Id: DC94425741C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7262-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lunn.ch:dkim,lunn.ch:mid]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 03:05:57AM +0800, Rong Zhang wrote:
> Hi all,
> 
> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hw control
> trigger. Meanwhile, such laptops also offer a shrotcut for cycling
> through brightness levels and auto mode. For example, on ThinkBook,
> pressing Fn+Space cycles keyboard backlight levels in the following
> sequence:
> 
>   1 => 2 => 0 => auto => 1 ...
> 
> Recent ThinkPad models should have similar sequence too.

With networking, we consider the hardware as an accelerator for what
the Linux network stack can already do in software. We let the user
configure the network stack however they want it, and then we ask the
hardware, can you accelerate this, so we don't need to do it in
software? It might say -EOPNOTSUPP, so it is left in software. It
might say 0, and we never see the packets, because the hardware is
doing the work. The user is not really aware acceleration is
happening, because they just configure the network stack how they
want, independent of acceleration or not.

For PHY and MAC LEDs it is exactly the same. Generally, the LEDs in
RJ45 connectors, or on the front panel can be turned on/off. The
netdev LED trigger knows if the link is 10M, 100M, 1G etc. It knows if
packets are being transmitted or received. It can make the LEDs show
the link speed, or blink for packet activity, in software, using
simple set_brightness calls. It will also ask the LED, can you
accelerate this? Can you get the state directly from the PHY/MAC? The
LED in my keyboard shift lock will say -EOPNOTSUPP, and the netdev
trigger will keep blinking it in software. The LED driver by the PHY
might say 0, and blink the LED itself. Or it might say -EOPNOTSUPP,
because the vendor decided to only support RX+TX, not only RX.

My preference is this model of accelerating what Linux can already do
should be used everywhere.

You know how many levels the LED supports, so the trigger can easily
implement the steps, 0, 1, 2, 0, 1, 2, based on receiving some event
from somewhere.  You can also accelerate this, you can ask the LED,
can you directly receive the event? -EOPNOTSUPP, keep controlling it
from software. 0, stop driving it from software, the hardware will
accelerate it.

If the system has access to a light sensor, the trigger can also
decide on 0, 1, or 2, based on polling the light sensor every
second. It can then ask the LED, do you have direct access to the
light sensor, can you accelerate this?

The experience from networking is, once you get into the mindset of
the hardware is there to accelerate what Linux can already do, a lot
of problems just disappear. It might you first need to implement the
software version, but once you have that, acceleration is easy.

Does Linux already have a software version of what you want? Can you
accelerate it?

	Andrew

