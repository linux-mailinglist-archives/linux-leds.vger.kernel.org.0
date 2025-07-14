Return-Path: <linux-leds+bounces-5054-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE8B03985
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 10:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96EE27A19C4
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 08:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413022367AA;
	Mon, 14 Jul 2025 08:27:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C915B971
	for <linux-leds@vger.kernel.org>; Mon, 14 Jul 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481628; cv=none; b=TZzEnRftdMwcjmnVxcatt4wbdzwGmH2pa/SzzsdWzGx0XG61/Q7uFZzgjZmkdgNOTlgiAhpJsZl2VevTcOUoyaEEAsuMKa1ZV6I7mIk0wxz01+wnof4HPrSEu/UdtbVCvkBe9Sty2L76LLhccvZcxiOw1S4wf83aqigRpvjAogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481628; c=relaxed/simple;
	bh=5U4kczdmd9E4mud88LfTs+tfOT2xGrsrdTs5rNZ37ow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kQpL42kroyGP8VWIW0Agj5zNMxa09KspqWareVwR8d+7Wkzm/s7a8/v1xD3XWYpSuwVwpzLVEKg6CY2sYlw2jf8MGjcYNxh9VIFGAyBIxvRl5Lo1TUts55wHGM2hFn28eikRks/oL9niG/1WSdha8RSEqoAdGUpZCAh4xsN6d7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1ubEWT-0003P6-9X; Mon, 14 Jul 2025 10:26:53 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Steffen Trumtrar <kernel@pengutronix.de>,  Pavel Machek
 <pavel@kernel.org>,  linux-leds@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] leds: add support for TI LP5860 LED driver chip
In-Reply-To: <20250523102848.GE1378991@google.com> (Lee Jones's message of
	"Fri, 23 May 2025 11:28:48 +0100")
References: <20250514-v6-14-topic-ti-lp5860-v2-0-72ecc8fa4ad7@pengutronix.de>
	<20250514-v6-14-topic-ti-lp5860-v2-2-72ecc8fa4ad7@pengutronix.de>
	<20250523102848.GE1378991@google.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 14 Jul 2025 10:26:52 +0200
Message-ID: <877c0bqisz.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org


Hi,

On 2025-05-23 at 11:28 +01, Lee Jones <lee@kernel.org> wrote:

> On Wed, 14 May 2025, Steffen Trumtrar wrote:
> 
> > Add support for the Texas Instruments LP5860 LED driver chip
> > via SPI interfaces.
> > 
> > The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> > short and open detection of the individual channel select lines.
> > 
> > The original driver is from an unknown author at Texas Instruments. Only
> > the cryptic handle 'zlzx' is known.
> > 
> > Co-developed-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  Documentation/ABI/testing/sysfs-class-spi-lp5860 |  23 ++
> >  drivers/leds/Kconfig                             |  23 ++
> >  drivers/leds/Makefile                            |   2 +
> >  drivers/leds/leds-lp5860-core.c                  | 276 ++++++++++++++++++++
> >  drivers/leds/leds-lp5860-spi.c                   |  99 +++++++
> 
> Are you going to follow-up with another option?  Say I2C?

the chip also supports connection via I2C, but it's unlikely that I will add that myself.

> >  drivers/leds/leds-lp5860.h                       | 315 +++++++++++++++++++++++
> >  6 files changed, 738 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> 
> This doesn't belong here.
> 
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d24b49d38ecae55f1a1a4e465fbe71d30eff497e
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> > @@ -0,0 +1,23 @@
> > +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/b_current_set
> 
> Why would you want to change the current of the SPI bus?
>

Where does it belong? I grepped and followed the eeprom (Documentation/ABI/testing/sysfs-class-spi-eeprom) which uses sernum in the same way. Directions welcome.

> 
> > +Date:           May 2025
> > +KernelVersion:  6.15
> > +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> > +Description:
> > +	Contains and sets the current for the B color group.
> 
> What does the current set?  Brightness?
> 
> If so, the user shouldn't be expected to know what current set in order
> to obtain a specific brightness.  Instead, shouldn't you use
> /sys/class/leds/<led>/multi_intensity and let the driver deal with the
> particulars of setting that brightness?
>

The chip has a global setting for the current of the three color groups. And an indiviual setting for every LED itself. The multi_intensity is for one LED as far as I understand. And the brightness of the whole matrix can be controlled via this global current setting.


(...)

Thanks for the rest of the feedback. I already addressed all of that in my patches, but I'm not sure what is the correct way to proceed with the sysfs ABI entries.


Thanks,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

