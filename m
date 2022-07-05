Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2179F5669C3
	for <lists+linux-leds@lfdr.de>; Tue,  5 Jul 2022 13:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiGELhC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Jul 2022 07:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbiGELhB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Jul 2022 07:37:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730E413F07
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 04:36:57 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t24so20077384lfr.4
        for <linux-leds@vger.kernel.org>; Tue, 05 Jul 2022 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s4xBLX4D+2rGFZnRL3/xBMbxJWhnuurE0gET2pyWFpc=;
        b=xwMgG0Elx+0z6hUMZOqJumHSGc8Z7bdt5YrT0kkfd8pWb1DpoCR1nJtFjOEBic+ewE
         IJMp7clkfdfGk2MMstolABV4vS7prcg+quhV85bHccxIdetaI4I4VOlkq5TliGIuZEOD
         eAUEmTy2sDkJ9en+xdMRp/FzlX/bQHTLldF8aUPbNiK2ci+1bq5+0Elol8wmAUo2xeSo
         RFPdmCatsz6OoVGSIuZ/fnas+EqYiYu7yGfCRAJoSbdWSopOSzRqdy2vlgEFmWI4e51o
         0Y3eDqIS7Xcd1oK3VTofAtmJwHJDeY0o2/7oO2OIHLqDMeCDzRIccHkG51oaKQ32jETd
         0Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s4xBLX4D+2rGFZnRL3/xBMbxJWhnuurE0gET2pyWFpc=;
        b=fQod7ieYPzckGvrc/26wjBvThQmxN1YUtfptWa4gQ6OWTheiLhW95jafz4WE6lku3q
         6n7G6kq9oroScJub3bsWDduw9/g2iXpaz2PN/Smj9DmGduqoxvt+/swAoleJroWvpVPn
         CnDzf2JlbmYzWrqSKcn1XKgfcw0rRPsv+5GDylLZu3cdPwA6NvEyxNYPh4/Ds0gE7/Hd
         0Qt25Su2fVQkdlU1P26juimOa6TBoLKiHTL/2xzNQpZnGk7S/HRIqpxu6ummnYbxVU88
         5/r7I02gq4LXuJRWSwzBOOp3Og9n9oixUruNziBkRsnsROobQdWhfuUbhkFrY1T8XlzL
         7Gyg==
X-Gm-Message-State: AJIora8oDZgj6QB4sc+8IvplLtQr934mskFvPtxAa2nrnQDKLBMFcB1m
        mQ1heN2e66p2+XN5r/Ktb47mPA==
X-Google-Smtp-Source: AGRyM1s4BDT7q4/VSwU/FvQHJCxoAD9kWwnwR9c0pky0GFAGkUx6uCT9NMXt/3abYgiOoJwD0qpydQ==
X-Received: by 2002:a05:6512:3e0e:b0:484:88a0:2b24 with SMTP id i14-20020a0565123e0e00b0048488a02b24mr527926lfv.268.1657021015833;
        Tue, 05 Jul 2022 04:36:55 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b0047f8d7c08e4sm5656453lfv.166.2022.07.05.04.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:36:55 -0700 (PDT)
Message-ID: <42d837dd-fbd1-6294-2fa0-8a07ae0f8d44@linaro.org>
Date:   Tue, 5 Jul 2022 13:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add cznic,turris1x-leds.yaml
 binding
Content-Language: en-US
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705000448.14337-1-pali@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705000448.14337-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/07/2022 02:04, Pali Rohár wrote:
> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  .../bindings/leds/cznic,turris1x-leds.yaml    | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> new file mode 100644
> index 000000000000..fd09613c8d2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris1x-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris 1.x LEDs driver
> +
> +maintainers:
> +  - Pali Rohár <pali@kernel.org>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the front panel of the
> +  Turris 1.x routers. There are 8 RGB LEDs that are controlled by CZ.NIC CPLD
> +  firmware running on Lattice FPGA. Firmware is open source and available at
> +  https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> +
> +properties:
> +  compatible:
> +    const: cznic,turris1x-leds
> +
> +  reg:
> +    maxItems: 2

You need to describe the items, if it is really two items. However your
example has only one item, so this was not tested and won't work.

You'll get warning from Rob's robot soon... but you should test the
bindings instead.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^multi-led@[0-7]$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#

This looks incorrect, unless you rebased on my patchset?

> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +    required:
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

No blank line.

> +    #include <dt-bindings/leds/common.h>
> +
> +    cpld@3,0 {

Generic node name.

> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        led-controller@13 {
> +            compatible = "cznic,turris1x-leds";
> +            reg = <0x13 0x1d>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +


Best regards,
Krzysztof
