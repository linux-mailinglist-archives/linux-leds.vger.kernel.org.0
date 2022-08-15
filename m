Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1159C592D13
	for <lists+linux-leds@lfdr.de>; Mon, 15 Aug 2022 12:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241880AbiHOKKL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Aug 2022 06:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbiHOKKJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Aug 2022 06:10:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151A31838F
        for <linux-leds@vger.kernel.org>; Mon, 15 Aug 2022 03:10:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id p10so8521427wru.8
        for <linux-leds@vger.kernel.org>; Mon, 15 Aug 2022 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=b0BG6zqNuGD+/4ZeY3ZglvZEqAlCRmK7KBUEnJVhtZY=;
        b=x0cUGTaM7DOQAD+YM58GNbMGMtq1gCmQlmnmftzyBI29oKOvOdUlbgecFPFJ1BgZ2U
         tbjw+j+BNQVl5617D4uN38Xk/t/ozPQhcj0zP9x5zHbOMYz42hh6Y3uIIKlA1DIGv29l
         Zz9pRvJgziux1lNhfbSJCWACFx+5s1VuYbQpW2rlkcGeNAgJjmxfj6HcX6PPlGPCR3i+
         A54aV6J+phJTrjfuRVi5lDVuAFoJ0fxT74VtsF2UkDfld1p1oeL12QlyZUNVeQsme2Wq
         4mxzFzFw5aifvA0PRsOep8QRrYACpu7wzjecti+yimKmReAvpqzMnBQmO6/2lCno20F1
         ev2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=b0BG6zqNuGD+/4ZeY3ZglvZEqAlCRmK7KBUEnJVhtZY=;
        b=Ac6Z0yvH1+fEtto6IcdW0Ayu2d3aRpmTTx2gCgvROAVjaDADCTPoVWK7UGYgGp4FOD
         FwwVJqAZxY2K1LjDfMLZZ2nwgkr35cyqryoFRacr4Lj5BooRn4AujLvJQyuMKfikLN36
         +JLZUkd9G5o9LlM+RcqsmJ3w1VZlNsUBFErjE/RukFDyYPJl0zoZCwp52P5q0hHMcgRK
         kJmAIAo8/wqGX2TCsAE9n93uEwXxfseZrp2ch/Tpzto9GXHuoPsT9DtGnuEJsmR1x6ms
         NwX4/ggPsvyGvfwF5L9SD1d+J/3rzxzRIGaapBanbNKGeTb8mNbbZ/Tb3G+5P6SE8r8F
         ZPuQ==
X-Gm-Message-State: ACgBeo3qOFJAekYgB5KS+g92BMWLPn7QngMoxFnyzCBaUyXdIbvXH0Uj
        7stUaOxWi10qZFhbS7FUUgvYug==
X-Google-Smtp-Source: AA6agR5hAfQyfMOqfODbwifOJptkZd3sU12ygFhz9rZ+qe8JD6bOzrF7GiV/dIjhd/OOaU2EJnS8Bw==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id h1-20020adffa81000000b00224f2602523mr5305703wrr.26.1660558206570;
        Mon, 15 Aug 2022 03:10:06 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id w5-20020adfee45000000b0020e6ce4dabdsm6693090wro.103.2022.08.15.03.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 03:10:06 -0700 (PDT)
Date:   Mon, 15 Aug 2022 11:10:03 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     ChiaEn Wu <peterwu.pub@gmail.com>
Cc:     lee@kernel.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
        broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
        andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com,
        alice_chen@richtek.com, cy_huang@richtek.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v8 05/12] dt-bindings: backlight: Add MediaTek
 MT6370 backlight
Message-ID: <20220815101003.ilgbrxhsqk53i7u3@maple.lan>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
 <20220815090125.27705-6-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815090125.27705-6-peterwu.pub@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 15, 2022 at 05:01:18PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add MT6370 backlight binding documentation.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
