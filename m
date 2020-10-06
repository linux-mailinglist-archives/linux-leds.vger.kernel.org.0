Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A350A28459D
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 07:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgJFFmk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 01:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgJFFmb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 01:42:31 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D675C0613AB
        for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2020 22:42:31 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i3so1068577pjz.4
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2020 22:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FYOEybxQ9Y8nUxVZmzLLg+Qyso2tjlpbGNthFRqblLc=;
        b=scAXD8YuBk8j/NF0iYDdCeaAVj2lJqU4ekQ7XmxKGRZD9n7rlAL/7uG23DDE1fcZ56
         zF72mU8P6EdMfXizzEbowAVRT7aqB90B0ZPahldWPyAERYWd6msUiWvIw5u5I68GC10s
         2mfO8dqRM6oWZLB0Q6RNjtouVvMzAMtCqHytHKbKwrjH25Far6tK8oMk2FL/+Ytm6yFo
         ix24Oh/3R7FZgjcOmnnbZhO2Rnj4pwkEjTGIWiz4UAhFCmHcKJq5fJPHDGVhMb52+bja
         GRW+sJiWWq/RfS6N9j6fS0MlegpQS8J4O6R0p/6fHQbNSKo6Dg2SOD+ESIa+qx/GxTp7
         QQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FYOEybxQ9Y8nUxVZmzLLg+Qyso2tjlpbGNthFRqblLc=;
        b=lfoDGc07iG6o0l/zQi+wdDWuFq4OEpden0On75NAV8GRjjP895fsr3c28FHg3PHMLP
         3nRVSxfLIHG80lRtPnntHzotOPDwD93vwo8JVE87+JQlZ8nqVwbRzRID8WI21S5Irzm4
         mXtZX6VXtSfbfrizBsr3ZpXGJ/VuOdWDUtlexn4vvCzyKPPSB+Tj3Ur9Vq2zc/4Adz6u
         zY6NijpsE+wO2LCgNX1YrpL/J1pPVaxP5Q5CYxo0ZP+wmoC5ap0qRpI/uBiN2WDwT39s
         ah2AeYN0DEVp2ruc+K3r3AOf2/TN7uOBRTuOeY6FIXlPWU7tv4LF7r8KLB6XeJ9cG/Ya
         cXpQ==
X-Gm-Message-State: AOAM531UnoARgD8vc+EDodEaRI25ht5lGUgyeb3M+xYLEodhf/KwNdil
        lzN3C5FX8g4sW2419CVll9DrUg==
X-Google-Smtp-Source: ABdhPJzo+T1F54fl8q16F3SuWBffglk48PEytQu7/wpxM8oR5iYvbOQGglf6EbVoa0EICQ893qG+lw==
X-Received: by 2002:a17:90b:950:: with SMTP id dw16mr2661711pjb.200.1601962950652;
        Mon, 05 Oct 2020 22:42:30 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id d145sm2005503pfd.136.2020.10.05.22.42.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 22:42:29 -0700 (PDT)
Date:   Tue, 6 Oct 2020 11:12:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: Explicitly allow additional properties
 in board/SoC schemas
Message-ID: <20201006054228.ho3ajzfgpiew32ft@vireshk-i7>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-4-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-4-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05-10-20, 13:38, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As the top-level
> board/SoC schemas always have additional properties, add
> 'additionalProperties: true'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/spear.yaml               | 3 +++

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
