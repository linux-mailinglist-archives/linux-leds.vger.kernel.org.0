Return-Path: <linux-leds+bounces-2599-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A417796B304
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 09:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 604D22811A4
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 07:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0235B1465BB;
	Wed,  4 Sep 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhJCepBR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E014659C
	for <linux-leds@vger.kernel.org>; Wed,  4 Sep 2024 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725435472; cv=none; b=CEhbC7LqBo7t60XYYkIihsbZDDHhuZInep4MruGwddkFFqlma4PdwRwzlr9yvix2p5cSQQox1gc/4Cn1aRDP3bG0bMt/hIqAJPvvuSfWZGJriXWwQKnGVosp6Z4wNe1SCXWlv8CE8jH0j+GaInCEF/gTJF99FhcHjN8j5GYx6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725435472; c=relaxed/simple;
	bh=JGIOAz3Rl02I1RE5HwHO7aZvHsLrunh+0oBaBwHLh2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lapRIsq816h5AETpEf8z2zxDVi8AQzQKvxEUhvGQhUfx1Yxl/cCvNwryfqSd8VQ8kv5cVdbDlzU6Z02VTIRwIFuJGbpS3Rhvuf0L/S9dcVwqGSW+4N2lNhLXIMcVkgqpi4lbxAsFbYXjjLYQVHAiQBlcmK8kLhLliQeJHDfDcgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhJCepBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E0DC4CEC2;
	Wed,  4 Sep 2024 07:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725435472;
	bh=JGIOAz3Rl02I1RE5HwHO7aZvHsLrunh+0oBaBwHLh2k=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=bhJCepBRpfedSP9Bsfu7hUTiK+wMhFlTGYNAMVWoi9lpdvItGLkYAfyAZxC6hG+OE
	 lnCdOMnXjnd7uLKdT7hOmBsffOkQudtk7d8UNG/AoGIRwC8/d1COHNmC14wlNiJm5d
	 UCt5VHWLRXLSAoD7OoxBxNbVJZKpwzyoFDidceD3RnWwkYmhSyoJ63JKG/C4O6+zNS
	 IXxWOx7ABa6J5EVTUgYscYePsexYD0zh+2/hHA6G6K3kndMYGU+XiLtxfaPpm9jrjA
	 4D2paLb+1y46p/qcKykvoiZjNNoBnoOGUgG6+l3gIfgxu6L8H3df6SrxasJgVQqGwU
	 pjsICN6GyhI8Q==
Date: Wed, 4 Sep 2024 09:37:45 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
Message-ID: <lt2yews6pr2bicwj6xpvodw4pliwjo6rx7pckn4o63wyn4tajg@nq75jkw5qtfb>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-9-kabel@kernel.org>
 <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
 <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>

On Tue, Sep 03, 2024 at 05:56:29PM +0200, Andrew Lunn wrote:
> On Tue, Sep 03, 2024 at 01:45:49PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 3, 2024 at 1:20 PM Marek Behún <kabel@kernel.org> wrote:
> > >
> > > Use dev_err_probe() instead of dev_err() + separate return where
> > > appropriate.
> > 
> > ...
> > 
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
> > 
> > Side note: Not sure how np is being used besides the messaging. If
> > it's only for the messaging, I would rather see %pfw and fwnode based
> > approach.
> 
> This board has a number of Ethernet switches described in DT.  Nobody
> takes ACPI seriously for any sort of complex networking. So using
> fwnode is probably pointless, this board will probably never be used
> with anything other than DT.

Although this is true, my opinion is that converting drivers to fwnode
API would still have some theoretical merit. For example using the
device_property_*() functions, where possible, seems nicer semantically.

I think I tried it once, or at least asked Pavel if I should, and he
turned me down, so I abandoned the effort.

But the patch would be a very simple one.

Marek

