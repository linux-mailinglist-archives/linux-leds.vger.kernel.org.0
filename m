Return-Path: <linux-leds+bounces-8035-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH55BOqj/Gl2SQAAu9opvQ
	(envelope-from <linux-leds+bounces-8035-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:38:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496E4EA52B
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA0C33051A89
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 14:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F94033F586;
	Thu,  7 May 2026 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6Z7kT9o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E93F9F39
	for <linux-leds@vger.kernel.org>; Thu,  7 May 2026 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164443; cv=pass; b=VSFK2s+rWygrWObRo26RZiVk4xpDKgBYMaEVw5kqk34TzTIytBkK4L5Pew3AweAPYrsaaPZh2i/d03OrvUTMH8eKeOtAp4wfXf3n6ewOGxpaqc8lubH0OTQ0ZrvrRtSwtHwPNarS2mI0/JbuKAvBlJHBS9S/XZeDVfT83+ERRV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164443; c=relaxed/simple;
	bh=u1RoMqrCifUqxpIYhbdTo9NMRGuk2Lp1KSko1AdSd+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DV4UUIluE8/F5uMBVFE/4lkoEgLEuyzoawZJCA7AfzCBU4B6PMAvfHEGGD/ks5eBF65wSMvQLnnQ4fa3e+J8ZPaH0zF7ksTNUFyuwImkabyn6l0s7Fu6DD09DQkeALhb9ZHkCxnvdw2b/Qu4WwiqzK6xoktBg8GJu+JY9psCGNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6Z7kT9o; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bc188a20e0aso124285566b.0
        for <linux-leds@vger.kernel.org>; Thu, 07 May 2026 07:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164440; cv=none;
        d=google.com; s=arc-20240605;
        b=L4/39my/XEHz9Sxs4ZX+tIt2ScPbyWHhSSBKYR7CXj1Yok+W/Spd8LQzvUJZO4qc5v
         JF5RI2zhOQFQP+4Tity7NogxmekyjhHYdSWJIrom5DO6ZKz+AQywxZnSzc0BHs0GgD3N
         Tx3/rLi7x0BEvZRZUuAMYQZiaieb0rhFMnFjNJ4pX+6kLYmDPRlkMvClihU49VFou9eC
         BVgc7hOyAOO5T9wKUiqYqYqJxPjhY12vuYKGkQGaPwTWeK0lVRVFXknuAc67UxABz7Wk
         VzX+EaE5JzulLnDJ36kAAX29XA+vJiNIddhqSbBLiKETyJDUYzKkT6i2maHw/p2Osk+4
         +BRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1jepCzwMkIZeDnwa1aRBtWHdYlax/7JMCPxbjOfylk=;
        fh=LadyoJgl5s5kyfiD+VmGoLeWS/5PXuaDlJ9LojUoWj8=;
        b=ccz56IT5JYR1NSPruawLqOSja3nkaWSMVtZkX8YLETJyUm4g1NH44dsJ7uEPHMNuLe
         EpXu6nSJpLlf70KnJGyNcL/5xpNCGg3l4dRZ5/E8XrqW/D5TNFThzwItdqJ6JorUfHXp
         8IYgbl2yk9YW2a9swU3KnTOYInB68O3GTT4P+a6qxqVB1w0AYXG+aNb+vBDBjBXtyReL
         E7mEe+/K3ZPClmvgVr2g66cPiVPcHe6BeW6v3e5T5HgrJNBwVLiEE50LUBsWzoeIXyOn
         wu+uj8pKg7QFyRkBryAm8wR22cdEJFWYWXGHDjUAbIr6VSwis3VNMXmPk1YKqicirPLc
         7njA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164440; x=1778769240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1jepCzwMkIZeDnwa1aRBtWHdYlax/7JMCPxbjOfylk=;
        b=Y6Z7kT9ohpb6jORn8neaYhgZWV54inR2dwp4RopEHw37S1cofsCc5MZjRPMd3uLxuf
         1RSUaFmJl6FlED9tr1d9ukt6HGDBKDf6VSvuHq760rPEoSP7t9oP551xPVknAAYsEI/W
         KctRLd8taj7GnqBACPVIE0Hz9MkCkjZq+590HdkLUyiB0PJYXlArAcbOC4sc2HN/5M7+
         ItjC7bz7+klM3sY693vGM52dbsATnZDKvLbuRSVrIZvwdDLNNw8D4+hyMQuomJyY10ku
         Rg1RvXoacdwB8l7chRi1g2WLlJ7OJaZynJskfkseC07LoIc2rjTCMAWxuzqa1bAIkgWm
         OX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164440; x=1778769240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1jepCzwMkIZeDnwa1aRBtWHdYlax/7JMCPxbjOfylk=;
        b=AjpnCqwHTSUL/NvSRh6CF0ClX8kT9cqE1zBh8ihOZpXQGspMLX85WHHT4t2oRJIMTy
         PgT8A8eDzwxdFxB3Qg8z+pzA9khchTDpP2zKjzR5kwaDrZJ+dwoyZTb2SLG+9e8WJg4i
         aWyim6lmB0hs9SU7PgPdKOCqbzWPwleNJNEsCvVtbwJr9s5J26c8QLaSJHt6mocoMXyT
         2VNA4XdVSuZ5JtvZmeIWdOnMJB88Gtr1zGxVoUBaJengnwaiVemXQMU9OV1uAEoxcyaZ
         xQgPL0LiPET89zR3o52j0qT1pEMb96EM0NX2AsA/dq6Aw1avAcaYqlvxqI+7ka9mhdQX
         TDWw==
X-Forwarded-Encrypted: i=1; AFNElJ/K5gvCleSdMHbFs/pxjKSouTqnx5sdlqG12LXZkDabxVOmvRcPAvqWy92ozuOjAD4zjdVgDQ9CbEfW@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8qRWPH1tGHVz2xMGfxfa3NJ+VqlqXDREzXnvAgY6E0IKQUtW
	eC747YQYUhcntqzYVVIptxxTwoEiOG7UuqJTvLGMXQbQpTKgHVdoAWp7zPCqhxXEMA6L5Mixc/j
	NRgS/8KPjD1+QKUxtDeugrQwd2rakIpU=
X-Gm-Gg: AeBDievL9J19LXkRPmlDUbuHMmeKxiQvoeQjH4JDPox//BEweGphv7+p69bA2j/Wl4j
	NpSWR6GFL81yP/QL5glNGZEtDrZpsoLgmqQO+yUrX+hVED6PeOPHBNe2r/YjlMlSG3+wo2pzAIl
	/YK5yYkDLYriI67AQS+8Chjy0/8LWPV5sA4RbB7RR/5SWJf8oEsURyH5md3ytvJS1VOWGzvpN+d
	8xPvEDTl2GhUb6Rv+ayRjxFjnRfMCsbDPIa2mC8SfYywZ7MIY58owbIyyFSV2bGIEBS0j6XtpfI
	BEYFdnYphWUTrftH02E=
X-Received: by 2002:a17:906:9fcc:b0:bb9:2893:6a45 with SMTP id
 a640c23a62f3a-bc56e906631mr486300766b.44.1778164438809; Thu, 07 May 2026
 07:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428153611.142816-1-clamor95@gmail.com> <20260428153611.142816-6-clamor95@gmail.com>
 <20260507140519.GO305027@google.com>
In-Reply-To: <20260507140519.GO305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 7 May 2026 17:33:45 +0300
X-Gm-Features: AVHnY4IIJylLLxrbhyYxwvVcYA-YQyJ94DnfAID32Woik6ktYzkOfwYToc1ejKg
Message-ID: <CAPVz0n1Ubvj9MHHMcM2BpxAcTCCheMihr3aJUqcDVoi_V0OQ5g@mail.gmail.com>
Subject: Re: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6496E4EA52B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8035-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=D1=87=D1=82, 7 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:05=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
>
> > MFD have rigid subdevice structure which does not allow flexible dynami=
c
> > subdevice linking. Address this by diverging CPCAP subdevice compositio=
n
> > to take into account board specific configuration.
> >
> > Create a common default subdevice composition, rename existing subdevic=
e
> > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > Mapphone board.
> >
> > Removed st,6556002 as it is no longer applicable to all cases and
> > duplicates motorola,cpcap, which is used as the default composition.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
>
> Changelog?
>

Changelog is in the cover.

> >  drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++-------
> >  1 file changed, 83 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.=
c
> > index d8243b956f87..516d1e33affa 100644
> > --- a/drivers/mfd/motorola-cpcap.c
> > +++ b/drivers/mfd/motorola-cpcap.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/sysfs.h>
> >
> > @@ -24,10 +25,16 @@
> >  #define CPCAP_REGISTER_SIZE  4
> >  #define CPCAP_REGISTER_BITS  16
> >
> > +struct cpcap_chip_data {
> > +     const struct mfd_cell *mfd_devices;
> > +     unsigned int num_devices;
> > +};
>
> This is a red flag.
>
> >  struct cpcap_ddata {
> >       struct spi_device *spi;
> >       struct regmap_irq *irqs;
> >       struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
> > +     const struct cpcap_chip_data *cdata;
> >       const struct regmap_config *regmap_conf;
> >       struct regmap *regmap;
> >  };
> > @@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpca=
p)
> >       return 0;
> >  }
> >
> > -static const struct of_device_id cpcap_of_match[] =3D {
> > -     { .compatible =3D "motorola,cpcap", },
> > -     { .compatible =3D "st,6556002", },
> > -     {},
> > -};
> > -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > -
> > -static const struct spi_device_id cpcap_spi_ids[] =3D {
> > -     { .name =3D "cpcap", },
> > -     { .name =3D "6556002", },
> > -     {},
> > -};
> > -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > -
> >  static const struct regmap_config cpcap_regmap_config =3D {
> >       .reg_bits =3D 16,
> >       .reg_stride =3D 4,
> > @@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
> >
> >  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume)=
;
> >
> > -static const struct mfd_cell cpcap_mfd_devices[] =3D {
> > +static const struct mfd_cell cpcap_default_mfd_devices[] =3D {
> > +     {
> > +             .name          =3D "cpcap_adc",
> > +             .of_compatible =3D "motorola,cpcap-adc",
> > +     }, {
> > +             .name          =3D "cpcap_battery",
> > +             .of_compatible =3D "motorola,cpcap-battery",
> > +     }, {
> > +             .name          =3D "cpcap-regulator",
> > +             .of_compatible =3D "motorola,cpcap-regulator",
> > +     }, {
> > +             .name          =3D "cpcap-rtc",
> > +             .of_compatible =3D "motorola,cpcap-rtc",
> > +     }, {
> > +             .name          =3D "cpcap-pwrbutton",
> > +             .of_compatible =3D "motorola,cpcap-pwrbutton",
> > +     }, {
> > +             .name          =3D "cpcap-usb-phy",
> > +             .of_compatible =3D "motorola,cpcap-usb-phy",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 0,
> > +             .of_compatible =3D "motorola,cpcap-led-red",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 1,
> > +             .of_compatible =3D "motorola,cpcap-led-green",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 2,
> > +             .of_compatible =3D "motorola,cpcap-led-blue",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 3,
> > +             .of_compatible =3D "motorola,cpcap-led-adl",
> > +     }, {
> > +             .name          =3D "cpcap-led",
> > +             .id            =3D 4,
> > +             .of_compatible =3D "motorola,cpcap-led-cp",
> > +     }, {
> > +             .name          =3D "cpcap-codec",
> > +     },
> > +};
> > +
> > +static const struct cpcap_chip_data cpcap_default_data =3D {
> > +     .mfd_devices =3D cpcap_default_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(cpcap_default_mfd_devices),
> > +};
> > +
> > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] =3D {
> >       {
> >               .name          =3D "cpcap_adc",
> >               .of_compatible =3D "motorola,mapphone-cpcap-adc",
> > @@ -285,7 +327,12 @@ static const struct mfd_cell cpcap_mfd_devices[] =
=3D {
> >               .of_compatible =3D "motorola,cpcap-led-cp",
> >       }, {
> >               .name          =3D "cpcap-codec",
> > -     }
> > +     },
> > +};
> > +
> > +static const struct cpcap_chip_data cpcap_mapphone_data =3D {
> > +     .mfd_devices =3D cpcap_mapphone_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices),
> >  };
> >
> >  static int cpcap_probe(struct spi_device *spi)
> > @@ -297,9 +344,17 @@ static int cpcap_probe(struct spi_device *spi)
> >       if (!cpcap)
> >               return -ENOMEM;
> >
> > +     cpcap->cdata =3D device_get_match_data(&spi->dev);
> > +     if (!cpcap->cdata)
> > +             return -ENODEV;
> > +
> >       cpcap->spi =3D spi;
> >       spi_set_drvdata(spi, cpcap);
> >
> > @@ -331,16 +382,24 @@ static int cpcap_probe(struct spi_device *spi)
> >       spi->dev.coherent_dma_mask =3D 0;
> >       spi->dev.dma_mask =3D &spi->dev.coherent_dma_mask;
> >
> > -     return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
> > -                                 ARRAY_SIZE(cpcap_mfd_devices), NULL, =
0, NULL);
> > +     return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_devic=
es,
> > +                                 cpcap->cdata->num_devices, NULL, 0, N=
ULL);
> >  }
> >
> > +static const struct of_device_id cpcap_of_match[] =3D {
> > +     { .compatible =3D "motorola,cpcap", .data =3D &cpcap_default_data=
 },
> > +     { .compatible =3D "motorola,mapphone-cpcap", .data =3D &cpcap_map=
phone_data },
>
> We don't allow data from one device registration API (MFD) to be passed
> through another (OF) because it tends to lead to all sorts of "creative
> solutions".  Pass a value instead and match on that in a switch()
> statement like all of the other MFD drivers do.
>

You don't allow this. I have not seen this enforced anywhere in the
kernel except the mfd subsystem. Fine, does not matter, if this makes
you happy I will adjust.

> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > +
> > +static const struct spi_device_id cpcap_spi_ids[] =3D {
> > +     { .name =3D "cpcap", .driver_data =3D (kernel_ulong_t)&cpcap_defa=
ult_data },
> > +     { .name =3D "mapphone-cpcap", .driver_data =3D (kernel_ulong_t)&c=
pcap_mapphone_data },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > +
> >  static struct spi_driver cpcap_driver =3D {
> >       .driver =3D {
> >               .name =3D "cpcap-core",
> > --
> > 2.51.0
> >
> >
>
> --
> Lee Jones

