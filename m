Return-Path: <linux-leds+bounces-5095-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B9B0A4F4
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 15:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65558AA21E1
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 13:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF052D97B4;
	Fri, 18 Jul 2025 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP1wMZfs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F2218EA8;
	Fri, 18 Jul 2025 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752844741; cv=none; b=Z+X1QyyA/x1oqjD4Dyk5EjjXzbtxo/R60SOZPChogeTP9goUvBRiT9EJzz/sGFKncnjysu9wLyfeoJZhvk9R+4mgwfC2lgBzA6ptFXV5IPskLaTDQwN/eYRFp8jN5QmLd2gSzyYpB+gEtj4Gp+6Ae0bSe3ii+v+2100ZWPXVGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752844741; c=relaxed/simple;
	bh=/SorCWSf9LtnW4yJ59k/VAkWjt4rcYFDuKL0CK+pxVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjWfUWrwIyRwA9dKnJka1fODCP4vzppak9+fgkJUuzGaiep0S27W1+HJuqsBpenrSIit6z0J0y5285VNJhMb+QIxJeCEcbBffbLAJyIK1ApYLrsWx18FlB7TTGVehv9wqK2IZceffaXRtSwM8sFeolYtm3v/jj2i0nyJ/+w644Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP1wMZfs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E81C4CEEB;
	Fri, 18 Jul 2025 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752844740;
	bh=/SorCWSf9LtnW4yJ59k/VAkWjt4rcYFDuKL0CK+pxVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP1wMZfs0YdWa1rv0CE8aNpjubogeXPYmSa4jTINdlZfMh7gzi8jwske+ELPd4CT6
	 nEGH3c03BXOz8PtFOKvQuk4yTTCVVVWA0beFGKHsYAD2a+b1u9YQdGAFopiDvqY3uA
	 daG+rC5qlHS9rgxh1uf87eV5gZZTuDXPVb6Y7Pb2LKfZi4ZQeLpuRSYrDTygKoWIXX
	 qdwsxu/BQwsRvf+gGqVCRhqrwxDBLzMFMc5xjljKTs5oWK/eTgBpU09QsNPA205o4z
	 FeAT0owJK9kri/Qyn8NXnopairBDvoDINkwJfAP1TjJyDTFXE7G6oflYrmz0ShTC+7
	 QSCELifveySFw==
Date: Fri, 18 Jul 2025 14:18:55 +0100
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] leds: add support for TI LP5860 LED driver chip
Message-ID: <20250718131855.GC11056@google.com>
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
 <20250514-v6-14-topic-ti-lp5860-v2-2-72ecc8fa4ad7@pengutronix.de>
 <20250523102848.GE1378991@google.com>
 <877c0bqisz.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877c0bqisz.fsf@pengutronix.de>

On Mon, 14 Jul 2025, Steffen Trumtrar wrote:

> 
> Hi,
> 
> On 2025-05-23 at 11:28 +01, Lee Jones <lee@kernel.org> wrote:
> 
> > On Wed, 14 May 2025, Steffen Trumtrar wrote:
> > 
> > > Add support for the Texas Instruments LP5860 LED driver chip
> > > via SPI interfaces.
> > > > The LP5860 is an LED matrix driver for up to 196 LEDs, which
> > supports
> > > short and open detection of the individual channel select lines.
> > > > The original driver is from an unknown author at Texas Instruments.
> > Only
> > > the cryptic handle 'zlzx' is known.
> > > > Co-developed-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > > ---
> > >  Documentation/ABI/testing/sysfs-class-spi-lp5860 |  23 ++
> > >  drivers/leds/Kconfig                             |  23 ++
> > >  drivers/leds/Makefile                            |   2 +
> > >  drivers/leds/leds-lp5860-core.c                  | 276 ++++++++++++++++++++
> > >  drivers/leds/leds-lp5860-spi.c                   |  99 +++++++
> > 
> > Are you going to follow-up with another option?  Say I2C?
> 
> the chip also supports connection via I2C, but it's unlikely that I will add that myself.
> 
> > >  drivers/leds/leds-lp5860.h                       | 315 +++++++++++++++++++++++
> > >  6 files changed, 738 insertions(+)
> > > > diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860
> > b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> > 
> > This doesn't belong here.
> > 
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..d24b49d38ecae55f1a1a4e465fbe71d30eff497e
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> > > @@ -0,0 +1,23 @@
> > > +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/b_current_set
> > 
> > Why would you want to change the current of the SPI bus?
> > 
> 
> Where does it belong? I grepped and followed the eeprom
> (Documentation/ABI/testing/sysfs-class-spi-eeprom) which uses sernum
> in the same way. Directions welcome.

I mean, in this patch.  Submit this part to the SPI subsystem maintainer.

> > > +Date:           May 2025
> > > +KernelVersion:  6.15
> > > +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> > > +Description:
> > > +	Contains and sets the current for the B color group.
> > 
> > What does the current set?  Brightness?
> > 
> > If so, the user shouldn't be expected to know what current set in order
> > to obtain a specific brightness.  Instead, shouldn't you use
> > /sys/class/leds/<led>/multi_intensity and let the driver deal with the
> > particulars of setting that brightness?
> > 
> 
> The chip has a global setting for the current of the three color
> groups. And an indiviual setting for every LED itself. The
> multi_intensity is for one LED as far as I understand. And the
> brightness of the whole matrix can be controlled via this global
> current setting.

What I mean is - don't call it current.  Use what it does when you
change the current.

> (...)
> 
> Thanks for the rest of the feedback. I already addressed all of that
> in my patches, but I'm not sure what is the correct way to proceed
> with the sysfs ABI entries.
> 
> 
> Thanks,
> Steffen
> 
> -- 
> Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
> Steuerwalder Str. 21            | https://www.pengutronix.de/    |
> 31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
> Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
> 

-- 
Lee Jones [李琼斯]

