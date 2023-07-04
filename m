Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D5874798D
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jul 2023 23:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjGDV0Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jul 2023 17:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjGDV0Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jul 2023 17:26:24 -0400
X-Greylist: delayed 2524 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Jul 2023 14:26:23 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C8418B
        for <linux-leds@vger.kernel.org>; Tue,  4 Jul 2023 14:26:23 -0700 (PDT)
Received: from p5dcc3447.dip0.t-ipconnect.de ([93.204.52.71] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qGmsf-0015de-EP; Tue, 04 Jul 2023 22:44:13 +0200
Date:   Tue, 4 Jul 2023 22:44:11 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] [RFC] dt-bindings: leds: bd2606mvv: Fix maximum
 register value
Message-ID: <20230704224411.17dbbf7c@aktux>
In-Reply-To: <20230704202929.91962-1-marex@denx.de>
References: <20230704202929.91962-1-marex@denx.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

you are right.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

On Tue,  4 Jul 2023 22:29:29 +0200
Marek Vasut <marex@denx.de> wrote:

> Since the chip can drive up to 6 lines, the maximum
> register number should be only 5, not 6.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
> index 14700a2e5feaa..44dd91aa239de 100644
> --- a/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
> +++ b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
> @@ -35,7 +35,7 @@ properties:
>      description: GPIO pin to enable/disable the device.
>  
>  patternProperties:
> -  "^led@[0-6]$":
> +  "^led@[0-5]$":
>      type: object
>      $ref: common.yaml#
>      unevaluatedProperties: false
> @@ -43,7 +43,7 @@ patternProperties:
>      properties:
>        reg:
>          minimum: 0
> -        maximum: 6
> +        maximum: 5
>  
>      required:
>        - reg

