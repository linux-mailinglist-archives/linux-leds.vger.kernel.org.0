Return-Path: <linux-leds+bounces-883-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769285CEBE
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 04:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241211C22D44
	for <lists+linux-leds@lfdr.de>; Wed, 21 Feb 2024 03:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1431838FA0;
	Wed, 21 Feb 2024 03:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PgixYFoW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6938DCC
	for <linux-leds@vger.kernel.org>; Wed, 21 Feb 2024 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486142; cv=none; b=gWakBK6o4SfXXSmnoP0C2MnT/2yt0dTMBJNkIwY8Sv6qDkxPK91HRHsf5HOxMq9Mz6yFptRWq1HMn2KnZta/3aT/uL7GFHkrPiqiG3PqCu4x5kB1eyrZ1CYbLgP0Rn+wZh5Z5xbukPxk6A8vlXuxWygeLAo5S+v3eqvb9YJb4ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486142; c=relaxed/simple;
	bh=8L2dGpIc3ljEGSOLfjoGTy/I1LJM45Njm1zFexTYNtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0Hl79T0w9Gqjw+CK2u7p7HFK6P88b98TtwG/Iug6GH+u94CTcwC8W3pObcUA6v0r1fdGQ++55uiIvQXPF4ZzUJHEmXbfvVP8DHOK7EkEsOWnnBtqYwhmdb/0HElNVzeRpVStk/Qq5XLZ26vzMw4H9waZqsz660xAw9DJ/FKk88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PgixYFoW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-564d311513bso4602a12.0
        for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 19:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486137; x=1709090937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XND0hrjLvkaDKF9iKN16jiOmI7TBD8Aik+JgMD/1rzI=;
        b=PgixYFoWFaIBr0IDZuYMhqL9VMxBkoiRck4LGdIYWsAGjPU98J1N6o2olKzT4Dz98y
         YrKxOGw+Ayqi98dVia9GB9/ZvqwbwX1XB+l2FjXdTL/iQaYoe3TNVz1yVIWF5El3dlmK
         fjVUa5F27U4c9zOJuWtJBQVEA3l6C9amEMpdGXQM+AvcGvbw0rAjE0IZT7/msYk+y9j0
         rTmKemKFsZt58SNouDF/qeFD5qI8qScg54AiiLDv/SAe/Ht/yZpIBgnyXEJJWdxcNsSW
         KmABLp7dp8KQOidlruz/UF4HcmADlx/2HEIqvpTk9E+5f6kl8Xt59s7QwroqB6X5dfEN
         ofOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486137; x=1709090937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XND0hrjLvkaDKF9iKN16jiOmI7TBD8Aik+JgMD/1rzI=;
        b=kP2ouXV2wHHyGVoQkmIY4qAjVNiCcXZPDPz3mELFYGieHYD0pbccJeNGAoJKu6ZTc8
         yIWOoGjlEFIA5aKnf0feVg7G6UoM9NjiMXbqrDAeHjr8VqFTYBPE4DCCiLGIZKu5RNEa
         ck2QmJmhA9IT7ImAAQA/X6Ss+nyceAxnt8eux6tYP4md8p7idr41LnPlKs2HuwfhwCKk
         DthNs/FlFxUM+CtN0PAcndo8BnetoL7FjJfrVenB8mukOQf/uHdQPzWJzq7JIfx/RYH5
         VQsWaP8GOJI5Mf3Q7OJOMve6Qj8D+xlim37wTHQqDgT5qHe3FGjAXC+y2i3s/vtwbv5o
         JCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJgpQlzezqbPzhBFQ3SMBiVOnFHt6M0LJcDFbgR97unL+BGYPx+uuiJ+mfNuI/bWTCbonqsgbPGlbV039wgvzfrq2WhPLcLIABPw==
X-Gm-Message-State: AOJu0YzXHafvBNFrKNc7wLJxebp+HIc2c3mjao0tHjBNleIAIr40+14L
	NktTTIEJBqvPsEyWlZ+7tLhZ3hcOGH6yP178JCsX96RMnd15xPpnNIQN+6buxn6D5vOH0Jg0wwp
	w2MTENI7a4SoOWkJCTD+n1pYD2K2MXEmUxpqF
X-Google-Smtp-Source: AGHT+IGfWL7RMBbEtxsuxJolP5nR/pYTW9TY7Jcb9aIRNa1bro5mSAVswt9hCLNyH3IfBS3VEy0AZHWVlRoPJ323AR0=
X-Received: by 2002:a50:d5d9:0:b0:563:f48f:a5bc with SMTP id
 g25-20020a50d5d9000000b00563f48fa5bcmr45004edj.5.1708486137390; Tue, 20 Feb
 2024 19:28:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220133950.138452-1-herve.codina@bootlin.com>
 <CAMRc=MfWPEOHeNvAwra-JxHZBFMrQbP+273zbFLDZfxi7fx8Yg@mail.gmail.com>
 <20240220155347.693e46e1@bootlin.com> <CAMRc=MeSgCOLZvFOXF4eQOp=bTz38K5Krzuy9r569-jnDx1zFA@mail.gmail.com>
 <20240220164730.03412479@bootlin.com>
In-Reply-To: <20240220164730.03412479@bootlin.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 20 Feb 2024 19:28:17 -0800
Message-ID: <CAGETcx_=g1dCH=YMUkc7VquUmLs=bNZMspUxH+V49uhcV0Bx2w@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] leds: gpio: Add devlink between the leds-gpio
 device and the gpio used.
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 7:47=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Bartosz,
>
> On Tue, 20 Feb 2024 16:30:11 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Tue, Feb 20, 2024 at 3:53=E2=80=AFPM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > On Tue, 20 Feb 2024 15:19:57 +0100
> > > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > > On Tue, Feb 20, 2024 at 2:39=E2=80=AFPM Herve Codina <herve.codina@=
bootlin.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Note: Resent this series with Saravana added in Cc.
> > > > >
> > > > > When a gpio used by the leds-gpio device is removed, the leds-gpi=
o
> > > > > device continues to use this gpio. Also, when the gpio is back, t=
he
> > > > > leds-gpio still uses the old removed gpio.
> > > > >
> > > > > A consumer/supplier relationship is missing between the leds-gpio=
 device
> > > > > (consumer) and the gpio used (supplier).
> > > > >
> > > > > This series adds an addionnal devlink between this two device.
> > > > > With this link when the gpio is removed, the leds-gpio device is =
also
> > > > > removed.
> > > > >
> > > > > Best regards,
> > > > > Herv=C3=A9 Codina
> > > > >
> > > > > Herve Codina (2):
> > > > >   gpiolib: Introduce gpiod_device_add_link()
> > > > >   leds: gpio: Add devlinks between the gpio consumed and the gpio=
 leds
> > > > >     device
> > > > >
> > > > >  drivers/gpio/gpiolib.c        | 32 +++++++++++++++++++++++++++++=
+++
> > > > >  drivers/leds/leds-gpio.c      | 15 +++++++++++++++
> > > > >  include/linux/gpio/consumer.h |  5 +++++
> > > > >  3 files changed, 52 insertions(+)
> > > > >
> > > > > --
> > > > > 2.43.0
> > > > >
> > > >
> > > > Can you add some more context here in the form of DT snippets that
> > > > lead to this being needed?
> > >
> > > / {
> > >         leds-dock {
> > >                 compatible =3D "gpio-leds";
> > >
> > >                 led-5 {
> > >                         label =3D "dock:alarm:red";
> > >                         gpios =3D <&tca6424_dock_2 12 GPIO_ACTIVE_HIG=
H>;
> > >                 };
> >
> > Do I understand correctly that the devlink is created between "led-5"
> > and "tca6424_dock_2" but actually should also be created between
> > "leds-dock" and "tca6424_dock_2"?
> >
>
> Yes, that's my understanding too.

I'm replying here instead of the RESEND because here's where the
context and example are provided.

I quickly poked into the gpio-leds driver. Please correct me if I'm
misunderstanding anything.

It looks like led-5 will be added as a class device. But the
dev->fwnode is not set before it's added because it uses
device_create_with_groups(). So, fw_devlink doesn't create a link
between led-5 and tca6424_dock_2 unless tca6424_dock_2 is added after
led-5. Which coincidentally seems to be the case here. Might want to
explicitly create the device in gpio-leds driver.

The issue you are trying to fix is a generic issue that I'd like to
fix in a generic fashion. It's one of my TODOs which I've mentioned
before in conferences/emails to LKML: device links framework has a
bunch of gaps when it comes to class devices. I've been thinking about
it for a while, but it needs a lot more work and testing. I'll roll in
this case when I deal with it in a generic fashion. But here's the
general idea of things that need to be addressed:

1. "Managed" device links allow having a class device as a supplier,
but that'll mean the consumer will never probe.
2. What if a class device is a consumer and the supplier isn't ready.
What does it mean for the class device to be added? Is it available
for use? Probably not. Can we do something here that'll be useful for
the class implementation?
3. What if the supplier and consumer are class devices, when does the
consumer class device become "available" (do we check the suppliers of
the supplier?)?
4. What happens if the supplier of a class device gets removed? Do we
notify the class so it can do the right thing? Do we force unbind the
first ancestor that's on a bus? (your case).
5. What if a supplier class device is removed, should we unbind the
consumer (if it's a bus device)?

I'm currently working on a patch to break dependency cycles. Once
that's in, the next TODO item I work on is going to be this or clock
framework sync_state() support.

So, I'd recommend waiting this out if it's not urgent.

Heh, here's my commit on my local repo from a year ago when I touched
on this and realised the scope of the work.

commit 7dcaad52e569209104408f3e472fde4ef8cd5585 (class-devlinks-v1)
Author: Saravana Kannan <saravanak@google.com>
Date:   Mon Feb 13 13:40:43 2023 -0800

    add class support to device links


Thanks,
Saravana

