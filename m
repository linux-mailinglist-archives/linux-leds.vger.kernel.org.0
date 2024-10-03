Return-Path: <linux-leds+bounces-2945-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082D98EEB7
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 14:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43A51F2273A
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 12:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9337214F9F8;
	Thu,  3 Oct 2024 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uMu7pMwx"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176817579;
	Thu,  3 Oct 2024 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727957138; cv=none; b=eF5A/eC+d6WrL6pnkdgUXtzCVFYVg4PJzWCsXK6fgeGxZjg1wQ9HpfM7J+A1Wkf6KkTmcu+0Q1ALi/f8VfTcXwhP6Gd0Zdb5BU6nkF11QZYsAUcaUDn/ItbFoRzrX9oREMPJylW6YLZN/QUpewM7etwOoLVx9+S4Dguz0xu1APg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727957138; c=relaxed/simple;
	bh=rdL9HgIzyKrA4+YtGWD+nzM38E6V4z7+LYZu6fiWnJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLzzP2K8RSSnV557pzQW8PZmrV2z81HgCcVvgUSGM0HiIupqmsk0M6VqfmZ2sLySOsN+DhPvGfxmFcGDGNUkVnYyUx3RCi2nIOtIlHiZP8ShS/FydafFkC0YNYCrio6as35bZ3oqDue4Ww15hpRz8bTfrdWCuKgmnQVd2lCjaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uMu7pMwx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ywp8+VbD741GfBOGthIuAH6MqIGxO+3sHTl82q7Wcco=; b=uMu7pMwxdY6KPL7wmrrjGHvWyB
	8JuKegoLWB4c5n4Wfx/EmEtqSrfUEauxj7TiycArOWrq768ErX0Kd5S7AYVdpqIH3C/JdUWBR2Mqd
	0UEzYXP23/uIU3iQQ/hrUU+AKHWy9OwxEIvvbCdoUmWtSvOMWicSABCtt4PENCSRR+vk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1swKa3-008wW8-W6; Thu, 03 Oct 2024 14:05:15 +0200
Date: Thu, 3 Oct 2024 14:05:15 +0200
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
Message-ID: <796d0096-1cf9-4234-9117-440469c4e9d9@lunn.ch>
References: <20241001024731.140069-1-marex@denx.de>
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
 <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>

> > Nice use of udev. I had not thought about using it for this.

> Is there some other way to configure the netdev-triggered PHY LEDs ?
> I still feel the udev rule is somewhat brittle and fragile, and also not
> available early enough for default PHY LED configuration, i.e. the LEDs are
> not blinking when I use e.g. ip=/nfsroot= when booting from NFS root until
> the userspace started, which is not nice. The only alternative I can imagine
> is default configuration in DT, which was already rejected a few years ago.

Device tree is the only early way i can think of, especially for NFS
root.

What has clearly been rejected is each vendor having their own DT
binding. But i think we might have more success with one generic
binding for all MAC/PHY LEDs.

The way i was thinking about it, was to describe the label on the
front panel. That is hardware you are describing, so fits DT.

We are clearly in the grey area for DT, so i can understand some push
back on this from the DT Maintainers.

	Andrew

