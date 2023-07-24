Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E11FE75F892
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jul 2023 15:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbjGXNiq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Jul 2023 09:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjGXNiQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Jul 2023 09:38:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9067910D8
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 06:36:40 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so11309839a12.0
        for <linux-leds@vger.kernel.org>; Mon, 24 Jul 2023 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690205763; x=1690810563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mpGN1sK2QXh4+Jmk/N0VrGqJC404Ue1gP6VHyXAM7A=;
        b=DVhka/Gg1EmteFojO2ma3hxVj1EKeRHyp9OBxNLwzuwV15YgFDr0n24IbZks9+ZH8u
         VyKFSc3zi4L5fXwmsZBdGUJQVEmog6uTeyaCrBRscZ0hQaYy+yYKgRS5+xgbJadgf6IX
         otp68DRMZVSkacT0iL4TGUuQerw7DymYXtK9Sqc2+gt167TsaLMaTvabOh5q+D0U2YmY
         OpH/2dAiMVFQFRItIf87kTlEj3XCdizHHj0D6qQ+AL2nQ6v8zkTwZZdCtVaPyf/q3oSS
         QDKwGPreKGV9RHV1ZMYmRxi16BJERztLKZE/pglD2xIQAIYBsVug2unUNFkDeNVmsrf4
         VPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690205763; x=1690810563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mpGN1sK2QXh4+Jmk/N0VrGqJC404Ue1gP6VHyXAM7A=;
        b=JpsxgLTrwgj3t5xUH/Fl2Gp9gV4piHEbt+MSS+YG+5OBDARLQPxSezL1TZzhia90Bb
         P7gDeq7XdJpfghorfZqXmOle2kxvh8v2F6vO0Bd+09ZzizB/wdEUFZ76nT2Hqlo536zx
         Zb7C+JmWoiUhll+eHAWX9RUcH8wVbrGyERO8NrAl0KwiEBe9olPlqtCaElTBhyFq/rTQ
         b9TygXAGz2VAyBQABMt9YCw2H2EZbIMKcLyZMj0d/aQUEEE9uH6N/p6h9ZTgSykKQZIY
         LW5DBW8wmHaDK5MUe1iAbp7DrIZv/+L/HIkav5cwOxu7aXk5N0aA4Mx/oI7M1NPkYLdc
         iTog==
X-Gm-Message-State: ABy/qLbXh6UPcGdTn6OtyG8/U8NtxypyGM5NgIEohnPKYsupczDGGJgY
        wi7lxXmmnf4fRqbGFbEJfW+55A==
X-Google-Smtp-Source: APBJJlHVB9K6K5BSR/6zupLkVOZYeSc3WOUwXfUTugUj5DabDaCWuWD4Of1GvZR38Zwo3cUrNvJjpg==
X-Received: by 2002:a17:907:7ba6:b0:99b:4867:5e1c with SMTP id ne38-20020a1709077ba600b0099b48675e1cmr14638324ejc.28.1690205763548;
        Mon, 24 Jul 2023 06:36:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id d19-20020a170906041300b009883a3edcfcsm6861549eja.171.2023.07.24.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:36:01 -0700 (PDT)
Message-ID: <7a5b978b-1846-874b-042b-cc5704963366@linaro.org>
Date:   Mon, 24 Jul 2023 15:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add gpio-line-names to STMPE
 GPIO
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 24/07/2023 08:35, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> stmpe2403 supports up to 24 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

