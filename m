Return-Path: <linux-leds+bounces-5210-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A496B1F573
	for <lists+linux-leds@lfdr.de>; Sat,  9 Aug 2025 18:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC9D3B95AD
	for <lists+linux-leds@lfdr.de>; Sat,  9 Aug 2025 16:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDB82BEC59;
	Sat,  9 Aug 2025 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Sz+m2hla"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA22BE7B5;
	Sat,  9 Aug 2025 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754757010; cv=none; b=tgHYXFchskr5fniz6JkTIAXJWpF7BPzD7DZMoirUgxCBt52frquS9NWMbMvP8mqRjrOexXqfzJ4bEbxIT+JkYiNX409s9Co4/zRYJjSKEekzGRrYSSXrZOSwfrpzHQ4i1A5I9UWK+JVpRqrmzwrLCbUqe+F8ypMd6MS+c9UeU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754757010; c=relaxed/simple;
	bh=Cm8J6ngGByY9cQAYYH5UAeYDF7M0/kP9w50arR5JHLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt0ksytMFo9HgyZqI4JRcR3IdiWY+75ecNUpyNgqUxbkKLx0LB/qSjqh4lZCqJBDUaq8Ai9ZQjhjvWkn//s0gTJrSL7s4HmHx91ezeYTr+z5cqoJUmAT1Pqb33AgFNxLz6XlHSt7FO3gLKdIGE5bsGUg+tWR7vTHuJ62GbaNpOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Sz+m2hla; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ejv8+d7vSpX/xZq5ZABJ9+PMyt3KH7ziQBU5i/fvp/Y=; b=Sz+m2hlaT3yZ1Kwq0JUuFRki6o
	0ObnNEA+pVQVuIT3/EGqkvJTQPylKIl0aQes3qJvaOzyguv38YpBNPQ0joBf6ne0IVuA+GbVytVee
	U7CvEFkUyeug4froVeX2ctKTKgLvafurOm1odsXwWjG2jL3URPgqduUu7OxV6SFmzjt0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ukmSC-0049m9-DY; Sat, 09 Aug 2025 18:29:56 +0200
Date: Sat, 9 Aug 2025 18:29:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
Message-ID: <505f53fc-3481-497e-bc26-a70f3321e075@lunn.ch>
References: <20250113002346.297481-1-marex@denx.de>
 <2598568.Sgy9Pd6rRy@diego>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2598568.Sgy9Pd6rRy@diego>

> as DT is supposed to be a hardware description, I think throwing arbitary
> binary values around is not very readable - especially as the above would
> be a combination of setting-bits for the TRIGGER_NETDEV_* things.

I tend to agree with you. This is a tricky area, since it does appear
in most part to be configuration, not hardware.

What i think you should actually be describing is the label on the
case next to the LED.

Taking a random example:

https://www.downloads.netgear.com/files/GDC/Unmanaged_Switches/GS105Pv3_GS105PPv3_GS108LP_GS108PP_GS116LP_GS116PP_DS.pdf

The case says:

Left LED: Link/ACT mode
Green = Link at 1000M
Yellow = Link at 10/100M
Blink = ACT

Right: PoE Mode
Green = Powered
Yellow = Fault

So there is in fact four LEDs. Two of them are actually nothing to do
with netdev. This shows how flexible 'PHY' LEDs are, they can in fact
be used for anything. We currently don't have a PoE trigger, but it
should not be too hard to add.

For the two actual netdev LEDs, we need to describe the text of the
label. The naming of the DT property also needs to emphasise this is
the label. And if the case has no label, you should not be putting
properties in DT, the LEDs don't actually have any fixed meaning, it
is user space policy to set them.

As you said, there has not been any obvious progress on such a DT
binding for 6 months or more. I would probably interpret that as its
not particularly important. Maybe it actually makes more sense to work
on user space tools, to make it easier to configure these LEDs. Maybe
extend ethtool with a --get-led and --set-led. It is not always so
easy to following the symlinks in /sys, PHY LEDs appear in a different
place to MAC LEDs typical of switches etc. Once we have ethtool
support, it becomes easier to add entries to /etc/network/interfaces,
or udev rules, etc.

	Andrew

