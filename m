Return-Path: <linux-leds+bounces-291-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D208D808747
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 13:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E65E1C20B6B
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 12:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6B739AE1;
	Thu,  7 Dec 2023 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK7SQ0IP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9662810C4;
	Thu,  7 Dec 2023 04:03:06 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-67ab16c38caso4962266d6.1;
        Thu, 07 Dec 2023 04:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701950585; x=1702555385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a76pkPINuWuuNyd1g0nmGNuSpkTPlhe2dR0CW1O0fkI=;
        b=JK7SQ0IPnbOjSumP/RfUE95nHTcNbBUe9+u2TZRvCeg6miJMWLme36ikEoTQ5SJlv/
         niloRiYGlwa6DAB7fU1sX6zqYU1qxHxHZ0QWX51gOqzTDM8IbOP+c/oSrSTLk0D6Rbp/
         B+U4YXwHUdiN3I98sWalmqN9l5SkGL2V5f0DpL27SqMdulkwcOCxMug7LvWgEXK9nQuu
         YmOTP9bEvxTLj/P3HyKb5s6efR+E2W7Rk0BzFm7EGHjDtyZ1bTqlARkO1Zv2/fI9LlVk
         zxXjvl+z8hIyHa6BFpw+GrhuNm1F2vfI9C0DfqeSy+24W44ugQ322/b0Ekwxz7iZLblb
         PO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950585; x=1702555385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a76pkPINuWuuNyd1g0nmGNuSpkTPlhe2dR0CW1O0fkI=;
        b=vHTdJ8UpJ+ffOL/SpDOXmRzeRwAYoHzBjVerqC4n52QVFDCXwpUMCfF0HR/SLZU7HQ
         bRJf/aG+wCc883YcxsRY/0CbZEvo+ijfIfdDyayv3PqTc/OcwV4Oo/WA1orkFb/H3QRe
         9sl6KmkPemN8Xk/ZGO7Xa0ZZvrYArYMJxDs20qPjAptcheyq9IZ4WDVNhRKD/t4FygWP
         F3jJIGHIVTFq3IVhn8tkS9EL+ZaTaV6cIlsRiI090i5YEL6NgxuvxCG3YjYxwtcbG148
         1tHLBMmlkNpG/QvYxm/JfOZeFaHWT668znEpBn2zvZuvyLkmhVJ2mO6JGL833jEUdP4X
         G5iw==
X-Gm-Message-State: AOJu0YzbP3P/7NTe8woc5lr+I9waFkLdZ2be4VPn6P5NvKfFpvNo6zwc
	yBiqdszNPGJQpkY308tZEKDDeyqFr070rRzJxa8=
X-Google-Smtp-Source: AGHT+IE7UKQ77qRY9ysn/BaFopgxG9y7lP3T51d2djhRlBt8w9XYBK4KfHkGlCkq6n19/zLy6x8OhEEOaZE8GSocbkY=
X-Received: by 2002:ad4:5189:0:b0:67a:a721:7848 with SMTP id
 b9-20020ad45189000000b0067aa7217848mr2211444qvp.109.1701950585302; Thu, 07
 Dec 2023 04:03:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com> <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com> <17a9fede-30e8-4cd5-ae02-fe34e11f5c20@csgroup.eu>
 <be693688-2e82-4e1a-9ead-cf1513ee637b@csgroup.eu> <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
In-Reply-To: <2a68534b-9e64-4d6e-8a49-eeab0889841b@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Dec 2023 14:02:29 +0200
Message-ID: <CAHp75Veyz-hMYPDEiCC1WJASGZ8N9pVef0foYJ0vBcW2VpfR+w@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Hans de Goede <hdegoede@redhat.com>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>, 
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, Waiman Long <longman@redhat.com>, mingo@redhat.com, 
	will@kernel.org, boqun.feng@gmail.com, 
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"kernel@salutedevices.com" <kernel@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 1:23=E2=80=AFAM George Stark <gnstark@salutedevices.=
com> wrote:
> On 12/7/23 01:37, Christophe Leroy wrote:
> > Le 06/12/2023 =C3=A0 23:14, Christophe Leroy a =C3=A9crit :

...

> > Looking at it closer, I have the feeling that you want to do similar to
> > devm_gpio_request() in linux/gpio.h :
> >
> > In linux/mutex.h, add a prototype for devm_mutex_init() when
> > CONFIG_DEBUG_MUTEXES is defined and an empty static inline otherwise.
> > Then define devm_mutex_init() in kernel/locking/mutex-debug.c
>
> Yes, this would be almost perfect decision. BTW just as in linux/gpio.h
> we wouldn't have to include whole "linux/device.h" into mutex.h, only
> add forward declaration of struct device;

In case you place it into a C-file. Otherwise you need a header for
the API and that is not acceptable for mutex.h.

--=20
With Best Regards,
Andy Shevchenko

