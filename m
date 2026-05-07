Return-Path: <linux-leds+bounces-8037-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Br1MiGm/Gm5SQAAu9opvQ
	(envelope-from <linux-leds+bounces-8037-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:48:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 820144EA7D3
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 340B830ACA0D
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 14:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AE542314F;
	Thu,  7 May 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pylNWjxF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DCC4218BF
	for <linux-leds@vger.kernel.org>; Thu,  7 May 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164939; cv=pass; b=tb2ckGu4YBPdDTFKPH2D4J/bny6WtLcM80177DX8ETRgYqNfRfs/HDj3QewbAzo83AWcE2QJ4yHS26ALevRWk+mlqBG03D/73upNnNI5GFbFuFC0dJjl5sVbHK2h5Ysb9H++uhW9f5gg7a3L/3kDhcIKXO/jRChlmEcCnLtLAuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164939; c=relaxed/simple;
	bh=QE7XruwSEiu7pgFmsBJ0QOzj6pZbNDale0S5vZ2ZTZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXjTYK0PmkbZmoPx9jMAsGv/A842yWqI510nbCG9fQn4UjxO2TvdN4i79p5NSy9JmyZEhnrd/2C0neGBqITgiCjwjCTjDYUf5Ui8V74d4umIWeyuVvtNzqyrS8Pcw+Ofw33DE6VaQuxlFhofvv2tivrhoXuPY2bHF4DN+Qul/d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pylNWjxF; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ee990e8597so1570604eec.1
        for <linux-leds@vger.kernel.org>; Thu, 07 May 2026 07:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164935; cv=none;
        d=google.com; s=arc-20240605;
        b=SSV3qjKs/jE5a6YrUK6iiQZXO2Ck1FIx2uC+IJb+mrKXbI4fb14G2vPcUFrS9jU7tP
         5Byam4JnVsigJJy4HS/yoOHxxrwPBw0zNiz60cKPinBb3rCDOkQlNQFlVfulrfJBhCkc
         VEdAWv4w4WT+2DTytA9teDi8XyqmlPKWLraau2R57n061haIIgpR4QTkU5cLrQv/3i27
         0aZt57Z3EylisVcoBdzvkSE2MdB8gPpX3Ehgz2gReI0HXh2YNg97w2fvRCptcmlkb3EF
         xQpRwsA3GfVhuf0oXJq048pTrLee0nu9omYRcKHD0ug2JR7Rk2a6pr/cH36eVhIk69sB
         Ct7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jT3O6et3NT1mqwSybd/qwkVNrO5VzBYtbQaOosZiYdY=;
        fh=0t94tnSE7uzob1UlLHoYkTRTGeiB++cxytAJPeegUP4=;
        b=fV40pE/+jj+UNvQPkd6bQEdBredJy49UrsLukajQZhyZRLN3ekvzwlFypUH5hPy8Kp
         1/Rap++/exPo3+8TX1XxNPM59Yp7kRclQJ2OpfkjyxPrDciCmni1ees8aEp0tOcQ67bL
         tuKr9OGk9ooEXHos00yT8K/sXmps0riwHP2h9DLF48bsDGUNXEQjIaH3QcR13tWl3uDM
         bomnzQ5CJdsQnrCCQ2rWquYDX2nz4LJZyGm/owYJcPU+v13FrQZsGgES5Dz1Q4CquzU6
         7JON9d3W26wUOJX3W2n8zXm2GjadKpzJJt0AGrCBW7M0PbPixss/Q/+PKdqafsC3LZJN
         3EqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164935; x=1778769735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT3O6et3NT1mqwSybd/qwkVNrO5VzBYtbQaOosZiYdY=;
        b=pylNWjxFajgQnLuvpice8FN420rhIT/CXDD14B8nn+yFWMnVQLTlR0MuUK0EaqA1ua
         XftwjRPTNQHYkROo2AhuYoikxyZuJpby8vf1xPUxk1wc/PFI5dJue1Ao/REeG01/5gxL
         oLT1P6RRZIhgiHJ8UIo3V5fUSHyLYf1fQuG960lrXLnK5/5ZkRY1hSjuLuoEKW4WBU5H
         KNjo5jf1QZIsH+FlsF/Q9xFzOdukw+aSsQChSwtpu8oeQW2kt38wamn3X1zC7w0A2srI
         WDpcTlRqCZtO0DqJexvqOFdUTpejrcPy69kEPbUEgAGKKYJ7yFVUI+6XE03V14XRdBP3
         rJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164935; x=1778769735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jT3O6et3NT1mqwSybd/qwkVNrO5VzBYtbQaOosZiYdY=;
        b=Al+mWDGdF4Jm0yegV0R4FOOXFcg5DMR3EPVSqwnkeQT+YZAAeN9ewCxvozVsc6QDZ4
         DuWohuQ+FAVT9Sf9AGOe7uFD4DTNr8RNrbyXe7UG3VJ1WfAp1InF5vjklqurZHCVoS+V
         5cGU257nXf/s8wEBK7eV27pYTu+Dx8uQJFsxOXHyk/stV3ovB4SnxpJ1ckNBCRLo9O2g
         FuC/WI5Thw3kEeDd5EVHFpnlDomFldAKCyDn1lNu3pIVG7RlpYrH++7aclrap9c0gHDS
         ySfhui5wp6vRjnXY1ditrlcQkPI/Rgx5HzCfddgavOgi0I0myh0cieq9gZlZcoap2Qx/
         5YFA==
X-Forwarded-Encrypted: i=1; AFNElJ8qyKqvqX/O4g/FLVf9CrHS+TPKuH4ohgFkD4mZsOcnU7f2sBS1bqStiIOq6pCUvOauJNiMruNtQohm@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQTSTzlb7pvnic7kTM28t/xIy/+WZNQTfQ94IIygYZbQTdHVa
	3rT2DrBP8d9HlGalJs7dOjro4iDOCWnfRScVstlmzFiG1mfNXxQ62hvNgLKggwxPYTLqyDCNgCX
	PteXs5l1M1LnK1Z9SwseVXpIIfC+ZaTs=
X-Gm-Gg: AeBDieuofajLEXrbEeq7ocEfbj4k9NsTnV0kxK7C7t2o0gESqabfh9vBn5FhuEYsOXh
	S7EcGPmrgGoFkHUdCryZAnj514SOcV2FSHMu8hxFDpa0z810itgRu3UUEM5BjBoPiJgS/34GMKq
	MxG7bvq3ow0kzI1NXCf00YUgLSkKpzaiRPVgJezVoIAHi8CtypVwIgN7WlNOtwKeYl8dtQ1HwPP
	HllWfWgfAsyoZX2nkRIsu83cIpKu+n47c327zAiXKILl837iRvP32oYsZ1SGsPtbPp8w8dNLa5c
	N+QhS1SuG6bEWQkBDR8=
X-Received: by 2002:a05:693c:2411:b0:2f6:811e:c840 with SMTP id
 5a478bee46e88-2f6811ecdc7mr1706481eec.18.1778164935381; Thu, 07 May 2026
 07:42:15 -0700 (PDT)
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
Date: Thu, 7 May 2026 17:42:03 +0300
X-Gm-Features: AVHnY4JhuQbLfhGWuOYGbOyhNdM9uIu0BiU5APMsX46gUxzYP5nSTtoAi9DOTZo
Message-ID: <CAPVz0n24U3=hwda5BTXUhHiiFHKmWUfLy_nxJp_CFHBHEYDWsA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration per-board
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 820144EA7D3
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
	TAGGED_FROM(0.00)[bounces-8037-lists,linux-leds=lfdr.de];
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

Lee, would you mind if I convert these mfd_cell structures to use
macros in this commit since I am refactoring them anyway?

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

