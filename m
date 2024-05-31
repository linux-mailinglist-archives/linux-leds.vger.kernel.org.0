Return-Path: <linux-leds+bounces-1751-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD68D6236
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD8C1C225F8
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFEE15884F;
	Fri, 31 May 2024 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="D3glK/XK"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9A139563;
	Fri, 31 May 2024 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717160089; cv=none; b=ax82+b6824+vbKvC5Vbp+61xNnAvguUkW5LRIWaftjKYEjDwLfY5QleXtz9IGHjHf5Vd82cx6/iigf08v0hsWhimdbiSiXon3yze5IJScpcVAcRq5asJTEA7/uJ5adsmdBiXI5MkfypPZdfuehvvJwXrqmFMy8tTk9YoiIoS65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717160089; c=relaxed/simple;
	bh=4VK8yO8Vzzlncqg2eBUizfaA8skHINrWWG3LC67pr50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZaN+9j7rBlwyzEQ/5VAEdLDU7ev9N4/M+ieRqbs+ZKbvuh0IwfyBVExhSHPdVxqtpABfFURWS8M51W4jHJW4PHNm4jT0KqVR0IggmYDfQCNSBMW1pRp2NmvnNG0L/3N396efppTYOckrvNxny5cVhkD2qjkJbKTPKYw3vwAiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=D3glK/XK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m4EVGLVuRYDFFu1v9PkMkfvFH9r0FgbSbS5eViwROIk=; b=D3glK/XK6cIb8dM8vuVGJ2fRGp
	9JoeLoiHmidiZCmg2QSi0ygJiVBDpcp+wu/QIFPhY+Psx307dxOU3c797appn6IzMjvLe5qoPfOVo
	drgmLQvV+Xt0zKNbuEDIxkT7LHaZ6qqQatTyKk0pb65FMsKO4ySMNfqQ/i/iHkJUWovA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sD1mN-00GSwR-OY; Fri, 31 May 2024 14:54:43 +0200
Date: Fri, 31 May 2024 14:54:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Linux LEDs <linux-leds@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, johanneswueller@gmail.com,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Genes Lists <lists@sapience.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
Message-ID: <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>

> I actually have been looking at a ledtrig-netdev lockdep warning yesterday
> which I believe is the same thing. I'll include the lockdep trace below.
> 
> According to lockdep there indeed is a ABBA (ish) cyclic deadlock with
> the rtnl mutex vs led-triggers related locks. I believe that this problem
> may be a pre-existing problem but this now actually gets hit in kernels >=
> 6.9 because of commit 66601a29bb23 ("leds: class: If no default trigger is
> given, make hw_control trigger the default trigger"). Before that commit
> the "netdev" trigger would not be bound / set as phy LEDs trigger by default.
> 
> +Cc Heiner Kallweit who authored that commit.
> 
> The netdev trigger typically is not needed because the PHY LEDs are typically
> under hw-control and the netdev trigger even tries to leave things that way
> so setting it as the active trigger for the LED class device is basically
> a no-op. I guess the goal of that commit is correctly have the triggers
> file content reflect that the LED is controlled by a netdev and to allow
> changing the hw-control mode without the user first needing to set netdev
> as trigger before being able to change the mode.

It was not the intention that this triggers is loaded for all
systems. It should only be those that actually have LEDs which can be
controlled:

drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
drivers/net/ethernet/intel/igc/igc_leds.c:	led_cdev->hw_control_trigger = "netdev";
drivers/net/dsa/qca/qca8k-leds.c:		port_led->cdev.hw_control_trigger = "netdev";
drivers/net/phy/phy_device.c:		cdev->hw_control_trigger = "netdev";

Reverting this patch does seem like a good way forward, but i would
also like to give Heiner a little bit of time to see if he has a quick
real fix.

     Andrew

