Return-Path: <linux-leds+bounces-2317-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963C93C226
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 14:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B291F2107D
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D021E480;
	Thu, 25 Jul 2024 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7ZpyQlW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1F0225A8
	for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2024 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910880; cv=none; b=u/be0YGIWQI3tdygS1YmccqrzCVWx2jbkpmX4w4jVAyqmwNJQPmYKPMBNgWJISu2NFX4bJG9SoBeRM40J7w99wJ3ZvXpWgAf8FFEcItXwlArXX8VXFkBqXdXVpHW45WjZ1k3R/uDF7HHTfjYMrbKk1eLLXgGS+p/Q0Y+qASNNvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910880; c=relaxed/simple;
	bh=1A0cgBAhUFDt0fKGVth5Pm4VLN/9hH+DgABpmkVIbmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aexn07+fguIiUTsI/y+aWqc1Hs3AUGlYZuodH7sEfEx2ecLvlIB7gG+CLVwrGPLtejUdw0Y2+v639ahPRfTuWaNvGmL1GUkuVL7hxmuGF9JvRK62CGTvLBQcmuOdvc5D8P4PDWHAzIn9YoupiqHGKPt5Vev5exaXfTVbjTlloIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7ZpyQlW; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-79f06c9c929so175169685a.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Jul 2024 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721910878; x=1722515678; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hc0A7r3UsfuNlz3ecw2hOXPmbuDfpsA8iOPi7UahcXI=;
        b=e7ZpyQlWxlyuyZqyC17oX1s2epNuqln3KOCN2ezMo5cRIhvbsDZ665Al5oFzle657x
         QDwrhW/NULD5u3ky3++u9fa5WDkfUyjYg0Dpci/twaZT4kMB1RDg3S89t7JWDxblAeUL
         4ZsHQrM4LXmpTx5NiPZoEIdq3BuWq3tVYW+kE5pqTIuUxM6SKtMoKzODkbxY11a+uulo
         Eqsyz6NunZEWbC+GWYejM2IgIah4OH97cekJnQL1FVYtc8TtztFHd73Ct1ocdw+/DIay
         JRlxFeExpy3WFnkGEJ3xXa6ksJrZugWuajR+ZeaJACpalb/NfOlpwT/thHRYeo8I995w
         UTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721910878; x=1722515678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc0A7r3UsfuNlz3ecw2hOXPmbuDfpsA8iOPi7UahcXI=;
        b=Fo1FT6j+XVatwrUlYnRRCNSY1+sEhhZ4Psy2Z29r+2l2ASNHTlArYZkpuR0Kx8J2Tf
         H5Nic2bT6KTOZd2jaHWkYpTGq7C2pPOcfCBF7W0FNy7YfEO6v1wqoN2edWgb6xqmAjyi
         TdWegSD9tXlilKEkSpr3AsvBywJJR66wkg8G+pXdAITTGFP/OQlFWEURu90vWPhDB7Ax
         9hW0hgEb+32JqGoO85SYmLGpe2n19Tn8EGscxE/EbLIsQGOPXCTkeZXdHCTRZ4PUm8uA
         HTnOPDtXQPDIBhC1adNh0VyCdJnDUCOkq9TmdLpMEtOibKNVHJJ4YGyEF18aOwvdt89f
         0mSQ==
X-Gm-Message-State: AOJu0YyGtK19kuMi1QTTJVZ4FS6/xsAKT51F8CIOtJm2jmKvO5VrdVrv
	5iLal7P5/ySCFXaCsechktt2FiXTBi5d3rvTuiPMerIrCpyef4o9hBjnBITiOLxcdT++N8YqjAu
	y6Y1HfKf+7ezAeSrBT+LvqcmWnHVWC8p6
X-Google-Smtp-Source: AGHT+IGqtgtc/aM16ABGYZAQ1p/NlnxeRLwENu7HYOf7upAPV4GtdA9CVkQHR6i9ZhNEGPYpLwna/hVXKdvTv1BisX4=
X-Received: by 2002:a05:6214:20a8:b0:6b0:6625:135 with SMTP id
 6a1803df08f44-6b991560271mr91763776d6.28.1721910878103; Thu, 25 Jul 2024
 05:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM_RzfbuYYf7P2YK7H0BpUJut8hFvxa-Sm6hP1BKJe-jVFa62w@mail.gmail.com>
 <20240725102623.GF501857@google.com>
In-Reply-To: <20240725102623.GF501857@google.com>
From: =?UTF-8?Q?Guilherme_Gi=C3=A1como_Sim=C3=B5es?= <trintaeoitogc@gmail.com>
Date: Thu, 25 Jul 2024 09:34:02 -0300
Message-ID: <CAM_RzfZhySkzDZF-RV=+8rtx0yTs-+qmsRNwwa31nsWRAc40-g@mail.gmail.com>
Subject: Re: [RESEND LEDs] leds: remove led_brightness
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 Lee Jones <lee@kernel.org> writes:

> >
> > The includes/linux/leds.h diff:
> > -/* This is obsolete/useless. We now support variable maximum brightness. */
> > -enum led_brightness {
> > -       LED_OFF         = 0,
> > -       LED_ON          = 1,
> > -       LED_HALF        = 127,
> > -       LED_FULL        = 255,
> > -};
> > +// default values for leds brightness
> > +#define LED_OFF  0
> > +#define LED_ON   1
> > +#define LED_HALF 127
> > +#define LED_FULL 255
> >
> I'm not aware of the history of this, however I'm even less sure how
> converting these from an enum to #defines makes this any better.
>

Yeah. The TODO says:
-* On/off LEDs should have max_brightness of 1
-* Get rid of enum led_brightness
-
-It is really an integer, as maximum is configurable. Get rid of it, or
-make it into typedef or something.

I could only remove enum led_brightness, but in some places, the
LED_FULL, LED_HALF...
are used. This is why I created this #defines.
I don't know what we can do in these cases that LED_FULL, FULL_HALF is used.
For example, in the drivers/leds/leds-ss4200.c on line 223 have this code

u32 setting = 0;
if (brightness >= LED_HALF)
    setting = 1;

In TODO where say "LEDs sould have max_brightness of 1" , I don't know
how this can work.
Because if the file needs to test if led brightness is half, the
integer number does not work in these cases
because, 0.5 (half of 1) is a double/float number.

If the max brightness is configurable, what drivers can do this?

