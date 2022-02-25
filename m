Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2602A4C4E0B
	for <lists+linux-leds@lfdr.de>; Fri, 25 Feb 2022 19:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbiBYSuP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Feb 2022 13:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbiBYSuP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Feb 2022 13:50:15 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DA5186465;
        Fri, 25 Feb 2022 10:49:43 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id j9-20020a9d7d89000000b005ad5525ba09so4222263otn.10;
        Fri, 25 Feb 2022 10:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ymeJM2XC5bfjFWNFN4yX0z9m9pRlVaUM6hK6fKN0z3I=;
        b=2ikx2a2tBLrJHwg3ZekkcW6lw/Cg8/8Thfp25YkYjiqfmVdibTEfOH8uYTTLYObM5v
         HmweWl9fXU8qTyobB5M6Hk7QeBsnECaBqRR2PXnRMxlVy/DnMTivkSw2fyo1YGdd/DBW
         Y1e22Jwe5effZ6DPxVZA87PrJ4rsyjnQmQ7M0aeocht4+DxAyS2ralumlsbHohwoRXlJ
         aRtdsZekBKAT18rdzY0axZkVgMLQ8DER0/7xIyZ4Mr4Cpq2NO3l6Ibqppaqq7ifKllDO
         o8uiIzaIQuaK6VsQJLB8pfA6Bk9DTV5Z4qL6eTvN2g5AiMFhYb47wWVDcy5XNp2jGS6z
         Se0w==
X-Gm-Message-State: AOAM530UNWlKY7j1xV7O+IK65jRar9dGTp10iGIWlpifAiO3gtOfh5gr
        /MCzc90VeuIGwq9krUvCqg==
X-Google-Smtp-Source: ABdhPJwhFsIUjX83I0my+AR7Qu1yGkCHFwYZJP9J70a4wvkljvrpuzS1a7L5en0MEYNxJ+JtYgcRAA==
X-Received: by 2002:a9d:462:0:b0:5af:9183:44bd with SMTP id 89-20020a9d0462000000b005af918344bdmr3456836otc.21.1645814982425;
        Fri, 25 Feb 2022 10:49:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id u3-20020a056808114300b002d51f9b3263sm1784986oiu.28.2022.02.25.10.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 10:49:41 -0800 (PST)
Received: (nullmailer pid 1235987 invoked by uid 1000);
        Fri, 25 Feb 2022 18:49:41 -0000
Date:   Fri, 25 Feb 2022 12:49:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Antonio Ospite <ao2@ao2.it>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add regulator-led binding
Message-ID: <YhkkxVla5Qkua4aZ@robh.at.kernel.org>
References: <20220219235607.1613686-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220219235607.1613686-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Feb 2022 00:56:05 +0100, Linus Walleij wrote:
> The regulator is a LED connected directly to a regulator and with
> its brightness controlled by the voltage of the regulator.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Antonio Ospite <ao2@ao2.it>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/leds/regulator-led.yaml          | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/regulator-led.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
