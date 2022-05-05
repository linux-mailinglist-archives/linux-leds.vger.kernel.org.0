Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B3051BA9A
	for <lists+linux-leds@lfdr.de>; Thu,  5 May 2022 10:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349648AbiEEIjm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 May 2022 04:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349711AbiEEIjE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 May 2022 04:39:04 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B112212747
        for <linux-leds@vger.kernel.org>; Thu,  5 May 2022 01:35:23 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id k27so4362662edk.4
        for <linux-leds@vger.kernel.org>; Thu, 05 May 2022 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8kO7QCHGCne68GYXczGxAGiwBY8jMQXd1Ly9yp866KU=;
        b=Tq2Lj5sQBF9LAGbNoqQ2JGXC62P7kgvSvfVs08YDTPHhMEgdxVdBLz6X7JolcE6LtP
         ndphpXlJi0GcCk0hxQ1wjPkH347gEUYF2Rcw/3DTz25oBUdNG2pW3bVGNEweroW8yBEm
         YEwphZeqEWsXhRIEdzsBrDUhlXkqle6I8i5NTrTKeLMGJ1zNrvM1n4Lmggac0rqcOvV8
         lDnCX3V51kzrXd9dtjJMOmh90I/N0tlRBKQFlUmfL0NEbuRRlSQe/vRgCTiZq3/nIRhK
         vF5PcKa0cfY+eJn+n1TqUxKvriO1vb3v4fzFXEaR0pCfpip1LxZrkagACCPABd4iNq1o
         uZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8kO7QCHGCne68GYXczGxAGiwBY8jMQXd1Ly9yp866KU=;
        b=oxcL+kXBDXxuXYoa2sGjJr/BePezbtuv9nGHnJxYXxGwwQ5zArSW3Rz5mkxJGsc+3H
         STa2oseavAp7kCjQHSrr5Rl6npLKk3ub5oAWhZIt+R4IFEwlNNaJBgEwRchrawMSRS6R
         cOR2CzrsAbbfPplwuVga4gh1iv+m3Dgd4DmbUZrIvVMMxktkmXVVUtx0PtD0okEUJ7eY
         /BdRFps2Gowd40b1NcVf0pKYuCcBTF/2PlWzCU03wWvpb54leFv+VEVbsd0SroCu6J57
         fBLaqBlaIUd3Y6kVR9DQ0CvM+/Q6plex3UFgA3iRC0quKeI+ZkGpR3mDpfUDuWDAZ9f5
         y3sg==
X-Gm-Message-State: AOAM531LNd4f2nImcZjHHnRolxIZ6bhsL+9AGDmppabiLfwZ7FcISYYu
        4fVI0aMEM8x17ATUSB0K1qIaCw==
X-Google-Smtp-Source: ABdhPJwIqe09rAc0tNzIO2qX2RWAxzun0hwQjzf2mMISopdokDXCWkTsEVXDFrgW7UE7FTAKReYbgg==
X-Received: by 2002:a05:6402:27c9:b0:427:ba7f:6288 with SMTP id c9-20020a05640227c900b00427ba7f6288mr22398071ede.416.1651739722273;
        Thu, 05 May 2022 01:35:22 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b21-20020aa7c915000000b0042617ba6380sm510483edt.10.2022.05.05.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 01:35:21 -0700 (PDT)
Message-ID: <ec1afdc4-54be-71cd-1873-6959e132a45d@linaro.org>
Date:   Thu, 5 May 2022 10:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] dt-bindings: leds: qcom-lpg: Add compatible for
 PM660L LPG block
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504205704.699500-1-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504205704.699500-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 04/05/2022 22:57, Marijn Suijten wrote:
> Document the availability of an LPG configuration for the PM660L PMIC in
> the Qualcomm Light Pulse Generator driver.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +

Hmm, there is no such file in next-20220503...


Best regards,
Krzysztof
