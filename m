Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B836393949
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 01:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbhE0XdU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 May 2021 19:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbhE0XdU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 May 2021 19:33:20 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888C8C061763
        for <linux-leds@vger.kernel.org>; Thu, 27 May 2021 16:31:45 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q1so2599017lfo.3
        for <linux-leds@vger.kernel.org>; Thu, 27 May 2021 16:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zEQifLQbx7qMjLNpqdbbcwOi4tSxAnfnz+SiV7JkMHM=;
        b=RjuZYS2Lzk+yFeTTveAHMZqaz8NRFV7AtDbckUD0/6Ya4ZV48Tmdi4ALUNHYLGHRSw
         K0S1eM+XBmdWzfjcuDsVpAzA1hHTPFP9tA/V2RnjGtMepQWB5LAdPuD+NLxz+LoLRiVE
         G0p1NFcKaIRJVmQmOCVCsulA3enIMaRDnxtdBQ8boRxF+ZVEe+/uH5zJJ1VIZA73DfeI
         Ps2QBdtbao+wpoByqopEdTj3FHLU5Y1lMSH29HigfARM5QBfkR6qgNTxreAnnf6EfH93
         JjSy2G8qy9kCJK0ANf4mAJLp7z/SPSsLy3hxwco8+kC1eZBcevsUgMCaDdV+rNWQGzhz
         Drsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zEQifLQbx7qMjLNpqdbbcwOi4tSxAnfnz+SiV7JkMHM=;
        b=F7YZO9B9aHYu9DEHGTCli060Ut1lDtZRodPND+/3IJBq/vWW9lSwOXpR1sRb8O1hYM
         fcFOUhErS7xF/OLK7IE6hFv4uImYhC8tEbRggTvC5WYffOnY2T+EWWbml6E6DaNnAvEl
         uFlG8iOanoRl2XasxWcclMbt7XcT7ciozm+Q9DwGwFKFdKGLK2EiTaiRfcdgjWo6C2MK
         VqRWKmY4DLIigp09zeUipjA2axpxwIDSLQeyY/+uuGF4OieGDgywlVOHd+g6MJwL4Mxj
         E8j1tY5IAzygIjre3sA6QXZ5h3Q2igt3DegO6kszE86KID3UyYSchdI85qt5CoLu6ntr
         hJxA==
X-Gm-Message-State: AOAM5322fJlcDNWXW+S/1UnNO1duTONxkoSaIxowRp6l2d5d/mOszjIL
        6DLr4/sx09IhsMDYio2Nof63ph8bZYo15SxDVOAQ8w==
X-Google-Smtp-Source: ABdhPJzLFvvQ+aJrZwMojq8FmCCIj9AXSsxEuVHW+WJfnUMnz2EU/9OuRPqjkFwIuybMyU2NlANPMyxjSzmN95s05vo=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr3874671lfn.465.1622158303739;
 Thu, 27 May 2021 16:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <ea03804a538ecf45287f8cc356b8d9536c91e688.1621809029.git.sander@svanheule.net>
In-Reply-To: <ea03804a538ecf45287f8cc356b8d9536c91e688.1621809029.git.sander@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 01:31:32 +0200
Message-ID: <CACRpkdaLdfe6mBTW61uL2ZifnkWDzPTqOaYqZwH1EVbQFpzSjA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: Binding for RTL8231
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 24, 2021 at 12:34 AM Sander Vanheule <sander@svanheule.net> wrote:

> Add a binding description for the Realtek RTL8231, a GPIO and LED
> expander chip commonly used in ethernet switches based on a Realtek
> switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
> as a plain 36-bit shift register.
>
> This binding only describes the feature set provided by the MDIO/SMI
> configuration, and covers the GPIO, PWM, and pin control properties. The
> LED properties are defined in a separate binding.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

This looks good to me from a GPIO and pin control PoV:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
