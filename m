Return-Path: <linux-leds+bounces-5051-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFADB02BEA
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 18:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0548F1C2376F
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 16:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8517A1E835C;
	Sat, 12 Jul 2025 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="M5HfIP8M"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B981E;
	Sat, 12 Jul 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752337871; cv=none; b=nTmcxBKufDMNVZZ+6FWk4g4PtFhOWIaLv191yktv4FnRK41uioCHJqWId+HsKq2j1714eNk3oSC3zRDApf3bDZyQl6x1p68ceRBYDfz4DCbYkeHk10U4nJrmJh7zz1j6a/3hYASrNbb/a2RHgdOyuLwl8jhY9qDmfZfS3x1gulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752337871; c=relaxed/simple;
	bh=V8ivCQb1qRzR4Cbjlgz6tC6GhAK9koPS5kDy8JdFDpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVD+O3PDrDDYxEmhih65l1jRr0ZI2MTb5exma/JquAR2VqfD6+ViWUJzhlN/GSShW8Fb/qJ+awuyvD4qqzL/7+nIdc1MySUwbGWpfDY3dbd9Wazq8OP1rRpqwMZtxskmmn409yndxPR+yZbV9k+SwClIZscAk+s6WG5kCt40VSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=M5HfIP8M; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gPIPWoRMzCVE7p5bqcyntsdQXHN3dduuzB8heYx7CUc=; b=M5HfIP8MYC3AsQUquHCxsZPSOs
	7RAqyvA1n0anc0j0AiFxJNjVyTyLzL0Jf6xAMGgi8rJ8GZTthQQDYhNzK4liDyIQB9EzN9lbLXqsy
	K7KzoDkREqCmbP1GG9qFctIXzvcpU1ynCzjKk8gwz5ccFOnxkCHEC7HzRMlt30bPzuM0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uad7d-001Jj1-1H; Sat, 12 Jul 2025 18:30:45 +0200
Date: Sat, 12 Jul 2025 18:30:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Lukasz Majewski <lukma@denx.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "leds: trigger: netdev: Configure LED blink
 interval for HW offload"
Message-ID: <8979c6a6-f553-4d9a-ad26-9d1d90b11b1c@lunn.ch>
References: <6dcc77ee1c9676891d6250d8994850f521426a0f.1752334655.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dcc77ee1c9676891d6250d8994850f521426a0f.1752334655.git.daniel@makrotopia.org>

On Sat, Jul 12, 2025 at 04:39:21PM +0100, Daniel Golle wrote:
> This reverts commit c629c972b310af41e9e072febb6dae9a299edde6.
> 
> While .led_blink_set() would previously put an LED into an unconditional
> permanently blinking state, the offending commit now uses same operation
> to (also?) set the blink timing of the netdev trigger when offloading.
> 
> This breaks many if not all of the existing PHY drivers which offer
> offloading LED operations, as those drivers would just put the LED into
> blinking state after .led_blink_set() has been called.
> 
> Unfortunately the change even made it into stable kernels for unknown
> reasons, so it should be reverted there as well.
> 
> Fixes: c629c972b310a ("leds: trigger: netdev: Configure LED blink interval for HW offload")
> Link: https://lore.kernel.org/linux-leds/c6134e26-2e45-4121-aa15-58aaef327201@lunn.ch/T/#m9d6fe81bbcb273e59f12bbedbd633edd32118387
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Thanks for extending the commit message.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

