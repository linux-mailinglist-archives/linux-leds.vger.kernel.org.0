Return-Path: <linux-leds+bounces-3612-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC309F2D16
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 10:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659CF1883B72
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EACF200B8A;
	Mon, 16 Dec 2024 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqcqrCu4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CED2AF03;
	Mon, 16 Dec 2024 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734341732; cv=none; b=HUt7kHKPhGA/22vfLNCLJn+Q1Iei1c6z3oZ5m/mLN9SPLDyRfsgbLNt9de1gNSMCtL+FTtTfp3FKO5ludqyDLMWybw+wBzYkomf55GyoyBrcDGn9y0nJKGg/Okw58CGWXSCBT92MV+OX5GOEQyQd8XePnT/UKQz38QJWk7ENkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734341732; c=relaxed/simple;
	bh=MJAI/S1eHdraNTqHVjewdE9v94dBXIYQiOVlxPlvNrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r91qCB+UKYHDzER7aFv8e3sefnRA0by1pmYzjynKHjEBF/oP3MkMZ7QsPOW7fzTWVAiS1DkQ92OqrMA3uVyOKmKknxPq8ss9XNG/FCQ0H1J4IepRHiU04XQS3m5R63BdjgOY33lcHx+5w7fo6GqmbEvkZXdtKSuGzNjNOCjQV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqcqrCu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F62DC4CED3;
	Mon, 16 Dec 2024 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734341730;
	bh=MJAI/S1eHdraNTqHVjewdE9v94dBXIYQiOVlxPlvNrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqcqrCu4hKubVHrP5OFmAQeSv5jXAjEVkgLWRNxM1HyH8n4lXGrkEwQ/qd8YU1neZ
	 MOByLXyEzw8WoCKYmse+m43YN080jJbWoOpO89l+krT+QIwYKa2XYrJoPjD62YtpOC
	 4BWDbWIxAZWJ+ZGoUCnHP9dl14leMa9Aj2pjz2dYZRJQ9HCfFRP8OtlAT/rvXOWKh8
	 L284uiICX4cxf/zTLr77F5fZeTGB8LBOV1JohATH4MKwlx8WLXBQ7XP5eWHWkkPZTv
	 qMhMN65zPHMjTn1V/1GxK6jP//1OUPrfz58yrDMUSa8WsQk+yJPrmScGHD0NgaJ7Rs
	 p4fGlGKsDjkLQ==
Date: Mon, 16 Dec 2024 09:35:25 +0000
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
	kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: netdev: Check offload ability on
 interface up
Message-ID: <20241216093525.GG2418536@google.com>
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
 <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
 <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>

On Sat, 14 Dec 2024, Andrew Lunn wrote:

> On Fri, Dec 13, 2024 at 11:15:09PM +0100, Marek Vasut wrote:
> > On 10/3/24 2:06 PM, Andrew Lunn wrote:
> > > On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
> > > > The trigger_data->hw_control indicates whether the LED is controlled by HW
> > > > offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
> > > > currently called only from netdev_led_attr_store(), i.e. when writing any
> > > > sysfs attribute of the netdev trigger instance associated with a PHY LED.
> > > > 
> > > > The can_hw_control() calls validate_net_dev() which internally calls
> > > > led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
> > > > for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
> > > > is not attached.
> > > > 
> > > > At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
> > > > only when the interface is brought up and is detached again when the
> > > > interface is brought down. In case e.g. udev rules configure the netdev
> > > > LED trigger sysfs attributes before the interface is brought up, then when
> > > > the interface is brought up, the LEDs are not blinking.
> > > > 
> > > > This is because trigger_data->hw_control = can_hw_control() was called
> > > > when udev wrote the sysfs attribute files, before the interface was up,
> > > > so can_hw_control() resp. validate_net_dev() returned false, and the
> > > > trigger_data->hw_control = can_hw_control() was never called again to
> > > > update the trigger_data->hw_control content and let the offload take
> > > > over the LED blinking.
> > > > 
> > > > Call data->hw_control = can_hw_control() from netdev_trig_notify() to
> > > > update the offload capability of the LED when the UP notification arrives.
> > > > This makes the LEDs blink after the interface is brought up.
> > > > 
> > > > On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
> > > > in place, boot the machine with cable plugged in, and the LEDs won't work
> > > > without this patch once the interface is brought up, even if they should:
> > > > "
> > > > ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
> > > > ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
> > > > "
> > > > 
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > 
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Is there anything blocking this patch from being picked up ?
> 
> I think this should be going via the LED Maintainer. Please check with

It looked like the conversation was continuing.

If you have everything tied up, rather than relying on maintainers to
keep up with the branching conversations of 100's of patch-sets, it's
best to collect the tags you have and submit a [RESEND].

-- 
Lee Jones [李琼斯]

