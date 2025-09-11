Return-Path: <linux-leds+bounces-5502-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77FB53A38
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 19:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14E9B1673FB
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 17:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F5F35FC30;
	Thu, 11 Sep 2025 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C+Az6ned"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2735FC05;
	Thu, 11 Sep 2025 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611111; cv=none; b=IAdPdFI3o4ZRAVJmS6TgJmPIM+PMzjzXUxCqsAuqsgXT3pxouLyF+n7VgdWy3NwTw2qyOdliijW6YwcsP70iEkSXA1mrvecbHExobIOthPMbjHJMCiGGpFMh6w9q2envPfXmQ7LBeGihEFjiyzcjhRijeqxH91DUwJoY460paEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611111; c=relaxed/simple;
	bh=wnsrpcy8kPoyL7upJtlNQIHelzchLg5C6iAT3OYXPJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrLyK6gzgd0wegBbb3YxH9ErRgOs+jkDaOzgpJD0J6HPnIiimx1kdhBvKZfy0vMahjfmbIkXwY4Cq4dzm/L85l+PLM4v3FLnmSJrJnD4AevwGJwzlEUU23jsZcM88+XDDVGi7MWPELs0eCgmr5T7wVDRyUnI1V1+d5+NPprrt5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C+Az6ned; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A611EC4CEF0;
	Thu, 11 Sep 2025 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757611110;
	bh=wnsrpcy8kPoyL7upJtlNQIHelzchLg5C6iAT3OYXPJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+Az6nedQ+4bLve7UbwSjqeBnHONvthcTphrtDzx0HWBcStzqM51Oswst56Sl4/ze
	 FLwEvUApyapr7MWsll+pcHbwcBzw7EhTEnuwir25JT8PxHKyhbmVAZ27qkL+v++/2p
	 +yDMd+vPrPtF+fM5LTeekj4h3/6z7cZIKoiHVhso=
Date: Thu, 11 Sep 2025 19:18:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v14 0/4] leds: add new LED driver for TI LP5812
Message-ID: <2025091113-mournful-smirk-8e03@gregkh>
References: <20250907160944.149104-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907160944.149104-1-trannamatk@gmail.com>

On Sun, Sep 07, 2025 at 11:09:40PM +0700, Nam Tran wrote:
> This patch series adds initial support for the TI LP5812,
> a 4x3 matrix RGB LED driver with autonomous engine control.
> This version provides a minimal, clean implementation focused
> on core functionality only. The goal is to upstream a solid
> foundation, with the expectation that additional features can
> be added incrementally in future patches.
> 
> The driver integrates with the LED multicolor framework and
> supports a set of basic sysfs interfaces for LED control and
> chip management.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>

The sysfs api is really odd here.  WHy not do the same thing as this
other controller recently submitted does:
	https://lore.kernel.org/r/20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de

but better yet, why does this need to be a kernel driver at all?  Why
can't you just control this directly from userspace with a program
there?

For USB, we generally do not allow these types of crazy apis to be added
to the kernel when controlling the device can be done from userspace.  I
think the same thing can happen here too, right?

thanks,

greg k-h

