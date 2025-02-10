Return-Path: <linux-leds+bounces-3908-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0DA2F483
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 18:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294F03A3C82
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B018213A3ED;
	Mon, 10 Feb 2025 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6mdeN44"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED625757;
	Mon, 10 Feb 2025 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206901; cv=none; b=OUu82R86EBY1qs+uuPALTvQyFOv2iFS+eoJfRUk89q8HPOhA8vsQHlDJa3hhlg0rXXtdgTCea0QyMfjT1ZEuOT4HdCe/7HcQar2B49Rox/Re46njYoSh5Fsa9pfvsawyiC+hO46sy4EASWPwEaawaLrBWwsoZ1kuNGDdZ4ADDFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206901; c=relaxed/simple;
	bh=KbtE9EGAZOZs06gDPHy5xxqRxQd3wXKf75qbqvSeJg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYByYfRiMVwcyFA0XX8CRwwim/qnX2091huLaW6aLgx0OpV69ikC2F+Hj8CXVtIJ7+8EQrgg1HdE4WSD1w/46jiRvc8MKId3MmYx3vHRaE/GCifkoBKl2hRqxc1GZj8aw8KbCivBjfBggogjDAtAQY8aJP9ROwXhQRsXYtRYqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6mdeN44; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE1C4CED1;
	Mon, 10 Feb 2025 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206900;
	bh=KbtE9EGAZOZs06gDPHy5xxqRxQd3wXKf75qbqvSeJg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6mdeN44UWUPZmfVwusQDTyxuxC1AMXDReHetVO2TX3CJ7BjXJOMX69OltnXDCv9q
	 rVjQ8z9jJaiBDmXkgNYzRGE4at5DouFoGSxriYu/t0Wo12DlCSBCbgWsyTq1f8jyJ2
	 1j5stCtbPxgUec1p8InSTEkJhW3ItmgqOUYZ9nL9mOGQPWdGeSYYF4oFGTnTXdbRTC
	 +uiwAVS8ylniZNSTpog/9LrVzSmXu0tB0+AjxKOtAHWnS/nfMkQOSKi2iSEOgH2XAF
	 m9Pg3pzWbh47XAJUDTBluZ+gYdbLLUoF44ppJKmAg93p1ILCjswQbxcOZmaiKZ58R0
	 L9mjsDEWtaJZw==
Date: Mon, 10 Feb 2025 17:01:36 +0000
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Subject: Re: (subset) [PATCH v11 3/3] leds: Add LED1202 I2C driver
Message-ID: <20250210170136.GD1868108@google.com>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
 <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
 <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>
 <20250210165923.GC1868108@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210165923.GC1868108@google.com>

On Mon, 10 Feb 2025, Lee Jones wrote:

> On Tue, 21 Jan 2025, Geert Uytterhoeven wrote:
> 
> > Hi Lee,
> > 
> > On Thu, Jan 9, 2025 at 11:31 AM Lee Jones <lee@kernel.org> wrote:
> > > On Wed, 18 Dec 2024 18:33:59 +0000, Vicentiu Galanopulo wrote:
> > > > The output current can be adjusted separately for each channel by 8-bit
> > > > analog (current sink input) and 12-bit digital (PWM) dimming control. The
> > > > LED1202 implements 12 low-side current generators with independent dimming
> > > > control.
> > > > Internal volatile memory allows the user to store up to 8 different patterns,
> > > > each pattern is a particular output configuration in terms of PWM
> > > > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> > > > common to all patterns. Each device tree LED node will have a corresponding
> > > > entry in /sys/class/leds with the label name. The brightness property
> > > > corresponds to the per channel analog dimming, while the patterns[1-8] to the
> > > > PWM dimming control.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [3/3] leds: Add LED1202 I2C driver
> > >       commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2
> > 
> > You also have commit 259230378c65ebb6 ("leds: Add LED1202 I2C driver")
> > in mfd/for-mfd-next, which dropped the change to drivers/leds/Makefile,
> > and changed the Link:-tag to point to the older version v10?
> 
> Interesting.  Not sure I noticed and if I did, I must have fixed it.
> 
> This is the commit that made it in:
> 
>   939757aafeb9 ("leds: Add LED1202 I2C driver")

Scratch that - looks like:

  259230378c65 ("leds: Add LED1202 I2C driver")

... also made it in.  However the Makefile line survived:

  drivers/leds/Makefile:obj-$(CONFIG_LEDS_ST1202)         += leds-st1202.o

Did anything break or is all as expected?

-- 
Lee Jones [李琼斯]

