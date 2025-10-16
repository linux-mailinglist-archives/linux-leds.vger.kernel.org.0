Return-Path: <linux-leds+bounces-5795-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A8BE3A29
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 15:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B98D359084
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 13:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F47D338F4F;
	Thu, 16 Oct 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kI1uNa3X"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916743376BD;
	Thu, 16 Oct 2025 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760620479; cv=none; b=beTNO5RdmrGtwDrgIhwm/EM+7e7F2vKSdbk8ec5IuOYNyoxJrejqNBpo3yNdLtJiqz5b+FkG5l84KwDMVzSCInB6AFVfOe+X7WMiHwMkfm9+inUx/r30g30XPxQuu32MA6j1rSaeHrSF6mHFmmI52H1FsrYiT/LnsUGGZiyaCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760620479; c=relaxed/simple;
	bh=0hceUVneaY8Irp84xmAciaqEfG0hdxDM+GAgBLkfvQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVvxEOww5mILV+2I4SZfLswNCw5vjEbLWCaE4u5Pl2qYyiILgHwFCU3RPSbJXc2h+sFeJHluaGuFPTGHv6mf2QH+S57YORfRdIC0AEM5IGmU64DFh4bgB2tsFGZhzaOS75YQaZ5/zbSS4Dgo7WLt8P3hFFKAu2Ot7/PxLvqTcrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kI1uNa3X; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=EhlaAVgLEEnVceBRSzhpc9DTMGiyF9dDngNrkEa/edQ=; b=kI
	1uNa3XODQ9Q1AW3N7qqZTZj037pt0yVuL/p7n+T4zh6bYn9oOabIZPDxnAhJsuNKUkdbvFjToa9Ia
	HhPwhUWvFSYeLyH7XgaJTHeIoD+miL0BObedvvhC+ZQidX02ZfKbKfzbLhNzJIxIO2bbg8rgDCLjM
	4MMsSnprOT4t0OU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9NoQ-00B9Yr-Am; Thu, 16 Oct 2025 15:14:34 +0200
Date: Thu, 16 Oct 2025 15:14:34 +0200
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
Message-ID: <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
References: <20210601005155.27997-1-kabel@kernel.org>
 <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>

> > Marek Behún (10):
> >   leds: trigger: netdev: don't explicitly zero kzalloced data
> >   leds: trigger: add API for HW offloading of triggers
> >   leds: trigger: netdev: move trigger data structure to global include
> >     dir
> >   leds: trigger: netdev: support HW offloading
> >   leds: trigger: netdev: change spinlock to mutex
> >   leds: core: inform trigger that it's deactivation is due to LED
> >     removal
> >   leds: turris-omnia: refactor sw mode setting code into separate
> >     function
> >   leds: turris-omnia: refactor brightness setting function
> >   leds: turris-omnia: initialize each multicolor LED to white color
> >   leds: turris-omnia: support offloading netdev trigger for WAN LED
> >
> Do you plan to progress with the above series anytime soon? If not I
> want to give this patch [0] again a respin.

What features are you missing from the current kernel code, which this
series adds?

	Andrew

