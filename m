Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AAC399CA3
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jun 2021 10:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhFCIgY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Jun 2021 04:36:24 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:42593 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhFCIgX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Jun 2021 04:36:23 -0400
Received: by mail-pg1-f176.google.com with SMTP id t8so4554487pgb.9
        for <linux-leds@vger.kernel.org>; Thu, 03 Jun 2021 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hKaeqqmeC6x4ArNtll0aowxdZXbhDlkl7A6kn7EE5rw=;
        b=uJ/CowyScjXcrx6hoXTyrA2Ii4COrGphQ2zW7sqqf5uYrA3Xux1hkYxkHe795RvOTZ
         q3U1fnTsnmpSVkR7yNcUI1Zhcfdth8uh7pvcdT8LJnGEYRrh0wJXC57HGTY4YJebxGXN
         2ZJLXEmXbtg+hWV3qmm2exS6f7baUdmpHAQUJ59w0PcBOvmOJjqTKpvBqmXiCmtqXjXp
         w2jcxivsXu3WGBiwIRpQ1tKCVHTZzhux0eFIOnk4Gz6UXbONoWZvaJfBoVlAqLZypJzO
         S4mLABiVtkewSkwsZbLvyr7m7JQa0/bRqgnHnI5vCD7EOAsn1MYU9KHpWVJJ5v8ac08B
         4RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hKaeqqmeC6x4ArNtll0aowxdZXbhDlkl7A6kn7EE5rw=;
        b=jyc+TfdEL3art4MhfV4q/rovKBhrI9bNp8ckUcjo/eXYIj8nq2TG9djerW1t5Wse9d
         sZfrjRNMS47pZlxnr9/1Rj/SfFYzOIlP5+SCZmAmf4hEyBa9sgbXIk/WZbJxboq9gMc8
         xcBBnxIKM4lnLdJ62KCEjaifDD9bhesFZsubKYxdQ7sI4kslfSULpypZC67JrHwWtIgd
         Owps837jNA3hBeFVPW911EAPihmJfHTrqtjqxXOaTD+gfW83PcarX3jS7NNDCsdOr85z
         FkUfcqaGEIwWlpbkfwu9wPiSVDxlux1OM4GHQ2n3mIfau4o5cW3fYD5KxAEGkeAQhSxe
         XUGQ==
X-Gm-Message-State: AOAM533P34vQMDSIh3KOeRZNG6dvnKJ3YFKJCMDZmVRLkDrBoNoO0jWJ
        R8/5gBJktoK4jWJnanrldqy+w/IIqJNiYpC/Y0JlkdEIo6ti3LoE
X-Google-Smtp-Source: ABdhPJxyhitnBYhhVL9DGU2ai4+oSM+jcqSPsihhPhCIJb+SjBDBipjiXktJE71Usw2ZaVVVaeJ02ApS2tA/7yWn9aQ=
X-Received: by 2002:a63:b507:: with SMTP id y7mr38461274pge.74.1622709209955;
 Thu, 03 Jun 2021 01:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210603081841.208639-1-joel@jms.id.au>
In-Reply-To: <20210603081841.208639-1-joel@jms.id.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Jun 2021 11:33:13 +0300
Message-ID: <CAHp75VdiEFYnyn4Eqnkohzw1pwphA-qfwZtakOpuy+t-Q1sHJQ@mail.gmail.com>
Subject: Re: [PATCH v2] leds: pca955x: Allow platform datato set full name
To:     Joel Stanley <joel@jms.id.au>
Cc:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 3, 2021 at 11:20 AM Joel Stanley <joel@jms.id.au> wrote:
>
> The PCA955x driver since it was merged has added a "pca955x:" prefix to
> LED names. This meanas platform data (such as the device tree) cannot

means

(Also missed space in the subject line)

> fully control the name.

So, it controls the main part of it.

> Here's what this produces using the example in
> the device tree bindings:
>
>  # ls /sys/class/leds/
>  pca955x:green:power/
>  pca955x:pca9552:white/
>  pca955x:pca9552:yellow/
>  pca955x:red:power/

So, it means that example is broken, right?

> Instead use the platform data when provided to name the LED device.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Drop kconfig option, per Pavel's review:
>
>  > No. Config option is not acceptable for this.
>  >
>  > Just delete the prefix and fix the breakage.

I do not think we have a breakage here, rather a documentation issue.

...

> -                       snprintf(pca955x_led->name,
> -                               sizeof(pca955x_led->name), "pca955x:%s",
> -                               pdata->leds[i].name);
> +                       strscpy(pca955x_led->name,
> +                               pdata->leds[i].name,
> +                               sizeof(pca955x_led->name));

Changing to strspy() will become inconsistent with what's done in
pca955x_get_pdata().

-- 
With Best Regards,
Andy Shevchenko
