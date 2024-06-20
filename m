Return-Path: <linux-leds+bounces-2044-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AC910137
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 12:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5DB7B219E5
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 10:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5F81A8C15;
	Thu, 20 Jun 2024 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="EDibbRVA"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6017E58C;
	Thu, 20 Jun 2024 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718878389; cv=none; b=QwyGCONQr0MYJy7LiBi7sT25hqryMNuMnJIQoJe3Wblgj85RBRgA1yfJjZqOoMvJtIp6kHifNEqub2hwUVs4EIqoWJR/rrFiBfa8fTsIKZHS/RAz+DC2mv8xMP5z+4TF5+WOcqbeUGJN7hB6vjCbBXbx0ZQOkeTyJ+1u4zMlIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718878389; c=relaxed/simple;
	bh=/BY01FytTrtayCSk8i5W8i0ED5sRVgxQCNoZYwJSR4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XII6dm0z9sjaSRoP9U0ipO3T2EjNW8nxldnemu+pE+IFpYnws+p+/ckJ3bgAhJdSOFJ2CoA8nHnf3RmUWSnU3Nf1J0cKnnyAOEh5xU/BU9RyPEqpjNY8fWqZCDWSrp1XwX5juK4W5grZIpdtwtEF3xQeTWwjYShE5KExQV93gUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=EDibbRVA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718878375;
	bh=/BY01FytTrtayCSk8i5W8i0ED5sRVgxQCNoZYwJSR4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDibbRVApG0As5Eh3wXK3dE9Kx95CONejYNp2cpin5fqMtXUjjgl3jdcP+7Mpe+S7
	 EqmHkKa6K2J0Nmg20qu7/FElie49yph88gi26QI4eplhr8HsBvRN4CfBsStxYESVeM
	 3/CbxMm2gisxeGps4rKGAaT+j4UpwI7EbjwLuWXI=
Date: Thu, 20 Jun 2024 12:12:55 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620093114.GH3029315@google.com>

Hi Lee,

On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> Definitely not seen a commit message like that before

I assumed that this patch would be squashed into the original commit.

My question in which form you wanted the changes should have included
"incremental series".

> > Implement review comments from Lee as requested in [0] for
> > "leds: Add ChromeOS EC driver".
> > 
> > Changes:
> > * Inline DRV_NAME string constant.
> > * Use dev_err() instead of dev_warn() to report errors.
> > * Rename cros_ec_led_probe_led() to cros_ec_led_probe_one().
> > * Make loop variable "int" where they belong.
> > * Move "Unknown LED" comment to where it belongs.
> > * Register trigger during _probe().
> > * Use module_platform_driver() and drop all the custom boilerplate.
> 
> If you're fixing many things, then I would expect to receive many
> patches.  One patch for functional change please.  If you can reasonably
> group fixes of similar elk, then please do.  However one patch that does
> a bunch of different things is a no-go from me, sorry.

Absolutely, if these changes are to end up as actual commits then they
need to look different.
I'll resend them as proper series.

> > [0] https://lore.kernel.org/lkml/20240614093445.GF3029315@google.com/T/#m8750abdef6a968ace765645189170814196c9ce9
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  drivers/leds/leds-cros_ec.c | 50 +++++++++++++--------------------------------
> >  1 file changed, 14 insertions(+), 36 deletions(-)

<snip>

Sorry for the confusion,
Thomas

