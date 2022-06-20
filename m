Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9245E5521D0
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jun 2022 18:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244134AbiFTQFF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jun 2022 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243797AbiFTQFE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jun 2022 12:05:04 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C9F2019D
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 09:05:00 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o9so6526472edt.12
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PiyaNO6pa1UECbQmSjR1WNenD8YkEf0ERGJt4gH8P0Q=;
        b=gQcSn4MdkPpkFw9VUNku8D6x6KLxjeo/MkCT25gPhzhY2lob+o/AW/NtLLHzpiyEgl
         YaTWvpFBUVdbZq9gIr0kkt4PjUcdpsouBzZouKRxcyLG6PH+7qBRpx7iUdKljoK0CyEa
         pBEh+bzEL97/mTjwOx4lVmlJYxYIopKqa5eKahId/vYDvGr98qeMFTrTZ3Ctf6NJo/wM
         MRnXdPGYJyb3Vmxc9Kl+rrqd3mY+ch9uyApqGGLfKzojaOB8TRdcWZVexlcTKoVuYvlB
         +c2j3qsO6o5XRiOpyhKeT1hOS2xFeBSzXaexXVgZ/G2zK0CFajtUrxWc/qbpaMvO2zOB
         TSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PiyaNO6pa1UECbQmSjR1WNenD8YkEf0ERGJt4gH8P0Q=;
        b=xuSrfEn/NOzNRpJQI2Ue7V1i7e8se3OgotDLAcKQZO2sOTBX2URt+nVudylWuG9NIP
         KPUJDBZpdpqqugZ4qvnD6nOFbhuHGEOKcAAGbgxnkNKBgJMuqC8aG+YRPprtoBEkblhJ
         ewUtqremKlXqJtmYDdl7RcNu/ZO3wF77jSFdbXMORo50oknKfsUkprNYG1I3ZViKw3JI
         kc+XEiYVzqXbh5mpoj6BQyaIYmvW2Bwg3xDHN28vCYIJkQ6ldLkCXQTvssgcBWz/OIK4
         4gJjKuTpq4d58lgj+Y/LKeMOVsj3enfO7bN//JWpU/x77CLBPbEjWxuTBQT16qQtvQwM
         Y2Yg==
X-Gm-Message-State: AJIora94TIHvgSWNfLGT28vndyNmUMkp6lLxd/JPmU0+ny/4f2RvCoq5
        GWpX5lNzWivUb1MWq/P/PxK3tg==
X-Google-Smtp-Source: AGRyM1vjJkbpsGZpShi0xdylQhTb+8pCE4v7toIA2SYqutENem+JoaXD18e44Vl4hAvCa9V8XXLOeg==
X-Received: by 2002:a05:6402:5212:b0:42e:2fa:41a7 with SMTP id s18-20020a056402521200b0042e02fa41a7mr30186493edd.22.1655741098882;
        Mon, 20 Jun 2022 09:04:58 -0700 (PDT)
Received: from [192.168.0.210] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b00711d88ae162sm6216949ejg.24.2022.06.20.09.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 09:04:58 -0700 (PDT)
Message-ID: <1e71759b-32a1-3f35-6c08-b9ea4611e361@linaro.org>
Date:   Mon, 20 Jun 2022 18:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: lp50xx: correct reg/unit
 addresses in example
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Kyle Swenson <kyle.swenson@est.tech>
References: <20220607075247.58048-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607075247.58048-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 07/06/2022 09:52, Krzysztof Kozlowski wrote:
> The multi-led node defined address/size cells, so it is intended to have
> children with unit addresses.
> 
> The second multi-led's reg property defined three LED indexes within one
> reg item, which is not correct - these are three separate items.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---

Pavel, Jacek,

Any comments on these two patches?


Best regards,
Krzysztof
