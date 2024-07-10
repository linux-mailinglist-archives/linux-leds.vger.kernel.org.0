Return-Path: <linux-leds+bounces-2242-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7CD92D47B
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 16:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A3CBB224F3
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 14:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333EB193462;
	Wed, 10 Jul 2024 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3NMlPHPE"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC6BE4E;
	Wed, 10 Jul 2024 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622801; cv=none; b=dQgPsWxTI0HBLJQv5m5g2wj8zbYAZvEnsBZJF+/oAENFn4aw8X01eIhHfsI64A2syE6EMnLQSMLyX2uSPWFR2uUGiAAbU4dvHDl96FaJIFOsIwC4VVUUP80v+u4eZm51m/4GWdTSVcUsm9vXgotDjUqTnTq2F5LXLj54gMbxt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622801; c=relaxed/simple;
	bh=UcQ+IrpD+nz8oe5EfdMIcNxhG8gX1w/M8qt/8+Ibe6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGqEQ07e6yQib5H/8uaFnzHFBUqH66XKw0KuznRaNui2GXxsqgrKzS4JFXBXvfDP/lyIVZsTpth0bDtv+SIBLYEVcD8kHZ9GqZ3OfLv7+AhEWKI849zFN8c4sRBQ9u9pEc3MbGRWH1j+paMbV1H+tuHj1UVMYLjE2DSXwMfekHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3NMlPHPE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SHF3+gwvR/5mzTF+Xdx6aTMxYpW7ExwElJi09pIgIco=; b=3NMlPHPExFMOH/7+9F2ABvRmrv
	/KrvBEbcRUMmPCrpKt753QibYFORq9rEp3Ihn/4ZwIfh08fmTP0a+WJRwAbI0SBx1uqrhREiz/smZ
	gpeU4X6EV2or83/L1j2KzcaY6iWBouuvX0L5O+CZ1JcaYb9qDqqN8aknYr6mmqj1pD8k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sRYaP-002EWG-P0; Wed, 10 Jul 2024 16:46:25 +0200
Date: Wed, 10 Jul 2024 16:46:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Li Zetao <lizetao1@huawei.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 net-next] leds: trigger: netdev: Add support for
 tx_err and rx_err notification with LEDs
Message-ID: <702949fc-96af-4202-a404-c8678a99fab4@lunn.ch>
References: <20240710100651.4059887-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710100651.4059887-1-lukma@denx.de>

On Wed, Jul 10, 2024 at 12:06:51PM +0200, Lukasz Majewski wrote:
> This patch provides support for enabling blinking of LEDs when RX or TX
> errors are detected.
> 
> Approach taken in this patch is similar to one for TX or RX data
> transmission indication (i.e. TRIGGER_NETDEV_TX/RX attribute).
> 
> One can inspect transmission errors with:
> ip -s link show eth0
> 
> Example LED configuration:
> cd /sys/devices/platform/amba_pl@0/a001a000.leds/leds/
> echo netdev > mode:blue/trigger && \
> echo eth0 > mode:blue/device_name && \
> echo 1 > mode:blue/tx_err
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

