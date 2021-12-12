Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3953E471EE4
	for <lists+linux-leds@lfdr.de>; Mon, 13 Dec 2021 00:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhLLX7b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Dec 2021 18:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhLLX7a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Dec 2021 18:59:30 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF4CC061751
        for <linux-leds@vger.kernel.org>; Sun, 12 Dec 2021 15:59:30 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id w15-20020a4a9d0f000000b002c5cfa80e84so3810051ooj.5
        for <linux-leds@vger.kernel.org>; Sun, 12 Dec 2021 15:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1nCJQZ4NdoPnJRrp+7v/Zp7eju3OzQc0nFNi60lhO5c=;
        b=cL7SRyzhmk8iIkOs+czrmLXPxz/aKd9A7Z3+BlSHdyHG99IebbqlJ5/KIxVyOJ4XeD
         0hOMcWOj/1+DE1BU4AzSEnIVdSgxF5rXEFNAn7yaf2X0mDJUrxEW0OisiBXmv49r1IkJ
         yhQLkcTymGKi9cTuPeu8yc/9LnBhvSC8jKcQxKIaPxzZoBDC0CeYS3W1aJv6/B9tX240
         iYhstsyJ2m0Hme857VLQTEpkdLex3FdudgL23bVivUvhHYECBdE3zVb+jlnCWYjHzddn
         wZs+LGJP0XCzznZrHwhcnl7hiNNazrdYrX/kK3mqDDvGayoJCBIHbCGqCRhg++Lm8yky
         qznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1nCJQZ4NdoPnJRrp+7v/Zp7eju3OzQc0nFNi60lhO5c=;
        b=Gaz2Lwd2JO+CBkYLkzqPm8CjJyeLzY8fLgbqavRh9+zHIJHjEcBzq+Pyf2J5RCM0qO
         I/mADi6+8yomqCik1SC93HZ023LPvQTxj0iUTGLkC/TMXfJ1AMvPK5u9udGZWb4FYPV+
         foXjQqtoleXYZvcxquRJR97BQSfl3uQ7nk7p/2Z1Orpf4pYxrmmJQC9pENP4oBXyqxE6
         WjO8iSxfuTv7dKOUyFbdpmcy1oleCXgCxF32g2uXURr5rMjWe/Hra7n+oKoASwuo6HEH
         +JtDXnGXue4Y7FLUTkCSNDM2Z8y0KN+Qxt3YPVW7Ttiy1h3HZ+ED539cs2OELc78xj8M
         1jMQ==
X-Gm-Message-State: AOAM532NnbDw5tREWTd4dhbWL8yAbeSmV5dobimxtB1nBaV5Ay2SFd9p
        hkztTYa7nz//YJZbwpEXbud4vgwbZBJIkK3qG9ApFA==
X-Google-Smtp-Source: ABdhPJwYWqluWVTTnBrGK9rIXlAPt3HKcHPBjAM7BNrQO/myWssBRRNiaRxHJajk4CqKxUagt8pdNsLLjnUfXEMD1bU=
X-Received: by 2002:a4a:aa8f:: with SMTP id d15mr17503855oon.86.1639353570052;
 Sun, 12 Dec 2021 15:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20211212224007.10293-1-merlijn@wizzup.org> <20211212224007.10293-3-merlijn@wizzup.org>
In-Reply-To: <20211212224007.10293-3-merlijn@wizzup.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Dec 2021 00:59:18 +0100
Message-ID: <CACRpkdaW6UeEo7SWac9ibWKSb6w_2KDcoJGGi5qztyPjD1y2xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: lp55xx: initialise output direction from dts
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Doug Zobel <dougdev334@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Dec 12, 2021 at 11:34 PM Merlijn Wajer <merlijn@wizzup.org> wrote:

> Commit a5d3d1adc95f ("leds: lp55xx: Initialize enable GPIO direction to
> output") attempts to fix this, but the fix did not work since at least
> for the Nokia N900 the value needs to be set to HIGH, per the device
> tree. So rather than hardcoding the value to a potentially invalid value
> for some devices, let's set direction in lp55xx_init_device.
>
> Fixes: a5d3d1adc95f ("leds: lp55xx: Initialize enable GPIO direction to output")
> Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to lp55xx")
> Fixes: ac219bf3c9bd ("leds: lp55xx: Convert to use GPIO descriptors")
> Signed-off-by: Merlijn Wajer <merlijn@wizzup.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing my mistakes!

Yours,
Linus Walleij
