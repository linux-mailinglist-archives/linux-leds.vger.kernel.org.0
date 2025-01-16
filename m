Return-Path: <linux-leds+bounces-3780-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3BA13B13
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2025 14:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D65D164F07
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2025 13:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32311DE4EC;
	Thu, 16 Jan 2025 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vFExuecJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201FA156F57;
	Thu, 16 Jan 2025 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035227; cv=none; b=dWcRNsE/mr6GHHZSWBjod7LXH/YwEjk9bvJYA3n2VLeQyrsRJgqIpd7PgLPlsLc7MvDSwFUVM9eep+uDDzitEOQlnLBM8oGevXZwA0Z1SSwcCLrArOoYIQfOcxNQ7I7UwEiHCy+yPcSYdXxuVQPUfVqDgI+/I3oz+Xz6szpl58o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035227; c=relaxed/simple;
	bh=KAQ8G7WlTHX/Nk9uGZR4k6DBlTcFTNqCI1pNTt3zeaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFcvO/dU65Oo8bJTs9AQmbBjobrGA1Ch66uY169slvPgjcft0gwTvIpPybwuGRiKG3xXfz1L2Jza7IhIaPwYmFMxwS9SoP3p4/jpK/G7q+sjIRaMuMFWlOpKsPpFTBV8h2VaiiuUmKR58S5r+Q8PorGK1PdJIH3QUgtrmwPJlHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vFExuecJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rgxuZj06pQ0SDk46r0uUavHNLOkEktuciIBsgcbiaww=; b=vFExuecJmBWoFHCYiLLZH+iI7x
	2WgzL4KFSni9KdjmZi2A2AeskWrXz9wXXwvWb8PDYAJILVTUyEe8UNl9dMGPv34i19tXjRAGpjjra
	bdfgVEVfK+FZ73xzcvHfUpdMQ/DZqO82YhzasgXyyif8yxZO9omUh2tnHzdkuDfKmm0s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tYQD7-0058bx-Si; Thu, 16 Jan 2025 14:47:01 +0100
Date: Thu, 16 Jan 2025 14:47:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger: netdev: Introduce OF mode
 configuration using netdev-trigger-mode property
Message-ID: <78e19c21-589f-4a15-8878-d2f5bb3017ef@lunn.ch>
References: <20250113002346.297481-1-marex@denx.de>
 <20250113002346.297481-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113002346.297481-2-marex@denx.de>

> It is not possible to immediately configure the LED mode, because the
> interface to which the PHY and the LED is connected to might not be
> attached to the PHY yet. The netdev_trig_notify() is called when the
> PHY got attached to interface, extend netdev_trig_notify() to detect
> the condition where the LED does have netdev trigger configured in DT
> but the mode was not yet configured and configure the baseline mode
> from the notifier. This can reuse most of set_device_name() except for
> the rtnl_lock() which cannot be claimed in the notifier, so split the
> relevant core code into set_device_name_locked() and call only the core
> code.

Why cannot it be claimed? Because it has already been claimed? If so,
please add an ASSERT_RTNL() in the locked function to document
this. Or is there a lock inversion here?

> -static int set_device_name(struct led_netdev_data *trigger_data,
> -			   const char *name, size_t size)
> +static void set_device_name_locked(struct led_netdev_data *trigger_data,
> +				  const char *name, size_t size)
>  {
> -	if (size >= IFNAMSIZ)
> -		return -EINVAL;
> -

The code you cannot see in the context does:

        memcpy(trigger_data->device_name, name, size);

If we don't have this size check, is it possible to overrun the
buffer?

It might be better to split this patch into two, one doing the
refactoring of this function, and include an explanation of the
locking and why it is safe not to include this size check.

	Andrew

