Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF36A243D7
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 01:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfETXAU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 19:00:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:38740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfETXAU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 20 May 2019 19:00:20 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F67D2173C;
        Mon, 20 May 2019 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558393219;
        bh=WiH+/OCfcfe+4Xbn3UUb9ykwnCBy4RLUJO0aKNlzOhU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eNYEvQaZCFxftor73AUBaBuvs5kQxBD6kNSJX0w/p30iCErC49wIk5tve4buk62JW
         X+mRVN5Ly+zFH885gRKdBahnunIl6D9H4QxHvqw1shAB8LH5e42oiB/Gf/4NC4b8VJ
         RKYb7FakZ5o5C5tzUQmOIMU5YxkVvlDHOKTwfGhY=
Received: by mail-qk1-f175.google.com with SMTP id a64so9915823qkg.5;
        Mon, 20 May 2019 16:00:19 -0700 (PDT)
X-Gm-Message-State: APjAAAXQe9clEUbIzvQrzIhScEILDFtIRb/XyEthj0DiIVj/ZxUfIkKu
        cyEHDC+mmcc2omeKnTM+dhhHy4v09hp5KOumbA==
X-Google-Smtp-Source: APXvYqw0yA7/JAtvhaZQmdZCHhku9PQPnak0hyEwUTGW5yiBYyusX64Ru1hOe3bgicIVg6fnC6z7c+ozU5sQvG2tn7Q=
X-Received: by 2002:a37:b8c:: with SMTP id 134mr61102400qkl.121.1558393218412;
 Mon, 20 May 2019 16:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
 <66231286de0f11b45075292216a939858de8c3e5.1558362030.git.mchehab+samsung@kernel.org>
 <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com> <20190520131344.39635733@coco.lan>
In-Reply-To: <20190520131344.39635733@coco.lan>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 20 May 2019 18:00:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJj42BR42NNFj2xkY_EF_6nQnU_D-onV4GZvortv8ptvQ@mail.gmail.com>
Message-ID: <CAL_JsqJj42BR42NNFj2xkY_EF_6nQnU_D-onV4GZvortv8ptvQ@mail.gmail.com>
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

On Mon, May 20, 2019 at 11:14 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Em Mon, 20 May 2019 10:57:47 -0500
> Rob Herring <robh+dt@kernel.org> escreveu:
>
> > On Mon, May 20, 2019 at 9:48 AM Mauro Carvalho Chehab
> > <mchehab+samsung@kernel.org> wrote:
> > >
> > > This file was converted to json, but the references weren't
> >
> > Technically, converted to json-schema (the language) or yaml (the format).
>
> Ok. Do you want me to change it at the patch and resend?

No, I can fixup.

>
> >
> > > renamed.
> > >
> > > Fixes: 66ed144f147a ("dt-bindings: interrupt-controller: Convert ARM GIC to json-schema")
> > > (and other similar commits)
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/omap/crossbar.txt       | 2 +-
> > >  .../devicetree/bindings/clock/samsung,s5pv210-clock.txt       | 2 +-
> > >  .../bindings/interrupt-controller/marvell,odmi-controller.txt | 2 +-
> > >  Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt   | 2 +-
> > >  MAINTAINERS                                                   | 4 ++--
> > >  5 files changed, 6 insertions(+), 6 deletions(-)
> >
> > FYI, I'm actively looking for this in conversions now as we've had a
> > few of these. For cases where we have a lot of references, I'm fixing
> > this by keeping the .txt file with a reference to the .yaml file.
>
> If the file name remains with the same name, except for the .txt -> .yaml,
> you can just run the "scripts/documentation-file-ref-check --fix"
> after this patch:
>
>         Subject: [PATCH 04/10] scripts/documentation-file-ref-check: teach about .txt -> .yaml renames
>
> and it should detect and automatically fix all the references. As any
> auto-hint script, you need to double-check the results.

Nice!

>
> > I'll pick up the DT patches in the series.
>
> OK. There are a few such fixes inside patch 10/10. Do you want me
> to split it or can it go through Jonathan's doc tree?

Jon's tree is fine.

Rob
