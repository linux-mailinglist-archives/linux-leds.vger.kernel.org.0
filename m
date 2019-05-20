Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5BF423CF4
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 18:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389285AbfETQOD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 12:14:03 -0400
Received: from casper.infradead.org ([85.118.1.10]:58884 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387964AbfETQOC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 May 2019 12:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iKK9YhMh6ANbKPoYCjZ4LLgT9iYyIw5BQddMDFPQDH0=; b=jF+2/XoezBZrle4Eh5yah9/wnE
        C4c8y+O3Fn97DP1KUcRH5ZP+qIxqnDqRM5Br5iOnaTWbelA38NTwrbHc4cmqKaj5QvxqS7Ko2D9cY
        15Wp+kQaiyoZ7bMTEfhSPCKecDOWREcw/Js9QqsEQ3Z3IvhrABtZSYfrPk6UDcO1d05m9s6enuCcV
        GJXQ2x26lZm1PxmDaeqYYkxExfZ3zod361KDqnRf78Ao27eOThZjnopUMeQdLw+1RugcQmi0F/I3M
        yo2tZtfXOrctpaeXjO1TauKV2zkmGocTFasf2kw8fDu7rOtjn0oj3aB2z+XA7OJ5a/vrRLE1q/57m
        iFz2dMnQ==;
Received: from 179.176.119.151.dynamic.adsl.gvt.net.br ([179.176.119.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hSkvB-0000iC-61; Mon, 20 May 2019 16:13:53 +0000
Date:   Mon, 20 May 2019 13:13:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
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
Subject: Re: [PATCH 08/10] dt: fix refs that were renamed to json with the
 same file name
Message-ID: <20190520131344.39635733@coco.lan>
In-Reply-To: <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
        <66231286de0f11b45075292216a939858de8c3e5.1558362030.git.mchehab+samsung@kernel.org>
        <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Mon, 20 May 2019 10:57:47 -0500
Rob Herring <robh+dt@kernel.org> escreveu:

> On Mon, May 20, 2019 at 9:48 AM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> >
> > This file was converted to json, but the references weren't  
> 
> Technically, converted to json-schema (the language) or yaml (the format).

Ok. Do you want me to change it at the patch and resend?

> 
> > renamed.
> >
> > Fixes: 66ed144f147a ("dt-bindings: interrupt-controller: Convert ARM GIC to json-schema")
> > (and other similar commits)
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/omap/crossbar.txt       | 2 +-
> >  .../devicetree/bindings/clock/samsung,s5pv210-clock.txt       | 2 +-
> >  .../bindings/interrupt-controller/marvell,odmi-controller.txt | 2 +-
> >  Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt   | 2 +-
> >  MAINTAINERS                                                   | 4 ++--
> >  5 files changed, 6 insertions(+), 6 deletions(-)  
> 
> FYI, I'm actively looking for this in conversions now as we've had a
> few of these. For cases where we have a lot of references, I'm fixing
> this by keeping the .txt file with a reference to the .yaml file.

If the file name remains with the same name, except for the .txt -> .yaml,
you can just run the "scripts/documentation-file-ref-check --fix"
after this patch:

	Subject: [PATCH 04/10] scripts/documentation-file-ref-check: teach about .txt -> .yaml renames

and it should detect and automatically fix all the references. As any
auto-hint script, you need to double-check the results.

> I'll pick up the DT patches in the series.

OK. There are a few such fixes inside patch 10/10. Do you want me
to split it or can it go through Jonathan's doc tree?

Thanks,
Mauro
