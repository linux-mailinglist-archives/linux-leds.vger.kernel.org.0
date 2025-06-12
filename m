Return-Path: <linux-leds+bounces-4792-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BFAD7059
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 14:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C761BC714D
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 12:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4F921FF5B;
	Thu, 12 Jun 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HfHBgdOy"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288151B0416;
	Thu, 12 Jun 2025 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731176; cv=none; b=EBWR+z8aQkyIiv4phG0E0z6FjisnHK9yWBIGY3SKcJmh/taz4ctYxibJmdbVaR5Bd3z82O7ntvosDFEZwp1T/R+M9eO7UIJzfH1cugvE4up91BmRlc3yt73fsClpGDROuCzGT8x1F/PKSOQ+CFkNCvaN6sDS0vjaeJLIsEnauUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731176; c=relaxed/simple;
	bh=+CM4p7jzjVGL2gm4hkmviX7BIL03+A64KdB16Q0R0sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUrxjYAtsoETXMI9JRWe+W3sDME7fBwR1G5rO5mngM3Jn9QU/lTYV1iYnjh73/RCRj2D3dC5LJPSKNg9SyEQGEbZTl+y6CIVLbrOjmJrOHkGBwADEyjXsuxM3HF2+CMXnBY7QFTx6KU8zgbQWgGzvGcEpn8pSknCoom2Z4+jszA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HfHBgdOy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eEyCtf6AKq/AGabKk53fvCxGn10Kc5M0KbNyNxQldxs=; b=HfHBgdOyOPhe/YUJiJb7FNDvu+
	pCxweUOYzF2wy+PX5+3afYjQp8E537MweBhueskvAiXMXx7NMopebMlbhL70EoUaiNv1a4pxnnZ7N
	hGsw2h9rohEVMHGT9o7AuNp0IsJy5FU6xYjBVo+RM7NC/UdGrHIRuceQ2aw35nl+6CoM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPh0V-00FXNP-NV; Thu, 12 Jun 2025 14:26:11 +0200
Date: Thu, 12 Jun 2025 14:26:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tobias Junghans <tobias.junghans@inhub.de>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger: netdev: refactor
 netdev_event_requires_handling()
Message-ID: <556f0bb0-fd01-4e25-802e-7bbe98f0441f@lunn.ch>
References: <20250610114029.268938-1-tobias.junghans@inhub.de>
 <20250610114029.268938-3-tobias.junghans@inhub.de>
 <0bcb999e-f32c-499e-9a10-41334ffc2255@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bcb999e-f32c-499e-9a10-41334ffc2255@lunn.ch>

> Tomorrow i will look at the socket system calls and see how you get a
> processes network namespace.

current->nsproxy->net_ns gives the current processes network
namespace.

current is one of those historical odd things, like
jiffies. Originally it was a global variable, when the kernel
supported a single CPU, and hence only a single processes was ever
running. But with the change to SMP it became a #define for a function
call.

	Andrew

