Return-Path: <linux-leds+bounces-1662-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2E8C2DC2
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2024 01:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30806B226C5
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 23:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80653174EED;
	Fri, 10 May 2024 23:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iiyIfkxV"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830A613BAFB;
	Fri, 10 May 2024 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715385522; cv=none; b=kLXBm7ay8y90ESwvYvQcPcfeTXUy7wdy5Qy6jXOT2uAT54DQZ1z8DQh0Z1+7LoSMxvXvAaQRUDdi4o4oKB95YEigie14zPvx5PH+k0TssUpgpd2ZX8qV/WEdPjrQq2a1fpuIbEyrbPdjHwqszQ+umuMozbPC16xqNWUIpo0+S14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715385522; c=relaxed/simple;
	bh=Rw2z98v+eDfNW0peI8QlfkbvX2mMcCvJsflxNJVrbCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPIs1tEWXw4OxwKYT3LsATod3a0Ox4muZZ09uX7aFmfWhO5ODig/oKlUGusdfCBBKS2a+z4e4sgMfPeV8x8L+xCNaK3Q7uFvNvuMdzFQUSpcbmS9bKtuR20asB6s/Dppo17RPMEkOpTHLJIuZHnJqBwPZUYip52QXr++870Rbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iiyIfkxV; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i6+svHzw1fQhMuQYrr1eYkC7SUY5MZbc32DdVO9kxYQ=; b=iiyIfkxV+5n/px3gMZflCleO1/
	QzR70vMV/baXYjrTQroztf3PRQgnBmfog/ICZkBrq9razxGtW3DX56D3DH2F7j/ufKt9eP4SkFlOE
	3Hhe6zWkG6chov8n9SEhjHoLiBbdG1pEQ5mld+Z3qm0SAlwS14XPTgcYd1bZ2K3R3qhc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s5a7x-00FAkv-9W; Sat, 11 May 2024 01:58:13 +0200
Date: Sat, 11 May 2024 01:58:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	=?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH v10 3/5] net: phy: add support for PHY LEDs
 polarity modes
Message-ID: <bb146832-30fc-4c76-a083-51a1bc087e61@lunn.ch>
References: <20240125203702.4552-1-ansuelsmth@gmail.com>
 <20240125203702.4552-4-ansuelsmth@gmail.com>
 <Zj6qURAmoED2QywF@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj6qURAmoED2QywF@makrotopia.org>

> Wanting to make use of this I noticed that polarity settings are only
> applied once in of_phy_led(), which is not sufficient for my use-case:
> 
> I'm writing a LED driver for Aquantia PHYs and those PHYs reset the
> polarity mode every time a PHY reset is triggered.
> 
> I ended up writing the patch below, but I'm not sure if phy_init_hw
> should take care of this or if the polarity modes should be stored in
> memory allocated by the PHY driver and re-applied by the driver after
> reset (eg. in .config_init). Kinda depends on taste and on how common
> this behavior is in practise, so I thought the best is to reach out to
> discuss.

There was a similar discussion recently about WoL settings getting
lost. The conclusion about that was the PHY should keep track of WoL
setting. So i would say the same applies there. Please store it in a
local priv structure.

      Andrew

