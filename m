Return-Path: <linux-leds+bounces-2939-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558298E6BA
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 01:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EB16284C88
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2024 23:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3E319E98C;
	Wed,  2 Oct 2024 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="468asTgg"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDD19E97A;
	Wed,  2 Oct 2024 23:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911334; cv=none; b=nQMcWSR8G+ENxeG6BSJHV4uL7l0LMzSKCnjLFve5vhEBAbip1I+0XByAxpS71pxlGnykHuuze83PoxepFsyLYgpMhoh359VxTZx6soPGq5YTMJZrcLYVpD3L13KuxWi+B979oY4/FJc+k9EhORMZ4srVJvaMDQJMCz2GmpXcZlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911334; c=relaxed/simple;
	bh=cCMZ2QjeHG6c6qQZ3MB0RnptwXAo5lG+5BZQc/rX4+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQiB6Z94ygPxFBINBkT4t7hG4Z5D6ku7YZCcEGRBt89B3FLL0MilI2O+ekr8yf5Q3LBg6shMPexH9lQJ+OKU7kHXMq4q9hcrn02wysm58K+S87yXmStEufAM6TRw9cDxT75qjaoPaVyCHMnJNfYz2sfVmTlOG4x3USAUeSRPjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=468asTgg; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ogYWyS7RAZoXViNTRdYZLASKV4THtoT8ZMkRewJJ5F4=; b=468asTggrzrNPNoHkwN3Ca69HC
	DRz4GLWoi6pRBDQP83dTTrKSiOQSxW8q6pB2tfjFCMb6GwW472ZojnW4D+LPzlnnew8GbPOIN0VWv
	MFwarHKq5lsOfZCw/94UonjTD3u9eEEqxfJqxhLlSeX8SsM3BmLM9BPAAsYi5rNvEFws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sw8fK-008u2t-3v; Thu, 03 Oct 2024 01:21:54 +0200
Date: Thu, 3 Oct 2024 01:21:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
	kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: Check offload ability on
 interface up
Message-ID: <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001024731.140069-1-marex@denx.de>

On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
> The trigger_data->hw_control indicates whether the LED is controlled by HW
> offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
> currently called only from netdev_led_attr_store(), i.e. when writing any
> sysfs attribute of the netdev trigger instance associated with a PHY LED.
> 
> The can_hw_control() calls validate_net_dev() which internally calls
> led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
> for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
> is not attached.
> 
> At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
> only when the interface is brought up and is detached again when the
> interface is brought down. In case e.g. udev rules configure the netdev
> LED trigger sysfs attributes before the interface is brought up, then when
> the interface is brought up, the LEDs are not blinking.
> 
> This is because trigger_data->hw_control = can_hw_control() was called
> when udev wrote the sysfs attribute files, before the interface was up,
> so can_hw_control() resp. validate_net_dev() returned false, and the
> trigger_data->hw_control = can_hw_control() was never called again to
> update the trigger_data->hw_control content and let the offload take
> over the LED blinking.
> 
> Call data->hw_control = can_hw_control() from netdev_trig_notify() to
> update the offload capability of the LED when the UP notification arrives.
> This makes the LEDs blink after the interface is brought up.

Have you run this code with lockdep enabled? There have been some
deadlocks, or potential deadlocks in this area.

> 
> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
> in place, boot the machine with cable plugged in, and the LEDs won't work
> without this patch once the interface is brought up, even if they should:
> "
> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
> "

Nice use of udev. I had not thought about using it for this.

	Andrew

