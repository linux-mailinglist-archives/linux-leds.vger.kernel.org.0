Return-Path: <linux-leds+bounces-3609-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C69F2641
	for <lists+linux-leds@lfdr.de>; Sun, 15 Dec 2024 22:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93ACE7A15F3
	for <lists+linux-leds@lfdr.de>; Sun, 15 Dec 2024 21:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C9A1BD4FD;
	Sun, 15 Dec 2024 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCqJOY+Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DC1B87C7;
	Sun, 15 Dec 2024 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734297997; cv=none; b=SK+121wiMi0aUjK5A1EnLrZdB+3HeXF3Lm1igj5M3XwcMuDOs9+KckYmCPXqqbJ2u1nWmuZyS+dOSGBLklwm/WCdxDEYsymBHKlr1a3AXnz40nrYH51XWsDlViVMhrkMpGdLFuuLVVsx7SoT2FE/AXzrIgk4UbXx9cPb4sCTFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734297997; c=relaxed/simple;
	bh=/wCfD8PYxsv1hEHkNP3Aza2mADy3dTGKMocVP/4mrKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDN79kCMhPbnvAdgMf40C61L+8VRG2sVb60Hp5usBWoQATPz3Pu/xhF24CL8XFuPqj04sCv4YHEp1a9Tx29mwPBd41GAVVY2qyJRs7adIVV0v4K+OmQHnQQIQeBQE3BIBIkF8r8KJF4YSavblukFN2q+44XCCjR6h7gRHuu3Y+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCqJOY+Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1A0C4CECE;
	Sun, 15 Dec 2024 21:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734297996;
	bh=/wCfD8PYxsv1hEHkNP3Aza2mADy3dTGKMocVP/4mrKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCqJOY+Z383UEd4ZnNbqRNrMjT3zblk3FAZ6cxSnXMOGkagpgfs4g+gnj9oBBBcTs
	 E+CCYQim53VrLdVbDcEvvprbDbuF1+6rwACMAbTa1fR9awoPe6r5fWZceaB1Zv9ncp
	 EWRhyT+uLP79eiJiCk48HvgPs25ULNJD1Q2Mdzxt/gwnMSH8Gg8cJs9VQLF9UuakL7
	 LEYWi0rMd+89n4aWRtBKLWnMAdT0h7QQgznz11khTmMrioPemdG9jFvHHvK9CG0Gg/
	 LiadWLdGw8ortZv4acIB1KN4vBezDFF/DShgkL9M/Dfxkkr7BU2Ly2kww990uqGPZ6
	 NErEKWXBfFrEQ==
Date: Sun, 15 Dec 2024 22:26:31 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Lee Jones <lee@kernel.org>, regressions@lists.linux.dev, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
Message-ID: <6gxg466bl7tbyfq5yoenpw5t3vcfcyywv3jydwwwiqik2pzqsv@3g4gk6m62mdk>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
 <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
 <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec61714eaa3d84498cd69dc673fb11996550a3ea.camel@gmail.com>

On Sun, Dec 15, 2024 at 12:39:10PM +0100, Klaus Kudielka wrote:
> On Thu, 2024-12-05 at 13:42 +0100, Marek Behún wrote:
> > On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Behún wrote:
> > > 
> > > This is because the patch went into 6.13 but the rest of the patches
> > > did not, Lee wants to take them for 6.14 :-(
> > > 
> > > Apply this series and it will work.
> > > 
> > > https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.org/T/
> > 
> > Alternatively you can overcome this issue if you enable the
> > turris-omnia-mcu driver in 6.13:
> > 
> >   CONFIG_CZNIC_PLATFORMS=y
> >   CONFIG_TURRIS_OMNIA_MCU=y/m
> > (and also the subsequent options).
> > 
> > Marek
> 
> Testing reveals:
> I have to enable CONFIG_TURRIS_OMNIA_MCU_GPIO as well, to make the LEDS work again with v6.13-rc2.
> 
> So far, so good.
> 
> But the upcoming dependency in 6.14 will be on CONFIG_TURRIS_OMNIA_MCU, not on CONFIG_TURRIS_OMNIA_MCU_GPIO.
> Is this correct?

On both, see the first added line at
  https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?h=for-leds-next&id=d82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa

Marek

