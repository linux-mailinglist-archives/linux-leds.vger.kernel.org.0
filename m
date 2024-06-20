Return-Path: <linux-leds+bounces-2046-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AEC910895
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF4561C21043
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 14:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B80A1AD9EB;
	Thu, 20 Jun 2024 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="j4vF8nVK"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3352F1ACE8B;
	Thu, 20 Jun 2024 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894312; cv=none; b=sZW+iNWaoUVCQ0Q9n7/cbLDAYDvKkXh1EOsmnikJg1kDlwCB9Pcz1Q93UrPoZ1JC/o/Og+B0ZCR8VbUHNL82GjagX4DWd+H+CUM2WMHugq251MtPS/q+NSi/xiW2+vYropbl5pByneLuIwFd5l2n53TLdifAysVqXJfYtTe2o/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894312; c=relaxed/simple;
	bh=tZlQbUj16o+komoUZHpuCRxfeio3fPY3NSRXruhs/ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXgN8NnXsCX4/VOs2LI+knvdD+M5Nef5q6iLIYRSCjmxDFovJ9frZNxhVybzr7mm5s8FJPx0yzkxZO5U98vw4B/O57P5x7w0H6IEAFQWk4tup6Lp804rMYbhCba7XQghb21yUR/NyxkWEaU85Cord0BkMbgETHcoWz67R8u/H3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=j4vF8nVK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718894308;
	bh=tZlQbUj16o+komoUZHpuCRxfeio3fPY3NSRXruhs/ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4vF8nVKQJ+H/uoL2ehBmxvq25MXs8x9N4hjaGIv6lINOaon3iY4FavMaXJgdAk2o
	 VH4IIptiaFYhE84C8AC7AL5WweoUlvdbWsHe/Yv8I2KjoXSkmripTFt+HK3UthBQop
	 KbzBzrSvVPV3dD7kFFtzzR0dAK/2CC4ioTTDUAf8=
Date: Thu, 20 Jun 2024 16:38:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <478e23df-800a-40c6-b972-2af2d535b1ae@t-8ch.de>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
 <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
 <20240620122741.GL3029315@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620122741.GL3029315@google.com>

On 2024-06-20 13:27:41+0000, Lee Jones wrote:
> On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> 
> > Hi Lee,
> > 
> > On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> > > Definitely not seen a commit message like that before
> > 
> > I assumed that this patch would be squashed into the original commit.
> > 
> > My question in which form you wanted the changes should have included
> > "incremental series".
> 
> Incremental means on top.
> 
> A lot of maintainers don't support history re-writes, but I've reserved
> that right since forever, so I can squash it if you like.

If it is already visible somewhere and a squash would inconvenience
anybody I'll resend it.
But if not I'd be happy about a squash.

(I couldn't and still can't find the public tree where driver is in)

> > > > Implement review comments from Lee as requested in [0] for
> > > > "leds: Add ChromeOS EC driver".
> > > > 
> > > > Changes:
> > > > * Inline DRV_NAME string constant.
> > > > * Use dev_err() instead of dev_warn() to report errors.
> > > > * Rename cros_ec_led_probe_led() to cros_ec_led_probe_one().
> > > > * Make loop variable "int" where they belong.
> > > > * Move "Unknown LED" comment to where it belongs.
> > > > * Register trigger during _probe().
> > > > * Use module_platform_driver() and drop all the custom boilerplate.
> > > 
> > > If you're fixing many things, then I would expect to receive many
> > > patches.  One patch for functional change please.  If you can reasonably
> > > group fixes of similar elk, then please do.  However one patch that does
> > > a bunch of different things is a no-go from me, sorry.
> > 
> > Absolutely, if these changes are to end up as actual commits then they
> > need to look different.
> > I'll resend them as proper series.
> > 
> > > > [0] https://lore.kernel.org/lkml/20240614093445.GF3029315@google.com/T/#m8750abdef6a968ace765645189170814196c9ce9
> > > > 
> > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > ---
> > > >  drivers/leds/leds-cros_ec.c | 50 +++++++++++++--------------------------------
> > > >  1 file changed, 14 insertions(+), 36 deletions(-)
> > 
> > <snip>
> > 
> > Sorry for the confusion,
> > Thomas
> 
> -- 
> Lee Jones [李琼斯]

