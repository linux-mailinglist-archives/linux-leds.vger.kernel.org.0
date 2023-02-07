Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAFE68D591
	for <lists+linux-leds@lfdr.de>; Tue,  7 Feb 2023 12:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjBGLeN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Feb 2023 06:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbjBGLd5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Feb 2023 06:33:57 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E0118AA8
        for <linux-leds@vger.kernel.org>; Tue,  7 Feb 2023 03:33:45 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so12945941wmb.2
        for <linux-leds@vger.kernel.org>; Tue, 07 Feb 2023 03:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEXUSOabHHzeFHAw6bM5JV6f9esn+eqeiCOV8m0nhxY=;
        b=SdzMS+8477bNT9GIYybtnjksll963Igwrv22rdrBgcjxZk9buMXpHkzNWcKPOHKd9A
         h0J+fBxNmEgUm5Q0UDEuf4R1pNzI4e3z78uHUWh7XeyfG5NnIKqUyRJTBq3LoczgU2k3
         Hl5ddhdVXUe4ift+JQhL/cENZsmaMiSu6bQLQYuwQfjgbipkpnaEv2n5INy+MrfXPQmr
         1oq8Mpvxllb26T4uIH6jDzvbeuEpdTOI8e28QR4FOT3kBOmXjNhmr93gQ+w6MjCAI79E
         0O5y+Z9YdS/cUOgQvWNSpRwkhJljX0VI/JUJqfDW3axRy6+3iEJGViu+3th5A+s2nUQ6
         6ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEXUSOabHHzeFHAw6bM5JV6f9esn+eqeiCOV8m0nhxY=;
        b=Ik/bly0IaVynPv0wLSOvetDSuCT7ta81fudmrXMDl8bAMk4DuhVNXTxV4zhN1vYIRq
         S6iyiGgLzUbRdl5a521fni9gQtJXHMuISgXBGdYGJ8j2fztmrjRw/GCac/kobxsoevhF
         RcI7j2rPRUjnYQu4Tyt21vrIZQxoba48ifr0PpKwzktkwFT/VRVWg4V6bvG8IiUFYsF0
         ggYDL/z7M+HdJnixQmlztv1F0UJkyA5NvFS5Mp33s4YGfG6z8MlMgH58z/pxDKlXezJr
         vlSzcevaVfu7RCTTeWqlCqlEqPB0J8oY+mTFoB+lojESyMvHlCRirNAkS9MlQ0jwxWJK
         I9KQ==
X-Gm-Message-State: AO0yUKWHni3XTsJm7imGDIj6/tOFpVrFcGSJ+0aYq0WhaWNM/WrmSjw1
        /gOgHYmt1GpXzeJF1KwwaGS6WnbZ+cIIfYnc
X-Google-Smtp-Source: AK7set/vdpKZeHdrV33V20sqylDgt3hVpHrF5X1G+3u86B5kp0OVpXyC96eNsX5tgt4SOLjla4tfRg==
X-Received: by 2002:a05:600c:16c8:b0:3e0:185:e935 with SMTP id l8-20020a05600c16c800b003e00185e935mr2736217wmn.36.1675769623808;
        Tue, 07 Feb 2023 03:33:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p30-20020a1c545e000000b003de2fc8214esm14125186wmi.20.2023.02.07.03.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 03:33:43 -0800 (PST)
Message-ID: <41ade5cb-98c1-e859-be4d-68eb05d0ea44@linaro.org>
Date:   Tue, 7 Feb 2023 12:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] dt-bindings: leds: Document commonly used LED triggers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Lee Jones <lee@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, thunder.leizhen@huawei.com,
        festevam@gmail.com
References: <20221129174906.97749-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129174906.97749-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 29/11/2022 18:49, Manivannan Sadhasivam wrote:
> Document the commonly used LED triggers by the SoCs. Not all triggers
> are documented as some of them are very application specific. Most of the
> triggers documented here are currently used in devicetrees of many SoCs.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Changes in v4:
> 
> * Removed the sorting of triggers
> * Removed the "items" as they were not needed
> * Reworded the description
> * Dropped Zhen Lei's tested-by tag as the patch has changed
> * Added kbd-capslock trigger

Any plans for this patch?

Best regards,
Krzysztof

