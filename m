Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1FA44AC3C
	for <lists+linux-leds@lfdr.de>; Tue,  9 Nov 2021 12:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240778AbhKILG2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Nov 2021 06:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhKILG2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Nov 2021 06:06:28 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555B3C061764
        for <linux-leds@vger.kernel.org>; Tue,  9 Nov 2021 03:03:42 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso27538257otg.9
        for <linux-leds@vger.kernel.org>; Tue, 09 Nov 2021 03:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cde9sTeLd0vmgQnDHFOawLma/945mJa1LBSD0r3d4s0=;
        b=KUI62Pd4Hj8HYSVaTZVhn3KQ/1ACqdRRbXUCxDm7Cl8VDNJ30jya31vSmTFZoNbTqZ
         alW0aZBNZ6y07fcs1h/IQ76exO8Tt+nUWG1WLdpjZXJzbv7JBbkb6Th0s6hutWHTMJul
         zNpfutFxzNwYz5uCgG6ipTjXUBqGZwv0pPQhMTLUoHB/kgUresoM+UTy0SXno5zo4vnr
         KpufGMJgF7Sk3SuTLYslA+Oa1Dq/gzdkM0jNnr/+O7z/76BsdwzbRGb2HJtr2gdPTcuG
         GjbBl9U35n20sIBbapohjJXCfJYxQoczB9QGluiaDkmhQEyS+U9OT1rRoyV7/1LookLj
         DINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cde9sTeLd0vmgQnDHFOawLma/945mJa1LBSD0r3d4s0=;
        b=gf8bN0qJEylXGT0xkx4JCikkOMAECkb+6Nk7iTZ85uz5/0nOQXT5UXES6Qun9+34zE
         UgnhivJkEaH/x+0hQn/vLRjhs0QSIUPQH7vU1n2KXM5f9GMxmoZd6Lom0bXyiCkWTjR5
         QCYX/m5OpULauDoniiuunKwQozvSOCzNUmWZ7vI1Vww32lJJvGYpjV8jWPWYIGpYoO3C
         8MMTbOWEC4kcjeYUGEsWvwPLNGtLzvQ/8/UNDNwe26mH93vAKTqQitoRg/mgtmYWxW8j
         9BtvnSdTHJH9DRgmfBMYhLK01wlvg9ojY3JZH9k2yxhm0iMRMK9FfjnrP5VlRAP8EcNH
         G+4Q==
X-Gm-Message-State: AOAM53269wXCQHuk7Hv5HJ3ALvkKNHw0/5UM9pfNdz0W9XftzT/K0Ns2
        6ih5ySQ6QDnm8HlaeTQAJ1S0xohfbeB308omSa/V9A==
X-Google-Smtp-Source: ABdhPJwQOh0weKMLmGhNanRSWouIAcQ21jLyTUZlfQlEatdYccM7AhIWTjH/d9ZVCzYfYnSdy1TMVoeQKsf8ytpQYFs=
X-Received: by 2002:a05:6830:2809:: with SMTP id w9mr5110934otu.237.1636455821654;
 Tue, 09 Nov 2021 03:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au> <20210921043936.468001-2-andrew@aj.id.au>
In-Reply-To: <20210921043936.468001-2-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:03:30 +0100
Message-ID: <CACRpkdZRWzq_j_UsU+eZurv1wT7muB1V4ktui1-Q0mHV3xw58A@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: pca955x: Make the gpiochip always expose all pins
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 21, 2021 at 6:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The devicetree binding allows specifying which pins are GPIO vs LED.
> Limiting the instantiated gpiochip to just these pins as the driver
> currently does requires an arbitrary mapping between pins and GPIOs, but
> such a mapping is not implemented by the driver. As a result,
> specifying GPIOs in such a way that they don't map 1-to-1 to pin indexes
> does not function as expected.
>
> Establishing such a mapping is more complex than not and even if we did,
> doing so leads to a slightly hairy userspace experience as the behaviour
> of the PCA955x gpiochip would depend on how the pins are assigned in the
> devicetree. Instead, always expose all pins via the gpiochip to provide
> a stable interface and track which pins are in use.
>
> Specifying a pin as `type = <PCA955X_TYPE_GPIO>;` in the devicetree
> becomes a no-op.
>
> I've assessed the impact of this change by looking through all of the
> affected devicetrees as of the tag leds-5.15-rc1:
>
> ```
> $ git grep -l 'pca955[0123]' $(find . -name dts -type d)
> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> ```
>
> These are all IBM-associated platforms. I've analysed both the
> devicetrees and schematics where necessary to determine whether any
> systems hit the hazard of the current broken behaviour. For the most
> part, the systems specify the pins as either all LEDs or all GPIOs, or
> at least do so in a way such that the broken behaviour isn't exposed.
>
> The main counter-point to this observation is the Everest system whose
> devicetree describes a large number of PCA955x devices and in some cases
> has pin assignments that hit the hazard. However, there does not seem to
> be any use of the affected GPIOs in the userspace associated with
> Everest.
>
> Regardless, any use of the hazardous GPIOs in Everest is already broken,
> so let's fix the interface and then fix any already broken userspace
> with it.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
