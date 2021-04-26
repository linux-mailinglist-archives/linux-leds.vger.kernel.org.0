Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5837136ACAC
	for <lists+linux-leds@lfdr.de>; Mon, 26 Apr 2021 09:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhDZHHa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Apr 2021 03:07:30 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:40614 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhDZHHI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Apr 2021 03:07:08 -0400
Received: by mail-ua1-f43.google.com with SMTP id 33so17259936uaa.7;
        Mon, 26 Apr 2021 00:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NxKpBaqZsLjThpHjgG0iPAYuxf1rd8xygjZGBw1rDEM=;
        b=B4SYrutweq3tiZq+crr4rQ5QNjxhjqix73nCnhnLcm0FIq8p57Fe0L/fkDBQSb+X4H
         Hv3hnDFJcy7nvLVAq9kt4tc3IpAGuuBquceKrrhAyfm5PA39iEalfG6U9Xg3ld/FHJKl
         f3NMRPtPSDl+rvMuVm5us+dPIKbXuxn7KAUg5BAWmofiLoQPoka8JUy+kUTUgoXSbShT
         awAh8f7nNsjQpVRhiCTe2TFY1mWDXz8ynHkhK/zEG7MDrzv0i4Qya7JC9pUjmJ2lXaPL
         JNmLL4auU02+DkzeZxLgmiwuVCpm1+Hit2IcekwRbi49pWUJUZ8C3HjUbYCnQwfWaAKI
         bfWQ==
X-Gm-Message-State: AOAM532P+LFTJohVtrxt3zBo25WB74ychDq9INHViwlcZW/O6V9sEdZe
        fRm9BKQzpV9hxyZeUPAvG1GvnCdFwKnOxaDqhLE=
X-Google-Smtp-Source: ABdhPJw6VQPZHcNgdUHX1pi07vEhOyTaZLo2ALg7j4KoO1/3EcUhOhXw0u7AfZlCHA4qkmFNAp/ncifXTc3ixsRCWs0=
X-Received: by 2002:a9f:262c:: with SMTP id 41mr10707332uag.4.1619420787404;
 Mon, 26 Apr 2021 00:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210316133946.2376963-1-geert+renesas@glider.be> <20210425205717.GD10996@amd>
In-Reply-To: <20210425205717.GD10996@amd>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Apr 2021 09:06:16 +0200
Message-ID: <CAMuHMdW_Mf49yLVt+BJjNNLi+H5C-qaaWFfjQNBr5iuSo25xZQ@mail.gmail.com>
Subject: Re: [PATCH] leds: LEDS_BLINK_LGM should depend on X86
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-leds <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Sun, Apr 25, 2021 at 10:57 PM Pavel Machek <pavel@ucw.cz> wrote:
> > The Intel Lightning Mountain (LGM) Serial Shift Output controller (SSO)
> > is only present on Intel Lightning Mountain SoCs.  Hence add a
> > dependency on X86, to prevent asking the user about this driver when
> > configuring a kernel without Intel Lightning Mountain platform support.
> >
> > While at it, merge the other dependencies into a single statement.
> >
> > Fixes: c3987cd2bca34ddf ("leds: lgm: Add LED controller driver for LGM SoC")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This rejected, so I applied it by hand.

Thank you!

> I'm deleting the Fixes tag --
> we don't want this in stable.

Why not? Shouldn't people running stable be shielded from useless
questions while configuring their kernels?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
