Return-Path: <linux-leds+bounces-3907-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED8A2F469
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A606F1613A6
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 16:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F5F256C8D;
	Mon, 10 Feb 2025 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifcxRZHv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ABF256C88;
	Mon, 10 Feb 2025 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206769; cv=none; b=pRz6XXYMo3JVah2AeXlV07lTuljyzpfb2brqJsYcV2gz0BG71htg5/xJgGZtkaR2stLr9AjrS+f8y5rCJkT+yuYkVRYZAS4GXIPLLJg2wXptXPDZVoMNgcbb+Syy2pCPP+SU8R5B3dJTKIUbBpgCmTJA6WOn/y+DIia+zIMltxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206769; c=relaxed/simple;
	bh=EqjZQKixxYPB7j/vkC+p5WO+e5I+dXqgZTguykjhQ64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvlN6ewpjXOfpc6M8LFT7iN4qIe3ICXa7rWEwVY/2pKNtHFSNZNYFnsLNHOB08cbQfFrpmLe78P5w93walmTffBmUqAdGR3N6LrCPl4M1TAKc4NK0wFOLyShYhMBAc0z/qNYpkAYHNK0rik7mDtj2bYFwc0Vl9b20xwDp/gPk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifcxRZHv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B850C4CED1;
	Mon, 10 Feb 2025 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206768;
	bh=EqjZQKixxYPB7j/vkC+p5WO+e5I+dXqgZTguykjhQ64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifcxRZHvi5GRrbyjMrKfQ/vkX8nHDzmrZ3bJPJdd6R/EpNhngmus2iJ9xYS30UYlJ
	 /lvYPiNxaZGIHY2X5oVMRiQlwSxCUxez/agIWb5S2MaSe5stYfsS7yWQDXMy3u3lJZ
	 sA+n95+tbujncQ5fpVzdrqcXHkVMVOaj1/ujh082lk6QjiYXOcIN+QF1944RAz0cH2
	 AdTka+6WeRN5eeiBqchQH4k4d+0UQPiOFY+ePGba04NFJGUf86eGFuami6+XEcWOk3
	 DKuHfhYeC6bbQG+ngly4I+GggaDtVSAjDzQl6FAsuIcn3idT5aGlRAY+Il8/GeFRKA
	 ktkOX8MxQ96Kw==
Date: Mon, 10 Feb 2025 16:59:23 +0000
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
Message-ID: <20250210165923.GC1868108@google.com>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
 <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
 <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXNOEXuEADeSGGHw88Tse+QjSkknKYGH-kk02jSpiuNiQ@mail.gmail.com>

On Tue, 21 Jan 2025, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Thu, Jan 9, 2025 at 11:31 AM Lee Jones <lee@kernel.org> wrote:
> > On Wed, 18 Dec 2024 18:33:59 +0000, Vicentiu Galanopulo wrote:
> > > The output current can be adjusted separately for each channel by 8-bit
> > > analog (current sink input) and 12-bit digital (PWM) dimming control. The
> > > LED1202 implements 12 low-side current generators with independent dimming
> > > control.
> > > Internal volatile memory allows the user to store up to 8 different patterns,
> > > each pattern is a particular output configuration in terms of PWM
> > > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> > > common to all patterns. Each device tree LED node will have a corresponding
> > > entry in /sys/class/leds with the label name. The brightness property
> > > corresponds to the per channel analog dimming, while the patterns[1-8] to the
> > > PWM dimming control.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [3/3] leds: Add LED1202 I2C driver
> >       commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2
> 
> You also have commit 259230378c65ebb6 ("leds: Add LED1202 I2C driver")
> in mfd/for-mfd-next, which dropped the change to drivers/leds/Makefile,
> and changed the Link:-tag to point to the older version v10?

Interesting.  Not sure I noticed and if I did, I must have fixed it.

This is the commit that made it in:

  939757aafeb9 ("leds: Add LED1202 I2C driver")

-- 
Lee Jones [李琼斯]

