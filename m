Return-Path: <linux-leds+bounces-2351-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B593FEAD
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 22:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8161F280FCA
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 20:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CD773466;
	Mon, 29 Jul 2024 20:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrOsfrRG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363E43152
	for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2024 20:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722283279; cv=none; b=bW8ZdQjlnU/NyWtnSA4fn3wCqTZLeNhv8sT7nlDv+zP8Frz7Okouq5ANGIH6i056jHA+k06mF+GWzx99Gc0cpplszMaqd1BfUQl7jOZZNeUD+EZhtZmIAtjFQi1K35tI2Q0rZagAITjDpByOaM5W8Q6EUs+8wVrYiKFRXb8wuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722283279; c=relaxed/simple;
	bh=3ecwD2j0YY1a/jD8MyUSWPaGtDZuUegbUZi9goqxQ+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGkqHUIgo1yuzGiu9rSLTplrbF+coSDYHm0q3xJyMjN+gmyY1IsHHp0ntQayzZG2fVhRLvC8t15aiMIQ27LY1uEYmV0hLtnpy93opCga9rkwsQNRK1yAHDzlgXb/jYVkZNVTttRc0gHGZmpjKu+icQyRAML8CfDLZHGsoPzeWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrOsfrRG; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44fe28eb1bfso20842851cf.0
        for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2024 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722283277; x=1722888077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5y/aFmsXVIkHl+y0+G5ZLyWerscQAF3I6F+a6tuJj8=;
        b=GrOsfrRGE3+EDBzpsx3Wb8b9htWPaVs0pDNIXm0oC49/FPHhjGz7OgWtWRX6/oNOex
         1nlyKlK0jWC19bmPH2JUvkW6SDATSmfzaOgLcdkgDKEWCzNJ123D6e2VaLSXSPsbW6Bn
         U7MEnjVHYrOp0AHO+W5tIyOAfPYIlzwSbboGZ9V3gYY2ZNIAF59Z85wA9I1RFXTDxjkK
         6MDxe32HFHR90odBhnCiIw8xlmYJVO0kfx98NnAIpXy6QYyeP7LKlRtREqyHgjsahBo3
         ycFeO6PTrUOf4bqEHO+ZWxQ0rduztCqpunboTSDeK1kizo91gbSvjy3KA46NQoImNSzJ
         75yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722283277; x=1722888077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5y/aFmsXVIkHl+y0+G5ZLyWerscQAF3I6F+a6tuJj8=;
        b=oEC6LZ8cfJ2g7NUV2z0annuKSplWczVOdDis/AQQHKgVcaGbLVSZgz/IivuLaFGWo7
         /JHcBXLD7MrHI9CG04q6JtGisqFJ15wn1LHle28YOBTPTYRsFdg/GqU392WvV03CDbmU
         ed1OwtEpl455DVgV3pZ6yXEg0lZ9lCVEIDzSb49ozbX8C8+A2ybNca0qGVvkE291w/wN
         DkIRAvU8Y3Ed8xIMNM3Glab2NenVy8Ldh+ij6s1IRaeikUEWAw4zYaju+Ixh+FGT6/HZ
         0KSBWWbtP4/EPq98vJ9jsrRpPReR6Hw6VPobscblDsU2hPB5i8/nkBZHdtdXrwhZ3p4S
         qLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEaRzrsSDFZ+YGy40xwteflLRgNIPk+dSZdfviGTylHh2ROqn/I9Yg1L5lQneNoYW5yNhWBqY+t1D2B2ahCuca21qxMy6LgB+blA==
X-Gm-Message-State: AOJu0YyIHSZhsFKPTY+GATFxZ78bVwPOD2GIfLG/jYZlZFPHVo/DHwUa
	FUz4X3qpWW5JVbmTRFPqCeIzl5/l8pZe1XctETwQWUskF772K+SoxNAw9/6UXZ8+yFUavdplDgE
	GaYUHKe00Q5K3mcdtxUeYJdNPI75/lQ==
X-Google-Smtp-Source: AGHT+IFRgfQUqjSi590NhPRoXjYviMdNrkr0fJbOE7jaBFTl9gBzCaBA1LelHZJ0TVTjto0E3zQE1fU6sc5TqMuH974=
X-Received: by 2002:a05:622a:8b:b0:447:eb43:5d0c with SMTP id
 d75a77b69052e-45004fcbbc4mr101053021cf.59.1722283276408; Mon, 29 Jul 2024
 13:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
 <20240725102623.GF501857@google.com> <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>
 <ZqJHEdxwEpr5W605@duo.ucw.cz> <CAM_RzfbkPN+Wjuj5y60jnAO_w5iSU68TLErcpuyJ=z0kX4RFrA@mail.gmail.com>
In-Reply-To: <CAM_RzfbkPN+Wjuj5y60jnAO_w5iSU68TLErcpuyJ=z0kX4RFrA@mail.gmail.com>
From: =?UTF-8?Q?Guilherme_Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>
Date: Mon, 29 Jul 2024 17:00:40 -0300
Message-ID: <CAM_RzfY4GR1Jkym4mpGUVtsew3T--nqKWJD_sb_0tc5hDFBiSw@mail.gmail.com>
Subject: Re: [RESEND LEDs] leds: remove led_brightness
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the drivers/leds/leds-clevo-mail.c for example, the LED_HALF is
used on line 102.
In drivers/leds/leds-pca955x.c the LED_HALF is used in line 260.

How can I remove these keywords if manufacturers still use them?

Em qui., 25 de jul. de 2024 =C3=A0s 10:07, Guilherme Gi=C3=A1como Sim=C3=B5=
es
<trintaeoitogc@gmail.com> escreveu:

>
> Pavel Machek <pavel@ucw.cz> writes:
> >
> > Hi!
> >
> > > > > The includes/linux/leds.h diff:
> > > > > -/* This is obsolete/useless. We now support variable maximum bri=
ghtness. */
> > > > > -enum led_brightness {
> > > > > -       LED_OFF         =3D 0,
> > > > > -       LED_ON          =3D 1,
> > > > > -       LED_HALF        =3D 127,
> > > > > -       LED_FULL        =3D 255,
> > > > > -};
> > > > > +// default values for leds brightness
> > > > > +#define LED_OFF  0
> > > > > +#define LED_ON   1
> > > > > +#define LED_HALF 127
> > > > > +#define LED_FULL 255
> > > > >
> > > > I'm not aware of the history of this, however I'm even less sure ho=
w
> > > > converting these from an enum to #defines makes this any better.
> > > >
> > >
> > > Yeah. The TODO says:
> > > -* On/off LEDs should have max_brightness of 1
> > > -* Get rid of enum led_brightness
> > > -
> > > -It is really an integer, as maximum is configurable. Get rid of it, =
or
> > > -make it into typedef or something.
> > >
> > > I could only remove enum led_brightness, but in some places, the
> > > LED_FULL, LED_HALF...
> > > are used. This is why I created this #defines.
> > > I don't know what we can do in these cases that LED_FULL, FULL_HALF i=
s used.
> > > For example, in the drivers/leds/leds-ss4200.c on line 223 have this =
code
> > >
> > > u32 setting =3D 0;
> > > if (brightness >=3D LED_HALF)
> > >     setting =3D 1;
> >
> > Yep. Such drivers should be modified to set max_brightness to real
> > number of steps hardware can do... then we can remove LED_HALF,
> > LED_FULL and such defines.
> >
> > Best regards,
> >                                                                 Pavel
>
> but this will require the effort of everyone who has already written driv=
ers
> for some LED hardware. Because only the driver author himself will know
> all the steps for that specific LED.
>
> or, maybe we can adapt this drivers for understand the brightness as a 0 =
or 1.
> 0 for OFF and 1 for HALF and FULL. This is possble ?

