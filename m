Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061D56942BD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Feb 2023 11:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbjBMKWa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Feb 2023 05:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjBMKW2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Feb 2023 05:22:28 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9A2113E2
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:22:09 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so8077780wmp.1
        for <linux-leds@vger.kernel.org>; Mon, 13 Feb 2023 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEaVaR3pJQlndiKqh5ZokTFdMHbHbPbZkEmGATqRZYY=;
        b=jQO1yGiaeuQ4C3W8uQybW+b/n2PTgQSFhz5hDEOnh6QGJEwij3zLRQZIq92XaTZ4lR
         ZtusVEY3m0Yu+rLjOyj7Hyok6b5fShTToWgd7VBCkqtvlP7xrtAhx1fiSSt81/MGEFL4
         YVW68r+lZRjHJbTu/4A9orIqCaUb1+xmNwUp2JdhWSH1sL9BbpvtyXz+wG3PTqNrVdtF
         j+vPYrf5shPohAqRUQlnxGEotzOLcSEp8LnTUufVDD3QummwVZkC4gK9d/Iw9MMModsC
         G/tGx+u//h0OvQSJB0O3VIrgwIXoTbe/ruD8gyOslaE87W+CfpZVQG4xJlKQZXqlMC7f
         sCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEaVaR3pJQlndiKqh5ZokTFdMHbHbPbZkEmGATqRZYY=;
        b=uTlsZ+iWVLr2hsHFQyIK0V62tFwm1rI9OjtMnPGCt5uhu+8lk23PVwql9xq/Mp6ms/
         E9KxAuJaENKtfY3kITkohc6dzETQ9JVQGFo769l6LiVCwQVX+6XCu0w9fwu/lrrHlbt4
         rjMZO5qcBgwpFxy1YB3gr/ZpBrM4lQ8lf3EGI0yYED0nfvxe2F2eTLokZakUwF8ZTlri
         0q1P0sW9znI1SyG+mJ2WBIUkMSR+qBa1ndCYwJogwxYuCHCv7krN711i/5y/OKxG3glp
         e4PZuNHSydCOQff1fcYCUdt/SrQkCGU2jhKQDtLIYxN0kp4lirGVnB+AQHS0Orww/834
         xlaQ==
X-Gm-Message-State: AO0yUKUGWClSYxsSpmV0T3Q4xGkPOJC81JRvEb4gTcc20ZtuDDgIgOw5
        Zw6aR2alWR2k8BM+lg+UDCoDES3R+09xoUHB
X-Google-Smtp-Source: AK7set/YSkJ3lo4sL7+jsNhbWDUo6sMqoN013q7KyFE3YepQ1+9B5t71dyticVVQrB6VvW0cNKPI7w==
X-Received: by 2002:a05:600c:43c7:b0:3dc:5d34:dbe5 with SMTP id f7-20020a05600c43c700b003dc5d34dbe5mr18684412wmn.28.1676283728277;
        Mon, 13 Feb 2023 02:22:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b003dff2b493c8sm17983147wmb.36.2023.02.13.02.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:22:07 -0800 (PST)
Message-ID: <1a8268a1-e656-10b2-8ca5-495867e521e7@linaro.org>
Date:   Mon, 13 Feb 2023 11:22:06 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213102027.29961-2-maarten.zanders@mind.be>
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

On 13/02/2023 11:20, Maarten Zanders wrote:
> Add a binding to configure the internal charge pump for lp55xx.
> 
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
> ---
> 
> Notes:
>     v1: implement as bool to disable charge pump
>     v2: rewrite to use string configuration, supporting all modes
>     v3: simplification by replacing string option by u8 constant,
>         removing previous Reviewed-by tags as it's a complete
>         rewrite of the patch.
>     v4: added notes
>     v5: dual license, change property type to u32

Thank you for your patch. There is something to discuss/improve.


> diff --git a/include/dt-bindings/leds/leds-lp55xx.h b/include/dt-bindings/leds/leds-lp55xx.h
> new file mode 100644
> index 000000000000..e2256312714b
> --- /dev/null
> +++ b/include/dt-bindings/leds/leds-lp55xx.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */

While technically it is almost equal to BSD-2, any particular reason for
using different second license than the binding and generic
recommendation (checkpatch)?

Best regards,
Krzysztof

