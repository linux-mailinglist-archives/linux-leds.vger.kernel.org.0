Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B68D74A42E
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jul 2023 21:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjGFTG2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Jul 2023 15:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbjGFTG0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Jul 2023 15:06:26 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02F41FCC;
        Thu,  6 Jul 2023 12:06:24 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7835ae70e46so37955939f.3;
        Thu, 06 Jul 2023 12:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688670384; x=1691262384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TeOxhu7loKe1C7HyC68W1Lmyeli9G+BRUShO9fGMPE=;
        b=SMbUmp/PaYTRRZZryKSQ1SfcSNvZEWaj9kL1NJ5heoJnOsvUoPihHpSg0XjOgrjbA8
         5EUVqLQD4Je3NVncEUv53RbP8+zt6lsK/Lg2EyDxBNC5qHUym1x9GjhHr4dvuAT20VPH
         SH+8YSpC2a7VvSTjotS2XZTFQLHGq3dX9yp3IbRxifZqyuphSedNpxY7bZHIR9kynJRg
         fF+ZYYv9T9C53wissv1NM7yzHngHpPjmF5ZUrWKq++RGxe0Yq9MTRoI5v67DlovJ8URQ
         4eyaESf4w46C0FvR/XhwDBjzJNMElfjQqUrTq//RAMDl5P76fPr1rWZ6ZAcb4TvLr5+t
         qxOg==
X-Gm-Message-State: ABy/qLYBvLHUCXTbRZC2abakXqXiBmM81anUWTiO7/9qG8yvB/Aa6z3J
        E5olJeevrePUZDzBW9cRBw==
X-Google-Smtp-Source: APBJJlHLwIbbooHeQcFPtwuN1zJaaF3C0Zx6KNMR/lvol3oa9asSOhyjbiacrcSMvF4EMC2UVmeELw==
X-Received: by 2002:a6b:6313:0:b0:783:4f8d:4484 with SMTP id p19-20020a6b6313000000b007834f8d4484mr3276988iog.2.1688670383836;
        Thu, 06 Jul 2023 12:06:23 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p5-20020a0566380e8500b0042b3bf0baacsm699928jas.138.2023.07.06.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:06:23 -0700 (PDT)
Received: (nullmailer pid 160546 invoked by uid 1000);
        Thu, 06 Jul 2023 19:06:21 -0000
Date:   Thu, 6 Jul 2023 13:06:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: pca995x: Add binding document
 for PCA995X chips
Message-ID: <168867038074.160479.18106487146121275552.robh@kernel.org>
References: <20230705231326.232356-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705231326.232356-1-marex@denx.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On Thu, 06 Jul 2023 01:13:25 +0200, Marek Vasut wrote:
> The PCA995x chips are I2C controlled LED drivers. Each chip has
> up to 16 outputs, each one with an individual 8-bit resolution
> PWM for brightness control. Add binding document.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
> V2: Fix the led@[0-9]+ match
> V3: Unit addresses for leds@ are hex, add a-f into the glob
> ---
>  .../devicetree/bindings/leds/nxp,pca995x.yaml | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

