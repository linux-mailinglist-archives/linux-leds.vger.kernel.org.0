Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825BA6A63FD
	for <lists+linux-leds@lfdr.de>; Wed,  1 Mar 2023 01:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjCAACk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Feb 2023 19:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjCAACj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2023 19:02:39 -0500
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A27536FF2;
        Tue, 28 Feb 2023 16:02:38 -0800 (PST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17264e9b575so12705743fac.9;
        Tue, 28 Feb 2023 16:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LrHJrbRH1ZnmqhUPgdT0HnQe/QreBSYJWP3vf1c4pI=;
        b=rGp8LmxxZAGBU2cx4vBygP1QkZul+mjwlOOAwn7obv8MJ0C8IX58RH0+TXvJGXd0Wg
         ItGetiSAQbCtD55vbHfV9UC1LtMq+ErmQW3F3c6K25Z4/6AkGRc0NNxc3S2OiZuqRPQ9
         jFt8gB2TOw3f9ATlO9/jcWAl1Yh3oUKG5CVUcJS3gdxkpz9yGOv+lrVyLouokdlS/fY2
         88pG3UqCFsTRdq3Vd/PCFaKt3YcaiChYsI1SNuN0I+91vAQDxgbl8McXo60XLZe76d24
         4KtKgomEWyHUR+hEhCP4pU0VroHODgujKQhp4Ln4zuIxW3ypBoKMilnQke6uCO950ZsM
         8D8Q==
X-Gm-Message-State: AO0yUKU/15GmUn9+jFmkuKqGkBs3sAk0Z5EZRgzk3EmSgfrwz9umOI0B
        TXW5CpY1ftEGwm6TZdDQJOpuvInBUA==
X-Google-Smtp-Source: AK7set/DS1Nr7SEeXCLeYi/ahYXGBwCTF6UIwAiywdS/wuOuNp11VtEPd5bWn1Qa5mZoWj2KZ5RbxA==
X-Received: by 2002:a05:6871:b0c:b0:172:56b5:d172 with SMTP id fq12-20020a0568710b0c00b0017256b5d172mr2923394oab.4.1677628957894;
        Tue, 28 Feb 2023 16:02:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d9-20020a9d51c9000000b006941ecefc34sm886982oth.18.2023.02.28.16.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:02:37 -0800 (PST)
Received: (nullmailer pid 28222 invoked by uid 1000);
        Wed, 01 Mar 2023 00:02:36 -0000
Date:   Tue, 28 Feb 2023 18:02:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: leds: add "usbport" trigger
Message-ID: <20230301000236.GA20893-robh@kernel.org>
References: <20230228144933.22614-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228144933.22614-1-zajec5@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Feb 28, 2023 at 03:49:33PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a trigger used on many home routers that have LEDs to indicate
> specific USB port state.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index 15e3f6645682..95b316ee3146 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -99,6 +99,7 @@ properties:
>            - pattern
>            - usb-gadget
>            - usb-host
> +          - usbport

Can we stop adding entries which are clearly likely to have multiple 
instances. We have a better binding to map the trigger source...

>        - pattern: "^cpu[0-9]*$"
>        - pattern: "^hci[0-9]+-power$"
>          # LED is triggered by Bluetooth activity
> -- 
> 2.34.1
> 
