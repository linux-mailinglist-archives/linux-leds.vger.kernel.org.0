Return-Path: <linux-leds+bounces-3691-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B13139FA2F0
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2024 00:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B195C188854B
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2024 23:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A3E1DD9AC;
	Sat, 21 Dec 2024 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nx5eDPh+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61BA1CF8B
	for <linux-leds@vger.kernel.org>; Sat, 21 Dec 2024 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734824647; cv=none; b=cdn5veqG9xXvEIsC4iSDfmI+UZK1WIppPfQTJWDRfkDPnH635CCURTP7Z3FM7GnhZlqvduRma90fpnJPcVsNAsmFdKn/JpNt6i9A2VpS3r5tsR3oo0HgQr5jTR7ZXcb0LeDhc7Wl37JVyCJWcWO1L5he6DP7uZwMPX4c3YwNUbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734824647; c=relaxed/simple;
	bh=FAxriXy1VBhEp6+drg9IByRPAx3vaKwqL5CoIFhupp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fotpXIvKm2CZJABhjhU6MjpluMKYX6v/z9c+53X7wEzfR/67qRERFkuSwsOqn+XPAl4IDiTYwrmiDhpFL0/C3iFl6oKQ34mtcjy4bStuDDX4YdPNrKz+b3MKccQPKaEMwCcp9Bds/rc5hoZ490cPz9OxVOmh/zuYukJml7EABUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nx5eDPh+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so3200795e87.0
        for <linux-leds@vger.kernel.org>; Sat, 21 Dec 2024 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734824644; x=1735429444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EAY9TL3VXa9YSmXfF47DjhR+bRcu+p93fOBuspJdNo=;
        b=nx5eDPh+cB9p4wPTx2A6sSJaSJHhkZ5H1pz+MVdmMQmPVlK15C/vrMh0OPRr0SvXk/
         l4r0YaclAUNNIFAiBe6djeoHoVftLiJQJ5S0HLUu5F7t3C4fh0cA49QQPbwNcat6mN9T
         nsN42beGQSl9E/uwbgoF8GBM3XM2xIrEpBB2HN2Z0NiLU9DGYth9cDoxHsf8zyKL/na4
         AK0b432midal84SVRVnhAbo8OtK1m6UOf1EjBhnETXsd2MIa6bSHcmkjwycz9um3ORdV
         hswaDtOKm3vNKtrjXjjej5Nrxna0e9GtWly3DC4j+kNF30cGq9JE5gd9SlbS84Znozqy
         iDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734824644; x=1735429444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EAY9TL3VXa9YSmXfF47DjhR+bRcu+p93fOBuspJdNo=;
        b=B6GXEgR5+7SxVIvZiBUg0n3k/PgG2whiy+w+T6jitsfr2QqR9Fjerz7GxPaSFfqiah
         0H4jtgocbQmTBVZeWhQXMXCT+qc7rYwhSxK/bUKv8Q6uxzhA+rcd+mQPCtvX7XLMNuC1
         zxxblyimi5+z2mSKZ6rLs0vFNriC5g76ImBMfCLJI9ZuboW1cysXrYoDglo/tm5oNvAc
         YIwLN0JGh7cdbu5DjmQd3yqUm6O8SGzvR9ofi6O5SWr4huvULJseiPwUWILrUvPWugvd
         9qqsZ+zgmn8FVpJ+a7jVCFyhiFfTx4lX0cy0RqIquYbP2Sr55iELiaiFu8a3QC9p0uWt
         O96w==
X-Forwarded-Encrypted: i=1; AJvYcCXOOfPcZG5qXrXMV+Sqz4yqMTNsoeF4pwnUtldlqHv8NSSi/Ixih19d51tS+mCPBGFVAJB5FVTcuJY7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vaym84RzmyrqC9HNvfQFzwNk+QsKZ/CIIZXg+8JBrTkJ5ocK
	P0HtpvciG/3ybDEilu8S/t0ZGsFGsaVolYslWB6ZinkVkUcAZUGz3q/fhDP6q3ONjdFWX0GKQFP
	Zs8KYS4MKIoSpuoUrtMUprQIb0v/QGN+WTz7V17cFM7JT5Ofkoo8=
X-Gm-Gg: ASbGncvOPfej2NlsyDof0PjayxCqRVP4Toh/zQRzDkQTUzvwjgixVOwB05luMDu0vUC
	fg1PcScSQSgr9+S/Bdd6VaxwidiogSsjukq9C
X-Google-Smtp-Source: AGHT+IGvv1HHB3ir44LqmxfQzI5NCI5yGpRRnfZXrg8Ab09YCK/dKPLkcceMg5vvGQghPyyeYWnMhg6tQndCLvQxcQM=
X-Received: by 2002:a05:6512:4014:b0:540:251e:b2c2 with SMTP id
 2adb3069b0e04-5422957b03emr2371945e87.53.1734824643653; Sat, 21 Dec 2024
 15:44:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-4-24719be27631@bootlin.com>
 <CACRpkdZ_AwiE+HFX6TFBgscaVquKm_tegNSbTT0fhFmpkM7d_Q@mail.gmail.com> <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
In-Reply-To: <9e692951-86a1-4dda-b843-58173453ffe0@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Dec 2024 00:43:52 +0100
Message-ID: <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for your detailed reply!

On Fri, Dec 20, 2024 at 2:50=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Yes my cover letter was a bit short, and maybe some context was missing.

The text and graphics below explain it very well, so please include them
into the commit message so we have it there!

> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also makes a kind of switch/mux.

Since it's Intel we need to notify Andy to help out with this so that
it gets done in a way that works with how he think consumers
should interact with Intel pin control and GPIO.

> +---------+         +--------------+             +---+
>           |         |              |             | H |
>           |---------|              |-------------| E |
>           |         |              |             | A |
> Intel Soc |---------|    FPGA      |-------------| D |
>           |         |              |             | E |
>           |---------|              |-------------| R |
>           |         |              |             |   |
> ----------+         +--------------+             +---+
>
>
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each "switch", has a direction flag that shall be set in tandem with the
> status of the SoC pin.
> For example, if the SoC pin is in PWM mode, the "switch" shall be
> configured in output direction.
> If the SoC pin is set in GPIO mode, the direction of the "switch" shall
> corresponds to the GPIO direction.
>
> +---------+              +--------------+             +---+
>           |              |              |             | H |
>           |              |      \       |             | E |
>           |   PWM1       |       \      |             | A |
> Intel Soc |--------------|-----   \-----|-------------| D |
>           |              |              |             | E |
>           |              |              |             | R |
>           |              |    FPGA      |             |   |
> ----------+              +--------------+             +---+
>
> (PWM1 pin from Intel SoC can be used as PWM, and also in GPIO mode,
> thanks to the Intel pinctrl driver).
>
>
> Few pins (PINMUX_* pins) work differently. The FPGA acts as a mux and
> routes for example the I2C0_SDA pin or GPIOX (of the SoC) to the pin head=
er.
>
> +---------+           +--------------+             +---+
>           | I2C0_SDA  |              |             | H |
>           |-----------|----- \       |             | E |
>           |           |       \      |             | A |
> Intel Soc |           |        \-----|-------------| D |
>           | GPIOX     |              |             | E |
>           |-----------|-----         |             | R |
>           |           |    FPGA      |             |   |
> ----------+           +--------------+             +---+
>
> The pin header looks like this:
> +--------------------+--------------------+
> |      3.3V          |       5V           |
> | GPIO2 / I2C1_SDA   |       5V           |
> | GPIO3 / I2C1_SCL   |       GND          |
> | GPIO4 / ADC0       | GPIO14 / UART1_TX  |
> |      GND           | GPIO15 / UART1_RX  |
> | GPIO17 / UART1_RTS | GPIO18 / I2S_CLK   |
> |     GPIO27         |       GND          |
> |     GPIO22         |      GPIO23        |
> |      3.3V          |      GPIO24        |
> | GPIO10 / SPI_MOSI  |       GND          |
> | GPIO9 / SPI_MISO   |      GPIO25        |
> | GPIO11 / SPI_CLK   | GPIO8 / SPI_CS0    |
> |      GND           | GPIO7 / SPI_CS1    |
> | GPIO0 / I2C0_SDA   | GPIO1 / I2C0_SCL   |
> |     GPIO5          |       GND          |
> |     GPIO6          | GPIO12 / PWM0      |
> | GPIO13 / PWM1      |       GND          |
> | GPIO19 / I2S_FRM   | GPIO16 / UART1_CTS |
> |     GPIO26         | GPIO20 / I2S_DIN   |
> |      GND           | GPIO21 / I2S_DOUT  |
> +--------------------+--------------------+
>
> The GPIOs in the pin header corresponds to the gpiochip I declare in
> this driver.
> So when I want to use a pin in GPIO mode, the upboard pinctrl driver
> requests the corresponding SoC GPIO to the Intel pinctrl driver.
> The SoC pins connected to the FPGA, are identified with "external" id.
>
> The hardware and the FPGA were designed in tandem, so you know for
> example that for the GPIOX you need to request the Nth "external" GPIO.
>
> When you drive your GPIO, the upboard gpiochip manages in the same time
> the direction of the "switch" and the value/direction of the
> corresponding SoC pin.
>
> +------------------+         +--------------+             +---+
>                    |---------|              |-------------| H |
>                    |---------|   GPIOCHIP   |-------------| E |
>    Intel gpiochip  |---------|              |-------------| A |
>  provided by Intel |---------|    FPGA      |-------------| D |
>   pinctrl driver   |---------|              |-------------| E |
>                    |---------|              |-------------| R |
>                    |---------|              |-------------|   |
> +------------------+         +--------------+             +---+
>
>
> About gpiochip_add_pinlist_range(), I added it because the FPGA pins
> used by the gpiochip are not consecutive.
>
> Please let me know if it is not clear.
> And sorry I'm not very good to make ascii art.

I get it! We have a similar driver in the kernel already, look into:
drivers/gpio/gpio-aggregator.c

The aggregator abstraction is however just software. What you
need here is a gpio-aggregator that adds some hardware
control on top. But it has a very nice design using a bitmap
to keep track of the GPIOs etc, and it supports operations
on multiple GPIOs (many man-hours of hard coding and
design went into that driver, ask Geert and Andy...)

So I would proceed like this:

- The pin control part of the driver looks sound, except
  for the way you add ranges.

- The gpiochip part needs to be refactored using the
  ideas from gpio-aggregator.c.

- Look closely at aggregator and see what you can do
  based on that code, if you can mimic how it picks up
  and forwards all GPIO functions. Maybe part of it
  needs to be made into a library?
 <linux/gpio/gpio-aggregator.h>?
  For example if you start to feel like "I would really like
  to just call gpio_fwd_get_multiple() then this is what
  you want to do. The library can probably still be
  inside gpio-aggregator.c the way we do it in
  e.g. gpio-mmio.c, just export and keep library functions
  separately.

- The way you split up gpiochip_add_pin_range() I
  still do not understand at all, in my view you just want
  this gpiochip to refer to the pin controller pins in the
  same file so I don't see it. How can e.g.
  pinctrl-sx150x.c do this trick but not your driver?
  I might be missing something though.

Yours,
Linus Walleij

