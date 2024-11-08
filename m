Return-Path: <linux-leds+bounces-3342-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2E9C1816
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 09:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559CB28464F
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 08:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5115C1DF99C;
	Fri,  8 Nov 2024 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDwgzitj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9D1DC759
	for <linux-leds@vger.kernel.org>; Fri,  8 Nov 2024 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054878; cv=none; b=TqV5uiPZs97RJ9ocfSRCDWdKzV5BuAug5RpYUQUoxT7aTOoXWWpc7TYos+plBW2mw5TCvlChkxYX60BETAXihVh1p40r2ZUO6uO/l85owBNUIHRStrZvWV4U0qexJGRwAoU8/iTKSTxKaWHdrkCiDnckXQ1Hoa21B8WkTwn6w80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054878; c=relaxed/simple;
	bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VowYS0FQXkyg0zjIQyyEXmmQX5p2mn77qYpz8Ipf4EkVPN7NRZwxY2fcjO+r9KOVHX2kCfVExlbAtiJGgnNPGrpkcllNKMDdceoK/I0yJ76lorqu+UYSgdqp/i1ypH0uufmPeNKRMYRxCJHtIDGaHFyRqYLiOgFCAtRd35nTxyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDwgzitj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so16424301fa.0
        for <linux-leds@vger.kernel.org>; Fri, 08 Nov 2024 00:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054873; x=1731659673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=aDwgzitjyirX0jfR/DSNwos9ZnkUVJ7ZTgdXUcb3X0YnrIrTeUPlDgmy22bQxvTZDv
         WQAelVSxAdMmnzYPwwWrTZQkRWncJ7zUyjBfi+/VBiWH5SjQI+CMEpS8X1SUlsNuk2ax
         qcdyKmSZ/X9oG7ph9zEphqgzCDjVUL9h6DipVhM4xwbE1MjSZy4q3vmMIJIkorXDB5Ls
         N5WzTZsPeW0ptZnLqGWhT2uAhKYousBH7RtRPoAPunn0Ps4OeLJhUgr0bZYlj5EVz5Bs
         Ea9GwO6o1InpZkEK4B0Bbvh2OeqA2T6ri0RtzZQmek0HfqbMVg8X2Z+bg29HWYOSdvp5
         cRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054874; x=1731659674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=nS97o5XmIwgcS5x0Rxj6T920RA+sB5Kb6VpKq2RFW/XH+4UPP3VBXr2jwOovG0xq6P
         eNHuhIDFRT5b/vHSNW0en6c22w3VVIBGzcF9REUMU3ue3miGJruIa6wU9eKoFB2I1N8k
         8CVc87QpxazXemyZMxUgt8INl4BCA13dnkcI9rFUg8YWP0+h/vcjR67+JP7GN4LeI60j
         n1kMMu1FBCpZsVS9qsifMPewWHEq7O28W0k3wqeOOmNm1CDd8AwLaUasImhP8krtRuUy
         7t4MP3PntdIM0ZhIW5lJx3DMxWyUqEVah2rj4s6PwVzLK2tUvnIJVsAR5s805qJYwvBn
         ugFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZmCbSYkqsDD5tsdrXGkjr/0GoEFgpbcZ84RtpfH627FtAWHhEh1a6BT/dO2/VUertZE9q057fgaBO@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3r9uHpJWTIUlsQhrRJ6xPeBb+CjZMosYj3A//vOkstyis3/n
	jluNXIl0EoZpxUYXpqdNjcJ+WHVmAzpzBgFfJKTSrRcutEqKV4Uk7Vksqeh12aaVZnaZcW8YBV2
	A8WMqdTASKGwazUKHEIdNL2l+d7Atjn2mRlsIWw==
X-Google-Smtp-Source: AGHT+IHx7mAPhJnzxE7EYgyRjyP79PfLYtwkdmgWKx0QpJkHxCqAuAqQZIcNr65Vl/TTpb1mgGDc7xzfzo1LsoeLK4Y=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr8041491fa.22.1731054873529; Fri, 08 Nov 2024
 00:34:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:34:22 +0100
Message-ID: <CACRpkdZ6gYfbkjcWMNOOyN9owg8n6ApFVv5XZXUA2CY4-JXOVw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
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

