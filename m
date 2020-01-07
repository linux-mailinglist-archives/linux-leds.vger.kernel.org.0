Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C46C1332B9
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2020 22:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgAGVNN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 16:13:13 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43473 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730063AbgAGVNM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 16:13:12 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so781611lfq.10
        for <linux-leds@vger.kernel.org>; Tue, 07 Jan 2020 13:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IGi8vX1/beRTA6iMMVbhICNfnE+SNCo5YclmR59f6vI=;
        b=IP+X+P1YdDKA7nugszD5dZCNPhsdJerEkMg0kBnccZWGFrN1KxrTZ4lQdW1Hbzx0R4
         OwdDogQlm8+cJmJ8elc3SToRAZClRJ1jTsa7urWbhGtQSI4dFvRzDFsk4KzLmXtTzHPo
         fIcp5OMlksbsnoNzCqUsOd5PoNscXt7pI80LYYilmUa5mI304QU05DjgsbIVuumWqlpI
         r2Y72IrIp+oskfHrmTzLGlQ8JkKxm23RW5s4JGR2dOvnrjIkymzo2dmVUsKsOE63grys
         B+B8QMfGd936QR/KHn6Jsw5h4VHkvWlgJlPEceVSapspc11G3F1nPxAekz7fnOhtrHHs
         L7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGi8vX1/beRTA6iMMVbhICNfnE+SNCo5YclmR59f6vI=;
        b=V3itLD0wp+apT5aVX9LPGiSkh5dPnXugdd5vlwcILKpx70nX1f6IQUGQdF/pRBZp6d
         +M4TVlFkhqIuZHP0+aNFusC+27/LIEaIzQf6O3bjvppLpNqR/jS+FxMBb09vn08OgV3t
         36YYtnGqFE1mNWFtskdDt/b/C7Y43A/QnBSox7LdCyXxUfVbt5ii9xQSHy22GovR4PLp
         tkEEVswr/CDAnagQeqhXr7P66sjkdK+k8HZx1RWP8XRWEpsHbgblb9+/A0FgkxG7ZGef
         33FjUrhvkh+PBsea7zeJGYqQDe3Z9YiGlcD6A3/InzfdhfXZ2qBeYs9jDCqC7P10ZJ2Z
         8kfA==
X-Gm-Message-State: APjAAAUu75XG9YwRw20yu4iU8V6o+nT3fRwe+gxR75FoXrSxXU5HMywz
        7S8z/Q66xi60JccT90Phk/Oy31jedd9/0PBoq8D2lQ==
X-Google-Smtp-Source: APXvYqxeqj1Pu+ALjaJoeeYIze/VfUL6ekcrCLu+F0Extj2a1JWki5IQH+aBkA9qETgY9mIVob9LU1GJp0C0Q/lw3UU=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr837964lfm.135.1578431590574;
 Tue, 07 Jan 2020 13:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20200107141030.74052-1-linus.walleij@linaro.org>
 <20200107141030.74052-2-linus.walleij@linaro.org> <20200107141742.GA13954@duo.ucw.cz>
In-Reply-To: <20200107141742.GA13954@duo.ucw.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 22:12:59 +0100
Message-ID: <CACRpkdYH4FgZTajhmtWvp2A7G_E8M1fZF2xZKY9TBouf9SLN1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: ns2: Convert to GPIO descriptors
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Vincent Donnefort <vdonnefort@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jan 7, 2020 at 3:17 PM Pavel Machek <pavel@ucw.cz> wrote:

> Ok. But what is motivation for doing this?

Zip from drivers/gpio/TODO:

Starting with commit 79a9becda894 the GPIO subsystem embarked on a journey
to move away from the global GPIO numberspace and toward a decriptor-based
approach. This means that GPIO consumers, drivers and machine descriptions
ideally have no use or idea of the global GPIO numberspace that has/was
used in the inception of the GPIO subsystem.

The motivation for that in turn is that the GPIO number space has become
unmanageable and is also unpredictable due to factors such as probe ordering
and the introduction of -EPROBE_DEFER. The number space issue is the
same as to why irq is moving away from irq numbers to IRQ descriptors.

> Was this tested?

No, I change a lot of code I can't test, I rely on volunteers to test
it, it seems
Simon volunteered.

Yours,
Linus Walleij
