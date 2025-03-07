Return-Path: <linux-leds+bounces-4187-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802EDA56166
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 08:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 975553B3EBD
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 07:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517D819E7E2;
	Fri,  7 Mar 2025 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NBpNOax/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D2199FC1
	for <linux-leds@vger.kernel.org>; Fri,  7 Mar 2025 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741331040; cv=none; b=mr4VJ/2yaKKTmD4L8nJvb0T75QMbcXUWCFEaH5P5eTK8wZ3fE++ZFuu6utk394qPN/PXsVDPkHrAOpe02aSVaYT09TBqWl23gXE5WNJcvKXg81E3leaGJAl3mTgaOhyiBTm7OkDhBym17RKK12IrbbiPMcotJ/7ZHYeL0MNbIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741331040; c=relaxed/simple;
	bh=8nAP95098N8VvC8hTlm0/7kaa5VzZNLWpFxVGQC8zIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdnbvJCdZc7f38WWl/QW41mRjKtEzPqq7M2ruV3uultfj2hZ1IR5EL9us7fD3keSqx6WwujGpmwS6HerRwuQ62WEYmbfDBl1t4/GSBBEPvh5kB0U2s1ExMFUCPNVf3I6kINY31AjH8pUpsGEHqsUwdXECuJdmOczpCsDpX3E/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NBpNOax/; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5495078cd59so1747837e87.1
        for <linux-leds@vger.kernel.org>; Thu, 06 Mar 2025 23:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741331037; x=1741935837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8LoLRLGkxYV0alNGYR4F1xsTkZ1FzcA8kkUjGyENl4=;
        b=NBpNOax/CZHtsObwQ+j9vkhKb73k8QXBUXREtiC78ss0qZSbHFhODQIDFK8TpN4Gb7
         SDzBNR9toP7ylsS5y1BJBldZcrbQu84d7HK8HoMUOJsT9j8yBZOaiNEoXRruv4cxAkOb
         Jni4ggK+sBXSovS2MnKggxUT0w79wHRVl77bewo8rL9BDP0sWFphrRxVEdrHHkeic+ml
         tAWYAS9JZPfe9g0ta1Ta0kwdfxZcnrHCu5scbsc8E6YPfR8iZ9920SgU34vS/ywgYPjW
         bubUv7rD3HcK6UbBDyaU1RJJ4svI3zPMFfra3cy6x1jAD3g9ty8nyLrdyiDdzqgxx1A4
         dg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741331037; x=1741935837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8LoLRLGkxYV0alNGYR4F1xsTkZ1FzcA8kkUjGyENl4=;
        b=Mmzsg42TbKze/vYycbKXnXAnxl/4yaMEukBSQE1Nb4XopCUAYFEo8qlpUdeExLeX3P
         xcX8Gs3f7UWaPvZs5wawDg7+I77gukIGDL0f/20fafWizLsb0uUl5ONOTrnM14YHsAuk
         uFT3BaT6Bn+IHc/RPuUmRBdF31aWd1asKN7J7Ca4o/XQjKOgDVunkAftbMAJ6FoQa88Q
         +3fNuR1BIcE3YX718xJbxXOrH/8fQBmELdmQkOCFs0yZDoxaa3fYI9CR+dWlzUcN5RTH
         eJ5hNaQli3q4XalHZbvF9g5cKpaijEaZM0R0C4vH6ZVUM9H7UbrnJ0X/BFGNP9NuPiLf
         bO1g==
X-Forwarded-Encrypted: i=1; AJvYcCW/NvwbVoqgTHauP57rCAij4qup3pFOBm+iX8GHtv4oRcrmoH92moN09f+jdmH1E3fBE+jJFnTRbQNe@vger.kernel.org
X-Gm-Message-State: AOJu0YyJgv41vG/6gx0w//QiPcBJ8mEWAIj1XDEvnTJvQ6n51BMqAAwq
	u8zOHhbBNSgDULMDrnwoU2wigICBT6aSj/YLThoz1rYOs3nTWDs/GojFCncnEKYTjWRofVLEVdz
	7W3v4t8qibelG0xn2k0nvWgzTQCD2BynLdFddDw==
X-Gm-Gg: ASbGncuN3rnP75NqTWDG8PVXanSaDy9bLs59PfO4or2TsGZRcRJdwXB1FpbUJVYTv61
	qUKa3Dx5HPwBg3RY0w375s7w1AgeWyCqo8Wy/YxGp71bZpCEZ2e0k6r0fRiTxQ9BFHEmUveUhEx
	TA+2Wy54O+JWr0nMVFefH9ll0LeklnKEI+qlCCHpJh//V5Kpt30mnBsw/g
X-Google-Smtp-Source: AGHT+IGLPbU3KJLosa62LrFtSyjSM1FYRo5hnluiTpHzUxw8rr6zT37TRHuDWK6vB1cV68vxHCUY1m2s2IV4pZHIHLY=
X-Received: by 2002:a05:6512:281b:b0:545:2f0d:8836 with SMTP id
 2adb3069b0e04-54990eaae1amr630800e87.40.1741331036524; Thu, 06 Mar 2025
 23:03:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
 <20250220-gpio-set-retval-v2-1-bc4cfd38dae3@linaro.org> <174130146134.987559.8662566490718210141.b4-ty@kernel.org>
In-Reply-To: <174130146134.987559.8662566490718210141.b4-ty@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Mar 2025 08:03:45 +0100
X-Gm-Features: AQ5f1JrsRCTzGeQkxb8NcRBJre4S54OYANop1Qs9itP8zmv8yOQ5lBl5rfQBlgo
Message-ID: <CAMRc=MdQcxtXMUCt00=JbGY47cMMWcW8=r3-ZrMKjQkViqnxvA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 01/15] leds: aw200xx: don't use return with
 gpiod_set_value() variants
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Pavel Machek <pavel@kernel.org>, 
	linux-leds@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 11:51=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 20 Feb 2025 10:56:58 +0100, Bartosz Golaszewski wrote:
> > While gpiod_set_value() currently returns void, it will soon be convert=
ed
> > to return an integer instead. Don't do `return gpiod_set...`.
> >
> >
>
> Applied, thanks!
>
> [01/15] leds: aw200xx: don't use return with gpiod_set_value() variants
>         commit: 5d5e2a6f15a6c5e0c431c1388fd90e14b448da1e
>

Hi Lee!

Can you please drop it from your tree? You acked v1 of this patch
after I had already sent v2 (this patch remained unchanged) folded
into a respin of the bigger GPIO series that had triggered build bots
to point this issue out in the first place. I picked the entire series
up and this commit is already in next as
129fdfe25ac513018d5fe85b0c493025193ef19f.

Thanks,
Bartosz

