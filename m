Return-Path: <linux-leds+bounces-8441-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 79AXO7bmHmqkYwAAu9opvQ
	(envelope-from <linux-leds+bounces-8441-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:20:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762062F406
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 16:20:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WSHxf1Hd;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8441-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8441-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68FBA301570B
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 14:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF82B3EAC84;
	Tue,  2 Jun 2026 14:20:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B273EA96A;
	Tue,  2 Jun 2026 14:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410026; cv=none; b=h0c+Tki4b50c8zoEF9jfxCC+AYb8uT5DhXn2hKveBmOrvJnT9tZLG0AlgE4FHWokjIlRkCGarD5VanDr9+6YtAiBKluKNOQPNm9XoAlqFRCJ1WXSknOEvipf9T0KW8LQiPCID4620/Gs4OXEtO9JNqRQZgCfnOW0tafXAC2HncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410026; c=relaxed/simple;
	bh=9rDtsXXKFDhxJhPZeuQxWPpJbhWfBgjp1ERCAd1KBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjZJRMy47IPs0ZKTAO8K5/MBT5PaJuPlv+7oAx45Mx//Md86x/o7TVIGUmZjsMUk/FpCW6C2aj2AFTqwGHI6hQy71kiz583EohvqmDmhieuIsulvBnm2xerIlnxwaGxLURi1esYnIoCnjX5kutQghRaEFJX++ZOePyiwOPjH9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSHxf1Hd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1D31F00893;
	Tue,  2 Jun 2026 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780410025;
	bh=FmC/mmtPl+X+5WW3o/Y0mwOQvp51tqVNEKXkocyeBOM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WSHxf1Hd2bL0CsFQvLOVSWWlGmLcU+JWcWyL5aQieYjxwUjRwLzU43zySrBlWxLlr
	 tnw/9VSZsUCXAy7qpooYK2Z6mf3h1BbEfambt4Fk7MbPfVstPZ99nu/HzRiXNz1HU9
	 juOLR+BjAiANMHpm4TtgsbgoCFlXjc/8aGa6Sp21+kHEsaoe+5mwri8fwYLp/L3pF/
	 832ucoPYpx2hdMpmkCe2lTUiNCqzwXy6nd7w0k1Z/4UsViwpYVV0Y1ANLsDQMG16gp
	 FRHyLMHody7ddV3pikAWtYSiMNq8HSeS8/S0K66rnQ5xllWhERBIg9wx88zMSesXbd
	 S76PTKD45Mq2A==
Date: Tue, 2 Jun 2026 15:20:19 +0100
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
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
Message-ID: <20260602152019.078cc40e@jic23-huawei>
In-Reply-To: <CAPVz0n1r97d8-uzhPGBx0LFSp75A3_2mMXDQQ30utT-6NtpHNA@mail.gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
	<20260601151831.76350-6-clamor95@gmail.com>
	<20260602144640.433b4d35@jic23-huawei>
	<CAPVz0n1r97d8-uzhPGBx0LFSp75A3_2mMXDQQ30utT-6NtpHNA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8441-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7762062F406

On Tue, 2 Jun 2026 16:50:16 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:=
46 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon,  1 Jun 2026 18:18:25 +0300
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > Since there are no users of this driver via platform data, remove the
> > > platform data support and switch to using Device Tree bindings.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com> =20
> >
> > =20
> > > index 52136ca1abc9..55b35467a722 100644
> > > --- a/drivers/iio/light/lm3533-als.c
> > > +++ b/drivers/iio/light/lm3533-als.c
> > > @@ -16,16 +16,19 @@
> > >  #include <linux/module.h>
> > >  #include <linux/mutex.h>
> > >  #include <linux/mfd/core.h>
> > > +#include <linux/mod_devicetable.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/uaccess.h>
> > > +#include <linux/units.h>
> > >
> > >  #include <linux/mfd/lm3533.h>
> > >
> > >
> > > -#define LM3533_ALS_RESISTOR_MIN                      1
> > > -#define LM3533_ALS_RESISTOR_MAX                      127
> > > +#define LM3533_ALS_RESISTOR_MIN                      1575
> > > +#define LM3533_ALS_RESISTOR_MAX                      200000
> > >  #define LM3533_ALS_CHANNEL_CURRENT_MAX               2
> > >  #define LM3533_ALS_THRESH_MAX                        3
> > >  #define LM3533_ALS_ZONE_MAX                  4
> > > @@ -57,6 +60,9 @@ struct lm3533_als {
> > >
> > >       atomic_t zone;
> > >       struct mutex thresh_mutex;
> > > +
> > > +     bool pwm_mode;
> > > +     u32 r_select;
> > >  };
> > >
> > >
> > > @@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct devic=
e *dev,
> > >       int enable;
> > >       int ret;
> > >
> > > -     if (als->irq) {
> > > +     if (als->irq > 0) {
> > >               ret =3D lm3533_als_get_int_mode(indio_dev, &enable);
> > >               if (ret)
> > >                       return ret;
> > > @@ -716,30 +722,34 @@ static const struct attribute_group lm3533_als_=
attribute_group =3D {
> > >       .attrs =3D lm3533_als_attributes
> > >  };
> > >
> > > -static int lm3533_als_setup(struct lm3533_als *als,
> > > -                         const struct lm3533_als_platform_data *pdat=
a)
> > > +static int lm3533_als_setup(struct lm3533_als *als)
> > >  {
> > >       struct device *dev =3D &als->pdev->dev;
> > >       int ret;
> > >
> > > +     als->pwm_mode =3D device_property_read_bool(dev, "ti,pwm-mode");
> > > +
> > >       ret =3D regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_=
CONF,
> > >                                LM3533_ALS_INPUT_MODE_MASK,
> > > -                              pdata->pwm_mode ? LM3533_ALS_INPUT_MOD=
E_MASK : 0);
> > > +                              als->pwm_mode ? LM3533_ALS_INPUT_MODE_=
MASK : 0);
> > >       if (ret)
> > >               return dev_err_probe(dev, ret, "failed to set input mod=
e %d\n",
> > > -                                  pdata->pwm_mode);
> > > -
> > > +                                  als->pwm_mode);
> > >
> > >       /* ALS input is always high impedance in PWM-mode. */
> > > -     if (!pdata->pwm_mode) {
> > > -             if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
> > > -                 pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
> > > -                     dev_err(&als->pdev->dev, "invalid resistor valu=
e\n");
> > > -                     return -EINVAL;
> > > -             }
> > > +     if (!als->pwm_mode) {
> > > +             ret =3D device_property_read_u32(dev, "ti,resistor-valu=
e-ohms",
> > > +                                            &als->r_select);
> > > +             if (ret)
> > > +                     return dev_err_probe(dev, ret,
> > > +                                          "failed to ger resistor va=
lue\n");
> > > +
> > > +             als->r_select =3D clamp(als->r_select, LM3533_ALS_RESIS=
TOR_MIN,
> > > +                                   LM3533_ALS_RESISTOR_MAX); =20
> >
> > If we are getting garbage from DT I think I'd rather error out that pap=
er over
> > that problem.  So similar to before, check valid value and if not fail =
probe
> > so that hopefully someone goes and fixes it!
> > =20
>=20
> sure
>=20
> > > +             als->r_select =3D DIV_ROUND_UP(2 * MICRO, 10 * als->r_s=
elect); =20
> > Why do we need this when we didn't before?  The range checks are the sa=
me
> > so it smells like it shouldn't need transforming. I'd also rather we di=
dn't do
> > rewriting of the meaning of r_select like this.  Just use a local varia=
ble for
> > the intermediate result.
> > =20
>=20
> before pdata passed resistor value as actual register value, not we
> are getting the actual resistance in ohms from the tree and must
> convert it into register value.

ah. I missed the change of values.  Can you make them explicitly now _OHMS =
or something
along those lines rather than reusing the macro name for a different thing.

>=20
> > >
> > >               ret =3D regmap_write(als->lm3533->regmap, LM3533_REG_AL=
S_RESISTOR_SELECT,
> > > -                                pdata->r_select);
> > > +                                als->r_select);
> > >               if (ret)
> > >                       return dev_err_probe(dev, ret, "failed to set r=
esistor\n"); =20


