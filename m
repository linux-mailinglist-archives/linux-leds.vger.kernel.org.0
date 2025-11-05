Return-Path: <linux-leds+bounces-6016-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE297C36A46
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 17:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF3F66553D
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 16:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13D8335560;
	Wed,  5 Nov 2025 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PhYWs65n"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA77253F13;
	Wed,  5 Nov 2025 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359121; cv=none; b=OfRFC8ejSKDzlw2l3wCjN5APuTL/W3PSTDZzte7LB/HIM64hjfMKJWS22ZPR2Yghn/ldOx9f71H/j8rhtnHp1d8E9OOeXxGqTFJC1kgRYpuzjSeJHbzpakv2w+Hj/jpLT/WbWhnNmawwVrlsEiteEAr3xaw9O+9+InAkc9RKEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359121; c=relaxed/simple;
	bh=2BGjkh/JekalauIHx1gD91uKZot6shrPhBrecXqX97M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/lT97jovS64eYoUmHDescAE3bzgEu2aQo89alxQifh3C2H0T7X5p8QEzMO9QLFr8XApJf7BWmhuuiaZYH3RLrzhfZBKLcaCzt9LnXOxypT/5gM60pHMsMk2eEDnKDhGv3jQXT8OaHmFikOqJ7rn1dMkIMfe1J/j/mqdC3PyU5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PhYWs65n; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kAPfZ/9MFmLoAqOWOpsnTOjNLSyhV2aPcNiujD83BJc=; b=PhYWs65nWStFmCuntFQp5x8y0W
	z1/+ZZtX0EssZ7haGojfzLcd9XBfEgvf3u0S1D3e31RoBTasG/9ktaEe29ZUGdH+/XAxnLWzaDMei
	Q+59Cm+jAbp3h8jB4oUkrnSe5pycJ2QBq+bk8pMnJy1tE1D6MSsrxHI14DV47063qPh8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vGfko-00D0s4-EZ; Wed, 05 Nov 2025 16:48:58 +0100
Date: Wed, 5 Nov 2025 16:48:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
Message-ID: <b7454a3f-fac8-4789-a3ef-baf341aea8f0@lunn.ch>
References: <20210601005155.27997-1-kabel@kernel.org>
 <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
 <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
 <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
 <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch>
 <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
 <CA+V-a8snRfFrZeuJ7QSt==B5vWAyTpHzdNj0Jx6oz_aaozbGYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8snRfFrZeuJ7QSt==B5vWAyTpHzdNj0Jx6oz_aaozbGYQ@mail.gmail.com>

> Sorry for the delayed response.
> 
> I started investigating adding PHY leds. In page 53 section "4.2.27
> LED Behavior" [0] we have an option for LED0/1 combine feature
> disable. For this is it OK to add a new DT property?

Why do you need a new property?

You just need to set this bit depending on what has been selected via
/sys/class/led.

And if the user asks for a mode which the hardware does not supported,
the core will fall back to use on/off and blink the LED itself.

PHY LEDs are the wild west. Every vendor has its own idea what is
important, and adds features which other vendors don't have. But that
does not mean we need to support all the features in Linux. So the
core has a reasonable set of features which we expect most PHYs can
support. I don't want to add more features unless you have a big
business case it is needed, and other PHY also have the same feature.

     Andrew

