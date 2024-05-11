Return-Path: <linux-leds+bounces-1663-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E08C3061
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2024 11:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35B71F21A1B
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2024 09:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E297535D6;
	Sat, 11 May 2024 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="eyDG7Bbq"
X-Original-To: linux-leds@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF423DE;
	Sat, 11 May 2024 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715420149; cv=none; b=b108DHF/pPv48HxqOl/3soRaO9pBQA8xJGpQYJAhyVpIdLBwEYWRnl1YIwaq5kNCKFvo2pxLnmzBlKj8D9xVxbx2TgMHHtNoXecGbaPqZsm/aNX2afZ6fKLR2uKjiUEYuXF25QW7OaaY0ad6cIkCJXZGbkaRW7/4kjBzWIAaAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715420149; c=relaxed/simple;
	bh=BvPFoaXVuMlkHotikPNEYLmheM+9prSGu6IcaitWVlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rr6WT0WGxKZ6wImxCLZS2uTOmkJ9x48IQy7MsiDtTz0gzAMeROAIVnyj4rKMTU5mWFgtDIL2t98SvuCSkGKbZhXCKwYEX4whCPXYLuYs1eYxkCjdnj0ldsnhZv3699hmUT9UwjJK5FXOlEnZ7iAzemYs7dfqRG1U/bbZnP4xbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=eyDG7Bbq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YK/ds1gkbnMTSGHHRHJlklAGEyLYiT7Eu+ltFawe6hE=; b=eyDG7BbqqDxe9AkQN/XMfyHOzz
	KNLcZKB1QNtnR0SCFSjDMU76UzEsr7qwCdAhtkWAizMuflzRxYRs5zJmXGCp30gGhld+fe2969eYm
	CJq5tfamK3JwiCaduVHJUGMENwMl2J7v6vTNj5qS1JdHyyzUa6wgDlI8v2cH2JG+sIXmoZLi0M4Un
	RZ/j8ZpPrv5WeQ0hhHMb+kbckVs5Zmq5X1L+E7SUjsezICJib+4vTg6a7BDO8HY0PjZKazaxN+VoX
	+/qUYvjXPhfttGAVonRDpjmZxyffZP8gkJAqqCBICUuHeQK6B57/Z3pFO4hLKiew8X0Jnp0cV3m3O
	eoaxdlDw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38330)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s5j8Q-0008JX-0Q;
	Sat, 11 May 2024 10:35:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s5j8L-0004AO-Dl; Sat, 11 May 2024 10:35:13 +0100
Date: Sat, 11 May 2024 10:35:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	=?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH v10 3/5] net: phy: add support for PHY LEDs
 polarity modes
Message-ID: <Zj870XBJFEkXZM1z@shell.armlinux.org.uk>
References: <20240125203702.4552-1-ansuelsmth@gmail.com>
 <20240125203702.4552-4-ansuelsmth@gmail.com>
 <Zj6qURAmoED2QywF@makrotopia.org>
 <bb146832-30fc-4c76-a083-51a1bc087e61@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb146832-30fc-4c76-a083-51a1bc087e61@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, May 11, 2024 at 01:58:13AM +0200, Andrew Lunn wrote:
> > Wanting to make use of this I noticed that polarity settings are only
> > applied once in of_phy_led(), which is not sufficient for my use-case:
> > 
> > I'm writing a LED driver for Aquantia PHYs and those PHYs reset the
> > polarity mode every time a PHY reset is triggered.

What sort of reset? There are hard resets that set the registers back
to default, and soft resets that don't. I think you are referring to
a hard reset, but please be clear.

> > I ended up writing the patch below, but I'm not sure if phy_init_hw
> > should take care of this or if the polarity modes should be stored in
> > memory allocated by the PHY driver and re-applied by the driver after
> > reset (eg. in .config_init). Kinda depends on taste and on how common
> > this behavior is in practise, so I thought the best is to reach out to
> > discuss.
> 
> There was a similar discussion recently about WoL settings getting
> lost. The conclusion about that was the PHY should keep track of WoL
> setting. So i would say the same applies there. Please store it in a
> local priv structure.

Agreed. If it turns out that it's something that many PHYs need to do,
that would be the tiem to move it into the core phylib code. If it only
affects a minority of drivers, then it's something drivers should do.

The reasoning here is: if its only a problem for a small amount of PHY
drivers, then we don't need to penalise everyone with additional
overhead. If it's the majority of drivers, then it makes sense to
remove this burden from drivers.

Also note that this is one of the reasons I don't particularly like
the kernel's approach to PHY hardware resets - if a platform firmware
decides to describe the PHy hardware reset to the kernel, then we end
up with the hardware reset being used at various points which will
clear all the registers back to the reset defaults including clearing
WoL settings and the like. That's fine for AN state which will get
reloaded, but other state does not, so describing the hardware reset
can make things much more complicated and introduce differing
behaviours compared to platforms that don't describe it.

A lot of platforms choose not to describe the PHY hardware reset, but
some people see that there's a way to describe it, so they do whether
or not there's a reason for the kernel to be manipulating that reset
signal.

What I'm saying is there's several issues here that all interact...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

