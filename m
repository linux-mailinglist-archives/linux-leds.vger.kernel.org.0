Return-Path: <linux-leds+bounces-3830-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A07A17048
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 17:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 868613A571D
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 16:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CBF1E0DC0;
	Mon, 20 Jan 2025 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LwtPjWOb"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90052BE65;
	Mon, 20 Jan 2025 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737390938; cv=none; b=BHujxIcdonQ37+3+OqJE5eNPvz57Qa+2bLwDqeffLbgIsOyyUejXdVt6+isCyMQ1yzJfhKfTK/USUHJSgMFYLohsrfuHbiJUFBHQi7pYNUaL58BGVZu/fVmwce/VhfdHKwCkIblCGPy46z1VWLBDqRlq/AYVxPCjorfaGg7BXzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737390938; c=relaxed/simple;
	bh=qqrmxJmOHSUAkdGHpGJG3jmnpYcM5OK5iRkr2wR31f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=facYLV/NhH3bq64q6S9qt12vLEIRyxm4wWWOJhG5QFeRDIq+KXUXfnrb2rUIXxYv0VYHWNbtuzuxeRbP6eSNFDBQDA8CpNBuTxWjfyUxH8VCeC/4w4OHtI+K0fVnt9GzSVHyMrrHUKzBugoX9OFxfRdmJZFHD/PQ7gwTqlBv7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=LwtPjWOb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CcWoiBYoEMqYuATaF1lrf5SJ9QM8f54MsZl7GkMl10E=; b=LwtPjWOb42oC2tATVXdn10NbbN
	Nk/6WG0jyLr0MoiiMZuz+t26izOejjIZLEaQkcu/QjvDjfAVmzvOebpAp1p/x+fKThFxdvLqpxdns
	R9rlfufB9D+g4xlb+daKwzE8Pfud+Lg3DNqib0A1R7cftf9H+2pf1r6Cn5NuSlgqsvcU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZukE-006O0j-Tf; Mon, 20 Jan 2025 17:35:22 +0100
Date: Mon, 20 Jan 2025 17:35:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org
Subject: Re: [PATCH v2] net: phy: Handle both led@0 and led subnode name for
 single-LED PHYs
Message-ID: <f2a4d89c-d633-4b18-bc0e-2994a0f76b9e@lunn.ch>
References: <20250120090256.54382-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120090256.54382-1-marex@denx.de>

On Mon, Jan 20, 2025 at 10:02:46AM +0100, Marek Vasut wrote:
> In case a PHY supports only one LED in total, like ADIN1300, and this LED
> is described in DT, it is currently necessary to include unit address in
> the LED node name and the address-cells have to be set to 1:
> 
> leds {
>   #address-cells = <1>;
>   ...
>   led@0 {
>     reg = <0>;
>     ...
>   };
> };
> 
> For a single LED PHY, this should not be necessary and plain 'led' node
> without unit should be acceptable as well:
> 
> leds {
>   ...
>   led {
>     ...
>   };
> };

So how do other subsystems handle this? SPI with only a single chip
select line? Standalone LED controllers with a single LED? A PWM with
a single output?

>  drivers/net/phy/phy_device.c | 15 +++++++++++++--

What about the device tree binding? Does it already have the reg
property as optional?

	Andrew

