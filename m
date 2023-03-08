Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0137E6B1181
	for <lists+linux-leds@lfdr.de>; Wed,  8 Mar 2023 19:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjCHS5E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Mar 2023 13:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjCHS5D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2023 13:57:03 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516FDB718B
        for <linux-leds@vger.kernel.org>; Wed,  8 Mar 2023 10:57:01 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id u9so69825927edd.2
        for <linux-leds@vger.kernel.org>; Wed, 08 Mar 2023 10:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678301820;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UN4FXZh9obV93C6xCot0TbkN0Vab2XDWkrefnJoiU4=;
        b=OsBg3IELTXJR9KbMHD+CW92mtVS2p3Iw8D2yJuwccrL+uvO0CzxhEa4I28viBDi/kB
         OCcRF2pYOJA6VGy13SjHzZC/eZ/3mkXZDveXIyPZnCmcwRADFE5hhBOWSQZn/vDBgQCx
         DGyVPpY9wDHQ6+wk5oVGfPUTrFJ/E1bx8omhk6s2HmbXAgQffo22EYlL/f2wwiWYW4uk
         ScxtLikIexiL7kyh8j2dJrQ3HAFydWxSqdTsCz05XmdqM0Zq4Rqq/UjM6g6t+jtoZwFB
         8AlA8/qdaHyCkD29RmirjtYXE0IV/iCmEYFmNzhyl1T203S+gE35rxmQ6bgpRf+p5nrB
         GOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678301820;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UN4FXZh9obV93C6xCot0TbkN0Vab2XDWkrefnJoiU4=;
        b=Ml+bizL4zKFuPAqzuScHzWcyeR++4OtbekZf0Fk2CizgbI3U8A0sm5KUe3xSobv7Vx
         D/grHaib7ffHLUysfLSZN/XcUIrTkeO7EgrMMnqY29CX9pSG2MUSgAsfh4S8uyXii858
         ErOXsVvUC9KaLXNzNQdOPWcFybFFfKskGEkHt/jtG1P+hRV7VHLSZTn4HlMmfITIIMzo
         RygKbKO1TOia1HWJ7xK5JF8gs0RE1TjDKM600GRr65Qv4RFiZ7Tg+PLUSX4OyNs0rKyo
         qhCWLd2NWJMNN0bXYhNG94sWpp2/pxMpuHFjuzJkuBUPSdb1Fn2TvvRGY38iHS7WuVj7
         A/4A==
X-Gm-Message-State: AO0yUKX/gcsZM/upgUY1T3QuIsnhzg2Aa5gswLeHjHJRfDdqFu+mx6DA
        Dk2MEIQszS/jzSoOD+UyVKbrnQ==
X-Google-Smtp-Source: AK7set9OaszX5xG/ljtpzabnCZNFiVVjnu96q6Mk5l6tqfbc0Obpl5Z63/ymt/n2yWMdbJtocJWM4A==
X-Received: by 2002:a05:6402:1345:b0:4af:6e95:85ec with SMTP id y5-20020a056402134500b004af6e9585ecmr17161882edw.4.1678301819820;
        Wed, 08 Mar 2023 10:56:59 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id ib21-20020a1709072c7500b008cdb0628991sm7880226ejc.57.2023.03.08.10.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:56:59 -0800 (PST)
Message-ID: <7c6a70d1-fd64-66cc-688b-3e04634066bb@linaro.org>
Date:   Wed, 8 Mar 2023 19:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [net-next PATCH 10/11] dt-bindings: net: phy: Document support
 for LEDs node
Content-Language: en-US
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307170046.28917-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 07/03/2023 18:00, Christian Marangi wrote:
> Document support for LEDs node in phy and add an example for it.
> PHY LED will have to match led pattern and should be treated as a
> generic led.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/net/ethernet-phy.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 1327b81f15a2..0ec8ef6b0d8a 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -197,6 +197,13 @@ properties:
>        PHY's that have configurable TX internal delays. If this property is
>        present then the PHY applies the TX delay.
>  
> +  leds:
> +    type: object

additionalProperties: false

although maybe this was already said in one of previous ten reviews...

> +
> +    patternProperties:
> +      '^led(@[a-f0-9]+)?$':
> +        $ref: /schemas/leds/common.yaml#
> +


Best regards,
Krzysztof

