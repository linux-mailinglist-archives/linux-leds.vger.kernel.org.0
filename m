Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7AF2DA37D
	for <lists+linux-leds@lfdr.de>; Mon, 14 Dec 2020 23:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502102AbgLNWhK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Dec 2020 17:37:10 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39868 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441166AbgLNWhE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Dec 2020 17:37:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id d8so17458471otq.6;
        Mon, 14 Dec 2020 14:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=muRKuV6p86ck6Xh8iJfHfvWMBV8uDpANRpY7OayqqoY=;
        b=NnWqV7pGuSUIvi4oDYNEPVuR9RV4/q3zTye4hhykcUv6RNPWxbM9dN4SozG18M/yQZ
         VMkIIX0TmN+F0smdcXf0q1YHjgVQ3UtGM15EllhTK0RmfnWMqaxUTkNI9yZBOGg0KmRW
         K/PKyJ2pgaZuNqdJhlVdK3h6N0PO4GIPL9ihEhI29d7h8CTwTaUPXFm29XQlRHLJ54D7
         54IUww/axtQ+/9q/1gemgXX1KpnERj8X7digEFx8uwu53Tv5Gw1hTnHgMlReEm3+BbqS
         dUa2cgTmSRJMPTyZFqV5gxxX8DiKs8YZXtM29XZkhQVJXTODwv4Z6ZkTfExF0tVl8LIT
         Lc2g==
X-Gm-Message-State: AOAM532RzR9b7IdfzFxctTImJWYimvqD5J92Sj3CkW+/u4QY4+oHTU9O
        lJM7JX6a8JgO6Uh2ls2ciA==
X-Google-Smtp-Source: ABdhPJyhS6m8TRT1cXi677SphG9iioyteB4JQ+m46tBfZpNxy4D7/3LPFPEzKarrgDjh4d0erS/9UA==
X-Received: by 2002:a9d:4e87:: with SMTP id v7mr11804853otk.302.1607985383468;
        Mon, 14 Dec 2020 14:36:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o49sm4649683ota.51.2020.12.14.14.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:36:22 -0800 (PST)
Received: (nullmailer pid 2509929 invoked by uid 1000);
        Mon, 14 Dec 2020 22:36:21 -0000
Date:   Mon, 14 Dec 2020 16:36:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, thunder.leizhen@huawei.com
Subject: Re: [PATCH v2] dt-bindings: leds: Document commonly used LED triggers
Message-ID: <20201214223621.GA2493849@robh.at.kernel.org>
References: <20201210082449.30586-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210082449.30586-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Dec 10, 2020 at 01:54:49PM +0530, Manivannan Sadhasivam wrote:
> This commit documents the LED triggers used commonly in the SoCs. Not
> all triggers are documented as some of them are very application specific.
> Most of the triggers documented here are currently used in devicetrees
> of many SoCs.

The idea with recent LED binding changes is to move away from 
'linux,default-trigger' to 'function' and 'trigger-sources' and to have 
some sort of standardized names.

> 
> While at it, let's also sort the triggers in ascending order.

I'm not sure we want that. Probably better to keep related functions 
together.

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Changes in v2:
> 
> * Added more triggers, fixed the regex
> * Sorted triggers in ascending order
> 
>  .../devicetree/bindings/leds/common.yaml      | 78 ++++++++++++++-----
>  1 file changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index f1211e7045f1..3c2e2208c1da 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -79,24 +79,66 @@ properties:
>        the LED.
>      $ref: /schemas/types.yaml#definitions/string
>  
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
> +      - items:
> +          - enum:
> +                # LED indicates mic mute state
> +              - audio-micmute
> +                # LED indicates audio mute state
> +              - audio-mute
> +                # LED will act as a back-light, controlled by the framebuffer system
> +              - backlight
> +                # LED indicates bluetooth power state
> +              - bluetooth-power
> +                # LED indicates activity of all CPUs
> +              - cpu
> +                # LED will turn on (but for leds-gpio see "default-state" property in
> +                # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> +              - default-on
> +                # LED indicates disk activity
> +              - disk-activity
> +                # LED indicates disk read activity
> +              - disk-read
> +                # LED indicates disk write activity
> +              - disk-write
> +                # LED indicates camera flash state
> +              - flash
> +                # LED "double" flashes at a load average based rate
> +              - heartbeat
> +                # LED indicates IDE disk activity (deprecated), in new implementations
> +                # use "disk-activity"
> +              - ide-disk
> +                # LED indicates MTD memory activity
> +              - mtd
> +                # LED indicates NAND memory activity (deprecated),
> +                # in new implementations use "mtd"
> +              - nand-disk
> +                # No trigger assigned to the LED. This is the default mode
> +                # if trigger is absent
> +              - none
> +                # LED alters the brightness for the specified duration with one software
> +                # timer (requires "led-pattern" property)
> +              - pattern
> +                # LED flashes at a fixed, configurable rate
> +              - timer
> +                # LED indicates camera torch state
> +              - torch
> +                # LED indicates USB gadget activity
> +              - usb-gadget
> +                # LED indicates USB host activity
> +              - usb-host
> +      - items:
> +            # LED indicates activity of [N]th CPU
> +          - pattern: "^cpu[0-9]{1,2}$"
> +      - items:
> +            # LED indicates power status of [N]th Bluetooth HCI device
> +          - pattern: "^hci[0-9]{1,2}-power$"
> +      - items:
> +            # LED indicates [N]th MMC storage activity
> +          - pattern: "^mmc[0-9]{1,2}$"
> +      - items:
> +            # LED indicates [N]th WLAN Tx activity
> +          - pattern: "^phy[0-9]{1,2}tx$"
>  
>    led-pattern:
>      description: |
> -- 
> 2.25.1
> 
