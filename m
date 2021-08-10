Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A033E5BCB
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 15:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241539AbhHJNf1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 09:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241538AbhHJNfZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 09:35:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A14EC06179B
        for <linux-leds@vger.kernel.org>; Tue, 10 Aug 2021 06:34:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h9so29128377ljq.8
        for <linux-leds@vger.kernel.org>; Tue, 10 Aug 2021 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weC7sDSz7PzZbDSqoiKFHyafe+0MyeXAiBAfK1qKcS4=;
        b=ZkMvWvxM4pvYUqy5fI/4E/yYTR8XZ9e8pydJ6+ayXV+l/hEgGcg9Ypw9CVe+FUTQ2v
         /houmtJqyVgq02TKQ6a746nHq4/i+0VpeDz9l/1d2CpGOlFO38Q1vpU6i7sO+p2s3tMI
         DUlynGX/7LZqhwkoGdQ1I52fAp7G+fpqh10/pb1NMYjXvJSVuesWsHOSGtrvkuPxriNc
         jvVf677JQLZxYssZpEuMQaobwk4MEkUKrGAGiABlPkeOE1bm7qE+ceiIrkU9NvaF3v3R
         LaSTJbXjQcT785+AN9Ak3xvACeT3zp4mEp3Lyn0uUHq+VwXoC16GbDvi0V6XITOL18RG
         FEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weC7sDSz7PzZbDSqoiKFHyafe+0MyeXAiBAfK1qKcS4=;
        b=hz6c7JeHM3VWwNRjQ/x4TyjcSvVkjHacU9AIWzkWhG1sPX/rz+tsAyvSX8hbcQ4y76
         rQho7DSVpCGmvwbUcI6hv7Gov7VOInjtyE9f8OnJ/JbOjwitD2P1LWKMwvwH4spmIRCg
         /rpwNGxamMFOueec2hdIV/e5wEiHgA/w+2DDYIAYXj0S0tR4KfrFCkjMufgfkxO99vb7
         gR+cjSF7M51ET6V1BVJrpJ5C+jRWXlQvOXDgHA1afr5IrnEHfw736aTGiOEUGQBNIUiO
         G/g0IF3UtyFAm4r2OJYHbaglUKOgGjJxlE3HuDeYli9k6KSrnbXosfJXVzU0qumpaO1b
         8srw==
X-Gm-Message-State: AOAM531PUePDybHT8UnrzR9g8ecTsXdoWTbKjcq+kgkgQ9B9sCaWNRde
        hElrEVF+dJklGjGxVDKkcNT+urss2PJAeMza4amp6g==
X-Google-Smtp-Source: ABdhPJxTxTJieZbnaNjRPZUIvrVUDFyycbbX1QvFSIH1cQRHK81GI3c7N6EJyS6zlrZ5d2BhxV7i2qX73NcqQoP17mQ=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr19671128lji.326.1628602490522;
 Tue, 10 Aug 2021 06:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <20210723075858.376378-2-andrew@aj.id.au>
In-Reply-To: <20210723075858.376378-2-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:34:39 +0200
Message-ID: <CACRpkdZ4A3Lw2U+_jXfbuXJFhpesi3SzNN1Codqxi4sLNu5zPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] pinctrl: Add pinctrl_gpio_as_pin()
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Allow gpiochips to map the GPIO numberspace onto a pin numberspace when
> the register layout for GPIO control is implemented in terms of the
> pin numberspace.
>
> This requirement sounds kind of strange, but the patch is driven by
> trying to resolve a bug in the leds-pca955x driver where this mapping is
> not correctly performed.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

(...)

Hm  this looks a bit strange...

> +int pinctrl_gpio_as_pin(struct pinctrl_dev *pctldev, unsigned int gpio)

This is not a good name for this function. Try to come up with
a name that says exactly what the function does.

E.g. "apple pear as apple slice" isn't very helpful, the use case for
this is really hard to understand.

> +EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);

This looks completely wrong.

Yours,
Linus Walleij
