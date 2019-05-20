Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B5F23CBE
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 17:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389416AbfETP6B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 11:58:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388657AbfETP6B (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 May 2019 11:58:01 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A839F2177B;
        Mon, 20 May 2019 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558367880;
        bh=nVZuwAchej3cX/jxaYPaCpxQLGe12Ikr7j7t0ajgtX4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=In/s90sCuJU2/LDfbSq/ltM7BfsjqY+JC5P2+zcho3XSeY3kl5p1Yn3dN/yqSzmu7
         tSPr8LQB+T3vkyBSwKzWnc94WQUbQgrYEEBui8kDu+PZKCnpIJz09DTB4R9zADWXvm
         q0axqoDMtcASUYKeiulDpEZMnuXbabQ/R2lAX+40=
Received: by mail-qt1-f178.google.com with SMTP id z19so16814705qtz.13;
        Mon, 20 May 2019 08:58:00 -0700 (PDT)
X-Gm-Message-State: APjAAAXlZPlk803hMmoRBMGPOYZihMLfFDN6G6E8m6fHQRWUDyc0PuCM
        vh/Wi0vTTVgNZLy+QZ27ktv+rCmTQmYPkRt1ug==
X-Google-Smtp-Source: APXvYqwjPogqJnNMzhVG/Dty4EXEP0hrNsUGqneE2/2Dsx/rQulk+faBwMb9O26bpFgnUShEIqJNS7TiLLwC6XChE1Y=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr64152978qta.136.1558367879826;
 Mon, 20 May 2019 08:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558362030.git.mchehab+samsung@kernel.org> <66231286de0f11b45075292216a939858de8c3e5.1558362030.git.mchehab+samsung@kernel.org>
In-Reply-To: <66231286de0f11b45075292216a939858de8c3e5.1558362030.git.mchehab+samsung@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 20 May 2019 10:57:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com>
Message-ID: <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com>
Subject: Re: [PATCH 08/10] dt: fix refs that were renamed to json with the
 same file name
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 20, 2019 at 9:48 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> This file was converted to json, but the references weren't

Technically, converted to json-schema (the language) or yaml (the format).

> renamed.
>
> Fixes: 66ed144f147a ("dt-bindings: interrupt-controller: Convert ARM GIC to json-schema")
> (and other similar commits)
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/omap/crossbar.txt       | 2 +-
>  .../devicetree/bindings/clock/samsung,s5pv210-clock.txt       | 2 +-
>  .../bindings/interrupt-controller/marvell,odmi-controller.txt | 2 +-
>  Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt   | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)

FYI, I'm actively looking for this in conversions now as we've had a
few of these. For cases where we have a lot of references, I'm fixing
this by keeping the .txt file with a reference to the .yaml file.

I'll pick up the DT patches in the series.

Rob
