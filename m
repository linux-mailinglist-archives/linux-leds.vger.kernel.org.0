Return-Path: <linux-leds+bounces-3688-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7A9F9240
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2024 13:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 943047A36F7
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2024 12:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41F220FAAC;
	Fri, 20 Dec 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laI+J+F6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A420E717
	for <linux-leds@vger.kernel.org>; Fri, 20 Dec 2024 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697880; cv=none; b=pHm8usHV4RIkcO4oVA9EA9nibdJgTwd8M/FCTZG70FOFgrZ7uG9yZU6RxZlX0TEH1ZzCsRLovqdcXMJ35Vg0EL9q5QBzU3bX3QtATWi7ewaLXoUKnNTqDZ8OQ398hkmnN65OHX08pLeYNB82H4WulyQPTf2fYpvg9SxSXCr2LZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697880; c=relaxed/simple;
	bh=K/GqX6lt5w8J+Rml0vG7Tf8CY/i7DJtERJUYG6W7lW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g40CP9UFe+jzJUFu3krtnXyNtn5YSLgrf90mXtSxRnQ7SU3FPEE+pKdrzAmf2dW1rby7yu3535WQSfhhTagZYHrZtGF6oE3l3ZFyRUrSTwSNeGnasHGgOI2yKEdPUed5QaDbsQDbRQhLpli1l+7OsjyHrQ5/P2dSyoGclyt4yUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laI+J+F6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30039432861so18291751fa.2
        for <linux-leds@vger.kernel.org>; Fri, 20 Dec 2024 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734697877; x=1735302677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir1V42gRjXc0yY1xGNb20UYWxYH47j634gRykKT6tIQ=;
        b=laI+J+F66SEiCmqx1bCFHNxyg7fqhZTyG1IDHkxwUPbT1NPWYYWzw8Seydj8luGHuo
         MjgQj5NizlsI3o1T2JA6wWDgFVdgY+VpAFimiZujDSYI2+OXzXP+qOTyX+7CxnrESfJE
         e7DsODAWgY3AmAwFyzOFZ56q0b9gXJAG8FufmxZk6hPxttCC9shL2mnvLp8mfu3kKlqD
         64Q8zhb/QqMTmPquHCy8wQAty6b6RaaKWPjmHLfVyrlboK2VoGPLhGWGW/c+hbufwo+/
         1MwgaQMk3FxrVPJbKQo0yISyF4wtOeHFVgUE37ziocqtnFvxKF4q4Gwl+24LaeErSt9Z
         QAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697877; x=1735302677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir1V42gRjXc0yY1xGNb20UYWxYH47j634gRykKT6tIQ=;
        b=ffPuNeDUYC121B06SHXTsf6AicTncPKT5mG4c41aZ2Wv3dF//mxpjAbd7TRppIjzUn
         /3Qn3RniQBVQy4a0Xdt8pC7Ot0Klq/HWvIiyL/+ccQcoOe+tJZMQWnnwzKMCbmBJeFti
         UBegMRI2IHYMgevt1Y1uv0O1xjZOgJBAVXy/dLS2XGE8yyEBKsByw/Fm0P3dFP9uHw5W
         Nzv1j+SP7LtThgzScuLndbRk9n+aqO0oThctQmC85tYSxzX/CmBfPzjEg0qq054Suzj7
         2bjZVgNfX72/+aDWAGqYMDYRSK2rRQUIzMZj3RW2QmCjFvJv1tgQKQifXRf1Iz2jaC5z
         YJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCUcUMkbx+w0C0hJj4t0L8ScbiWNF6wdAeAl6NyZmQHbT1aBJTGlFAsSfWGeE3OuCObgssoG7A9TYgu3@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmXtnNHPXMup5Sg1oYv2Hl6R4lOX5EFpWRFATbBLovenFRHs3
	r8tyiaEUdp9AJ8Vvr2OywE6W78Yd5wqDKp6q/5azRC7pkRziaPrnKVcruKKhsUZqtDkW6RSjCEw
	nb4/9eG9gjXoZegpsEJTELUV1dnaBlHRrECyxIQ==
X-Gm-Gg: ASbGncvLaYnz+R+Vn6fqHz4lCB6EX3xvfqrhk0oGRuvu4EgdMVlIukVr3K+TQb7kyXC
	NWq/bijcLGFe/BEC8hP5g7s8HjiT+euiNHb0JJA==
X-Google-Smtp-Source: AGHT+IEeoqYz80Wd3bVkHJUUrfvTviJCnLJMCqYe1QoYUN3OHj5ylAeaAyTy8s5czE9UdukTGUShxyO/RkZoJm38G70=
X-Received: by 2002:a05:6512:10cc:b0:53d:ed69:a593 with SMTP id
 2adb3069b0e04-5422953ff0amr954401e87.22.1734697877087; Fri, 20 Dec 2024
 04:31:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:31:06 +0100
Message-ID: <CACRpkdZi-KP2SK4w_Pj_AjQmcSM2miTpAYb7UzWTxtCoqpquuw@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: add gpiochip_add_pinlist_range() function
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for your patch!

On Wed, Dec 11, 2024 at 5:27=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add gpiochip_add_pinlist_range() function to add a range for GPIO <-> pin
> mapping, using a list of non consecutive pins.
> Previously, it was only possible to add range of consecutive pins using
> gpiochip_add_pin_range().
>
> The struct pinctrl_gpio_range has a 'pins' member which allows to set a
> list of pins (which can be non consecutive). gpiochip_add_pinlist_range()
> is identical to gpiochip_add_pin_range(), except it set 'pins' member
> instead of 'pin_base' member.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

(...)
> -int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name=
,
> -                          unsigned int gpio_offset, unsigned int pin_off=
set,
> -                          unsigned int npins)
> +static int __gpiochip_add_pin_range(struct gpio_chip *gc, const char *pi=
nctl_name,
> +                                   unsigned int gpio_offset, unsigned in=
t pin_offset,
> +                                   unsigned int const *pins, unsigned in=
t npins)

Uh this looks messy and I'm not a fan, sadly.

Overall I dislike __inner_function() syntax, so use some name that
describe what is going on please, but I don't think we wanna do
this at all.

Instead of this hack that start to soften the boundary between GPIO
and pin control drivers, I think it is better to do what we often do
and move the whole GPIO driver over into the pin control driver
and have it all inside one single file, since I suspect the hardware
is supposed to be used as one single unit.

Please look at other combined GPIO+pin control drivers
for inspiration, such as:
pinctrl-stmfx.c
pinctrl-sx150x.c

those just access any registers they need as they are in one
driver, but still maintains the separation by just calling the
existing gpiochip_add_pin_range() and be done with it.

This should remove your need for the strange hacks like this
patch and the gpiochip wrapper in the pin control driver.

Yours,
Linus Walleij

