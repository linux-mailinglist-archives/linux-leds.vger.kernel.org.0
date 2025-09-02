Return-Path: <linux-leds+bounces-5363-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58FB4000D
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 14:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17A83A3B68
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 12:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99583090EF;
	Tue,  2 Sep 2025 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc91ojCx"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D4308F3C;
	Tue,  2 Sep 2025 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814988; cv=none; b=MBwJ1hk0Uc1yXJDwIf28baOGz9F0wgoipsfY1JruGgv+LGbHgSHjgJQ3LyYfoV79Ov3KigHtsOQyKYlAfy2OWKwtgLIWHSkwgTMvJinogg2vU8kjQbJvTusJPBB2Yh+E6Qe4Mwyq5siBTumdyg/P4u7pC6TbH52nudBOsFqnaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814988; c=relaxed/simple;
	bh=gqijL2WEXNz0IFdJdtChN9Sde9A4dgCriDS28RNbEHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJ1/ta5i1Pv6pm9JkT0L6X85x/6bCvvpriaO0m3ZT0FQe7nO+0nr7RSVXU0bqORFQH2ae97+9FzCTv1BflyHYXQOe5rOwNsfD7OFJlI8GtW/JCH0Cj2rLDYj/MGFw/wwj+iMNWizUmx4+VtBhs6sAhkycd+o4evgq2RW9Lhj5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc91ojCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B819BC4CEED;
	Tue,  2 Sep 2025 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814988;
	bh=gqijL2WEXNz0IFdJdtChN9Sde9A4dgCriDS28RNbEHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lc91ojCxpVcS2dU+0144sWASq+rtIpFMHCb4CocMCW++Nwj+kt8sp9i/7dJ3EEvLz
	 7CQcx48K0DAI8dp0/2WxcKcwZ8PSkzrCd4m4YU7UjRcFlKkM+ak+s+dm2thWzJRqZn
	 qDD63vAzckxE5u9vM/Wa6dKyuUQVlasQDvb0DqlEh9zgNZx96HHoxipu7pSYylVVLv
	 hcoa+RA9c4Sj/YsCbcbbbf8KWjcyt4f5Xb2UY5s5GyTs9qihX0PF0EwAvB/Bq5n8on
	 J0O/+0CioRnKWWhXTGuA2gRI1zurjXFgp4B6rL7nM+m02s3d+qgaVvu47L3yeQUza1
	 31MJAZpS6RLMg==
Date: Tue, 2 Sep 2025 13:09:44 +0100
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <20250902120944.GJ2163762@google.com>
References: <20250808213143.146732-1-linux@timmermann.space>
 <20250808213143.146732-3-linux@timmermann.space>
 <20250902075037.GA2163762@google.com>
 <886ea017-7b40-43e8-a366-9e890b10c0f8@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <886ea017-7b40-43e8-a366-9e890b10c0f8@timmermann.space>

On Tue, 02 Sep 2025, Lukas Timmermann wrote:

> On Tue, 02 Sep 2025, Lee Jones wrote:> On Fri, 08 Aug 2025, Lukas Timmermann
> wrote:
> > 
> > > Since there were no existing drivers for the AS3668 or related devices,
> > > a new driver was introduced in a separate file. Similar devices were
> > > reviewed, but none shared enough characteristics to justify code reuse.
> > > As a result, this driver is written specifically for the AS3668.
> > > 
> > > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > > ---
> > >   MAINTAINERS                |   1 +
> > >   drivers/leds/Kconfig       |  13 +++
> > >   drivers/leds/Makefile      |   1 +
> > >   drivers/leds/leds-as3668.c | 202 +++++++++++++++++++++++++++++++++++++
> > >   4 files changed, 217 insertions(+)
> > >   create mode 100644 drivers/leds/leds-as3668.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 091206c54c63..945d78fef380 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
> > >   L:	linux-leds@vger.kernel.org
> > >   S:	Maintained
> > >   F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
> > > +F:	drivers/leds/leds-as3668.c
> > >   ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
> > >   M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index a104cbb0a001..8cfb423ddf82 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -100,6 +100,19 @@ config LEDS_ARIEL
> > >   	  Say Y to if your machine is a Dell Wyse 3020 thin client.
> > > +config LEDS_AS3668
> > > +	tristate "LED support for AMS AS3668"
> > > +	depends on LEDS_CLASS
> > > +	depends on I2C
> > > +	help
> > > +	  This option enables support for the AMS AS3668 LED controller.
> > > +	  The AS3668 provides up to four LED channels and is controlled via
> > > +	  the I2C bus. This driver offers basic brightness control for each
> > > +	  channel, without support for blinking or other advanced features.
> > > +
> > > +	  To compile this driver as a module, choose M here: the module
> > > +	  will be called leds-as3668.
> > > +
> > >   config LEDS_AW200XX
> > >   	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
> > >   	depends on LEDS_CLASS
> > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > index 2f170d69dcbf..983811384fec 100644
> > > --- a/drivers/leds/Makefile
> > > +++ b/drivers/leds/Makefile
> > > @@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
> > >   obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
> > >   obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
> > >   obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
> > > +obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
> > >   obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
> > >   obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
> > >   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> > > diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
> > > new file mode 100644
> > > index 000000000000..0cfd3b68f90c
> > > --- /dev/null
> > > +++ b/drivers/leds/leds-as3668.c
> > > @@ -0,0 +1,202 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + *  Osram AMS AS3668 LED Driver IC
> > > + *
> > > + *  Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/module.h>
> > > +#include <linux/uleds.h>
> > > +
> > > +#define AS3668_MAX_LEDS 4
> > > +#define AS3668_EXPECTED_I2C_ADDR 0x42
> > > +
> > > +/* Chip Ident */
> > > +
> > > +#define AS3668_CHIP_ID1_REG 0x3e
> > 
> > Can you tab out all of the values please.
> > 
> > > +#define AS3668_CHIP_ID2_REG 0x3f
> > > +#define AS3668_CHIP_ID1_EXPECTED_IDENTIFIER 0xa5
> > 
> > This is odd.  What do you mean by expected?
> > 
> > What kind of ID is this?  Board ID, platform ID, Chip ID?
> > 
> > Call it that instead.
> Calling it just AS3668_CHIP_ID1 then?
> It's the identifier of the chip model burned into silicon in the CHIP_ID1
> register. Checking it isn't critical in the first place.
> It catches errors made in DT files but nothing else. You haven't commented
> about that so i guess it's okay. Are drivers in the led subsystem supposed
> to check that?>

CHIP_ID1 is the register, but what does the number signify?

What version of the chip?  Does the chip have a name?

What's the difference between the values in ID1 and ID2?

> > > +#define AS3668_CHIP_ID2_SERIAL_MASK GENMASK(7, 4)
> > > +#define AS3668_CHIP_ID2_REV_MASK GENMASK(3, 0)
> > > +
> > > +/* Current Control */
> > > +
> > 
> > The X thing (below) is weirding me out.
> > 
> > > +#define AS3668_CURRX_CONTROL_REG 0x01
> > 
> > Drop the X.
> The datasheet explictly calls this "CurrX control". It configures the
> outputs for different modes like off/on and pwm or pattern generation for
> all four channels simultaneously.
> I could imagine AS3668_MODE_REG being more descriptive but we would diverge
> from the datasheet. Is that acceptable?>

It is if you say it is.  Some authors like to stick to the datasheet,
which I would respect.  Others think that datasheet authors / register
namers are bonkers and the S/W should be much more friendly to readers.

-- 
Lee Jones [李琼斯]

