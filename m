Return-Path: <linux-leds+bounces-2189-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BCA927CA3
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 19:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495731C233A4
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 17:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBF239FC1;
	Thu,  4 Jul 2024 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrc12jRs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A894085D
	for <linux-leds@vger.kernel.org>; Thu,  4 Jul 2024 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720115591; cv=none; b=F6Bjpp0qIhIKKl/HgnHryvmTl093D7zfqEo/dfChtOaCF9QnAKKhjMa1HB5df5FtWScSS00fkkT+sEuz8WyMs61iRDF/X+/LKriiDqQTCTFtHKsdHyg7//b9vJMI1xmYx9gg38PzZ7sKuge3dLd2xrIlWlq5/Ux7gERNE+oXYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720115591; c=relaxed/simple;
	bh=CvifkHUdGRKSvx1UjB6MK+FRqd4uOB5IU7coWKdD97s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6vb8J3pWm4yBLBU8to19j0BmXoKbnDBNILdO84ACmENs1OHyLhgclPYIs7kSEmq1jEPSYzJnMAd3GUgjAg5YuY/Z6PmB2RGHieYT9+SrqVIyMjedA9nvqkot4bX3zOEXs8Eo7lXPtl5ca1SO4D8QaJF4ATkCB9hcUvgPu9OaNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrc12jRs; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57cb9a370ddso1197145a12.1
        for <linux-leds@vger.kernel.org>; Thu, 04 Jul 2024 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720115588; x=1720720388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GorGvo3dqH3oj9ZZZsXyRZ+VMILEjEKT1veO1qV13kI=;
        b=xrc12jRsh+tY4QuLQOKy62B4XRsGR1HcWF12Hl4K4uV+fYCr9/CoWb24mLt6BDqPmc
         qJa3QVa3xViTWuXRPA4zuOP9BbSSxJsvlNg1iA1KhF9cVBjzGl7r9OPncuPtBSKX5+s8
         cyL2drRn9BsD5z66HkcnrOEC7siavkJ8dh5BAzmhKMUr7Vqg65j+I4mhptlx8i3mnLHN
         vtXQzCmQgfJm4alAPC+gAshUrTw0b/W5cuLkPQxE1t8q11xoA+Ln1SUxURriqeFiOJNY
         hJbGlEOOnD193wpaCDvl/5XCuJv2DrfKvHOD+wXXuBVeC8UZt/xibY+wIHquBPzh8nno
         FG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115588; x=1720720388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GorGvo3dqH3oj9ZZZsXyRZ+VMILEjEKT1veO1qV13kI=;
        b=lJ2E5DoenIg8YU8XvOe3lXiDF8GIMtDytu6dXDqGU38yyp2tAJLbGOjSMhF1GLhQ1u
         aZEOv7jSrtvhIiiaRZYCEGdPqxYHaB1FgKMsg32lz83fzPQ25tDuqetYgtBluOK4tKDR
         UyWOA/XxbmYoTzyz3ebNeDZG7756lbiZzsCIkHHU7/9HAHZwHFvxcGV1C/50Wadqu8L8
         KVUQG/IR5YLtdQMmzT6Be9SWM9Qbff98qCbv2tufO7ey/KHYp26i7o5In7eQ/+qCrSDO
         zV4uikZTef3/bpGxEv6OaisNUJFO/yKGGt3zDi96BFmaI7Y/aZhrzJObIKslZ4w+xwLf
         8fYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPy5nqOZ4Fuu7687/6+4Q2bPVorwSORgDqfCa76vwA1qjbvWkgSrDCMaaju9BeNaQnsX2Sk/90+SQi3j7OU2EaM9gH5c1uWoxjRA==
X-Gm-Message-State: AOJu0Yw6M3oGqK05yHKthA5H+UaYR5ZhZ1HCp2d70GehPxEsQmCuQ8W/
	SR/+NpL1c13eYpZDso956H3/2ga30U2sntpxjE0jv6OJSq6U7XTHTTYEYCDi8PZjewyCTWWdrL2
	vM9zyfSRKCACOYJ9cgncLU6aVmxPVeDXEQTVR
X-Google-Smtp-Source: AGHT+IF4AuPS7UKCOENONhcvXkRgVR3N6FHFHaIQR/6qkRUomCZ6PNDgZ3xDtrCJN3vH/nfmSRkEFjtG+LczGMIVq2k=
X-Received: by 2002:a17:907:97c8:b0:a77:a58f:7f6a with SMTP id
 a640c23a62f3a-a77ba70e417mr242751466b.38.1720115587430; Thu, 04 Jul 2024
 10:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703164635.221203-1-zenghuchen@google.com> <20240704165000.GA501857@google.com>
In-Reply-To: <20240704165000.GA501857@google.com>
From: Jack Chen <zenghuchen@google.com>
Date: Thu, 4 Jul 2024 13:52:54 -0400
Message-ID: <CALvyBcV8b_AiKK-QBRU1sphrWjgATecTyd7c27Y-gNtJv1hV8A@mail.gmail.com>
Subject: Re: [PATCH] leds:lm3601x:calculate max_brightness and brightness properly
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Brown <broonie@kernel.org>, 
	Vadim Pasternak <vadimp@nvidia.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Many thanks to Lee for the quick response. I will submit a V2 patch later.
> > -     ret =3D regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightne=
ss);
> > +     ret =3D regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightne=
ss - 1);

> Why is there now a need to start adding/subtracting 1s to make the maths =
work?
This is because lm3601x torch brightness register takes 0 as the
minimum output current (2.4mA). But led_brightness uses 0 as LED_OFF.
So we need to add -1 offset to avoid blocking users who want to set
the torch output minimum.


On Thu, Jul 4, 2024 at 12:50=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Subject line needs fixing.
>
> `git log --oneline -- drivers/<subsystem>` is your friend.
>
> > 1) check the range of torch_current_max,
> > 2) calcualtes max_brightness precisely,
> > 3) lm3601x torch brightness register starts from 0 (2.4 mA).
>
> Please write this out as a proper paragraph.
>
> This isn't really a numbered list type situation.
>
> > Tested: tested with a lm36011 and it can set its brightness to lowest
> > value (2.4 mA)
>
> What is the Tested: trailer?  Again, please write this out properly.
>
> > Signed-off-by: Jack Chen <zenghuchen@google.com>
> > ---
> >  drivers/leds/flash/leds-lm3601x.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/led=
s-lm3601x.c
> > index 7e93c447fec5..fc4df904ea90 100644
> > --- a/drivers/leds/flash/leds-lm3601x.c
> > +++ b/drivers/leds/flash/leds-lm3601x.c
> > @@ -190,7 +190,7 @@ static int lm3601x_brightness_set(struct led_classd=
ev *cdev,
> >               goto out;
> >       }
> >
> > -     ret =3D regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightne=
ss);
> > +     ret =3D regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightne=
ss - 1);
>
> Why is there now a need to start adding/subtracting 1s to make the maths =
work?
>
> >       if (ret < 0)
> >               goto out;
> >
> > @@ -341,8 +341,9 @@ static int lm3601x_register_leds(struct lm3601x_led=
 *led,
> >
> >       led_cdev =3D &led->fled_cdev.led_cdev;
> >       led_cdev->brightness_set_blocking =3D lm3601x_brightness_set;
> > -     led_cdev->max_brightness =3D DIV_ROUND_UP(led->torch_current_max,
> > -                                             LM3601X_TORCH_REG_DIV);
> > +     led_cdev->max_brightness =3D DIV_ROUND_UP(
>
> This is no place to break a line.
>
> Break after the '=3D' and wrap at 100-chars instead.
>
> > +                     led->torch_current_max - LM3601X_MIN_TORCH_I_UA +=
 1,
> > +                     LM3601X_TORCH_REG_DIV);
> >       led_cdev->flags |=3D LED_DEV_CAP_FLASH;
> >
> >       init_data.fwnode =3D fwnode;
> > @@ -386,6 +387,14 @@ static int lm3601x_parse_node(struct lm3601x_led *=
led,
> >               goto out_err;
> >       }
> >
> > +     if (led->torch_current_max > LM3601X_MAX_TORCH_I_UA) {
> > +             dev_warn(&led->client->dev,
> > +                      "led-max-microamp cannot be higher than %d\n",
> > +                      LM3601X_MAX_TORCH_I_UA);
>
> "Max torch current set too high (%d vs %d)"
>
> > +             led->torch_current_max =3D LM3601X_MAX_TORCH_I_UA;
> > +     }
> > +
> > +
>
> 2 lines?
>
> >       ret =3D fwnode_property_read_u32(child, "flash-max-microamp",
> >                               &led->flash_current_max);
> >       if (ret) {
> > --
> > 2.45.2.803.g4e1b14247a-goog
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

