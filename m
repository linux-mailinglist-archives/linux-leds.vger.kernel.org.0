Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB84E6B1184
	for <lists+linux-leds@lfdr.de>; Wed,  8 Mar 2023 19:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCHS6L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Mar 2023 13:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjCHS6K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2023 13:58:10 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B8A166D1
        for <linux-leds@vger.kernel.org>; Wed,  8 Mar 2023 10:58:06 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id cy23so69600754edb.12
        for <linux-leds@vger.kernel.org>; Wed, 08 Mar 2023 10:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678301885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjhOsVfiyNLdiao1kPFsg+9j/7bz4wzepqhRLi9Q0p0=;
        b=JixZz2o9jCnZxRfhzhe9jSyaWHodzSAgGirRRUvI9WcumT+qoONUSij2R20sp0DB5k
         eEJ+c8rfCX8I4cp6tRZc1+OqoDItWv7tJCq7ePq84zPz4DY1BAi0G1PVylr0lNDEIu4v
         3BE7oeHas2vdMWckdEgzjMZ6ZbSsU3msCys+OmL6PeaF9DeoF89+dc2W66TESWWmV7KD
         MRP3LaiGvmveQXzItHQP0j+Lqekqps1epwpm6bFJbRzWWYKr+4c0SEZMrEIevFUlOz/q
         aqZcLR+FqiCG5CO3qz945daItgxPA7rnwM3kSQkMQO95dOkYx761tiVfgIxCbGeChu0k
         3oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678301885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjhOsVfiyNLdiao1kPFsg+9j/7bz4wzepqhRLi9Q0p0=;
        b=15c0ju2ZbuPGmv/pZZSoQvrkpkjcB/tA7pfYbmCAJBAikgEOD1J5KGyVlfVfMEDlJ2
         OvZZlKi7kgFGw14KDVpT57KhOQmCvVPW1eoWSMKOGPg9TjtMC18Y0+joUMbTobyfCNPJ
         57x/c8528cRnZs2nr7sRvHDMZ2C5qdLrM6bPuw8WSVBeaJ/eWSTHftY2nb5UUVK1rC0Q
         ChCPeiwA70apSRP3yRe8tk3B5Uqjt9CUbR+3ri1zJfFdtayj2W+qW4f9nsTcV4gOVwZW
         loCtarmdGlrifnjuNGEt4OIw7YEn/xnzakADe3bWAUXg/gZjxm8h1Zgjb3dHfuzSb1Qy
         7hww==
X-Gm-Message-State: AO0yUKUGYYZAEao0mA6B02IX/76qtYg7sNaaR1M846QAb55d7fA0XIKt
        LYpl4sVSYdooDUJmdS6ZfVVCeg==
X-Google-Smtp-Source: AK7set/tykiuID/1hJkfbPfMuq44TKE9pWAiJpzhDDc+xw63fHcFFzuSpkJJ9AusvAI+VFc50pkFJw==
X-Received: by 2002:a17:906:5656:b0:8dd:76b6:7b14 with SMTP id v22-20020a170906565600b008dd76b67b14mr21849540ejr.14.1678301884919;
        Wed, 08 Mar 2023 10:58:04 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id m22-20020a1709066d1600b00908ecda035csm7971355ejr.146.2023.03.08.10.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:58:04 -0800 (PST)
Message-ID: <f78bb236-bfa3-3d02-092e-3f6529354d5a@linaro.org>
Date:   Wed, 8 Mar 2023 19:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [net-next PATCH 08/11] dt-bindings: net: dsa: dsa-port: Document
 support for LEDs node
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
 <20230307170046.28917-9-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307170046.28917-9-ansuelsmth@gmail.com>
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
> Document support for LEDs node in dsa port.
> Switch may support different LEDs that can be configured for different
> operation like blinking on traffic event or port link.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa-port.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> index 480120469953..f813e1f64f75 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> @@ -59,6 +59,13 @@ properties:
>        - rtl8_4t
>        - seville
>  
> +  leds:
> +    type: object

additionalProperties: false

Best regards,
Krzysztof

