Return-Path: <linux-leds+bounces-2073-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A09111BB
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7B521C2209B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 19:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA18A1B373C;
	Thu, 20 Jun 2024 19:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="hfj+wxqj"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DCF156255;
	Thu, 20 Jun 2024 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718910182; cv=none; b=K4Kor9FIcVCfMe9qZsbPHzZp8CEyl0dimoTKtNxmz5jh/IiW9+z8iF0rYR7KA8GaXX0wp/RUceM7wGV1XL4Xvw37AZUmEXbaVV7/gpldy8f2i7yD+BvxW1AKgvHCOSQKHwy+61EU0TyJDVnp4nHMvYWRY0LsenOLDKbR93UQLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718910182; c=relaxed/simple;
	bh=VKPldonoEQuhkhro6FdC/3LVaAJ615Hw78cT6Lav7Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx+IkBKymMxqjsPRfCDEmkdiL63Qfi0z/snNOWZLEIOBMfUUk7yvTp8ZHiiqiuKe8mxuobAUqbE/m2V9EraFGxlTtt/CYVDOaCQMTfWfRnK+SHUTeYdNVwtqEUD+U/oIPecCkvR42gskzErPwNP2UgRbcD7BQeU/SCNSn0XiyTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=hfj+wxqj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718910176;
	bh=VKPldonoEQuhkhro6FdC/3LVaAJ615Hw78cT6Lav7Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfj+wxqjfD4NprsnZWOVDvEIL5APjUIY6LmwcdugNgYK0Ah6OYifUE/YO3GL91uni
	 SZb8mZ2Ksm0oImcAfIlPeCmQP2IN12bKyyTykrnzry3MJBYWn4MOX4YKGzT0pfVfc4
	 0hTjI+m5AIPWBXEVGz763Kj6yCkGlVpYF2vh5h88=
Date: Thu, 20 Jun 2024 21:02:56 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <3a164ee6-79f7-48ea-bdd2-4b8074920eda@t-8ch.de>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
 <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
 <20240620122741.GL3029315@google.com>
 <478e23df-800a-40c6-b972-2af2d535b1ae@t-8ch.de>
 <20240620171511.GX3029315@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620171511.GX3029315@google.com>

On 2024-06-20 18:15:11+0000, Lee Jones wrote:
> On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> 
> > On 2024-06-20 13:27:41+0000, Lee Jones wrote:
> > > On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> > > 
> > > > Hi Lee,
> > > > 
> > > > On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> > > > > Definitely not seen a commit message like that before
> > > > 
> > > > I assumed that this patch would be squashed into the original commit.
> > > > 
> > > > My question in which form you wanted the changes should have included
> > > > "incremental series".
> > > 
> > > Incremental means on top.
> > > 
> > > A lot of maintainers don't support history re-writes, but I've reserved
> > > that right since forever, so I can squash it if you like.
> > 
> > If it is already visible somewhere and a squash would inconvenience
> > anybody I'll resend it.
> > But if not I'd be happy about a squash.
> > 
> > (I couldn't and still can't find the public tree where driver is in)
> 
> Odd, neither can I!  Okay applied the whole set again, squashed the
> patch and submitted for testing.

Thanks!

FYI:

The Ack you asked for in the cros_kbd_led_backlight series [0],
which should go through the LED tree (and has a MFD component),
was given by Tzung-Bi in [1].

(In case it fell through the cracks. If not, please disregard)


Thomas

[0] https://lore.kernel.org/lkml/20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net/
[1] https://lore.kernel.org/lkml/ZmutW6vh7pD1HLf5@google.com/

