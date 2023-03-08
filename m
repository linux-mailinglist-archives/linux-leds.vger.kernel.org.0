Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E69E6B117A
	for <lists+linux-leds@lfdr.de>; Wed,  8 Mar 2023 19:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjCHS4O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Mar 2023 13:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCHS4N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2023 13:56:13 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1452DB1B02
        for <linux-leds@vger.kernel.org>; Wed,  8 Mar 2023 10:56:12 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id k10so45814281edk.13
        for <linux-leds@vger.kernel.org>; Wed, 08 Mar 2023 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678301770;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/pHlMGghffPWTZZPUgza6lKCQ6cEG1zaO4dHYrIAbo=;
        b=H7TNnzTKWYf1adG3/aIcNa1VrLnzlFv2oTLg5QS0FuXNoWCB2m9ewse7lX7PcyyqCx
         a1cL5Rqs/Avn9xxw0DU9xl8vjZbt+R8EXgM+5N9ABBrK6s1OGDLl1HwzXKI8DW4AvjnP
         V0YrYW72AyMZY2Rsq8Rf5XDYw1m+EAoUaoSYh7IE5Gw/zs0fl7HOHJlM4axAxmOcb1CW
         jdeVtHSNuCr/AfA4r+ljr45mixmDDR2r5D7LnYkmva1xW07lWTawhJTr0T/QGNglPTDh
         fb1A5Wjlkdq9XIoY4ozJJzx2hwi+tg2atnVlsvQAyx+MzMkD3FyUuKAowp7zAH5oqTQ2
         9dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678301770;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/pHlMGghffPWTZZPUgza6lKCQ6cEG1zaO4dHYrIAbo=;
        b=1wjIcoZDSloVK8NaEr/mJxcC5drJEjqmz0vX+ySyAzDtatlvMJLUtjzvwlYjs+zKOB
         r3VxyhfAdJCMo2ms50L9N0bFfqRoAdR8bSb7kByxUQblZz9QPtzRgt1aV4/aC0y1F3CL
         qIHuswTe7Acvf82CMwnHUpxh6D1qq7oORjDWeYCjIm2C+lQ8cqt9ICkb2RvFsRccPeL9
         UNNmfnOQRfuvISUv4ebGn3GEEfyAsHRPHS4UuBH2OAnEWIIM9sC9tpPcf+FZDQ18tWmt
         tvHcQ3dfK3I7Y38cX8HRNAHuS961MCP8SeZvkdlm4yLHxQEEwdKLUxNTAKdaGZQpwm4E
         wD0A==
X-Gm-Message-State: AO0yUKX/x1V/cVQQq+8coeHZhnPye+fGaX3jIatCLuCWREn63IqQhcQU
        dVU1jBKuMl3mppR/nG0Z5jUQDQ==
X-Google-Smtp-Source: AK7set+m5ainCqvQfufkkpeH5ZSkqkcrqnnnSrmKdUTwbff1KsY5QqXKN6aaUnP+5lFUAeSIWUxmBg==
X-Received: by 2002:aa7:d782:0:b0:4ad:8fc5:3d2a with SMTP id s2-20020aa7d782000000b004ad8fc53d2amr16660801edq.11.1678301770571;
        Wed, 08 Mar 2023 10:56:10 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id c65-20020a509fc7000000b004bf76fdfdb3sm8544250edf.26.2023.03.08.10.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:56:10 -0800 (PST)
Message-ID: <f51dc491-d151-6e8e-1ed7-70ecf0a8b2aa@linaro.org>
Date:   Wed, 8 Mar 2023 19:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [net-next PATCH 10/11] dt-bindings: net: phy: Document support
 for LEDs node
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
References: <20230307170046.28917-1-ansuelsmth@gmail.com>
 <20230307170046.28917-11-ansuelsmth@gmail.com>
 <ffb11c8b-be03-4ae3-6970-cf4bb21587e7@linaro.org>
In-Reply-To: <ffb11c8b-be03-4ae3-6970-cf4bb21587e7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 08/03/2023 12:00, Krzysztof Kozlowski wrote:
> On 07/03/2023 18:00, Christian Marangi wrote:
>> Document support for LEDs node in phy and add an example for it.
>> PHY LED will have to match led pattern and should be treated as a
>> generic led.
>>
>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>> ---
> 
> Also missing changelog, history, tags, anything. This was already v8.
> 
> Also, I have doubts that your patchset is fully bisectable. Are you sure
> of this?

OK, so the leds in previous patch are not for phy but for port, so it is
properly bisectable.

Best regards,
Krzysztof

