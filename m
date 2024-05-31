Return-Path: <linux-leds+bounces-1755-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF78D62FF
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825F11F25C84
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46818158D7D;
	Fri, 31 May 2024 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CFmBUj+S"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E539158D69;
	Fri, 31 May 2024 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162154; cv=none; b=lXrV0KgiiNjnKr1Pdy/BVwh/vAHeWqHTBNNaR41wOf1CuZo5E+crPpQpR729YDZYvzVLQhDP1TIadci8KJlFMhPDujqRY8lVOSABahhe8vAvOfRCM7noj6IXQgIn02XoOyx5GTy7wKdUl9nQxKKTYKgeXYPBuugwMkX9UH4QG7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162154; c=relaxed/simple;
	bh=HAdBczTqYee4g0PfJNsMrZzNsQM3qPcsfsGtaRBqd40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSpCn482O7yROL2G7pMrc/DAheO7ZafjPSlaA52BJ1Zuw39mVOAJo2LZvCZPBMAOrQWY4DSDppZvsfwsUKF8hQ28xabdfDsvxLFu1aX9EUe0U0PdL8QRSKPu2mthnMqRTVfiFKG61/vbCNz98bVfCfsqAnDIw4iHA656NGciedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CFmBUj+S; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FFhmGtm10lHefONMxTl29WG3wWok7tsWWVFlFVzZL74=; b=CFmBUj+Sotj6vExgsK2oFNemud
	P/OnqnjStz1aea1014fPefiq1zZ2l+CYGNUbECxGBEt0LoXIGg6nNMa1cuHgR1Y2LhJmK5xryH3PB
	8Wb7txcOEQW359ekoFY6/bsvnis6RYl3Ue8Gy2NJtQDllFQXbfr9l8mG5uojulVXhf/8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sD2Jh-00GT4l-UI; Fri, 31 May 2024 15:29:09 +0200
Date: Fri, 31 May 2024 15:29:09 +0200
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
Message-ID: <e6800715-6bc0-49a0-bd00-5a75b852ea9d@lunn.ch>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
 <2a6045e2-031a-46b6-9943-eaae21d85e37@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a6045e2-031a-46b6-9943-eaae21d85e37@redhat.com>

> > drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
> > drivers/net/ethernet/realtek/r8169_leds.c:	led_cdev->hw_control_trigger = "netdev";
> > drivers/net/ethernet/intel/igc/igc_leds.c:	led_cdev->hw_control_trigger = "netdev";
> > drivers/net/dsa/qca/qca8k-leds.c:		port_led->cdev.hw_control_trigger = "netdev";
> > drivers/net/phy/phy_device.c:		cdev->hw_control_trigger = "netdev";
> 
> Well those drivers combined, esp. with the generic phy_device in there
> does mean that the ledtrig-netdev module now gets loaded on a whole lot
> of x86 machines where before it would not.

phy_device will only do something if there is the needed Device Tree
properties. Given that very few systems use DT on x86, that should not
be an issue. So only x86 systems with r8169 and igc should have the
trigger module loaded because of this. It would be good to understand
why other systems have the trigger loaded. However, as you say, this
will not fix the underlying deadlock, it will just limit it to systems with r8169
and igc...

    Andrew

