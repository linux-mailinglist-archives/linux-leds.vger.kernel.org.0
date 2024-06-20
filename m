Return-Path: <linux-leds+bounces-2045-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097829103EF
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 14:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81AF2B21BAC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 12:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71951AC42F;
	Thu, 20 Jun 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTlRBJ0c"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600B1AC24E;
	Thu, 20 Jun 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718886466; cv=none; b=fzRlPE2OZ5YE1UIYkQLrZb5Dx9xB0OSUxiYs1zD5PaqshDu0iM7zjPhOl6jrFnLdZuuVCAUhWnbP4mqmShrgfNmqBYRKtRDDH+LUki1xeBa6ZKYa75pADfV+9nt4h6dUIIU9qeiog73qPpSo+2FqKAhseEvpZNZZlqC2NH+HO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718886466; c=relaxed/simple;
	bh=d3uDdynGfOkk0mbmcQ+FLr+9NUSGH+fNkufeZ4WI608=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao+vlcj7C2NBdHUOEkFyDpM8qvnXWD8evhSeiRgbv+WBaSnAE/gh9nzuxfBxS0qc4ZD9/jj7NBrkUU69gYWupdCiThN22+DHX7vLu6fhBvc+HTzINH2/xo4aWajwvo9noGlsQEB84nzbKpH2rdnpZ2z0HDJPmrPgbEzy2r+tW/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTlRBJ0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E84DC2BD10;
	Thu, 20 Jun 2024 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718886466;
	bh=d3uDdynGfOkk0mbmcQ+FLr+9NUSGH+fNkufeZ4WI608=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTlRBJ0cwfOGL9atmnuGvX1/fnNlWgOZTnTN+9Xv6uyX2sMavDNKzoHmXcYysq376
	 n4/+EkLTlHwV2wuRwOwG8uoT132+MBWOBSP1NkzPpLbwwdmhJwDajVSeScevsW20pR
	 xhuiSmi3hc6tOVQYqSxHapmVlzJONBjxYnPhIufj7Pz0LKhBcyB0bNKX0OE7rx3JW7
	 /w7xtvjISIL/BXtsr5Cp2sg/qRHZL1AoA7ILhz4b5LX77OIcsih83QmnfB/6vFxiKe
	 krQqJmHxTfuRCNBFeUibI/eVD5YH7eC6SVAr6j43vQsqMeXd19kgZwS6iXAqQu+v58
	 vC0lNTaNoZBUg==
Date: Thu, 20 Jun 2024 13:27:41 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <20240620122741.GL3029315@google.com>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
 <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>

On Thu, 20 Jun 2024, Thomas Weißschuh wrote:

> Hi Lee,
> 
> On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> > Definitely not seen a commit message like that before
> 
> I assumed that this patch would be squashed into the original commit.
> 
> My question in which form you wanted the changes should have included
> "incremental series".

Incremental means on top.

A lot of maintainers don't support history re-writes, but I've reserved
that right since forever, so I can squash it if you like.

> > > Implement review comments from Lee as requested in [0] for
> > > "leds: Add ChromeOS EC driver".
> > > 
> > > Changes:
> > > * Inline DRV_NAME string constant.
> > > * Use dev_err() instead of dev_warn() to report errors.
> > > * Rename cros_ec_led_probe_led() to cros_ec_led_probe_one().
> > > * Make loop variable "int" where they belong.
> > > * Move "Unknown LED" comment to where it belongs.
> > > * Register trigger during _probe().
> > > * Use module_platform_driver() and drop all the custom boilerplate.
> > 
> > If you're fixing many things, then I would expect to receive many
> > patches.  One patch for functional change please.  If you can reasonably
> > group fixes of similar elk, then please do.  However one patch that does
> > a bunch of different things is a no-go from me, sorry.
> 
> Absolutely, if these changes are to end up as actual commits then they
> need to look different.
> I'll resend them as proper series.
> 
> > > [0] https://lore.kernel.org/lkml/20240614093445.GF3029315@google.com/T/#m8750abdef6a968ace765645189170814196c9ce9
> > > 
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > ---
> > >  drivers/leds/leds-cros_ec.c | 50 +++++++++++++--------------------------------
> > >  1 file changed, 14 insertions(+), 36 deletions(-)
> 
> <snip>
> 
> Sorry for the confusion,
> Thomas

-- 
Lee Jones [李琼斯]

