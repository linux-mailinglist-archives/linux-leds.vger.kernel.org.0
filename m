Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A91146C7B
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jan 2020 16:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgAWPSh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jan 2020 10:18:37 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42757 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729043AbgAWPSg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jan 2020 10:18:36 -0500
Received: by mail-lj1-f196.google.com with SMTP id y4so3839513ljj.9
        for <linux-leds@vger.kernel.org>; Thu, 23 Jan 2020 07:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mCFNwhKyUI4S3r26cfgULDrw3EJWqsF8R9tqqcBvSXA=;
        b=jOo1+tg+YOASCAdm2mEQZmYmerWuu4htxLzxplyg2I+p/zeRB/2Cc0tch7urATps8B
         UlV+0mLYJcjxCWVIHaLOIbjgvbLZfWnALAyNX4tTygAHh2tgNdKyeiP19Udf4sVie3q+
         jMV0CqQTgWay3Y086QrGLB+ypQ0xLmFG40mxJ30Mvyrw/HZ7SgA2CCnDxa9eXTOn05xK
         KmyQ4jnJ25+hCr/RRYPOAfJl139AYJRpSPtNpyQGjL+a5HfOns62PvpEcaWrTXf8qmo1
         WUZ6mheVhmkxXXjBxVhOAEe8EeHikrWHlzmMihgy4xHHjLPShVjQzTwzHnFV7PmkUKdc
         Txew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCFNwhKyUI4S3r26cfgULDrw3EJWqsF8R9tqqcBvSXA=;
        b=hAqFnuV60C3UUcVw0v/ZqOoHvUi7eXy6338m/zLwx0jhYVGQE5J2Y/D3g0wB+COkvh
         L3PskLHcrCyu7f64an/gJqQvjxAoMyYNCi8gTAPDgG/dp8f9ihKn3qzyL+LnRXaY/Br+
         FzMKHBvksHIvxfnVQpwB62mcFNGvwjYH+tS9I5hiU7B2vx6rbZqipRGeD50KtDlw7o0n
         bmTMSqb3zj75ZZXrRASAcz0OoRaeV8Jhp9+Vfj3GpgBDnV+lNTVld1jS4vSdavg8vlel
         byIvZN2DIMfBq6UGBnDR0ONlggzM5n0d+RSckYcX3qxx1TdTjnNeTjwqTzQCXD/vVyy7
         e8kA==
X-Gm-Message-State: APjAAAU+BKUIkUd+DTQdzpEKJLxbxCyjR9+jZS3z0qYI9TWMhnvoC0hU
        8TcjT6GiSmcti9dZ8zln4cWNv8arD1KhPXH6vBK5pg==
X-Google-Smtp-Source: APXvYqwxOS3uccWns345t1Pc28bC+N8TaVTRa/IwkWxxj8DKKJcCwl+5B3q5OOArxG8Kn0UP3937k+GW4ED2Ip6Qexc=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr23227353ljg.199.1579792715062;
 Thu, 23 Jan 2020 07:18:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <c8ed62a1efa0c6fde93a8a08fe6bc74a450a34f3.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <20200117102127.GD15507@dell>
In-Reply-To: <20200117102127.GD15507@dell>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:18:23 +0100
Message-ID: <CACRpkdbj-yjuqc+=nCKRiAANjGFFHxk_ZprO8zztpRKhmXQtDw@mail.gmail.com>
Subject: Re: [PATCH v10 11/13] gpio: bd71828: Initial support for ROHM BD71828
 PMIC GPIOs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jan 17, 2020 at 11:21 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Fri, 17 Jan 2020, Matti Vaittinen wrote:
>
> > ROHM BD71828 PMIC contains 4 pins which can be configured by OTP
> > to be used for general purposes. First 3 can be used as outputs
> > and 4.th pin can be used as input. Allow them to be controlled
> > via GPIO framework.
> >
> > The driver assumes all of the pins are configured as GPIOs and
> > trusts that the reserved pins in other OTP configurations are
> > excluded from control using "gpio-reserved-ranges" device tree
> > property (or left untouched by GPIO users).
> >
> > Typical use for 4.th pin (input) is to use it as HALL sensor
> > input so that this pin state is toggled when HALL sensor detects
> > LID position change (from close to open or open to close). PMIC
> > HW implements some extra logic which allows PMIC to power-up the
> > system when this pin is toggled. Please see the data sheet for
> > details of GPIO options which can be selected by OTP settings.
> >
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Linus, Is that an Ack?

Yes! Feel free to merge this.

Yours,
Linus Walleij
