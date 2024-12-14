Return-Path: <linux-leds+bounces-3605-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5269F1FA4
	for <lists+linux-leds@lfdr.de>; Sat, 14 Dec 2024 16:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B851886473
	for <lists+linux-leds@lfdr.de>; Sat, 14 Dec 2024 15:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3798F192B75;
	Sat, 14 Dec 2024 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="h+8KQAhX"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2918AE2;
	Sat, 14 Dec 2024 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734189669; cv=none; b=d7aWWiKcXU/U3p7zUX8rKf/WszSMuYPy+zvA3pofiXTgGAwkhDXhwDxJT9CThR4DnWSV49S9nycJHSOAjrU1gcjhitM6YeZWbTk1yEtGVYxA7bL4E3KK2lLEjY+fTw/vBjtgwLnaLmNwYnA4qKz4R1gdcRbge2GftTgpQabMpDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734189669; c=relaxed/simple;
	bh=iEJOYP0YK1Jgp0Yu6eLvQuXjOxfIhWXhHyf2zvpnxz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJ7KMuVyy/5JTSPliW76n3F4S0f2XSIc0rHA3QfPVm+3syb9sIPk/oYdgRXFM7HOh9ZSCuU9TVlNbtzUbwvLI5lJs91zutaziQkvG44RVyxd2Xj0Mb86cqw7YBH1VRBFEmhMVhsqTWsAm0xsb2yDoJOoLfcDimDPeHNPmKdTOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=h+8KQAhX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eC7p2BcNvf10KUA1ibKd+voMFY/6hc63cpdb/UAGvB8=; b=h+8KQAhXXR7yPFgzBI2B7fUwVN
	LaLWN4UtcIE80mbO5hbxUSv2K6D5rN6NTvuL82Sb94O1gzs3WHELTTkE0/OK+GOMEGbkdGQYl4xeP
	i6xR1H4PoszhE0xrTFrSXYxqSewU/GIrN/4XrefeDaqZXOSVGINHnXi2nZA3zNdXgmq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tMTwX-000S73-BT; Sat, 14 Dec 2024 16:20:33 +0100
Date: Sat, 14 Dec 2024 16:20:33 +0100
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
Message-ID: <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
 <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>

On Fri, Dec 13, 2024 at 11:15:09PM +0100, Marek Vasut wrote:
> On 10/3/24 2:06 PM, Andrew Lunn wrote:
> > On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
> > > The trigger_data->hw_control indicates whether the LED is controlled by HW
> > > offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
> > > currently called only from netdev_led_attr_store(), i.e. when writing any
> > > sysfs attribute of the netdev trigger instance associated with a PHY LED.
> > > 
> > > The can_hw_control() calls validate_net_dev() which internally calls
> > > led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
> > > for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
> > > is not attached.
> > > 
> > > At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
> > > only when the interface is brought up and is detached again when the
> > > interface is brought down. In case e.g. udev rules configure the netdev
> > > LED trigger sysfs attributes before the interface is brought up, then when
> > > the interface is brought up, the LEDs are not blinking.
> > > 
> > > This is because trigger_data->hw_control = can_hw_control() was called
> > > when udev wrote the sysfs attribute files, before the interface was up,
> > > so can_hw_control() resp. validate_net_dev() returned false, and the
> > > trigger_data->hw_control = can_hw_control() was never called again to
> > > update the trigger_data->hw_control content and let the offload take
> > > over the LED blinking.
> > > 
> > > Call data->hw_control = can_hw_control() from netdev_trig_notify() to
> > > update the offload capability of the LED when the UP notification arrives.
> > > This makes the LEDs blink after the interface is brought up.
> > > 
> > > On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
> > > in place, boot the machine with cable plugged in, and the LEDs won't work
> > > without this patch once the interface is brought up, even if they should:
> > > "
> > > ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
> > > ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
> > > "
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Is there anything blocking this patch from being picked up ?

I think this should be going via the LED Maintainer. Please check with
Lee.

	Andrew

