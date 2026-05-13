Return-Path: <linux-leds+bounces-8093-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAmHFJGtBGoSNAIAu9opvQ
	(envelope-from <linux-leds+bounces-8093-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 18:57:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C65378BC
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 18:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F41D73036483
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA68F38887A;
	Wed, 13 May 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIZ9PX2m"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17300349CDA
	for <linux-leds@vger.kernel.org>; Wed, 13 May 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690861; cv=pass; b=gePl9iQdOSVg5A23ReP0Q59zzgFA895+tkpfyWK5eZ7iOqDTad6YBBo1CdR0L2334DtV0tE0IRntL+pKgxYQAZVjvXpaABNaT6lkDQqe1epqr2n8ONN1eZHkZd2bbmRjeLBGAUKTC8LaifVF9RDOP4CfdpYVLhsut/d5zLHFL4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690861; c=relaxed/simple;
	bh=ExnqDUkLINkKlD7+NygXVUJUo+YyZ6a9VvYiVKG7QhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCJBgHrrEcW5Jm4Uv9qCiT3awNDBpzrbP0S90aASaUF47qk8NR3/YWQS2s3QOS4CuNoQHG7NC8ljKPCEoKlpQ+6ZVp+dAR1c+xMW3fq/sl7NYLTI/mcCEukBs/OaWTooFEuSQ8BTDuWWLBUQgo0awY8Ql8ncv8ftqBS4I5P0YXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIZ9PX2m; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f30a4601bbso7602426eec.1
        for <linux-leds@vger.kernel.org>; Wed, 13 May 2026 09:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778690858; cv=none;
        d=google.com; s=arc-20240605;
        b=CSp6UYXllVgmxLKm66ei8/6q+f2y2VOraDKZ5plrgduDHIhtiFEjg78mnep+wHmFet
         u3/39K6xvyrZsM5e/IrEXtQykMIzsp+TLA5VqGTSmczzNyGFGlxHa6XPA2PB4Q67Tk9P
         xbWp9FVeh8pdrSJ39+zynj2q2jiOp2CCWGFwcdw448lhrI8d7tJkO++neeq/urHaz+Z0
         jCD/TVWNogd5+5L0levUC3BaIQP2fAxhBuYNE87dTXfJex4piAyCGe4otJMOqZVwgCe1
         W/QYsHBymA9ftKcdhV6o0KF97HzhzhM67aLpydx8/yWCVSrzEWTEAPlV1LADJoXSGi8q
         TTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JerA/KHdCfuyoaygNVbCtHqii4aEtRRNxbe67luduQk=;
        fh=TG3x8Fxm7dHx0wprE2ApFnSoBoSf4hahXJGS9KA3ljI=;
        b=SK2vS0oNdoGCELokvbB3xUmUrCXUmH+IHomCnwwpcM+TAVBoCmGDPdgOMt+BO37u6E
         XLZfrkSrGfRjG58AM++O5abJcKFKx8RzZzXD9vDH7HhV/aDS/ATxRoplQfUpXtXvMOgv
         gV0yURx8rhDZdj8Qt53Twsi1zf8JtyGHZJe3xCymrWghHpgnRM6IoZI/Bl1Pa/3W6x0X
         /xKa3MPA31yBBHzGyddVY+9PlKRxvNJrhtP2nRxb7aAnVS7fsCi4kvkCaPogjQ3ZUT4/
         3dZqdgBe4tw3xptIWWOo/SV1y0KVQjCwV2JuIFaGL4Jrv+JcLOTmkcs+1gL392wtBU4T
         e0gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778690858; x=1779295658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JerA/KHdCfuyoaygNVbCtHqii4aEtRRNxbe67luduQk=;
        b=lIZ9PX2m+1rVFo5ukZcGjeoyRdBnG2brHCNsvJn3YrWZ0eQ29u1kRVdRQ9/aLLPa9v
         efPhw0n2Fu2v8dULGYccwLniNlpdGlt9CWGx+JcstZ092nDRu3ecYoT60Yif/nC04Xf+
         U8FyuDL8Jg3wxdUVPP2AevdlFjvBulirFKO7dmcUJ0jXz4CMTyDrAwcvhza0b6DzpxKm
         9CvlWUHw+VcpNiEdNQyLQwXy+eVgZ6DU/5gLRhgwaJ303IsKIv0jTgY7TXtD3r44fAoI
         4CLU0R/YZHMxgbNXFvWiigsLLgjn7b5vwFUSHZMBfd50D9Qiwtq7zMYrPy+XF70jQo1R
         +4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690858; x=1779295658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JerA/KHdCfuyoaygNVbCtHqii4aEtRRNxbe67luduQk=;
        b=H2ED2UQIHrq63nGtUD4JOi6Fhvdd7PLfjQQ6mzOJwKM1WInG4B4le8pnfqQlIwQRR6
         vI8A9IBW3hwyRMg7Y+v+iGy/s3sZ/tedEASJ5BMalp6zvicTfdZBLAaFO5rsleZfNbzP
         eciXtTmPWYKdwrhrXcrEieVE6kDCFXcoHBVsaTTy631AYVy4CVz7chM7pxjQ2zBdspos
         uOIArTBpWmmXb2zTnHhsstQxZCQFsPEP5CK4VZeyfj0FDwbmGbEjUw5SSCdzT4bmPiXN
         EfKBguckQXpzgPElA/o3L5eV1P6upegiLxc9ho7BWImQ/wHDngO5Ved1MzP5X6TXVQB5
         viJw==
X-Forwarded-Encrypted: i=1; AFNElJ+Zzc59pgpH1GETesJi7oqYbdvXMREzYQd1BqxWIfQi6XoAD4VmFazUE451WGn/5hmhs6cJPRr0uDDX@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKbC2HjQjT+/PZC7/CRK0oHAKmANJGPKjS9JqiW3Ts9kfGD/Q
	at/y7so7n9UHm2rkGAi0evLR9liV86A1AX6Fja068QDz/r7dBES/IDMi7FanYZDNYXPPXMEHaTa
	Soex441SyZ2NlrLDqEvZugCmf87vT6vY=
X-Gm-Gg: Acq92OH0pVz8zSsIKGo2DmfyY+PMGlyIWmyAFgf7xg90yQ2z6c+pQJYfmvlPH7KWtz5
	nq7dQHUZsKSLGGUchAEcNpS0+UdpvXLWE3QfiuA4Fsx9a8y4ZqlbQDmfrbXzmrQiytq41LJSBLX
	T8L5/IlJ9GC7EDO1NwR3HrWhXEOyeCVlzThjB6/xi4VovZcwKy7LzfeplSXW6hmsEd4xbJ9SKMM
	dSwcVvDFwetDQumEJgYkEtJc/3LjpVxPFIMV2sxOk6H77myNOQmP5c4EfiJxAHM833gXBUm3+D1
	wq4WiPpX
X-Received: by 2002:a05:7300:a984:b0:2dd:5641:f01 with SMTP id
 5a478bee46e88-30155b4d27bmr1845952eec.28.1778690857870; Wed, 13 May 2026
 09:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428153611.142816-1-clamor95@gmail.com> <20260428153611.142816-6-clamor95@gmail.com>
 <20260507140519.GO305027@google.com> <CAPVz0n1Ubvj9MHHMcM2BpxAcTCCheMihr3aJUqcDVoi_V0OQ5g@mail.gmail.com>
 <20260513140550.GD305027@google.com>
In-Reply-To: <20260513140550.GD305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 13 May 2026 19:47:26 +0300
X-Gm-Features: AVHnY4L_UPed0nI0jqBJd7980GApXqp_CTeeRBwMRPJX6vgRQaMZTKXyU_fde7I
Message-ID: <CAPVz0n0ynA-ab1Frwy2vXsrYPm+SB+0oOoKAiHw9D7BT=+ieDQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EB6C65378BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8093-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D1=81=D1=80, 13 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:0=
5 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 07 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 7 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
7:05 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
> > >
> > > > MFD have rigid subdevice structure which does not allow flexible dy=
namic
> > > > subdevice linking. Address this by diverging CPCAP subdevice compos=
ition
> > > > to take into account board specific configuration.
> > > >
> > > > Create a common default subdevice composition, rename existing subd=
evice
> > > > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > > > Mapphone board.
> > > >
> > > > Removed st,6556002 as it is no longer applicable to all cases and
> > > > duplicates motorola,cpcap, which is used as the default composition=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > >
> > > Changelog?
> > >
> >
> > Changelog is in the cover.
> >
> > > >  drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++---=
----
> > > >  1 file changed, 83 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cp=
cap.c
> > > > index d8243b956f87..516d1e33affa 100644
> > > > --- a/drivers/mfd/motorola-cpcap.c
> > > > +++ b/drivers/mfd/motorola-cpcap.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/mod_devicetable.h>
> > > > +#include <linux/property.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/sysfs.h>
> > > >
> > > > @@ -24,10 +25,16 @@
> > > >  #define CPCAP_REGISTER_SIZE  4
> > > >  #define CPCAP_REGISTER_BITS  16
> > > >
> > > > +struct cpcap_chip_data {
> > > > +     const struct mfd_cell *mfd_devices;
> > > > +     unsigned int num_devices;
> > > > +};
> > >
> > > This is a red flag.
> > >
> > > >  struct cpcap_ddata {
> > > >       struct spi_device *spi;
> > > >       struct regmap_irq *irqs;
> > > >       struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
> > > > +     const struct cpcap_chip_data *cdata;
> > > >       const struct regmap_config *regmap_conf;
> > > >       struct regmap *regmap;
> > > >  };
> > > > @@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *=
cpcap)
> > > >       return 0;
> > > >  }
> > > >
> > > > -static const struct of_device_id cpcap_of_match[] =3D {
> > > > -     { .compatible =3D "motorola,cpcap", },
> > > > -     { .compatible =3D "st,6556002", },
> > > > -     {},
> > > > -};
> > > > -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > > > -
> > > > -static const struct spi_device_id cpcap_spi_ids[] =3D {
> > > > -     { .name =3D "cpcap", },
> > > > -     { .name =3D "6556002", },
> > > > -     {},
> > > > -};
> > > > -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > > > -
> > > >  static const struct regmap_config cpcap_regmap_config =3D {
> > > >       .reg_bits =3D 16,
> > > >       .reg_stride =3D 4,
> > > > @@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
> > > >
> > > >  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_res=
ume);
> > > >
> > > > -static const struct mfd_cell cpcap_mfd_devices[] =3D {
> > > > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > > > +     {
> > > > +             .name          =3D "cpcap_adc",
> > > > +             .of_compatible =3D "motorola,cpcap-adc",
> > > > +     }, {
> > > > +             .name          =3D "cpcap_battery",
> > > > +             .of_compatible =3D "motorola,cpcap-battery",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-regulator",
> > > > +             .of_compatible =3D "motorola,cpcap-regulator",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-rtc",
> > > > +             .of_compatible =3D "motorola,cpcap-rtc",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-pwrbutton",
> > > > +             .of_compatible =3D "motorola,cpcap-pwrbutton",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-usb-phy",
> > > > +             .of_compatible =3D "motorola,cpcap-usb-phy",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-led",
> > > > +             .id            =3D 0,
> > > > +             .of_compatible =3D "motorola,cpcap-led-red",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-led",
> > > > +             .id            =3D 1,
> > > > +             .of_compatible =3D "motorola,cpcap-led-green",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-led",
> > > > +             .id            =3D 2,
> > > > +             .of_compatible =3D "motorola,cpcap-led-blue",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-led",
> > > > +             .id            =3D 3,
> > > > +             .of_compatible =3D "motorola,cpcap-led-adl",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-led",
> > > > +             .id            =3D 4,
> > > > +             .of_compatible =3D "motorola,cpcap-led-cp",
> > > > +     }, {
> > > > +             .name          =3D "cpcap-codec",
> > > > +     },
> > > > +};
> > > > +
> > > > +static const struct cpcap_chip_data cpcap_default_data =3D {
> > > > +     .mfd_devices =3D cpcap_default_mfd_devices,
> > > > +     .num_devices =3D ARRAY_SIZE(cpcap_default_mfd_devices),
> > > > +};
> > > > +
> > > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D {
> > > >       {
> > > >               .name          =3D "cpcap_adc",
> > > >               .of_compatible =3D "motorola,mapphone-cpcap-adc",
> > > > @@ -285,7 +327,12 @@ static const struct mfd_cell cpcap_mfd_devices=
[] =3D {
> > > >               .of_compatible =3D "motorola,cpcap-led-cp",
> > > >       }, {
> > > >               .name          =3D "cpcap-codec",
> > > > -     }
> > > > +     },
> > > > +};
> > > > +
> > > > +static const struct cpcap_chip_data cpcap_mapphone_data =3D {
> > > > +     .mfd_devices =3D cpcap_mapphone_mfd_devices,
> > > > +     .num_devices =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices),
> > > >  };
> > > >
> > > >  static int cpcap_probe(struct spi_device *spi)
> > > > @@ -297,9 +344,17 @@ static int cpcap_probe(struct spi_device *spi)
> > > >       if (!cpcap)
> > > >               return -ENOMEM;
> > > >
> > > > +     cpcap->cdata =3D device_get_match_data(&spi->dev);
> > > > +     if (!cpcap->cdata)
> > > > +             return -ENODEV;
> > > > +
> > > >       cpcap->spi =3D spi;
> > > >       spi_set_drvdata(spi, cpcap);
> > > >
> > > > @@ -331,16 +382,24 @@ static int cpcap_probe(struct spi_device *spi=
)
> > > >       spi->dev.coherent_dma_mask =3D 0;
> > > >       spi->dev.dma_mask =3D &spi->dev.coherent_dma_mask;
> > > >
> > > > -     return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
> > > > -                                 ARRAY_SIZE(cpcap_mfd_devices), NU=
LL, 0, NULL);
> > > > +     return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_d=
evices,
> > > > +                                 cpcap->cdata->num_devices, NULL, =
0, NULL);
> > > >  }
> > > >
> > > > +static const struct of_device_id cpcap_of_match[] =3D {
> > > > +     { .compatible =3D "motorola,cpcap", .data =3D &cpcap_default_=
data },
> > > > +     { .compatible =3D "motorola,mapphone-cpcap", .data =3D &cpcap=
_mapphone_data },
> > >
> > > We don't allow data from one device registration API (MFD) to be pass=
ed
> > > through another (OF) because it tends to lead to all sorts of "creati=
ve
> > > solutions".  Pass a value instead and match on that in a switch()
> > > statement like all of the other MFD drivers do.
> > >
> >
> > You don't allow this. I have not seen this enforced anywhere in the
> > kernel except the mfd subsystem. Fine, does not matter, if this makes
> > you happy I will adjust.
>
> Where else would this rule be applicable?  I can't think of anywhere.
>

I have adjusted as you requested and already sent v5.

> --
> Lee Jones

