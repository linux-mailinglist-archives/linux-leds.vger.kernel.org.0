Return-Path: <linux-leds+bounces-5806-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A5901BE9C45
	for <lists+linux-leds@lfdr.de>; Fri, 17 Oct 2025 17:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7334A35E09D
	for <lists+linux-leds@lfdr.de>; Fri, 17 Oct 2025 15:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147963328FF;
	Fri, 17 Oct 2025 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcAOPA6T"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C832E156
	for <linux-leds@vger.kernel.org>; Fri, 17 Oct 2025 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714632; cv=none; b=YHirHx3onpEG7wpGsaLBxcRDbAv7q0MlXCH/1OOHKPQHUEummzeemmMILhtyE3WTtp7VxzVFUQGqDrcpWSlPsIa8o5rUQIs8LENu2wXSTvYqnMxTqEtWA8t1e0+W3DtiOu2iCO1pbOWVMAkciGHiXHFKfplioj1t9G8Sep/yJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714632; c=relaxed/simple;
	bh=IlC1uoM6hGZDFnPynvz/oLrdeH24f/eZIlnDf3u2N1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3PSP03sQdPM+oASbGBApFZnkv+kwEnAYHQXWsxPVrlRrxIPl0EcxE+xSX6DP9QUv/6VklRYs4bzKhCEKy3gI4BIsN5NlAszxN7PcxAxMXxFdhypEGYbkMpxRg4QSp+WpBZVGVlHVVBGueTM9OcWJiwA40Xka8z0CdFlD7RZK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcAOPA6T; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so1194739f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Oct 2025 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760714628; x=1761319428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WuCukqGv8l97mP78xfZnvYpfA8a4jrxFt2laMKgkVQ=;
        b=GcAOPA6TOAwFTtQIu24rrn8pLPIhVs7RA3tkw9DAytyK1c6MdFmJRN2upGtHgaLUY5
         0iZ6FYg2zKKLLQqyLqe1SJT//cpGJaO9JlVkzOV8PLE3immiTi3AGJY0Fl8Z/jJX8GYY
         qFBg8thwE0igMLc+LTSpp4HmtyQWVoPkLgHCemMdZ4TO+R4PzNDkM7RF1liJuvnDbe71
         fdItBhFutAdIkGAh5ju2XYl6ni9FB0WWK4Ov35tEuEKSJDb0HJ6s/7dHUPGJhntZbrvf
         R6pJWciXcxP5LxXH9GkrI3qbSOLOE7nTGtPlL12RRPRj3YrzPSuTgI5m4muvtRdJ67R0
         Z7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760714628; x=1761319428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WuCukqGv8l97mP78xfZnvYpfA8a4jrxFt2laMKgkVQ=;
        b=iYujBQb6guRWmkbBxYUdeYKHwcSs01mPiIu6h+8tCrsqBdREXyLFZDsynGILyA3HDV
         Tth4/WnyZU6zlc5A5tyo18vej7d9xoMzReq2/VXB2RejSldH842kmGtP2s138dssHtYE
         lIwDsZKvm3Un9TZJ8J1SHRp3lcosbTVUbg86psdv00IQ1muZ9mhuIIpUc9az3r3adCQ5
         GEquTOLL6gFrNKB5ASn2aPDT+GTrHi+26K8Ad4lfRpcO2wwa3WYYq19lMo/Oq3msqQKn
         WqZfuVWMyYUiJZTgxfCyLO/Qbmk0VBvymwCR9OefdepbwASMu+biFYnYGe7DkF5dRGxa
         Zpsg==
X-Forwarded-Encrypted: i=1; AJvYcCXZowroPytC/w3zXoUjMigTE/gDVE4XrkaG/es9fb/toaqsfQXH8JCDR6wo6T5BvMLvrEK4DpsS00Mi@vger.kernel.org
X-Gm-Message-State: AOJu0YwMao7kCYY8GT01nuuXR3unZ+IFdJe3uDa0UmOemZCUk1l5/szM
	oqXfQO1yN5UrbdrL0gHizDK1QvRWqOTQZ6dBhJ/CyAIy1TwrCo3mZfkN5IdvOZidjv99uyDAULO
	WdiDCGQLjawhDNAvMB5Vk0RjlXa8Hu9M=
X-Gm-Gg: ASbGncvNHTuNbhfAcCPhASn9GlYRQG7loawhPO4j9eNpB7X87wMZzgfaPGWmEVCste/
	PgJhMyhcKS3YBkY6iPx7hErJdQljQo3HOjurnhTvd72YdJ3BuKBNjv7zIsVypKzTjyXi3zPXZ/3
	9K9RWfdpOVlKh/S7mMMLHno0yHZiJr8EQ0JqBw4f6KPAv3ZROY6xhXS9ZAgB0hEMuX3feJNqcT7
	lANFOEKo2m2NNpRGvHOcrIRrqrDcm9xPdnE564LG19+PSkyhCd3jIY4yuWM1RBlkNk/v01d
X-Google-Smtp-Source: AGHT+IG9xiadhmJD4lUsclg2Axex3bGa//JnAU5c3h9ptGoH+u70ankmo/AMuooeTQWR4PTCr5WDdAqvMTGtgOVMeWk=
X-Received: by 2002:a05:6000:2f83:b0:427:4b0:b3e5 with SMTP id
 ffacd0b85a97d-42704d99d9cmr3022352f8f.47.1760714628111; Fri, 17 Oct 2025
 08:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210601005155.27997-1-kabel@kernel.org> <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch> <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch> <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
 <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch>
In-Reply-To: <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 16:23:20 +0100
X-Gm-Features: AS18NWB1QRPamrGSSJSqAaecntg_6BMvM434savRI_Ze2iw7DBFqjzS-Onxj_5k
Message-ID: <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
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

On Thu, Oct 16, 2025 at 8:44=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I haven't explored the current leds code tbh. Can you please point me
> > to any PHY which uses leds if any.
>
> ~/linux/drivers/net/phy$ grep .led_brightness_set *
> air_en8811h.c:static int air_led_brightness_set(struct phy_device *phydev=
, u8 index,
> air_en8811h.c:  .led_brightness_set     =3D air_led_brightness_set,
> as21xxx.c:static int as21xxx_led_brightness_set(struct phy_device *phydev=
,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> as21xxx.c:              .led_brightness_set =3D as21xxx_led_brightness_se=
t,
> bcm-phy-lib.c:int bcm_phy_led_brightness_set(struct phy_device *phydev,
> bcm-phy-lib.c:EXPORT_SYMBOL_GPL(bcm_phy_led_brightness_set);
> bcm-phy-lib.h:int bcm_phy_led_brightness_set(struct phy_device *phydev,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> broadcom.c:     .led_brightness_set     =3D bcm_phy_led_brightness_set,
> dp83867.c:dp83867_led_brightness_set(struct phy_device *phydev,
> dp83867.c:              .led_brightness_set =3D dp83867_led_brightness_se=
t,
> dp83td510.c:static int dp83td510_led_brightness_set(struct phy_device *ph=
ydev, u8 index,
> dp83td510.c:    .led_brightness_set =3D dp83td510_led_brightness_set,
> intel-xway.c:static int xway_gphy_led_brightness_set(struct phy_device *p=
hydev,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> intel-xway.c:           .led_brightness_set =3D xway_gphy_led_brightness_=
set,
> marvell.c:static int m88e1318_led_brightness_set(struct phy_device *phyde=
v,
> marvell.c:              .led_brightness_set =3D m88e1318_led_brightness_s=
et,
> marvell.c:              .led_brightness_set =3D m88e1318_led_brightness_s=
et,
> marvell.c:              .led_brightness_set =3D m88e1318_led_brightness_s=
et,
> marvell.c:              .led_brightness_set =3D m88e1318_led_brightness_s=
et,
> marvell.c:              .led_brightness_set =3D m88e1318_led_brightness_s=
et,
> mxl-86110.c:static int mxl86110_led_brightness_set(struct phy_device *phy=
dev,
> mxl-86110.c:            .led_brightness_set     =3D mxl86110_led_brightne=
ss_set,
> mxl-86110.c:            .led_brightness_set     =3D mxl86110_led_brightne=
ss_set,
> mxl-gpy.c:static int gpy_led_brightness_set(struct phy_device *phydev,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
> mxl-gpy.c:              .led_brightness_set =3D gpy_led_brightness_set,
>
Thank you for the pointers.

Cheers,
Prabhakar

