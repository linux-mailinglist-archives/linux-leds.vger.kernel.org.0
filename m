Return-Path: <linux-leds+bounces-7990-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIkqNB5++WmZ9AIAu9opvQ
	(envelope-from <linux-leds+bounces-7990-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 07:20:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 575114C6D38
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 07:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9425303608C
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 05:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251473C0604;
	Tue,  5 May 2026 05:16:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623663B6C16
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958212; cv=none; b=oN53pAVCEywJ2sfHRab2vv+GnImJbXR+E4lFCuZNahfyDJHamuwY78hJjOkjXttPt3tI1S7+fwbSOrkoyTO+P4kQeB3qslUmsX86U2cVtII30n6O2jS67MDtSLaX5AQChiQdajVr57EXhjOwstkiHvJSeC0H3hA4q9Y0MI5Alw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958212; c=relaxed/simple;
	bh=9aVXjpEN1EsDzBkG0rzh6qG0mYi2nsBKUor+T138jNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NgtBAXY7RRn6Z7KDiSd96qDB2k+FxAV1cZTQ3SgvsgxzHlZAwk38K5m2/xattpa9Bw1ajKFBAKbYLHbIDvmfVz/SdBwOEwgWS5WM4vzPeiS+gxpYokuPHEhYKpM4eBqJFV6BrS2SqLbBBFvg9g6IACNCuizACj35AxY0WQ2MGyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wK89G-0006ZA-I1; Tue, 05 May 2026 07:16:46 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>,  Lee Jones <lee@kernel.org>,  Pavel
 Machek <pavel@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-leds@vger.kernel.org
Subject: Re: [PATCH v9] leds: add support for TI LP5860 LED driver chip
In-Reply-To: <1b418b30-7b28-4559-9808-7a68132c273a@gmail.com> (Jacek
	Anaszewski's message of "Mon, 4 May 2026 21:33:45 +0200")
References: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
	<aae0901b-ebfd-4d40-9880-116b881c9a90@gmail.com>
	<87zf2gqrsv.fsf@pengutronix.de>
	<1b418b30-7b28-4559-9808-7a68132c273a@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Tue, 05 May 2026 07:16:45 +0200
Message-ID: <87cxzabflu.fsf@pengutronix.de>
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
X-Rspamd-Queue-Id: 575114C6D38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7990-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:url,pengutronix.de:mid,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 2026-05-04 at 21:33 +02, Jacek Anaszewski <jacek.anaszewski@gmail.com> w=
rote:

Hi,

> On 5/3/26 8:19 PM, Steffen Trumtrar wrote:
> > On 2026-04-26 at 14:41 +02, Jacek Anaszewski <jacek.anaszewski@gmail.co=
m>
> > wrote:
> > Hi,
> >=20
> >> Hi Steffen,
> >>
> >> On 4/24/26 3:28 PM, Steffen Trumtrar wrote:
> >> > Add support for the Texas Instruments LP5860 LED driver chip
> >> > via SPI interfaces.
> >> > The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> >> > short and open detection of the individual channel select lines.
> >> > It can be connected to SPI or I2C bus. For now add support for SPI o=
nly.
> >> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> >> > ---
> >> [...]
> >> > diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/
> >> leds-lp5860-core.c
> >> > new file mode 100644
> >> > index 0000000000000..648bf168f94bf
> >> > --- /dev/null
> >> > +++ b/drivers/leds/rgb/leds-lp5860-core.c
> >> > @@ -0,0 +1,231 @@
> >> > +// SPDX-License-Identifier: GPL-2.0-only
> >> > +/*
> >> > + * Copyright (c) 2025 Pengutronix
> >> > + *
> >> > + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> >> > + */
> >> > +
> >> > +#include <linux/led-class-multicolor.h>
> >> > +#include <linux/module.h>
> >> > +#include <linux/of_platform.h>
> >> > +#include <linux/property.h>
> >> > +#include <linux/regmap.h>
> >> > +
> >> > +#include "leds-lp5860.h"
> >> > +
> >> > +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc
> >> *mc_cdev)
> >> > +{
> >> > +=C2=A0=C2=A0=C2=A0 return container_of(mc_cdev, struct lp5860_led, =
mc_cdev);
> >> > +}
> >> > +
> >> > +static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned in=
t dot,
> >> bool enable)
> >> > +{
> >> > +=C2=A0=C2=A0=C2=A0 unsigned int offset =3D dot / LP5860_MAX_DOT_ONO=
FF_GROUP_NUM;
> >> > +=C2=A0=C2=A0=C2=A0 unsigned int mask =3D BIT(dot % LP5860_MAX_DOT_O=
NOFF_GROUP_NUM);
> >> > +
> >> > +=C2=A0=C2=A0=C2=A0 if (dot > LP5860_MAX_LED)
> >> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> >> > +
> >> > +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(led->chip->regmap,
> >> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LP5860_REG_DOT_ONOFF_START + offset, m=
ask,
> >> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enable ? LP5860_DOT_ALL_ON : LP5860_DO=
T_ALL_OFF);
> >> > +}
> >> > +
> >> > +static int lp5860_set_mc_brightness(struct led_classdev *cdev,
> >> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum led_brightness bright=
ness)
> >> > +{
> >> > +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *mc_cdev =3D lcdev_to_mcc=
dev(cdev);
> >> > +=C2=A0=C2=A0=C2=A0 struct lp5860_led *led =3D mcled_cdev_to_led(mc_=
cdev);
> >>
> >> You need mutex locking while accessing hw to avoid leaving the
> >> device in an inconsistent state in case of two parallel requests from
> >> different processes.
> >>
> > The hw is only accessed via regmap. It handles locking AFAIK or do I
> > misunderstand you?
>=20
>=20
> You're calling regmap_write() per subLED, so internal regmap
> locking has nothing to do with synchronizing the state of multicolor
> LED. It is possible that another Process2 jumps in while Process1
> has already written two subLEDs. Let's say that there are two
> parallel calls, where Process2 has greater priority:
>=20
> Process1:
> echo "10 20 30" > multi_intensity
> Process2:
> echo "40 50 60" > multi_intensity
>=20
> Process1:
> 	regmap_write subLED 1 10
> 	regmap_write subLED 2 20
> Process2:
> 	regmap_write subLED 1 40
> 	regmap_write subLED 2 50
> 	regmap_write subLED 3 60
> Process1:
> 	regmap_write subLED 3 30
>=20=09
>=20
> Which leaves the multicolor LED registers in the state:
>=20
> subLED1: 40
> subLED2: 50
> subLED3: 30

Okay, got it. Makes sense.


Thanks,
Steffen

--=20
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

