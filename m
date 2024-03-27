Return-Path: <linux-leds+bounces-1356-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D288D66A
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 07:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E9B218A3
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 06:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E0A18E01;
	Wed, 27 Mar 2024 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CY4iZwPg"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F122EF4
	for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521196; cv=none; b=sybXKKMUcm9N2ZXUN9TnTkUcZd8CFrucxVlqNvZUkpbT5H0S/bSEkBwAg1fuOD5nEA6BEKJu5Nv+IB9C2wqk3MfRh5w7WRqnZaLhWyH2nPU0Dv1Id60AvcJ20IcmhLWnCw5dcRl+TRO1JEkA65wMuxzXTHfC+xnGqW4oAmAUHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521196; c=relaxed/simple;
	bh=aPQ4cR+Pu5JRYY4fcJayj25/cfknmAwWXxQC4Vp7wCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAWVXlQiXwMrskiHWpe7gEVetLanua8EJMR309eD+lEpkau8X9n/1WyPCTRtmIRck4eskiDH71LGGA8gXeF2AymOi2XXuj3ug/XVrkF/vfN+i1L8mACdXtDlB6L0cy2u3D13wg/2JnfcFr8Hd5FfanfLeOkISWHXSU/dPAM6CZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CY4iZwPg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711521193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCyDLFuHWL0o9S4b2fO6aGbOLoatVNVmPUDQSZg+cbk=;
	b=CY4iZwPg8C7sJMzyE7vQ0qLAExBFtRWHOAlZDcZRIJSanw5aCeODOfrNdTVM6/D+C/Crx8
	C4vPjUuecp5hBzYRVZVhL5ZwuLOC3Zpjl8radU+DLArPQGueEdo7nyDkbgigiCDqTsC7G8
	d0FNil01SQW08ycxF9RC4NEns4N2xY0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-G56tpQO9Pq6alU1s6kDicQ-1; Wed, 27 Mar 2024 02:33:11 -0400
X-MC-Unique: G56tpQO9Pq6alU1s6kDicQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a04aded772so4117433a91.2
        for <linux-leds@vger.kernel.org>; Tue, 26 Mar 2024 23:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521190; x=1712125990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCyDLFuHWL0o9S4b2fO6aGbOLoatVNVmPUDQSZg+cbk=;
        b=sasUeQmLXBOs8DG1yu9tM33/vb4AW/zGv7xqXofHVdQa7cQVj7TN0s2DO9hDbGVndd
         kvB9luTN9dEWoMT98mtsG8wafXeufSm70PZdjh8Ftev5lMuRahLouTmKhIe7l6c+Q5kw
         jYhv9LEGbDH74Vf6eC8xJwI3Q5gFcMnJ2hAsBBsGl9eCiQP6uK7y8wv30pmxaO28v9E2
         0IY4JMFZUenmAO/exPiaBKtsYpJfAyV8iP2EiW9vEuQ+3cHHy5HOHP+6hggSYrLbSMej
         cFJOpF8Hn9jM56v+sFgQWj/vyiVBf57W9a22oiaZw0i84gtuObWZFfJEzbhGac6K4eyz
         3bsw==
X-Forwarded-Encrypted: i=1; AJvYcCW78MpYr0FcwpItzXsA5ydFJUUsy219vAYm8SozJbBSigM9yWgdauYO7mQLVjPEnPsWq4y6F4UTDDvSZ4GK+zT+3vlWFiV8BR1GJw==
X-Gm-Message-State: AOJu0YwxJYh6Jd4e7WvgWtLLLpnHC7vpMUQFzILZjcxwL3s8KA5OVsC1
	CRC/aEnJdbFhMEdnQmbtkJCIo/lu62yfiQETwRId6oY2CKZbOZIxH38QIZBBjU9PiO+1XHbl8/2
	omDV1CGg9WmMEKO5kUt+fLP4dE34uYJsFHaxMx2hy4nwSn+OA25JVxxgtaMIlrK8EAQkKTjVF/e
	RWFDD8n0RMw0O3MW1n7OV5wIDzcqeBiMH8Yw==
X-Received: by 2002:a17:90a:d193:b0:29b:331e:ec47 with SMTP id fu19-20020a17090ad19300b0029b331eec47mr1719884pjb.27.1711521190478;
        Tue, 26 Mar 2024 23:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3DMlhXx8e/Vzy02OUeoC0kwdj6lGi1JTMyko2Di9cAJi24nqjPwhbQfq8NgTZtTo44h6jOCUfUL5CqUPOM4I=
X-Received: by 2002:a17:90a:d193:b0:29b:331e:ec47 with SMTP id
 fu19-20020a17090ad19300b0029b331eec47mr1719873pjb.27.1711521190171; Tue, 26
 Mar 2024 23:33:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-6-hpa@redhat.com>
 <CAHp75Vdo5TMqm8H0OCGw5=_dwY1M0N4DOYUZy5NEbfJ1=KxXXQ@mail.gmail.com>
In-Reply-To: <CAHp75Vdo5TMqm8H0OCGw5=_dwY1M0N4DOYUZy5NEbfJ1=KxXXQ@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 Mar 2024 14:32:59 +0800
Message-ID: <CAEth8oGRvU+QRO_11yyyUgR50XKXuc-Ug9BXHNSCqKT9xC692g@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 5/6] power: supply: power-supply-leds: Add
 charging_red_full_green trigger for RGB LED
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Mar 25, 2024 at 4:11=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Mar 24, 2024 at 5:02=E2=80=AFPM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > Add a charging_red_full_green LED trigger and the trigger is based on
> > led_mc_trigger_event() which can set an RGB LED when the trigger is
> > triggered. The LED will show red when the battery status is charging.
> > The LED will show green when the battery status is full.
> >
> > Link: https://lore.kernel.org/linux-leds/f40a0b1a-ceac-e269-c2dd-0158c5=
b4a1ad@gmail.com/T/#t
>
> You can drop the 'T/#t' part.
>
> ...
>
> > +               led_mc_trigger_event(psy->charging_red_full_green_trig,
> > +                                    intensity_green,
> > +                                    3,
>
> ARRAY_SIZE()
>
> > +                                    LED_FULL);
>
> ...
>
> > +               led_mc_trigger_event(psy->charging_red_full_green_trig,
> > +                                    intensity_red,
> > +                                    3,
>
> Ditto.
>
> > +                                    LED_FULL);
>
> ...
>
> > +               led_mc_trigger_event(psy->charging_red_full_green_trig,
> > +                                    intensity_red,
> > +                                    3,
>
> Ditto.
>
> > +                                    LED_OFF);
>
> --
> With Best Regards,
> Andy Shevchenko
>

Thank you for reviewing it.
I'll fix it in the v6 patch.

--=20
BR,
Kate


