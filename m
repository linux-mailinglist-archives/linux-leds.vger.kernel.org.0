Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943582694A7
	for <lists+linux-leds@lfdr.de>; Mon, 14 Sep 2020 20:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgINSUQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Sep 2020 14:20:16 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33216 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgINSUN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Sep 2020 14:20:13 -0400
Received: by mail-il1-f195.google.com with SMTP id x2so531230ilm.0;
        Mon, 14 Sep 2020 11:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fdtDbq+D2wXO2AxeziDQlx8lKWQCn+eKp58GeSBc8HI=;
        b=Ftl6V+Cq0t6FXqm5i0EIFs+5gdCQGXTrQawphpIBkzNemEOpp0efTfyyTU0YFN73Dd
         fyWadD8cD1vKQ6jkbJTOStMFJwa87YJznkx9/NaoEbkfByYPpZlrYmI2nz02982bJUjL
         H+fBOQAddAT92doesxaJf5VJ8731JLCC1LP0M0MARCkDTX43mR+2YnAvnH8lf2zbBxkX
         uIwXNPreNiCXCNGwI/1lJ+bhKYfigUVMgVCM0ANiHxYM2WFrraW9I3FPYkcozlpGZqnp
         IkymxpYsNpwwRFZLyETlDN2KBy7epBfmj85mqTCYrXesyTWNU+Yqf+1IDEbWjIuE5LwV
         XEcw==
X-Gm-Message-State: AOAM530qyPwW8tx0ZWVM2JaDp7SP9fya31fE8bXnEJTfetJeI8Hz0JRf
        F+uSVj0WZRNdlgM8FOmxlq+Vi2PZjwt0
X-Google-Smtp-Source: ABdhPJyaLnrvBR1GirLP6z7PnAvaEZSPl/7FkU07rnTPTggjjrfaUZoZ9Dtaxv533+HXIQmc4RkcFg==
X-Received: by 2002:a92:7984:: with SMTP id u126mr13816635ilc.139.1600107611878;
        Mon, 14 Sep 2020 11:20:11 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v20sm7265643ile.42.2020.09.14.11.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 11:20:11 -0700 (PDT)
Received: (nullmailer pid 4178218 invoked by uid 1000);
        Mon, 14 Sep 2020 18:20:10 -0000
Date:   Mon, 14 Sep 2020 12:20:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: common: Add mmc0 as default trigger
Message-ID: <20200914182010.GA4172388@bogus>
References: <20200830111115.32623-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830111115.32623-1-krzk@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Aug 30, 2020 at 01:11:15PM +0200, Krzysztof Kozlowski wrote:
> MMC could be a default trigger so add a pattern to match it and fix
> dtbs_check warnings like:
> 
>   arch/arm/boot/dts/exynos4412-odroidx.dt.yaml: leds: led2:linux,default-trigger:0:
>     'mmc0' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'ide-disk', 'timer', 'pattern']
>     From schema: Documentation/devicetree/bindings/leds/leds-gpio.yaml

The preference is to move from 'linux,default-trigger' to 'function' 
with some standardization of the names or use the trigger-source binding.

> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/leds/common.yaml      | 39 ++++++++++---------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index a2a541bca73c..6b38f9f3792c 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -78,25 +78,26 @@ properties:
>        This parameter, if present, is a string defining the trigger assigned to
>        the LED.
>      $ref: /schemas/types.yaml#definitions/string
> -
> -    enum:
> -        # LED will act as a back-light, controlled by the framebuffer system
> -      - backlight
> -        # LED will turn on (but for leds-gpio see "default-state" property in
> -        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> -      - default-on
> -        # LED "double" flashes at a load average based rate
> -      - heartbeat
> -        # LED indicates disk activity
> -      - disk-activity
> -        # LED indicates IDE disk activity (deprecated), in new implementations
> -        # use "disk-activity"
> -      - ide-disk
> -        # LED flashes at a fixed, configurable rate
> -      - timer
> -        # LED alters the brightness for the specified duration with one software
> -        # timer (requires "led-pattern" property)
> -      - pattern
> +    oneOf:
> +      - enum:
> +            # LED will act as a back-light, controlled by the framebuffer system
> +          - backlight
> +            # LED will turn on (but for leds-gpio see "default-state" property in
> +            # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> +          - default-on
> +            # LED "double" flashes at a load average based rate
> +          - heartbeat
> +            # LED indicates disk activity
> +          - disk-activity
> +            # LED indicates IDE disk activity (deprecated), in new implementations
> +            # use "disk-activity"
> +          - ide-disk
> +            # LED flashes at a fixed, configurable rate
> +          - timer
> +            # LED alters the brightness for the specified duration with one software
> +            # timer (requires "led-pattern" property)
> +          - pattern
> +      - pattern: "^mmc[0-9]+$"
>  
>    led-pattern:
>      description: |
> -- 
> 2.17.1
> 
