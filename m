Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A2A28468E
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 08:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgJFG7b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 02:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgJFG7Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 02:59:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDA6C0613DF
        for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2020 23:59:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so3432345wru.12
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2020 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CJt8sMvkLfzd8pVfQzeKwrD9wQt2ezco6HzjCXU2Seg=;
        b=JxVBGe9v20fI1rWZ+LblFSymah+5lDcEzko2dpzuxH2sV76ZNSZuJMvGzdxBOU4EEE
         016bYoBGw9BoWO2uYbYpJh2Spqfe+txcbLLwj0dDMlR/N5yVsSaJVMqeu9en2rycu/TT
         n1jnC4KuJCiEYEIdFvD/egT0iBvuzR0aC8sGAuxTCPbkVANitwk76rko2yla+Dj7q7e8
         sZCK0Cx3psrp4tVRMioIbzifJSWNfJENU2wQrZHVs830d0ZwDclsCeY3DZLdaTt0c5D8
         BR0YmsLI9C2kzSZ+GpT1D4lBMiJpvLvJ21dr2n2+YN+vRiNGtA+lOfa8qajAa2TyKNwy
         4j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CJt8sMvkLfzd8pVfQzeKwrD9wQt2ezco6HzjCXU2Seg=;
        b=cyrXBQldekNoN4kJbHfjOfC9ifs/ZGCqpWmx/ZDIsSjJBh3eKKwt0y2xMFQLLgpG4A
         kd+ejOmfrQ84kmzP1YPIldswHzsADs4J6BGSAA40abe6SaIGRYVNN7lXbNxXp2Hmrc10
         ctkxHC56bjieVINBoyCiKLFX9gRdfI9cwJh06C91IBXHn8o2FFuGobvBUt52Ad7+f9ut
         cNBwbII7aoBnKCySrkd4sYdfIAgNjii8UjOtLwq760pyoHxo4/nIk2/hNnj8BQpHsOhq
         4rbSWxNzZvokdmtf62Ble2z+TeJstzeFTanDOnEL3qr4vWl5w/AH00exUmNKxf+Pjpgl
         IGYQ==
X-Gm-Message-State: AOAM531qCpmQS2Ku4dppvrPJ49CO+YvkyQyV/0f/h5lNxYtYPRc3Ogn7
        RJvb/hrOtfxysmmmudW+1iynsA==
X-Google-Smtp-Source: ABdhPJw9aVlQCFJI6s9KKSTQz6LD1w2/gTI0uxeBSfs6H68t2v5l2G/j/zLB0TtAX8AL+VsxEknjwQ==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr3347103wrn.117.1601967562086;
        Mon, 05 Oct 2020 23:59:22 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id m3sm2805162wrs.83.2020.10.05.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 23:59:21 -0700 (PDT)
Date:   Tue, 6 Oct 2020 07:59:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
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
Subject: Re: [PATCH 2/4] dt-bindings: Use 'additionalProperties' instead of
 'unevaluatedProperties'
Message-ID: <20201006065918.GZ6148@dell>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-3-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005183830.486085-3-robh@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 05 Oct 2020, Rob Herring wrote:

> In cases where we don't reference another schema, 'additionalProperties'
> can be used instead. This is preferred for now as 'unevaluatedProperties'
> support isn't implemented yet.
> 
> In a few cases, this means adding some missing property definitions of
> which most are for SPI bus properties. 'unevaluatedProperties' is not going
> to work for the SPI bus properties anyways as they are evaluated from the
> parent node, not the SPI child node.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
