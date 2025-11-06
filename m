Return-Path: <linux-leds+bounces-6020-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62030C396E7
	for <lists+linux-leds@lfdr.de>; Thu, 06 Nov 2025 08:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B27623B1403
	for <lists+linux-leds@lfdr.de>; Thu,  6 Nov 2025 07:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272B02E173D;
	Thu,  6 Nov 2025 07:43:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4BA2E0B6D
	for <linux-leds@vger.kernel.org>; Thu,  6 Nov 2025 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415032; cv=none; b=a+euAwaW8HdAUei4zjet/vY2rbTiAVaO1xYUY7yzRbKSzGN6eRBxculK0k8yl7SrTblwWHwsYQ6Jlb0d3b6nVJHPH00ol9ET3kuXLcoSDEZ3iaWrZViavcLE41PZ2pRk0GmmwhvcbkGr2/8cUUhvfvERyVZyjNXKYmDgTG8Az9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415032; c=relaxed/simple;
	bh=HEYW/yaqWZRZaZUlOkhPnuCY9Q72gDExuKNZMsprvw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VnE2AZ/j6q3vgqRmF325cxLv1GqIeqkEMQAS3/dFDtgMsV7xmSwEc3Le+a6MrLvVNqNoTcp60np3zLL29E9uE2qWPg7pHWCSdX7iopjY3qzVNoRF8Dmx9yK8m6dKEEg+2aaufC7z1FRTdmBnciMu57cufJrwEQoM4gFBxf+0o0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vGuel-00017f-7R; Thu, 06 Nov 2025 08:43:43 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>,  Pavel Machek <pavel@ucw.cz>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Steffen Trumtrar <kernel@pengutronix.de>,
  Pavel Machek <pavel@kernel.org>,  Mark Brown <broonie@kernel.org>,
  linux-leds@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] leds: add support for TI LP5860 LED driver chip
In-Reply-To: <5d8ec4c3-1b36-470b-a1c7-629060a154ce@gmail.com> (Jacek
	Anaszewski's message of "Sat, 11 Oct 2025 15:09:05 +0200")
References: <20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de>
	<20250911-v6-14-topic-ti-lp5860-v3-2-390738ef9d71@pengutronix.de>
	<20250916153412.GA3837873@google.com> <875xd0jslv.fsf@pengutronix.de>
	<5d8ec4c3-1b36-470b-a1c7-629060a154ce@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Thu, 06 Nov 2025 08:43:42 +0100
Message-ID: <87ldkjip1t.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org


Hi Jacek,

On 2025-10-11 at 15:09 +02, Jacek Anaszewski <jacek.anaszewski@gmail.com> w=
rote:

> Hi Steffen
>=20
> On 9/30/25 09:40, Steffen Trumtrar wrote:
> > Hi,
> > On 2025-09-16 at 16:34 +01, Lee Jones <lee@kernel.org> wrote:
> >=20
> >> > +#include <linux/gpio.h>
> >> > +#include <linux/led-class-multicolor.h>
> >> > +#include <linux/module.h>
> >> > +#include <linux/of_gpio.h>
> >> > +#include <linux/of_platform.h>
> >> > +#include <linux/regmap.h>
> >> > +
> >> > +#include <linux/platform_data/leds-lp5860.h>
> >> > +
> >> > +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc
> >> *mc_cdev)
> >> > +{
> >> > +=C2=A0=C2=A0=C2=A0 return container_of(mc_cdev, struct lp5860_led, =
mc_cdev);
> >> > +}
> >> > +
> >> > +LP5860_SHOW_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET,
> >> LP5860_CC_GROUP_MASK, 0)
> >> > +LP5860_STORE_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET,
> >> LP5860_CC_GROUP_MASK, 0)
> >> > +DEVICE_ATTR_RW(r_global_brightness_set);
> >>
> >> How is this different to /sys/class/leds/<led>/multi_intensity?
> >>
> >> # echo 43 226 138 > /sys/class/leds/multicolor:status/multi_intensity
> >> red -
> >> =C2=A0=C2=A0=C2=A0 intensity =3D 138
> >> =C2=A0=C2=A0=C2=A0 max_brightness =3D 255
> >> green -
> >> =C2=A0=C2=A0=C2=A0 intensity =3D 43
> >> =C2=A0=C2=A0=C2=A0 max_brightness =3D 255
> >> blue -
> >> =C2=A0=C2=A0=C2=A0 intensity =3D 226
> >> =C2=A0=C2=A0=C2=A0 max_brightness =3D 255
> >>
> > the LP5860 has a register for setting the maximal brightness that holds=
 for
> > all LEDs in the matrix. multi_intensity and max_brightness is only for =
that
> > one multicolor LED, right? And I can only manipulate the max_brightness=
 of
> > that one multicolor LED instance.
> > If I'm wrong, I'd be happy to not have to add the sysfs files.
>=20
> It seems that this device is similar in the aspect of LED grouping
> to LP50xx family. There is already a driver for that one [0] with
> related bindings. Grouping solution could be addressed similarly to the
> banking mechanism in that driver.
>
> That of course means that this patch needs a significant rework.
>=20
> First thing that strikes me after analyzing datasheet is that
> LEDs are not assigned to any group since LP5860_REG_GRP_SEL_START
> address is not referenced anywhere, and this is base address for
> Dot_grp_selN registers that enable affiliation of the LED to given
> group. No need for global brightness setting then.
>

The (now called) global_brightness sets the current of the three color grou=
ps respectively. These groups have a fixed mapping:

Group 1 is CS0, CS3, CS6,...
Group 2 is CS1, CS4, CS7,...
Group 3 is CS2, CS5, CS8,...

therefore setting the R, G and B channel. No need to assign any groups for =
that.

> Anyway, I'd add proper support for this device with DT knobs
> to enable both grouping and individual approach to controlling the LEDs.
>=20

As far as I can tell, both drivers are pretty similar already regarding the=
 DT description and setup.

I will just remove the global_brightness (aka global current in the datashe=
et) stuff, as I don't see that it is really, really needed alas the chip su=
pports this feature and just use the intensity and max_brightness knobs tha=
t are already there via the multicolor classdev.


Best regards,
Steffen

--=20
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

