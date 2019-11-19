Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2AFD102C49
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 20:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfKSTDR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 14:03:17 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35324 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKSTDR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 14:03:17 -0500
Received: by mail-oi1-f193.google.com with SMTP id n16so20021748oig.2;
        Tue, 19 Nov 2019 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wXfDYTOYMqxNSpe9ShF/iZIMn4Wb6p7KkNxA2R5RQwU=;
        b=Zvvx/rJ9MxiVOdMlUkbqBGIIhXOR1HhCmOoGKH39Dg7nS0DPzhnL0gwndhkeuYe5TH
         9z5boAkb9qe38AMjQWFsuGZsAtgtqwzElNKiHbIL2xSuDtktC9jhmymsLLPQUg04ls0H
         i4PovOsqRvq6f3M0dApqd3dfiHM/ppwcd2ioLEiWj8iWJ+n6zOx+jFDtwDMSstVVVlWI
         h3KBs/ztlRvmH07tThqDlPWcxmmZrGx5kdThrFcwqKCzu4x8An4huMSE2SWTDDRtSVm9
         BLTys7os2z4Sm1ZeMt02D2r0R1RSg9sD41zzY4HfjFMx+jxSaFf5hfBpV4SlB2cVP4hF
         zJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wXfDYTOYMqxNSpe9ShF/iZIMn4Wb6p7KkNxA2R5RQwU=;
        b=I4etHjq9QBK5zlNUpArwiq34CFb6OUZFsmPwREuqciUPBt+GDI5j/4dyh8nrITDGHz
         CB5uRfR3t/itnRlNhl83SviSuDv/Cu8rnVadrM0aYYWpyU7l/2JdFRestE9nnr9WU1Ew
         72HvbAZZlk2eO4vknT1RjtPxMbk2XqjFPdaR9fGDW0Ypk2rwFBBz5v7+v1Z3KRTO3RHh
         hL+0tRpAGocB9xFjCle0nwb3oeFnDI6Q1HOxewBiqdCugG9Knl36jcD+uEKRLl9OT1NW
         NYj0ULuCl2MRFXkhs1Kz2dAty0g1JAJ9E+xdUDfZIjpysF22yAcr+HgIcbhe5o/Dbr/C
         7hGg==
X-Gm-Message-State: APjAAAVJNcUBhbCyyc5qbLl2AwtD2+yCvC0EH5iDgBCXgAEOrVfRQOJr
        wAZhNXMKqalgQ4TQfwQKnizRHcdG06eadItrjZU=
X-Google-Smtp-Source: APXvYqxQpUyGPS20zqAN957YPcUcZIpAqBiiTguvho0DCLnTHPnY/6KGVcgACFdT7eIji8LYFYjh3r3sVU7eNJpn1FA=
X-Received: by 2002:aca:4c57:: with SMTP id z84mr5335978oia.92.1574190196370;
 Tue, 19 Nov 2019 11:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20191119154611.29625-1-TheSven73@gmail.com> <20191119154611.29625-5-TheSven73@gmail.com>
 <a37d098e-12ea-af2e-22cd-cb5ec2856b6d@ti.com>
In-Reply-To: <a37d098e-12ea-af2e-22cd-cb5ec2856b6d@ti.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 19 Nov 2019 14:03:05 -0500
Message-ID: <CAGngYiU_8Obd6jKO9-fukK4K6hYYhFYVSjzxqVxVwwKeCmUkaw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: mfd: update TI tps6105x chip bindings
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Nov 19, 2019 at 1:37 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> > +
> > +Example (GPIO + led operation):
> What part of the example is GPIO? Is that the default function?

The gpio function is always available by default.
The mfd driver always adds the gpio mfd_cell.
But no-one has ever implemented a mfd sub-driver for gpio.

> > +
> > +i2c0 {
> > +     tps61052@33 {
> > +             compatible = "ti,tps61052";
> > +             reg = <0x33>;
> > +
> > +             led {
> > +                     label = "tps-torch";
>
> function and color examples?

No function, no colour. This is a simple led control with 8 intensity
steps. We use it as a led torch on an industrial device.
