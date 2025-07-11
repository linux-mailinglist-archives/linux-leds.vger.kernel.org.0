Return-Path: <linux-leds+bounces-5033-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E768B0101E
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 02:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0DB65C1305
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 00:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8794C98;
	Fri, 11 Jul 2025 00:21:51 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06654A28
	for <linux-leds@vger.kernel.org>; Fri, 11 Jul 2025 00:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752193311; cv=none; b=S0QwqdKXe13IOOanaof+lSZzNg9ooW1UTf2dfOQKgwJ/dzLTjzktBOgGvd9Oxl+QFm91VVeG3fKs8FWHlsyrcJpvLQAJ5iPvbH4G+zRFmtFVHZLk4aeJJ3z2zFYjgK9Qlc12zP6AfPtjKsDibIVYqf73BeLNtlTfFY06J4ylrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752193311; c=relaxed/simple;
	bh=6ZQstnTtSVz3F9sV/rZH2Xsd2dsAGV9qxnk94hZrzOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLtvaM0B2nPy8ati8Hcwn20+qfzSbmribLwysaYKvtX6/SYmdgOoodErgzg9btpxFVT4/tV/hxVMjGZ5OazNABVBbN/Ors+Fhx24Y7rF5RU/6T/2jLYrkvaAxZIv24gzaSxrqwolaEJZvtmMETrlPG/Tg+/mDC8LdJCa/DhIPSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ua1WH-0000000088T-2Jw6;
	Fri, 11 Jul 2025 00:21:41 +0000
Date: Fri, 11 Jul 2025 01:21:38 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: nyanmisaka <nst799610810@gmail.com>
Cc: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: trigger: netdev: Configure LED blink interval for
 HW offload
Message-ID: <aHBZEh0q_FBh6urS@makrotopia.org>
References: <20250120113740.91807-1-marex@denx.de>
 <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>

On Tue, Jul 08, 2025 at 01:14:52AM +0800, nyanmisaka wrote:
> On 1/20/2025 7:36 PM, Marek Vasut wrote:
> > In case a PHY LED implements .blink_set callback to set LED blink
> > interval, call it even if .hw_control is already set, as that LED
> > blink interval likely controls the blink rate of that HW offloaded
> > LED. For PHY LEDs, that can be their activity blinking interval.
> > 
> > The software blinking is not affected by this change.
> > 
> > With this change, the LED interval setting looks something like this:
> > $ echo netdev > /sys/class/leds/led:green:lan/trigger
> > $ echo 1 > /sys/class/leds/led:green:lan/brightness
> > $ echo 250 > /sys/class/leds/led:green:lan/interval
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Christian Marangi <ansuelsmth@gmail.com>
> > Cc: Heiner Kallweit <hkallweit1@gmail.com>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Lukasz Majewski <lukma@denx.de>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: linux-leds@vger.kernel.org
> > ---
> >   drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++---
> >   1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> 
> Hi there, a while ago OpenWRT 24.10 was updated to linux kernel 6.6.93 [1]
> which contains the backport of this commit. Unfortunately this caused the
> LAN and WAN port LEDs on some MediaTek based routers to not work properly,
> they just kept blinking.
> 
> According to a comment [2] by an experienced OpenWRT developer and from my
> understanding this is a breaking change. Could you please take some time to
> review the issue in the link and help revert the commit if necessary. Thanks
> in advance.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=3648ddabcdc25aad8af95778d7f87225272815e9
> [2] https://github.com/openwrt/openwrt/issues/19263#issuecomment-3032228022

To clarify: This patch, which also got backported to Linux stable trees,
changes the meaning of the ->blink_set() op. While previously, calling
blink_set() would instruct the hardware to put the LED into a
permanently blinking state, it is now (also?) used to adjust RX/TX
blinking times while the 'netdev' trigger is selected. This means that
all PHY drivers currently implementing a .led_blink_set op will need to
check whether the 'netdev' trigger is currently active (and in this case
interpret the call as being intended to change RX/TX blink intervals) or
not (and then just put the LED into permanently blinking state, which is
also the current behavior of all drivers I'm aware of).

I hence suggest to revert this change, as none of the drivers were
changed to adapt to the new behavioral expectations -- if any of the
drivers does behave as expected (which I somehow assume, as the patch
was probably sent while specific hardware was on the developer's desk)
that is coincidental.

It would also be better to not just change the definition of an existing
operation in an incompatible way, but rather introduce a new op for that
purpose (which may or may not replace the existing .led_blink_set op in
the long run, once all drivers have been adapted).

