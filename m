Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 781B86BC6A4
	for <lists+linux-leds@lfdr.de>; Thu, 16 Mar 2023 08:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjCPHMk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Mar 2023 03:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCPHMj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Mar 2023 03:12:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476ED1F5FE
        for <linux-leds@vger.kernel.org>; Thu, 16 Mar 2023 00:12:06 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eh3so3633581edb.11
        for <linux-leds@vger.kernel.org>; Thu, 16 Mar 2023 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678950714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtxU95nYVEk8sStgeSy9yEeBrcfk6N255DU39MC/aKk=;
        b=CpJmtjGd2kG3fVOdpLjW7fo/V2ebgT1rdVO3EDUqUmW3Ca2/6E2++mJseCWq1oEVV5
         6gnIFvsXA0t8j2Bsij1L1SDoTavZAHOpQgoLt6Zd7HcAAveswsy8vNn2NKAcNv4NM/Yn
         2J3eFaMiMWdD1XgBQBZK1J+L50F16JE8STG76lEx3in4zStZBkKH+38FzCIZt1fjZHlI
         5c1AfO/HMAVKqLKDxW+iZnwjgE4CYAg6wftaP22WIvSWcPovgpFh0RALnsZz0m6fj5gj
         DhQJh6QpFXUP2yBp8iZB2gKevZgvvfGX7DME/01FR0X7X8CaMBW1l7Yf3FkuVau/zqNa
         kwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678950714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtxU95nYVEk8sStgeSy9yEeBrcfk6N255DU39MC/aKk=;
        b=YTY6Wb6cwDks4WtmylUUeU33rcLXW5rYxwVuBBrSP5siDVlunM2q+5k6ZjAIZ9GVV5
         viYqFkD13jZk2nQs/ulpf+aHIS7bzLKuR3GGjtDk8EsKKIS+wXTV3g+Oe4X2hAA2Ufon
         yck7OOk9UaDjz0qFMPrwAOCQnltRBEpEAB6KirliCFGK7Q0qpZVXt8+n878W98ohePqW
         pnAyRjcO7UXX+WKiHVpqte2pXoA5ZENUcLzmU2TVatJBP9HaFcrzWrkfx+CiyFV3MhGw
         Jbvm5IA/wJlD57OPDigQdhdBby115XXUU80YcDlvzZG5MBzw2IadGZQaQkBlJUmplDG+
         5usA==
X-Gm-Message-State: AO0yUKW9WF6/lwwnXW6H+ojMP2qR0irSU9GX+tbNVGsjLMEiAmZkAS3t
        Btg3YGjMdC3xj834c7tDMPkA8Q==
X-Google-Smtp-Source: AK7set+WHCuFDbBDlUR6eewnX+XJFX1b8nXPTgB6+ePDTKeO9clFt4yxKIHQOtegAeIaNmdCS1H9pQ==
X-Received: by 2002:a17:906:131a:b0:8b1:7eb7:d53d with SMTP id w26-20020a170906131a00b008b17eb7d53dmr8847022ejb.49.1678950714554;
        Thu, 16 Mar 2023 00:11:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b008b1b86bf668sm3432450ejo.4.2023.03.16.00.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:11:54 -0700 (PDT)
Message-ID: <12eed431-a907-0432-90a7-e5d289496218@linaro.org>
Date:   Thu, 16 Mar 2023 08:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: add binding for aw200xx
Content-Language: en-US
To:     Martin Kurbanov <mmkurbanov@sberdevices.ru>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@sberdevices.ru, devicetree@vger.kernel.org
References: <20230314120252.48263-1-mmkurbanov@sberdevices.ru>
 <20230314120252.48263-2-mmkurbanov@sberdevices.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314120252.48263-2-mmkurbanov@sberdevices.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14/03/2023 13:02, Martin Kurbanov wrote:
> Add YAML devicetree binding for AWINIC AW20036/AW20052/AW20074
> led driver.
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

