Return-Path: <linux-leds+bounces-4416-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC1A7CBB4
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 21:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B55C1784B5
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 19:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D07A1A9B23;
	Sat,  5 Apr 2025 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bvJ1+0h+"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5CD2556E;
	Sat,  5 Apr 2025 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882323; cv=none; b=QH8dhSDXGrSrMVmtIkbx1bL8t1hG3D5g2/1TEWKZiZ9nuZnI3NjxaekG1YrCE9awRQcwRu88U2R13kRHPfgMJ143zZg3puwiXD6IaYN1G0yZ7T4EW1CoJwwzHmD1f+WEO7oCoQvS6vW2A3zcu6+q9vfjNBs7AW4+gXJx8/ErYiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882323; c=relaxed/simple;
	bh=iCkXQLl2AeMQ163QzwK+67auGpNYL3LE/p1KEupkDmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcw+ZDp1jNbQuuxajJe7hk6iPAFvhor5+r8kTiuDWimEzfN8zwgU1m7DBpnoR8nP/7h+GQFAxE3XftgQqCNw0dfDVswRZ/zJBxKzTuaT4PICYGugsoExDsAWdbu3ApJYv3zCAhu4ebV+yoNv30mVJDAtlhAatksYG5UCDhZRfsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bvJ1+0h+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rD24ROOlKYnLzGW6Wv6olDZU8vcz7uYQ6z7dsj6jbMs=; b=bvJ1+0h+YCOt6pmqt7+UVGBIKw
	EPFsHXUhuTsvXJcgWNmUGCHOIJEQo5ryCYH8OnqNjAc1IhkwADJQKEPGNM+UuYEbFMecUYtrtTRKc
	KP6pW7ipwrtGHQaPPzWFBioLx6nfoCBice55rdWi5P+n/3gQgoa8qfrj+LAe9SsgfBDk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u19Rw-0087wx-5e; Sat, 05 Apr 2025 21:45:04 +0200
Date: Sat, 5 Apr 2025 21:45:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: lxu@maxlinear.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, lee@kernel.org,
	linux-leds@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next,v2 1/2] net: phy: add LED dimming support
Message-ID: <11bb4bcf-c3e6-4ab0-b61c-ef7f37dd695c@lunn.ch>
References: <20250405190954.703860-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405190954.703860-1-olek2@wp.pl>

On Sat, Apr 05, 2025 at 09:09:53PM +0200, Aleksander Jan Bajkowski wrote:
> Some PHYs support LED dimming. The use case is a router that dims LEDs
> at night. PHYs from different manufacturers support a different number of
> brightness levels, so it was necessary to extend the API with the
> led_max_brightness() function. If this function is omitted, a default
> value is used, assuming that only two levels are supported.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>

The merge window is still open at the moment, so you will need to
repost next week.


> ---
>  drivers/net/phy/phy_device.c | 7 ++++++-
>  include/linux/phy.h          | 7 +++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 675fbd225378..4011ececca70 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -3106,7 +3106,12 @@ static int of_phy_led(struct phy_device *phydev,
>  
>  	cdev->hw_control_get_device = phy_led_hw_control_get_device;
>  #endif
> -	cdev->max_brightness = 1;
> +	if (phydev->drv->led_max_brightness)
> +		cdev->max_brightness =
> +			phydev->drv->led_max_brightness(phydev, index);
> +	else
> +		cdev->max_brightness = 1;

> +	/**
> +	 * @led_max_brightness: Maximum number of brightness levels
> +	 * supported by hardware. When only two levels are supported
> +	 * i.e. LED_ON and LED_OFF the function can be omitted.
> +	 */
> +	int (*led_max_brightness)(struct phy_device *dev, u8 index);

We might want to consider types here. led_classdev->max_brightness is
an unsigned int. Your callback returns int, so it could include
-EOPNOTSUPP, -EINVAL, -ENODEV etc. There is no check for an error
code, so max_brightness is going to end up ~ 2^32, and not work very
well.

	Andrew

