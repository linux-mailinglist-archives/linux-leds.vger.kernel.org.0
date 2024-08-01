Return-Path: <linux-leds+bounces-2379-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B5944F2A
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 17:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7986C284985
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2024 15:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A04B1AB53C;
	Thu,  1 Aug 2024 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2NmgfCfo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4746132139
	for <linux-leds@vger.kernel.org>; Thu,  1 Aug 2024 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526051; cv=none; b=hH1X6UCu3zjceNYwsBXNJJCBj4oIb9ORR+CAsGhaw/bSQeIOZxTYdNCg2t63TA7rST+GExzEu/QErmVC1IgYbWqQWfxcQx+Qe0xhkZ10NOhvhg4nnKlT1n3mUPWt9YJF0BxVP0HIfkEz0uiLQN2TO77H/N5GVdZ4ywr9WntiC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526051; c=relaxed/simple;
	bh=QshAT5nHwBzwbqh0Wra2Et1tIZCTOhjcPuHKKzmmIGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKggS989eRAAFu8irYz2fH1iseX/hc1Wta9TyNvdd0QXPlu/dAWeMhK4bEQ4lG+t1BIxhOvHtzrhHLfVCGbSkGTjyoApuMRXvvduilwWkQ2xcjbw2OaYO0c8v8ZVcOYB/x0jiZR7DiTPEHooIMR0I4LPG2q4Y1TAdKcIBXdq9ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2NmgfCfo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso10110971a12.1
        for <linux-leds@vger.kernel.org>; Thu, 01 Aug 2024 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722526048; x=1723130848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llHBGvCnrrbM2tQPX3EBYXnW6V1E7gmvhH0bhr9tEQ0=;
        b=2NmgfCfo94JM8JZ8B8bPqVuav95ZhkX9/RhG85Pm9yrwo8IqJlhJWTMrEeRS+R6Wdd
         QWECf5/DotPoax4i+7zIOxDI8Qbt3ih6xepvXrJrktorkD3gAK/I73h8Bc3nMmpuXrmR
         FD7+umkomoALRTvDekwzGo6i6H36+R5eQN88vKWOsb61ySSsaAd5e3MJbmEEpWvfe9Fi
         Qgj1kU4Ol7NhyhY9qyLjh2CFv++2kV+wjsJAmyAOgGmhq/rAjoy2Bl1e9yuu0zZcU6Su
         bUwaHvyWAL7F6b1+VlQHvjpuubBB8WjYMmjn7v0uuAOeilpIC5/8NvgsJIK8KNTZllR5
         6U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526048; x=1723130848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llHBGvCnrrbM2tQPX3EBYXnW6V1E7gmvhH0bhr9tEQ0=;
        b=A8ezubfsdpx0lEVpHaIk9koSdZGkWNcVGlosZzWDogXlRZ7i+wBLOVCKvorwXEy2yx
         ykicTk687PhnMMt3NqAPkXovvSNprXFnIbj9NIWh7Ojj19uk/hBZJRcD4DICoc4Nirs1
         q4YMKqEvf30jij1xyKZJsIfoOguhqpqgoXJRTE5cBnUlgLPWQJrCUJhzzdNmXD9PnQPW
         oPQ2W4T5KeT5vQ1Czi5yi3skhiL8GXUMkUcM3/bwfQeTVQxQaHa0fRcvvhSUOFd5BK1h
         ie4Z/MUvzfZRmib1hl/Z+doD0DGzyNBI16gHUm4HOFGRSGUxW6ZdpsDkhuvyAtr1M7Tm
         rdhA==
X-Forwarded-Encrypted: i=1; AJvYcCXjnqM67Ck54p/hqdUdRYwfyqHQiAx0LMBtzPIZErxoUgdjMEKudqA/q5w3331PDm/8k0qpQQEJdH+obQjogbs1XRRc7q2hTV7jlA==
X-Gm-Message-State: AOJu0Yyx9dWFo2esAXhmTw7Hviv3Urfp1nFVgsxXQGKnveULpwj7azFc
	FqGDrNcDdZV9nKDDhMEyKrDd/XAUJof3kOK2JjElT5oU/uRPysruTpeXbyT1D6Knzw4khS7/BRz
	XC66ag6Bw9y5mvmPQmescVh4IJ7+/a7B9dA6r
X-Google-Smtp-Source: AGHT+IHUpNg9f9aEEqBpqZzO/6/Ldb/HgwEqURo0GR7CRGI9KXA6gn/xlC1jWWZQFiH5/Q+iFlQ/ZgGckJVDueaau0A=
X-Received: by 2002:a05:6402:185:b0:57c:aab2:7311 with SMTP id
 4fb4d7f45d1cf-5b7f56fd9f2mr467202a12.29.1722526047902; Thu, 01 Aug 2024
 08:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729204054.2269031-1-zenghuchen@google.com> <20240801131511.GA1019230@google.com>
In-Reply-To: <20240801131511.GA1019230@google.com>
From: Jack Chen <zenghuchen@google.com>
Date: Thu, 1 Aug 2024 11:27:17 -0400
Message-ID: <CALvyBcVJZw4meabOP7+8YgbP=5KANXZ3YK3cP0D1i_+C_e5Rww@mail.gmail.com>
Subject: Re: [PATCH] leds: lm3601x: reset led controller during init
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Brown <broonie@kernel.org>, 
	Vadim Pasternak <vadimp@nvidia.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 9:15=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Nit: Subject line descriptions start with an uppercase char in LED.
>
> > LED controller should be reset during initialization to avoid abnormal
> > behaviors. For example, when power to SoC is recycled but power to LED
> > controller is not, LED controller should not presume to be in original
> > state.
> >
> > Signed-off-by: Jack Chen <zenghuchen@google.com>
> > ---
> >  drivers/leds/flash/leds-lm3601x.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/led=
s-lm3601x.c
> > index 7e93c447fec5..978256310540 100644
> > --- a/drivers/leds/flash/leds-lm3601x.c
> > +++ b/drivers/leds/flash/leds-lm3601x.c
> > @@ -434,6 +434,10 @@ static int lm3601x_probe(struct i2c_client *client=
)
> >               return ret;
> >       }
> >
> > +     ret =3D regmap_write(led->regmap, LM3601X_DEV_ID_REG, LM3601X_SW_=
RESET);
>
> So this controller is reset via the ID register?

Yes, that is correct. The MSB of LM3601X_DEV_ID_REG.

>
> > +     if (ret)
> > +             dev_warn(&client->dev, "led controller is failed to reset=
\n");
>
> "LED controller failed to reset"
>
> Or
>
> "Failed to reset the LED controller"
>
> >       mutex_init(&led->lock);
> >
> >       return lm3601x_register_leds(led, fwnode);
> > --
> > 2.46.0.rc1.232.g9752f9e123-goog
> >
> >
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

Thanks so much for feedback. I will send a V2 patch with changes.

Best regards
Jack Chen

