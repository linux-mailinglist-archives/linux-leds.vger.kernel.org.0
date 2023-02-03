Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C10689E6E
	for <lists+linux-leds@lfdr.de>; Fri,  3 Feb 2023 16:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbjBCPiz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Feb 2023 10:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjBCPiy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Feb 2023 10:38:54 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7260F8B317
        for <linux-leds@vger.kernel.org>; Fri,  3 Feb 2023 07:38:33 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id lu11so16441583ejb.3
        for <linux-leds@vger.kernel.org>; Fri, 03 Feb 2023 07:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9D1MtwohWAcSI+dqXIF3V/F6XwBaTkRzipfSL8tRIU=;
        b=PbovNEv5EDv8GaV3xzbWFWOX+wZxwnJ9wtulJadvd2aJPRPjEEu1TZCv3EjkV71nPi
         fvBH87FI1O+w1rsup6XgFuEwdu/zVnDm2ji/Gyc1twP0A+r9is+43dGJR06R0cLaoi8v
         nBURDhCsdtg8SrH918xCJT8f15aB1wcFe1or/rF3/Kgd/YJj7VJtIeUsUaMIK20FewWY
         qJdMRXWabVH6X6Wu0SpAJvgiKpRXDWfrngTjMIpyi8++gJtWTjXohFjSd9CONnXWov0Z
         oRM7NEd+BPQcEqzSocE1jvlB3TKB4Guf+tIDTY5XYNYhHRD65l99H0i/o1sW7galLsBf
         oCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9D1MtwohWAcSI+dqXIF3V/F6XwBaTkRzipfSL8tRIU=;
        b=LLRx1w9gPV/n2ymOvCUGrXU/l7MLGrBLXBiggHZZMpv5QsuxBJwAoANon60+WcPn06
         oq4n3hvMosmdWzS1XxcDW0UEQNXseYw0GYEPu0s5gFwcNTYidBEBTr9sQOZPvRj4TJUD
         ZQoKoWqf8HGZSX2181h4UVC2ggNbQTznjDZp35er6zYTjVNFPRN7pcLlO8zAQYXTWtyt
         kP42BwNNIvYAERztj/siqPED4JyeCw6hquLg7cR1w8rAIRpqsOe7gmYT2gkR2X2WbUdR
         1rT2pRw55HIl/HJhtCb/yHBotojR3pn4zjqi35DR6xcMkeycd9eOkzNJrsVYfBQz9ij0
         x49Q==
X-Gm-Message-State: AO0yUKWx650bVIne5TVpd7y+Wn5xeGW2XPhXHxj25TJC9+uxxLBhpBBN
        JEKo8Aa/EqEQuWX+RpVpZXGZ7Q==
X-Google-Smtp-Source: AK7set/n1bZMm/DBcUP7HFdnSACAio4aFr1UdewcRdhd8EFQdo2q7K4Jfxhz/uNDcak+BP0sUq+x0w==
X-Received: by 2002:a17:906:2d4a:b0:883:5b33:e019 with SMTP id e10-20020a1709062d4a00b008835b33e019mr10385242eji.61.1675438712037;
        Fri, 03 Feb 2023 07:38:32 -0800 (PST)
Received: from [192.168.2.9] (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id p2-20020a170906498200b00878803d4049sm1541899eju.93.2023.02.03.07.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 07:38:30 -0800 (PST)
Message-ID: <1452beba-19b0-7417-716e-a255c6aaa739@mind.be>
Date:   Fri, 3 Feb 2023 16:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/2] dt-bindings: leds-lp55xx: add ti,charge-pump-mode
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202101032.26737-1-maarten.zanders@mind.be>
 <20230202101032.26737-2-maarten.zanders@mind.be>
 <28cf0c1f-ee5f-79e4-609a-2cdd24db9f1c@linaro.org>
Content-Language: en-US
From:   Maarten Zanders <maarten.zanders@mind.be>
In-Reply-To: <28cf0c1f-ee5f-79e4-609a-2cdd24db9f1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 2/2/23 21:13, Krzysztof Kozlowski wrote:
> + ti,charge-pump-mode:
>> +    description:
>> +      Set the operating mode of the internal charge pump as defined in
>> +      <dt-bindings/leds/leds-lp55xx.h>. Defaults to auto.
>> +    $ref: /schemas/types.yaml#/definitions/uint8
> This should be then uint32

Why is that? I specifically chose uint8 because other settings for LED 
are also uint8. The implementation is also uint8. I surely hope we'll 
never get to >256 modes for a charge pump.


> default: 3
> (and drop last sentence about default)
OK
> +/* SPDX-License-Identifier: GPL-2.0 */
> Dual license.

OK

Best regards,
Maarten

