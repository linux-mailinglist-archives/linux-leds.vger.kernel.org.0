Return-Path: <linux-leds+bounces-880-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B985BFEE
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 16:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 745FD2843B7
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0CA768EA;
	Tue, 20 Feb 2024 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wOgW8k+2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9377602C
	for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708443026; cv=none; b=quipt2uL8QQur4e3n7fF42YQ7d0wwTXsRsMdmkgK2lfGWRjFwfuB+fzagHUIW/knCSmcUHkM328YXn/I7k5RsJW8PQSyHDXuTubIiMUB6b+cL/mJfOX22zY4tO99xoVc2XThYK1TJGNaJrOydW1cXC4v17Iqhe4c3ZYtvBiU/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708443026; c=relaxed/simple;
	bh=1sj9S9jNhooUQ/JS/m+MJGrY/bY6bz7kPiE07BuNenc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICE3v02Z/9jiF0+K2hUe4usALK7qgbSOvCNyW+UxWLqvxoXSaDaTOnQLZlHDnRpRFXcdtPAbHTQDCg3NqHDqFISTUznS0TW9VwGVrz5jaSR0I3vcFRRXiNu/Qk1Liqk31+BFuVNpc9CbLTQTL6SUvgZ34mFfQ04uuq6xLEk/edo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wOgW8k+2; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4c015883a13so873042e0c.1
        for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708443023; x=1709047823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgAso/jjSQp7QM9VPQ9nrwybvQpA1gALdpKpuAZ8dWc=;
        b=wOgW8k+2nRZz/h8xwM0hTH9Rg+E2wpKtri5N55GgZ/9GeYx12sqrHvoBfnZY30NxIK
         ItoFPe0igBCLXTRsIWWBgOHX+EzXnCMBG9hW2iShEhXsYQH6Jr6LCojBWr3x9WSwkBoY
         pT/qLZKDnuP4PnT3NwdIejlN3Ixqn4iCvuWLX6xjoNGrQ9tKXpxatld/nDR2NsIOw00y
         dKnhhQTn2VGUJi2BwFwOEi+lxDDu8As45bf54X4I7U7dAswEhvb+IT1OQi0zrHkYm8Gn
         eqTyomggut+Ob06a7ufU8w9FglBkIe9B0q7DyV70TCo2WIZ7xENAfpCD+0mppMrTPRP/
         8x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708443023; x=1709047823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgAso/jjSQp7QM9VPQ9nrwybvQpA1gALdpKpuAZ8dWc=;
        b=jscO/Rz3CKeNhMxzBsO8GRqA6hkvCW5/FyBZkLYamHWCN+V7VLlu+XMAeufnG598KI
         cOsvP1wTsKcwiWeuf0iIPP3Mf4d2LTIZlXqooRYyucxuMhhl7SYzI0oDh+JJUWVMK1tw
         QxG/uKLoD4z+CdFFZgw5OW3BJEynOwaTTeb+iXpKq/lATHQjR3bzgP7eQblsn2fG+wF2
         a3bT2GEkxvuE69oJ/+pcZ8wIZYh228z8U23KKywCP4ApHRdiWp4vX+KKBFraeVtos8Uj
         FeuXhOy/kqAI2mAJaHnw3wqLCl+5AKibcQAIkUPUiBZGqrKu6DGrIf5Z9aAmqsvy9uT5
         R31g==
X-Forwarded-Encrypted: i=1; AJvYcCUH088+iid6Oxs0CVhv7tz1l0LTaQhlnANgAxaZ7RdR4FcNyR0bL4/pObx0CwjnevCKJZgZ6XwvGheOXQi0XOs4scaByTCLMLscRw==
X-Gm-Message-State: AOJu0Yy01npGNN0Xh+U8IhxDsXFL+QxTEgmQFjtzQaLJ48HOHTrIWIWg
	WSYtNntABNJ5QmfX9DcGXsRL3VYfcpsvOlr+w+IF8pE74GbBg3Nccwyb3R/0ZASq41GzJ29hlMT
	GFpX+Rdm/1ud5ZwrQGxTFQX+JsG+bd0R9ZmXA4w==
X-Google-Smtp-Source: AGHT+IHgHbSp0Z/+ECASGBhOI1+VwVoeQh+pGTK7r7JGg5XT4Qi7soYBIVRbn0t4RuO6kjK1BcSbECjqI4xybj/MP+8=
X-Received: by 2002:a1f:4c84:0:b0:4c0:774b:e7b0 with SMTP id
 z126-20020a1f4c84000000b004c0774be7b0mr10166207vka.13.1708443022732; Tue, 20
 Feb 2024 07:30:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220133950.138452-1-herve.codina@bootlin.com>
 <CAMRc=MfWPEOHeNvAwra-JxHZBFMrQbP+273zbFLDZfxi7fx8Yg@mail.gmail.com> <20240220155347.693e46e1@bootlin.com>
In-Reply-To: <20240220155347.693e46e1@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 16:30:11 +0100
Message-ID: <CAMRc=MeSgCOLZvFOXF4eQOp=bTz38K5Krzuy9r569-jnDx1zFA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] leds: gpio: Add devlink between the leds-gpio
 device and the gpio used.
To: Herve Codina <herve.codina@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 3:53=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> On Tue, 20 Feb 2024 15:19:57 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Tue, Feb 20, 2024 at 2:39=E2=80=AFPM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > Hi,
> > >
> > > Note: Resent this series with Saravana added in Cc.
> > >
> > > When a gpio used by the leds-gpio device is removed, the leds-gpio
> > > device continues to use this gpio. Also, when the gpio is back, the
> > > leds-gpio still uses the old removed gpio.
> > >
> > > A consumer/supplier relationship is missing between the leds-gpio dev=
ice
> > > (consumer) and the gpio used (supplier).
> > >
> > > This series adds an addionnal devlink between this two device.
> > > With this link when the gpio is removed, the leds-gpio device is also
> > > removed.
> > >
> > > Best regards,
> > > Herv=C3=A9 Codina
> > >
> > > Herve Codina (2):
> > >   gpiolib: Introduce gpiod_device_add_link()
> > >   leds: gpio: Add devlinks between the gpio consumed and the gpio led=
s
> > >     device
> > >
> > >  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
> > >  drivers/leds/leds-gpio.c      | 15 +++++++++++++++
> > >  include/linux/gpio/consumer.h |  5 +++++
> > >  3 files changed, 52 insertions(+)
> > >
> > > --
> > > 2.43.0
> > >
> >
> > Can you add some more context here in the form of DT snippets that
> > lead to this being needed?
>
> / {
>         leds-dock {
>                 compatible =3D "gpio-leds";
>
>                 led-5 {
>                         label =3D "dock:alarm:red";
>                         gpios =3D <&tca6424_dock_2 12 GPIO_ACTIVE_HIGH>;
>                 };

Do I understand correctly that the devlink is created between "led-5"
and "tca6424_dock_2" but actually should also be created between
"leds-dock" and "tca6424_dock_2"?

Bartosz

>
>                 led-6 {
>                         label =3D "dock:alarm:yellow";
>                         gpios =3D <&tca6424_dock_2 13 GPIO_ACTIVE_HIGH>;
>                 };
>
>                 led-7 {
>                         label =3D "dock:alarm:blue";
>                         gpios =3D <&tca6424_dock_2 14 GPIO_ACTIVE_HIGH>;
>                 };
>         };
>
>         ...
>         i2c5 {
>                 ...
>                 tca6424_dock_2: gpio@23 {
>                         compatible =3D "ti,tca6424";
>                         reg =3D <0x23>;
>                         gpio-controller;
>                         #gpio-cells =3D <2>;
>                         interrupt-parent =3D <&tca6424_dock_1>;
>                         interrupts =3D <23 IRQ_TYPE_EDGE_FALLING>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
>                         vcc-supply =3D <&reg_dock_ctrl_3v3>;
>                 };
>                 tca6424_dock_1: gpio@22 {
>                         compatible =3D "ti,tca6424";
>                         reg =3D <0x22>;
>                         gpio-controller;
>                         #gpio-cells =3D <2>;
>                         interrupt-parent =3D <&gpio4>;
>                         interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
>                         vcc-supply =3D <&reg_dock_ctrl_3v3>;
>                 };
>         };
> };
>
> Also, had the exact same issue if I use a SoC gpio chip instead of an
> i2c gpio expander.
>
> Best regards,
> Herv=C3=A9

