Return-Path: <linux-leds+bounces-8036-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJsuOs2k/GmRSQAAu9opvQ
	(envelope-from <linux-leds+bounces-8036-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:42:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE24EA657
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 16:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A24C30B19C0
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE590427A1B;
	Thu,  7 May 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDW7JPq7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF440756F
	for <linux-leds@vger.kernel.org>; Thu,  7 May 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164578; cv=pass; b=IkmiLTAzyhvRq0hz0O5XcQBKu4U/kOsuaHDpN4ynjSYExXSWMlOM7Xu7jolO47mgyhAMNqjKbW43RdnaFspD4FkMwp50NB3mHTM9jNppqMM6iyfM9Fmj61ROsSPRqEsqXzlmK6sWTJTfuG/EKB5TNqWMNk3CCmByQ24V++K7GNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164578; c=relaxed/simple;
	bh=4Q4gVA5Jd1n6uyC1ZvFQ4rucoXxJLhEiilF2amKyVc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJ6NxyNYq3cDUpie3n6rLtCEqt9xnNdiXI6tmHjBmDV5MWctJrgFKd1G3W/Pvo1KxoKeKSm0FtPvdJ9FOVq01e3hQKMQPhLvxTOxoiTIJ0CDwRO8XT9XyaJZLmz4a4dgeFSVeleTlqb97NZxkT8BfJ/B9eWKFuwV5Tee9+OGAXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDW7JPq7; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so268102eec.0
        for <linux-leds@vger.kernel.org>; Thu, 07 May 2026 07:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778164575; cv=none;
        d=google.com; s=arc-20240605;
        b=bq2DPwiZHe0L2NgyL/s2TazeiqLGENztlaQpl+SBZN32hwuBbsefyxffoXHk70/db1
         OhUF8YDD/ZNhmqzCkva8+hpj6mydPpUWBW4At1nLPh37kygZJj70aV0hF6+GLog6CbV7
         lR7//lw8ThDi+rR87qhe+R3gZUnoTdAPx9Y2zSr2AUUKUHVHs1jNhC2+U830D6Mhgg1t
         ewJaNFzjw+GiQ1vRoOHQBBdtjdK8Eu8NsTf2nYwYYVjaHYjRXFlZv3JyzgpBcO7mDILy
         Z5uUYsocPcmEoU7YplqDoNRKhvnobgIlNeFdjAmpkEbE5UnF2fvnTapRsQxGGmWau9If
         phGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tTnB6vEkbQqbTnl4MQ8rpdfcud19RDfiJ5lqADHuqcU=;
        fh=OD0Z1Lg0dgiCwvviYrogat4i+pde8AhIu4GIZzRgBs4=;
        b=JTcxQ6gUMQofpPuFY+EHp77LAlijrm+zbbO7sfAc7sFJlLz/WcRr76frjFqa09SiyT
         Pg1zyEeEufaflss9uhNjaJXvkXe5BiNnmGNN1sKPNWBhz9/rMJ4blMc4x2bUumPvB/H5
         VDdQVKLdenMrg9OrlrIgHsKxwxN8qu4j5dP48iRfe3e9g5Vpt8mSnY5CvZ+rJw9ZkZDt
         LyRi/tYxLskVVOwG66GCaVxLl7YQMNJwDqQrpuHL6agzeQFWpE4Wce5y64l9EVo29Bcr
         wUcoouxoECu6CUHB071RhsdxO5oqI4niuaVNBy5FaXg6xq3R+cp/FjUkF+RnXSlyy53U
         i8DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164575; x=1778769375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTnB6vEkbQqbTnl4MQ8rpdfcud19RDfiJ5lqADHuqcU=;
        b=QDW7JPq7xBsH6lYqhvbKiu78exWMcccuTrYmUhktnNeNzlCp++Ysu3NfDUosZ+MS2n
         rEJIWPOzavyHTVgeONqo7VoYJ6arOBLNDvT8MiqCoL5f0/CN6bo/RsRcjoz9XQt+CToc
         LMr3V8dgiwO5LhQ8sn9EyISflfchzqdHKHl3EVGatiOmVw7SL9yolLqDTSbL65475W5B
         jS0IxwyqW70zAho0srUNBVd54FyEBSxIUgCRknUnYG6n4PuswuRgHFaMqFwZ5Uw9O82+
         HLCTgAk6ZrqlvGF/hy0HdyGxMyM2HHl+vseN6V43kuRlb09GjTicJeFdV8vEaD0PqmkK
         7CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164575; x=1778769375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTnB6vEkbQqbTnl4MQ8rpdfcud19RDfiJ5lqADHuqcU=;
        b=EeBtxtwkRe1jkJ8nXGkVt3XvcqAVy2VbgTYZx1xbh0/ER3hEY+5bzuaYQN/66MYlQz
         E8AneWrq5sxX0U7bPDoY8+kgLOPR5ybmQ2yVdspDq3NhH6eHDxjY5GL1yHDJeVufJS5C
         h9uWOA9QuedZZDLL83iiIBnjg+Hm9fbw/Xb4c2qgMRHpqhLzokfjQ9FJVUkpf8ylgKao
         ohjSp4hB6Z1xKknbsN7MLaHkLxnN1P8QvRF55Jz/gldZZ0rPN2fO2Fvd8b0gxE4xkXca
         WSEzEPdxmj+n08p2KPwliSKAs255x47Cu+dm6xaDvB4NEerlG9YG9jDcWn/6oDjmbOGx
         aCUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XwhIaWOX83x+iMn4bff3XVtgFadoTaPFXWNlsFhJqYgzlP8/DVmLtBJRT+XnvJTD+sa5A20LJn3to@vger.kernel.org
X-Gm-Message-State: AOJu0YykV6DhzsM2DP4DbenakGOQZ8eni2crmtpHpacXJm17KZCdr+BS
	YRonlcfEG/sYDqDN2r3WeIi6TagIetwEllXd+HQvzpx3X1bI8HSSVbYyzQFqHmyaX68O7S0uJ5x
	gpuH89eGL7VqAWIVJwblNqGyEecbjkDk=
X-Gm-Gg: AeBDievYYc3jpfYU4u2X+e5PfHA5bKDyEKkXl0X4ICiHVZscrCXxZipXyM+JvzTHAUz
	XnEeLF3lHF1wXeB+oSXKKvGsUXch8mxUpIjZ7m+Ww/EUNFDI38jiskIb8Mr0NBxOZYBPxFBBPBI
	FIpFm62hymyWqD1mhQIWnOIICQlX7iG5ytaPd9tMvD3PSLmEhwI0vrmLot7RNgoSKkF7Prritzf
	yw3dZ0FfmoxtTV50nHbdNsIbImGeM192GSnDM+Ja/+X/e2vnsPzKR68RA7WNYRdxq+qC777+vn9
	ScwrK7Wqd1eajOsedvI=
X-Received: by 2002:a05:7301:1018:b0:2ea:ed70:3ea8 with SMTP id
 5a478bee46e88-2f54e3802ddmr3907198eec.29.1778164575034; Thu, 07 May 2026
 07:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428153611.142816-1-clamor95@gmail.com> <20260428153611.142816-7-clamor95@gmail.com>
 <20260507140715.GP305027@google.com>
In-Reply-To: <20260507140715.GP305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 7 May 2026 17:36:03 +0300
X-Gm-Features: AVHnY4Ipu20JTRjb2M-ehjX65DOmdXWZujrR93JWxLxR9_IHfdzLcTQAicaBOVc
Message-ID: <CAPVz0n2nfRkxg-M+jVfLaXbTO1AR_GtV7e8Vnw32gWTazUjsjQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6 RESEND] mfd: motorola-cpcap: add support for Mot
 CPCAP composition
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 65EE24EA657
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8036-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=D1=87=D1=82, 7 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 17:07=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
>
> > Add a MFD subdevice composition used in Tegra20 based Mot board
> > (Motorola Atrix 4G and Droid X2).
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/motorola-cpcap.c | 50 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.=
c
> > index 516d1e33affa..fdec92f5c6b0 100644
> > --- a/drivers/mfd/motorola-cpcap.c
> > +++ b/drivers/mfd/motorola-cpcap.c
> > @@ -335,6 +335,54 @@ static const struct cpcap_chip_data cpcap_mapphone=
_data =3D {
> >       .num_devices =3D ARRAY_SIZE(cpcap_mapphone_mfd_devices),
> >  };
> >
> > +/*
> > + * The Mot board features a USB-PHY and charger similar to the ones in
> > + * Mapphone; however, because Mot is based on Tegra20, it is incompati=
ble
> > + * with the existing implementation, which is tightly interconnected w=
ith
> > + * the OMAP USB PHY.
> > + */
> > +static const struct mfd_cell cpcap_mot_mfd_devices[] =3D {
> > +     {
> > +             .name          =3D "cpcap_adc",
> > +             .of_compatible =3D "motorola,mot-cpcap-adc",
> > +     }, {
> > +             .name          =3D "cpcap_battery",
> > +             .of_compatible =3D "motorola,cpcap-battery",
> > +     }, {
> > +             .name          =3D "cpcap-regulator",
> > +             .of_compatible =3D "motorola,mot-cpcap-regulator",
> > +     }, {
> > +             .name          =3D "cpcap-rtc",
> > +             .of_compatible =3D "motorola,cpcap-rtc",
> > +     }, {
> > +             .name          =3D "cpcap-pwrbutton",
> > +             .of_compatible =3D "motorola,cpcap-pwrbutton",
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
>
> MFD_CELL_OF() for all.
>
> > +     }, {
> > +             .name          =3D "cpcap-codec",
> > +     },
>
> MFD_CELL_NAME()
>

I was not aware these macros exist. Thank you for pointing to them.

> > +};
> > +
> > +static const struct cpcap_chip_data cpcap_mot_data =3D {
> > +     .mfd_devices =3D cpcap_mot_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(cpcap_mot_mfd_devices),
> > +};
> > +
> >  static int cpcap_probe(struct spi_device *spi)
> >  {
> >       struct cpcap_ddata *cpcap;
> > @@ -389,6 +437,7 @@ static int cpcap_probe(struct spi_device *spi)
> >  static const struct of_device_id cpcap_of_match[] =3D {
> >       { .compatible =3D "motorola,cpcap", .data =3D &cpcap_default_data=
 },
> >       { .compatible =3D "motorola,mapphone-cpcap", .data =3D &cpcap_map=
phone_data },
> > +     { .compatible =3D "motorola,mot-cpcap", .data =3D &cpcap_mot_data=
 },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > @@ -396,6 +445,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
> >  static const struct spi_device_id cpcap_spi_ids[] =3D {
> >       { .name =3D "cpcap", .driver_data =3D (kernel_ulong_t)&cpcap_defa=
ult_data },
> >       { .name =3D "mapphone-cpcap", .driver_data =3D (kernel_ulong_t)&c=
pcap_mapphone_data },
> > +     { .name =3D "mot-cpcap", .driver_data =3D (kernel_ulong_t)&cpcap_=
mot_data },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > --
> > 2.51.0
> >
>
> --
> Lee Jones

