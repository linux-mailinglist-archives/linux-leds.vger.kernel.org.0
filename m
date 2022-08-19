Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6AB0599575
	for <lists+linux-leds@lfdr.de>; Fri, 19 Aug 2022 08:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345508AbiHSGrD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Aug 2022 02:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242340AbiHSGrB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Aug 2022 02:47:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D146DEB78
        for <linux-leds@vger.kernel.org>; Thu, 18 Aug 2022 23:47:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e15so5000177lfs.0
        for <linux-leds@vger.kernel.org>; Thu, 18 Aug 2022 23:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/S1tz/z9q53akDDlJ2L7xnkzIfj8YPOZ9tcDhYR4k/4=;
        b=x82xYJrLDxRocbayh/Xxsh851wWeeGYo+LY4tkInvGc5+Kgl83/M4IAggvo8T8GARM
         7kCVIb0AOrjskGgt7xoAd4t4Ih2H4qy7rkZP4Cs0e7CJ8HoUf5hi024IuUllwzd5cNQN
         lvNbpDyxWMxhfKB2k2PnTGdYS0y/Cjsu4jRUbyqBYx8hvIlluCwOOzy6Kp2L+BE0L7qC
         BGvQq/TwYO24/vbUgVANnrXrQBA3PDc1Oy9ZWxlEfQZTMFY30Gk67Up1lbe2S+E9Bpql
         JXtUeEIPyFVaO9NJqsGZbvMDCZF07dgBUBlb8lmV4MwBEheyGwdmL+0CiHuTPJ51xadB
         aLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/S1tz/z9q53akDDlJ2L7xnkzIfj8YPOZ9tcDhYR4k/4=;
        b=D8tW8YfPdffCOk0KPQ6Eem/QImQhBdxBkFxVKMYQkoRl9/qdktqHO5/S4UvhDFi/Hn
         o2CEAGn1lXebO6hQCBWKnavVz/+WCSEGq8GhN9DVxvBuIkmaUJjReDVFbwE0jYodq5J6
         6/SVfjHgoWhaE10lVhLY1bhB4k2jhvw2Rg04mQfTZINjRcw1piJh+9siIpzvtgawwY2L
         kslkdX0v0oqVCK2MnpcMDcw2OXmK4ZQxq2LfHbYJaGUanVhRJeE++nwt+tFXHuDvoQ6R
         ragDGtbzJpIfVH6b/2yS/0RZ1HGR6BD4gGCx9O8QjuieAdZRt8KImzo5VYxj5wUZajIE
         JgZA==
X-Gm-Message-State: ACgBeo3WVknaAhjiVNt7v5nfFDCRaymX0DnQZHEwvduSKvvvEgDPZIoG
        C2a5FU4iPKN0dk7Ti+e+ZCMMIw==
X-Google-Smtp-Source: AA6agR4iC/0eCh1N8uUFS7LEyixMg5FbqCCSo3m9sA5x/UDVRytbgt+vF9lnh6F+UUPPj1+SwP1zug==
X-Received: by 2002:ac2:4da2:0:b0:492:c6a9:f430 with SMTP id h2-20020ac24da2000000b00492c6a9f430mr843801lfe.96.1660891618428;
        Thu, 18 Aug 2022 23:46:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id u21-20020a2eb815000000b00261bf4e9f90sm61296ljo.66.2022.08.18.23.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 23:46:57 -0700 (PDT)
Message-ID: <f635d5a7-6817-cd62-e395-63e346775716@linaro.org>
Date:   Fri, 19 Aug 2022 09:46:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: register-bit-led: Add active-low
 property
Content-Language: en-US
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220818172528.23062-1-pali@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220818172528.23062-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 18/08/2022 20:25, Pali Rohár wrote:
> Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
> active-low property.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> index 79b8fc0f9d23..5c6ef26f1a94 100644
> --- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> +++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> @@ -43,6 +43,11 @@ properties:
>          0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
>          0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
>  
> +  active-low:
> +    $ref: /schemas/types.yaml#/definitions/flag

This could be shorter: type: boolean

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Although the question is - where is the user of it?

Best regards,
Krzysztof
