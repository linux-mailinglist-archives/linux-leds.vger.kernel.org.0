Return-Path: <linux-leds+bounces-8360-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB3xNIRYGWqtvggAu9opvQ
	(envelope-from <linux-leds+bounces-8360-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:12:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E585B5FFBE5
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DAB43057EAA
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2CA3BBA04;
	Fri, 29 May 2026 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1KsMRvl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C433AFAEA;
	Fri, 29 May 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045713; cv=none; b=uwjWYFkW8VD8N4QajlV/yS50vBvqLVFPoDbDtVXDXGZmr1zIx0mcQpIFkbAvWGy1WHpSD05nBXCfpiO35pf6M5M/CNnMGIywWYtBFIwnLmV7/ZUhe78TXr2Ghgs6jxRZy72GzgssCWbm1qllYAUvRnqgr6j6bZ5IO1HZIwxCFqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045713; c=relaxed/simple;
	bh=pRg9Vtd183dHhOU3Ypb1ilDIzo7KsV7UFoQRfmBll5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIRwnAXtVZZ87ZU5hvzzGQBkAvpbrP42HFwclIt5wYjPXs/u7YUngOuoFIx7UPaINuwzevaGrhutPG7YwtXv+IE6+MwgeDT9MWcPsiiLotueoyfZ9UBwdJ1fc971vNLhOL6C5SeJipL2FPzMGele4WKNskHIMab1CHPHgeyTspE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1KsMRvl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55181F00893;
	Fri, 29 May 2026 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780045711;
	bh=SJhCBNK1z06eHdQUaoXs+yc4q80tlftXqJh3f219zPs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=X1KsMRvlEDqxH6HNt/sLZgqvC6pDIHPcOnX3zD0c2VF1uncQ83dO7ICSK4kHtlu6y
	 txTfvgvkcC5u4WQ3Ic2CcKYtM2Vt5r+5HVL+gbsCV/AOXWpv6WgQEdkmnAARpTqMrZ
	 0knmKymZLqVmnD5eJWszccrsioEQX5Tnf+S7y759DKhWLq/2pjPTlGrfUw32OTGqC7
	 x0BKMy7E/SnaQ8nvlkNq3mGvcMKOwdDwHw8yDYCVt8gBjRm6IhIhFkCJjQ1Z6bUBjq
	 5vpfX8fdsIezybD6WxANkb0tYH1L1r4NuCiBjv4AwrEjJxapFBlYQz1bZfyrulY3Yh
	 EsxthgMwu0iAw==
Date: Fri, 29 May 2026 10:08:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
Message-ID: <20260529100819.1823ebb3@jic23-huawei>
In-Reply-To: <CAPVz0n0qCekQVGGyAyBuYv+RKC6bpydYBLJNGfPrgTYjtOJOuA@mail.gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
	<20260528135123.103745-3-clamor95@gmail.com>
	<20260528155001.2bcb7003@jic23-huawei>
	<CAPVz0n0qCekQVGGyAyBuYv+RKC6bpydYBLJNGfPrgTYjtOJOuA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8360-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E585B5FFBE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 18:03:31 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17=
:50 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, 28 May 2026 16:51:19 +0300
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > Since there are no users of this driver via platform data, remove the
> > > platform data support and switch to using Device Tree bindings.
> > > Additionally, optimize functions used only by platform data. =20
> >
> >
> > At least the IIO ones would have made much the same amount of sense for
> > dt, just that they weren't having in the first place. I'd prefer that

Gah. I write gibberish after too much reviewing.  having/helping!

> > as a precursor patch to make the rest much more readable.
> > =20
>=20
> I can add you preferences into this commit, I don't mind.
>=20
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com> =20
> >
> > I only looked in detail at the iio bit. A few changes requested.
> > =20
> > > ---
> > >  drivers/iio/light/lm3533-als.c      |  95 ++++------
> > >  drivers/leds/leds-lm3533.c          |  51 ++++--
> > >  drivers/mfd/lm3533-core.c           | 268 ++++++++++----------------=
--
> > >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> > >  include/linux/mfd/lm3533.h          |  51 +-----
> > >  5 files changed, 212 insertions(+), 305 deletions(-)
> > >
> > > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm353=
3-als.c
> > > index 99f0b903018c..cbd337b73bd9 100644
> > > --- a/drivers/iio/light/lm3533-als.c
> > > +++ b/drivers/iio/light/lm3533-als.c =20
> > =20
> > > @@ -714,59 +720,33 @@ static const struct attribute_group lm3533_als_=
attribute_group =3D {
> > >       .attrs =3D lm3533_als_attributes
> > >  };
> > >
> > > -static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pw=
m_mode)
> > > +static int lm3533_als_setup(struct lm3533_als *als)
> > >  {
> > > -     u8 mask =3D LM3533_ALS_INPUT_MODE_MASK;
> > > -     u8 val;
> > > +     struct device *dev =3D &als->pdev.dev;
> > >       int ret;
> > >
> > > -     if (pwm_mode)
> > > -             val =3D mask;     /* pwm input */
> > > -     else
> > > -             val =3D 0;        /* analog input */
> > > -
> > > -     ret =3D lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, ma=
sk);
> > > -     if (ret) {
> > > -             dev_err(&als->pdev->dev, "failed to set input mode %d\n=
",
> > > -                                                             pwm_mod=
e);
> > > -             return ret;
> > > -     }
> > > -
> > > -     return 0;
> > > -}
> > > -
> > > -static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
> > > -{
> > > -     int ret;
> > > -
> > > -     if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_=
MAX) {
> > > -             dev_err(&als->pdev->dev, "invalid resistor value\n");
> > > -             return -EINVAL;
> > > -     }
> > > -
> > > -     ret =3D lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SELEC=
T, val);
> > > -     if (ret) {
> > > -             dev_err(&als->pdev->dev, "failed to set resistor\n");
> > > -             return ret;
> > > -     }
> > > +     device_property_read_u32(dev, "ti,resistor-value-ohm",
> > > +                              &als->r_select); =20
> > Does this have a default?  If so the pattern we've recently be setting =
on for IIO
> > is
> >         if (device_property_present(dev, "ti,resistor-value-ohm"))
> >                 ret =3D device_property_read_u32();
> >                 if (ret) //corrupt property in some fashion
> >                         return ret;
> >         } else {
> >                 //set default
> >         }
> > If there is no default then check it unconditionally. =20
>=20
> default value is LM3533_ALS_RESISTOR_MIN and if no property is present
> clamp will ensure that als->r_select will be set to
> LM3533_ALS_RESISTOR_MIN

I don't see that default in the binding doc and relying in the 0 being clam=
ped
isn't particularly readable - I'd set it explicitly.


>=20
> > =20
> > >
> > > -     return 0;
> > > -}
> > > +     als->r_select =3D clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
> > > +                           LM3533_ALS_RESISTOR_MAX);
> > > +     als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
> > >
> > > -static int lm3533_als_setup(struct lm3533_als *als,
> > > -                         const struct lm3533_als_platform_data *pdat=
a)
> > > -{
> > > -     int ret;
> > > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode");
> > >
> > > -     ret =3D lm3533_als_set_input_mode(als, pdata->pwm_mode);
> > > +     ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->pwm_mod=
e ?
> > > +                         LM3533_ALS_INPUT_MODE_MASK : 0, =20
> >
> > That's ugly.  Better as
> >
> >         ret =3D lm3533_update(lm3533, LM3533_REG_ALS_CONF,
> >                             als->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK =
: 0,
> > =20
>=20
> Yes sure, just followed 80 char limit.
>=20
> > Though if there wasn't a layer hiding the regmap, it could just have be=
en
> >
> >         ret =3D regmap_assign_bits(lm3533->regmap, LM3533_REG_ALS_CONF,
> >                                  LM3533_ALS_INPUT_MODE_MASK, als->pwm_m=
ode);;
> >
> > which would have been nicer.
> >
> > I'm not particularly keen on the swashing of the helpers being in a pat=
ch

smashing.  (this definitely wasn't my best effort at English!)

> > that is about switching the binding type as feels largely unrelated.
> > Should really have been a precursor, easier to review patch.
> > =20
>=20
> Removing of lm3533_update layer is not the scope of this patchset.

Understood.  I'm fine with just the refactor you are doing brought out as a=
 precursor
patch.

>=20
> > =20
> > > +                         LM3533_ALS_INPUT_MODE_MASK);
> > >       if (ret)
> > > -             return ret;
> > > +             return dev_err_probe(dev, ret, "failed to set input mod=
e %d\n",
> > > +                                  als->pwm_mode);
> > >
> > >       /* ALS input is always high impedance in PWM-mode. */
> > > -     if (!pdata->pwm_mode) {
> > > -             ret =3D lm3533_als_set_resistor(als, pdata->r_select);
> > > +     if (!als->pwm_mode) {
> > > +             ret =3D lm3533_write(lm3533, LM3533_REG_ALS_RESISTOR_SE=
LECT,
> > > +                                (u8)als->r_select); =20
> >
> > Same applies here. Mostly an unrelated change as the only thing switchi=
ng that
> > is related to the patch is one parameter.
> > =20
>=20
> Removing of lm3533_write layer is not the scope of this patchset.
>=20
> > >               if (ret)
> > > -                     return ret;
> > > +                     return dev_err_probe(dev, ret, "failed to set r=
esistor\n");
> > >       }
> > >
> > >       return 0; =20
> > =20
> > > @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platform_dev=
ice *pdev)
> > >       indio_dev->channels =3D lm3533_als_channels;
> > >       indio_dev->num_channels =3D ARRAY_SIZE(lm3533_als_channels);
> > >       indio_dev->name =3D dev_name(&pdev->dev);
> > > -     iio_device_set_parent(indio_dev, pdev->dev.parent); =20
> >
> > I'm not sure why this was there in the first place.  Hence not sure if =
it
> > is safe to remove.
> > =20
>=20
> This is directly related to OF conversion. The iio_device_set_parent
> bound indio_dev to parent, and it causes problems with OF now since
> als output has its own node and binding it to parent if wrong. Same
> story for backlight and leds btw.

Is there any risk anyone was using the canonical path to get to the iio dev?
/sys/bus/platform/devices/..../iio\:deviceX
This is technically an ABI change be it a subtle one.


>=20
> > =20
> > > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > > index 45795f2a1042..d707d43d5526 100644
> > > --- a/drivers/leds/leds-lm3533.c
> > > +++ b/drivers/leds/leds-lm3533.c =20
> > =20
> > >
> > >       led->cb.dev =3D led->cdev.dev;
> > >
> > > -     ret =3D lm3533_led_setup(led, pdata);
> > > +     device_property_read_u32(&pdev->dev, "led-max-microamp",
> > > +                              &led->max_current); =20
> >
> > I'd prefer explicit setting of the default to be visible before this, or
> > the property_present pattern I mention in the IIO review above.
> > =20
>=20
> clamp will ensure that led->max_current will be set to
> LM3533_LED_MAX_CURRENT_MIN regardless if it it present

As above, I'd prefer it set explicitly.

>=20
> > > +     led->max_current =3D clamp(led->max_current, LM3533_LED_MAX_CUR=
RENT_MIN,
> > > +                              LM3533_LED_MAX_CURRENT_MAX); =20
> >
> > I didn't look any further (busy day!) =20
>=20


