Return-Path: <linux-leds+bounces-5034-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C1B01091
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 03:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4ECC170D87
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 01:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2705DDDBC;
	Fri, 11 Jul 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BrNXdU4I"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554C2E555
	for <linux-leds@vger.kernel.org>; Fri, 11 Jul 2025 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752195851; cv=none; b=RQPhnveKaKeyDaIIQfhps7VelseTwmDgQY51gI2Dwpff+IcUONtAdTgssE1YFY/6r/AYHh6UXavIYxbFeodua8U3AZqoYigElpiusP12nEyVyU4FjUkctxVcT+VmoiE6qRTL3nF0pMYtRQ/wE+npWO6yCH5PMEJT+EfeNFZDzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752195851; c=relaxed/simple;
	bh=zXuttkuqPzPh/icSffjlTlQv1CfPYfT9HL+4ErpgQHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2YSXfm0KZzM2wE8gMV0UGIthySkA5rgyeUsDHRjdUyXHGHNwNNgQgx2UpjtfSRSVJzFST+jIMXiY/4e1RE+lL6iYYyjP1MU3w/ZZlRs+xOJqP/UpoOHjBfJz8O0yYn8JyrnLmqttBqXb/zR3/9+8Dy8Y/TD90BxudDLLRvB6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BrNXdU4I; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QmST+EevX1VS0ziV12NqUWGfPZbdhrihV4eTdHwn7nw=; b=BrNXdU4IaVg0PFj9QpQHjSSC66
	TPCPi8gWdijcAasElqQIz/q7mFoBf5cSwA8s3YJA2P/3oOyGcB/Vv/Gmn5NFOois57XSGblV4FwFK
	XEbVEV2eA3S/ftzXNHsKFxJVOxT0647rvpXftoXxHY1CfiB+zPUH+r67R8PJToHyZ31Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ua2BI-001B7G-H0; Fri, 11 Jul 2025 03:04:04 +0200
Date: Fri, 11 Jul 2025 03:04:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nyanmisaka <nst799610810@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-leds@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: trigger: netdev: Configure LED blink interval for
 HW offload
Message-ID: <4856875f-72cc-45ce-bd5b-8097122dac5c@lunn.ch>
References: <20250120113740.91807-1-marex@denx.de>
 <2f0af25c-0360-4bb2-bf01-4c1587c6fd3c@gmail.com>
 <aHBZEh0q_FBh6urS@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHBZEh0q_FBh6urS@makrotopia.org>

On Fri, Jul 11, 2025 at 01:21:38AM +0100, Daniel Golle wrote:
> On Tue, Jul 08, 2025 at 01:14:52AM +0800, nyanmisaka wrote:
> > On 1/20/2025 7:36 PM, Marek Vasut wrote:
> > > In case a PHY LED implements .blink_set callback to set LED blink
> > > interval, call it even if .hw_control is already set, as that LED
> > > blink interval likely controls the blink rate of that HW offloaded
> > > LED. For PHY LEDs, that can be their activity blinking interval.
> > > 
> > > The software blinking is not affected by this change.
> > > 
> > > With this change, the LED interval setting looks something like this:
> > > $ echo netdev > /sys/class/leds/led:green:lan/trigger
> > > $ echo 1 > /sys/class/leds/led:green:lan/brightness
> > > $ echo 250 > /sys/class/leds/led:green:lan/interval
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: Christian Marangi <ansuelsmth@gmail.com>
> > > Cc: Heiner Kallweit <hkallweit1@gmail.com>
> > > Cc: Lee Jones <lee@kernel.org>
> > > Cc: Lukasz Majewski <lukma@denx.de>
> > > Cc: Pavel Machek <pavel@ucw.cz>
> > > Cc: linux-leds@vger.kernel.org
> > > ---
> > >   drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++---
> > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > 
> > Hi there, a while ago OpenWRT 24.10 was updated to linux kernel 6.6.93 [1]
> > which contains the backport of this commit. Unfortunately this caused the
> > LAN and WAN port LEDs on some MediaTek based routers to not work properly,
> > they just kept blinking.
> > 
> > According to a comment [2] by an experienced OpenWRT developer and from my
> > understanding this is a breaking change. Could you please take some time to
> > review the issue in the link and help revert the commit if necessary. Thanks
> > in advance.
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=3648ddabcdc25aad8af95778d7f87225272815e9
> > [2] https://github.com/openwrt/openwrt/issues/19263#issuecomment-3032228022
> 
> To clarify: This patch, which also got backported to Linux stable trees,

Why was it back ported? This is clearly not a fix, and does not have a
Fixes: tag.

> changes the meaning of the ->blink_set() op.While previously, calling
> blink_set() would instruct the hardware to put the LED into a
> permanently blinking state, it is now (also?) used to adjust RX/TX
> blinking times while the 'netdev' trigger is selected.

I agree this is a bad idea. The op should not be overloaded like this.

I suggest you submit a revert patch, and include a Fixes: tag.

What is also odd is that i don't see a patch adding a user for
this. We generally don't add a new feature without a users!

	Andrew

