Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDD511A03F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2019 01:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfLKAwe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Dec 2019 19:52:34 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46456 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLKAwe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Dec 2019 19:52:34 -0500
Received: by mail-lf1-f66.google.com with SMTP id f15so14446617lfl.13
        for <linux-leds@vger.kernel.org>; Tue, 10 Dec 2019 16:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+hPpHYbZvMNhUWsmPKClh4yqAHLYFFQsXpUry2YILWs=;
        b=bFTYrGydcvrkcggmBJZ2MWVq1OQa1SZVUGIyt1Ojx+x+A//uQQmIPV0M29vxnqld+P
         W89e6weq0fK27I1ExXJ+2A/PF0nd3nW/SB50/JxM1eubWEL4WKurD5qZejfxcgMq71zc
         iEAXKIXXBEEBi8P51BWvRWy6d4Ya2tkl0pNzMR6Y3xpHRViQeX8qrPCLYllE6Wa1uuUX
         vPDfDQjl/fZNDu5+NbH3SbvvYncPyiYuY1EyASa1rttNTfOzSsRV+2TAmyP76bau8lmE
         xw8+lqSbhUo77tgmYIitG51astIr80ZzCUR8ZXj7090xbw+Aa9pZ6bg7DQoBDCDsbt7g
         gFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+hPpHYbZvMNhUWsmPKClh4yqAHLYFFQsXpUry2YILWs=;
        b=VlqfHNJFgJpKoz4DmG/+PcmISslLciH6+xyFIxhO8qEbUmgSdUq9lGF2LhKlhwnXqx
         ts09adx8ptVAfgo4Ok8wGEjs8K+ggN0Wl3voTZhyAmfcaX3WLPCy7xpe4rmC576DYC6i
         LuRLStqwPOcBsb9P2TWPX9qo4yTBulF4FOUilfMoZuTqv+Hs2ZS/MgHMuXqcRNg1eIR6
         T9QIJ1j6QDIvq3imlf0yiEEqw2OH492buKpwiO2WmrbSmnsw1uMR8ZULYUDc6+S6lFWa
         aGNjmICUYyILnHmttw3AMSYEncXxhw8UqJVQRtdXYvHlM1Ub4T0+p0vL9gyYzWvfd1e2
         /4eQ==
X-Gm-Message-State: APjAAAVpe1wda9rFLX+pVcLy4aH4Ik8gWMjhex3HEEGhyRFx3n81hq/z
        aheXPYpg6EUVUiHlr09tnTowjcun+mvo0xvtwhGxaA==
X-Google-Smtp-Source: APXvYqyinnXJjs9kkKZ/wF30k35+kW+3He14EHMeJQ1hGvIupQ8eOfZI6M/H7XY4irv6wGAug2vlFkUyohfFiFGqwng=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr405761lfg.117.1576025552325;
 Tue, 10 Dec 2019 16:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20191209004242.18152-1-linus.walleij@linaro.org> <657234de-bcd9-0482-7bc9-5f17a1126484@ti.com>
In-Reply-To: <657234de-bcd9-0482-7bc9-5f17a1126484@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 01:52:21 +0100
Message-ID: <CACRpkdZfyuYq-rfQE4yxX96jdj5WxBPUFB6M_NApOr0muMm+1g@mail.gmail.com>
Subject: Re: [PATCH v2] leds: bd2802: Convert to use GPIO descriptors
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Kim Kyuwon <chammoru@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Dec 9, 2019 at 3:07 PM Dan Murphy <dmurphy@ti.com> wrote:
> On 12/8/19 6:42 PM, Linus Walleij wrote:

> > +     led->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
> > +     if (IS_ERR(led->reset))
> > +             return PTR_ERR(led->reset);
>
> What about EPROBE_DEFER?

That's fine? I don't understand this comment, the driver will
bail out and be retried if deferral happens.

> Is the reset line optional or required?  I see that this device does not
> have DT docs and the call infers it is required.

This driver does not use DT. It needs to be used with board files.

> But can this be optional?

Since there are no users in the kernel it doesn't matter, if it needs
to be optional then whoever is going to use it can make it optional
I suppose. I can't really half-guess use cases when noone is
stepping up and providing one.

Yours,
Linus Walleij
