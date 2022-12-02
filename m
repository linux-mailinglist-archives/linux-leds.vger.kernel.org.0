Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3968C64054D
	for <lists+linux-leds@lfdr.de>; Fri,  2 Dec 2022 11:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbiLBKyS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Dec 2022 05:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233231AbiLBKxq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Dec 2022 05:53:46 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2E51027
        for <linux-leds@vger.kernel.org>; Fri,  2 Dec 2022 02:53:25 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x11so4989819ljh.7
        for <linux-leds@vger.kernel.org>; Fri, 02 Dec 2022 02:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSjLefHNHZegI4ZB3gSSmSL4psXmiBZX3/AQmAdB8Ek=;
        b=ch4jUTh+E3zvsapTjxKlw6JsDVlBzQYaZ5O8kVerM7kpCX2FBvPZYn3qeUr1QQZU3O
         BjIFqyOVP0VzlZdrYwOBjJWUy9BwBLm4q0E4EMfCHeMcjlKO8Eikcf4ClB+bDLz8iO6/
         dLAGlkXSDi1FKKzjOcKkuj/04GRP9Hb9gNOq4rFp7hokzk8sVFSx81Xla51/6dDBFqKt
         V5F8GJph0J2RgpMW3KufXy2TyGgauHvKChv5gYffMgLKMMY1ynixHJ5Qdgya29NyvEfm
         9prQo3uOdKoPFcIRRxSQ++/CQLwEvWLVmJs2tK62CSHSk515Is2F6Ir/CALtnbdP2L5D
         0+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSjLefHNHZegI4ZB3gSSmSL4psXmiBZX3/AQmAdB8Ek=;
        b=ZeXkvphtrO2jNM/wnPWS8KoZohB0tw7Lc/mmvd2Z7b/K+igKqIH5v3OjY2Q/EVIGMG
         wW00NFbJ6i0ZdMMbJSwKSTdiQFwhG4+/1RzeYek1PvnOgMIUiXoZv05oP30xO+8KasV5
         nFG7IVLylKCRelzwfTJibxwJKD6PhVsn+B+gdmf6DqvbPIiEdRrEkqW+kDvyNq3JepyQ
         WHzen9zuCL57qA4C2y41GKa1586z6LijzZZkUfTfXI5ygx2Lt9keG70ucWJHoS/cJ1nO
         60dv5cKNZh05i4pq79Wk3loLQqIR2MvtHhFzVNzAD6SvoUBhLX5n40EVyoiIE8hQaZgt
         CkDQ==
X-Gm-Message-State: ANoB5pmHjc4xEz4u0QfqIkiFPwXpaYvAjKPMIjM7i93f0fm55llUxOYt
        mKrpZUFZAqbZS4/foHRSLAubfA==
X-Google-Smtp-Source: AA0mqf4kz7feCFmRNFDMS6l36HrfZmoNajxlZNp7L0xiUTayIiHEtz0mWo6MExr869Z4OeFjYceg+Q==
X-Received: by 2002:a2e:b90a:0:b0:278:ec8b:4783 with SMTP id b10-20020a2eb90a000000b00278ec8b4783mr17773054ljb.91.1669978403987;
        Fri, 02 Dec 2022 02:53:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b004a0589786ddsm981504lfa.69.2022.12.02.02.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:53:23 -0800 (PST)
Message-ID: <67a3fb3e-7d27-f0b0-4858-fd66fd3424e0@linaro.org>
Date:   Fri, 2 Dec 2022 11:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add an entry for
 WorldSemi
Content-Language: en-US
To:     Chuanhong Guo <gch981213@gmail.com>, linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20221202034240.455831-1-gch981213@gmail.com>
 <20221202034240.455831-2-gch981213@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202034240.455831-2-gch981213@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 02/12/2022 04:42, Chuanhong Guo wrote:
> Add vendor prefix for WorldSemi that makes WS2812B
> individually-addressable RGB LEDs.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> --
> Change since v1:
> reword commit message


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

