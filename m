Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04AC11C845
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 09:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfLLIeD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 12 Dec 2019 03:34:03 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36107 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbfLLIeC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Dec 2019 03:34:02 -0500
Received: by mail-ot1-f66.google.com with SMTP id i4so963287otr.3;
        Thu, 12 Dec 2019 00:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7fvx7yDi2OJnCljKrNkvyaUJ3elftb+j+bBc7GwPwuI=;
        b=GCoqvd/2PN5TIrbvvi2f/PiCnEt2TnHkDiAtjKlQjY6zbbRj+LQdACs8pDesthy7c4
         wZJIpSLNMP0RcTfBtezuD2Q5eEQTGTwFSXotoYjiE/IHgBuVlnMYdRlyKHoW4+se5qpD
         yGMlhm8X8q1iG5Xi89zLftB+6aoUEFInSxxgjA4RoSODZncQ7/a0zlY68qt39+5OoIzo
         /cU5Rj4HRYwqcIb7affzE0o7sBrWREvsvff3v39MZKiZ+lDhFgQfU8qBHZuyYwEU1RpF
         IKU+HlKjOEGlC0F0UqUC3WCIV24XbUy1NWnrCFL5iiGrwBviKZQwz/IXpyGtE7Fg0Atr
         teRw==
X-Gm-Message-State: APjAAAUs9p04K2u5A6UFl3XZJU3TSPaehYJ5+Qdv4VywQcl9NQ1+P+Sa
        BeZhBlQ3w9fcnDuAsIKpJ4wxqyxCI+DSls1qdS8=
X-Google-Smtp-Source: APXvYqyg8EUp0UowSQsLs+cQtO/euj7BCoC7VMBAMlGTNmuDrRrNYIEAmAIr8CXJ/20PVq4AUPZTvZrcUCUshJokNog=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr7008960ots.250.1576139641834;
 Thu, 12 Dec 2019 00:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20191212033952.5967-1-afaerber@suse.de> <20191212033952.5967-20-afaerber@suse.de>
In-Reply-To: <20191212033952.5967-20-afaerber@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Dec 2019 09:33:50 +0100
Message-ID: <CAMuHMdWeqoqQBtsdN2Q=Urc22Ezj5nBRFPk1_V5gvGV9BGuMkw@mail.gmail.com>
Subject: Re: [RFC 19/25] leds: tm1628: Add 7-segment display support
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Andreas,

On Thu, Dec 12, 2019 at 4:42 AM Andreas Färber <afaerber@suse.de> wrote:
> Detect DT child nodes covering more than one LED component and implement
> a text to 7-segment display mapping.
>
> Signed-off-by: Andreas Färber <afaerber@suse.de>

> --- a/drivers/leds/leds-tm1628.c
> +++ b/drivers/leds/leds-tm1628.c

> +static const struct tm1628_ssd_char tm1628_char_ssd_map[] = {
> +       { '0', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT |
> +              SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },

Please use include/uapi/linux/map_to_7segment.h
Yes, it is well hidden ;-).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
