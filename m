Return-Path: <linux-leds+bounces-2099-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C23859122BA
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2024 12:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A89E1F212B2
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2024 10:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8D2171E5F;
	Fri, 21 Jun 2024 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UguzqbY0"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0003171E5D;
	Fri, 21 Jun 2024 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966681; cv=none; b=C5C1Sx7LnwGLgXLPuV+nR1Hck5gPhWsBXFx2lmeE2mZvwswiZBCq7dUw8htrJwF3ReNzkp1JDtPMd4bvgljHFgk9xpRNGJcfkF1lUyuXuP+AFEc+MLyJr4qWy8k2Pek3HdETnHn6rdPQFvq53MrE909eRE58oGZBNkkYzStKZ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966681; c=relaxed/simple;
	bh=sX+28HuOEhuHTD/5J4TrbqqVEghIZejXXfBHB0DrGB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3mqm7bGZdTYavJ2kzqdOEvY2J7tkPsfebobFMZ4p0PcAOHg1fF7ePYq/L4+XKHXPgt5yNu67DBMV4zzzcUEDcpfxIMxN+VX5LXnNWL23NSR71M7pxk6r5eyVhgyy5jMbcp4UEFCgjofwE1op67HHikAHxJKfosnx5PJrkNla+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UguzqbY0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718966670;
	bh=sX+28HuOEhuHTD/5J4TrbqqVEghIZejXXfBHB0DrGB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UguzqbY0eIXds0nQPsKflqftwyJrssEIJzHnMUPUqMeHeVGlmbN0QZ4wzi5M1FwOx
	 GwZbz6FrNZO03q5KO8ae6xXPQhwQSdjr5wSfGQyFl55IUP0CvJIhlagWBU/bQdqrJi
	 CMqmNJpDWleB+DFQH/XUr0fsAOudx4BpX8RWHLRQ=
Date: Fri, 21 Jun 2024 12:44:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <cef01f01-ccb8-43f5-af78-e59c8286976b@t-8ch.de>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
 <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
 <20240620122741.GL3029315@google.com>
 <478e23df-800a-40c6-b972-2af2d535b1ae@t-8ch.de>
 <20240620171511.GX3029315@google.com>
 <3a164ee6-79f7-48ea-bdd2-4b8074920eda@t-8ch.de>
 <20240621104038.GL1318296@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240621104038.GL1318296@google.com>

On 2024-06-21 11:40:38+0000, Lee Jones wrote:
> On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> 
> > On 2024-06-20 18:15:11+0000, Lee Jones wrote:
> > > On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> > > 
> > > > On 2024-06-20 13:27:41+0000, Lee Jones wrote:
> > > > > On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> > > > > 
> > > > > > Hi Lee,
> > > > > > 
> > > > > > On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> > > > > > > Definitely not seen a commit message like that before
> > > > > > 
> > > > > > I assumed that this patch would be squashed into the original commit.
> > > > > > 
> > > > > > My question in which form you wanted the changes should have included
> > > > > > "incremental series".
> > > > > 
> > > > > Incremental means on top.
> > > > > 
> > > > > A lot of maintainers don't support history re-writes, but I've reserved
> > > > > that right since forever, so I can squash it if you like.
> > > > 
> > > > If it is already visible somewhere and a squash would inconvenience
> > > > anybody I'll resend it.
> > > > But if not I'd be happy about a squash.
> > > > 
> > > > (I couldn't and still can't find the public tree where driver is in)
> > > 
> > > Odd, neither can I!  Okay applied the whole set again, squashed the
> > > patch and submitted for testing.
> > 
> > Thanks!
> > 
> > FYI:
> > 
> > The Ack you asked for in the cros_kbd_led_backlight series [0],
> > which should go through the LED tree (and has a MFD component),
> > was given by Tzung-Bi in [1].
> > 
> > (In case it fell through the cracks. If not, please disregard)
> 
> Now I'm really confused.
> 
> This patch not for that set though, right?
> 
> You're talking about:
> 
>  mfd: cros_ec: Register keyboard backlight subdevice
>  platform/chrome: cros_kbd_led_backlight: allow binding through MFD     <-- this one
>  leds: class: Add flag to avoid automatic renaming of LED devices
>  leds: class: Warn about name collisions earlier
> 
> But this fix-up patch belongs in:
> 
>  mfd: cros_ec: Register LED subdevice
>  leds: Add ChromeOS EC driver                                           <-- this one
>  leds: core: Unexport led_colors[] array
>  leds: multicolor: Use led_get_color_name() function
>  leds: core: Introduce led_get_color_name() function
> 
> Right?

Yes, all correct.
Which is why I referred to it explicitly as the "cros_kbd_led_backlight series".

It was meant as a heads-up. Mentioned here as I was writing with you anyways.

> > [0] https://lore.kernel.org/lkml/20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net/
> > [1] https://lore.kernel.org/lkml/ZmutW6vh7pD1HLf5@google.com/

