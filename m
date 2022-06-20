Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 779AF55231F
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jun 2022 19:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243906AbiFTRxN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jun 2022 13:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243230AbiFTRxN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jun 2022 13:53:13 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BB412AF9
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 10:53:11 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u12so22572121eja.8
        for <linux-leds@vger.kernel.org>; Mon, 20 Jun 2022 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=a+76e6v63K0OPAcsGObW6bzdBEj+xETo4L4eEJHf7WA=;
        b=WHwHclSqy0uuh2VZJ/673eFUE/ZOAZif521wla3ZHXvFHqGREgS2p8kMrB3eCB/P72
         /GuBc1RO4hCJOE/BJ7gIrOWLs2WdA9/Mg4BiMj1ZLnaVlBc2tlSEu166LPKE0u0dJIy5
         6GwwtDMl8hPUCW2j7cFc7cdJp5XD5fqcadB/uEQYjfVlH9CL/jC5m7lbEjQschFz+w2x
         9rTRrC74nAnZsRqWJLfOXBd9n+f2QlxFGqxKW92HzlYHiWjYQlOKct7+rsF1QfF6XW93
         j27GsRwSVj7pdDFnMWzwmO7YB9zA0oYjXrp6BIoagZ7GgcZuQOOP1xv8AjiSLYC6ndXf
         QCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a+76e6v63K0OPAcsGObW6bzdBEj+xETo4L4eEJHf7WA=;
        b=q873rd5WiqhiBJKRUqajRvGVkv9/2pUWQQGOlQMTRir41lkTnXNjSGHsgk6onQejxq
         hGGHqwvHJv3Xev7S+rNc+Pd9Lj5HYFkc5juATqt6tJR2Sxkt3KKN9g2s17uhgaOr2i1P
         Z0wMHIkTd0Lj8eEC4W8qtn94L2bociq4ISzUz6rgU2p2exK8UiWrf4J1UysZG79o7Vq5
         lhZxn8K+P2REIyqoRASxnJAcI7G/vfnRKbYfFfkKMpM89QliSAMnHZ77VHXjyNyBIdA1
         R+LIsaq4xOIjfDn+JwQ0+loPVHufDjkXN61y3fah6+LRtMm/7QKND96M49vzp7kkfMOv
         pTHQ==
X-Gm-Message-State: AJIora8Lo+QKwXs6XzI/zYu+saZxodibp2NB8DyX5N8o/AKeWr8qL+F5
        k7deTqbnjVx23vzhMo/76sZrIQ==
X-Google-Smtp-Source: AGRyM1tt5Cr+Aa4SsbgE909TUrgUVS9gN2xcmqBED3PKfG8/0wvJE4xQ+KJdunO77+kmDf3Xxx18sg==
X-Received: by 2002:a17:906:3c07:b0:718:e1a7:b834 with SMTP id h7-20020a1709063c0700b00718e1a7b834mr21496143ejg.635.1655747590169;
        Mon, 20 Jun 2022 10:53:10 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d24-20020a170906c21800b006fed85c1a8fsm6324045ejz.202.2022.06.20.10.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
Message-ID: <18aec03c-d59f-bcc2-6288-f9138ced7330@linaro.org>
Date:   Mon, 20 Jun 2022 19:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: convert to
 dtschema
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
 <20220620175033.130468-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620175033.130468-2-krzysztof.kozlowski@linaro.org>
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

On 20/06/2022 19:50, Krzysztof Kozlowski wrote:
> Convert the Skyworks Solutions, Inc. AAT1290 Current Regulator bindings
> to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I forgot Rob's tag:

Reviewed-by: Rob Herring <robh@kernel.org>

(except removal of label in example, there were no changes, so Rb tag
applies)

Best regards,
Krzysztof
