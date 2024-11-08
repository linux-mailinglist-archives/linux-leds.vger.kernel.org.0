Return-Path: <linux-leds+bounces-3339-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65DC9C17F1
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 09:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C1C8287253
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 08:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A5A1DC195;
	Fri,  8 Nov 2024 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ya2h7S/Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1211DB55C
	for <linux-leds@vger.kernel.org>; Fri,  8 Nov 2024 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054581; cv=none; b=ZGlbBp7O0+PWtYZUwE1hrEsGp3EHQmSjgPZ+OpX9eFJYyTr2Zxj7AhQ8c/voehm0//hVtvYYNUGlxkLMQoAIKFactiJV1jFp4fpfgIz2KkGcfN+Am3tnZ8DozhR7+JgyczFNGEN/85K3WYoF713FvmFxyFcc/ajvXkNiUPhxRr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054581; c=relaxed/simple;
	bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0hRDKSu/Nz4NXnyslxOcKKd7IMN0Hqex4AQ9ACR0Ze/GKipYXDTdf1rMSyPh/C7WMtRapS7wTlRf31j1qXYcADr3/gH43D8UPt6b8EEbHT5FHFygbZZ2Lv2lsb9y6QwZLtwzKNh+R77B4eaBln6BO/St1e5HzCVjd0OKcgJvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ya2h7S/Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so2952358e87.1
        for <linux-leds@vger.kernel.org>; Fri, 08 Nov 2024 00:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054578; x=1731659378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
        b=Ya2h7S/Y6UDtD5Ih4cBErT+XuggmfByoxWEicnE27DkOuuy+NkbY2dvI5k1IhI2yFr
         5LqWpjV/CQwG3syEab+n8MATv44h4yoT6QVYoYtLaMwoxltI+kkF0FV9miz6cOHL3UgX
         jC0L3zUqDUaDM491YzgbLgODiz10RiM9XONK+tWLRnStmioAj9gnUO0e9oibbyCb/Ky/
         h6hgfF/O7pXNGLptMrpdDOZyj+RVSa1ph9cp8CCZmhMM7Oq+2/lidNGJ67t7eFn2UjE0
         +8dMthQKGF9tnNpulrP0vB0ArqcAsSffGko+5A8e3B1SiLAYDtu9kf2qlBPJbAtupBbz
         1cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054578; x=1731659378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
        b=IkuE8t/Eajsk2zAJHSlYIODCVC8yFKHnxCV3aWjFACEC11iMqsiRAQpx8auO2vSqWU
         O9wCTS2fXR0kFE8O7b+BNmRMoKGV7D8HIk3AsP/EfdhOI3ieNXgRlU7SO/rcyLaiL/Fy
         B8nBWJCBY4GevQh0My4GGY1opFOgXXT8KjHH8o3RekHBq6NhY0KkY5bSTqmIEneUbv6l
         j+yS4xaW7lXB+/gMNKjC0ItoqkR4RphjCqit58M3v9VG0d5IgATVNtUg2aSxQi76s0xV
         dkHVa/pei6e4M6/FxdRQfqoZJjuA1GYsyntO7K10cm0zN3CHTI8emB9KOYrYej7PBONq
         wQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGwaOEjGvWO5d0QDfh/9/lepht2qfacFhRm8Pa19rWaZCeUHYNxJPwmo78FeLsx4MneOkl8q6HaehQ@vger.kernel.org
X-Gm-Message-State: AOJu0YypgrBLAOrc/cyobIxA0Xuclg4HAFLMRwQPfSoqhcXD9lwJerCQ
	8Af3EKaxvclXkUVI3EcHraGb7tclT49S9VpArmq2UMLLplnImz0nili2pAyugWCplpjnGoAnOWi
	IfXzyKyYjG8TAFmnKL0slIt/p+n703rm3qqfS7w==
X-Google-Smtp-Source: AGHT+IENM6vfeCH9jGfRGzsvajDFe9k4SE9omtWG0eiWqQPEFEarMA3/0+sqGJR+WelYaCDndudO9wf9Qnll7perQ3o=
X-Received: by 2002:a05:651c:881:b0:2fb:6465:3183 with SMTP id
 38308e7fff4ca-2ff201e7398mr8693241fa.3.1731054577786; Fri, 08 Nov 2024
 00:29:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:29:26 +0100
Message-ID: <CACRpkdY9VMRQftH_eqxikpKSh+a7yFKsHa9fANZUkZx6Md3vpw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> No more users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If the series flies, by all means:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working on this!

Yours,
Linus Walleij

