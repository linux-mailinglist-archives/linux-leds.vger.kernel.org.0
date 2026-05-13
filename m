Return-Path: <linux-leds+bounces-8089-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFSBAUuJBGoxLQIAu9opvQ
	(envelope-from <linux-leds+bounces-8089-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:23:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D368534F55
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 575AF3115C83
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 14:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3BE306744;
	Wed, 13 May 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXdyql+c"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AD21F872D;
	Wed, 13 May 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681156; cv=none; b=aqDMpWI0XvBC8w5zTG+CIaejYvj9f8L56Fyfg/OsvSPF2qZPwvhTwywBFTYwqFUniWj3Wir+GWzi0ICbhbPrIinM0+a13qtFGGCPz5l9CApTzEEo/3WrBILkFd364ybOhIcqYxSTxegloYt20Iua6MDzbmnFV9GUN+diiCzeJ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681156; c=relaxed/simple;
	bh=zRtBKcT3U26qME99MnyGrZwHZVs016YqqmbYeUEzis4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B41eGmL+asH85IeVvXC+9hNJYOcuahAOjsXRMMy+G/T2tNL2OR/xTmBSAF4e0JZwLoGllWj0ZSmAAtP5J9jR3Byp9Fk5aRN5e+N7sW5UqyMZ/zsujrztH97TxRLEFeZhmkNhL1HwaILji5E2bU3yOJ7n4q9fap8QVQ+cn9DMWqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXdyql+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8B5C19425;
	Wed, 13 May 2026 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778681155;
	bh=zRtBKcT3U26qME99MnyGrZwHZVs016YqqmbYeUEzis4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXdyql+ctDwjMZElPXfCgJbzmsxR3rdb51JTTDZmti36BYgvppUEEtcgYQveaT0FX
	 DAe0zpwIh+z3jPCqTXFeOTev/lBfAbHhcWvnGJ7RU6woMIL32Cx21YxV0VJ4vlpSyG
	 gSSHq/U/YPHyqlNIGfoHeHPa24BtBs7g8a+I4xyc2dBjELf4iueqv865IrvF6TqTly
	 bSNm2abkDoeoFZ00T11zZvDJ5EzRC7DzYUHVTCBp1jI7VIIovtSqIlNroCUH8PxLqn
	 sTjCg2X/mE89qArZFhBJIeSsClNJQKENQR61YB91Ir9mn0AytA5rPqnRl7gNBPi1Lj
	 KdpxzKGD9ke7A==
Date: Wed, 13 May 2026 15:05:50 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <20260513140550.GD305027@google.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
 <20260428153611.142816-6-clamor95@gmail.com>
 <20260507140519.GO305027@google.com>
 <CAPVz0n1Ubvj9MHHMcM2BpxAcTCCheMihr3aJUqcDVoi_V0OQ5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1Ubvj9MHHMcM2BpxAcTCCheMihr3aJUqcDVoi_V0OQ5g@mail.gmail.com>
X-Rspamd-Queue-Id: 9D368534F55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8089-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 07 May 2026, Svyatoslav Ryhel wrote:

> чт, 7 трав. 2026 р. о 17:05 Lee Jones <lee@kernel.org> пише:
> >
> > On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
> >
> > > MFD have rigid subdevice structure which does not allow flexible dynamic
> > > subdevice linking. Address this by diverging CPCAP subdevice composition
> > > to take into account board specific configuration.
> > >
> > > Create a common default subdevice composition, rename existing subdevice
> > > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > > Mapphone board.
> > >
> > > Removed st,6556002 as it is no longer applicable to all cases and
> > > duplicates motorola,cpcap, which is used as the default composition.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> >
> > Changelog?
> >
> 
> Changelog is in the cover.
> 
> > >  drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++-------
> > >  1 file changed, 83 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
> > > index d8243b956f87..516d1e33affa 100644
> > > --- a/drivers/mfd/motorola-cpcap.c
> > > +++ b/drivers/mfd/motorola-cpcap.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mod_devicetable.h>
> > > +#include <linux/property.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/sysfs.h>
> > >
> > > @@ -24,10 +25,16 @@
> > >  #define CPCAP_REGISTER_SIZE  4
> > >  #define CPCAP_REGISTER_BITS  16
> > >
> > > +struct cpcap_chip_data {
> > > +     const struct mfd_cell *mfd_devices;
> > > +     unsigned int num_devices;
> > > +};
> >
> > This is a red flag.
> >
> > >  struct cpcap_ddata {
> > >       struct spi_device *spi;
> > >       struct regmap_irq *irqs;
> > >       struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
> > > +     const struct cpcap_chip_data *cdata;
> > >       const struct regmap_config *regmap_conf;
> > >       struct regmap *regmap;
> > >  };
> > > @@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
> > >       return 0;
> > >  }
> > >
> > > -static const struct of_device_id cpcap_of_match[] = {
> > > -     { .compatible = "motorola,cpcap", },
> > > -     { .compatible = "st,6556002", },
> > > -     {},
> > > -};
> > > -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > > -
> > > -static const struct spi_device_id cpcap_spi_ids[] = {
> > > -     { .name = "cpcap", },
> > > -     { .name = "6556002", },
> > > -     {},
> > > -};
> > > -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > > -
> > >  static const struct regmap_config cpcap_regmap_config = {
> > >       .reg_bits = 16,
> > >       .reg_stride = 4,
> > > @@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
> > >
> > >  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume);
> > >
> > > -static const struct mfd_cell cpcap_mfd_devices[] = {
> > > +static const struct mfd_cell cpcap_default_mfd_devices[] = {
> > > +     {
> > > +             .name          = "cpcap_adc",
> > > +             .of_compatible = "motorola,cpcap-adc",
> > > +     }, {
> > > +             .name          = "cpcap_battery",
> > > +             .of_compatible = "motorola,cpcap-battery",
> > > +     }, {
> > > +             .name          = "cpcap-regulator",
> > > +             .of_compatible = "motorola,cpcap-regulator",
> > > +     }, {
> > > +             .name          = "cpcap-rtc",
> > > +             .of_compatible = "motorola,cpcap-rtc",
> > > +     }, {
> > > +             .name          = "cpcap-pwrbutton",
> > > +             .of_compatible = "motorola,cpcap-pwrbutton",
> > > +     }, {
> > > +             .name          = "cpcap-usb-phy",
> > > +             .of_compatible = "motorola,cpcap-usb-phy",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 0,
> > > +             .of_compatible = "motorola,cpcap-led-red",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 1,
> > > +             .of_compatible = "motorola,cpcap-led-green",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 2,
> > > +             .of_compatible = "motorola,cpcap-led-blue",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 3,
> > > +             .of_compatible = "motorola,cpcap-led-adl",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 4,
> > > +             .of_compatible = "motorola,cpcap-led-cp",
> > > +     }, {
> > > +             .name          = "cpcap-codec",
> > > +     },
> > > +};
> > > +
> > > +static const struct cpcap_chip_data cpcap_default_data = {
> > > +     .mfd_devices = cpcap_default_mfd_devices,
> > > +     .num_devices = ARRAY_SIZE(cpcap_default_mfd_devices),
> > > +};
> > > +
> > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
> > >       {
> > >               .name          = "cpcap_adc",
> > >               .of_compatible = "motorola,mapphone-cpcap-adc",
> > > @@ -285,7 +327,12 @@ static const struct mfd_cell cpcap_mfd_devices[] = {
> > >               .of_compatible = "motorola,cpcap-led-cp",
> > >       }, {
> > >               .name          = "cpcap-codec",
> > > -     }
> > > +     },
> > > +};
> > > +
> > > +static const struct cpcap_chip_data cpcap_mapphone_data = {
> > > +     .mfd_devices = cpcap_mapphone_mfd_devices,
> > > +     .num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
> > >  };
> > >
> > >  static int cpcap_probe(struct spi_device *spi)
> > > @@ -297,9 +344,17 @@ static int cpcap_probe(struct spi_device *spi)
> > >       if (!cpcap)
> > >               return -ENOMEM;
> > >
> > > +     cpcap->cdata = device_get_match_data(&spi->dev);
> > > +     if (!cpcap->cdata)
> > > +             return -ENODEV;
> > > +
> > >       cpcap->spi = spi;
> > >       spi_set_drvdata(spi, cpcap);
> > >
> > > @@ -331,16 +382,24 @@ static int cpcap_probe(struct spi_device *spi)
> > >       spi->dev.coherent_dma_mask = 0;
> > >       spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
> > >
> > > -     return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
> > > -                                 ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
> > > +     return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_devices,
> > > +                                 cpcap->cdata->num_devices, NULL, 0, NULL);
> > >  }
> > >
> > > +static const struct of_device_id cpcap_of_match[] = {
> > > +     { .compatible = "motorola,cpcap", .data = &cpcap_default_data },
> > > +     { .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data },
> >
> > We don't allow data from one device registration API (MFD) to be passed
> > through another (OF) because it tends to lead to all sorts of "creative
> > solutions".  Pass a value instead and match on that in a switch()
> > statement like all of the other MFD drivers do.
> >
> 
> You don't allow this. I have not seen this enforced anywhere in the
> kernel except the mfd subsystem. Fine, does not matter, if this makes
> you happy I will adjust.

Where else would this rule be applicable?  I can't think of anywhere.

-- 
Lee Jones

