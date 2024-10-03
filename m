Return-Path: <linux-leds+bounces-2946-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A100A98EEBA
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 14:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 658A0283982
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B61615666C;
	Thu,  3 Oct 2024 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HS33maG6"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E8154445;
	Thu,  3 Oct 2024 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727957190; cv=none; b=tNZRJxS4egUk8N3IF8p3DUZknCLePfwVlc/2RrXPjqPNl7qC5GfMBJ9YbsFXfS74ZRlnNh3VtHrYtXZDk7V5oixZWvJLQYthARQJoZ4fBJfmW1y07QIIqQc7CFuvHLFlyfd3JWA0la3gM7R/xL8/fvT2JFyThGmmLWxoflVUxLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727957190; c=relaxed/simple;
	bh=XJp2gRbtQBSU2qpdYevNzDMb0X1piejhdHLsLP1/q4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKLNpes1xY1OieAOzP0eD3YNkjr9MlbTKbqtCZOeUxiqDZhWwpZKZHO1adnQzfL5HUOaC26mnngfO1vCrdZPTYi56WVUVCFQJdv9gko5HErUcc2ZuIT2uQWADPTbh6jyw0ISIAjS28LUNFmHyjfOt8JCjQVGvHQzRQ62LaSa0DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HS33maG6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mR8UnRqonlI/t9zBryRd8/lw16I97gIXI4OxAYEJFhs=; b=HS33maG6vcpf0F7IKSzWKvQEzg
	FV3DAc3A4aJYGLdcNK6o4R7Xhz0hNQmBsUgIA1hLKCStcqv/rF0j6LFyBr4VEa+hfy1P7C7CcB5iQ
	UcP/4PcvMyJ8w/3jhvrTtSE0FT9N3ue6WkjdMhfLKHqTfp/oIDh1Nkax4C98Wr4NqjLU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1swKb3-008wWu-7V; Thu, 03 Oct 2024 14:06:17 +0200
Date: Thu, 3 Oct 2024 14:06:17 +0200
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
Message-ID: <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
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
> 
> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
> in place, boot the machine with cable plugged in, and the LEDs won't work
> without this patch once the interface is brought up, even if they should:
> "
> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

