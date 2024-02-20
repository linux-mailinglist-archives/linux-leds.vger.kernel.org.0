Return-Path: <linux-leds+bounces-873-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FB85BAC5
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 12:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B61E1F21B69
	for <lists+linux-leds@lfdr.de>; Tue, 20 Feb 2024 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C39066B4E;
	Tue, 20 Feb 2024 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O1eOv0N1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05837664AD
	for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429231; cv=none; b=vGu4/Qv2e1ZqE2iTXb6vBmSjRgscYO5+SxaoapuB2ZljwPXT6Y70KvZGX3XKXzUc/JNfytkg8A/MPz17B8BNd8Wu7Xnazff2VSVk0YK4CCJdhRE0YlbJyJhLHGyhPDsoqeim2bn766gUJAxkzOh77s0Tja8yyy633iLmbjIPTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429231; c=relaxed/simple;
	bh=EOcYrWm1+NauBgC3lSaTQ7qlBHF8JkenBew6u07l8cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HESchfcQYO0VCXebAxJK69AbQ1anIkgs5rcKVlphdXlX33Nnq6oAQ5qZapzShnoWBTxxcOHnOGkb5XC9VYPf/YTnsWLhR5NaJmwVbANp/TnpXwY0RIC79Zjj1oBjhRnTAC0robAO6B7Cve/nOomJ+ZQGXBvXopO28z49o8CRxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O1eOv0N1; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4cc13005119so429339e0c.1
        for <linux-leds@vger.kernel.org>; Tue, 20 Feb 2024 03:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708429229; x=1709034029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+xBZIAUjX1A0dsBqbDIysno1PWQf+ejZu36ux2KMh4=;
        b=O1eOv0N11oUjB5/U46PsUPQa4vdC3OSJHmDYlt0/X9NHwdbizv71rodxBf7LornUw3
         20QE3ecaaMAWorkfW4jmMtQynJY4VS37rHUnHb4/ZmgM4bPKg2TsZ7FlUbxfGH22ptQ5
         9U+k04nNnJJ6ZNBxdnXirneMsqYJY867dnOUw4RJay6hjYRZKA0gpRXAFA2vg7V7BUA4
         ASjdJDqgPnxPEKpTUdhlILWPiEcmCXfUlR1K10sAhwtJeRdq8AwQI7NTZMifcb0LgntL
         b7KVCibGwV1y+8VdjWcyLLzqVqhXn+Zk5BymJEJ0p5pwZpM8ci4nlz6m28aiL35VWw3W
         bpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429229; x=1709034029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+xBZIAUjX1A0dsBqbDIysno1PWQf+ejZu36ux2KMh4=;
        b=AJ/BVAXAAHgA05bJK21dJlJM3jsjQA3LNQXn9nIrLNdeF/3M4l93/y/dlEOSYP3ilK
         6SsyelA8GA1jyoiXz9bGlMCV3LAwKe6WPMhpacA9CQvhhdYUS+ZcXQWM9HxQcRDZsBeu
         KU6qBgwFjVFJsSimyl2YSope60cegBWQXraKX/gDVujaUQmoMmQp8GzWno72XyMuG2Q3
         gENClozqjdM97iPyLTC5HxIWCXw2V2xB+SJEYqVziY1u130V1ZjeHX7rLihcSFZyPOOl
         UxUtKwlXOtwg5B23ttVgkeQPcjVG9oaQ6efQOu3hqDLnxuUNKYpSWuEkog4zDc4njbTX
         vJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvMAvwa+VMKRJ39ZyuTlJjquxAM9l3x5zS4aHB2oraVhh+IugHkIvIABF3DCAEPm1/1YiP6J0zxBKUH695o6dFP81UOFaIh2W+Ow==
X-Gm-Message-State: AOJu0YxrSbr/Xj7R25AO1fooHtTPMFPM8+ansDKF/pqQiC4nUeQnPmp9
	8KyRCPmCaSMRurvLeND1ikqmzEbPGzbSQ1B4VREiXOXo+iGhVgp6bkMz4nm9f0d8/d0WGzxlPFg
	tuVF9B9N62fp1rcl87fc5owtl5QFQYGYZA1VzpQ==
X-Google-Smtp-Source: AGHT+IFbZl5hbuuMQii/BE5aac/5cljvrbV47GrghK/Rn9aatSKrWO5GhJLvx57WdFJAoBTkKSy0uAQrzQTQ2Ker3UA=
X-Received: by 2002:a1f:ccc1:0:b0:4c0:28c6:ae5c with SMTP id
 c184-20020a1fccc1000000b004c028c6ae5cmr9397485vkg.11.1708429228891; Tue, 20
 Feb 2024 03:40:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111111.133826-1-herve.codina@bootlin.com>
In-Reply-To: <20240220111111.133826-1-herve.codina@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:40:17 +0100
Message-ID: <CAMRc=McjoC5iWWOwX2_3XG-e3W6Tb1Zp6jub71ArHsod6UhNug@mail.gmail.com>
Subject: Re: [PATCH 0/2] leds: gpio: Add devlink between the leds-gpio device
 and the gpio used.
To: Herve Codina <herve.codina@bootlin.com>, Saravana Kannan <saravanak@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:11=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Hi,
>
> When a gpio used by the leds-gpio device is removed, the leds-gpio
> device continues to use this gpio. Also, when the gpio is back, the
> leds-gpio still uses the old removed gpio.
>
> A consumer/supplier relationship is missing between the leds-gpio device
> (consumer) and the gpio used (supplier).
>
> This series adds an addionnal devlink between this two device.
> With this link when the gpio is removed, the leds-gpio device is also
> removed.
>
> Best regards,
> Herv=C3=A9 Codina
>
> Herve Codina (2):
>   gpiolib: Introduce gpiod_device_add_link()
>   leds: gpio: Add devlinks between the gpio consumed and the gpio leds
>     device
>
>  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
>  drivers/leds/leds-gpio.c      | 15 +++++++++++++++
>  include/linux/gpio/consumer.h |  5 +++++
>  3 files changed, 52 insertions(+)
>
> --
> 2.43.0
>

You should probably Cc Saravana on anything devlink related.

Bart

