Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E83832B227
	for <lists+linux-leds@lfdr.de>; Wed,  3 Mar 2021 04:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhCCCjS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Mar 2021 21:39:18 -0500
Received: from mail-vs1-f50.google.com ([209.85.217.50]:45655 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349563AbhCBKhi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 2 Mar 2021 05:37:38 -0500
Received: by mail-vs1-f50.google.com with SMTP id z65so7993698vsz.12;
        Tue, 02 Mar 2021 02:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gtnCzCZfIQgQQH55nOcqI1DMPJUSm+J03ubYUyVqxYw=;
        b=XjL8EZ+9enC87LtEFBe+/AGNAS47JB5xBhzh5J6YVzwZvS14fdllZTN+oXYUUQVuMT
         YSSfpLCGdJ13nmNpgNrvhUV22rXln1B3NwlzwLygJqWm2sDyyGqCEZ86xHywLLo2KK9T
         15xSNR8Ajecio5ON4Nj2zIEx2QeeGUddazVPldiz/fQBDMidXBqY1sXnwAv7MztFqvGj
         HIDNXcUROpM1MralKQwbI9nvO6ee9QiGpqflrdp9G+u+zlRFOJbfTcVSuBrjSmTT9Ul5
         hQfdNfB5L9wE9apNeeTsPzuzdbgqyDZvc/8SkLHaSjnDiMC+fyqcSTk7XoizWZOXbkXW
         WpwA==
X-Gm-Message-State: AOAM532HDXIYTB1otwTzInyuiIbrRm3L31+rcurI2OQDwFN81in8v1i2
        g+Jr2vQQwKkgR4zLpxlJjR2Ex3C7RciApRk4oeE=
X-Google-Smtp-Source: ABdhPJxQqNB25Dh3BCQqSzMQ/E3YXwQJDw+X7+fZjgBY5c4frVOzTe3hYCdkXXFNvOiU+uXCRDciwc6c3iny+i0MIdo=
X-Received: by 2002:a67:2245:: with SMTP id i66mr1896921vsi.18.1614681398987;
 Tue, 02 Mar 2021 02:36:38 -0800 (PST)
MIME-Version: 1.0
References: <49ebc8e27958cb77cde36e5f95ad530803259907.1607591119.git.mallikarjunax.reddy@linux.intel.com>
 <dfd39387b1f72eb22a29bad516398a47b20c47bc.1607591119.git.mallikarjunax.reddy@linux.intel.com>
In-Reply-To: <dfd39387b1f72eb22a29bad516398a47b20c47bc.1607591119.git.mallikarjunax.reddy@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Mar 2021 11:36:27 +0100
Message-ID: <CAMuHMdW=M6wougrQMjBdTfFQzPbEQOM-Svq=DTQi8Rvzabxc_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] leds: lgm: Add LED controller driver for LGM SoC
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     linux-leds <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
        malliamireddy009@gmail.com, yixin.zhu@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Amireddy,

On Thu, Dec 10, 2020 at 10:20 AM Amireddy Mallikarjuna reddy
<mallikarjunax.reddy@linux.intel.com> wrote:
> Parallel to serial conversion, which is also called SSO controller,
> can drive external shift register for LED outputs, reset or
> general purpose outputs.
>
> This driver enables LED support for Serial Shift Output Controller (SSO).
>
> Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>

Thanks for your patch, which is now commit c3987cd2bca34ddf ("leds: lgm:
Add LED controller driver for LGM SoC") in v5.12-rc1.

> --- /dev/null
> +++ b/drivers/leds/blink/Kconfig
> @@ -0,0 +1,20 @@
> +menuconfig LEDS_BLINK
> +       bool "LED Blink support"
> +       depends on LEDS_CLASS
> +       help
> +         This option enables blink support for the leds class.
> +         If unsure, say Y.

What is the purpose of the LEDS_BLINK config symbol?
Blink support for the leds class is always available, regardless of the
value of this symbol, and controlled for individual drivers by filling
in the led_classdev.blink_set() callback.

> +
> +if LEDS_BLINK
> +
> +config LEDS_BLINK_LGM
> +       tristate "LED support for Intel LGM SoC series"
> +       depends on LEDS_CLASS
> +       depends on MFD_SYSCON
> +       depends on OF
> +       help
> +         Parallel to serial conversion, which is also called SSO controller,
> +         can drive external shift register for LED outputs.
> +         This enables LED support for Serial Shift Output controller(SSO).

What's so special about this driver that it needs a new "blink" subdir?
Isn't it an ordinary LED driver?
Looking at the code filling in the .blink_set() callback, the hardware
blink feature seems to be even optional?

> +
> +endif # LEDS_BLINK

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
