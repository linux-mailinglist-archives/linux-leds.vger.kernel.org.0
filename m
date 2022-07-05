Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220A7566A55
	for <lists+linux-leds@lfdr.de>; Tue,  5 Jul 2022 13:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbiGELyX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Jul 2022 07:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232972AbiGELxE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Jul 2022 07:53:04 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFCC17A83
        for <linux-leds@vger.kernel.org>; Tue,  5 Jul 2022 04:53:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c15so14245640ljr.0
        for <linux-leds@vger.kernel.org>; Tue, 05 Jul 2022 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IbfaXjeOYPk8qrQ6FvKEJiDPLZqhzWiK2mEmdCgaVvk=;
        b=B4DtRXPpYtc7Jys2RrKIjT7AKP3Cq2mEqDpEzOACwvCZDb77o2+T4h755u44lqfwgP
         v4Li7tF6UwQtWQ0lA//rN/NYdtZNB0dTA+HcwQ3CRgQE5xx+N4nKDoqtN9y6iHkEeup/
         YdkZNnjl5Z58di+2anNCAwRIwoLzrJNvq2Xb0c0Ru6dtLmH1QR2udERachuAu2MOXTJl
         KWkvYf5EB+mX0k7axZ4FUwhcvlTAPffn3D72r33YlkHi/1SgzMQdEXVcmmYyOBtag99J
         IrZirlPmqptkw8Y6vgrSxrtadQffV6EYlUsra222sQhNAGezLdeBVoHJ9FRGhQImzcgg
         ewvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IbfaXjeOYPk8qrQ6FvKEJiDPLZqhzWiK2mEmdCgaVvk=;
        b=z0/IXCAqd3bPPlcUHosqN00QIewYA4JK8cW2Wa6+hn0+rKK+A4h9BPWNA8k+5zDirg
         v/QeIrhDAWAUDDBJv2IQcGc9onLvA5HaG6z63OWzmFp2pQn6L+46/70kynM1WWwOR1FK
         NgvSpCXShUSiKmZA05BxLsocMqnqUyLIz1WKXdb8yp6XskZZjiPH+eMPBqbSl5AMKbUA
         u2khSzoLiHC1OuKI9IZOmUlyCR/ML6sJoViY14AFvDdKI9DU5gglYbYziySZLB9+aCej
         EPIeTLfJtcGcD7cMhVtUiHW7yia6KiD+K+HWJ8GAqd6obeYRMyAf9g8RXcCaNuMPSH6V
         M4UQ==
X-Gm-Message-State: AJIora9s7SjD1wucG2gqMzoyyqmOugSJU9LgV82tiYCb5AZ9QgO8zslX
        CTQmTcA9Oefi3rDDj7APb5Fe5g==
X-Google-Smtp-Source: AGRyM1uPETmr+vhZN8KGx7CQ/BROrtMw0EI5i1L+BOd8h4XD5hhpd2Juf1gemkduB7se6umPE1HwyQ==
X-Received: by 2002:a2e:9547:0:b0:24f:2e31:6078 with SMTP id t7-20020a2e9547000000b0024f2e316078mr18478545ljh.102.1657021981247;
        Tue, 05 Jul 2022 04:53:01 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id 9-20020a2e0509000000b0025538905298sm5487757ljf.123.2022.07.05.04.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:53:00 -0700 (PDT)
Message-ID: <29d1f7a3-e141-270c-9e71-e052fd41dd48@linaro.org>
Date:   Tue, 5 Jul 2022 13:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: leds: class-multicolor: reference class
 directly in multi-led node
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ChiaEn Wu <peterwu.pub@gmail.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
References: <20220624112106.111351-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624112106.111351-1-krzysztof.kozlowski@linaro.org>
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

On 24/06/2022 13:21, Krzysztof Kozlowski wrote:
> The leds/common.yaml is referenced directly in each LED node, which
> leads to people doing the same with leds/leds-class-multicolor.yaml.
> This is not correct because leds-class-multicolor.yaml defined multi-led
> property and its children.  Some schemas implemented this incorrect.
> 
> Rework this to match same behavior common.yaml, so expect the multi-led
> node to reference the leds-class-multicolor.yaml.  Fixing allows to add
> unevaluatedProperties:false.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This will conflict with any new users of leds-class-multicolor, e.g.:
> https://lore.kernel.org/all/20220623115631.22209-4-peterwu.pub@gmail.com/
> 
> The new users should be updated to match the usage introduced here.

Pavel,

Any comments from your side? It's waiting for a bit and folks are
sending more and more wrong multicolor bindings...

Best regards,
Krzysztof
