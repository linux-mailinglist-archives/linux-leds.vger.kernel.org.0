Return-Path: <linux-leds+bounces-3918-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFEA30836
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 11:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7906D161647
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 10:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752291F192B;
	Tue, 11 Feb 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRUwt8CO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C61F03D9;
	Tue, 11 Feb 2025 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268928; cv=none; b=UsmIFE0tdWi+BOsrkowjCvgPR/TcWZeFdOUBZySKfP/UuhAw0jrBSxLyWtItOwE/FNG05O3P11sS03szcGFSQlAlGcdKAebVL4m3nkKOq78M+CeQCbsVrpldKjw5YeC7NsfG4SqmhPS7GYCMUHg2G4oSF66vghM7A6icQYX3sVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268928; c=relaxed/simple;
	bh=FCdEnDf9oipcxKTdnA7WndtjMuMXT6dVmy4L1o/HFbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWR56Ajtr/Mrv/ezQTHGESnCcT3YYFuAgt5uM6pzXCEy2VXmE79JuBN9Lod7/zLai3CAq1SRhz1QCEzPP4oTVTKEj+/nwf0Nwu9UZidiVnFYZHtTNl3RRRlYGQlqAk7bVyCGU1ovpt74O/HgPcjlFTDF/C89gXLZSklcElhkOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRUwt8CO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E73EC4CEDD;
	Tue, 11 Feb 2025 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739268927;
	bh=FCdEnDf9oipcxKTdnA7WndtjMuMXT6dVmy4L1o/HFbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRUwt8CORW4roJdPPnanaDYNQtqwz1PeyjcZ7QqpS4r95x8XvXuEO+oTC0LQ4sgqX
	 awUB1f05Bi3IP7A+3RuWXxj1KawkeVXSySAEI/XD027i/zhHJh2abm+EvUN9FD8Qph
	 QkhN0O+HP9+p/r3zADAfvkOk40t+fvhSARZCgkDXMjFDhmOm5wcQ0dLHezv+9SlfvU
	 mhyRww6nnS19qPS8DP9rkczS+C3yuaxqVe2BmINwCEXsQ8xfyMzeoE62aACHKcSDG+
	 D2BQgprunMo6M9jLhrcW3hVUcktDQLDEBcpF7nrAJ6+oop4PGhgA0EIchDtFv94yDs
	 wmqVlOEHh40cA==
Date: Tue, 11 Feb 2025 10:15:22 +0000
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
Message-ID: <20250211101522.GL1868108@google.com>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
 <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
 <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>
 <20250210165923.GC1868108@google.com>
 <20250210170136.GD1868108@google.com>
 <CAMuHMdXtDd-KSeX_8nhj_J0X33WRT47_v3m01qdBN01-p4xVjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXtDd-KSeX_8nhj_J0X33WRT47_v3m01qdBN01-p4xVjA@mail.gmail.com>

On Tue, 11 Feb 2025, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Mon, 10 Feb 2025 at 18:01, Lee Jones <lee@kernel.org> wrote:
> > On Mon, 10 Feb 2025, Lee Jones wrote:
> > > On Tue, 21 Jan 2025, Geert Uytterhoeven wrote:
> > >
> > > > Hi Lee,
> > > >
> > > > On Thu, Jan 9, 2025 at 11:31 AM Lee Jones <lee@kernel.org> wrote:
> > > > > On Wed, 18 Dec 2024 18:33:59 +0000, Vicentiu Galanopulo wrote:
> > > > > > The output current can be adjusted separately for each channel by 8-bit
> > > > > > analog (current sink input) and 12-bit digital (PWM) dimming control. The
> > > > > > LED1202 implements 12 low-side current generators with independent dimming
> > > > > > control.
> > > > > > Internal volatile memory allows the user to store up to 8 different patterns,
> > > > > > each pattern is a particular output configuration in terms of PWM
> > > > > > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> > > > > > common to all patterns. Each device tree LED node will have a corresponding
> > > > > > entry in /sys/class/leds with the label name. The brightness property
> > > > > > corresponds to the per channel analog dimming, while the patterns[1-8] to the
> > > > > > PWM dimming control.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [3/3] leds: Add LED1202 I2C driver
> > > > >       commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2
> > > >
> > > > You also have commit 259230378c65ebb6 ("leds: Add LED1202 I2C driver")
> > > > in mfd/for-mfd-next, which dropped the change to drivers/leds/Makefile,
> > > > and changed the Link:-tag to point to the older version v10?
> > >
> > > Interesting.  Not sure I noticed and if I did, I must have fixed it.
> > >
> > > This is the commit that made it in:
> > >
> > >   939757aafeb9 ("leds: Add LED1202 I2C driver")
> >
> > Scratch that - looks like:
> >
> >   259230378c65 ("leds: Add LED1202 I2C driver")
> >
> > ... also made it in.  However the Makefile line survived:
> >
> >   drivers/leds/Makefile:obj-$(CONFIG_LEDS_ST1202)         += leds-st1202.o
> >
> > Did anything break or is all as expected?
> 
> The end result is fine.  History might confuse people (the (un)happy
> few who care about history ;-), as "git log -p v6.14-rc1 --
> drivers/leds/Makefile" shows 939757aafeb9, while "git log -p v6.14-rc1
> -- drivers/leds/leds-st1202.c" shows 259230378c65, linking to the
> older version.

Sorry about that.  I am one who cares a great deal about history.

One of the pitfalls of maintaining multiple repos I guess.

#humanafterall :)

-- 
Lee Jones [李琼斯]

