Return-Path: <linux-leds+bounces-3085-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CEC99B64B
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2024 19:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615CE1C20F4F
	for <lists+linux-leds@lfdr.de>; Sat, 12 Oct 2024 17:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFB180C13;
	Sat, 12 Oct 2024 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="S4Ff3VwS"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B46F06A;
	Sat, 12 Oct 2024 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728754235; cv=none; b=B5m+1MWeuVn+DMpAkBiGC1DdNl6JnXmEi4f4dMF0vSclerzZT4V4YhmpKKIsLUOkMfd6Ytkdo3VXPt4l1bWj4PxnHDRvbQhf4BFaJsmVQAiiCk9+wk2AWqym8w0HyeWn8y5B5PC5riwfPDYE8htn8xXCyEL1Y4k0BF2/M9ve20E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728754235; c=relaxed/simple;
	bh=lAmk8qweEfG9WF+FkFKFFHuHtt4spQx5ZrigpxHR2oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvYVrm14PvJDU4R9Fn8VZZsYMDIrhphLVcHyIt77mKfibpjQUPzz1zWsirt/p46JUmK0RV3yvkeoYfsvI4Kz/wpHXB8xUZnDEpNXZ6lbHLO0cmWQD6nv0imwNSoWWjk58Sjj5Q+w+bQK0ookSFmGFO7zZGJ2hYd4rD2dNIlhgPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=S4Ff3VwS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DQm141ViCMzhU11jXjJClJYjjMCDmk8T4ukFMZIGqnc=; b=S4Ff3VwSFeXUoMKXaJ6HEPfZ8v
	CUoSBNtqEp8z3PQ+A4E24cO5Ipjt8p04YwFuz3oDjav398C24tjeCTwGInoiBNugaCYKYb2rkKS2c
	OX0iVUGwfNEk48fuLs3m59NQngJkXGnhf2/IfGvmjng9C3byQXc1+NfHQXX98ejQlNSE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1szfwa-009oJ2-Vr; Sat, 12 Oct 2024 19:30:20 +0200
Date: Sat, 12 Oct 2024 19:30:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xu Liang <lxu@maxlinear.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/5] net: phy: intel-xway: add support for
 PHY LEDs
Message-ID: <8ee4f92f-aaf4-436a-bc1e-23fcb24e22ca@lunn.ch>
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
 <81f4717ab9acf38f3239727a4540ae96fd01109b.1728558223.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81f4717ab9acf38f3239727a4540ae96fd01109b.1728558223.git.daniel@makrotopia.org>

On Thu, Oct 10, 2024 at 01:55:29PM +0100, Daniel Golle wrote:
> The intel-xway PHY driver predates the PHY LED framework and currently
> initializes all LED pins to equal default values.
> 
> Add PHY LED functions to the drivers and don't set default values if
> LEDs are defined in device tree.
> 
> According the datasheets 3 LEDs are supported on all Intel XWAY PHYs.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

