Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60381320CF
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2019 23:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFAVrU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 1 Jun 2019 17:47:20 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38494 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfFAVrU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 1 Jun 2019 17:47:20 -0400
Received: by mail-lf1-f65.google.com with SMTP id b11so10699762lfa.5
        for <linux-leds@vger.kernel.org>; Sat, 01 Jun 2019 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6nCK9q/VrEmkE0MA35Ks1pd7nqoPKETWapY0l+QqiG4=;
        b=rt+03er3tScPjaIye6R20dR0d8EheNZGG3UObRM00R8eqwlKUvUTtKGP8nkqC7tAes
         B2kxdg7EX76emLWvNmXF0sHM0S7IDwoOyUQt6O1BPHG4ov7ZWm1tZ0vbzGNaUnpy41Zm
         tZDxbbrhf/pV8WZTERBGikEHlyVqbhMgcpd6RNGawsB6jdlyVh+3y6GTIFhOd/z8RwH+
         VXukH3i92mTMdWkTxcFewihlSV05a4rBW/n6wPs5zy6iJPE8J/IdAyYj+4rd0IDP11wF
         CI54JUzG8LNWVWSxRLTTmnGCCXN5HqYPH+tQ8AU4nIT2CLkLDUL4/Wtxuh2iWzzTCuW5
         n4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6nCK9q/VrEmkE0MA35Ks1pd7nqoPKETWapY0l+QqiG4=;
        b=qF7e4ztsiHRw7ATiPEXQ6BTbodlJZ8CzZYFZuNpdWFzNUrbiahSl8bCLRMQQqVT+nj
         5PBEL9u9wznEusEOxVC1xeuoiLprRUG1mdA8VoTUc1sov8YFcwfk33wfKf7kVBB94R+B
         uOh0cBCH5uCZEg9derGBflBMhIaAg+p0AXqUBRk3hie9KHXXO8WB0mIbSDXcNtEC+Oog
         NPbV8xrZduMMdzf71XCG1vi6gDPcsQ2NRGRRxVJUe4UusozQ8h2K6v/sryiRYhe0h9PA
         r721hcT4vHajEkX6Zut+r0jXYYZsI6YmsRTNxD5S5WJVJZgwDIFzGmPwb/rgU6+Z8CIu
         +pWg==
X-Gm-Message-State: APjAAAWQ0b8qA8LJgZ82bBZxXHAx5eGfH1jK0eMmL+ZIYU2lxYZNNI4B
        Aeeaoi11gq/1aXb6ge/MNTJL/HyvZqRcETkpJMBAtg==
X-Google-Smtp-Source: APXvYqxSfFNVbZurJ6W9DSLfSasP2nicALImRDPIJ8PhV8PHRe8yiqBZxIV9+Sb5yYVQsuNiwyy7NaVqKPtwU4r/AY4=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr7863532lfu.141.1559425638526;
 Sat, 01 Jun 2019 14:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181127150106.20213-1-linus.walleij@linaro.org> <20190601203747.GA13060@amd>
In-Reply-To: <20190601203747.GA13060@amd>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 23:47:07 +0200
Message-ID: <CACRpkdYUJURZB1+yTL0psc1qMhdV=UHmjtOY7UrGg7x-2tvJXQ@mail.gmail.com>
Subject: Re: [PATCH] leds: core: Support blocking HW blink operations
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jun 1, 2019 at 10:37 PM Pavel Machek <pavel@ucw.cz> wrote:
> On Tue 2018-11-27 16:01:06, Linus Walleij wrote:

> > I ran into this when working on a keyboard driver for
> > the Razer family: the .blink_set() callback for setting
> > hardware blinking on a LED only exist in a non-blocking
> > (fastpath) variant, such as when blinking can be enabled
> > by simply writing a memory-mapped register and protected
> > by spinlocks.
> >
> > On USB keyboards with blinkable LEDs controlled with USB
> > out-of-band commands this will of course not work: these
> > calls need to come from process context.
> >
> > To support this: add a new .blink_set_blocking() callback
> > in the same vein as .brightness_set_blocking() and add
> > a flag and some code to the delayed work so that this
> > will be able to fire the .blink_set_blocking() call.
> >
> > ALl of this will be handled transparently from the
> > led_blink_set() call so all current users can keep
> > using that.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Fun. I just realized thinkpad x60 needs something similar...

Hm yeah. The discussion with Jacek came to the conclusion that he
thinks (if I understand correctly!) that the LED core is too helpful and
client drivers should create process contexts instead (like workers
I suppose) and use the opaque interfaces from there, whether they
are blocking or not, and that it was a mistake from the beginning
to create a helper thread inside the LED core.

I like APIs that are narrow and deep so I would prefer to do it my
way (i.e. this patch) but arguably it is a matter of taste.

I hope to get back to this patch set at some point.

Yours,
Linus Walleij
