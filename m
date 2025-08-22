Return-Path: <linux-leds+bounces-5285-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CCB30E8B
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 08:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3FAE7AC2F1
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 06:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFBA296BC2;
	Fri, 22 Aug 2025 06:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+f1n9KJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098167262F;
	Fri, 22 Aug 2025 06:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842962; cv=none; b=JH9dWgX3sqt6c0dbMapCe7x0AUOBkgF3O1IxXCrDp9+PfF1hIhm52rya/GkpVh8/u7AwAqIo6aw4JmP9Tl7mEY7xuj8rG94OMUzmKaPGUsYRClNMAGrhze5YnOlbZLLcmYRvh73HcyhsC9OAiZZnxcyJATr4dpyFId03fp+Kp9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842962; c=relaxed/simple;
	bh=9yTb3PAVEacxL6bQaT/9FkSQrAKZ3na8Gmlj6O0VA8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik12WfGrjdravorTv40t65JNXVqOMKjj7bLJ27sAyClthrhnYzgGQLsESuHHMYzegXbq1+UhzXOjfMLCXGl2Wm685ID+Svl5oynQKxtBBnUd3ymoYCVRw3qPsehOVK8CiEShRO9KRyTNIgcZQGZ9Lsa7MKsItRdKoUfShGE/0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+f1n9KJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb78c66dcso254663966b.1;
        Thu, 21 Aug 2025 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755842959; x=1756447759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi9ufJCYcPUexTZJoE4UsVh6dtoNuzhBR4xZQUiWPNo=;
        b=I+f1n9KJPJtvibzgGgR6cIcqZoh3XJEwYPrZbcRBQ7oB61yIzOGvZB6/imY0S04JL3
         qHbWfDV/ozxHUKNt7VUHTFFYr+DLmSrDBvoTH+syZOUGSdZF6TyaallI3+HPeTV4MLli
         /EASz0apZPxSxAMa5jeanx6II8dW4mRbQn723SnnxhxiomCD+A5FcPVXmOqq+DWE8EM8
         v9RLbin7b1uabKTOeZ1lUs3zScuV9i9941NDn41z00KzxedE0CWLxEWWzPtVlGw08roF
         I3vusAFr8gKE20f15cO9CMAt/nVOu7G/ECHG5I+ug1FkHY8UB9VRC/eXy2/QoGT0Q3t7
         jSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755842959; x=1756447759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi9ufJCYcPUexTZJoE4UsVh6dtoNuzhBR4xZQUiWPNo=;
        b=RtOgSX+jDMJdIQsh7+f+13xFAplAzXilSCLBIb/IbpRFLEV7set28yUQqjPZWZqLvu
         PMacPkIPeHhseFiMpHAFYtpdOEcSKM2en73oT+u+aKutMX7zZfZGeUflScELnLJw4W36
         nvgxZKUYT7Gyuyzmtk14U7XeePrBdN/MsH85bmuj9Gc1A9GXaP+NjbHygrnpsIzKaR2E
         0q+Y222OzS0xP3S+54oc4nw7WmaN9w8Whou9ys4x+u0ulZsGabKvNYl2hCPay89HbCGz
         gXbjvEJBAESrbYcO32gkm/bQ9PPJy4FmpC0dIXj0zpM+Zw5toorDCSjEgI8fLwRpV70j
         vjzg==
X-Forwarded-Encrypted: i=1; AJvYcCUr+XgzWdn0jKrpRLc8hBprv2Mh8vZ5hlM9o0GCA0wULJfSuEx6YjDgAhPdXFDSYN+DCcQKY8aRmNw7OGvz@vger.kernel.org, AJvYcCV3yLUtDNQNDX5Yd4zH8EdPHM+KOapcTBAz2mPd8xGzwdWQCvnNtotter9GDLvcwlAtUM9xuLQrChrc9Q==@vger.kernel.org, AJvYcCW9p+w3uDcFnAQ7PVtHgN/sI/V8Xp1AFWiLAboGmAeOhN4PJa6DhIzMxA26DfSAG9JrLP0UJuGNYcKh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8qF3roo7At6TqzZ66VVF56uQcsqzjWDBZw1DAHsm25TFwri6
	LslwcVhuEy+3jBduwzxQEI8XnlF1OkHnrpGKjDoscxkWb6I5Yi8ZA5J4YLpgMVoyd2q+0j7WcOA
	ZeMqCDN+hsMSk4Sp6fdG20yt1DI5X9nI=
X-Gm-Gg: ASbGncuXx6vFLdsyVgCNHwCaYVD1/QpQFekhBC1Roi++fXv7x41Fz231FEQZw2UIeJZ
	88EV6cwGqXwyQvJ3B8qJtEfuNUe3mnK2WI1Qmx0Oxxw4AVy28jPKWe9gQ4uQv5kqLoj43d1bQGy
	Ds9Qp85wkf2yrIPZWk0Jih118hBazW2rqsfXkKotw+qEWG0hmuMkU940oocfQvbPI22etyhoLiI
	Jrp5gofJuOHTcMPog==
X-Google-Smtp-Source: AGHT+IHe8G376Jxt79RgjqddGtxUfu8mc1uuyD/D5cLtuNRmXpCaDXIePUP3fceF5qlhVgDDU3amnDOg/XupQNgEvvo=
X-Received: by 2002:a17:907:7fa1:b0:af9:8c1c:b9be with SMTP id
 a640c23a62f3a-afe28f15455mr160114366b.14.1755842959043; Thu, 21 Aug 2025
 23:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-4-jefflessard3@gmail.com> <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com>
 <D21AECF9-85D7-4846-9DE6-8B9DD912339D@gmail.com> <CAHp75Vcdp5fHPNAy=_iEFR6Fa5PEE4U++T5owE1mW_H2-y3ijA@mail.gmail.com>
 <D0111A5F-5FA1-4405-A86A-C0D772FDAAEA@gmail.com>
In-Reply-To: <D0111A5F-5FA1-4405-A86A-C0D772FDAAEA@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Aug 2025 09:08:42 +0300
X-Gm-Features: Ac12FXx0gZV2c6nDcTrplAHEqnsRimF8H_nsVjFm26TxmGuBxUQqmzLIBvyhYVc
Message-ID: <CAHp75VcpJzMUtrN2kBhWs90G3n6_NWTBhw3MX2WpuhsDt7zmjQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
To: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 5:20=E2=80=AFAM Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:
> Le 21 ao=C3=BBt 2025 16 h 19 min 23 s HAE, Andy Shevchenko <andy.shevchen=
ko@gmail.com> a =C3=A9crit :
> >On Thu, Aug 21, 2025 at 10:04=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> ><jefflessard3@gmail.com> wrote:
> >> Le 21 ao=C3=BBt 2025 04 h 08 min 51 s HAE, Andy Shevchenko <andy.shevc=
henko@gmail.com> a =C3=A9crit :
> >> >On Wed, Aug 20, 2025 at 7:32=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> >> ><jefflessard3@gmail.com> wrote:

...

> >> >> +#define TM16XX_DRIVER_NAME "tm16xx"

> >> The TM16XX_DRIVER_NAME macro is standard practice for consistent strin=
g usage
> >> in registration and module macros.
> >> If helpful, I can add a leading /* module name */ header comment.
> >
> >Instead of an unneeded comment it seems better to use explicit string
> >literal in all cases (two?).
>
> I'm surprised by this preference since driver name macros are very common
> practice, but I'll use explicit string literals to align on this preferen=
ce.

Usually we put a macro to something which (theoretically) might
change. The driver name is part of an ABI and I prefer it to be
explicit as we do not break an ABI. Once introduced it can't be
modified or removed. Also it's better to see clearly exactly at the
place in use in the code the name as it's easier to (git) grep for
something similar. With a macro I would need to grep at least twice to
see the users.

...

> >> >> +       keypad->state =3D devm_bitmap_zalloc(display->dev, nbits, G=
FP_KERNEL);
> >> >> +       keypad->last_state =3D devm_bitmap_zalloc(display->dev, nbi=
ts, GFP_KERNEL);
> >> >> +       keypad->changes =3D devm_bitmap_zalloc(display->dev, nbits,=
 GFP_KERNEL);
> >> >> +       if (!keypad->state || !keypad->last_state || !keypad->chang=
es) {
> >> >> +               ret =3D -ENOMEM;
> >
> >> >> +               goto free_keypad;
> >
> >(Hit send too early that time...) This goto is bad. It means
> >misunderstanding of the devm concept. See below.
>
> I can assure I understand the devm paradigm. The keypad probe is optional=
,
> failure doesn't fail the main driver probe but only generates a warning. =
The
> cleanup code prevents memory from staying allocated until device removal
> in this specific optional failure case. However, if you insist, I'll remo=
ve the
> cleanup and let devm handle it normally.

Assume you have a separate feature, let's say keypad driver for some
complex HW, like this one, and you have even a separate (library)
driver for it. Then you want to introduce some kind of library
functions to probe and remove the only keypad part, here are two
options:
- follow the library pattern with plain (non-devm) k*alloc() in probe
and kfree in remove
- use driver pattern with devm

If you choose the second one, it will be weird to call devm_kfree().
The rule of thumb the devm_$FREE_MY_RESOURSE() *must* be *well*
justified. Because it's exceptional. Losing 1kb memory or so is not
enough to justify.

> >> >> +       }
> >> >> +
> >> >> +       input =3D devm_input_allocate_device(display->dev);

> >> >> +free_bitmaps:
> >> >> +       devm_kfree(display->dev, keypad->state);
> >> >> +       devm_kfree(display->dev, keypad->last_state);
> >> >> +       devm_kfree(display->dev, keypad->changes);
> >> >> +free_keypad:
> >> >> +       devm_kfree(display->dev, keypad);
> >> >> +       return ret;
> >
> >No way. We don't do that, If required it signals about exceptional
> >case (0.01% probability) or misunderstanding of devm:
> >- managed resources are managed by core, no need to call for free
> >- using managed resources in the contexts when object lifetime is
> >short is incorrect, needs to be switched to the plain alloc (nowadays
> >with __free() from cleanup.h to have RAII enabled)
> >
> >Choose one of these and fix the code accordingly.
>
> Same as above.

--=20
With Best Regards,
Andy Shevchenko

