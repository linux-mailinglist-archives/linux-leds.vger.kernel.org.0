Return-Path: <linux-leds+bounces-5938-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F4C1AB23
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 14:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E1CD634E1C1
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 13:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D863129E114;
	Wed, 29 Oct 2025 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUmnKqAV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125EB29C343
	for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744383; cv=none; b=X7+tvkWZbNj9k1mKiqsRm5+65xUeTWb0aanLpztWf37iaBbm+B/cSjw0ExCAkcrfIX5HwwsvpZS0WH8+iFPrCvu9Q35k6QIzmUqq0ALshJmljhecy8rabuSW+191zlA/23dqmkDUAtuTuCVQH7GmoqOw5Ci4VqcmTkSrNWMK4mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744383; c=relaxed/simple;
	bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFTusjl9guJttlv5UXyppUhU7IrVuV/+bb/sM/dKpwO67PlZoOxEJLBb0hUkj8Q7+q7spoVJNj5vmDFvElFbJPGPmMWmH+Ty5wmB0mSjNkBaCqUeu812V8Xoxo0JoYdkx2zRyYN7yGXkVgrmi7SXI/wLgOAsjMAWmnjSfatQurw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUmnKqAV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378e0f355b9so53797921fa.0
        for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744380; x=1762349180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
        b=iUmnKqAV2ZqMdwnarD5Ij79DsuDs8d9nv9eDEmFWWJiu41QA9o1q9vb8Pkbw3xbwmL
         c6QCK4LsJtvpN8Y7BhbLijAl1jzxLs/rlhWG9ZVtfRggaPEayDKQmSSxpfpjumVUz0H5
         I8GBQUEMGUmH5HGOvkZB47Y6tPmwj/vITe7gdeYhYEY9X5hUMk4F8RQ/Hv0XqxijV+c+
         nb6NKK0uARBBlJV1IRx5XEZ8x3KkQqHeyeRmN11znwsMl4mZwxGKDovmKAqV81udKgkq
         VTaAMZFkD/rpE6QxRLyak22lIf8mIBCRZqn4bUBxHJiRW7plr8/Hq7YjCbztGtpv29yI
         C6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744380; x=1762349180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
        b=Tbkprt6Z1wVt5Yua96gMIfpr/HonaEvtWnXrNJhcx6r0dXFI7SHW6lU3PDk7ZLit5a
         boeo+lc7GRHUfY4e4Hl53OnU+ypHqQs6p9pSZm2sYb6nISistPn3QAuaD6QGZ9bO6jze
         VHGcRakFx8vPESdef2mVMMt/HWWPvnOOnfjS82TXBTa6Dr0JyEOfvEeLu1wrU3IqaKTH
         qzjGgoYt58ojSnenhzK8+N4zdjofJCe9JLPKzvw/7gQroyZMD2NSy/04d1bhIKJjnMW/
         /Yq1oS8Xdf5QzxpckKTdv04xLoWorPc41Ewue7yIiqVn5TY7T5o2EN/aytUi4ksZD7G2
         s9BA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ASyx1XRIYhzlpO05WtoLl8jRl+THpDyqpBTZvtkrbU/wpeWb7d4xwjJFu3JLdhHnm+77+dniG7+R@vger.kernel.org
X-Gm-Message-State: AOJu0YySPksTxbB6mfTun8jYnCUNCL2Wbxy83SQhcJn2ObZIdZdNWGJX
	nX1IYNTJvzzDhCxVWni5Oj1crS0eHwMYzOgWU+OcAqlK5013Dp2ABjphrVsid0sT9TOCyN7ZnI6
	AH3yUqma/rOkuHGKl4RfPwWEeRZSiPyhuSOZKEJnLGg==
X-Gm-Gg: ASbGncsv5ysjVBVZaQHgT0vukYvBCYBsrU7MP7WgyAb/w47q+bitX2Ayd4+T41Mpbhb
	HXWeYArr2ojrQfL8XRSha2ANNeS8hBGt9uzPoNDmrt4vpSW1uc3ZhZw2q423FwIXg+je5uo7HGu
	8831pZ4UDa64dwjDNrEqkDW5cQ4BLEkDjY298VhuCbl0kRFIQj9WQQ2fOK6IR82/GlAfZMeQDCk
	ltSMS/1LPrmEgMxYKFA6BYPyUkAxDCYElk3Cpd0cAYjGeZA2J4yh2K5cVoj
X-Google-Smtp-Source: AGHT+IFc/hCvDE1Zso/0IxQN+geIgWUqlAHmVbZSzAYj2L1gPzKHQM2rtOb3cVJ3wqFIdmrbO8L60WWStqgI5NAbuCE=
X-Received: by 2002:a2e:9a12:0:b0:36a:f4d3:82e9 with SMTP id
 38308e7fff4ca-37a023ba912mr9579411fa.6.1761744380200; Wed, 29 Oct 2025
 06:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
 <20251029-adamant-mamba-of-patience-cddb65@kuoka> <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
In-Reply-To: <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:26:08 +0100
X-Gm-Features: AWmQ_bkO8UFcogwNBcRXNNMdmHiXiiZyPgTHaU5THyaD5CILTj16yxOphtBr7r4
Message-ID: <CACRpkdZcszMZEU2Wzx8kaoR46ytziqtedmCrsjEL3QOrDtDgzg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:22=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> > But I believe this is wrong. Trickle charging does not switch to
> > anything more, there is no fast charging after trickle. You have some
> > sort of pre-pre-charging, which is just pre-charging.
>
> There is trickle, pre and fast-charge phases. Furthermore, the
> fast-charge is further divided to CC and CV. Finally, if my memory
> serves me well, Linus W did explain me that some chargers use
> 'trickle-charging' as a _last_ charging phase for a full battery. Thus
> the term 'trickle-charging' is slightly confusing - but it is already
> used by the existing bindings...
>
> https://lore.kernel.org/all/20211116001755.2132036-1-linus.walleij@linaro=
.org/

I think we need to refer to a textbook or IEEE articles to get this
terminology right.

As you say it appears "trickle-charging" is ambiguous.

Maybe what Krzysztof suggest to use: "pre-pre-charging" or
"empty-battery-charging" or something like this is needed.

But we really need a trustworthy academic source here.

Yours,
Linus Walleij

