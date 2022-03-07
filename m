Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362674CF4B7
	for <lists+linux-leds@lfdr.de>; Mon,  7 Mar 2022 10:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbiCGJU7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Mar 2022 04:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbiCGJUs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2022 04:20:48 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BE151300
        for <linux-leds@vger.kernel.org>; Mon,  7 Mar 2022 01:19:36 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k24so12660148wrd.7
        for <linux-leds@vger.kernel.org>; Mon, 07 Mar 2022 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9VDgvD8hgLbmfBQ2zpnnO+0UA2G5Bd0GMuXy+xL9DLE=;
        b=kxG0AOY86sXrBpEmaWKRdNzoBJU4gaafM8rFPgSWHPyRTNLmVo+9jqlR0OBm3LSYuA
         7l/JZsRbjwASKTUnAfyQeaXOG9tzCngV3yudjo/GsrY1xkU9s/rxr2yxyZ8S+JMd/Yu1
         0YMZYkAK5T1B5MHGnm4VBYr9w1Ad1joSwJTwxwo3XUj9I9oMQm52RYEen6Bb1JF45cRb
         AOPhwCzf4n4tKvPHW3p2dv5M/iVGJkAd2tb0JKB7BbP0Dt75+i5FD4httw+5IqpVXpex
         PhlpxKkUwFFmXMRA/dyE4KSa+wLCg3Oa9igrp9+vGqummjizOvn3H7y30pcYcI53KZud
         1ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9VDgvD8hgLbmfBQ2zpnnO+0UA2G5Bd0GMuXy+xL9DLE=;
        b=PW+VwmxoKyy0hrTu8mB77cvo05i6xrn+7vRFov3Yj+MO86THBA8tJXeSzgTtULIaWC
         JSZj18gwqqiNkW421gS9J57Yws51VH9CbyDWrUlg28l49RsmJeyj0GHfhirelpcEokGz
         zEXSB6m1nyes5hZ3DihdxfNHfxZIjQUCrPzQbKb2um5GgE+aPRyvuKXbQj0VDzomYLsn
         p+oTNUQQigU/PRiE9Zx20bspeTh9N/LM7aSoN2cshauihSzzcmlzj3cmzj8uWurJO468
         jA9qDc4dTTKA2Kj1eaVZWvmeJek6KLNMmyZgBxSEUilaugdVgTUGYOCblZ3xw3SZAzmx
         2iRQ==
X-Gm-Message-State: AOAM5336b3kgCofEeW/hVeiYJUstgrHGYSra6VeVGmSgwi6xGguk4lhJ
        OCyvzQbnVtDYO+WcPX5ihX0cOA==
X-Google-Smtp-Source: ABdhPJw+ypTz3r2S5HKUX8p6+AeQ61RLKFg/YGgOcFB4jHbUfNirM8akMekPBR4Uvi6ybhQjjP+KKw==
X-Received: by 2002:a5d:6f15:0:b0:1f1:f305:df0d with SMTP id ay21-20020a5d6f15000000b001f1f305df0dmr3756472wrb.504.1646644775533;
        Mon, 07 Mar 2022 01:19:35 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d5985000000b001f0122f63e1sm5431000wri.85.2022.03.07.01.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:19:35 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:19:32 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: maxim,max77802: convert to
 dtschema
Message-ID: <YiXOJMUz9fmuK7pT@google.com>
References: <20220111175430.224421-1-krzysztof.kozlowski@canonical.com>
 <20220111175430.224421-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111175430.224421-3-krzysztof.kozlowski@canonical.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 11 Jan 2022, Krzysztof Kozlowski wrote:

> Convert the MFD part of Maxim MAX77802 PMIC to DT schema format.  The
> example DTS was copied from existing DTS (exynos5800-peach-pi.dts), so
> keep the license as GPL-2.0-only.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/max77802.txt      |  25 ---
>  .../bindings/mfd/maxim,max77802.yaml          | 194 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 195 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77802.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
