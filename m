Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C7E694365
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 11:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjBMKrN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 05:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjBMKqx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 05:46:53 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA08F193D5
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:46:24 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id o18so11692252wrj.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nohBvmIt0eGJB1fu9RPvPc9mXS9BKECYIplYz9S8CE8=;
        b=lfxLx83jvo/7V/dpwOEAtqY05CIGTbR2wKc5UWT8jdAGjCejzqdejOnMVdDB9QW4pN
         PsSFy8q2NrYtxPYJ9DY+8WEvlIyoCgTKhmBkpQ2WIE/KrWSVPkQc7er9fST7UxRDruCz
         wPJsM2JjFoNFLPA5zgG73of1DXnngv3ALp6QVOr0iAs3iLug9fp796sqvis07jFhQiHO
         Q/MpJvKbuYSyty5XpBFAXdwMR1sdSmCDkAScOLSPTjU7ECWR+HvrCI4rreaycw3uPrIi
         dEpmyS+dltG2OxzW1pvYBcKEo9YQYu2Q+50RWs9osr+r7C4AXgHpEYhlLkOxjG1baxzY
         7egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nohBvmIt0eGJB1fu9RPvPc9mXS9BKECYIplYz9S8CE8=;
        b=qhTVLh51Ef5GXQJ+ktx8jWqrbcsqhvup3wNhjG/n3u4D+KS134tNWHa9VdSSPoBFyA
         DWC0YfPyEMbfH+Jd3eeWGN0kLxKMzb0itloXe9bEIWk/M933pvJy32SlUfr1dyWwPbIU
         03+LoLI2fquOhB4aKQvuytQUHX0yLMCwsk4gOI7Rcsc9WZtxH4g12iQ5lBIYfY5Bwxyp
         zejRJkYmaNu/r+MwaKJkwdyYPpQzzRpE1pkMRondOHK3UtGEc8Ye1m88QJ5oQU/SiJwj
         tsXipMaeLwsCgu7NpG48KSX4Xls4Bo+LXhgIkXMcPHYRAi+qWpj39/G13c/aFQZZJLnl
         hCZQ==
X-Gm-Message-State: AO0yUKWPbtyHxAZFiDVSfzK6nvDHbucH5kgrEDQOXVBnS9YHSDHWBByo
        q+gnDcUVWiPHsth76QP1OS/tJw==
X-Google-Smtp-Source: AK7set/MjqaMn/vigM1AfzmzEd4USxcAMjKddUbglHG/FzriPT3YB4D2qJPSjcnV5P+PkvEuKQM6iA==
X-Received: by 2002:adf:ee4a:0:b0:2c5:557f:93bb with SMTP id w10-20020adfee4a000000b002c5557f93bbmr3353815wro.10.1676285163309;
        Mon, 13 Feb 2023 02:46:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002be505ab59asm10325333wrp.97.2023.02.13.02.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:46:02 -0800 (PST)
Message-ID: <a09437c1-4a09-67a5-b5c2-ac616b1b07b4@linaro.org>
Date:   Mon, 13 Feb 2023 11:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/2] dt-bindings: leds-lp55xx: add ti,charge-pump-mode
Content-Language: en-US
To:     Maarten Zanders <maarten.zanders@mind.be>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213102027.29961-1-maarten.zanders@mind.be>
 <20230213102027.29961-2-maarten.zanders@mind.be>
 <1a8268a1-e656-10b2-8ca5-495867e521e7@linaro.org>
 <4fc0f90a-36b1-bc48-6842-fb64c3d1b7c5@mind.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4fc0f90a-36b1-bc48-6842-fb64c3d1b7c5@mind.be>
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

On 13/02/2023 11:32, Maarten Zanders wrote:
> 
> On 2/13/23 11:22, Krzysztof Kozlowski wrote:
>>
>> While technically it is almost equal to BSD-2, any particular reason for
>> using different second license than the binding and generic
>> recommendation (checkpatch)?
>>
>>
> No, no specific reason. I'm happy to adapt.

Then please switch to recommended ones. With that:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

