Return-Path: <linux-leds+bounces-2320-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE0593C2AF
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 15:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99674B21F29
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 13:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE4F199E9B;
	Thu, 25 Jul 2024 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBhi0w+A"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42DE17557C
	for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2024 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721912868; cv=none; b=tFwjitr+3uPwiD89Sg43FRP1fYGXmTm76RjbMjOmZs2yOiAd7WmiRKF0fV0jdUL9vOH7i4QX4XoYzSgrXJdbPMK/cbjpigPhYtdZWi3DnCRzU8R3LFDX/8QidtlRlw9n7stcwjjWQUnX/BnICne42BaR9iEBdfjAp7HusdP8m0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721912868; c=relaxed/simple;
	bh=3YztVsy+2pBlXE9PeuX0tLOrSJ8u2RoGCF6ytbWK9rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9BqC6/3PKJXOR10fELSm5469Ro+Fs7ylTlHDT0mPd2rDbq3wVCXVikmfmikmfsnukoTtefsbZ/s904ArXZHHl2N8EEkbA7xwUvZwVwI2yc4YIFgzxvty/7JRHBis1/CHWWMr7s/1Vk89nt4rUQBI4d+8RSZE1T+nKCG5ewtG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBhi0w+A; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-260f033fda3so84691fac.3
        for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2024 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721912866; x=1722517666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1OnNW/frbYxEJq76fP5iSAE4EweyDxyYldIRdp9KPiQ=;
        b=iBhi0w+Aq/+PwbasWL6pBXn47VvNvzJ/fW8cED0ZzKBRjwnO00G3uKwmKpqbM8xXnz
         ppG6Cm45tAQqzgempc+AIMPD34Gy1K/CXDumNOoCSX38cRyilazfoYxJ6YiwahInY418
         f72/+gmyi2o9XC9Ixm4NcNhugH7dC/g6dYI9m0RE1hkUC3tgGfqeLO7+Fck9OEd+LLEt
         iyFeU8ONLJ1nDx4QaInspPvMfV1tcMDuebUYYmRSeGbhMf7SZb/Nt5KXDV9y9VtXhGQE
         kKzjR1ymxgINvwNiSRjL6fW+qL4p4MjKtUvKU6oW1axw6DxDw0lhjI2hT0YgOlf4Risd
         5ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721912866; x=1722517666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OnNW/frbYxEJq76fP5iSAE4EweyDxyYldIRdp9KPiQ=;
        b=siFmJBkLER4/SYckGO+dd2YU8oJClmh28IuiwLfkrRjonXi/apAU/D543XT2SpSuvR
         EUygBPI0pExe15gvDLswLXfK4HnKwm8YLqqEXxMEraWdXsTGBA6KK1lLSf5LEbRtejeg
         d8HcERdZgOB0Eb3GQsTXx62hss342tz4y9qouBcxdRl8rC13yHk8HmrKkA9eWpxNiDkc
         gjQipEBIhDFNgBmTw1YuGi9HMI4dTfG1i4bfz3Wv3MlkeHQFmoUHxTMhOKrP9tcwhcLW
         QjsvRC4TxTuC0VFDGGr4Vvgwl211N3jnsKLO3hZSM95Xf8p93qxY41R4VCr9I+kAqaX8
         Hbqw==
X-Forwarded-Encrypted: i=1; AJvYcCWFyUXV5b/TIK3toMFkAsstKDJ/knGGHjlM/uKPW1haVqPTB9cTWQGi0K8MBwwXEGzs3tzM2sSUqeMQuZXSc7qZCHw/TyyAzDO0pA==
X-Gm-Message-State: AOJu0YzwePkqLYiu2JnmzChXUVyTfPcNeCCuleSy0a6uIkIa1XAlDwgi
	L9l0jJakYk9GcG1QoJ9ZiqTbc4cT/rtOP78fAiml+gW9Y96qoNshGTp0gIJSqcCFCrdIAOjGYsQ
	ok6Rxp6AyPAzpqu9EJl3vRMqsDEjtcDWZ
X-Google-Smtp-Source: AGHT+IE+cE7qKxZu4XlBwdK6uCrga6BRFMyHVTMKMz27V0BIUY8YZvhdqCk7Ip7VHr7FU1mNwG5Wk51CmcaiS6umkf0=
X-Received: by 2002:a05:6870:219d:b0:25d:efdb:ae23 with SMTP id
 586e51a60fabf-264a0d3506emr3215777fac.27.1721912865750; Thu, 25 Jul 2024
 06:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
 <20240725102623.GF501857@google.com> <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>
 <ZqJHEdxwEpr5W605@duo.ucw.cz>
In-Reply-To: <ZqJHEdxwEpr5W605@duo.ucw.cz>
From: =?UTF-8?Q?Guilherme_Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>
Date: Thu, 25 Jul 2024 10:07:09 -0300
Message-ID: <CAM_RzfbkPN+Wjuj5y60jnAO_w5iSU68TLErcpuyJ=z0kX4RFrA@mail.gmail.com>
Subject: Re: [RESEND LEDs] leds: remove led_brightness
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Pavel Machek <pavel@ucw.cz> writes:
>
> Hi!
>
> > > > The includes/linux/leds.h diff:
> > > > -/* This is obsolete/useless. We now support variable maximum brightness. */
> > > > -enum led_brightness {
> > > > -       LED_OFF         = 0,
> > > > -       LED_ON          = 1,
> > > > -       LED_HALF        = 127,
> > > > -       LED_FULL        = 255,
> > > > -};
> > > > +// default values for leds brightness
> > > > +#define LED_OFF  0
> > > > +#define LED_ON   1
> > > > +#define LED_HALF 127
> > > > +#define LED_FULL 255
> > > >
> > > I'm not aware of the history of this, however I'm even less sure how
> > > converting these from an enum to #defines makes this any better.
> > >
> >
> > Yeah. The TODO says:
> > -* On/off LEDs should have max_brightness of 1
> > -* Get rid of enum led_brightness
> > -
> > -It is really an integer, as maximum is configurable. Get rid of it, or
> > -make it into typedef or something.
> >
> > I could only remove enum led_brightness, but in some places, the
> > LED_FULL, LED_HALF...
> > are used. This is why I created this #defines.
> > I don't know what we can do in these cases that LED_FULL, FULL_HALF is used.
> > For example, in the drivers/leds/leds-ss4200.c on line 223 have this code
> >
> > u32 setting = 0;
> > if (brightness >= LED_HALF)
> >     setting = 1;
>
> Yep. Such drivers should be modified to set max_brightness to real
> number of steps hardware can do... then we can remove LED_HALF,
> LED_FULL and such defines.
>
> Best regards,
>                                                                 Pavel

but this will require the effort of everyone who has already written drivers
for some LED hardware. Because only the driver author himself will know
all the steps for that specific LED.

or, maybe we can adapt this drivers for understand the brightness as a 0 or 1.
0 for OFF and 1 for HALF and FULL. This is possble ?

