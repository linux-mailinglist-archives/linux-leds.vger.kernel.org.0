Return-Path: <linux-leds+bounces-2098-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E8991229D
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2024 12:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89DB8B216D1
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2024 10:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4FD172BA8;
	Fri, 21 Jun 2024 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWZ0QKGN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E4172761;
	Fri, 21 Jun 2024 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966443; cv=none; b=NwZVYlRjYsgzC4uNEHiI6fxg7m/jU648STWRJ+d7IV/YoomuE596PGOj9dZz4YAGsahImFxSMdx6dIzbBerZnGPApZzilfzTKukta2z/InFp7vOLjXMSL1fgAPE8mjvrMirM8Pgo1hNUjuHMgrTwfBHN7gxrjq3rMIxhRQdawsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966443; c=relaxed/simple;
	bh=lideyFmcopJya8C9kB3HrrkDsw81oL4TPuWa8cb63zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn2d2KgRmNcmLV3bKtJsDVsqIrEswEmMLhslcxUZM2ztsCik50Rgx6UkTJO47vklucVsrRQjxFfMRcdw7Ya+dYlXXlTcI5K1Z2I5DzHX7gxJ1b68dXO4ljb8O5NGhHAmfPDtPmqlHGtPlqaEYyYExwTOprjyyt9FFiiOltCjjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWZ0QKGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D651C2BBFC;
	Fri, 21 Jun 2024 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718966443;
	bh=lideyFmcopJya8C9kB3HrrkDsw81oL4TPuWa8cb63zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWZ0QKGNhxHochU+Yna7EM+hevPMT70jXT2bcbf+tQUpBzMbo/H2cgBjwotvbFV0k
	 sDD5x8IcPHBQqLF0m05n0OCLD8vedPVQCcqoP6fZ4mXtuNZ9CnvFF+0SQkFa268nCQ
	 9eeGRRBFkTr9J8uQDWljmmviEgNF+pn7EkFGAPzcrohWqgO2jFfYYx66wTyeI1t3cl
	 M4QhehJ/6mzHthokn3kaLB5+mmK/vVb2gXWnilLB099ZEStflVFYRuqGcB0tvhMXx3
	 HYih5bDRwzLD2jRrw55/ZtvUHKH2TCPPssVcOOlhtO8z4cwN5yTWmWIvrr+2RpIFhU
	 bro75jQF73sWg==
Date: Fri, 21 Jun 2024 11:40:38 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <20240621104038.GL1318296@google.com>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
 <20240620093114.GH3029315@google.com>
 <5708f5c6-65fe-4bf9-8d08-6dbb77e21a9d@t-8ch.de>
 <20240620122741.GL3029315@google.com>
 <478e23df-800a-40c6-b972-2af2d535b1ae@t-8ch.de>
 <20240620171511.GX3029315@google.com>
 <3a164ee6-79f7-48ea-bdd2-4b8074920eda@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a164ee6-79f7-48ea-bdd2-4b8074920eda@t-8ch.de>

On Thu, 20 Jun 2024, Thomas Weißschuh wrote:

> On 2024-06-20 18:15:11+0000, Lee Jones wrote:
> > On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> > 
> > > On 2024-06-20 13:27:41+0000, Lee Jones wrote:
> > > > On Thu, 20 Jun 2024, Thomas Weißschuh wrote:
> > > > 
> > > > > Hi Lee,
> > > > > 
> > > > > On 2024-06-20 10:31:14+0000, Lee Jones wrote:
> > > > > > Definitely not seen a commit message like that before
> > > > > 
> > > > > I assumed that this patch would be squashed into the original commit.
> > > > > 
> > > > > My question in which form you wanted the changes should have included
> > > > > "incremental series".
> > > > 
> > > > Incremental means on top.
> > > > 
> > > > A lot of maintainers don't support history re-writes, but I've reserved
> > > > that right since forever, so I can squash it if you like.
> > > 
> > > If it is already visible somewhere and a squash would inconvenience
> > > anybody I'll resend it.
> > > But if not I'd be happy about a squash.
> > > 
> > > (I couldn't and still can't find the public tree where driver is in)
> > 
> > Odd, neither can I!  Okay applied the whole set again, squashed the
> > patch and submitted for testing.
> 
> Thanks!
> 
> FYI:
> 
> The Ack you asked for in the cros_kbd_led_backlight series [0],
> which should go through the LED tree (and has a MFD component),
> was given by Tzung-Bi in [1].
> 
> (In case it fell through the cracks. If not, please disregard)

Now I'm really confused.

This patch not for that set though, right?

You're talking about:

 mfd: cros_ec: Register keyboard backlight subdevice
 platform/chrome: cros_kbd_led_backlight: allow binding through MFD     <-- this one
 leds: class: Add flag to avoid automatic renaming of LED devices
 leds: class: Warn about name collisions earlier

But this fix-up patch belongs in:

 mfd: cros_ec: Register LED subdevice
 leds: Add ChromeOS EC driver                                           <-- this one
 leds: core: Unexport led_colors[] array
 leds: multicolor: Use led_get_color_name() function
 leds: core: Introduce led_get_color_name() function

Right?

> [0] https://lore.kernel.org/lkml/20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net/
> [1] https://lore.kernel.org/lkml/ZmutW6vh7pD1HLf5@google.com/

-- 
Lee Jones [李琼斯]

