Return-Path: <linux-leds+bounces-3340-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439F9C180B
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 09:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0EB01F24259
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 08:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737FC1DF730;
	Fri,  8 Nov 2024 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQdrQq09"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214FE1D27A5
	for <linux-leds@vger.kernel.org>; Fri,  8 Nov 2024 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054826; cv=none; b=XiL3PUk35uMHYFCJlHlD3i2+aKBZpHhKjVr4PR3h48C7CRSClkA2ZhFdfEsAkxJsE0Xm9kAAiVZ9DT5odbsmWsbc4f8XHt6Ak9MEazYlJxJbWGfr8lJ809FhnYyQKPiTXzsFfUVnZIGrOkd1jk7IP1NyT3PEVqnad/k5BRgpORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054826; c=relaxed/simple;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHKPEaEDJlXpjGe02ytxvzkhVh5JnzuDNqF0OtJCZ5VkzNzxVogIAnSUnqIty1Iswv9nvUyz8tJJBVJIGQGsfjjdclojrs6/cOCO7LRHoT7e5Mq0ICRg44sRqTCSC4R61NprUzJdTotqK9HiCQUJTVQV3RTGlrz1Q15C8s7PyeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQdrQq09; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso30384451fa.3
        for <linux-leds@vger.kernel.org>; Fri, 08 Nov 2024 00:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054822; x=1731659622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=UQdrQq09sJOLoisSqnk98aZyQUCU2WzUB8ZQ17v20xSmMXVoWPuqIZKLTBoIlWhar1
         sa5NrDuDLMhSI5FPEWQYfnuhTVKfEhjqdeW1YPG816v4lSbhF5agcqnFVKzzObmHjeR1
         XHE56xsiE0xhZpoLrU5I4UIUFPlP7IpBzFFkWyQtyODlu7TFxp/YQZTwlR608J5gwm06
         QALVRLQh/ebWrHrepOsNTRmv1B1MCJAF4RzOPkbEqCWOWhsUToIo2DHnFM14n5AD5+z3
         ooNd9BUg5qQAEWxghZcOpE4VU78z7dFanWF8Bz6KR+DZ4+3ZDmtCgCYcC3gWutze9Ggw
         ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054822; x=1731659622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=jMLaUyRa7DQDcz1mvdjcwDlVoV7/cQFTu1sM3TV991zdmXH0MN4aGO9bSfos02+5DR
         gA83dG/iwtS1Thuhj+zssLrONf0jfrICzwlT6RWhBLoBExzdHUz0d0hACUZcCoo0fsQi
         hT5KuCxS8GQU9yXw7CATupbpCZ65tGYYfbvFK4nJWZURJf0xe2m3z0xN7nPdMce3zglk
         1bFNCZY1bE0i1pS4qU/cFUrKODG6SL0OG1FQC0UCc2AKQ9Wgs3go89kLZQ6syrbCiaDd
         5sDUFuwHDxp0GC6vzHU8WQkQmE5dDt08uJht7eRGMVfVH6Pf8W6si7ESgcXAiRwtUHSj
         MSsA==
X-Forwarded-Encrypted: i=1; AJvYcCUF9OIgKaf6pkKQvvJ1xx+MIVE2W3OLOUfBgHfbIM8rcsvVv4syjXlBMKz5p/3fm/UU6hSbbNThZZxC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Svt0cbkeYtkaTWrMd4ZohR6mutFaSZ3hIk3cxqrPKYXdhjqU
	8UmivcR3UI76IBqF8u6aEBQK0Rfci+UJDcRvzKU5HT/IpZy28y74cZ7d1PZ4WAvI9yM6iQsSGGB
	B8UBaFT6IlsQjP50GF2vgsJ3PClnl8MVPCaiYsg==
X-Google-Smtp-Source: AGHT+IFyr+pHYPoU9m0KAAV5TzGf7UWj3G1xJPS3/nNGmi70pN4W31YM52rF43tSYPY2jobLCKLiVuwMjSY+Mo67UYc=
X-Received: by 2002:a2e:a9a4:0:b0:2fb:63b5:c0bc with SMTP id
 38308e7fff4ca-2ff20162837mr14265851fa.3.1731054822269; Fri, 08 Nov 2024
 00:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:30 +0100
Message-ID: <CACRpkdb251gJhbcoh9ewqh=TLjTgWA9ZKRAXc6dopjRHDrCVOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
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

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

