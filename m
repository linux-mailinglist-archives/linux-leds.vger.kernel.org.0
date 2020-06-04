Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370EA1EEDDC
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2020 00:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgFDWka (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 18:40:30 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:46814 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgFDWk3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 18:40:29 -0400
Received: by mail-il1-f194.google.com with SMTP id h3so7678882ilh.13;
        Thu, 04 Jun 2020 15:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QSWJtBAUksQhYjVR4MqtPJiG9vZ0QWl17k304282+yo=;
        b=nOMuXFccSwTQbDtjhyHRtBosOpzmpFrlcodz/o8tmbmvEWMD0GAmUNnI9zqfSKZxZQ
         GvCet3wJPlQpe14Se+tYZhI8BQ54uSijNf2qMHynHUBlDZibin05A8QEr2R+hoOemST6
         +yiWyN72x4YlE4Pue61g/PBimwoABudL6IiXUPfPgvUF/VLl+gMKD60yCo3j+Pl/24K+
         RJwRaIwrC0D/N4uk1TAnimPJDMCv8+CGMLLuuaGnhiXr4Q1+JGA58h4ZPRoxYl5gVd8v
         2fU2ANiyBCV0n/8oE20FrjhR6XyG8C2Np71pmr7E6EouvW2t5gOZqtkIYDNzM1xjGpLv
         no5g==
X-Gm-Message-State: AOAM531sHEyS8ChPgfCnw+//J/JfK3dwFW9t+aZ6bNUEAlzVWJvvophe
        XZ1hWTXqmU6ReXXvWxXr5A==
X-Google-Smtp-Source: ABdhPJxSU/8J1NfPj12uv47E8987Ap2yupPj3T/Vh7G4ZPwcM0DtSmCtJunelRjPYxjuO0JY+H/r7A==
X-Received: by 2002:a05:6e02:4a7:: with SMTP id e7mr6028078ils.180.1591310428449;
        Thu, 04 Jun 2020 15:40:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id p15sm2014072ilj.15.2020.06.04.15.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 15:40:27 -0700 (PDT)
Received: (nullmailer pid 4174434 invoked by uid 1000);
        Thu, 04 Jun 2020 22:40:26 -0000
Date:   Thu, 4 Jun 2020 16:40:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v26 01/15] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200604224026.GA4153787@bogus>
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604120504.32425-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 04, 2020 at 07:04:50AM -0500, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
> 
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.yaml  | 39 +++++++++++++++++++
>  include/dt-bindings/leds/common.h             |  3 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> new file mode 100644
> index 000000000000..6cab2a1405e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for the multicolor LED class.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  Bindings for multi color LEDs show how to describe current outputs of
> +  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
> +  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
> +  modules. This is achieved by adding multi-led nodes layer to the
> +  monochrome LED bindings.
> +  The nodes and properties defined in this document are unique to the multicolor
> +  LED class.  Common LED nodes and properties are inherited from the common.txt
> +  within this documentation directory.
> +
> +patternProperties:
> +  "^multi-led@([0-9a-f])$":
> +    type: object
> +    description: Represents the LEDs that are to be grouped.
> +    properties:
> +      #allOf:
> +        #- $ref: "common.yaml#"

Why is this commented out? Other than it is wrong. Uncommented, this 
would be defining a DT property called 'allOf'.

You can drop 'allOf' now. '$ref' should be at the level of 'properties'.

> +
> +      color:
> +        $ref: /schemas/types.yaml#definitions/uint32

common.yaml already defines the type, so drop this.

> +        const: 8  # LED_COLOR_ID_MULTI
> +        description: |
> +          For multicolor LED support this property should be defined as
> +          LED_COLOR_ID_MULTI which can be found in include/linux/leds/common.h.
> +
> +    required:
> +      - color
> +...
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 0ce7dfc00dcb..a463ce6a8794 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,7 +30,8 @@
>  #define LED_COLOR_ID_VIOLET	5
>  #define LED_COLOR_ID_YELLOW	6
>  #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MAX	8
> +#define LED_COLOR_ID_MULTI	8
> +#define LED_COLOR_ID_MAX	9
>  
>  /* Standard LED functions */
>  /* Keyboard LEDs, usually it would be input4::capslock etc. */
> -- 
> 2.26.2
> 
