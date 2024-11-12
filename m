Return-Path: <linux-leds+bounces-3394-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904C9C5126
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 09:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E749281E58
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 08:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EFB20C004;
	Tue, 12 Nov 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVc1DM/E"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D5320B808;
	Tue, 12 Nov 2024 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731401349; cv=none; b=dyvUmWShUbyQ420/r5QPz4J0QFIMPVW0hMpR3Bx/yFqgpw/8amw93S1AbXdVzxTtkVwaZBd+Svh81DvIDV0kjBeC++v/Vlm2Yt+XpbH4hRwvlTNGYCyiO2BO1WKRD9JH6MsYNDAAcYyIr8gNfwX4tgDqB9qSnYH7lw5TLi+O5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731401349; c=relaxed/simple;
	bh=u538irlfig+WMEwsMmlEFU1cqwsNMdddm/USlMeIkBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWV0gbqDKE72mVbDWI4jCg0NZxbd60TW3LopDHdlwNRH8N2Rw3P1l3bfoTIcfnNN/bFYKVZvmXa4Mt/x05X9/fSQ+v/gP1YFVpefpWMdSTcUN8s4k8zCzUyQq9tonf9umvf9q46W/n2LeSZJ4P+6uCcELb/duCBFSUTX8NkqbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVc1DM/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CB1C4CECD;
	Tue, 12 Nov 2024 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731401348;
	bh=u538irlfig+WMEwsMmlEFU1cqwsNMdddm/USlMeIkBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVc1DM/EPVB2wQu92rKsU0+HxLdCnE9chDFn1H3G7+zDIiSemycjucvtl2EDcQras
	 gHfeFjstY9cSbcWjSwrIQIfXxx8vG18GhCzTF0G5uK0SDIAm0R4YINfELjggpiQ9WY
	 uVgD2Q+Nv/o4l7rZ4vd72Vtp/WjWH3tTqgV2SqcazDZu2QGNZdOimcLwACDl5IlEvK
	 8oEzTDup0f5DsbOERWQUgsEs/7SCCDwDoNvjXzpkDgDpWA6UoiW54thGjAlP3t3ggc
	 O9m5ebyLbRtEpbXTduTQqMr/6uj+fRsx8aYLG8hTV9aD4XlYMCC8I8ODxvfqZf79Ca
	 RPq2z7oyX/+xg==
Date: Tue, 12 Nov 2024 09:49:03 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Pavel Machek <pavel@ucw.cz>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, 
	linux-leds@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add LED mode behavior/select properties and handle
Message-ID: <fuk5stahnpinahhyixdgeepchucvfbha3ikqagewxhxlh5337x@zuo46w4enzp4>
References: <20201209140501.17415-1-i.mikhaylov@yadro.com>
 <20201216224118.GA31740@amd>
 <ZzMPr3TlEErExRqr@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzMPr3TlEErExRqr@FUE-ALEWI-WINX>

On Tue, Nov 12, 2024 at 09:19:59AM +0100, Alexander Wilhelm wrote:
> Am Wed, Dec 16, 2020 at 11:41:19PM +0100 schrieb Pavel Machek:
> > Hi!
> > 
> > > In KSZ9131 PHY it is possible to control LEDs blink behavior via
> > > LED mode behavior and select registers. Add DTS properties plus handles
> > > of them inside micrel PHY driver.
> > > 
> > > I've some concerns about passing raw register values into LED mode
> > > select and behavior. It can be passed via array like in microchip
> > > driver(Documentation/devicetree/bindings/net/microchip,lan78xx.txt).
> > > There is the problem in this particular driver - there is a lot of other PHYs
> > > and led mode behavior/select states may intersect, that's the reason why
> > > I did it this way. Is there any good ways to make it look more
> > > properly?
> > 
> > Lets... not do this?
> > 
> > We have a LED subsystem which should probably control the LEDs... so
> > user can specify behaviours at run-time, instead of them being
> > hard-coded in the device tree.
> > 
> > Plus, LED subsystem will use same interface for networks LEDs as for
> > ... other LEDs.
> 
> Hi Pavel,
> 
> I would also like to control the LEDs via subsystem interface, but how I can
> configure those to be visible in 'sys/class/leds'? My LEDs are connected
> directly to KSZ9131RNX phy device and not to any of GPIO available on the CPU.
> Am I missing some DTS entries therefore?

The KSZ9131RNX driver needs to implement some LED methods, like
.led_brightness_set(), .led_blink_set(), .led_hw_is_supported(),
.led_hw_control_set(), .led_hw_control_get().

Look for example at marvell.c driver, or broadcom.c.

Regarding DTS, look at linux/arch/arm/boot/dts/marvell/armada-370-rd.dts.
The ethernet-phy@0 node has leds subnode, describing the LEDs.

Marek

