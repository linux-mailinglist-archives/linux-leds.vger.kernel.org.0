Return-Path: <linux-leds+bounces-5189-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B407B18E87
	for <lists+linux-leds@lfdr.de>; Sat,  2 Aug 2025 14:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36338189D349
	for <lists+linux-leds@lfdr.de>; Sat,  2 Aug 2025 12:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84BF223DDF;
	Sat,  2 Aug 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Pf34X4W2"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237B1A5B8F;
	Sat,  2 Aug 2025 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754138805; cv=none; b=HXGCi/975KYV4a/zeOi/gOz6HiL0/QDONYQRUi3hHaxMGmW7jvfLpVeq82TQpkpAN+cqpy8f88jzoo697oDL/U/o+LUBhzj2ub0NE8dQDCWaK/YBguTwqovOq/0ozSQ2Llkvb8gsRBcYxKhNFT1AGLNoW82d728QyKMKQc9E3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754138805; c=relaxed/simple;
	bh=XG8LN/Of0i5eLbBcN1HcqhYytjEbIueQe4Rn5eL/RI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLegwnSmaA/cgUe2Upd3h+DNwItx9BvgrYhg1dcIUVan8OsWdkCyuSkEsCAukN+jQtBOGYAGtoCSXHkKuQ+QFFcByAQzNfzrEzBz2SFHDaOafTRyBDXxia+vCDckzrGuh0be82mUXqTiEHgifHqOUDjGhCcq0is0SUUH0A3IbGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Pf34X4W2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kSNfUSp74FyJaHJRbGdN+mQ2PEFT+78FzemwN7KngM0=; b=Pf34X4W2X2MpX9iVczHWtXzr/w
	IKGfmg/N2V5fuvRF/V6P40GREFPtjtlhuwF8KcMJ1RXbiqYZyIAKl+xMx1t7OmicMoxnqHGisQpGP
	LVdVHPByJh6x5cI3xmuR/AW6y36eizvUdFxOBOYp3hQU7I+mBrcFDxSCIQMmCHQf9CwlpieI3aVo9
	i3M7sbHO5XScCxmgq4NIFadH7ATYT1z0d2hZYEVPfEIkDCi4pqdjXcwP+5jd4UMxKcVyWsC7RVzCF
	1UgrU3+jmJc0EzB3/Ti4cOhCNrL2TNkIZ5EJQDlfY2bWU8v+ag3Zjshs/D4guHheE5nAvIewkhOkm
	pnWqFlHQ==;
Received: from i53875b86.versanet.de ([83.135.91.134] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uiBdD-00032S-TQ; Sat, 02 Aug 2025 14:46:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] leds: qnap-mcu: add support for the red and green status leds
Date: Sat, 02 Aug 2025 14:46:33 +0200
Message-ID: <877072460.0ifERbkFSE@diego>
In-Reply-To: <20250731133913.GH1049189@google.com>
References:
 <20250730170507.1869905-1-heiko@sntech.de>
 <20250731133913.GH1049189@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 31. Juli 2025, 15:39:13 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Lee Jones:
> Subject: s/led/LED/

note to myself, looking at git log, this applies to the prose part of the
subject, the subsystem indicator seems to stay lower case, so make that

  leds: qnap-mcu: add support for the red and green status LEDs


> > There is one more set of two LEDs on the qnap devices to indicate statu=
s.
> >=20
> > One LED is green, the other is red and while they occupy the same space
> > on the front panel, they cannot be enabled at the same time.
> >=20
> > But they can interact via blink functions, the MCU can flash them
> > alternately, going red -> green -> red -> ... either in 500ms or
> > 1s intervals. They can of course also blink individually.
> >=20
> > Add specific led functions for them and register them on probe.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/leds/leds-qnap-mcu.c | 156 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 156 insertions(+)
> >=20
> > diff --git a/drivers/leds/leds-qnap-mcu.c b/drivers/leds/leds-qnap-mcu.c
> > index 4e4709456261..b7747b47c604 100644
> > --- a/drivers/leds/leds-qnap-mcu.c
> > +++ b/drivers/leds/leds-qnap-mcu.c
> > @@ -190,6 +190,157 @@ static int qnap_mcu_register_usb_led(struct devic=
e *dev, struct qnap_mcu *mcu)
> >  	return qnap_mcu_usb_led_set(&usb_led->cdev, 0);
> >  }
> > =20
> > +enum qnap_mcu_status_led_mode {
> > +	QNAP_MCU_STATUS_LED_OFF =3D 0,
> > +	QNAP_MCU_STATUS_LED_ON =3D 1,
> > +	QNAP_MCU_STATUS_LED_BLINK_FAST =3D 2, /* 500ms / 500ms */
> > +	QNAP_MCU_STATUS_LED_BLINK_SLOW =3D 3, /* 1s / 1s */
> > +};
> > +
> > +struct qnap_mcu_status;
>=20
> Forward declarations are a warning flag.
>=20
> How do all of the other drivers handle this?

I guess the question I debated a lot with is, is this one multi-color LED
or two single color LEDs, occupying the same area.

It is either the red _or_ green LED running, never both at the same time.

Similarly the HDD LEDs also occupy the same spaces with the amber
error-LED and the green activity LED. But those are completely distinct,
with the amber LED being controlled via the qnap-mcu and the green LED
getting controlled via a GPIO.

So for simplicity and consistency I opted for the two-LED approach, but
as you see in the resolver, need the target state of the "other" LED to
find a state to set.


But I think I found a different way to get from one LED to the other one
without a forward-declaration :-) .


> > +struct qnap_mcu_status_led {
> > +	struct qnap_mcu_status *base;
> > +	struct led_classdev cdev;
> > +	u8 mode;
> > +};
> > +
> > +struct qnap_mcu_status {
> > +	struct qnap_mcu *mcu;
> > +	struct qnap_mcu_status_led red;
> > +	struct qnap_mcu_status_led green;
> > +};
> >=20
> > +static inline struct qnap_mcu_status_led *
> > +		cdev_to_qnap_mcu_status_led(struct led_classdev *led_cdev)
>=20
> This is a strange place to break.

and with your 100 char request below, I realized that the break isn't
necessary at all, as it fits into exactly 100 chars :-)


Heiko



