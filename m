Return-Path: <linux-leds+bounces-5800-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E34BE5318
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 21:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6BA44E1B77
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 19:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CE32877D4;
	Thu, 16 Oct 2025 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="F6MxgT1P"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E2F2882CF;
	Thu, 16 Oct 2025 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760641882; cv=none; b=BscDaDM5ESc2SARWk0MAQ/FKuGUcbXFI74AKwtM/YnDUs0Bu69k8yGIHCs87AHqSHNITUuMdEqrZGoWuOlkWnT3tY+XXX/1OeE9uOSH3TQJbPfbw0OaLtcKLrHAUT3jhwumkGmTUdGOJPi75yN/VlVsRBQZ66yzl4H4uDWy7i6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760641882; c=relaxed/simple;
	bh=Kpmyv3Tv62MdWYPZiBCYni86OvTfWF0aCytZpAdko0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owjhiwccTuXw1oLEcUG19+JFopFfJTXivLTP8lJSnd+MeHhgG7Mr7Dslhzo8ZxpmrrYoWdcpiNzXF7Zv6Ww4OX/bCiXKJXpCL81o2Zzcjmchs8fnehs4++PtJskqHuYltl7+4WGK5SGzeo/8P27/tDAPL/Da1ZZXK+bH6phNx2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=F6MxgT1P; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=oVHJo5eFnWVELSPqB/MrO2ee7+O6J+manXe99W9VUME=; b=F6
	MxgT1PfjkrFXENmfT6Hqia08MbAxRN7GjzE/P4+Yexg4VM+pOv1OVA8HG2LyoAD+WQO5i4eggcAE3
	CEM4/xwhPzg88aedaB0IANeNisN0Hm03QDYsRXsOzH5WvuHpx7kaDXhln3cz+Mmoxo+0CEgzMDWfE
	VITKQKEYDf1z4eA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9TNV-00BCM5-Ov; Thu, 16 Oct 2025 21:11:09 +0200
Date: Thu, 16 Oct 2025 21:11:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
Message-ID: <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
References: <20210601005155.27997-1-kabel@kernel.org>
 <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
 <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>

On Thu, Oct 16, 2025 at 07:53:17PM +0100, Lad, Prabhakar wrote:
> Hi Andrew,
> 
> On Thu, Oct 16, 2025 at 2:14 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > > Marek Behún (10):
> > > >   leds: trigger: netdev: don't explicitly zero kzalloced data
> > > >   leds: trigger: add API for HW offloading of triggers
> > > >   leds: trigger: netdev: move trigger data structure to global include
> > > >     dir
> > > >   leds: trigger: netdev: support HW offloading
> > > >   leds: trigger: netdev: change spinlock to mutex
> > > >   leds: core: inform trigger that it's deactivation is due to LED
> > > >     removal
> > > >   leds: turris-omnia: refactor sw mode setting code into separate
> > > >     function
> > > >   leds: turris-omnia: refactor brightness setting function
> > > >   leds: turris-omnia: initialize each multicolor LED to white color
> > > >   leds: turris-omnia: support offloading netdev trigger for WAN LED
> > > >
> > > Do you plan to progress with the above series anytime soon? If not I
> > > want to give this patch [0] again a respin.
> >
> > What features are you missing from the current kernel code, which this
> > series adds?
> >
> I’m working on a platform that uses the VSC8541 PHY. On this platform,
> LED0 and LED1 are connected to the external connector, and LED1 is
> also connected to the Ethernet switch to indicate the PHY link status.
> As a result, whenever there is link activity, the PHY link status
> signal to the switch toggles, causing the switch to incorrectly detect
> the link as going up and down.

So you think the current /sys/class/leds code is not sufficient. You
can use it from udev etc, to make the LED indicate link, but then
userspace could change it to something else. I _think_ only root can
use /sys/class/leds to change the function of the LED, so it is not
too bad as is? Or do you really want to make the configuration read
only?

	Andrew


