Return-Path: <linux-leds+bounces-6014-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F54C35DC0
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 14:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464C53B9A7C
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 13:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41453321F51;
	Wed,  5 Nov 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJzNBrXd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709D34D386
	for <linux-leds@vger.kernel.org>; Wed,  5 Nov 2025 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349606; cv=none; b=lXJbLlVyY6/Qaf/D7GbzSYftSiFf4A+I2+U6WnjWxET+OmKa2Upvez/3lvFMGsSBel2WFZvjTxx/bfYmbyRgW5Vt6nmV7C5PDtuQLOywF2nRQJ4bAuq2Q9K1D9SjvT4cRg2ajPq4brvw1M3IZdXMFa9jtpuq0Xda9l1pfq3SsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349606; c=relaxed/simple;
	bh=U1F3sTOuHUQFLv3TEGbA/DSFmdBXlQ3siYXEh6JECNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sc4iGqmj2dp5UsJrm2ehspULuk3VbJnNn5YxgqPh6VvHZ3kZW9Ju1szaR9Agt7dmepyyjFnau6XAShaiDaaT0D3yterp0diwnj3vWH/8IyzXJxo+zUvLD5swZtRMp4M4t6eJ/Mr9Q4218PDl7k6XKyY9ioV7ABqdP/qfWenArgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJzNBrXd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c48e05aeso640549f8f.1
        for <linux-leds@vger.kernel.org>; Wed, 05 Nov 2025 05:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349602; x=1762954402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tfu97VMOCBozBOXYMMrX6xpt41aHtuKwXkexARt1yc=;
        b=FJzNBrXdG/9b4c+DV1ehf5Lpl4/qtktcHuerCW9ZeIFr3ZHBzkQKHwgmCAjPqaVh6s
         kH8Q6YupB3LKVtMaY9ytrggAUGJh2qNWuPAoCKCubXSMlb+qEHaGZPbK/KDGuQ18oDJG
         PNrMeSyfuDIdpHDTOl7UP7zS1CEiVxusCJ/4BUlSb3ho3e5Q5toOKJdCvSZdrUwZV6kJ
         EXIPWYKzwUP5wh4Lg7Ls6Q0VKU6OtJ2HaFO5jCGChDNT206fVUDxXxpKWaenqEsDMbA/
         bDf4pWwGHAX3QV/bXtzFpNz+BJs5whrwoTffw2gQayl6kAJ+abXzOwmldpVF1Ua+kooF
         6fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349602; x=1762954402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Tfu97VMOCBozBOXYMMrX6xpt41aHtuKwXkexARt1yc=;
        b=YWr3o4fMUWdHEFZlOGFUdUOmF1sIIYa07djwcVDKUXt8Ocoalq9Lp7dP9zJflmQS0m
         2so4VfD6XUagIfv8b7gMQhFLQjMuCYpi6kU2giX/04n98L/IlEcsaPsWuMJbxjFDjN1y
         HxJufEQXMgcBWE48RxoNNR9cm4ZcfvWADlk3sz7ANisrRs2iPAq7Sz05wfvx5DGPxPMY
         by5G9PLzl6roI5aVPzLk1I5Nh0qkVqoyG3hdT6moE8bd+1W7AQl8OZ3hPuUgmOKYDkXj
         RUiRpXTely22woFg9aUfZm6LtvcLOStLkHVLXTTvOQ8rrYW62pWYC5Sui6y1PAleLasi
         feGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVbxy3KOEh9h8DNsMQKxPJYgZoHz3GWQqWk+Kk3bXvEdnVIohJGUrOO813oVT9NkMlZnwvaG4E45+x@vger.kernel.org
X-Gm-Message-State: AOJu0YysVD3WwOslv63p+T15coJRRNp2+NEmdMMwGywH+mCGL9QAZgbD
	nz1/6dn9srgL93MBQkdlqQop1ONSKFyDbh9T+iPzsnP7b5AniIeiiu84oNA7n1AOA88zbRD3sJ5
	39beA/ra8jHS2HB9+AwsMzt4UBZ9IiVg=
X-Gm-Gg: ASbGncuJaXAQ0veMoNiwIbmP8KqNr9mG4NjIBmomhlvzceEiA8bIJ06SKOvprK5F7yy
	Y9bBg2GF8T5Q4zFH/6qi2K1FoyHaMhedjD0dyvfUm+qGpl8u0n7FGHhqtInAXHEilZgY1RJirLQ
	pU80lUQhzMtkMP7XmdrGBs4LoQxkgJP1Ko8T0CNXxjzzkw7uzSllREamAItQNotuUzrvp+qOu4U
	0CdGVZ//BOLyC0cP9Z4tk7377h3LoJhuaqvcdQ7jw82ASrg0DeL2FissulY
X-Google-Smtp-Source: AGHT+IGvCIWq+0rMKhHvfniW+bwuHBHFAQHkMM11oGaxNLETqDrXu4Eu7COom09OEhCJJdAFILKAhozPdMoJet07vlc=
X-Received: by 2002:a05:6000:310d:b0:3e7:6424:1b47 with SMTP id
 ffacd0b85a97d-429e2d88922mr3412833f8f.6.1762349602259; Wed, 05 Nov 2025
 05:33:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210601005155.27997-1-kabel@kernel.org> <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch> <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch> <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
 <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch> <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
In-Reply-To: <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Nov 2025 13:32:56 +0000
X-Gm-Features: AWmQ_bkvWW9Syr048xGuiGtl0UoycvbDjswru0s_sXAuWV-WFnJJ1Z_S-s_DosE
Message-ID: <CA+V-a8snRfFrZeuJ7QSt==B5vWAyTpHzdNj0Jx6oz_aaozbGYQ@mail.gmail.com>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Russell King <linux@armlinux.org.uk>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Oct 17, 2025 at 4:23=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Andrew,
>
> On Thu, Oct 16, 2025 at 8:44=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > > I haven't explored the current leds code tbh. Can you please point me
> > > to any PHY which uses leds if any.
> >
> > ~/linux/drivers/net/phy$ grep .led_brightness_set *
> > air_en8811h.c:static int air_led_brightness_set(struct phy_device *phyd=
ev, u8 index,
> > air_en8811h.c:  .led_brightness_set     =3D air_led_brightness_set,
> > as21xxx.c:static int as21xxx_led_brightness_set(struct phy_device *phyd=
ev,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_=
set,
> > bcm-phy-lib.c:int bcm_phy_led_brightness_set(struct phy_device *phydev,
> > bcm-phy-lib.c:EXPORT_SYMBOL_GPL(bcm_phy_led_brightness_set);
> > bcm-phy-lib.h:int bcm_phy_led_brightness_set(struct phy_device *phydev,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> > dp83867.c:dp83867_led_brightness_set(struct phy_device *phydev,
> > dp83867.c:              .led_brightness_set =3D dp83867_led_brightness_=
set,
> > dp83td510.c:static int dp83td510_led_brightness_set(struct phy_device *=
phydev, u8 index,
> > dp83td510.c:    .led_brightness_set =3D dp83td510_led_brightness_set,
> > intel-xway.c:static int xway_gphy_led_brightness_set(struct phy_device =
*phydev,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightnes=
s_set,
> > marvell.c:static int m88e1318_led_brightness_set(struct phy_device *phy=
dev,
> > marvell.c:              .led_brightness_set =3D m88e1318_led_brightness=
_set,
> > marvell.c:              .led_brightness_set =3D m88e1318_led_brightness=
_set,
> > marvell.c:              .led_brightness_set =3D m88e1318_led_brightness=
_set,
> > marvell.c:              .led_brightness_set =3D m88e1318_led_brightness=
_set,
> > marvell.c:              .led_brightness_set =3D m88e1318_led_brightness=
_set,
> > mxl-86110.c:static int mxl86110_led_brightness_set(struct phy_device *p=
hydev,
> > mxl-86110.c:            .led_brightness_set     =3D mxl86110_led_bright=
ness_set,
> > mxl-86110.c:            .led_brightness_set     =3D mxl86110_led_bright=
ness_set,
> > mxl-gpy.c:static int gpy_led_brightness_set(struct phy_device *phydev,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> > mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> >
Sorry for the delayed response.

I started investigating adding PHY leds. In page 53 section "4.2.27
LED Behavior" [0] we have an option for LED0/1 combine feature
disable. For this is it OK to add a new DT property?

[0] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductD=
ocuments/DataSheets/VMDS-10513_VSC8541-02_VSC8541-05_Datasheet.pdf

Cheers,
Prabhakar

