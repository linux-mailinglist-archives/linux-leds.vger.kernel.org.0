Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5144CF48D
	for <lists+linux-leds@lfdr.de>; Mon,  7 Mar 2022 10:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiCGJTu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Mar 2022 04:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiCGJTt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2022 04:19:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0FADF97
        for <linux-leds@vger.kernel.org>; Mon,  7 Mar 2022 01:18:55 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u1so22094274wrg.11
        for <linux-leds@vger.kernel.org>; Mon, 07 Mar 2022 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aW0p0zs1Z1ISg8Q6VMocuL2pI3OI7Xnu+rh+9BkWcvU=;
        b=XkMi54+kZh8TYyNDE7ePB8GHqReiPX6zSWu2PEnHtpSC2tbZhe/ImHgzssdsFTbkPd
         1u97FZFXAnhdHxkugaXfxvjQPsBxafOIMWttkTKKeE08o+DFoCXFYCipXD9TQAAwqD5W
         wppO5lKrLRFDsox8hpjI+VE1BptkEigRWeWME0pWjpcPI6NkHW5sYuG3Iu1dnq7ZS7vZ
         GBaATIzzLg4z5DYOszgR47ydBkEta5JT0H6AD2+e/NgvbqHQePT5qg/s7SHGoidEc7Og
         VUZEggaRyzLcVki0dSRSn5Kky7Z9YxcJOayGn5AFC08sFlwG/CG3YogPsKtfRtL6xgp0
         vjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aW0p0zs1Z1ISg8Q6VMocuL2pI3OI7Xnu+rh+9BkWcvU=;
        b=rM38s07sNGsVocb4FOgG9vqRxPmIFHPLd3sLR4Dr75KyGvogvh0OiBEyI/nK3MszJh
         X797smBRSTq7c43NbNT3eFtH3Cjuq2V2zCEUON8cdWot9gvhYAQ/NuXQEthEyhClhvEw
         wBntmUHF8tFSpKPjHzsaBWy7yIlaE9JBQvP2IbvC26h9qKO8r3kc3pQO5uX3CwOyqrQf
         akQXzsdkGtJtiDIR70+/X+eX0Ws4w4Ce2YZEl415PCOWZ1inLSCNbY8cXT/KigDpPeBm
         dTW4+JGIA3fYqRAOigjXeBbWn3Zru2Q6aLKgf/j5U3bccVABjoklt0sNzSqYOPMCkSiu
         UE2g==
X-Gm-Message-State: AOAM532m/djzB9f/lPlPjf2nLQRq1Q+TJLshO7bpYG494gtnDVruMOcc
        hGFaNdPVBQnsRagL8bHBnH5uJA==
X-Google-Smtp-Source: ABdhPJwjJh3IaiveZrTEJzRL0aeIiET1nrgVql7GDTOmHCb/GyNxfJk1gfLXh3fy7IZBkd14WBbj0g==
X-Received: by 2002:a05:6000:2a5:b0:1f6:7c28:6b83 with SMTP id l5-20020a05600002a500b001f67c286b83mr892650wry.324.1646644734147;
        Mon, 07 Mar 2022 01:18:54 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id g17-20020adff411000000b001f03426827csm10774220wro.71.2022.03.07.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:18:53 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:18:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regulator: dt-bindings: maxim,max77802: convert
 to dtschema
Message-ID: <YiXN+kYsvUDbz3wX@google.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
 <20220111175430.224421-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111175430.224421-2-krzysztof.kozlowski@canonical.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 11 Jan 2022, Krzysztof Kozlowski wrote:

> Convert the regulators of Maxim MAX77802 PMIC to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/max77802.txt           | 111 ------------------
>  .../bindings/regulator/maxim,max77802.yaml    |  97 +++++++++++++++
>  2 files changed, 97 insertions(+), 111 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max77802.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77802.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
