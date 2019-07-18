Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C99686CEC1
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfGRNTu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jul 2019 09:19:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39965 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRNTt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jul 2019 09:19:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so28658100wrl.7;
        Thu, 18 Jul 2019 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OLDs21KMIbgvdFUuvjXWKrJvzDqxKAC/PhzEbEX10Nc=;
        b=n8id90WdayYJdA5Hv1yRTX+yHg1lxWjz2Kq24cUbg9XU12h91f7jAgtkTNpq0AA947
         jMmcZxlIjzUWp9B+89O7ijwBdWv7Flt4G4skmojcF3E/C/q4O+ze4ZVmwCsnj6r/ybMj
         UrZ/LhqPXj0YI4La3rihQBrb8tppwfyltLg6N5tHGFrNK2qmUXifpPnL0L4Wv72OIg0f
         FgPHa4B5rn2Jv7HxbL0EHcUTODNqDQv7FSW7gYXEi35wMBqneDRdDPu/pSELK+lUyNE5
         mH2TcLYp6YOiw9OOMFzGm79V4Xi6qHABFLy7rd572ufVYbVgnDsUr8z2cG7HRFiYgfsL
         tEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OLDs21KMIbgvdFUuvjXWKrJvzDqxKAC/PhzEbEX10Nc=;
        b=VHGDBmkQG5EcETw1+oRZmtKAU3rNGnDHaiEfVgFTxNIXwbrcTQQvKdsm8Zrleo81Vz
         2N5Pe5QGeXZxlXQo5b6O4BjldlbNTi/pIARGrrVtPy2vACsqbgozSgIlQDEIMnIXyaHB
         ba25dQs//tS/tous1vUpw+GxtFDnEf7eS9wa8ldzWFk7qq3iMn39PzqgAMmo3c4Um0rI
         ZcykMMhxU5GPOdYoWP94inkKGPw3AGr072smgnbbC8QeJakaK6SKGa95hgGJgT31Chdv
         QMKybmxzWCYdE6CLom5o4iHhXfpVuIuVvuqeT++ISiJN2r5CwIjiLjjizJpKeDl3aayF
         RnYQ==
X-Gm-Message-State: APjAAAX0D6uE/1OJ+QEeVB9tHzN6ed6XrKCOm5Gh5pfaAa9uwpx2r86S
        fQh3Ubzn19innGGm29J1ADY=
X-Google-Smtp-Source: APXvYqz3Y6aPFdcL25IhafcGWP/1Zzs5bnp/6nbtuPuAGXkO6jhwrz9Di79NvbLRrTSIgLXBBRA9Aw==
X-Received: by 2002:a5d:4108:: with SMTP id l8mr49151936wrp.113.1563455986905;
        Thu, 18 Jul 2019 06:19:46 -0700 (PDT)
Received: from [192.168.1.19] (bkt159.neoplus.adsl.tpnet.pl. [83.28.187.159])
        by smtp.gmail.com with ESMTPSA id c30sm42096099wrb.15.2019.07.18.06.19.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 06:19:46 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] Add a generic driver for LED-based backlight
To:     lee.jones@linaro.org
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
References: <20190717141514.21171-1-jjhiblot@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
Date:   Thu, 18 Jul 2019 15:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717141514.21171-1-jjhiblot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/17/19 4:15 PM, Jean-Jacques Hiblot wrote:
> This series aims to add a led-backlight driver, similar to pwm-backlight,
> but using a LED class device underneath.
> 
> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> backlight driver on top of a LED device:
> https://patchwork.kernel.org/patch/7293991/
> https://patchwork.kernel.org/patch/7294001/
> https://patchwork.kernel.org/patch/7293981/
> 
> The discussion stopped because Tomi lacked the time to work on it.
> 
> changes in v4:
> - fix dev_err() messages and commit logs following the advices of Pavel
> - cosmetic changes (indents, getting rid of  "? 1 : 0" in
>   led_match_led_node())
> 
> changes in v3:
> - dt binding: don't limit the brightness range to 0-255. Use the range of
>   the underlying LEDs. as a side-effect, all LEDs must now have the same
>   range
> - driver: Adapt to dt binding update.
> - driver: rework probe() for clarity and remove the remaining goto.
> 
> changes in v2:
> - handle more than one LED.
> - don't make the backlight device a child of the LED controller.
> - make brightness-levels and default-brightness-level optional
> - removed the option to use a GPIO enable.
> - removed the option to use a regulator. It should be handled by the LED
>   core
> - don't make any change to the LED core (not needed anymore)
> 
> Jean-Jacques Hiblot (2):
>   leds: Add managed API to get a LED from a device driver
>   dt-bindings: backlight: Add led-backlight binding
> 
> Tomi Valkeinen (2):
>   leds: Add of_led_get() and led_put()
>   backlight: add led-backlight driver
> 
>  .../bindings/leds/backlight/led-backlight.txt |  28 ++
>  drivers/leds/led-class.c                      |  92 ++++++
>  drivers/video/backlight/Kconfig               |   7 +
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/led_bl.c              | 268 ++++++++++++++++++
>  include/linux/leds.h                          |   6 +
>  6 files changed, 402 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>  create mode 100644 drivers/video/backlight/led_bl.c
> 

For the whole set:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Lee - we need to create immutable branch for this set since there will
be some interfering changes in the LED core in this cycle.

I can create the branch and send the pull request once we will
obtain the ack from Rob for DT bindings, unless you have other
preference.

-- 
Best regards,
Jacek Anaszewski
