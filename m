Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16495102C31
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 19:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfKSS7T (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 13:59:19 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37766 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbfKSS7T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 13:59:19 -0500
Received: by mail-oi1-f194.google.com with SMTP id y194so20016745oie.4;
        Tue, 19 Nov 2019 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAhDbZ6Zz0yul7MskfO2m0vwcTbPZ1IfTgcrN95xsWA=;
        b=DIoAmoO6a/8GNgtSyrGZxE4xsfk7q6jmDXBCVv9KVpOc5DOSQJuLRcd5uuhdduWjPN
         qVp8Z4ziaFwYOo/4+UMP/FgqMLstBBV+MMe734lP9C3GWC0ZTlTfkxCvt8/4QkVw/gKb
         Otq9h70uuyI8UUaZjhGKCjw2CgI4IdtQFxoBp+/SETpsURXXU0fpL43Ls3EX2ud1zgCx
         jfo3wXo1Dg7aXE8Ey1fxEKhr+DhOqw74zYKaamsvLmxjPOsljJDqkNGQD8mFLLh7b/W1
         YCgENQwq2zWaVfwFvHu3DoH+VH12epIU7eMXWi4qKg0aW15kQ6AgWdVYcEA5XaKPy9WD
         Y8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAhDbZ6Zz0yul7MskfO2m0vwcTbPZ1IfTgcrN95xsWA=;
        b=hMv7wq2EstLlczanBDBPayOqInj+CqXi2Wo518ImBI31I+Ws218HOHsehmyi3QJ7b2
         1gjcZBS2taL/mEiJzec3RnyOYM9veY+ySt9FXrHBg+BGWzI5XzKJGJuQ5qujRAr8y5ss
         0mYsY+UGQFf6gw2+n4uFzrkqM0/uvQ4fBD74eIG3jKzF/DSKASoiZ9QGKKBnsvv26Wng
         uRyRDgADRLjkqoYYJPU3mRHLKXkqWxUTKzIeTFCdU8Wge3dMGxZV6sdDwapalQkH9/FA
         g/OF95/km2ylTv4O5Yp1cZme0RDxFdZxwd4CM4O0joEziXa8qDmD0lrH6ZudsmXf6jqM
         ib3A==
X-Gm-Message-State: APjAAAVDvOcwkPk1qO4AsQdMOZ1TpPZaCFEMyaXHuBgm+N3SojQnGbZf
        5FxYVafrci1U0QEGVEqovFu4MYmkF5htb5ryeL7TKgQK
X-Google-Smtp-Source: APXvYqyQk5ZspxULq8wEjAvp5StBQQc8yqAiLsdSNBQSvUPNK0wlff+EMcmiS2CFEkD7ZUjXHDwA3PJdTUUjXkE91+U=
X-Received: by 2002:a05:6808:3a1:: with SMTP id n1mr5328316oie.86.1574189958033;
 Tue, 19 Nov 2019 10:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20191119154611.29625-1-TheSven73@gmail.com> <20191119154611.29625-4-TheSven73@gmail.com>
 <23217b5b-90f4-748a-c008-9ae7ef82c6dd@ti.com>
In-Reply-To: <23217b5b-90f4-748a-c008-9ae7ef82c6dd@ti.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 19 Nov 2019 13:59:06 -0500
Message-ID: <CAGngYiW6PMUwQnOMqFFdZ_9KZRE_K1Ue4q8LVGCLkawHUDjACg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] leds: tps6105x: add driver for mfd chip led mode
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

On Tue, Nov 19, 2019 at 1:33 PM Dan Murphy <dmurphy@ti.com> wrote:
>
> How many LEDs does this device support?

Just a single LED.

> > +     struct device_node *led =
> > +             of_get_child_by_name(dev->parent->of_node, "led");
> Prefer device_* calls as opposed to of_* calls.

So do I. But because of Mark Brown's suggestions, the mfd children
now have to grab a named sub-node from their parent.
In this case, we grab the parent subnode named 'led' and fetch
the label from it.
(https://lkml.org/lkml/2019/11/18/802)
Perhaps there is a way to accomplish this this with device_*
calls?

> > +     label = pdata->led_label ?: label_from_dt(&pdev->dev);
>
> Since this is a new driver do we really have to continue to use the
> pdata for the init
>
> data?  Can't we just get the label from the DT node now like other drivers?

Yes we can, but pdata users would not be able to specify the label name.
Until this patch set, pdata was the only way to use the driver.
Of course, no-one is requesting or requiring this. So I guess
it can be dropped.
