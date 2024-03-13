Return-Path: <linux-leds+bounces-1234-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C287A3B8
	for <lists+linux-leds@lfdr.de>; Wed, 13 Mar 2024 08:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93F01B2149A
	for <lists+linux-leds@lfdr.de>; Wed, 13 Mar 2024 07:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E161E171A6;
	Wed, 13 Mar 2024 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UoQByNh/"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E6168A4
	for <linux-leds@vger.kernel.org>; Wed, 13 Mar 2024 07:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315901; cv=none; b=BnYvRfhOmxoekkIIbblZu6b00LcjuRpCcfZtSQIO9H8f9zAyjmBmbgcHtnh8O9NdgVZd3IFPviIAGvmMJ/EFaOCYoylT9OjjAxSm9lsmxybLbSdKaZjOdZGDsv/N0J5qhpObOEGX1wH/FG3l7qA64axJnmFu33kve5SzkveXtdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315901; c=relaxed/simple;
	bh=8anSx8q99+x/R1N4KLqO1nqPHUMqJRw5y6ZKWDoREsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aw7skH29wtjEmaO1BMZ5jv4Xvd87wjzD3nSfgN0Xt0y7HWywjs8QHBk9jeO9gQm5pIytHKETeHDfG9VIEt/DoceD6JVYiRpLVo1c7E/jn4okxc635LsPKfBhrtXCo1NaigxxEIjjmzSpNSyahHiA/fI+8gmp9S5Q0Va8D+LH8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UoQByNh/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710315899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGrURXceHY9m9JciYiADkX3iVVWUeKWeoiT1soRGRlo=;
	b=UoQByNh/OZV5fVzeJAzX2IQ5ujh4ddmnjsBNuxxLvpRdyDqZxKqCapPFUbTbj30dqTOMsE
	X/IJgtOMXd1Wa5bCJJbT0GdOM6qW0GHY4QFWeV3pvC/hdOlt2lmhYI/vhXIn8pyqODop3I
	MV7A6U1eS8zQwHIUeV0Qp68SUhin9tk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-YOhfP437NBeEGos--Kk-Iw-1; Wed, 13 Mar 2024 03:44:57 -0400
X-MC-Unique: YOhfP437NBeEGos--Kk-Iw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29bad31f920so4676768a91.0
        for <linux-leds@vger.kernel.org>; Wed, 13 Mar 2024 00:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315896; x=1710920696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGrURXceHY9m9JciYiADkX3iVVWUeKWeoiT1soRGRlo=;
        b=frX+GOnNXoa/WgMLEj7N0XsFanUrMpqI+PuzJgJeYv/Ndc52LyVyHcGIfyv13rDrVF
         ufa0s/jTyxRwBZJnOFqUdgqY6AR8SF2B0LbuHArx4WYEhr8R6SPXxaRVd+tUfdg2blU7
         0+vMgg2HFJCQbuSKe9U86bvL7ly+QrrvrXe9c81rUjnOhPT7BK0+6CSP9/Dn6hnId1o3
         j8cQ/55oKLOe7gm6vRX7BuLhl6MK6yElqAFbdNyvK3754QMnsOI2OriiZ3JAhFOTXYmZ
         4CkC7ngEk0Co1jnSa1hF0i8q/8SI7s8K0/iMlipcukBpUIuWATphrHbhOMz6Vvh3OQMB
         6XgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZoEs9bl6aRf2ky0MYWSpe37LKrO5Es+ev0KxD9o9JDMhl6RXUkfUYLjIpURHZ6yg8kFkmm+p96BN99JBEGBYZ05SNYYu7gWAvPQ==
X-Gm-Message-State: AOJu0YxbQM+aHhZ75s2WcFFyWcMBmm9CHhVyhEnC2ZerutSjRDbj3mc7
	mcXzZYWAqyK+zTYdYGxPkROEi4wl07b7MtyYyHwuiludSt0i+IfIOuLVr+chLeqYCyex0zd8Pot
	/TfnvunV+IM9Sd/irYPeRwFfde+uWyg0AqUjsNmpA26bvprYZSXsui2kWCkE/TGTegXYPNSopok
	Ux7aX+ki595iIxvAdX5KQLbPd1DwZPNRPPkQ==
X-Received: by 2002:a17:90a:6b0e:b0:29b:c17c:5fa6 with SMTP id v14-20020a17090a6b0e00b0029bc17c5fa6mr8532086pjj.33.1710315896307;
        Wed, 13 Mar 2024 00:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEnecfTlt1S5a/TCBvW3wjmZmuTlvFN/9s7nOHl7xM0rjUN5wKmXbKaRmsc/jVnIyYox8COM7YCe9OeUiPGHk=
X-Received: by 2002:a17:90a:6b0e:b0:29b:c17c:5fa6 with SMTP id
 v14-20020a17090a6b0e00b0029bc17c5fa6mr8532076pjj.33.1710315895932; Wed, 13
 Mar 2024 00:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306025801.8814-1-hpa@redhat.com> <20240306025801.8814-2-hpa@redhat.com>
 <Ze-I63bNzaMkHfgg@surfacebook.localdomain> <18ef7e97-db6e-2dc4-5728-5a539ae4c9bb@linux.intel.com>
In-Reply-To: <18ef7e97-db6e-2dc4-5728-5a539ae4c9bb@linux.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 13 Mar 2024 15:44:44 +0800
Message-ID: <CAEth8oHvgTzUhSrJUduS621J_1ow1dWySXTLX+mSwk3HHv25Vw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 6:35=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 12 Mar 2024, Andy Shevchenko wrote:
>
> > Wed, Mar 06, 2024 at 10:58:00AM +0800, Kate Hsuan kirjoitti:
> > > There is a KTD2026 LED controller to manage the indicator LED for Xia=
omi
> > > pad2. The ACPI for it is not properly made so the kernel can't get
> > > a correct description of it.
> > >
> > > This work add a description for this RGB LED controller and also set =
a
> > > trigger to indicate the chaging event (bq27520-0-charging). When it i=
s
> > > charging, the indicator LED will be turn on.
> >
> > Ilpo, Kate, please consider the following remarks.
> >
> > ...
> >
> > >  #include <linux/gpio/machine.h>
> > >  #include <linux/input.h>
> > >  #include <linux/platform_device.h>
> >
> > + Blank line?
> >
> > > +#include <dt-bindings/leds/common.h>
> >
> > Not sure where to place this, some drivers put it the first, some after=
 linux/*.
> >
> > ...
> >
> > > +/* main fwnode for ktd2026 */
> > > +static const struct software_node ktd2026_node =3D {
> >
> > No name?
> >
> > > +};
> > > +
> > > +static const struct property_entry ktd2026_rgb_led_props[] =3D {
> > > +   PROPERTY_ENTRY_U32("reg", 0),
> > > +   PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RGB),
> > > +   PROPERTY_ENTRY_STRING("function", "indicator"),
> >
> > > +   PROPERTY_ENTRY_STRING("linux,default-trigger",
> > > +                         "bq27520-0-charging"),
> >
> > It's less than 80, why not on a single line?
> >
> > > +
> >
> > Redundant blank line.
> >
> > > +   { }
> > > +};
> >
> > ...
> >
> > > +/* B */
> >
> > B for red?!
> >
> > > +static const struct property_entry ktd2026_red_led_props[] =3D {
> > > +   PROPERTY_ENTRY_U32("reg", 0),
> > > +   PROPERTY_ENTRY_U32("color", LED_COLOR_ID_BLUE),
> > > +   { }
> > > +};
>
> The name with "red" and LED_COLOR_ID_BLUE are also inconsistent.
>
> > ...
> >
> > > +/* R */
> >
> > R for blue?!
> >
> > > +static const struct property_entry ktd2026_blue_led_props[] =3D {
> > > +   PROPERTY_ENTRY_U32("reg", 2),
> > > +   PROPERTY_ENTRY_U32("color", LED_COLOR_ID_RED),
> > > +   { }
> > > +};
>
> Here as well.
>
> I think it's better I drop this patch (it's only in review-ilpo) and wait
> for v5 version as there's some much still to correct.
>

Hi,

Thank you for reviewing it.
I'll propose the v5 patch to improve them :)

>
> --
>  i.
>


--=20
BR,
Kate


